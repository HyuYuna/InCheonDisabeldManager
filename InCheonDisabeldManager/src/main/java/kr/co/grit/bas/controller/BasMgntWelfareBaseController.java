package kr.co.grit.bas.controller;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.grit.bas.service.BasMgntWelfareBaseService;
import kr.co.grit.common.service.CommonCodeService;
import kr.co.grit.common.util.SessionUtil;

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

/**
 * 복지시설 기초 관리
 * @author SYW
 */
@Controller
public class BasMgntWelfareBaseController {
	
	/**
	 * 로그 선언
	 */
	private static final Logger LOGGER = LoggerFactory.getLogger(BasMgntWelfareBaseController.class);

	/**
	 * 공통코드 선언
	 */
	@Resource(name = "commonCodeService")
	private transient CommonCodeService commonCodeService;
	
	/**
	 * 복지시설 기초관리 서비스 선언
	 */
	@Resource(name = "BasMgntWelfareBaseService")
	private transient BasMgntWelfareBaseService bscwlFcltsService;

	@RequestMapping(value = "/bas/basMgntWelfareBase")
	public String basMgntWelfareBase(Model model, HttpServletRequest request) throws Exception{
		
		final List<Map> useFgList = commonCodeService.searchUse();
		final List<Map> facOpList = commonCodeService.selectFacOp();
		final List<Map> fcltyClsfcList = commonCodeService.selectFcltyClsfc();
		
		model.addAttribute("useFgList"  , useFgList);
		model.addAttribute("facOpList"       , facOpList);
		model.addAttribute("fcltyClsfcList"       , fcltyClsfcList);
		
		return "/bas/basMgntWelfareBase";
	}
	
	/* 복지시설 기초 관리 조회 */
	@RequestMapping(value = "/bas/basMgntWelfareBaseGrid1", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map basMgntWelfareBaseGrid1(@RequestBody EgovMap param, Model model,  HttpServletRequest request ) throws Exception{
		
		Map<String, Object> result = new ConcurrentHashMap<String, Object>();
		
		//Session을 이용하여 사용자 정보를 가져온다.
		/*Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");*/
		//String loginId= (String)userInfo.get("userId");		// 로그인 사용자 ID
		
		List<EgovMap> list = bscwlFcltsService.selectMgntWelfareBase(param);
		
		result.put("data", list);

		return result;
	}
	
	/* 복지시설 신규등록/수정 */
	@RequestMapping(value={"/bas/saveMgntWelfareBase"})
	public @ResponseBody Map saveMgntWelfareBase (@RequestBody EgovMap param,
			Model model, HttpServletRequest request, HttpSession session) throws Exception {
		
		Map<String, Object> result = new ConcurrentHashMap<String, Object>();

		
		//Session을 이용하여 사용자 정보를 가져온다.
		Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");
		String userId= (String)userInfo.get("userId");		// 로그인 사용자 ID

		param.put("register", userId);
		
		try {
			result = bscwlFcltsService.insertMgntWelfareBase(param);
			
			//result.put("rtnCode", "0");
			//result.put("message", "정상적으로 저장 되었습니다");
		} catch(BadSqlGrammarException e){
			result.put("rtnCode", "-1");
			result.put("message", "저장에 실패하였습니다.");
			LOGGER.info(e.getMessage());
		} 
		
		return result;
	}
	//시설유형 셀렉트박스 ajax
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/bas/basTypeFacility", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map basTypeFacility(@RequestBody EgovMap param, Model model,  HttpServletRequest request ) throws Exception{
		
		Map<String, Object> result = new ConcurrentHashMap<String, Object>();
		//Session을 이용하여 사용자 정보를 가져온다.
//		Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");
		//String loginId= (String)userInfo.get("userId");		// 로그인 사용자 ID
		
		List<EgovMap> typeFacility = bscwlFcltsService.selectTypeFacility(param);
		
		
		
		result.put("data", typeFacility);
	
		return result;
	}
	//중복체크
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/bas/basUnqChk", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map basUnqChk(@RequestBody EgovMap param, Model model,  HttpServletRequest request ) throws Exception{
		
		Map<String, Object> result = new ConcurrentHashMap<String, Object>();
		
		int count = bscwlFcltsService.selectUnqChk(param);
		
		result.put("data", count);
	
		return result;
	}
	
	//복지시설 검색
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/bas/WffcltyList", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map wffcltyList(@RequestBody EgovMap param, Model model,  HttpServletRequest request ) throws Exception{
		
		EgovMap result = new EgovMap();
		
		List<EgovMap> wffcltyList = bscwlFcltsService.searchWffcltyList(param);
		
		result.put("data", wffcltyList);
	
		return result;
	}
	
	// 운영시설 검색
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/bas/ognztCdList", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map ognztCdList( @RequestBody EgovMap param, Model model, HttpServletRequest request) throws Exception {

		Map<String, Object> result = new ConcurrentHashMap<String, Object>();

		List<EgovMap> ognztList = bscwlFcltsService.searchOgnztList(param);

		result.put("data", ognztList);

		return result;
	}
	
	
	// 운영시설 검색
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/bas/detailCount", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map detailCount( @RequestBody EgovMap param, Model model, HttpServletRequest request) throws Exception {

		EgovMap result = new EgovMap();

		int detailCnt = bscwlFcltsService.searchDetail(param);

		result.put("data", detailCnt);

		return result;
		}
	
	
	// 복지시설 기초관리 삭제
	@SuppressWarnings("rawtypes")
	@RequestMapping("/bas/deleteWffclty")
	public @ResponseBody Map deleteWffclty( @RequestBody EgovMap param, Model model, HttpServletRequest request) throws Exception {
		EgovMap result = new EgovMap();
		Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");
		String userId= (String)userInfo.get("userId");		// 로그인 사용자 ID
			//메뉴코드 하드코딩
			param.put("menuCd", "BAS003");
			param.put("register", userId);
			param.put("jobFg", "D");
			
		try {
			result = bscwlFcltsService.deleteWffclty(param);
			
		} catch(BadSqlGrammarException e){
			LOGGER.info(e.getMessage());
		} 
		
		return result;
	}
		
	
}

