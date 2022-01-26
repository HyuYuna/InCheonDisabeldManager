package kr.co.grit.wfc.controller;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.grit.common.service.CommonCodeService;
import kr.co.grit.common.util.SessionUtil;
import kr.co.grit.wfc.service.WfcSpclRecordService;

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
 * 이용장애인 특이사항 기록
 * @author SYW
 */
@Controller
public class WfcSpclRecordController {


 	/**
	 * 공통 서비스 선언
	 */
	@Resource(name = "commonCodeService")
	private transient CommonCodeService commonCodeService;
	
 	/**
	 * 이용장애인 특이사항 기록 서비스 선언
	 */
	@Resource(name = "WfcSpclRecordService")
	private transient WfcSpclRecordService wfcSpclRrdService;

	/**
	 * 이용장애인 특이사항 기록 화면
	 * 
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/wfc/wfcSpclRecord")
	public String dpsSpclRecord(Model model, HttpServletRequest request) throws Exception{
		Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");
		String linkCd= (String)userInfo.get("linkCd");		// 로그인 사용자 ID
		
		List<Map> csmnDvsnList = commonCodeService.searchCsmnDvsnFg();
		
		model.addAttribute("linkCd",   			linkCd);
		model.addAttribute("csmnDvsnList",csmnDvsnList);
		
		return "/wfc/wfcSpclRecord";
	}
	
	/**
	 * 이용장애인 리스트 조회
	 * 
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/wfc/selectWfcSpclRecordGrid", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map selectDisablePersonList(@RequestBody Map<String, String> param,
			Model model, HttpServletRequest request, HttpSession session) throws Exception {

		Map<String, Object> result = new ConcurrentHashMap<String, Object>();

		List<Map> data = wfcSpclRrdService.selectWfcSpclRecord(param);

		result.put("data", data);

		return result;
		}
		
	/**
	 * 공격행동 셀렉트박스 AJAX 조회
	 * 
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/wfc/wfcTypeBehavior", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map dpsTypeBehavior(@RequestBody Map<String, Object> param, Model model,  HttpServletRequest request ) throws Exception{
			
		Map<String, Object> result = new ConcurrentHashMap<String, Object>();
		//Session을 이용하여 사용자 정보를 가져온다.
//		Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");
		//String loginId= (String)userInfo.get("userId");		// 로그인 사용자 ID
			
		List<Map> typeBehavior = wfcSpclRrdService.selectTypeBehavior(param);
			
		result.put("data", typeBehavior);
		
		return result;
		}
		
	/**
	 * 이용 장애인 Ajax 조회
	 * 
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/wfc/searchSpclAjaxDspsn", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map searchAjaxDspsn(@RequestBody Map<String, Object> param, Model model,  HttpServletRequest request ) throws Exception{
			
		Map<String, Object> result = new ConcurrentHashMap<String, Object>();
			
		//Session을 이용하여 사용자 정보를 가져온다.
		/*Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");*/
		//String loginId= (String)userInfo.get("userId");		// 로그인 사용자 ID
		
		List<Map> list = wfcSpclRrdService.selectAjaxDspsn(param);
			
		result.put("data", list);

		return result;
		}
		
	/**
	 * 이용 장애인 Ajax 조회2
	 * 
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/wfc/searchSpcAjaxDspsn2", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map searchAjaxDspsn2(@RequestBody Map<String, Object> param, Model model,  HttpServletRequest request ) throws Exception{
			
		Map<String, Object> result = new ConcurrentHashMap<String, Object>();
			
		//Session을 이용하여 사용자 정보를 가져온다.
		/*Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");*/
		//String loginId= (String)userInfo.get("userId");		// 로그인 사용자 ID
			
		List<Map> list = wfcSpclRrdService.selectSpcDspsnId(param);
			
		result.put("data", list);

		return result;
		}
		
	/**
	 * 특이사항 등록 및 수정
	 * 
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value={"/wfc/saveSpclRecord"})
	public @ResponseBody Map saveSpclRecord (@RequestBody Map<String, Object> param,
			Model model, HttpServletRequest request, HttpSession session) throws Exception {
			
		Map<String, String> result = new ConcurrentHashMap<String, String>();
			
		//Session을 이용하여 사용자 정보를 가져온다.
		Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");
		String userId= (String)userInfo.get("userId");		// 로그인 사용자 ID
		String linkCd= (String)userInfo.get("linkCd");		

		param.put("register", userId);
		param.put("linkCd", linkCd);
			
		try {
			result = wfcSpclRrdService.saveWfcSpclRecord(param);
				
			//result.put("rtnCode", "0");
			//result.put("message", "정상적으로 저장 되었습니다");
			} catch(BadSqlGrammarException e){
				result.put("rtnCode", "-1");
				result.put("message", "저장에 실패하였습니다.");
			}
			
			return result;
		}
		
}
