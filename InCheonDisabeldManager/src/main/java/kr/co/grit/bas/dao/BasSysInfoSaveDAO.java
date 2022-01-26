package kr.co.grit.bas.dao;

import javax.annotation.Resource;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.util.EgovMap;


/**
 * 
 * @author JJS
 */
@Repository("BasSysInfoSaveDAO")
public class BasSysInfoSaveDAO {
	
	/**
	 * resource 선언
	 */
	@Resource(name="sqlSessionTemplate")
	private transient SqlSessionTemplate sqlSession;

	
	/**
	 * 사용자 수정
	 * @param param
	 * @return
	 */
	public void updateSys(EgovMap param){
		sqlSession.update("BasSysInfoSaveDAO.updateSys", param);
	}

}
