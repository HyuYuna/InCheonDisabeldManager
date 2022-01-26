package kr.co.grit.sys.service;

import java.util.List;
import java.util.Map;

/**
 * @Class Name : SysMenuMgmtService.java
 * @Description : SysMenuMgmtService Business class
 * @Modification Information
 *
 */
public interface SysMenuMgmtService {
	
	/**
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	List<Map> searchList(Map param);
	
	/**
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	int saveMenu(Map param);

}
