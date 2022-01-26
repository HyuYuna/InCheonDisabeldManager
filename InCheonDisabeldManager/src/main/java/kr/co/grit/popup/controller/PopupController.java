package kr.co.grit.popup.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.grit.bas.service.BasDisabiltyPrintService;
import kr.co.grit.common.controller.CommonLoginController;
import kr.co.grit.common.service.CommonCodeService;
import kr.co.grit.common.service.CommonLoginService;
import kr.co.grit.common.util.SessionUtil;
import kr.co.grit.pgm.service.PgmMgmtService;
import kr.co.grit.popup.service.PopupService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.rte.psl.dataaccess.util.EgovMap;


@Controller
public class PopupController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(CommonLoginController.class);
	
	@Resource(name="PopupService")
	private PopupService popupService;
	
	@Resource(name = "commonCodeService")
	private CommonCodeService commonCodeService;
	
	@Resource(name = "PgmMgmtService")
	private PgmMgmtService pgmMgmtService;
	
	/**
	 * 서비스 선언
	 */
	@Resource(name="BasDisabiltyPrintService")
	private transient BasDisabiltyPrintService disPrintService;
	
	@Resource(name = "commonLoginService")
	private CommonLoginService commonLoginService;

	// 비밀번호 팝업
	@RequestMapping(value = "/pop/changePasswordPop")
	public String basSysInfoMgmt(Model model, HttpServletRequest request) throws Exception{
		return "/pop/changePasswordPop";
	}
	
	// 복지시설 팝업
	@RequestMapping(value = "/pop/searchWffcltyPop")
	public String searchWffcltyPop(Model model, HttpServletRequest request) throws Exception{
		
		List<Map> wffcltyCdList = commonCodeService.searchWffcltyCdList();
		
		model.addAttribute("wffcltyCdList", wffcltyCdList);
		
		return "/pop/searchWffcltyPop";
	}
	
	// 운영단체 팝업
	@RequestMapping(value = "/pop/searchOgnztPop")
	public String searchOgnztPop(Model model, HttpServletRequest request) throws Exception{
		List<Map> ognztCdList = commonCodeService.searchOgnztCdList();
		
		model.addAttribute("ognztCdList", ognztCdList);
		
		return "/pop/searchOgnztPop";
	}
		
	// 조회조건 장애인 팝업
	@RequestMapping(value = "/pop/searchDspsnPop")
	public String searchDspsnPop(Model model, HttpServletRequest request) throws Exception {
		List<Map> dspsnTpList = commonCodeService.selectDspsnTp();

		model.addAttribute("DspsnTpList", dspsnTpList);

		return "/pop/searchDspsnPop";
	}
	
	// 조회조건 장애인 팝업
	@RequestMapping(value = "/pop/searchDspsnPop2")
	public String searchDspsnPop2(Model model, HttpServletRequest request) throws Exception {
		List<Map> dspsnTpList = commonCodeService.selectDspsnTp();

		model.addAttribute("DspsnTpList", dspsnTpList);

		return "/pop/searchDspsnPop2";
	}
		
	/*운영단체 팝업 조회*/
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/pop/searchOgnztList", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map searchOgnztList (@RequestBody Map<String, Object> param,
			Model model, HttpServletRequest request, HttpSession session) throws Exception {	
	
		Map<String, Object> result = new HashMap<String, Object>();
	
		List<Map> list = popupService.searchOgnztList(param);
		
		result.put("data", list);
		return result;
		
	}
	
	/*복지시설 팝업 조회*/
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/pop/searchWffcltyList", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map searchWffcltyList (@RequestBody Map<String, Object> param,
			Model model, HttpServletRequest request, HttpSession session) throws Exception {	
	
		Map<String, Object> result = new HashMap<String, Object>();
	
		List<Map> list = popupService.searchWffcltyList(param);
		
		result.put("data", list);
		return result;
		
	}	
	/*주소 팝업 조회*/
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/pop/jusoPop")
	public String searchjusoPop(Model model, HttpServletRequest request) throws Exception{
		return "/pop/jusoPop";
	}
	
	/*장애인 검색 팝업 조회*/
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/pop/searchDspsnTpList", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map searchDspsnList (@RequestBody Map<String, Object> param,
			Model model, HttpServletRequest request, HttpSession session) throws Exception {	
	
		Map<String, Object> result = new HashMap<String, Object>();
		Map userInfo 			   = (Map) SessionUtil.getRequestAttributes("KSSM.user");
		String linkCd         	   = (String)userInfo.get("linkCd");            // 로그인 시설LINCCODE
		param.put("wffcltyCd"   , linkCd);
		
		List<Map> list = popupService.searchDspsnList(param);
		
		result.put("data", list);
		return result;
		
	}
	
	/*장애인 검색 팝업 조회*/
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/pop/searchDspsnTpList2", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map searchDspsnList2 (@RequestBody Map<String, Object> param,
			Model model, HttpServletRequest request, HttpSession session) throws Exception {	
	
		Map<String, Object> result = new HashMap<String, Object>();
		Map userInfo 			   = (Map) SessionUtil.getRequestAttributes("KSSM.user");
		String linkCd         	   = (String)userInfo.get("linkCd");            // 로그인 시설LINCCODE
		param.put("wffcltyCd"   , linkCd);
		
		List<Map> list = popupService.searchDspsnList2(param);
		
		result.put("data", list);
		return result;
		
	}
	
	/*도서 분류 조회 팝업 화면*/
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/pop/searchLbrryBookCatalogPop")
	public String searchLbrryBookCatalog(Model model, HttpServletRequest request) throws Exception {
		
		return "/pop/searchLbrryBookCatalogPop";
	}
	
	/*도서 유형 조회 팝업 화면*/
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/pop/searchLbrryBookTypePop")
	public String searchLbrryBookTypePop(Model model, HttpServletRequest request) throws Exception {
		
		return "/pop/searchLbrryBookTypePop";
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/pop/searchPgmPop")
	public String searchPgmPop(Model model, HttpServletRequest request) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");
		String linkCd         = (String)userInfo.get("linkCd");            // 로그인 시설LINCCODE
		param.put("linkCd"   , linkCd);
		List<Map> lclassList   = pgmMgmtService.searchLclasList(param); //대분류
		model.addAttribute("lclassList",lclassList);
		return "/pop/searchPgmPop";
	}
	
	
	/*출력팝업*/
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/pop/disabiltyPrint")
	public String disabiltyPrint(Model model, HttpServletRequest request) throws Exception {
		
		return "/pop/disabiltyPrint";
	}
	
	/*개인정보취급방침*/
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/pop/privacyPolicyPop")
	public String privacyPolicy(Model model, HttpServletRequest request) throws Exception {
		Map searchPrsnInfD = commonCodeService.searchPrsnInfD();
		Map searchPrsnInfE = commonCodeService.searchPrsnInfE();
		Map searchPrsnInfF = commonCodeService.searchPrsnInfF();
		Map searchPrsnInfN = commonCodeService.searchPrsnInfN();
		Map searchPrsnInfP = commonCodeService.searchPrsnInfP();
		Map searchPrsnInfT = commonCodeService.searchPrsnInfT();
			
		model.addAttribute("prsnInfD", searchPrsnInfD);
		model.addAttribute("prsnInfE", searchPrsnInfE);
		model.addAttribute("prsnInfF", searchPrsnInfF);
		model.addAttribute("prsnInfN", searchPrsnInfN);
		model.addAttribute("prsnInfP", searchPrsnInfP);
		model.addAttribute("prsnInfT", searchPrsnInfT);
		
	return "/pop/privacyPolicyPop";
	}

	 /**
	 * 장애인 현황 출력 조회 (인천 홈페이지에서 접속)
	 * @param param
	 * @return 
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/pop/incheonHPDisabiltyPrint")
	public String incheonHPDisabiltyPrint(Model model, HttpServletRequest request) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		// 세션에 정보 들어있어야 접속가능하기때문에 관리자 아이디 고정으로 넣어놓음.
		String userId = "E2100002";
		param.put("userId" , userId);

		//세션처리
		LOGGER.debug("세션처리");
   		Map userInfo   = commonLoginService.getUserInfo(param);						 		//사용자 정보 가져옴

		SessionUtil.setRequestAttributes(request, "KSSM.user"			, userInfo);

		
		List<EgovMap> dateList = disPrintService.selectSysDateList();
		model.addAttribute("dateList", dateList);
		
		return "/pop/incheonHPDisabiltyPrint";
	}
}
