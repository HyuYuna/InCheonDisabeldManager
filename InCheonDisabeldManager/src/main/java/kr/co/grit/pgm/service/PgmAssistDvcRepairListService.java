package kr.co.grit.pgm.service;


import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 보장구 수리내역 조회
 * @author JJS
 */
public interface PgmAssistDvcRepairListService {
	
	/**
	 * 보장구 수리내역 리스트 조회
	 * @param param
	 * @return
	 */
	List<EgovMap> selectAssDcvRepairList(EgovMap param);
	
	/**
	 * 사용자 그룹코드에 따른 조회조건(복지시설) 조회
	 * @param param
	 * @return
	 */
	List<EgovMap> searchAssDvcRepWffcltyList();
	
	/**
	 * 사용자 그룹코드에 따른 조회조건(복지시설) 조회
	 * @param param
	 * @return
	 */
	List<EgovMap> searchAssDvcRepWffcltyList2(EgovMap param);
	
	/**
	 * 조회조건 - 장애인리스트 조회
	 * @param param
	 * @return
	 */
	List<EgovMap> searchAssDcvDspsn(EgovMap param);
}

