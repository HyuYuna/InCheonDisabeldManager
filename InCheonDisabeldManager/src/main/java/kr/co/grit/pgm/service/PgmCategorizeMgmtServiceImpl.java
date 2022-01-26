package kr.co.grit.pgm.service;

import java.util.List;

import javax.annotation.Resource;

import kr.co.grit.common.dao.CommonMainDAO;
import kr.co.grit.pgm.dao.PgmCategorizeMgmtDAO;

import org.springframework.jdbc.BadSqlGrammarException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 프로그램분류 관리
 * @author JJS
 */
@Service("PgmCategorizeMgmtService")
public class PgmCategorizeMgmtServiceImpl implements PgmCategorizeMgmtService{
	
	/**
	 * DAO 선언
	 */
	@Resource(name="PgmCategorizeMgmtDAO")
	private transient PgmCategorizeMgmtDAO pgmCatMgmtDAO;
	
	/**
	 * DAO 선언
	 */
	@Resource(name="commonMainDAO")
	private transient CommonMainDAO commonMainDAO;
	
	@Override
	public List<EgovMap> searchLclasList(EgovMap param){
		return pgmCatMgmtDAO.searchLclasList(param);
	}
	
	@Override
	public List<EgovMap> searchMclasList(EgovMap param){
		return pgmCatMgmtDAO.searchMclasList(param);
	}
	
	@Override
	public List<EgovMap> selectClasList(EgovMap param){
		return pgmCatMgmtDAO.selectClasList(param);
	}
	
	@Override
	public List<EgovMap> searchMclaCdList(EgovMap param){
		return pgmCatMgmtDAO.searchMclaCdList(param);
	}
	
	@Override
	public List<EgovMap> searchWffcltyCdList(EgovMap param){
		return pgmCatMgmtDAO.searchWffcltyCdList(param);
	}
	
	@Override
    public EgovMap saveClas(EgovMap param){
		EgovMap returnMap = new EgovMap();
		
		String saveMode = (String)param.get("saveMode");
		String clasFg   = (String)param.get("clasFg");
		
		try {
			
			if("I".equals(saveMode)){
				if("L".equals(clasFg)){
					pgmCatMgmtDAO.insertLclas(param);	
				}else if("M".equals(clasFg)){
					pgmCatMgmtDAO.insertMclas(param);
				}else if("S".equals(clasFg)){
					pgmCatMgmtDAO.insertSclas(param);
				}
				
			}else if("U".equals(saveMode)){
				if("L".equals(clasFg)){
					pgmCatMgmtDAO.updateLclas(param);	
				}else if("M".equals(clasFg)){
					pgmCatMgmtDAO.updateMclas(param);
				}else if("S".equals(clasFg)){
					pgmCatMgmtDAO.updateSclas(param);
				}
			}
			
			returnMap.put("rtnCode", "0");
			returnMap.put("message", "정상적으로 저장 되었습니다");
		} catch (BadSqlGrammarException e) {
			returnMap.put("rtnCode", "-1");
			returnMap.put("message", "저장에 실패하였습니다.");
		}
		 
		 return returnMap;
	}
	
	
	@Override
	@Transactional
	public EgovMap deleteClas(EgovMap param) {
		EgovMap returnMap = new EgovMap();
		
		
		String checkClasCd = (String)param.get("checkClasCd");
		
		try {
			if("1".equals(checkClasCd)){
				int count = pgmCatMgmtDAO.lclasCount(param);
				
				if(count == 0){
					pgmCatMgmtDAO.deletLclas(param);
					commonMainDAO.deleteLogInsert(param);
					returnMap.put("rtnCode", "0");
					returnMap.put("message", "정상적으로 삭제 되었습니다");
				}else{
					returnMap.put("rtnCode", "1");
					returnMap.put("message", "중분류코드가 있어 삭제 할 수 없습니다.");
				}
			}else if("2".equals(checkClasCd)){
				int count = pgmCatMgmtDAO.mclasCount(param);
				
				if(count == 0){
					pgmCatMgmtDAO.deletMclas(param);
					commonMainDAO.deleteLogInsert(param);
					returnMap.put("rtnCode", "0");
					returnMap.put("message", "정상적으로 삭제 되었습니다");
				}else{
					returnMap.put("rtnCode", "1");
					returnMap.put("message", "소분류코드가 있어 삭제 할 수 없습니다.");
				}
			}else if("3".equals(checkClasCd)){
				int count = pgmCatMgmtDAO.sclasCount(param);
				
				if(count == 0){
					pgmCatMgmtDAO.deletSclas(param);
					commonMainDAO.deleteLogInsert(param);
					returnMap.put("rtnCode", "0");
					returnMap.put("message", "정상적으로 삭제 되었습니다");
				}else{
					returnMap.put("rtnCode", "1");
					returnMap.put("message", "프로그램이 있어 삭제 할 수 없습니다.");
				}
			}
			
			
		} catch (BadSqlGrammarException e) {
			returnMap.put("rtnCode", "-1");
			returnMap.put("message", "저장에 실패하였습니다.");
 		    TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}	
		
		return returnMap;
		
	}
	
}
