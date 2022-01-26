package kr.co.grit.bas.service;


import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 장애인 현황 출력
 * @author JJS
 */
public interface BasDisabiltyPrintService {
	
	List<EgovMap> disablePrintList(EgovMap param);
	
	List<EgovMap> selectSysDateList();
	
	EgovMap saveDspsnPopltn(EgovMap param);
	
}
