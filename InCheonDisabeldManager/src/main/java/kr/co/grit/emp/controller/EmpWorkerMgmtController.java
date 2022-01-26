package kr.co.grit.emp.controller;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.grit.common.service.CommonCodeService;
import kr.co.grit.common.util.SessionUtil;
import kr.co.grit.emp.service.EmpWorkerMgmtService;

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
 * 복지시설 종사자 관리 
 * @author SYW
 */
@Controller
public class EmpWorkerMgmtController {

	/**
	 * 로그 선언
	 */
	private static final Logger LOGGER = LoggerFactory.getLogger(EmpWorkerMgmtController.class);

	/**
	 * 공통 서비스 선언
	 */
	@Resource(name = "commonCodeService")
	private transient CommonCodeService commonCodeService;
	
	/**
	 * 종사자 관리 서비스 선언
	 */
	@Resource(name = "EmpWorkerMgmtService")
	private transient EmpWorkerMgmtService workerMgmtService;
	
	 /**
	 * 종사자 관리 화면
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/emp/empWorkerMgmt")
	public String basSysInfoMgmt(Model model, HttpServletRequest request, Map<String, Object> param) throws Exception{
		Map userInfo 		  = 	(Map) SessionUtil.getRequestAttributes("KSSM.user");
		String linkCd    = 	(String)userInfo.get("linkCd");            // 로그인 시설userGroup
		String userGroupCd    = 	(String)userInfo.get("userGroupCd");            // 로그인 시설userGroup
		
		
		List<Map> useFgList = commonCodeService.searchUse();
		List<Map> disabilityList = commonCodeService.searchDisabilityList();
		//List<Map> positionList = workerMgmtService.selectPosition(fcltyType);
		
		model.addAttribute("linkCd", linkCd);
		model.addAttribute("disabilityList", disabilityList);
		//model.addAttribute("positionList", positionList);
		model.addAttribute("useFgList", useFgList);
		model.addAttribute("userGroupCd",userGroupCd);
		return "/emp/empWorkerMgmt";
	}
	
	 /**
	 * 종사자 관리 Grid 데이터 조회
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/emp/empWorkerMgmtGrid1", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map empWorkerMgmtGrid1(@RequestBody Map<String, Object> param, Model model,  HttpServletRequest request ) throws Exception{
		
		Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");
		Map<String, Object> result = new ConcurrentHashMap<String, Object>();
		
		//Session을 이용하여 사용자 정보를 가져온다.
		/*Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");*/
		//String loginId= (String)userInfo.get("userId");		// 로그인 사용자 ID
		
		List<Map> list = workerMgmtService.selectWorkerMgmt(param);
		
		result.put("data", list);

		return result;
	}
	
	/**
	 * 종사자 신규 등록 및 수정
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value={"/emp/saveWorkerMgmt"})
	public @ResponseBody Map saveMgntWelfareBase (@RequestBody Map<String, Object> param,
			Model model, HttpServletRequest request, HttpSession session) throws Exception {
		
		Map<String, String> result = new ConcurrentHashMap<String, String>();

		
		//Session을 이용하여 사용자 정보를 가져온다.
		Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");
		String userId= (String)userInfo.get("userId");		// 로그인 사용자 ID
		param.put("register", userId);
		
		try {
			result = workerMgmtService.saveWorkerMgmt(param);
			
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
	 * 종사자 관리 종사자이름+생년월일 중복 검사
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/emp/empJuminChk", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map empJuminChk(@RequestBody Map<String, Object> param, Model model,  HttpServletRequest request ) throws Exception{

		Map<String, Object> result = new ConcurrentHashMap<String, Object>();

		Map count = workerMgmtService.juminChkCnt(param);

		result.put("data", count);

		return result;
		}
		
	 /**
	 * 중복체크 후 해당 종사자가 퇴사일 존재 시 테이블에서 데이터 가져오기
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/emp/empKeyValue", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map selectKeyValue(@RequestBody Map<String, Object> param, Model model,  HttpServletRequest request ) throws Exception{
					
		Map<String, Object> result = new ConcurrentHashMap<String, Object>();
					
		Map list = workerMgmtService.selectKeyValue(param);
			
		result.put("data", list);
				
		return result;
		}
		
	 /**
	 * 중복체크 후 퇴사일 없으면 시설값 뿌려주면서 alert띄어주기
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/emp/empJuminUse", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map selectJuminUse(@RequestBody Map<String, Object> param, Model model,  HttpServletRequest request ) throws Exception{
							
		Map<String, Object> result = new ConcurrentHashMap<String, Object>();
							
		Map list = workerMgmtService.selectJuminUse(param);
					
		result.put("data", list);
						
		return result;
		}
	
	/**
	 * 시설 유형 코드 조회
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/emp/empWffcltyTp", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map selectWffcltyTp(@RequestBody Map<String, Object> param, Model model,  HttpServletRequest request ) throws Exception{
							
		Map<String, Object> result = new ConcurrentHashMap<String, Object>();
							
		Map list = workerMgmtService.selectFcltyType(param);
		
		result.put("data", list);
						
		return result;
	}
	
	/**
	 * 시설 유형 코드 조회
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/emp/empPosition", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map selectPosition(@RequestBody Map<String, Object> param, Model model,  HttpServletRequest request ) throws Exception{
							
		Map<String, Object> result = new ConcurrentHashMap<String, Object>();
							
		List<Map> list = workerMgmtService.selectPosition(param);
		
		result.put("data", list);
						
		return result;
	}
	
	
	/**
	 * 종사자 삭제
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/emp/deleteWorker", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map deleteWorker(@RequestBody Map<String, Object> param, Model model,  HttpServletRequest request ) throws Exception{
							
		Map<String, Object> result = new ConcurrentHashMap<String, Object>();
		Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");
		String userId= (String)userInfo.get("userId");		// 로그인 사용자 ID
			//메뉴코드 하드코딩
			param.put("menuCd", "EMP001");
			param.put("register", userId);
			//작업구분 하드코딩
			param.put("jobFg", "D");
		try{					
			result = workerMgmtService.deleteWorker(param);
		} catch(BadSqlGrammarException e){
			e.getMessage();
		}
		return result;
	}
}		
