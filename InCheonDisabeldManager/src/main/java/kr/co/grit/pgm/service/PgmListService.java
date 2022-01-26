package kr.co.grit.pgm.service;


import java.util.List;
import java.util.Map;


public interface PgmListService {
	
	@SuppressWarnings("rawtypes")
	List<Map> selectProgramView(Map param) throws Exception;
	
	@SuppressWarnings("rawtypes")
	List<Map> searchLclasView(Map param) throws Exception;
	
	@SuppressWarnings("rawtypes")
	List<Map> searchMclasView(Map param) throws Exception;
	
	@SuppressWarnings("rawtypes")
	List<Map> searchSclasView(Map param) throws Exception;
	
	@SuppressWarnings("rawtypes")
	List<Map> selectOrgnzCodeD(Map param) throws Exception;
	
	@SuppressWarnings("rawtypes")
	List<Map> selectPmgPic(Map param) throws Exception;
}