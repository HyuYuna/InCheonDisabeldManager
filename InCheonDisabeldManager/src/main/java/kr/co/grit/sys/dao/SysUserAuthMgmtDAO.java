package kr.co.grit.sys.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

/**
 * @Class Name : SysUserAuthMgmtDAO.java
 * @Description : SysUserAuthMgmt DAO Class
 * @Modification Information
 *
 */

@Repository("sysUserAuthMgmtDAO")
@SuppressWarnings("rawtypes")
public class SysUserAuthMgmtDAO {
	
	/**
	 * sql 선언
	 */
	@Resource(name="sqlSessionTemplate")
	private transient SqlSessionTemplate sqlSession;
	
	/**
	 * constructor
	 */
	public SysUserAuthMgmtDAO(){
		// constructor
	}
	
	/**
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */

	public List<Map> searchList(final Map param){
        return sqlSession.selectList("sysUserAuthMgmtDAO.searchList", param);
    }
	/**
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */

	public List<Map> searchList2(final Map param)  {
        return sqlSession.selectList("sysUserAuthMgmtDAO.searchList2", param);
    }
	/**
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */

	public Map getInfo(final Map param)  {
    	return (Map)sqlSession.selectOne("sysUserAuthMgmtDAO.getInfo", param);
    }
	/**
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */

    public void insert(final Map param) {
    	sqlSession.insert("sysUserAuthMgmtDAO.insert", param);
    }
	/**
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */

    public void insert2(final Map param)  {
    	sqlSession.insert("sysUserAuthMgmtDAO.insert2", param);
    }
	/**
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */

    public int update(final Map param)  {
        return sqlSession.update("sysUserAuthMgmtDAO.update", param);
    }
	/**
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */

    public int delete(final Map param)  {
        return sqlSession.update("sysUserAuthMgmtDAO.delete", param);
    }
	/**
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */

    public int delete2(final Map param)  {
        return sqlSession.update("sysUserAuthMgmtDAO.delete2", param);
    }

}
