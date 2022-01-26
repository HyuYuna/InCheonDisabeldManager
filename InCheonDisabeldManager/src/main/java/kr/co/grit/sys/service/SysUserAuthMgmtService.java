package kr.co.grit.sys.service;

import java.util.List;
import java.util.Map;

/**
 * @Class Name : SysUserAuthMgmtService.java
 * @Description : SysUserAuthMgmt Business class
 * @Modification Information
 *
 */
@SuppressWarnings("rawtypes")
public interface SysUserAuthMgmtService {
	/**
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	List<Map> searchList(Map param);
    
	/**
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
   	List<Map> searchList2(Map param);
    
	/**
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	Map getInfo(Map param);
    
	/**
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
    void add(Map param);
    
	/**
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
    void add2(Map param);
    
	/**
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
    int modify(Map param);
    
	/**
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	int remove(Map param);
    
	/**
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */

	int remove2(Map param);
}
