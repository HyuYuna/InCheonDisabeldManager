package kr.co.grit.pgm.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;


/**
 * 보장구 수리내역 조회
 * @author JJS
 */
public interface PgmCategorizeMgmtService {
	
	List<EgovMap> searchLclasList(EgovMap param);
	
	List<EgovMap> searchMclasList(EgovMap param);
	
	List<EgovMap> selectClasList(EgovMap param);
	
	EgovMap saveClas(EgovMap param);
	
	List<EgovMap> searchMclaCdList(EgovMap param);
	
	List<EgovMap> searchWffcltyCdList(EgovMap param);
	
	EgovMap deleteClas(EgovMap param);
}

