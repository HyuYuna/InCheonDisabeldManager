package kr.co.grit.common.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.grit.common.constants.GritConstants;
import kr.co.grit.common.service.CommonLoginService;
import kr.co.grit.common.service.CommonMainService;
import kr.co.grit.common.util.SessionUtil;

@Controller
public class CommonMainController {

	private static final Logger LOGGER = LoggerFactory.getLogger(CommonMainController.class);

	@Resource(name = "commonMainService")
	private CommonMainService commonMainService;
	
	@Resource(name = "commonLoginService")
	private CommonLoginService commonLoginService;

	@RequestMapping(value = "/common/main")
	public String goLayerConfirm(Model model) throws Exception {
		Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");

		if(userInfo == null) {
			return "common/login";
		} else if(userInfo.get("userId") == null) {
			return "common/login";
		} else {
			return "common/main";
		}
	}

    /**
	 *  권한에 따른 메뉴 리스트
	 * @param 조회할 정보가 담긴 Map
	 * @return  메뉴 리스트
	 * @exception Exception
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/common/getUserMenuList")
	public @ResponseBody Map getUserMenuList(Model model, HttpServletRequest request, HttpSession session) throws Exception {

		//메세지 객체 선언
		Map<String, Object> result = new HashMap<String, Object>();
		Map messageMap = new HashMap();

		try{

			Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");

			Map<String, Object> param = new HashMap<String, Object>();
			param.put("userGroupCd", userInfo.get("userGroupCd"));

			param.put("userId", userInfo.get("userId"));
			param.put("userIp", request.getRemoteAddr());

			List<Map> saleDayCusList = commonMainService.getUserMenuList(param);


			messageMap.put("errCode", "0");
			messageMap.put("errMsg", "");

			result.put("data", saleDayCusList);
			result.put("message", messageMap);

		} catch(Exception e) {
			LOGGER.error(e.getMessage());
		} finally{}

		return result;
	}

    /**
	 *  메뉴 작업 로그 등록
	 * @param 등록할 정보가 담긴 Map
	 * @return
	 * @exception Exception
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/common/addUserMenuLog")
	public @ResponseBody Map addUserMenuLog(@RequestBody Map<String, String> param,
			Model model, HttpServletRequest request, HttpSession session) throws Exception {

		Map<String, Object> result = new HashMap<String, Object>();
		Map messageMap = new HashMap();

		try{
			//param.put("userId", (String)session.getAttribute("userId"));
			//param.put("userIp", (String)session.getAttribute("userIp"));

			Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");

			param.put("userId", (String)userInfo.get("userId"));
			param.put("userIp", request.getRemoteAddr());

			//param.put("userId", "snowman");
			//param.put("userIp", "192.168.1.1");

			commonMainService.addUserMenuLog(param);

			messageMap.put("errCode", "0");
			messageMap.put("errMsg", "");

			result.put("message", messageMap);

		} catch(Exception e) {
			LOGGER.error(e.getMessage());
		} finally{}

		return result;
	}

	@RequestMapping(value = "/common/dataView")
	public String goStatusNotice(Model model){

		return "common/dataView";
	}

    @SuppressWarnings("rawtypes")
	@RequestMapping(value = "/common/procDataView", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map procDataView(@RequestBody Map<String, String> param,
			Model model, HttpServletRequest request, HttpSession session) throws Exception {

		String procFgCd = (String)param.get("procFgCd");	// 0 : SELECT , 1 : INSERT , 2 : UPDATE , 3 : DELETE , 4 : PROCEDURE
		Map<String, Object> result = new HashMap<String, Object>();

		if(procFgCd == null || procFgCd.equals("") || procFgCd.equals("SELECT")) {
			List<Map> list = commonMainService.getDataList(param);
			result.put("data", list);
		} else if (procFgCd.equals("INSERT")) {
			commonMainService.addDataInfo(param);
		} else if (procFgCd.equals("UPDATE")) {
			int procCnt = (int)commonMainService.modifyDataInfo(param);
			result.put("data", procCnt);
		} else if (procFgCd.equals("DELETE")) {
			int procCnt = (int)commonMainService.deleteDataInfo(param);
			result.put("data", procCnt);
		} else if (procFgCd.equals("PROCEDURE")) {
			commonMainService.callDataInfo(param);
			result.put("data", param);
		}

		return result;
	}
    
    
    /**
	 * 메인화면 세션
	 * @return
	 * @exception Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/common/userInfo")
	public @ResponseBody Map userInfo(HttpServletRequest request) throws Exception {
		Map<String,Object> result = new HashMap<String, Object>();
		
		/*Map result = (Map) SessionUtil.getRequestAttributes(GritConstants.USER_SESSION);
		
		String clientIp = commonLoginService.getClientIp(request);
		result.put("nowLoginIp", clientIp);*/
		Map param = (Map) SessionUtil.getRequestAttributes(GritConstants.USER_SESSION);
		
		String clientIp = commonLoginService.getClientIp(request);
		param.put("clientIp", clientIp);
		
		result = commonMainService.mainUserInfo(param);

    	return result;
	}
}

