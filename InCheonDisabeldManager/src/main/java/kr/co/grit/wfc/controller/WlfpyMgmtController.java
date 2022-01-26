package kr.co.grit.wfc.controller;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.grit.common.service.CommonCodeService;
import kr.co.grit.common.util.SessionUtil;
import kr.co.grit.wfc.service.WlfpyMgmtService;

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
 * 보조금 입금 관리
 * @author SYW
 */
@Controller
public class WlfpyMgmtController {

	/**
	 * 로그 선언
	 */
	private static final Logger LOGGER = LoggerFactory.getLogger(WlfpyMgmtController.class);

	/**
	 * 공통 서비스
	 */
	@Resource(name = "commonCodeService")
	private transient CommonCodeService commonCodeService;
	
	/**
	 * 보조금 입금관리 서비스 선언
	 */
	@Resource(name = "WlfpyMgmtService")
	private transient WlfpyMgmtService wlfpyMgmtService;
	

	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/wfc/wlfpyMgmt")
	public String wfcDetailMgmt(Model model, HttpServletRequest request, Map<String, String> param) throws Exception{
		
		
		Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");
		String linkCd = (String)userInfo.get("linkCd");
		
		param.put("linkCd", linkCd);
		
		List<Map> sbspyClsfcList = commonCodeService.searchSbspyClsfcList();
		List<Map> typeGrantList = commonCodeService.searchTypeGrantList();
		List<Map> useFgList     = commonCodeService.searchUse();
		Map 		wffclty = wlfpyMgmtService.selectWffcltyNm(param);
		
		model.addAttribute("Wffclty", wffclty);
		model.addAttribute("sbspyClsfcList", sbspyClsfcList);
		model.addAttribute("typeGrantList", typeGrantList);
		model.addAttribute("useFgList", useFgList);
		return "/wfc/wlfpyMgmt";
	}
	
	/**
	 * 보조금 입금 리스트 조회
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/wfc/wlfpyMgmtGrid1", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map wfcEnextMgmtGrid1(@RequestBody Map<String, Object> param, Model model,  HttpServletRequest request ) throws Exception{
		
		Map<String, Object> result = new ConcurrentHashMap<String, Object>();
		
		//Session을 이용하여 사용자 정보를 가져온다.
		Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");
		String linkCd = (String)userInfo.get("linkCd");		// 로그인 사용자 ID
        param.put("linkCd", linkCd);
		List<Map> list = wlfpyMgmtService.selectWlfpyMgmt(param);
		
		result.put("data", list);

		return result;
	}
	
	/**
	 * 보조금 입금관리 등록 및 수정
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value={"/wfc/saveWlfpyMgmt"})
	public @ResponseBody Map saveWlfpyMgmt (@RequestBody Map<String, Object> param,
			Model model, HttpServletRequest request, HttpSession session) throws Exception {
		
		Map<String, String> result = new ConcurrentHashMap<String, String>();
		
		//Session을 이용하여 사용자 정보를 가져온다.
		Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");
		String userId= (String)userInfo.get("userId");		// 로그인 사용자 ID
		String linkCd= (String)userInfo.get("linkCd");		

		param.put("register", userId);
		param.put("linkCd", linkCd);
		
		try {
			result = wlfpyMgmtService.saveWlfpyMgmt(param);
			
			//result.put("rtnCode", "0");
			//result.put("message", "정상적으로 저장 되었습니다");
		} catch(BadSqlGrammarException e){
			result.put("rtnCode", "-1");
			result.put("message", "저장에 실패하였습니다.");
			LOGGER.info(e.getMessage());
		}
		
		return result;
	}
	
}

