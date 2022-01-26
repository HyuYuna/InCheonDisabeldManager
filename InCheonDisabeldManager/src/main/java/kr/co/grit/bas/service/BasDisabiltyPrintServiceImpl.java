package kr.co.grit.bas.service;

import java.util.List;

import javax.annotation.Resource;

import kr.co.grit.bas.dao.BasDisabiltyPrintDAO;

import org.springframework.jdbc.BadSqlGrammarException;
import org.springframework.stereotype.Service;

import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("BasDisabiltyPrintService")
public class BasDisabiltyPrintServiceImpl implements BasDisabiltyPrintService{
	
	/**
	 * DAO 선언
	 */
	@Resource(name="BasDisabiltyPrintDAO")
	private transient BasDisabiltyPrintDAO disPrintDAO;
	
	
	@Override
	public List<EgovMap> disablePrintList(EgovMap param) {
		return disPrintDAO.disablePrintList(param);
	}
	
	@Override
	public List<EgovMap> selectSysDateList(){
		return disPrintDAO.selectSysDateList();
	}
	
	
	@Override
    public EgovMap saveDspsnPopltn(EgovMap param){
		EgovMap returnMap = new EgovMap();
		
		String saveMode = (String)param.get("saveMode");
		
		try {
			if("I".equals(saveMode)){

				disPrintDAO.insertDspsnPopltn(param);
				
			}else if("U".equals(saveMode)){
				disPrintDAO.updateDspsnPopltn(param);
			}
			
			
			returnMap.put("rtnCode", "0");
			returnMap.put("message", "정상적으로 저장 되었습니다");
		} catch (BadSqlGrammarException e) {
			returnMap.put("rtnCode", "-1");
			returnMap.put("message", "저장에 실패하였습니다.");
		}
		 
		 return returnMap;
	}
	
}
