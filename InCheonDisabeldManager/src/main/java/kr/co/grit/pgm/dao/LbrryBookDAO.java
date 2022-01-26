package kr.co.grit.pgm.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 
 * @author PKH
 */
@Repository("LbrryBookDAO")
public class LbrryBookDAO {

	/**
	 * resource 선언
	 */
	@Resource(name="sqlSessionTemplate")
	private transient SqlSessionTemplate sqlSession;
	
	/**
	 * constructor
	 */
	public LbrryBookDAO() {
		//constructor
		//unnecessaryconstructor : 생성자 없는 경우보다 pmd rule 에 검출 건수가 적음. 제외 권장
	}
	
	/**
	 * 도서 분류 조회
	 * @param param
	 * @return
	 */
	public List<EgovMap> selectLbrryBookCatalog(final EgovMap param) {
		return sqlSession.selectList("LbrryBookDAO.selectLbrryBookCatalog",param);
	}
	
	/**
	 * 도서 분류 저장
	 * @param param
	 * @return
	 */
	public int saveLbrryBookCatalog(final EgovMap param) {
		return sqlSession.update("LbrryBookDAO.saveLbrryBookCatalog",param);
	}
	
	/**
	 * 도서 유형 조죄
	 * @param param
	 * @return
	 */
	public List<EgovMap> selectLbrryBookType(final EgovMap param) {
		return sqlSession.selectList("LbrryBookDAO.selectLbrryBookType",param);
	}
	
	/**
	 * 도서 유형 저장
	 * @param param
	 * @return
	 */
	public int saveLbrryBookType(final EgovMap param) {
		return sqlSession.update("LbrryBookDAO.saveLbrryBookType",param);
	}
	
	/**
	 * 도서 조회
	 * @param param
	 * @return
	 */
	public List<EgovMap> selectLbrryBook(final EgovMap param) {
		return sqlSession.selectList("LbrryBookDAO.selectLbrryBook",param);
	}
	
	/**
	 * 도서 저장
	 * @param param
	 * @return
	 */
	public int saveLbrryBook(final EgovMap param) {
		return sqlSession.update("LbrryBookDAO.saveLbrryBook",param);
	}
}
