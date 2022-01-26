package kr.co.grit.wfc.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


@Repository("WfcInOutViewDAO")
public class WfcInOutViewDAO {
	
	@Resource(name="sqlSessionTemplate")
	private transient SqlSessionTemplate sqlSession;
	
	@SuppressWarnings("rawtypes")
	public List<Map> selectWfcEnextMgmtList(Map param) throws Exception {
		return sqlSession.selectList("WfcInOutViewDAO.selectWfcInOutView", param);
	}
	
	@SuppressWarnings("rawtypes")
	public List<Map> selectWffcltyCodeAB(Map param) throws Exception {
		return sqlSession.selectList("WfcInOutViewDAO.selectWffcltyCodeAB", param);
	}
	
	@SuppressWarnings("rawtypes")
	public List<Map> selectWffcltyCodeC(Map param) throws Exception {
		return sqlSession.selectList("WfcInOutViewDAO.selectWffcltyCodeC", param);
	}
	@SuppressWarnings("rawtypes")
	public List<Map> selectGroupCodeD(Map param) throws Exception {
		return sqlSession.selectList("WfcInOutViewDAO.selectGroupCodeD", param);
	}
}
