package kr.co.grit.emp.service;


import java.util.List;
import java.util.Map;


public interface EmpWorkerListVwService {
	
	@SuppressWarnings("rawtypes")
	List<Map> selectWorkerList(Map param);
	
	@SuppressWarnings("rawtypes")
	List<Map> selectWorkerHistory(Map param);
	
	@SuppressWarnings("rawtypes")
	List<Map> selectOrgnzCodeD(Map param);
}

