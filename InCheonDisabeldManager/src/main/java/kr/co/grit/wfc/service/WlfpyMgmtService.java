package kr.co.grit.wfc.service;


import java.util.List;
import java.util.Map;


public interface WlfpyMgmtService {
	
	@SuppressWarnings("rawtypes")
	List<Map> selectWlfpyMgmt(Map param) throws Exception;
	
	@SuppressWarnings("rawtypes")
	Map selectWffcltyNm(Map param) throws Exception;
	
	@SuppressWarnings("rawtypes")
	Map<String, String> saveWlfpyMgmt(Map param) throws Exception;
}
