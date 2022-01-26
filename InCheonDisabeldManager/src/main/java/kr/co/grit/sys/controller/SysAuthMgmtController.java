package kr.co.grit.sys.controller;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.grit.common.util.SessionUtil;
import kr.co.grit.sys.service.SysAuthMgmtService;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * @Class Name : SysAuthMgmtController.java
 * @Description : SysAuthMgmt Controller class
 * @Modification Information
 *
 */
@Controller
public class SysAuthMgmtController {
	

	
	/**
	 * 서비스 선언
	 */
	@Resource(name = "sysAuthMgmtService")
	private transient SysAuthMgmtService sysAuthMgmtService;
	
	
	/**
	 * constructor
	 */
	public SysAuthMgmtController() {	
		// 생성자
	}
	

	/**
	 * 그룹별 프로그램권한
	 */
	@RequestMapping("/sys/sysAuthMgmt")
	public final String goSysAuthMgmt(){

		return "sys/sysAuthMgmt";
	}
	
	/**
	 * 목록 조회
	 *
	 * @param param - 조회할 정보가 담긴 param
	 * @return bbsList
	 * @exception Exception
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/sys/searchSysAuthMgmt", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map searchList(@RequestBody final Map param,
		final Model model,final HttpServletRequest request) throws Throwable {
		
		final EgovMap result = new EgovMap();
		String menuCd;
		int authIdx;
		menuCd = "SYS003";
		authIdx = 0;
		
		
		
		//조회 || 신규 || 저장 || 삭제 || 엑셀
		final String authYn = (String)SessionUtil.getButtonAuth(menuCd, authIdx);
//		System.out.println("authYn : " + authYn);

		if("N".equals(authYn)) {
			result.put("authCode", authIdx);
			result.put("authError", "Y");
			
			return result;
		}
		
			final List<Map> sysAuthMgmtList = sysAuthMgmtService.searchList(param);
			result.put("data", sysAuthMgmtList);
		
		

		return result;
	}
	
	/**
	 * 권한상세조회
	 *
	 * @param param - 조회할 정보가 담긴 param
	 * @return bbsList
	 * @exception Exception
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/sys/searchSysAuthMgmt2", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody final Map searchList2(@RequestBody final Map param,
			final Model model, final HttpServletRequest request) throws Throwable {

		final EgovMap result = new EgovMap();
		String menuCd;
		menuCd = "SYS003";
		int authIdx;
		authIdx = 0;
		
		
		//조회 || 신규 || 저장 || 삭제 || 엑셀
		final String authYn = (String)SessionUtil.getButtonAuth(menuCd, authIdx);
		if("N".equals(authYn)) {
			result.put("authCode", authIdx);
			result.put("authError", "Y");
			
			return result;
		}

		final List<Map> sysAuthMgmtList = sysAuthMgmtService.searchList2(param);
		result.put("data", sysAuthMgmtList);

		return result;
	}
	
	/**
	 * 저장
	 *
	 * @param param - 조회할 정보가 담긴 param
	 * @return bbsList
	 * @exception Exception
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping("/sys/saveSysAuthMgmt")
	public @ResponseBody Map saveSysAuthMgmt(@RequestBody final List<Map<String, Object>> param,
			final Model model, final HttpServletRequest request, final HttpSession session) throws Throwable {

	
		final EgovMap result = new EgovMap();
		String menuCd;
		menuCd = "SYS003";
		int authIdx;
		authIdx = 2;
		
		//조회 || 신규 || 저장 || 삭제 || 엑셀
		final String authYn = (String)SessionUtil.getButtonAuth(menuCd, authIdx);
		
		if("N".equals(authYn)) {
			result.put("authCode", authIdx);
			result.put("authError", "Y");
			
			return result;
		}

		final Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");
		String userId;
		userId = (String)userInfo.get("userId");
		
		for (int i = 0; i < param.size(); i++) {
			param.get(i).put("register", userId);
		}
		
		Map resultMap = new ConcurrentHashMap();	
		
		resultMap = sysAuthMgmtService.saveSysAuthMgmt(param);

		return resultMap;
	}

}
