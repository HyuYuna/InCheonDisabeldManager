package kr.co.grit.wfc.service;


import java.util.List;
import java.util.Map;


public interface WfcInOutViewService {
	
	@SuppressWarnings("rawtypes")
	List<Map> selectInOutViewList(Map param) throws Exception;
	
	@SuppressWarnings("rawtypes")
	List<Map> selectWffcltyCodeAB(Map param) throws Exception;
	
	@SuppressWarnings("rawtypes")
	List<Map> selectWffcltyCodeC(Map param) throws Exception;
	
	@SuppressWarnings("rawtypes")
	List<Map> selectGroupCodeD(Map param) throws Exception;
	/*@SuppressWarnings("rawtypes")
	Map<String, String> saveEnextMgmt(Map param) throws Exception;
	
	@SuppressWarnings("rawtypes")
	List<Map> selectAjaxDspsn(Map param) throws Exception;
	
	@SuppressWarnings("rawtypes")
	Map selectFcltyList(String link) throws Exception;
*/	
	
}
