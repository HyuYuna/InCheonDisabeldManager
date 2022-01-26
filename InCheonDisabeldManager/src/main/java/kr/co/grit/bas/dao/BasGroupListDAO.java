package kr.co.grit.bas.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 
 * @author JJS
 */
@Repository("BasGroupListDAO")
public class BasGroupListDAO {
	
	/**
	 * resource 선언
	 */
	@Resource(name="sqlSessionTemplate")
	private transient SqlSessionTemplate sqlSession;

	
	/**
	 * 단체 조회
	 * @param param
	 * @return
	 */
	public List<EgovMap> selectGroupList(EgovMap param){
		return sqlSession.selectList("BasGroupListDAO.selectGroupList", param);
	}

}
