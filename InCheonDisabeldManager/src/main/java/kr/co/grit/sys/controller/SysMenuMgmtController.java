package kr.co.grit.sys.controller;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.grit.common.constants.GritConstants;
import kr.co.grit.common.service.CommonCodeService;
import kr.co.grit.common.util.SessionUtil;
import kr.co.grit.sys.service.SysMenuMgmtService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * @Class Name : SysMenuMgmtController.java
 * @Description : SysMenuMgmt Controller class
 * @Modification Information
 *
 */
@Controller
public class SysMenuMgmtController {
	
	/**
	 * 로그 선언
	 */
	private static final Logger LOGGER = LoggerFactory.getLogger(SysMenuMgmtController.class);
	
	/**
	 * 서비스 선언
	 */
	@Resource(name = "commonCodeService")
	private transient CommonCodeService commonCodeService;
	
	/**
	 * 서비스 선언
	 */
	@Resource(name = "sysMenuMgmtService")
	private transient SysMenuMgmtService sysMenuMgmtService;
	
	/**
	 * constructor
	 */
	public SysMenuMgmtController(){
		// 생성자
	}
	
	/**
	 * 메뉴
	 */
	@RequestMapping("/sys/sysMenuMgmt")
	public final String goPage(final Model model, final HttpServletRequest request) throws Throwable{
		
		
		//List<Map> groupSysList = sysMenuMgmtService.selectGroupSysMenuMgmt();
		List<Map> useList = commonCodeService.searchUse();
		//model.addAttribute("groupSysList", groupSysList);
		model.addAttribute("useList"  , useList);

		return "/sys/sysMenuMgmt";
	}
	
	


	/**
	 * 리스트 조회
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/sys/searchSysMenuMgmt", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map searchList(@RequestBody final Map<String, String> param,
			final Model model, final HttpServletRequest request, final HttpSession session) throws Throwable {

		final EgovMap result = new EgovMap();
		String menuCd;
		menuCd = "SYS002";
		int authIdx;
		authIdx = 0;
		
		//조회 || 신규 || 저장 || 삭제 || 엑셀
		final String authYn = (String)SessionUtil.getButtonAuth(menuCd, authIdx);
		
		if("N".equals(authYn)) {
			result.put("authCode", authIdx);
			result.put("authError", "Y");
//			System.out.println(authIdx);
			return result;
		}

		final List<Map> data = sysMenuMgmtService.searchList(param);

		result.put("data", data);

		return result;
	}


	/**
	 * 상세 정보 저장
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping("/sys/saveSysMenuMgmt")
	public @ResponseBody Map saveMenu(@RequestBody Map<String, String> param,
			Model model, HttpServletRequest request, HttpSession session) throws Throwable {

		Map<String, Object> result = new ConcurrentHashMap<String, Object>();
		String menuCd = "SYS002";
		int authIdx = 2;
		
		//조회 || 신규 || 저장 || 삭제 || 엑셀
		String authYn = (String)SessionUtil.getButtonAuth(menuCd, authIdx);
		
		if("N".equals(authYn)) {
			result.put("authCode", authIdx);
			result.put("authError", "Y");
			
			return result;
		}

		//Session을 이용하여 사용자 정보를 가져온다.
		Map userInfo = (Map) SessionUtil.getRequestAttributes(GritConstants.USER_SESSION);
		if(userInfo == null) {
			LOGGER.error("!! No user session");
		}
		param.put("register", (String)userInfo.get("userId"));

		int updCount = sysMenuMgmtService.saveMenu(param);

		if(updCount > 0) {
			result.put("rtnCode", "0");
			result.put("message", "정상적으로 작업을 완료하였습니다.");
		} else {
			result.put("rtnCode", "1");
			result.put("message", "작업을 실패하였습니다.");
		}

		return result;
	}
	
	// 상위메뉴 콤보박스 목록 조회
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/sys/searchComboSysMenuMgmt", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map searchCombo(@RequestBody Map<String, String> param,
			Model model, HttpServletRequest request, HttpSession session) throws Throwable {

		//Session을 이용하여 사용자 정보를 가져온다.
		Map userInfo = (Map) SessionUtil.getRequestAttributes(GritConstants.USER_SESSION);
		if(userInfo == null) {
			LOGGER.error("!! No user session");
		}
		param.put("userFgCd", (String)userInfo.get("userFgCd"));
		param.put("userId", (String)userInfo.get("userId"));
		param.put("aspCode",(String)userInfo.get("aspCode"));

		List<Map> list = null;
		if("_MENU_CD".equals(param.get("clsCd"))){//부모를 가진 메뉴조회
			list = sysMenuMgmtService.searchList(param);
		} 

		Map<String, Object> result = new ConcurrentHashMap<String, Object>();
		result.put("rows", list);

		return result;
	}

}
