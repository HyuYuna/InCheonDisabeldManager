package kr.co.grit.pgm.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


@Repository("PgmListDAO")
public class PgmListDAO {
	
	@Resource(name="sqlSessionTemplate")
	private transient SqlSessionTemplate sqlSession;
	
	@SuppressWarnings("rawtypes")
	public List<Map> selectProgramView(Map param) throws Exception {
		return sqlSession.selectList("PgmListDAO.selectProgramView", param);
	}
	
	@SuppressWarnings("rawtypes")
	public List<Map> searchLclasView(Map param) throws Exception {
		return sqlSession.selectList("PgmListDAO.searchLclasView", param);
	}
	
	@SuppressWarnings("rawtypes")
	public List<Map> searchMclasView(Map param) throws Exception {
		return sqlSession.selectList("PgmListDAO.searchMclasView", param);
	}
	
	@SuppressWarnings("rawtypes")
	public List<Map> searchSclasView(Map param) throws Exception {
		return sqlSession.selectList("PgmListDAO.searchSclasView", param);
	}
	
	@SuppressWarnings("rawtypes")
	public List<Map> selectOrgnzCodeD(Map param) throws Exception {
		return sqlSession.selectList("PgmListDAO.selectOrgnzCodeD", param);
	}
	
	@SuppressWarnings("rawtypes")
	public List<Map> selectPmgPic(Map param) throws Exception {
		return sqlSession.selectList("PgmListDAO.selectPmgPic", param);
	}
}
