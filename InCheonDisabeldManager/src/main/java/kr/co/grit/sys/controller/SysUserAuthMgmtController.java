package kr.co.grit.sys.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.grit.common.util.SessionUtil;
import kr.co.grit.sys.service.SysUserAuthMgmtService;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * @Class Name : SysUserAuthMgmtController.java
 * @Description : SysUserAuthMgmt Controller class
 * @Modification Information
 *
 */
@SuppressWarnings({"rawtypes"})
@Controller
public class SysUserAuthMgmtController {
	

	/**
	 * 서비스 선언
	 */
	@Resource(name = "sysUserAuthMgmtService")
	private transient SysUserAuthMgmtService sysUserAuthMgmtService;
	
	/**
	 * constructor
	 */
	public SysUserAuthMgmtController() {
		// constructor
	}
	
	/**
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/sys/sysUserAuthMgmt")
	public String goSysUserAuthMgmt(final Model model){

		return "sys/sysUserAuthMgmt";
	}

	/**
	 * 목록 조회
	 *
	 * @param param - 조회할 정보가 담긴 param
	 * @return bbsList
	 * @exception Exception
	 */
	@RequestMapping(value = "/sys/searchSysUserAuthMgmt", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map searchList(@RequestBody final Map param,
			final Model model, final HttpServletRequest request) throws Throwable {

		final EgovMap result = new EgovMap();
		String menuCd;
		menuCd = "SYS110";
		int authIdx;
		authIdx = 0;
		
		//조회 || 신규 || 저장 || 삭제 || 엑셀
		final String authYn = (String)SessionUtil.getButtonAuth(menuCd, authIdx);
		
		if("N".equals(authYn)) {
			result.put("authCode", authIdx);
			result.put("authError", "Y");
			
			return result;
		}

		final List<Map> sysUserAuthMgmtList = sysUserAuthMgmtService.searchList(param);
		result.put("data", sysUserAuthMgmtList);

		return result;
	}
	
	/**
	 * 목록 조회
	 * 
	 * @param param - 조회할 정보가 담긴 param
	 * @return bbsList
	 * @exception Exception
	 */
	@RequestMapping(value = "/sys/searchSysUserAuthMgmt2", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map searchList2(@RequestBody final Map param,
			final Model model, final HttpServletRequest request) throws Throwable {

		final EgovMap result = new EgovMap();
		String menuCd;
		menuCd = "SYS110";
		int authIdx;
		authIdx = 0;
		//조회 || 신규 || 저장 || 삭제 || 엑셀
		final String authYn = (String)SessionUtil.getButtonAuth(menuCd, authIdx);
		
		if("N".equals(authYn)) {
			result.put("authCode", authIdx);
			result.put("authError", "Y");
			
			return result;
		}

		final List<Map> sysUserAuthMgmtList = sysUserAuthMgmtService.searchList2(param);
		result.put("data", sysUserAuthMgmtList);

		return result;
	}
	
	/**
	 * 목록 조회
	 *
	 * @param param - 조회할 정보가 담긴 param
	 * @return bbsList
	 * @exception Exception
	 */
	@RequestMapping(value = "/sys/searchSysUserAuthMgmt3", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody final Map searchList3(@RequestBody final Map param,
			final Model model, final HttpServletRequest request) throws Throwable {

		final EgovMap result = new EgovMap();
		String menuCd;
		menuCd = "SYS110";
		int authIdx;
		authIdx = 0;
		//조회 || 신규 || 저장 || 삭제 || 엑셀
		final String authYn = (String)SessionUtil.getButtonAuth(menuCd, authIdx);
		
		if("N".equals(authYn)) {
			result.put("authCode", authIdx);
			result.put("authError", "Y");
			
			return result;
		}

		final Map infoMap = sysUserAuthMgmtService.getInfo(param);
		result.put("data", infoMap);

		return result;
	}

	/**
	 * 
	 * @param param
	 * @param model
	 * @param request
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/sys/modifySysUserAuthMgmt")
	public @ResponseBody Map save(@RequestBody final Object param,
			final Model model, final HttpServletRequest request, final HttpSession session) throws Throwable {

		final EgovMap result = new EgovMap();
		String menuCd;
		menuCd = "SYS110";
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

		final String loginId = (String)userInfo.get("userId");
		final String userFgCd = (String)userInfo.get("userFgCd");

		final List paramList = (List)param;

		String updateGb;
		updateGb = "";
		for(int i = 0; i < paramList.size(); i++){

			final Map outerMap = (Map)paramList.get(i);
			final Map dataMap = (Map)outerMap.get("data");

			dataMap.put("loginId", loginId);
			dataMap.put("userFgCd", userFgCd);

			updateGb = (String)outerMap.get("job");

			if("I".equals(updateGb)){

				//merge
				sysUserAuthMgmtService.add(dataMap);


			}else if ("U".equals(updateGb)){
				
				//merge
				sysUserAuthMgmtService.add(dataMap);
				
				
			}else if("D".equals(updateGb)){

				//권한그룹(SYS_GROUP) 삭제
				sysUserAuthMgmtService.remove(dataMap);

				//권한그룹(SYS_GROUP) 삭제시 해당 권한그룹메뉴(SYS_GROUP_MENU) 삭제
				sysUserAuthMgmtService.remove2(dataMap);
			}

		}


		//향후 메세지 처리 필요 하다
		result.put("rtnCode", "0");
		result.put("message", "정상적으로 저장 되었습니다");


		return result;
	}


	/**
	 * 
	 * @param param
	 * @param model
	 * @param request
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/sys/modifySysUserAuthMgmt2")
	public @ResponseBody Map save2(@RequestBody final Object param,
			final Model model, final HttpServletRequest request, final HttpSession session) throws Throwable {

		final EgovMap result = new EgovMap();
		String menuCd;
		menuCd = "SYS110";
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

		final String loginId = (String)userInfo.get("userId");
		final String userFgCd = (String)userInfo.get("userFgCd");

		final List paramList = (List)param;

		String updateGb = "";

		for(int i = 0; i < paramList.size(); i++){

			final Map outerMap = (Map)paramList.get(i);
			final Map dataMap = (Map)outerMap.get("data");

			dataMap.put("loginId", loginId);
			dataMap.put("userFgCd", userFgCd);

			updateGb = (String)outerMap.get("job");

			if("U".equals(updateGb)){
				//merge
				sysUserAuthMgmtService.add2(dataMap);
			}

		}


		//향후 메세지 처리 필요 하다
		result.put("rtnCode", "0");
		result.put("message", "정상적으로 저장 되었습니다");


		return result;
	}



}
