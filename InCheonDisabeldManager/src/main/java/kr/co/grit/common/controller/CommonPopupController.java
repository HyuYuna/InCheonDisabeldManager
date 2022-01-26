package kr.co.grit.common.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.grit.common.service.CommonPopupService;
import kr.co.grit.common.util.SessionUtil;

@Controller
public class CommonPopupController {

	@Resource(name = "commonPopupService")
	private CommonPopupService commonPopupService;
	
	
	@RequestMapping(value = "/commonPopup/comUserPop")
	public String goComUserPop(Model model){
		
		return "common/popup/comUserPop";
	}
	
	@RequestMapping(value = "/templates/layerAlert")
	public String goLayerAlert(Model model){
		return "templates/layerAlert";
	}
	
	@RequestMapping(value = "/templates/layerConfirm")
	public String goLayerConfirm(Model model){
		return "templates/layerConfirm";
	}

	@RequestMapping(value = "/templates/layerError")
	public String goLayerError(Model model){
		return "templates/layerError";
	}

    
    /**
	 * 사용자정보를 조회한다.
	 * @param param - 조회할 정보가 담긴 Map
	 * @return 사용자 목록
	 * @exception Exception
	 */
    @SuppressWarnings("rawtypes")
	@RequestMapping(value = "/commonPopup/searchUserList", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map searchUserList(@RequestBody Map<String, String> param, 
			Model model, HttpServletRequest request, HttpSession session) throws Exception {
		
		List<Map> list = commonPopupService.searchUserList(param);
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("data", list);

		return result;
	}
    
    @RequestMapping(value = "/commonPopup/excelDownReasonReg")
	public String excelDownReasonReg(Model model){
		
		return "common/excelDownReasonReg";
	}
    @RequestMapping(value = "/commonPopup/saveExcelDownReasonReg")
    public @ResponseBody Map saveExcelDownReasonReg(@RequestBody Map<String, String> param,
			Model model, HttpServletRequest request, HttpSession session) throws Exception {
    	
    	Map<String, Object> result = new HashMap<String, Object>();
		String menuId = (String)param.get("menuId");

		//Session을 이용하여 사용자 정보를 가져온다.
		Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");
		param.put("loginId",  (String)userInfo.get("userId"));
		param.put("userFgCd",  (String)userInfo.get("userFgCd"));
		param.put("grpFgCd", (String)userInfo.get("grpFgCd"));	// 로그인 사용자 권한 (1:시스템관리자, 2:본사사용자, 3:일반사용자)
		
		param.put("userIp", request.getRemoteAddr());

		commonPopupService.saveExcelDownReasonReg(param);

		result.put("rtnCode", "0");
		result.put("message", "정상적으로 저장 되었습니다");

		return result;
    }
}
