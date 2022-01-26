package kr.co.grit.wfc.service;


import java.util.List;
import java.util.Map;


public interface WfcSpclRecordListVwService {
	
	@SuppressWarnings("rawtypes")
	List<Map> selectWfcSpclRecordListVw(Map param) throws Exception;
	
	@SuppressWarnings("rawtypes")
	List<Map> selectTypeBehavior(Map param) throws Exception;
	
	@SuppressWarnings("rawtypes")
	List<Map> selectAjaxDspsnList(Map param) throws Exception;
}
