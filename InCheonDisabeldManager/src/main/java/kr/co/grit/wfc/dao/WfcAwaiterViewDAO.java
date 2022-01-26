package kr.co.grit.wfc.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


@Repository("WfcAwaiterViewDAO")
public class WfcAwaiterViewDAO {
	
	@Resource(name="sqlSessionTemplate")
	private transient SqlSessionTemplate sqlSession;
	
	@SuppressWarnings("rawtypes")
	public List<Map> selectAwaiterView(Map param) throws Exception {
		return sqlSession.selectList("WfcAwaiterViewDAO.selectWfcAwaiterView", param);
	}
}
