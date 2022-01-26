package kr.co.grit.pgm.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.util.EgovMap;


/**
 * 
 * @author JJS
 */
@Repository("PgmCategorizeMgmtDAO")
public class PgmCategorizeMgmtDAO {
	
	/**
	 * resource 선언
	 */
	@Resource(name="sqlSessionTemplate")
	private transient SqlSessionTemplate sqlSession;
	
	public List<EgovMap> searchLclasList(EgovMap param) {
		return sqlSession.selectList("PgmCategorizeMgmtDAO.searchLclasList", param);
	}
	
	public List<EgovMap> searchMclasList(EgovMap param) {
		return sqlSession.selectList("PgmCategorizeMgmtDAO.searchMclasList", param);
	}
	
	public List<EgovMap> selectClasList(EgovMap param) {
		return sqlSession.selectList("PgmCategorizeMgmtDAO.selectClasList", param);
	}
	
	public List<EgovMap> searchMclaCdList(EgovMap param) {
		return sqlSession.selectList("PgmCategorizeMgmtDAO.searchMclaCdList", param);
	}
	
	public List<EgovMap> searchWffcltyCdList(EgovMap param) {
		return sqlSession.selectList("PgmCategorizeMgmtDAO.searchWffcltyCdList", param);
	}
	
	public void insertLclas(EgovMap param) {
		sqlSession.insert("PgmCategorizeMgmtDAO.insertLclas", param);
	}
	
	public void insertMclas(EgovMap param) {
		sqlSession.insert("PgmCategorizeMgmtDAO.insertMclas", param);
	}
	
	public void insertSclas(EgovMap param) {
		sqlSession.insert("PgmCategorizeMgmtDAO.insertSclas", param);
	}
	
	public void updateLclas(EgovMap param) {
		sqlSession.update("PgmCategorizeMgmtDAO.updateLclas", param);
	}
	
	public void updateMclas(EgovMap param) {
		sqlSession.update("PgmCategorizeMgmtDAO.updateMclas", param);
	}
	
	public void updateSclas(EgovMap param) {
		sqlSession.update("PgmCategorizeMgmtDAO.updateSclas", param);
	}
	
	public int lclasCount(EgovMap param) {
		return sqlSession.selectOne("PgmCategorizeMgmtDAO.lclasCount", param);
	}
	
	public int mclasCount(EgovMap param) {
		return sqlSession.selectOne("PgmCategorizeMgmtDAO.mclasCount", param);
	}
	
	public int sclasCount(EgovMap param) {
		return sqlSession.selectOne("PgmCategorizeMgmtDAO.sclasCount", param);
	}
	
	public void deletLclas(EgovMap param){
		sqlSession.delete("PgmCategorizeMgmtDAO.deletLclas", param);
	}
	
	public void deletMclas(EgovMap param){
		sqlSession.delete("PgmCategorizeMgmtDAO.deletMclas", param);
	}
	
	public void deletSclas(EgovMap param){
		sqlSession.delete("PgmCategorizeMgmtDAO.deletSclas", param);
	}
	

}
