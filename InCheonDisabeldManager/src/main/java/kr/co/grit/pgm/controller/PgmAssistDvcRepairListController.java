package kr.co.grit.pgm.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
import kr.co.grit.pgm.service.PgmAssistDvcRepairListService;

/**
 * 보장구 수리내역조회
 * @author JJS
 */
@Controller
public class PgmAssistDvcRepairListController {

	/**
	 * 로그 선언
	 */
	private static final Logger LOGEER = LoggerFactory.getLogger(PgmAssistDvcRepairListController.class);

	/**
	 * 코드 서비스 선언
	 */
	@Resource(name = "commonCodeService")
	private transient CommonCodeService commonCodeService;
	
	/**
	 * 서비스 선언
	 */
	@Resource(name="PgmAssistDvcRepairListService")
	private transient PgmAssistDvcRepairListService dvcRepListService;
	
	
	/**
	 * 보장구 수리내역 조회 화면
	 * @param model
	 * @return 
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/pgm/pgmAssistDvcRepairList")
	public String pgmAssistDvcRepairList(Model model, HttpServletRequest request) throws Exception{
		
		EgovMap param = new EgovMap();
		
		try {
			
			EgovMap userInfo = (EgovMap) SessionUtil.getRequestAttributes("KSSM.user");
			
			String userGroupCd   = (String)userInfo.get("userGroupCd");   // 로그인 사용자그룹
			String linkCd        = (String)userInfo.get("linkCd");        // 로그인 시설LINCCODE
			
			if("A".equals(userGroupCd) || "B".equals(userGroupCd) || "E".equals(userGroupCd)){
				List<EgovMap> assDvcRepWffList = dvcRepListService.searchAssDvcRepWffcltyList();
				model.addAttribute("assDvcRepWffcltyList" , assDvcRepWffList);
				
			}else if("D".equals(userGroupCd)){
				param.put("linkCd" , linkCd);
				
				List<EgovMap> assDvcRepWffList = dvcRepListService.searchAssDvcRepWffcltyList2(param);
				model.addAttribute("assDvcRepWffcltyList" , assDvcRepWffList);
			}
			
			List<Map> assistDvcRepList = commonCodeService.searchAssistDvcRepair();
			model.addAttribute("assistDvcRepairList"  , assistDvcRepList);
			model.addAttribute("userGroupCd"  , userGroupCd);
			
		} catch(BadSqlGrammarException e) {
			LOGEER.info(e.getMessage());
		}
		
		return "/pgm/pgmAssistDvcRepairList";
	}
	
	/**
	 * 보장구 수리내역 조회
	 * @param param
	 * @return 
	 */
	@RequestMapping(value = "/pgm/selectAssDcvRepairList", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody EgovMap selectAssDcvRepairList(@RequestBody EgovMap param) {

		EgovMap result = new EgovMap();
		
		try {
			List<EgovMap> data = dvcRepListService.selectAssDcvRepairList(param);
			result.put("data", data);
		} catch(BadSqlGrammarException e) {
			LOGEER.info(e.getMessage());
		}
		
		return result;
	}
	

	
	/**
	 * 조회조건 - 장애인코드
	 * @param param
	 * @return 
	 */
	@RequestMapping(value = "/pgm/searchAssDcvDspsn", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map searchAssDcvDspsn(@RequestBody EgovMap param) {
		
		EgovMap result = new EgovMap();
		
		try {
			List<EgovMap> data = dvcRepListService.searchAssDcvDspsn(param);
			result.put("data", data);
		} catch(BadSqlGrammarException e) {
			LOGEER.info(e.getMessage());
		}
		
		return result;
	}
	
	
	
	
	
}
