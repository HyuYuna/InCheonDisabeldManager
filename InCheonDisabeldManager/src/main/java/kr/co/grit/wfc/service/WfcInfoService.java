package kr.co.grit.wfc.service;

import java.util.List;
import java.util.Map;

/**
 * 
 * @author PKH
 *
 */
public interface WfcInfoService {

	/**
	 * 복지시설 조회
	 * @param param
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	List<Map> selectWfcInfo(final Map param);
	
	/**
	 * 서비스장애 조회 
	 * @param param
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	List<Map> selectWfcInfoDis(final Map param);
	
}
