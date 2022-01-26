package kr.co.grit.bas.service;


import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 사용자 수정
 * @author JJS
 */
public interface BasSysInfoSaveService {
	
	/**
	 * 사용자 수정
	 * @param param
	 * @return
	 */
	EgovMap updateSys(EgovMap param);
	

}
