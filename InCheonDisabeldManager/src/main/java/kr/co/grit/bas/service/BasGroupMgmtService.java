package kr.co.grit.bas.service;

import java.util.List;
import java.util.Map;

/**
 * 단체관리
 * @author SYW
 */
public interface BasGroupMgmtService {
	
	/**
	 * 단체관리  조회
	 * @param param
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	List<Map> readGroupList(Map param) throws Exception;
	
	/**
	 * 신규 입력 및 수정
	 * @param param
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	Map insertGroupInfo(Map param) throws Exception;
	
	/**
	 * 허가번호 중복검사
	 * @param param
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public int selectEncChk(Map param) throws Exception;
	
	/**
	 * 단체관리 삭제
	 * @param param
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public Map<String, Object> deleteBasGroupMgmt(Map param) throws Exception;
}
