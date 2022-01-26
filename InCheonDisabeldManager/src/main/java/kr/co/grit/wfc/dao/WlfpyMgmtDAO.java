package kr.co.grit.wfc.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


@Repository("WlfpyMgmtDAO")
public class WlfpyMgmtDAO {
	
	@Resource(name="sqlSessionTemplate")
	private transient SqlSessionTemplate sqlSession;
	
	@SuppressWarnings("rawtypes")
	public List<Map> selectWlfpyMgmt(Map param) throws Exception {
		return sqlSession.selectList("WlfpyMgmtDAO.selectWlfpyMgmt", param);
	}
	
	@SuppressWarnings("rawtypes")
	public Map selectWffcltyNm(Map param) throws Exception {
		return sqlSession.selectOne("WlfpyMgmtDAO.selectWffcltyNm", param);
	}
	
	@SuppressWarnings("rawtypes")
	public List<Map> insertWlfpyMgmt(Map param) throws Exception {
		return sqlSession.selectList("WlfpyMgmtDAO.insertWlfpyMgmt", param);
	}
	
	@SuppressWarnings("rawtypes")
	public List<Map> updateWlfpyMgmt(Map param) throws Exception {
		return sqlSession.selectList("WlfpyMgmtDAO.updateWlfpyMgmt", param);
	}
}
