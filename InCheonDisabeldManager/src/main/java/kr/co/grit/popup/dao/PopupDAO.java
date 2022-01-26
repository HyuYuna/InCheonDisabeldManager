package kr.co.grit.popup.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("PopupDAO")
public class PopupDAO {
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	@SuppressWarnings("rawtypes")
	public List<Map> searchOgnztList(Map param) throws Exception {
		return sqlSession.selectList("PopupDAO.selectOgnztList", param);
	}
	
	@SuppressWarnings("rawtypes")
	public List<Map> searchWffcltyList(Map param) throws Exception {
		return sqlSession.selectList("PopupDAO.selectWffcltyList", param);
	}
	
	@SuppressWarnings("rawtypes")
	public List<Map> searchDspsnList(Map param) throws Exception {
		return sqlSession.selectList("PopupDAO.selectDspsnList", param);
	}
	
	@SuppressWarnings("rawtypes")
	public List<Map> searchDspsnList2(Map param) throws Exception {
		return sqlSession.selectList("PopupDAO.selectDspsnList2", param);
	}
}
