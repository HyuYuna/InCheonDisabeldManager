package kr.co.grit.pgm.dao;

import java.util.List;

import javax.annotation.Resource;

import kr.co.grit.pgm.vo.PgmLbrryBookExcelVO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 
 * @author JJS
 */
@Repository("LbrryBookExcelUploadDAO")
public class LbrryBookExcelUploadDAO {
	
	/**
	 * resource 선언
	 */
	@Resource(name="sqlSessionTemplate")
	private transient SqlSessionTemplate sqlSession;
	
	public List<EgovMap> selectTypeList() {
	  return sqlSession.selectList("LbrryBookExcelUploadDAO.selectTypeList");
	}
	
	public List<EgovMap> selectLbrExcelTempList(String linkCd)  {
	  return sqlSession.selectList("LbrryBookExcelUploadDAO.selectLbrExcelTempList",linkCd);
	}
	
	public List<EgovMap> selectLbrErrorList(String linkCd)  {
	  return sqlSession.selectList("LbrryBookExcelUploadDAO.selectLbrErrorList",linkCd);
	}

	public int selectType(EgovMap map){
	  return sqlSession.selectOne("LbrryBookExcelUploadDAO.selectType",map);
	}
	
	public int selectCatalog(EgovMap map) {
	  return sqlSession.selectOne("LbrryBookExcelUploadDAO.selectCatalog",map);
	}
	
	public void confirmLbrry(EgovMap map) {
		sqlSession.insert("LbrryBookExcelUploadDAO.confirmLbrry", map);
	}
	
	public void insertLbrryTemp(PgmLbrryBookExcelVO excelVo) {
		sqlSession.insert("LbrryBookExcelUploadDAO.insertLbrryTemp", excelVo);
	}

	public void insertType(EgovMap map) {
		sqlSession.insert("LbrryBookExcelUploadDAO.insertType", map);
	}
	
	public void insertCatalog(EgovMap map)  {
		sqlSession.insert("LbrryBookExcelUploadDAO.insertCatalog", map);
	}
	
	public void deleteLbrry(EgovMap map) {
		sqlSession.delete("LbrryBookExcelUploadDAO.deleteLbrry", map);
	}
	
	public void deleteCatalog(EgovMap map)  {
		sqlSession.delete("LbrryBookExcelUploadDAO.deleteCatalog", map);
	}
	
	public void deleteLbrryTemp()  {
		sqlSession.delete("LbrryBookExcelUploadDAO.deleteLbrryTemp");
	}
	
	public void deleteType(EgovMap map) {
		sqlSession.delete("LbrryBookExcelUploadDAO.deleteType",map);
	}
	
	
}
