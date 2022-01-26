package kr.co.grit.bas.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.util.EgovMap;


@Repository("BasDisabiltyPrintDAO")
public class BasDisabiltyPrintDAO {
	
	@Resource(name="sqlSessionTemplate")
	private transient SqlSessionTemplate sqlSession;
	
	public List<EgovMap> disablePrintList(EgovMap param)
	{
		return sqlSession.selectList("BasDisabiltyPrintDAO.disablePrintList", param);
	}
	
	public List<EgovMap> selectSysDateList(){
		return sqlSession.selectList("BasDisabiltyPrintDAO.selectSysDateList");
	}
	
	public void insertDspsnPopltn(EgovMap param){
		sqlSession.insert("BasDisabiltyPrintDAO.insertDspsnPopltn", param);
	}
	
	public void updateDspsnPopltn(EgovMap param){
		sqlSession.update("BasDisabiltyPrintDAO.updateDspsnPopltn", param);
	}
	
	
	
}
