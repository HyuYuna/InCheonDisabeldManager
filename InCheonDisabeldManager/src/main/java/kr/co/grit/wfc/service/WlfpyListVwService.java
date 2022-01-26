package kr.co.grit.wfc.service;


import java.util.List;
import java.util.Map;


public interface WlfpyListVwService {
	
	@SuppressWarnings("rawtypes")
	List<Map> selectWlfpyListVw(Map param) throws Exception;
}
