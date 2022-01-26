package kr.co.grit.dsp.service;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 
 * @author PKH
 */
public interface DspsnInfoService {
	
	/**
	 * 장애인조회 실행
	 * @param param
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	List<Map> selectDspsnInfo(EgovMap param) ;
}
