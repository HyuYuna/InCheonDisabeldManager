package kr.co.grit.wfc.service;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.parser.ParseException;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 복지시설 상세관리
 * @author JJS
 */
public interface WfcDetailService {
	
	/**
	 * 복지시설 기본정보 조회
	 * @param EgovMap
	 * @return
	 */
	EgovMap selectWffcltyBaseList(EgovMap param);
	
	/**
	 * 복지시설 상세정보 조회
	 * @param EgovMap
	 * @return
	 */
	List<EgovMap> selectWffcltyDetailList(EgovMap param);
	
	/**
	 * 복지시설 상세정보 저장
	 * @param JSONArray
	 * @return
	 */
	EgovMap saveWfcDetail(JSONArray jsonArr)throws ParseException;
	
	/**
	 * 복지시설 서비스장애 조회
	 * @param EgovMap
	 * @return
	 */
	List<EgovMap> selectwffcltyDisableTpList(EgovMap param);
	
	/**
	 * 복지시설 사진 조회
	 * @param EgovMap
	 * @return
	 */
	List<EgovMap> selectwffcltyPictureList(EgovMap param);
	
	/**
	 * 복지시설 사진 저장
	 * @param List
	 * @return
	 */
	EgovMap saveImg(List<Map<String, Object>> list) throws ParseException;
	
	/**
	 * 복지시설코드 조회
	 * @param EgovMap
	 * @return
	 */
	List<EgovMap> selectWffcltyList(EgovMap param);
}
