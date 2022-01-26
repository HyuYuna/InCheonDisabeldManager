package kr.co.grit.wfc.controller;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.grit.common.service.CommonCodeService;
import kr.co.grit.common.util.SessionUtil;
import kr.co.grit.wfc.service.WfcAwaiterService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.jdbc.BadSqlGrammarException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 시설이용예약관리
 * @author SYW
 */
@Controller
public class WfcAwaiterController {

	private static final Logger LOGGER = LoggerFactory.getLogger(WfcAwaiterController.class);
	
	/**
	 * 로그 선언
	 */
	@Resource(name = "commonCodeService")
	private transient CommonCodeService commonCodeService;
	
	/**
	 * 시설이용예약관리 서비스 선언
	 */
	@Resource
	private transient WfcAwaiterService wfcAwaiterService;

	/**
	 * 시설이용예약관리 리스트
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/wfc/wfcAwaiter")
	public String wfcDetailMgmt(Model model, HttpServletRequest request) throws Exception{
		
		Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");
		String linkCd = (String)userInfo.get("linkCd");
		List<Map> progressList = commonCodeService.selectProgress();
		
		model.addAttribute("wffcltyCd", linkCd);
		model.addAttribute("progressList", progressList);
		
		return "/wfc/wfcAwaiter";
	}
	
	/* 복지시설 기초 관리 조회 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/wfc/wfcAwaiterGrid", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map wfcAwaiterGrid(@RequestBody Map<String, Object> param, Model model,  HttpServletRequest request ) throws Exception{
		
		Map<String, Object> result = new ConcurrentHashMap<String, Object>();
		
		//Session을 이용하여 사용자 정보를 가져온다.
		/*Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");*/
		//String loginId= (String)userInfo.get("userId");		// 로그인 사용자 ID
		Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");
		String linkCd = (String)userInfo.get("linkCd");
		param.put("wffcltyCd", linkCd);
		List<Map> list = wfcAwaiterService.selectAwaiter(param);
		
		result.put("data", list);

		return result;
	}
	
	/* 접수 */
	@RequestMapping(value={"/wfc/wfcReceipt"})
	public @ResponseBody Map updateReceipt (@RequestBody Map<String, Object> param,
			Model model, HttpServletRequest request, HttpSession session) throws Exception {
		
		Map<String, String> result = new ConcurrentHashMap<String, String>();
		
		//Session을 이용하여 사용자 정보를 가져온다.
		Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");
		String userId= (String)userInfo.get("userId");		// 로그인 사용자 ID
		
		param.put("register", userId);
		
		try {
			result = wfcAwaiterService.updateReceipt(param);
			
			//result.put("rtnCode", "0");
			//result.put("message", "정상적으로 저장 되었습니다");
		} catch(BadSqlGrammarException e){
			result.put("rtnCode", "-1");
			result.put("message", "저장에 실패하였습니다.");
			LOGGER.info(e.getMessage());
		}
		
		return result;
	}
	
	/* 대기취소 */
	@RequestMapping(value={"/wfc/waitingCancel"})
	public @ResponseBody Map updateWaitingCancel (@RequestBody Map<String, Object> param,
			Model model, HttpServletRequest request, HttpSession session) throws Exception {
		
		Map<String, String> result = new ConcurrentHashMap<String, String>();
		//Session을 이용하여 사용자 정보를 가져온다.
		Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");
		
		String userId= (String)userInfo.get("userId");		// 로그인 사용자 ID
				
		param.put("register", userId);
		
		try {
			result = wfcAwaiterService.updateWating(param);
			
			//result.put("rtnCode", "0");
			//result.put("message", "정상적으로 저장 되었습니다");
		} catch(BadSqlGrammarException e){
			result.put("rtnCode", "-1");
			result.put("message", "저장에 실패하였습니다.");
		}
		
		return result;
	}
}

