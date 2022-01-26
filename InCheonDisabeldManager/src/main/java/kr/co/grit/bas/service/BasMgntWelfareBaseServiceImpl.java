package kr.co.grit.bas.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import kr.co.grit.bas.controller.BasMgntWelfareBaseController;
import kr.co.grit.bas.dao.BasMgntWelfareBaseDAO;
import kr.co.grit.common.dao.CommonMainDAO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.BadSqlGrammarException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 복지시설 기초관리 
 * @author SYW
 */
@Service("BasMgntWelfareBaseService")
public class BasMgntWelfareBaseServiceImpl implements BasMgntWelfareBaseService{

	/**
	 * 로그 선언
	 */
	private static final Logger LOGGER = LoggerFactory.getLogger(BasMgntWelfareBaseController.class);
	
	/**
	 * DAO 선언
	 */
	@Resource(name="BasMgntWelfareBaseDAO")
	private transient BasMgntWelfareBaseDAO basMgntWelBaseDAO;
	
	@Resource(name="commonMainDAO")
	private transient CommonMainDAO commonMainDAO;

	@Override
	public List<EgovMap> selectMgntWelfareBase(final EgovMap param) throws Exception {
		// TODO Auto-generated method stub
		return basMgntWelBaseDAO.selectBasMgntWelfareBaseList(param);
	}

	@Override
	public EgovMap insertMgntWelfareBase(final EgovMap param) throws Exception{
		final EgovMap returnMap = new EgovMap();
		
		final String saveMode = (String)param.get("saveMode");
		final String wffcltyTpFg = (String)param.get("wffcltyTpFg");
		final String fcltyClsfcFg = (String)param.get("fcltyClsfcFg");
		
		try {
			
			
			
			
			if("I".equals(saveMode)){
				basMgntWelBaseDAO.insertMgntWelfareBase(param);
				
			}else if("U".equals(saveMode)){
				
				final String fcltyCode = (String)param.get("fcltyCode");
				
				int count = basMgntWelBaseDAO.wffcltyCount(fcltyCode);
				
				if(count == 1){
					if("1".equals(wffcltyTpFg) || "1".equals(fcltyClsfcFg)){
						basMgntWelBaseDAO.updateWffcltyDetail(param);
					}
				}
				
				basMgntWelBaseDAO.updateMgntWelfareBase(param);
			}
			
			
			returnMap.put("rtnCode", "0");
			returnMap.put("message", "정상적으로 저장 되었습니다");
		} catch(BadSqlGrammarException e) {
			returnMap.put("rtnCode", "-1");
			returnMap.put("message", "저장에 실패하였습니다.");
			LOGGER.info(e.getMessage());
		}
		 
		 return returnMap;
	}
	
	@Override
	public List<EgovMap> selectTypeFacility(final EgovMap param) throws Exception {
		return basMgntWelBaseDAO.selectTypeFacility(param);
	}

	@Override
	public int selectUnqChk(final EgovMap param) throws Exception {
		// TODO Auto-generated method stub
		return basMgntWelBaseDAO.selectUnqChk(param);
	}

	@Override
	public List<EgovMap> searchWffcltyList(final EgovMap param) throws Exception {
		// TODO Auto-generated method stub
		return basMgntWelBaseDAO.searchWffcltyList(param);
	}

	@Override
	public List<EgovMap> searchOgnztList(final EgovMap param) throws Exception {
		// TODO Auto-generated method stub
		return basMgntWelBaseDAO.searchOgnztList(param);
	}

	@Override
	public int searchDetail(final EgovMap param) throws Exception {
		// TODO Auto-generated method stub
		return basMgntWelBaseDAO.countDetail(param);
	}
	
	
	@Override
	@Transactional
	public EgovMap deleteWffclty(EgovMap param) {
		EgovMap returnMap = new EgovMap();
		
		try {
			String wffcltyCd = (String)param.get("wffcltyCd");
			
			int count = basMgntWelBaseDAO.wffcltyCount(wffcltyCd);
			
			if(count == 0){
				basMgntWelBaseDAO.deleteSysAuthMgmt(param);
				commonMainDAO.deleteLogInsert(param);

				returnMap.put("rtnCode", "0");
				returnMap.put("message", "정상적으로 삭제 되었습니다");
			}else{
				returnMap.put("rtnCode", "1");
				returnMap.put("message", "복지시설 정보가 있어 삭제 할 수 없습니다.");
			}
			
			
			
		} catch (BadSqlGrammarException e) {
			returnMap.put("rtnCode", "-1");
			returnMap.put("message", "저장에 실패하였습니다.");
 		    TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}	
		
		return returnMap;
		
	}
	
}
