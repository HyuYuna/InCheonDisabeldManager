package kr.co.grit.bas.service;


import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 장애인연령별 현황 등록
 * @author JJS
 */
public interface BasDisabiltyAgeSaveService {
	

	/**
	 * 장애인연령별 엑셀 읽기
	 * @param file
	 * @return
	 */
	EgovMap disableAgeExcelUpload(MultipartFile file);
	
	/**
	 * temp조회
	 * @param EgovMap
	 * @return
	 */
	List<EgovMap> selectExcelTempAgeList();
	
	/**
	 * 에러 조회
	 * @param EgovMap
	 * @return
	 */
	List<EgovMap> selectErrorAgeList();
	
	
	/**
	 * 장애인연령별 현황 확정
	 * @param EgovMap
	 * @return
	 */
	EgovMap confirmDisableAge(List<EgovMap> param);
	
}
