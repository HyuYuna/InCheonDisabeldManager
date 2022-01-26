package kr.co.grit.bas.service;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 복지시설 기초관리
 * @author SYW
 */
public interface BasMgntWelfareBaseService {
	
	@SuppressWarnings("rawtypes")
	List<EgovMap> selectMgntWelfareBase(final EgovMap param) throws Exception;
	
	@SuppressWarnings("rawtypes")
	EgovMap insertMgntWelfareBase(final EgovMap param) throws Exception;
	
	/**
	 * 시설유형를 조회한다
	 * @return 시설유형을 조회한다.
	 * @exception Exception
	 */
    @SuppressWarnings("rawtypes")
    List<EgovMap> selectTypeFacility(final EgovMap param) throws Exception;
    
    /**
	 * 고유번호를 중복체크 한다
	 * @return 고유번호를 중복체크 한다.
	 * @exception Exception
	 */
    @SuppressWarnings("rawtypes")
    int selectUnqChk(final EgovMap param) throws Exception;
    
    /**
	 * 복지시설을 조회 한다
	 * @return 복지시설을 조회 한다.
	 * @exception Exception
	 */
    @SuppressWarnings("rawtypes")
    List<EgovMap> searchWffcltyList(final EgovMap param) throws Exception;
    
    /**
	 * 운영단체을 조회 한다.
	 * @return 운영단체을 조회 한다.
	 * @exception Exception
	 */
    @SuppressWarnings("rawtypes")
	List<EgovMap> searchOgnztList(final EgovMap param) throws Exception;
    
    /**
	 * Detail 카운트를 조회 한다.
	 * @return Detail 카운트를 조회 한다.
	 * @exception Exception
	 */
    @SuppressWarnings("rawtypes")
	int searchDetail(final EgovMap param) throws Exception;
    
    /**
   	 * 복지시설 기초관리 삭제
   	 * @return 복지시설 기초관리 삭제
   	 * @exception Exception
   	 */
    EgovMap deleteWffclty(EgovMap param);
}
