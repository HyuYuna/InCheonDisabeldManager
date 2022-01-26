package kr.co.grit.emp.controller;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import kr.co.grit.common.service.CommonCodeService;
import kr.co.grit.common.util.SessionUtil;
import kr.co.grit.emp.service.EmpWorkerListVwService;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 복지시설 종사자 조회
 * @author SYW
 */
@Controller
public class EmpWorkerListVwController {

 	/**
	 * 공통 서비스 선언
	 */
	@Resource(name = "commonCodeService")
	private transient CommonCodeService commonCodeService;
	
 	/**
	 * 종사자 조회 서비스 선언
	 */
	@Resource
	private transient EmpWorkerListVwService empWrkerVwService;

	/**
	 * 종사자 조회 화면
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/emp/empWorkerListVw")
	public String empWorkerListVw(Model model, Map<String, Object> param, HttpServletRequest request) throws Exception{
		Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");
		String linkCd         = (String)userInfo.get("linkCd");            // 로그인 시설LINCCODE
		String userGroupCd         = (String)userInfo.get("userGroupCd");            // 로그인 시설userGroupCd
		
		param.put("linkCd"   , linkCd);
		
		List<Map> disabilityList = commonCodeService.searchDisabilityList();
		List<Map> orgnzCodeList  = empWrkerVwService.selectOrgnzCodeD(param);
		
		model.addAttribute("linkCd", linkCd);
		model.addAttribute("disabilityList",disabilityList);
		model.addAttribute("userGroupCd", userGroupCd);
		model.addAttribute("orgnzCodeList", orgnzCodeList);
		
		
		return "/emp/empWorkerListVw";
	}
	
	/**
	 * 종사자 Grid 데이터 조회
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/emp/empWorkerListVwGrid1", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map empWorkerListGrid1(@RequestBody Map<String, Object> param, Model model,  HttpServletRequest request ) throws Exception{
		
		Map<String, Object> result = new ConcurrentHashMap<String, Object>();
		
		List<Map> list = empWrkerVwService.selectWorkerList(param);
		
		result.put("data", list);

		return result;
	}
	
	/**
	 * 근무이력 조회
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/emp/empWorkerHistoryGrid2", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map empWorkerHistoryGrid2(@RequestBody Map<String, Object> param, Model model,  HttpServletRequest request ) throws Exception{
		
		Map<String, Object> result = new ConcurrentHashMap<String, Object>();
		
		List<Map> list = empWrkerVwService.selectWorkerHistory(param);
		
		result.put("data", list);

		return result;
	}
}
