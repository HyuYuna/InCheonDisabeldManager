package kr.co.grit.wfc.service;


import java.util.List;
import java.util.Map;


public interface WfcAwaiterService {
	
	@SuppressWarnings("rawtypes")
	List<Map> selectAwaiter(Map param) throws Exception;
	
	@SuppressWarnings("rawtypes")
	Map<String, String> updateReceipt(Map param) throws Exception;
	
	@SuppressWarnings("rawtypes")
	Map<String, String> updateWating(Map param) throws Exception;
}
