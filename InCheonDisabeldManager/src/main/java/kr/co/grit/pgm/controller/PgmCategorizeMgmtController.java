package kr.co.grit.pgm.controller;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

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
import kr.co.grit.pgm.service.PgmCategorizeMgmtService;


/**
 * 프로그램 분류관리
 * @author JJS
 */
@Controller
public class PgmCategorizeMgmtController {

	/**
	 * 로그 선언
	 */
	private static final Logger LOGGER = LoggerFactory.getLogger(PgmCategorizeMgmtController.class);

	/**
	 * 코드 서비스 선언
	 */
	@Resource(name = "commonCodeService")
	private transient CommonCodeService commonCodeService;
	
	
	/**
	 * 서비스 선언
	 */
	@Resource(name="PgmCategorizeMgmtService")
	private transient PgmCategorizeMgmtService pgmCatMgmtService;
	
	
	/**
	 * 프로그램 분류관리 화면
	 * @param model
	 * @return 
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/pgm/pgmCategorizeMgmt")
	public String pgmCategorizeMgmt(Model model) throws Exception{
		
		EgovMap param = new EgovMap();
		
		try {
			Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");
			String linkCd         = (String)userInfo.get("linkCd");            // 로그인 시설LINCCODE
			String userGroupCd    = (String)userInfo.get("userGroupCd");            // 로그인 시설LINCCODE
			param.put("wffcltyCd"   , linkCd);
			param.put("userGroupCd"   , userGroupCd);
			
			
			List<Map> useList = commonCodeService.searchUse();
			
			if("C".equals(userGroupCd)){
				List<EgovMap> wffcltyPgmLList = pgmCatMgmtService.searchLclasList(param);
				List<EgovMap> wffcltyPgmMList = pgmCatMgmtService.searchMclasList(param);
				
				model.addAttribute("wffcltyPgmLclasList"  , wffcltyPgmLList);
				model.addAttribute("wffcltyPgmMclasList"  , wffcltyPgmMList);
				
			}
			model.addAttribute("useList"  , useList);
			model.addAttribute("wffcltyCd"  , linkCd);
			model.addAttribute("userGroupCd"  , userGroupCd);
			
		} catch(BadSqlGrammarException e) {
			LOGGER.info(e.getMessage());
		}
		
		return "/pgm/pgmCategorizeMgmt";
	}
	
	

	/**
	 * 분류리스트 조회
	 * @param param
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/pgm/selectClasList", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody EgovMap selectClasList(@RequestBody EgovMap param) {

		EgovMap result = new EgovMap();
		
		try {
			List<EgovMap> wffcltyPgmLList = pgmCatMgmtService.searchLclasList(param);
			List<EgovMap> wffcltyPgmMList = pgmCatMgmtService.searchMclasList(param);
			
			List<EgovMap> data = pgmCatMgmtService.selectClasList(param);
			result.put("data", data);
			result.put("wffcltyPgmLclasList", wffcltyPgmLList);
			result.put("wffcltyPgmMclasList", wffcltyPgmMList);
			
		} catch(BadSqlGrammarException e) {
			LOGGER.info(e.getMessage());
		}
		
		return result;
	}
	
	/**
	 * 중분류리스트 조회
	 * @param param
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/pgm/searchMclaCdList", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody EgovMap searchMclaCdList(@RequestBody EgovMap param) {

		EgovMap result = new EgovMap();
		
		try {
			List<EgovMap> data = pgmCatMgmtService.searchMclaCdList(param);
			result.put("data", data);
		} catch(BadSqlGrammarException e) {
			LOGGER.info(e.getMessage());
		}
		
		return result;
	}
	
	
	
	/**
	 * 분류 저장
	 * @param param
	 * @return
	 */
	@RequestMapping(value={"/pgm/saveClas"})
	public @ResponseBody EgovMap saveClas (@RequestBody EgovMap param){
		
		EgovMap result = new EgovMap();
		
		//Session을 이용하여 사용자 정보를 가져온다.
		EgovMap userInfo = (EgovMap) SessionUtil.getRequestAttributes("KSSM.user");
		String userId= (String)userInfo.get("userId");		// 로그인 사용자 ID

		param.put("register", userId);
		
		result = pgmCatMgmtService.saveClas(param);
	
		
		return result;
	}
	
	
	// 관리자 대분류 조회
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/pgm/selectLclasCd", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map selectLclasCd(@RequestBody EgovMap param) throws Exception{
		
		EgovMap result = new EgovMap();
			
		List<EgovMap> data = pgmCatMgmtService.searchLclasList(param);
		result.put("data", data);
			
		return result;
	}
	
	// 관리자 대분류 조회
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/pgm/getWffcltyCd", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map getWffcltyCd(@RequestBody EgovMap param) throws Exception{
		
		EgovMap result = new EgovMap();
			
		List<EgovMap> data = pgmCatMgmtService.searchWffcltyCdList(param);
		result.put("data", data);
			
		return result;
	}
	
	// 복지시설 기초관리 삭제
	@SuppressWarnings("rawtypes")
	@RequestMapping("/pgm/deleteClas")
	public @ResponseBody Map deleteClas( @RequestBody EgovMap param, Model model, HttpServletRequest request) throws Exception {
		EgovMap result = new EgovMap();
		Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");
		String userId= (String)userInfo.get("userId");		// 로그인 사용자 ID
			//메뉴코드 하드코딩
			param.put("menuCd", "PGM001");
			param.put("register", userId);
			param.put("jobFg", "D");
			
		try {
			result = pgmCatMgmtService.deleteClas(param);
			
		} catch(BadSqlGrammarException e){
			LOGGER.info(e.getMessage());
		} 
		
		return result;
	}
	
}
