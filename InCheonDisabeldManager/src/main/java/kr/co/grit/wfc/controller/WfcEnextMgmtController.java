package kr.co.grit.wfc.controller;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.grit.common.service.CommonCodeService;
import kr.co.grit.common.util.SessionUtil;
import kr.co.grit.wfc.service.WfcEnextMgmtService;

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
 * 복지시설 이용 관리
 * @author SYW
 */
@Controller
public class WfcEnextMgmtController {

	/**
	 * 로그 선언
	 */
	private static final Logger LOGGER = LoggerFactory.getLogger(WfcEnextMgmtController.class);

	/**
	 * 공통코드 선언
	 */
	@Resource(name = "commonCodeService")
	private transient CommonCodeService commonCodeService;
	
	/**
	 * 복지시설 이용 관리 서비스 선언
	 */
	@Resource
	private transient WfcEnextMgmtService wfcExtMgmtService;

	/**
	 * 복지시설 이용 관리 화면
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/wfc/wfcEnextMgmt")
	public String wfcDetailMgmt(Model model, HttpServletRequest request) throws Exception{
		
		
		Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");
		String linkCd = (String)userInfo.get("linkCd");
		String grupCd = (String)userInfo.get("userGroupCd");
		
		List<Map> rsnLvngList = commonCodeService.selectRsnLvng();
		Map fclList 		  =	wfcExtMgmtService.selectFcltyList(linkCd);
		String groupType = wfcExtMgmtService.selectGroupType(linkCd);
		
		model.addAttribute("groupType", groupType);
		model.addAttribute("rsnLvngList", rsnLvngList);
		model.addAttribute("fclList", fclList);
		model.addAttribute("grupCd", grupCd);
		model.addAttribute("linkCd", linkCd);
			
		return "/wfc/wfcEnextMgmtA";
	}
	
	/**
	 * 복지시설 이용 관리 리스트 조회
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/wfc/WfcEnextMgmtGrid1", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map wfcEnextMgmtGrid1(@RequestBody Map<String, Object> param, Model model,  HttpServletRequest request ) throws Exception{
		
		Map<String, Object> result = new ConcurrentHashMap<String, Object>();
		Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");
		String linkCd = (String)userInfo.get("linkCd");
		param.put("linkCd", linkCd);
		//Session을 이용하여 사용자 정보를 가져온다.
		/*Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");*/
		//String loginId= (String)userInfo.get("userId");		// 로그인 사용자 ID
		
		List<Map> list = wfcExtMgmtService.selectEnextMgmtList(param);
		
		result.put("data", list);

		return result;
	}
	
	/**
	 * 복지시설 이용 관리 신규입력 및 수정
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value={"/wfc/saveEnextMgmtA"})
	public @ResponseBody Map saveEnextMgmtA (@RequestBody Map<String, Object> param,
			Model model, HttpServletRequest request, HttpSession session) throws Exception {
		
		Map<String, String> result = new ConcurrentHashMap<String, String>();
		
		//Session을 이용하여 사용자 정보를 가져온다.
		Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");
		String userId= (String)userInfo.get("userId");		// 로그인 사용자 ID

		param.put("register", userId);
		
		try {
			result = wfcExtMgmtService.saveEnextMgmtA(param);
			
			//result.put("rtnCode", "0");
			//result.put("message", "정상적으로 저장 되었습니다");
		} catch(BadSqlGrammarException e){
			result.put("rtnCode", "-1");
			result.put("message", "저장에 실패하였습니다.");
			LOGGER.info(e.getMessage());
		}
		
		return result;
	}
	
	/**
	 * 이용장애인 AJAX 조회
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/wfc/searchAjaxDspsn", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map searchAjaxDspsn(@RequestBody Map<String, Object> param, Model model,  HttpServletRequest request ) throws Exception{
		
		Map<String, Object> result = new ConcurrentHashMap<String, Object>();
		
		//Session을 이용하여 사용자 정보를 가져온다.
		/*Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");*/
		//String loginId= (String)userInfo.get("userId");		// 로그인 사용자 ID
		
		List<Map> list = wfcExtMgmtService.selectAjaxDspsn(param);
		
		result.put("data", list);

		return result;
	}
	
	/**
	 * 장애인 중복 체크
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/wfc/selectCheckDspsn", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map selectCheckDspsn(@RequestBody Map<String, Object> param, Model model,  HttpServletRequest request ) throws Exception{
		
		Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");
		Map<String, Object> result = new ConcurrentHashMap<String, Object>();
		
		String linkCd = (String)userInfo.get("linkCd");
		param.put("wffcltyCd", linkCd);
		
		List<Map> list = wfcExtMgmtService.selectCheckDspsn(param);
		
		result.put("data", list);

		return result;
	}
	
	/**
	 * 장애인 중복 체크
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/wfc/selectInsertCmprs", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map selectInsertCmprs(@RequestBody Map<String, Object> param, Model model,  HttpServletRequest request ) throws Exception{
		
		Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");
		Map<String, Object> result = new ConcurrentHashMap<String, Object>();
		
		String linkCd = (String)userInfo.get("linkCd");
		param.put("wffcltyCd", linkCd);
		
		int list = wfcExtMgmtService.insertCmprs(param);
		
		result.put("data", list);

		return result;
	}
	
	/**
	 * 장애인 중복 체크
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/wfc/insertCmprs", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map insertCmprs(@RequestBody Map<String, Object> param, Model model,  HttpServletRequest request ) throws Exception{
		
		Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");
		Map<String, Object> result = new ConcurrentHashMap<String, Object>();
		
		String linkCd = (String)userInfo.get("linkCd");
		param.put("wffcltyCd", linkCd);
		
		int list = wfcExtMgmtService.insertCmprs(param);
		
		result.put("data", list);

		return result;
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/wfc/admCmp", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map admCmp(@RequestBody Map<String, Object> param, Model model,  HttpServletRequest request ) throws Exception{
		
		Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");
		Map<String, Object> result = new ConcurrentHashMap<String, Object>();
		
		String linkCd = (String)userInfo.get("linkCd");
		param.put("wffcltyCd", linkCd);
		
		int list = wfcExtMgmtService.admCmp(param);
		
		result.put("data", list);

		return result;
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/wfc/blindHandling", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map blindHandling(@RequestBody Map<String, Object> param, Model model,  HttpServletRequest request ) throws Exception{
		
		Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");
		Map<String, Object> result = new ConcurrentHashMap<String, Object>();
		
		String linkCd = (String)userInfo.get("linkCd");
		param.put("wffcltyCd", linkCd);
		
		int list = wfcExtMgmtService.blindHandling(param);
		
		result.put("data", list);

		return result;
	}
}

