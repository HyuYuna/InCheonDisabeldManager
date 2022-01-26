package kr.co.grit.dsp.service;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 이용장애인 등록
 * @author JJS
 */
public interface DspDisabledPersonSaveService {
	
	/**
	 * 이용장애인 리스트 조회
	 * @param EgovMap
	 * @return
	 */
	List<EgovMap> selectDisablePersonList(EgovMap param);
	
	/**
	 * 이용장애인 저장
	 * @param Map
	 * @return
	 */
	EgovMap saveDisablePersonInfo(Map param)throws Exception;
	
	/**
	 * 장애인코드 채번
	 * @param Map
	 * @return
	 */
	String selectDspsnId();
	
	/**
	 * 생년월일 중복체크
	 * @param EgovMap
	 * @return
	 */
	List<EgovMap> selectencBirthDd(EgovMap param);
}
