package kr.co.grit.pgm.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import egovframework.rte.psl.dataaccess.util.EgovMap;


/**
 * 도서목록 엑셀 업로드
 * @author JJS
 */
public interface LbrryBookExcelUploadService {

	/**
	 * 도서목록 엑셀 읽기
	 * @param file, linkCd
	 * @return
	 */
	EgovMap pgmLbrryBookExcelFile(MultipartFile file,String linkCd);
	
	/**
	 * temp테이블 조회
	 * @param linkCd
	 * @return
	 */
	List<EgovMap> selectLbrExcelTempList(String linkCd);
	
	/**
	 * 에러 조회
	 * @param linkCd
	 * @return
	 */
	List<EgovMap> selectLbrExcelTempErrorList(String linkCd);
	
	
	/**
	 * 도서목록 확정
	 * @param List<EgovMap>
	 * @return
	 */
	EgovMap confirmLbrryBook(List<EgovMap> param);
	
	
}
