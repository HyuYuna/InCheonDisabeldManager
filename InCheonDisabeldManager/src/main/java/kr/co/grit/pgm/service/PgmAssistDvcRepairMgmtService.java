package kr.co.grit.pgm.service;


import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 보장구 수리내역 관리
 * @author JJS
 */
public interface PgmAssistDvcRepairMgmtService {
	

	/**
	 * 보장구 수리내역 리스트 조회
	 * @param EgovMap
	 * @return
	 */
	List<EgovMap> selectAssistDcvRepairList(EgovMap param);
	

	/**
	 * 조회조건 - 장애인코드 조회
	 * @param EgovMap
	 * @return
	 */
	EgovMap saveAssistDvcRepair(EgovMap param);
	
	List<EgovMap> searchAssDspsn(EgovMap param);
	
	/**
	 * 수리정보 - 장애인코드 조회
	 * @param EgovMap
	 * @return
	 */
	List<EgovMap> searchAssDspsn2(EgovMap param);
	
	List<EgovMap> selectDspsnCheck(EgovMap param);
	
	int selectSaveCnt(EgovMap param);
	
}

