package kr.co.grit.pgm.service;

import java.util.List;

import javax.annotation.Resource;

import kr.co.grit.common.util.SessionUtil;
import kr.co.grit.pgm.dao.LbrryBookDAO;

import org.springframework.stereotype.Service;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 프로그램관리 > 도서 관리
 * @author PKH
 */
@Service("LbrryBookService")
public class LbrryBookServiceImpl implements LbrryBookService{

	/**
	 * DAO 선언
	 */
	@Resource(name="LbrryBookDAO")
	private transient LbrryBookDAO lbrryBookDAO;
	
	/**
	 * 
	 */
	public LbrryBookServiceImpl() {
		//constructor
		//unnecessaryconstructor : 생성자 없는 경우보다 pmd rule 에 검출 건수가 적음. 제외 권장
	}
	
	@Override
	public List<EgovMap> selectLbrryBookCatalog(final EgovMap param) {
		final EgovMap pMap = paramPut(param);
		return lbrryBookDAO.selectLbrryBookCatalog(pMap);
	}
	
	@Override
	public int saveLbrryBookCatalog(final EgovMap param) {
		final EgovMap pMap = paramPut(param);
		return lbrryBookDAO.saveLbrryBookCatalog(pMap);
	}
	
	@Override
	public List<EgovMap> selectLbrryBookType(final EgovMap param) {
		final EgovMap pMap = paramPut(param);
		return lbrryBookDAO.selectLbrryBookType(pMap);
	}
	
	@Override
	public int saveLbrryBookType(final EgovMap param) {
		final EgovMap pMap = paramPut(param);
		return lbrryBookDAO.saveLbrryBookType(pMap);
	}
	
	@Override
	public List<EgovMap> selectLbrryBook(final EgovMap param) {
		final EgovMap pMap = paramPut(param);
		return lbrryBookDAO.selectLbrryBook(pMap);
	}
	
	@Override
	public int saveLbrryBook(final EgovMap param) {
		final EgovMap pMap = paramPut(param);
		return lbrryBookDAO.saveLbrryBook(pMap);
	}
	
	/**
	 * map 에 복지시설코드, 사용자아이디 추가
	 * @param param
	 * @return
	 */
	public EgovMap paramPut(final EgovMap param) {
		final EgovMap userInfo = (EgovMap) SessionUtil.getRequestAttributes("KSSM.user");
		final String sessWffcltyCd = (String)userInfo.get("wffcltyCd");
		//
		final String sessUserId = (String)userInfo.get("userId");
		//
		param.put("sessWffcltyCd", sessWffcltyCd);
		param.put("sessUserId", sessUserId);		
		return param;
	}
}
