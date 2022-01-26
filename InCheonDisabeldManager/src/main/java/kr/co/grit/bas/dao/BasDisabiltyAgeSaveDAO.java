package kr.co.grit.bas.dao;

import java.util.List;

import javax.annotation.Resource;

import kr.co.grit.bas.vo.BasDisabiltyAgeSaveVO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.util.EgovMap;


@Repository("BasDisabiltyAgeSaveDAO")
public class BasDisabiltyAgeSaveDAO {
	
	/**
	 * resource 선언
	 */
	@Resource(name="sqlSessionTemplate")
	private transient SqlSessionTemplate sqlSession;
	
	
	public void insertDisalbleAge(BasDisabiltyAgeSaveVO excelVo){
		sqlSession.insert("BasDisabiltyAgeSaveDAO.insertDisalbleAge", excelVo);
	}
	
	public void deleteTempDisableAge(){
		sqlSession.delete("BasDisabiltyAgeSaveDAO.deleteTempDisableAge");
	}
	
	public List<EgovMap> selectErrorAgeList() {
		return sqlSession.selectList("BasDisabiltyAgeSaveDAO.selectErrorAgeList");
	}
	
	public List<EgovMap> selectExcelTempAgeList() {
		return sqlSession.selectList("BasDisabiltyAgeSaveDAO.selectExcelTempAgeList");
	}
	
	public void confirmDisableAge(EgovMap param) {
		sqlSession.insert("BasDisabiltyAgeSaveDAO.confirmDisableAge", param);
	}
	
	public void deleteDisableAge(String delyyyymm) {
		sqlSession.delete("BasDisabiltyAgeSaveDAO.deleteDisableAge",delyyyymm);
	}

}	
