package kr.co.grit.pgm.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.grit.common.service.CommonCodeService;
import kr.co.grit.common.util.SessionUtil;
import kr.co.grit.pgm.service.PgmMgmtService;
import kr.co.grit.pgm.service.PgmOpStsService;

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
public class PgmOpStsController {

	private static final Logger LOGGER = LoggerFactory.getLogger(PgmOpStsController.class);

	@Resource(name = "commonCodeService")
	private CommonCodeService commonCodeService;
	
	@Resource(name = "PgmMgmtService")
	private PgmMgmtService pgmMgmtService;
	
	@Resource(name="PgmOpStsService")
	private PgmOpStsService pgmOpStsService;
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/pgm/pgmOpStsReg")
	public String pgmOpStsReg(Model model, HttpServletRequest request) throws Exception{
		
		try {
			Map<String, Object> param = new HashMap<String, Object>();
			Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");
			String linkCd         = (String)userInfo.get("linkCd");            // 로그인 시설LINCCODE
			param.put("linkCd"   , linkCd);
			List<Map> lclassList   = pgmMgmtService.searchLclasList(param); //대분류
			model.addAttribute("linkCd", linkCd);
			model.addAttribute("lclassList",lclassList);
		} catch(Exception e) {
			LOGGER.info(e.getMessage());
		}
		return "/pgm/pgmOpStsReg";
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/pgm/pgmOpStsRegList", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody EgovMap pgmOpStsRegList(@RequestBody EgovMap param,
			Model model, HttpServletRequest request) throws Exception {

		EgovMap result = new EgovMap();
		
		try {
			List<EgovMap> list = pgmOpStsService.selectPgmOpStsReg(param);
			result.put("result", "success");
			result.put("list", list);
		} catch(Exception e) {
			result.put("result","exception");
			LOGGER.info(e.getMessage());
		}
		
		return result;
	}

	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/pgm/pgmOpStsRegSave", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody EgovMap pgmOpStsRegSave(@RequestBody HashMap<String, ArrayList<Object>> param,
			Model model, HttpServletRequest request, HttpSession session) throws Exception {
		
		EgovMap result = new EgovMap();
		
		try {
			result = pgmOpStsService.savePgmOpStsReg(param);
		} catch(Exception e) {
			result.put("result","exception");
			LOGGER.info(e.getMessage());
		}
		
		return result;
	}
	
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/pgm/pgmOpStsSch")
	public String pgmOpStsSch(Model model, HttpServletRequest request) throws Exception{
		try {
			EgovMap param = new EgovMap();
			Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");
			String userGroupCd = (String)userInfo.get("userGroupCd");
			String linkCd         = (String)userInfo.get("linkCd");            // 로그인 시설LINCCODE
			
			//System.out.println("==userInfo : "+userInfo);
			//System.out.println("==linkCd : "+linkCd);
			
			param.put("linkCd"   , linkCd);
			
			List<Map> lclassList = null;
			List<EgovMap> wffcltyList = null;
			if(userGroupCd.equals("C")) {
				lclassList   = pgmMgmtService.searchLclasList(param);
			}
			if(userGroupCd.equals("D")) {
				wffcltyList = pgmOpStsService.selectWffcltyListD(param);
			}

			model.addAttribute("userGroupCd",userGroupCd);
			model.addAttribute("wffcltyList",wffcltyList);
			model.addAttribute("lclassList",lclassList);
			
		} catch(Exception e) {
			LOGGER.info(e.getMessage());
		}
		return "/pgm/pgmOpStsSch";
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/pgm/selectWffcltyLclaCdList", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map selectWffcltyLclaCdList(@RequestBody Map<String, String> param,
			Model model, HttpServletRequest request, HttpSession session) throws Exception {

		Map<String, Object> result = new HashMap<String, Object>();

		List<Map> data = pgmMgmtService.searchLclasList(param);
		result.put("data", data);

		return result;
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/pgm/selectWffcltyMclaCdList", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map selectWffcltyMclaCdList(@RequestBody Map<String, String> param,
			Model model, HttpServletRequest request, HttpSession session) throws Exception {

		Map<String, Object> result = new HashMap<String, Object>();
		
		String linkCd = (String)param.get("linkCd");
		//System.out.println("==linkCd : "+linkCd);
		if(linkCd==null || linkCd.equals("")) {  //
			Map userInfo  = (Map) SessionUtil.getRequestAttributes("KSSM.user");
			linkCd = (String)userInfo.get("linkCd");
			param.put("linkCd", linkCd);
		}

		List<Map> data = pgmMgmtService.searchMclasList(param);
		result.put("data", data);

		return result;
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/pgm/selectWffcltySclaCdList", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map selectWffcltySclaCdList(@RequestBody Map<String, String> param,
			Model model, HttpServletRequest request, HttpSession session) throws Exception {

		Map<String, Object> result = new HashMap<String, Object>();

		//dev01 작업 케이스가 아니어서 controller 에서 파라미터 셋팅함
		String linkCd = (String)param.get("linkCd");
		//System.out.println("==linkCd : "+linkCd);
		if(linkCd==null || linkCd.equals("")) {  //
			Map userInfo  = (Map) SessionUtil.getRequestAttributes("KSSM.user");
			linkCd = (String)userInfo.get("linkCd");
			param.put("linkCd", linkCd);
		}
		
		List<Map> data = pgmMgmtService.searchSclasList(param);
		result.put("data", data);

		return result;
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/pgm/pgmOpStsSchList", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody EgovMap pgmOpStsSchList(@RequestBody EgovMap param,
			Model model, HttpServletRequest request) throws Exception {

		EgovMap result = new EgovMap();
		
		try {
			List<EgovMap> list = pgmOpStsService.selectPgmOpStsSch(param);
			result.put("result", "success");
			result.put("list", list);
		} catch(Exception e) {
			result.put("result","exception");
			LOGGER.info(e.getMessage());
		}
		
		return result;
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/pgm/pgmOpStsSchChart", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody EgovMap pgmOpStsSchChart(@RequestBody EgovMap param,
			Model model, HttpServletRequest request) throws Exception {

		EgovMap result = new EgovMap();
		
		try {
			List<EgovMap> list = pgmOpStsService.selectPgmOpStsChart(param);
			result.put("result", "success");
			result.put("list", list);
		} catch(Exception e) {
			result.put("result","exception");
			LOGGER.info(e.getMessage());
		}
		
		return result;
	}
	
}
