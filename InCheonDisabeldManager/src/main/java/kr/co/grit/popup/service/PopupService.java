package kr.co.grit.popup.service;


import java.util.List;
import java.util.Map;


public interface PopupService {
	
	@SuppressWarnings("rawtypes")
	List<Map> searchOgnztList(Map param) throws Exception;
	
	@SuppressWarnings("rawtypes")
	List<Map> searchWffcltyList(Map param) throws Exception;
	
	@SuppressWarnings("rawtypes")
	List<Map> searchDspsnList(Map param) throws Exception;
	
	@SuppressWarnings("rawtypes")
	List<Map> searchDspsnList2(Map param) throws Exception;
	
}
