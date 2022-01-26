package kr.co.grit.bas.service;


import javax.annotation.Resource;

import kr.co.grit.bas.dao.BasSysInfoSaveDAO;

import org.springframework.jdbc.BadSqlGrammarException;
import org.springframework.stereotype.Service;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 사용자 수정
 * @author JJS
 */
@Service("BasSysInfoSaveService")
public class BasSysInfoSaveServiceImpl implements BasSysInfoSaveService{

	/**
	 * DAO 선언
	 */
	@Resource(name="BasSysInfoSaveDAO")
	private transient BasSysInfoSaveDAO basSysInfoSaveDAO;

	
	@Override
    public EgovMap updateSys(EgovMap param){
		EgovMap returnMap = new EgovMap();
		
		try {
			basSysInfoSaveDAO.updateSys(param);
	
			returnMap.put("rtnCode", "0");
			returnMap.put("message", "정상적으로 저장 되었습니다");
		} catch (BadSqlGrammarException e) {
			returnMap.put("rtnCode", "-1");
			returnMap.put("message", "저장에 실패하였습니다.");
		}
		 
		 return returnMap;
	}
	
	
}
