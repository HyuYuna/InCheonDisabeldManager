package kr.co.grit.emp.service;


import java.util.List;
import java.util.Map;


public interface EmpWorkerMgmtService {
	
	@SuppressWarnings("rawtypes")
	List<Map> selectWorkerMgmt(Map param);
	
	@SuppressWarnings("rawtypes")
	Map selectFcltyType(Map param);
	
	@SuppressWarnings("rawtypes")
	List<Map> selectPosition(Map param);
	
	Map<String, String> saveWorkerMgmt(Map param);
	
	@SuppressWarnings("rawtypes")
	Map juminChkCnt(Map param);
	
	@SuppressWarnings("rawtypes")
	Map selectKeyValue(Map param);
	
	@SuppressWarnings("rawtypes")
	Map selectJuminUse(Map param);
	
	@SuppressWarnings("rawtypes")
	Map deleteWorker(Map param);
}

