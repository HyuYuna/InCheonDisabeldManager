package kr.co.grit.bas.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 장애정도별 현황 등록
 * @author JJS
 */
public interface BasDisabiltyPreSaveService {
	
	EgovMap disablePreExcelUpload(MultipartFile file);
	
	List<EgovMap> selectExcelTempList();
	
	List<EgovMap> selectExcelTempErrorList();
	
	EgovMap confirmDisablePre(List<EgovMap> param);
	
	
}
