package kr.co.grit.wfc.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


@Repository("WfcAwaiterDAO")
public class WfcAwaiterDAO {
	
	@Resource(name="sqlSessionTemplate")
	private transient SqlSessionTemplate sqlSession;
	
	@SuppressWarnings("rawtypes")
	public List<Map> selectAwaiterList(Map param) throws Exception {
		return sqlSession.selectList("WfcAwaiterDAO.selectWfcAwaiterList", param);
	}
	
	@SuppressWarnings("rawtypes")
	public List<Map> updateReceipt(Map param) throws Exception {
		return sqlSession.selectList("WfcAwaiterDAO.wfcReceipt", param);
	}
	
	@SuppressWarnings("rawtypes")
	public List<Map> updateWating(Map param) throws Exception {
		return sqlSession.selectList("WfcAwaiterDAO.wfcWatingCancel", param);
	}
}
