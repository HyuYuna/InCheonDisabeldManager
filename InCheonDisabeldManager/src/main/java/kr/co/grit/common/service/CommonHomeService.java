package kr.co.grit.common.service;

import java.util.List;
import java.util.Map;

/**
 * @Class Name : CommonHomeService.java
 * @Description : CommonHome Business class
 * @Modification Information
 *
 */

public interface CommonHomeService {

	/**
	 * 홈 공지사항 목록 조회
	 * @param param - 조회할 정보가 담긴 param
	 * @return 홈 공지사항 목록
	 * @exception Exception
	 */
    @SuppressWarnings("rawtypes")
	List<Map> getHomeNoticeList(Map param) throws Exception;
    
	/**
	 * 홈 자료실 목록 조회
	 * @param param - 조회할 정보가 담긴 param
	 * @return 홈 자료실 목록
	 * @exception Exception
	 */
    @SuppressWarnings("rawtypes")
	List<Map> getHomeReferList(Map param) throws Exception;
    
    
}
