package kr.co.grit.sys.service;

import java.util.List;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * @Class Name : SysCodeMgmtService.java
 * @Description : SysCodeMgmtService Business class
 * @Modification Information
 *
 */
public interface SysCodeMgmtService {

	/**
	 * 공통코드 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	List<EgovMap> selectSysCodeMgmt(EgovMap param);
	
	/**
	 * 공통코드 저장
	 * @param param
	 * @return
	 * @throws Exception
	 */
	int saveSysCodeMgmt(EgovMap param);
	
}