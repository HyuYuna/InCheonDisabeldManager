package kr.co.grit.sys.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import kr.co.grit.sys.dao.SysUserAuthMgmtDAO;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @Class Name : SysUserAuthMgmtServiceImpl.java
 * @Description : SysUserAuthMgmt Business Implement class
 * @Modification Information
 *
 */

@Service("sysUserAuthMgmtService")
@Transactional
@SuppressWarnings("rawtypes")
public class SysUserAuthMgmtServiceImpl implements SysUserAuthMgmtService {
	

	
	/**
	 * DAO 선언
	 */
    @Resource(name="sysUserAuthMgmtDAO")
    private transient SysUserAuthMgmtDAO sysUserAuthMgmtDAO;
    
    /**
     * constructor
     */
    public SysUserAuthMgmtServiceImpl(){
    	// constructor
    }

    @Override
	public List<Map> searchList(final Map param){
    	return sysUserAuthMgmtDAO.searchList(param);
    }


	@Override
	public List<Map> searchList2(final Map param){
		return sysUserAuthMgmtDAO.searchList2(param);
	}

	@Override
	public Map getInfo(final Map param){
		return sysUserAuthMgmtDAO.getInfo(param);
	}

	@Override
	public void add(final Map param) {
		sysUserAuthMgmtDAO.insert(param);
	}

	@Override
	public void add2(final Map param) {
		sysUserAuthMgmtDAO.insert2(param);
	}

	@Override
	public int modify(final Map param) {
		return sysUserAuthMgmtDAO.update(param);
	}

	@Override
	public int remove(final Map param)  {
		return sysUserAuthMgmtDAO.delete(param);
	}

	@Override
	public int remove2(final Map param)  {
		return sysUserAuthMgmtDAO.delete2(param);
	}

}
