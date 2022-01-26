package kr.co.grit.common.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import egovframework.rte.psl.dataaccess.util.EgovMap;


/**
 * @Class Name : CommonLoginService.java
 * @Description : CommonLoginService Business class
 * @Modification Information
 *
 */
public interface CommonLoginService {

	/**
  	 * 로그인 처리
  	 * @param
  	 * @return  로그인 처리
  	 * @exception Exception
  	 */
    @SuppressWarnings("rawtypes")
  	Map processLogin(Map param) throws Exception;

	/**
  	 * 로그아웃 처리
  	 * @param
  	 * @return  로그아웃 처리
  	 * @exception Exception
  	 */
    void processLogOut(String clientIp) throws Exception;
    
	/**
  	 * Sha256Encoder
  	 * @param
  	 * @return  Sha256Encoder 값
  	 * @exception Exception
  	 */
    String getSha256Encrypt(String base) throws Exception;

    /**
  	 * 사용자 IP를 리턴한다.
  	 * @param
  	 * @return  사용자 IP를 리턴한다.
  	 * @exception Exception
  	 */
    String getClientIp(HttpServletRequest request) throws Exception;

    /**
	 * 사용자 암호 오류를 업데이트 한다.
	 * @param param - 조회할 정보가 담긴 Map
	 * @return int
	 * @exception Exception
	 */
    @SuppressWarnings("rawtypes")
    int modifyPwdErrCount(Map param) throws Exception;

    /**
	 * 로그인 정보 업데이트 한다.
	 * @param param - 조회할 정보가 담긴 Map
	 * @return int
	 * @exception Exception
	 */
    @SuppressWarnings("rawtypes")
    int modifySysLoginInfo(Map param) throws Exception;

	/**
	 * 로그인 이력을 등록한다.
	 * @param param - 추가할 정보가 담긴 Map
	 * @return
	 * @exception Exception
	 */
    @SuppressWarnings("rawtypes")
	void addSysLoginLog(Map param) throws Exception;

    /**
	 * 유저 최근 접속 IP, 시간 조회
	 * @param param - 조회할 정보가 담긴 Map
	 * @return 유저 최근 접속 IP, 시간
	 * @exception Exception
	 */
    @SuppressWarnings("rawtypes")
	List<Map> getRecentSysLoginLog(Map param) throws Exception;

	
    /**
  	 * SESSION용 - 사용자 정보
  	 * @param
  	 * @return  사용자 정보
  	 * @exception Exception
  	 */
    @SuppressWarnings("rawtypes")
  	Map getUserInfo(Map param) throws Exception;

    
    /**
   	 * SESSION용 사용자 메뉴 권한 리스트
   	 * @param
   	 * @return  사용자 메뉴 권한 리스트
   	 * @exception Exception
   	 */
    @SuppressWarnings("rawtypes")
   	public List<Map> selectSysGroupMenu(Map param) throws Exception;


    /**
   	 * SESSION용 사용자 메뉴 버튼 권한 리스트
   	 * @param
   	 * @return  사용자 메뉴 버튼 권한 리스트
   	 * @exception Exception
   	 */
    @SuppressWarnings("rawtypes")
   	public List<Map> selectSysGroupMenuBtn(Map param) throws Exception;

    /**
   	 * 장애인 현황 리스트
   	 * @param
   	 * @return 
   	 * @exception Exception
   	 */
    @SuppressWarnings("rawtypes")
   	List<Map> searchDisableStatusList() throws Exception;
    
    
    /**
   	 * 로그인 패스워드 변경
   	 * @param
   	 * @return  
   	 * @exception Exception
   	 */
    EgovMap chageMemberPwd(EgovMap param);
    
}