package kr.co.grit.wfc.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.annotation.Resource;

import kr.co.grit.wfc.dao.WfcSpclRecordDAO;

import org.springframework.jdbc.BadSqlGrammarException;
import org.springframework.stereotype.Service;

@Service("WfcSpclRecordService")
public class WfcSpclRecordServiceImpl implements WfcSpclRecordService{

	@Resource(name="WfcSpclRecordDAO")
	private transient WfcSpclRecordDAO wfcSpclRecordDAO;
	

	
	@Override
	public List<Map> selectWfcSpclRecord(Map param) throws Exception {
		// TODO Auto-generated method stub
		return wfcSpclRecordDAO.selectWfcSpclRecord(param);
	}



	@Override
	public List<Map> selectTypeBehavior(Map param) throws Exception {
		// TODO Auto-generated method stub
		return wfcSpclRecordDAO.selectTypeBehavior(param);
	}



	@Override 
	public List<Map> selectSpcDspsnId(Map param) throws Exception {
		// TODO Auto-generated method stub
		return wfcSpclRecordDAO.selectSpcDspsnId(param);
	}

	@Override
	public List<Map> selectAjaxDspsn(Map param) throws Exception {
		// TODO Auto-generated method stub
		return wfcSpclRecordDAO.selectAjaxDspsnList(param);
	}


	@Override
	public Map<String, String> saveWfcSpclRecord(Map param) throws Exception {
		// TODO Auto-generated method stub
		Map<String, String> returnMap = new ConcurrentHashMap<String, String>();
		
		String saveMode = (String)param.get("saveMode");
		
		try {
			if("I".equals(saveMode)){
				wfcSpclRecordDAO.insertWfcSpclRecord(param);
				
			}else if("U".equals(saveMode)){
				wfcSpclRecordDAO.updateWfcSpclRecord(param);
			}
			
			
			returnMap.put("rtnCode", "0");
			returnMap.put("message", "정상적으로 저장 되었습니다");
		} catch (BadSqlGrammarException e) {
			e.printStackTrace();
			
			returnMap.put("rtnCode", "-1");
			returnMap.put("message", "저장에 실패하였습니다.");
		}
		 
		 return returnMap;
	}
}
