package kr.co.grit.bas.dao;

import java.util.List;

import javax.annotation.Resource;

import kr.co.grit.bas.vo.BasDisabiltyPreSaveVO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("BasDisabiltyPreSaveDAO")
public class BasDisabiltyPreSaveDAO {
	
	/**
	 * resource 선언
	 */
	@Resource(name="sqlSessionTemplate")
	private transient SqlSessionTemplate sqlSession;
	
	public void insertDisalblePre(BasDisabiltyPreSaveVO excelVo){
		sqlSession.insert("BasDisabiltyPreSaveDAO.insertDisalblePre", excelVo);
	}

	public void deleteTempDisablePre(){
		sqlSession.delete("BasDisabiltyPreSaveDAO.deleteTempDisablePre");
	}
	
	public List<EgovMap> selectErrorList(){
		return sqlSession.selectList("BasDisabiltyPreSaveDAO.selectErrorList");
	}
	
	public List<EgovMap> selectExcelTempList(){
		return sqlSession.selectList("BasDisabiltyPreSaveDAO.selectExcelTempList");
	}
	
	public void confirmDisablePre(EgovMap param){
		sqlSession.insert("BasDisabiltyPreSaveDAO.confirmDisablePre", param);
	}
	
	public void deleteDisablePre(String delyyyymm){
		sqlSession.delete("BasDisabiltyPreSaveDAO.deleteDisablePre",delyyyymm);
	}
}	
