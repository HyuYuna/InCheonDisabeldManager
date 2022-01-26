package kr.co.grit.wfc.controller;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import kr.co.grit.common.service.CommonCodeService;
import kr.co.grit.common.util.SessionUtil;
import kr.co.grit.wfc.service.WfcAwaiterViewService;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 시설 예약 조회
 * @author SYW
 */
@Controller
public class WfcAwaiterViewController {

 	/**
	 * 공통 서비스 선언
	 */
	@Resource(name = "commonCodeService")
	private transient CommonCodeService commonCodeService;
	
 	/**
	 * 시설 예약 조회 서비스 선언
	 */
	@Resource
	private transient WfcAwaiterViewService wfcAwterVwService;

	 /**
	 * 시설 예약 조회 화면
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/wfc/wfcAwaiterView")
	public String wfcDetailMgmt(Model model, HttpServletRequest request) throws Exception{
		
		List<Map> progressList = commonCodeService.selectProgress();
		
		model.addAttribute("progressList", progressList);
		
		return "/wfc/wfcAwaiterView";
	}
	
	/**
	 * 복지시설 시설 예약 관리 조회
	 * 
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/wfc/wfcAwaiterViewGrid", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map wfcAwaiterGrid(@RequestBody Map<String, Object> param, Model model,  HttpServletRequest request ) throws Exception{
		
		Map<String, Object> result = new ConcurrentHashMap<String, Object>();
		
		//Session을 이용하여 사용자 정보를 가져온다.
		/*Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");*/
		//String loginId= (String)userInfo.get("userId");		// 로그인 사용자 ID
		Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");
		
		List<Map> list = wfcAwterVwService.selectAwaiterView(param);
		
		result.put("data", list);

		return result;
	}
}

