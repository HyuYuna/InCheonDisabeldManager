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
import kr.co.grit.pgm.service.PgmAssistDvcRepairMgmtService;


/**
 * 보장구 수리내역 관리
 * @author JJS
 */
@Controller
public class PgmAssistDvcRepairMgmtController {


	/**
	 * 로그 선언
	 */
	private static final Logger LOGEER = LoggerFactory.getLogger(PgmAssistDvcRepairMgmtController.class);

	/**
	 * 코드 서비스 선언
	 */
	@Resource(name = "commonCodeService")
	private transient CommonCodeService commonCodeService;

	/**
	 * 서비스 선언
	 */
	@Resource(name="PgmAssistDvcRepairMgmtService")
	private transient PgmAssistDvcRepairMgmtService dvcRepMgmtService;
	
	
	
	/**
	 * 보장구 수리내역 관리  화면
	 * @param model
	 * @return 
	 */
	@RequestMapping(value = "/pgm/pgmAssistDvcRepairMgmt")
	public String pgmAssistDvcRepairMgmt(Model model) throws Exception{
		
		try {
			
			Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");
			String linkCd         = (String)userInfo.get("linkCd");            // 로그인 시설LINCCODE
			
			List<Map> useList = commonCodeService.searchUse();
			List<Map> assistDvcRepList = commonCodeService.searchAssistDvcRepair();
			
			model.addAttribute("assistDvcRepairList"  , assistDvcRepList);
			model.addAttribute("useList"  , useList);
			model.addAttribute("wffcltyCd"  , linkCd);
			
		} catch(BadSqlGrammarException e) {
			LOGEER.info(e.getMessage());
		}
		
		return "/pgm/pgmAssistDvcRepairMgmt";
	}
	
	/**
	 * 보장구 수리내역 수리리스트 조회
	 * @param param
	 * @return 
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/pgm/selectAssistDcvRepairList", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody EgovMap selectAssistDcvRepairList(@RequestBody EgovMap param){

		EgovMap result = new EgovMap();
		
		try {
			List<EgovMap> data = dvcRepMgmtService.selectAssistDcvRepairList(param);
			result.put("data", data);
		} catch(BadSqlGrammarException e) {
			LOGEER.info(e.getMessage());
		}
		
		return result;
	}
	
	/**
	 * 보장구 수리내역 저장
	 * @param param
	 * @return 
	 */
	@RequestMapping(value={"/pgm/saveAssistDvcRepair"})
	public @ResponseBody Map saveAssistDvcRepair (@RequestBody EgovMap param) {
		
		EgovMap result = new EgovMap();
		
		//Session을 이용하여 사용자 정보를 가져온다.
		EgovMap userInfo = (EgovMap) SessionUtil.getRequestAttributes("KSSM.user");
		String userId= (String)userInfo.get("userId");		// 로그인 사용자 ID

		param.put("register", userId);
	
		result = dvcRepMgmtService.saveAssistDvcRepair(param);
		
		return result;
	}
	
	
	/**
	 * 조회조건 - 장애인코드 조회
	 * @param param
	 * @return 
	 */
	@RequestMapping(value = "/pgm/searchAssDspsn", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody EgovMap searchAssDspsn(@RequestBody EgovMap param) {
		
		EgovMap result = new EgovMap();
		
		try {
			List<EgovMap> data = dvcRepMgmtService.searchAssDspsn(param);
			result.put("data", data);
		} catch(BadSqlGrammarException e) {
			LOGEER.info(e.getMessage());
		}
		
		return result;
	}
	
	
	/**
	 * 수리정보 - 장애인코드 조회
	 * @param param
	 * @return 
	 */
	@RequestMapping(value = "/pgm/searchAssDspsn2", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody EgovMap searchAssDspsn2(@RequestBody EgovMap param) {

		EgovMap result = new EgovMap();
		
		try {
			List<EgovMap> data = dvcRepMgmtService.searchAssDspsn2(param);
			result.put("data", data);
		} catch(BadSqlGrammarException e) {
			LOGEER.info(e.getMessage());
		}

		return result;
	}
	
	/**
	 * 장애인 중복 체크
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/pgm/selectCheckDspsn", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map selectCheckDspsn(@RequestBody EgovMap param, Model model,  HttpServletRequest request ) throws Exception{
		
		Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");
		Map<String, Object> result = new ConcurrentHashMap<String, Object>();
		
		String linkCd = (String)userInfo.get("linkCd");
		param.put("wffcltyCd", linkCd);
		
		List<EgovMap> list = dvcRepMgmtService.selectDspsnCheck(param);
		
		result.put("data", list);

		return result;
	}
	
	/**
	 * 저장시 중복체크
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/pgm/selectSaveCnt", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map<String, Object> selectSaveCnt(@RequestBody EgovMap param, Model model,  HttpServletRequest request ) throws Exception{
		
		Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");
		Map<String, Object> result = new ConcurrentHashMap<String, Object>();
		
		String linkCd = (String)userInfo.get("linkCd");
		param.put("wffcltyCd", linkCd);
		
		int list = dvcRepMgmtService.selectSaveCnt(param);
		
		result.put("data", list);

		return result;
	}
}
