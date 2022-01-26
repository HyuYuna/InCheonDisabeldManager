package kr.co.grit.emp.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


@Repository("EmpWorkerMgmtDAO")
public class EmpWorkerMgmtDAO {
	
	@Resource(name="sqlSessionTemplate")
	private transient SqlSessionTemplate sqlSession;
	
	@SuppressWarnings("rawtypes")
	public List<Map> selectWorkerMgmt(Map param) {
		return sqlSession.selectList("EmpWorkerMgmtDAO.selectWorkerMgmt", param);
	}
	
	@SuppressWarnings("rawtypes")
	public Map selectFcltyType(Map param) {
		return sqlSession.selectOne("EmpWorkerMgmtDAO.selectFcltyType", param);
	}
	@SuppressWarnings("rawtypes")
	public List<Map> selectPosition(Map param) {
		return sqlSession.selectList("EmpWorkerMgmtDAO.selectPosition", param);
	}
	
	@SuppressWarnings("rawtypes")
	public void insertWorkerMgmt(Map param) {
		sqlSession.insert("EmpWorkerMgmtDAO.insertWorkerMgmt", param);
	}
	
	@SuppressWarnings("rawtypes")
	public void updateWorkerMgmt(Map param) {
		sqlSession.insert("EmpWorkerMgmtDAO.updateWorkerMgmt", param);
	}
	
	@SuppressWarnings("rawtypes")
	public Map juminChkCnt(Map param) {
		return sqlSession.selectOne("EmpWorkerMgmtDAO.selectChkCnt", param);
	}
	
	@SuppressWarnings("rawtypes")
	public Map selectKeyValue(Map param) {
		return sqlSession.selectOne("EmpWorkerMgmtDAO.selectKeyValue", param);
	}
	
	@SuppressWarnings("rawtypes")
	public Map selectJuminUse(Map param) {
		return sqlSession.selectOne("EmpWorkerMgmtDAO.selectJuminUse", param);
	}
	
	@SuppressWarnings("rawtypes")
	public void deleteWorker(Map param) {
		sqlSession.selectOne("EmpWorkerMgmtDAO.deleteWorker", param);
	}
}
