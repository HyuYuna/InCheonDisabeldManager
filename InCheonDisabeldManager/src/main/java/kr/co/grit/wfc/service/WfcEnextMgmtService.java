package kr.co.grit.wfc.service;


import java.util.List;
import java.util.Map;


public interface WfcEnextMgmtService {
	//조회
	@SuppressWarnings("rawtypes")
	List<Map> selectEnextMgmtList(Map param) throws Exception;
	
	@SuppressWarnings("rawtypes")
	Map<String, String> saveEnextMgmtA(Map param) throws Exception;
	
	@SuppressWarnings("rawtypes")
	List<Map> selectAjaxDspsn(Map param) throws Exception;
	
	@SuppressWarnings("rawtypes")
	Map selectFcltyList(String link) throws Exception;
	
	@SuppressWarnings("rawtypes")
	String selectGroupType(String link) throws Exception;
	
	@SuppressWarnings("rawtypes")
	List<Map> selectCheckDspsn(Map param) throws Exception;
	
	@SuppressWarnings("rawtypes")
	int insertCmprs(Map<String, Object> param) throws Exception;
	
	@SuppressWarnings("rawtypes")
	int admCmp(Map<String, Object> param) throws Exception;
	
	@SuppressWarnings("rawtypes")
	int blindHandling(Map<String, Object> param) throws Exception;
}
