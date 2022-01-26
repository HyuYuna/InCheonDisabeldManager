package kr.co.grit.sys.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

/**
 * @Class Name : SysAuthMgmtDAO.java
 * @Description : SysAuthMgmt DAO Class
 * @Modification Information
 *
 */
@SuppressWarnings("rawtypes")
@Repository("sysAuthMgmtDAO")
public class SysAuthMgmtDAO {
	
	/**
	 * sql 선언
	 */
	@Resource(name="sqlSessionTemplate")
	private transient SqlSessionTemplate sqlSession;
	
	/**
	 * constructor
	 */
	public SysAuthMgmtDAO(){
		// constructor
	}
	
	/**
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */

	public List<Map> searchList(final Map param) {
        return sqlSession.selectList("sysAuthMgmtDAO.searchList", param);
    }
	/**
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */

	public List<Map> searchList2(final Map param) {
        return sqlSession.selectList("sysAuthMgmtDAO.searchList2", param);
    }
	/**
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
    
    public void updateSysAuthMgmt(final Map param)  {
    	sqlSession.insert("sysAuthMgmtDAO.updateSysAuthMgmt", param);
    }
	/**
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */

    public void deleteSysAuthMgmt(final Map param) {
    	sqlSession.delete("sysAuthMgmtDAO.deleteSysAuthMgmt", param);
    }
}
