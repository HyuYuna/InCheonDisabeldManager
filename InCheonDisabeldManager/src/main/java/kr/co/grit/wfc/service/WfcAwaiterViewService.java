package kr.co.grit.wfc.service;


import java.util.List;
import java.util.Map;


public interface WfcAwaiterViewService {
	
	@SuppressWarnings("rawtypes")
	List<Map> selectAwaiterView(Map param) throws Exception;
}
