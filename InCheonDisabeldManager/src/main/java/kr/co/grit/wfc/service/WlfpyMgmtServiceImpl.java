package kr.co.grit.wfc.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.annotation.Resource;

import kr.co.grit.wfc.dao.WlfpyMgmtDAO;

import org.springframework.jdbc.BadSqlGrammarException;
import org.springframework.stereotype.Service;

@Service("WlfpyMgmtService")
public class WlfpyMgmtServiceImpl implements WlfpyMgmtService{

	@Resource(name = "WlfpyMgmtDAO")
	private transient WlfpyMgmtDAO wlfpyMgmtDAO;
	
	
	@Override
	public List<Map> selectWlfpyMgmt(Map param) throws Exception {
		// TODO Auto-generated method stub
		return wlfpyMgmtDAO.selectWlfpyMgmt(param);
	}


	@Override
	public Map selectWffcltyNm(Map param) throws Exception {
		// TODO Auto-generated method stub
		return wlfpyMgmtDAO.selectWffcltyNm(param);
	}


	@Override
	public Map<String, String> saveWlfpyMgmt(Map param) throws Exception {
		
		Map<String, String> returnMap = new ConcurrentHashMap<String, String>();
		
		String saveMode = (String)param.get("saveMode");
		
		try {
			if("I".equals(saveMode)){
				wlfpyMgmtDAO.insertWlfpyMgmt(param);
				
			}else if("U".equals(saveMode)){
				wlfpyMgmtDAO.updateWlfpyMgmt(param);
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
