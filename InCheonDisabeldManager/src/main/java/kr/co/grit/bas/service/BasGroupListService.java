package kr.co.grit.bas.service;


import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 단체조회
 * @author JJS
 */
public interface BasGroupListService {
	
	/**
	 * 사용자 수정
	 * @param param
	 * @return
	 */
	List<EgovMap> selectGroupList(EgovMap param);
	

}
