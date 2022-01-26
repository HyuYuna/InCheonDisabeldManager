package kr.co.grit.wfc.controller;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.grit.common.service.CommonCodeService;
import kr.co.grit.common.util.SessionUtil;
import kr.co.grit.wfc.service.WfcSpclRecordListVwService;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 이용장애인 특이사항 조회
 * @author SYW
 */
@Controller
public class WfcSpclRecordListVwController {

 	/**
	 * 공통 서비스 선언
	 */
	@Resource(name = "commonCodeService")
	private transient CommonCodeService commonCodeService;
	
 	/**
	 * 특이사항 조회 서비스 선언
	 */
	@Resource(name = "WfcSpclRecordListVwService")
	private transient WfcSpclRecordListVwService wfcRrdVwService;

	/**
	 * 이용장애인 특이사항 조회 화면
	 * 
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/wfc/wfcSpclRecordListVw")
	public String dpsSpclRecord(Model model, HttpServletRequest request) throws Exception{
		Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");
		String linkCd= (String)userInfo.get("linkCd");		// 로그인 사용자 ID
		String userGroupCd= (String)userInfo.get("userGroupCd");		// 로그인 사용자 그룹
		
		List<Map> csmnDvsnList = commonCodeService.searchCsmnDvsnFg();
		
		model.addAttribute("userGroupCd",  userGroupCd);
		model.addAttribute("linkCd",   			linkCd);
		model.addAttribute("csmnDvsnList",csmnDvsnList);
		
		return "/wfc/wfcSpclRecordListVw";
	}
	
	/**
	 * 이용 장애인 리스트 조회
	 * 
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/wfc/selectWfcSpclRecordListVwGrid", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map selectDisablePersonList(@RequestBody Map<String, String> param,
			Model model, HttpServletRequest request, HttpSession session) throws Exception {

		Map<String, Object> result = new ConcurrentHashMap<String, Object>();

		List<Map> data = wfcRrdVwService.selectWfcSpclRecordListVw(param);

		result.put("data", data);

		return result;
	}
	
}
