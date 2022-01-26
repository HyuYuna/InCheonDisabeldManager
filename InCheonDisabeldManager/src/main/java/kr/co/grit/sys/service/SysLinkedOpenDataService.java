package kr.co.grit.sys.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * @Class Name : SysLinkedOpenDataService.java
 * @Description : SysLinkedOpenData Business class
 * @Modification Information
 *
 */
public interface SysLinkedOpenDataService {
	
	/**
	 * 
	 * @param param
	 * @return
	 * @throws Throwable
	 */
	List<EgovMap> selectLinkOpenDataList(EgovMap param);
   
}
