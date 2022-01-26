package kr.co.grit.common.service;

import java.util.List;
import java.util.Map;

/**
 * @Class Name : CommonHomeService.java
 * @Description : CommonHome Business class
 * @Modification Information
 */
public interface CommonMainService {

    /**
	 *  권한에 따른 메뉴 리스트
	 * @param 조회할 정보가 담긴 Map
	 * @return  메뉴 리스트
	 * @exception Exception
	 */
    @SuppressWarnings("rawtypes")
	List<Map> getUserMenuList(Map param) throws Exception;
    
	/**
	 * 메뉴 작업 로그 등록
	 * @param param - 등록할 정보가 담긴 Map
	 * @return
	 * @exception Exception
	 */
	void addUserMenuLog(Map param) throws Exception;
	
    /**
	 *  데이터 조회
	 * @param 처리할 정보가 담긴 Map
	 * @return  데이터 리스트
	 * @exception Exception
	 */
    @SuppressWarnings("rawtypes")
	List<Map> getDataList(Map param) throws Exception;
    
	/**
	 * 데이터 등록
	 * @param param - 처리할 정보가 담긴 Map
	 * @return
	 * @exception Exception
	 */
	void addDataInfo(Map param) throws Exception;
    
	/**
	 * 데이터 수정
	 * @param param - 처리할 정보가 담긴 Map
	 * @return 수정 건수
	 * @exception Exception
	 */
	int modifyDataInfo(Map param) throws Exception;
    
	/**
	 * 데이터 삭제
	 * @param param - 처리할 정보가 담긴 Map
	 * @return 삭제 건수
	 * @exception Exception
	 */
	int deleteDataInfo(Map param) throws Exception;
    
	/**
	 * 데이터 프로시져 실행
	 * @param param - 처리할 정보가 담긴 Map
	 * @return 결과값
	 * @exception Exception
	 */
	Map<String, String> callDataInfo(Map param) throws Exception;
	
	
	/**
	 * 메인 유저정보
	 * @param param - 처리할 정보가 담긴 Map
	 * @return 결과값
	 * @exception Exception
	 */
	Map mainUserInfo(Map param) throws Exception;
}
