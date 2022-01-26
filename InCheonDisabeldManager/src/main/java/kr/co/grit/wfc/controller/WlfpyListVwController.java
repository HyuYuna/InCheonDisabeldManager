package kr.co.grit.wfc.controller;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import kr.co.grit.common.service.CommonCodeService;
import kr.co.grit.common.util.SessionUtil;
import kr.co.grit.wfc.service.WlfpyListVwService;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 보조금 입금 조회
 * @author SYW
 */
@Controller
public class WlfpyListVwController {

 	/**
	 * 공통 서비스 선언
	 */
	@Resource(name = "commonCodeService")
	private transient CommonCodeService commonCodeService;
	
 	/**
	 * 보조금 입급 조회 서비스 선언
	 */
	@Resource(name = "WlfpyListVwService")
	private transient WlfpyListVwService wlfpyVwService;
	

	/**
	 * 보조금 입금 조회 화면
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/wfc/wlfpyListVw")
	public String wlfpyListVw(Model model, HttpServletRequest request) throws Exception{
		
		List<Map> sbspyClsfcList = commonCodeService.searchSbspyClsfcList();
		List<Map> typeGrantList = commonCodeService.searchTypeGrantList();
		List<Map> useFgList     = commonCodeService.searchUse();
		
		model.addAttribute("sbspyClsfcList", sbspyClsfcList);
		model.addAttribute("typeGrantList", typeGrantList);
		model.addAttribute("useFgList", useFgList);
		return "/wfc/wlfpyListVw";
	}
	
	
	/**
	 * 보조금 입금 조회 데이터 조회
	 * 
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/wfc/wlfpyListVwGrid1", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map wfcEnextMgmtGrid1(@RequestBody Map<String, Object> param, Model model,  HttpServletRequest request ) throws Exception{
		
		Map<String, Object> result = new ConcurrentHashMap<String, Object>();
		
		//Session을 이용하여 사용자 정보를 가져온다.
		Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");
		String linkCd = (String)userInfo.get("linkCd");		// 로그인 사용자 ID
        param.put("linkCd", linkCd);
		List<Map> list = wlfpyVwService.selectWlfpyListVw(param);
		
		result.put("data", list);

		return result;
	}
}

