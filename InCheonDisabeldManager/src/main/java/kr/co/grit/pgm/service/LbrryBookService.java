package kr.co.grit.pgm.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 도서 관리
 * @author PKH
 */
public interface LbrryBookService {

	/**
	 * 도서 유형 조회
	 * @param param
	 * @return
	 */
	List<EgovMap> selectLbrryBookCatalog(EgovMap param);
	
	/**
	 * 도서 유형 저장
	 * @param param
	 * @return
	 */
	int saveLbrryBookCatalog(EgovMap param);
	
	/**
	 * 도서 분류 조회
	 * @param param
	 * @return
	 */
	List<EgovMap> selectLbrryBookType(EgovMap param);
	
	/**
	 * 도서 분류 저장
	 * @param param
	 * @return
	 */
	int saveLbrryBookType(EgovMap param);
	
	/**
	 * 도서 조회
	 * @param param
	 * @return
	 */
	List<EgovMap> selectLbrryBook(EgovMap param);
	
	/**
	 * 도서 저장
	 * @param param
	 * @return
	 */
	int saveLbrryBook(EgovMap param);
	
	
}
