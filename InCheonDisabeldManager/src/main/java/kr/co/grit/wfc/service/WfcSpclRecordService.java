package kr.co.grit.wfc.service;


import java.util.List;
import java.util.Map;


public interface WfcSpclRecordService {
	
	@SuppressWarnings("rawtypes")
	List<Map> selectWfcSpclRecord(Map param) throws Exception;
	
	@SuppressWarnings("rawtypes")
	List<Map> selectTypeBehavior(Map param) throws Exception;
	
	@SuppressWarnings("rawtypes")
	List<Map> selectAjaxDspsn(Map param) throws Exception;
	
	@SuppressWarnings("rawtypes")
	List<Map> selectSpcDspsnId(Map param) throws Exception;
	
	@SuppressWarnings("rawtypes")
	Map<String, String> saveWfcSpclRecord(Map param) throws Exception;
}
