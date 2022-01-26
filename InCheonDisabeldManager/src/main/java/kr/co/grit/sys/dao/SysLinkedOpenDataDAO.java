package kr.co.grit.sys.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * @Class Name : SysAuthMgmtDAO.java
 * @Description : SysAuthMgmt DAO Class
 * @Modification Information
 *
 */
@Repository("SysLinkedOpenDataDAO")
public class SysLinkedOpenDataDAO {
	
	/**
	 * sql 선언
	 */
	@Resource(name="sqlSessionTemplate")
	private transient SqlSessionTemplate sqlSession;
	
	/**
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */

	public List<EgovMap> selectLinkOpenDataOgnztList() {
        return sqlSession.selectList("SysLinkedOpenDataDAO.selectLinkOpenDataOgnztList");
    }
	
	public List<EgovMap> selectLinkOpenDataWffcltyList() {
        return sqlSession.selectList("SysLinkedOpenDataDAO.selectLinkOpenDataWffcltyList");
    }
	
	public List<EgovMap> selectLinkOpenDataProgramList() {
        return sqlSession.selectList("SysLinkedOpenDataDAO.selectLinkOpenDataProgramList");
    }
	
	public List<EgovMap> selectLinkOpenDataWokerList() {
        return sqlSession.selectList("SysLinkedOpenDataDAO.selectLinkOpenDataWokerList");
    }
	
	public List<EgovMap> selectLinkOpenDataDspsnList() {
        return sqlSession.selectList("SysLinkedOpenDataDAO.selectLinkOpenDataDspsnList");
    }
	
}
