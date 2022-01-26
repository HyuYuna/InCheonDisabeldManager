package kr.co.grit.bas.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

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

import egovframework.rte.psl.dataaccess.util.EgovMap;
import kr.co.grit.common.service.CommonCodeService;
import kr.co.grit.common.util.SessionUtil;
import kr.co.grit.bas.service.BasSysInfoMgmtService;

/**
 * 사용자관리
 * @author JJS
 */
@Controller
public class BasSysInfoMgmtController {
	
	/**
	 * 로그 선언
	 */
	private static final Logger LOGEER = LoggerFactory.getLogger(BasSysInfoMgmtController.class);
	
	/**
	 * 코드 서비스 선언
	 */
	@Resource(name = "commonCodeService")
	private transient CommonCodeService commonCodeService;
	
	/**
	 * 서비스 선언
	 */
	@Resource(name="BasSysInfoMgmtService")
	private transient BasSysInfoMgmtService basMgmtService;
	
	
	/**
	 * 사용자관리 화면
	 * @param model
	 * @return 
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/bas/basSysInfoMgmt")
	public String basSysInfoMgmt(Model model) throws Exception{
		
		try {
			List<Map> userGroupList = commonCodeService.searchUserGroup();
			List<Map> useList = commonCodeService.searchUse();
			model.addAttribute("userGroupList", userGroupList);
			model.addAttribute("useList"  , useList);
		} catch(BadSqlGrammarException e) {
			LOGEER.info(e.getMessage());
		}
			
		return "/bas/basSysInfoMgmt";
	}
	
	
	/**
	 * 사용자 목록 조회
	 * @param param
	 * @return
	 */
	@RequestMapping(value = "/bas/selectUserList", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody EgovMap searchList(@RequestBody EgovMap param){

		EgovMap result = new EgovMap();
		
		try {
			List<EgovMap> data = basMgmtService.selectUserList(param);
			result.put("data", data);
		} catch(BadSqlGrammarException e) {
			LOGEER.info(e.getMessage());
		}
		
		return result;
	}
	
	/**
	 * 사용자 저장
	 * @param param
	 * @return
	 */
	@RequestMapping(value="/bas/saveSysInfo", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody EgovMap saveSysInfo(@RequestBody EgovMap param) {	
		
		EgovMap result = new EgovMap();
		
		EgovMap userInfo = (EgovMap) SessionUtil.getRequestAttributes("KSSM.user");
		String userId= (String)userInfo.get("userId");		// 로그인 사용자 ID
		
		param.put("register", userId);
		
		result = basMgmtService.saveSysInfo(param);
		
		return result;
	}
	
	
	/**
	 * 사용자 비밀번호 변경
	 * @param param
	 * @return
	 */
	@RequestMapping(value="/bas/changeSysPassword", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody EgovMap changeSysPassword(@RequestBody EgovMap param){
		
		EgovMap result = new EgovMap();
		
		EgovMap userInfo = (EgovMap) SessionUtil.getRequestAttributes("KSSM.user");
		String userId= (String)userInfo.get("userId");		// 로그인 사용자 ID
		
		param.put("register", userId);
		
		result = basMgmtService.changeSysPassword(param);
		
		return result;
	}
	
	/**
	 * 사용자 비밀번호 초기화
	 * @param param
	 * @return
	 */
	@RequestMapping(value="/bas/resetPassword", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody EgovMap resetPassword(@RequestBody EgovMap param){
		
		EgovMap result = new EgovMap();
		
		EgovMap userInfo = (EgovMap) SessionUtil.getRequestAttributes("KSSM.user");
		String userId= (String)userInfo.get("userId");		// 로그인 사용자 ID
		
		param.put("register", userId);
		
		result = basMgmtService.resetPassword(param);
		
		return result;
	}
	
	/**
	 * 단체코드/복지시설코드 조회
	 * @param param
	 * @return
	 */
	@RequestMapping(value = "/bas/searchLinkcdList", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody EgovMap searchLinkcdList(@RequestBody EgovMap param){

		EgovMap result = new EgovMap();
		
		try {
			List<EgovMap> data = basMgmtService.searchLinkcdList(param);
			result.put("data", data);
		} catch(BadSqlGrammarException e) {
			result.put("result","exception");
			LOGEER.info(e.getMessage());
		}
		
		return result;
	}
}
