package kr.co.grit.emp.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


@Repository("EmpWorkerListVwDAO")
public class EmpWorkerListVwDAO {
	
	@Resource(name="sqlSessionTemplate")
	private transient SqlSessionTemplate sqlSession;
	
	@SuppressWarnings("rawtypes")
	public List<Map> selectWorkerMgmt(Map param) {
		return sqlSession.selectList("EmpWorkerListVwDAO.selectWorkerList", param);
	}
	
	@SuppressWarnings("rawtypes")
	public List<Map> selectWorkerHistory(Map param) {
		return sqlSession.selectList("EmpWorkerListVwDAO.selectWorkerHistory", param);
	}
	
	@SuppressWarnings("rawtypes")
	public List<Map> selectOrgnzCodeD(Map param) {
		return sqlSession.selectList("EmpWorkerListVwDAO.selectOrgnzCodeD", param);
	}
}
