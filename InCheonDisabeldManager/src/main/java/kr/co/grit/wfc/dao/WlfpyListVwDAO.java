package kr.co.grit.wfc.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


@Repository("WlfpyListVwDAO")
public class WlfpyListVwDAO {
	
	@Resource(name="sqlSessionTemplate")
	private transient SqlSessionTemplate sqlSession;
	
	@SuppressWarnings("rawtypes")
	public List<Map> selectWlfpyListVw(Map param) throws Exception {
		return sqlSession.selectList("WlfpyListVwDAO.selectWlfpyListVw", param);
	}
}
