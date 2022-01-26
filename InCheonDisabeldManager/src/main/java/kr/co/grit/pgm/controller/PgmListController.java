package kr.co.grit.pgm.controller;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.grit.common.service.CommonCodeService;
import kr.co.grit.common.util.SessionUtil;
import kr.co.grit.pgm.service.PgmListService;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class PgmListController {

	@Resource(name = "commonCodeService")
	private transient CommonCodeService commonCodeService;
	
	@Resource(name = "PgmListService")
	private transient PgmListService pgmListService;
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/pgm/pgmList")
	public String pgmOpStsReg(Model model, HttpServletRequest request, Map<String, Object> param) throws Exception{
				
			Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");
			String linkCd = (String)userInfo.get("linkCd");            // 로그인 시설LINCCODE
			String userGroupCd         = (String)userInfo.get("userGroupCd");            // 로그인 시설userGroupCd		
				param.put("linkCd"   , linkCd);
				
			List<Map> searchLclasView = pgmListService.searchLclasView(param);
			List<Map> selectFacOp 	  = commonCodeService.selectFacOp();
			List<Map> orgnzCodeList  = pgmListService.selectOrgnzCodeD(param);
			
			model.addAttribute("linkCd", linkCd);
			model.addAttribute("userGroupCd", userGroupCd);
			model.addAttribute("orgnzCodeList", orgnzCodeList);
			model.addAttribute("selectFacOp"		, selectFacOp);
			model.addAttribute("searchLclasView"	,searchLclasView);
			
		return "/pgm/pgmList";
	}
	
	/* 프로그램 관리 조회 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/pgm/pgmViewGrid1", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map pgmMgmtGrid1(@RequestBody Map<String, Object> param, Model model,  HttpServletRequest request ) throws Exception{
		
		Map<String, Object> result = new ConcurrentHashMap<String, Object>();
		
		List<Map> list = pgmListService.selectProgramView(param);
		
		result.put("data", list);

		return result;
	}
	
	// 대분류코드 조회
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/pgm/selectLclaCdView", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map selectLclaCdList(@RequestBody Map<String, String> param,
			Model model, HttpServletRequest request, HttpSession session) throws Exception {

			Map<String, Object> result = new ConcurrentHashMap<String, Object>();

			List<Map> data = pgmListService.searchLclasView(param);
			
			result.put("data", data);

			return result;
		}
	
	// 중분류코드 조회
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/pgm/selectMclaCdView", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map selectMclaCdList(@RequestBody Map<String, String> param,
			Model model, HttpServletRequest request, HttpSession session) throws Exception {

			Map<String, Object> result = new ConcurrentHashMap<String, Object>();
			
			Map userInfo  = (Map) SessionUtil.getRequestAttributes("KSSM.user");
			String linkCd = (String)userInfo.get("linkCd");
			param.put("linkCd", linkCd);

			List<Map> data = pgmListService.searchMclasView(param);
			result.put("data", data);

			return result;
		}
	
	// 소분류코드 조회
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/pgm/selectSclaCdView", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map selectSclaCdList(@RequestBody Map<String, String> param,
			Model model, HttpServletRequest request, HttpSession session) throws Exception {

				Map<String, Object> result = new ConcurrentHashMap<String, Object>();
				
				Map userInfo  = (Map) SessionUtil.getRequestAttributes("KSSM.user");
				String linkCd = (String)userInfo.get("linkCd");
				param.put("linkCd", linkCd);

				List<Map> data = pgmListService.searchSclasView(param);
				result.put("data", data);

				return result;
			}
	
	// 사진 조회
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/pgm/selectPmgPic", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map selectPmgPic(@RequestBody Map<String, String> param,
			Model model, HttpServletRequest request, HttpSession session) throws Exception {

			Map<String, Object> result = new ConcurrentHashMap<String, Object>();

			List<Map> data = pgmListService.selectPmgPic(param);
				
			result.put("data", data);

			return result;
			}
	
}
