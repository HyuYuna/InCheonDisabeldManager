package kr.co.grit.pgm.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import kr.co.grit.common.util.SessionUtil;
import kr.co.grit.pgm.dao.PgmOpStsDAO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.BadSqlGrammarException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("PgmOpStsService")
public class PgmOpStsServiceImpl implements PgmOpStsService {
	
	@Resource(name="PgmOpStsDAO")
	private transient PgmOpStsDAO pgmOpStsDAO;

	@Override
	public List<EgovMap> selectPgmOpStsReg(EgovMap param) throws Exception {
		EgovMap userInfo = (EgovMap) SessionUtil.getRequestAttributes("KSSM.user");
		String sessWffcltyCd = (String)userInfo.get("wffcltyCd");
		param.put("sessWffcltyCd", sessWffcltyCd);
		return pgmOpStsDAO.selectPgmOpStsReg(param);
	}
	
	@Override
	@SuppressWarnings("rawtypes")
	@Transactional(rollbackFor=Exception.class)
	public EgovMap savePgmOpStsReg(HashMap<String, ArrayList<Object>> param) throws Exception {
		int saveCnt = 0;
		EgovMap rtMap = new EgovMap();
		
		try {
			EgovMap userInfo = (EgovMap) SessionUtil.getRequestAttributes("KSSM.user");
			String sessWffcltyCd = (String)userInfo.get("wffcltyCd");
			String sessUserId = (String)userInfo.get("userId");
			//트랜잭션 start
			ArrayList<Object> addList = param.get("add");
			ArrayList<Object> edtList = param.get("edt");
			ArrayList<Object> rmvList = param.get("rmv");
			/*for(EgovMap tmp:addList) {
				System.out.println("===tmp : "+tmp);
			}*/
			
			//입력시 PK 중복 건수 조회
			
			int duplCnt = 0;
			String whereStr = "";
			if(addList.size() > 0) {
				for(int i=0; i<addList.size(); i++) {
					HashMap<String, Object> map = (HashMap<String,Object>)addList.get(i);
					if(i==0){ whereStr += "("; }
					whereStr += " (WFFCLTY_CD='"+sessWffcltyCd+"'";
					whereStr += " AND PROGRAM_CD='"+(String)map.get("programCd")+"'";
					whereStr += " AND YYYYMM='"+(String)map.get("ym")+"')";
					if(i<addList.size()-1){ whereStr += " OR "; }
					if(i==addList.size()-1){ whereStr += " )"; }
				}
				duplCnt = pgmOpStsDAO.selectPgmOpStsDuplCnt(whereStr);
				}
			if(duplCnt > 0) {
				rtMap.put("result", "dupl");
			} else {
				for(int i=0; i<addList.size(); i++) {
					//System.out.println("===addList.get(i) : "+addList.get(i));
					HashMap<String, Object> map = (HashMap<String,Object>)addList.get(i);
					map.put("sessWffcltyCd", sessWffcltyCd);
					map.put("sessUserId", sessUserId);	
					//System.out.println("===map : "+map);
					saveCnt += pgmOpStsDAO.insertPgmOpSts(map);
				}
				for(int i=0; i<edtList.size(); i++) {
					//System.out.println("===addList.get(i) : "+addList.get(i));
					HashMap<String, Object> map = (HashMap<String,Object>)edtList.get(i);
					map.put("sessWffcltyCd", sessWffcltyCd);
					map.put("sessUserId", sessUserId);	
					//System.out.println("===map : "+map);
					saveCnt += pgmOpStsDAO.updatePgmOpSts(map);
				}
				for(int i=0; i<rmvList.size(); i++) {
					//System.out.println("===addList.get(i) : "+addList.get(i));
					HashMap<String, Object> map = (HashMap<String,Object>)rmvList.get(i);
					map.put("sessWffcltyCd", sessWffcltyCd);
					map.put("sessUserId", sessUserId);	
					//System.out.println("===map : "+map);
					saveCnt += pgmOpStsDAO.deletePgmOpSts(map);
				}
				rtMap.put("result", "success");
				rtMap.put("saveCnt", saveCnt);
			}
			//트랜잭션 end
		} catch(BadSqlGrammarException e) {
			e.printStackTrace();
		}
		return rtMap;
	}
	
	@Override
	@SuppressWarnings("rawtypes")
	public List<EgovMap> selectWffcltyListD(EgovMap param) throws Exception {
		return pgmOpStsDAO.selectWffcltyListD(param);
	}
	
	@Override
	public List<EgovMap> selectPgmOpStsSch(EgovMap param) throws Exception {
		
		String linkCd = (String)param.get("linkCd");
		//System.out.println("==linkCd : "+linkCd);
		
		if(linkCd==null || linkCd.equals("")) {  //
			Map userInfo  = (Map) SessionUtil.getRequestAttributes("KSSM.user");
			linkCd = (String)userInfo.get("linkCd");
			param.put("linkCd", linkCd);
		}
		
		return pgmOpStsDAO.selectPgmOpStsSch(param);
	}
	
	@Override
	@SuppressWarnings("rawtypes")
	public List<EgovMap> selectPgmOpStsChart(EgovMap param) throws Exception {
		return pgmOpStsDAO.selectPgmOpStsChart(param);
	}
	
	
}
