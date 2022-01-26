package kr.co.grit.bas.service;


import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 사용자 관리
 * @author JJS
 */
public interface BasSysInfoMgmtService {
	
	/**
	 * 사용자 조회
	 * @param param
	 * @return
	 */
	List<EgovMap> selectUserList(EgovMap param);
	
	/**
	 * 사용자 저장
	 * @param param
	 * @return
	 */
	EgovMap saveSysInfo(EgovMap param);
	
	/**
	 * 비밀번호 변경
	 * @param param
	 * @return
	 */
	EgovMap changeSysPassword(EgovMap param);
	
	/**
	 * 비밀번호 초기화
	 * @param param
	 * @return
	 */
	EgovMap resetPassword(EgovMap param);
	
	/**
	 * 단체코드/복지시설코드 조회
	 * @param param
	 * @return
	 */
	List<EgovMap> searchLinkcdList(EgovMap param);
}
