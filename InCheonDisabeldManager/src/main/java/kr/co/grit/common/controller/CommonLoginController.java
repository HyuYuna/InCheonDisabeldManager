package kr.co.grit.common.controller;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import kr.co.grit.common.constants.GritConstants;
import kr.co.grit.common.service.CommonLoginService;
import kr.co.grit.common.util.SessionUtil;

/**
 * @Class Name : CommonLoginController.java
 * @Description : CommonLoginController class
 * @Modification Information
 */

@Controller
public class CommonLoginController {

	private static final Logger LOGGER = LoggerFactory.getLogger(CommonLoginController.class);

	@Resource(name = "commonLoginService")
	private CommonLoginService commonLoginService;

	@RequestMapping(value = "/")
	public String goLoginTemp(Model model){
		//return "/common/login";
		return "/common/index";
	}

	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/common/index")
	public String goIndex(Model model, HttpServletRequest request){
		String returnPage = "";
    	String userAgent = request.getHeader("user-agent");
        
        returnPage = "redirect:/common/login";
        
    	String[] mobileos = {"iPhone","iPod","Android","BlackBerry","Windows CE",
    			  "Nokia","Webos","Opera Mini","SonyEricsson","Opera Mobi","IEMobile"};
            //    "Nokia","Webos","Opera Mini","SonyEricsson","Opera Mobi","IEMobile","Chrome"};
	    int j = -1;
	    if(userAgent != null || !"".equals(userAgent)){
	        for(int i = 0 ; i < mobileos.length ; i++){
	            j = userAgent.indexOf(mobileos[i]);
	            if(j > -1){
	                //System.out.println(userAgent);
	                returnPage = "redirect:/common/login";
	            }
	        }
	    }
        

		return returnPage;
	}


	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/common/login")
	public String goLogin(Model model, HttpServletRequest request){
		HttpSession session = request.getSession(true);
		Map userInfo = (Map) SessionUtil.getRequestAttributes(GritConstants.USER_SESSION);

		String returnPage = "";
		if(userInfo == null){
			returnPage = "/common/login";
		} else {
			model.addAttribute("userInfo", userInfo);
			returnPage = "redirect:/common/main";
		}
		return returnPage;
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/common/logout")
	public String goLogout(HttpServletRequest request){
		HttpSession session = request.getSession(true);
		Map userInfo = (Map) SessionUtil.getRequestAttributes(GritConstants.USER_SESSION);

		try {
			this.processLogOut(request);
		} catch (Exception e) {
			LOGGER.error(e.getMessage());
		}

		session.invalidate();
		//return "redirect:/common/login";
		return "redirect:/common/index";
	}

	
	@RequestMapping(value = "/common/psnlInfoAgree2")
	public String goPsnlInfoAgree2(Model model){
		return "common/psnlInfoAgree2";
	}

	

	@RequestMapping(value = "/common/home")
	public String goHome(Model model) throws Exception{
		try {
			//Calendar cal = Calendar.getInstance();
			//int yyyy = cal.get(Calendar.YEAR);
			//int mm = cal.get(Calendar.MONTH) + 1;
			//String yyyymm = String.valueOf(yyyy)+String.valueOf(mm);
			
			Map<String, String> param = new HashMap<String,String>();
			//param.put("yyyymm", yyyymm);
			
			Map<String,Object> result = new HashMap<String, Object>();
			List<Map> data = commonLoginService.searchDisableStatusList();
			model.addAttribute("data", data.get(0));
		} catch(Exception e) {
			LOGGER.info(e.getMessage());
		}
		return "common/home";
	}


	@RequestMapping(value = "/common/loginMemberPwd")
	public String goMstMemberPwd(Model model){

		return "common/loginMemberPwd";
	}


	/**
	 * 로그인 프로세스
	 * @param param - 조회할 정보가 담긴 param
	 * @return
	 * @exception Exception
	 */
	@SuppressWarnings({ "rawtypes", "unused" })
	@RequestMapping(value = "/common/processLogin")
	public @ResponseBody Map processLogin(@RequestBody Map<String, String> param,
			Model model, HttpServletRequest request) throws Exception {

		String clientIp = commonLoginService.getClientIp(request);
		param.put("clientIp", clientIp);


		Map result = commonLoginService.processLogin(param); 
		if("Y".equals(result.get("success"))){
			//세션처리
			LOGGER.debug("세션처리");
			HttpSession session = request.getSession(true);
	   		Map userInfo   = commonLoginService.getUserInfo(param);						 		//사용자 정보 가져옴
	   		List<Map> sysGroupMenu    = commonLoginService.selectSysGroupMenu(userInfo);    	//사용자 메뉴 권한 리스트

			List<Map> sysGroupMenuBtn = commonLoginService.selectSysGroupMenuBtn(userInfo);    	//사용자 메뉴 버튼 권한 리스트

			SessionUtil.setRequestAttributes(request, "KSSM.user"			, userInfo);
			SessionUtil.setRequestAttributes(request, "KSSM.sysGroupMenu"   , sysGroupMenu);

			SessionUtil.setRequestAttributes(request, "KSSM.sysGroupMenuBtn"   , sysGroupMenuBtn);

		
		}

		return result;
	}

	
	/**
	 * 로그아웃 프로세스
	 * @param param - 조회할 정보가 담긴 param
	 * @exception Exception
	 */
	@RequestMapping(value = "/common/processLogOut")
	public @ResponseBody void processLogOut(HttpServletRequest request) throws Exception {

		String clientIp = commonLoginService.getClientIp(request);

		commonLoginService.processLogOut(clientIp);
	}
	
	
	/**
	 * 비밀번호 변경
	 * @param param - 변경할 정보가 담긴 param
	 * @return
	 * @exception Exception
	 */
	@RequestMapping(value = "/common/chageMemberPwd")
	public @ResponseBody EgovMap chageMemberPwd(@RequestBody EgovMap param) {
		
		EgovMap result = new EgovMap();

		result = commonLoginService.chageMemberPwd(param);

		return result;
	}

	

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/common/getPwd")
	public @ResponseBody Map getPwd(@RequestBody Map<String, String> param,
			Model model, HttpServletRequest request, HttpSession session) throws Exception {

		Map messageMap = new HashMap();
		Map result = new HashMap();

		try{
			result.put("message", messageMap);
		} catch(Exception e) {
			LOGGER.error(e.getMessage());
		} finally{}
		return result;
	}
}
