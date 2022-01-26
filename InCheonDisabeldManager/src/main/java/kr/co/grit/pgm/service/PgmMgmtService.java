package kr.co.grit.pgm.service;


import java.util.List;
import java.util.Map;


public interface PgmMgmtService {
	
	@SuppressWarnings("rawtypes")
	List<Map> selectProgramList(Map param) throws Exception;
	
	@SuppressWarnings("rawtypes")
	List<Map> searchLclasList(Map param) throws Exception;
	
	@SuppressWarnings("rawtypes")
	List<Map> searchMclasList(Map param) throws Exception;
	
	@SuppressWarnings("rawtypes")
	List<Map> searchSclasList(Map param) throws Exception;
	
	@SuppressWarnings("rawtypes")
	Map<String, String> savePgmMgmt(Map param) throws Exception;
	
	@SuppressWarnings("rawtypes")
	List<Map> selectProgramPictureList(Map param) throws Exception;
	
	@SuppressWarnings("rawtypes")
	Map<String, String> saveImg(List<Map<String, Object>> list) throws Exception;
	
	@SuppressWarnings("rawtypes")
	String selectProgramChaban(String linkCd) throws Exception;
	
	@SuppressWarnings("rawtypes")
	public Map deleteProgramMgmt(Map param) throws Exception;
}

