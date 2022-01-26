package kr.co.grit.sys.service;

import java.util.List;
import java.util.Map;

/**
 * @Class Name : SysAuthMgmtService.java
 * @Description : SysAuthMgmt Business class
 * @Modification Information
 *
 */
public interface SysAuthMgmtService {
	
	/**
	 * 
	 * @param param
	 * @return
	 * @throws Throwable
	 */
    @SuppressWarnings("rawtypes")
	List<Map> searchList(Map param);
    /**
	 * 
	 * @param param
	 * @return
	 * @throws Throwable
	 */
    @SuppressWarnings("rawtypes")
   	List<Map> searchList2(Map param);
    /**
	 * 
	 * @param param
	 * @return
	 * @throws Throwable
	 */

    Map<String, String> saveSysAuthMgmt(List<Map<String, Object>> param);

   
}
