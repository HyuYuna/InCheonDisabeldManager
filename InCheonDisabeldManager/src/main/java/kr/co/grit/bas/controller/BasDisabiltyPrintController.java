package kr.co.grit.bas.controller;

import java.util.List;

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
import kr.co.grit.bas.service.BasDisabiltyPrintService;
import kr.co.grit.common.util.SessionUtil;


/**
 * 장애인 현황 출력
 * @author JJS
 */
@Controller
public class BasDisabiltyPrintController {
	
	/**
	 * 로그 선언
	 */
	private static final Logger LOGGER = LoggerFactory.getLogger(BasDisabiltyPrintController.class);
	

	/**
	 * 서비스 선언
	 */
	@Resource(name="BasDisabiltyPrintService")
	private transient BasDisabiltyPrintService disPrintService;

	
	/**
	 * 장애인 현황 출력 화면
	 * @param model
	 * @return 
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/bas/basDisabiltyPrint")
	public String basDisabiltyPrint(Model model) throws Exception{
		
		List<EgovMap> dateList = disPrintService.selectSysDateList();
		model.addAttribute("dateList", dateList);
		
		return "/bas/basDisabiltyPrint";
	}
	
	
	/**
	 * 장애인 현황 출력 조회
	 * @param param
	 * @return 
	 */
	@RequestMapping(value = "/bas/disablePrintList", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody EgovMap disablePrintList(@RequestBody EgovMap param){

		EgovMap result = new EgovMap();
		
		try {
			List<EgovMap> data = disPrintService.disablePrintList(param);
			result.put("data", data);
		} catch(BadSqlGrammarException e) {
			LOGGER.info(e.getMessage());
		}
		
		return result;
	}
	

	/**
	 * 장애인 현황 저장
	 * @param param
	 * @return 
	 */
	@RequestMapping(value={"/bas/saveDspsnPopltn"})
	public @ResponseBody EgovMap saveDspsnPopltn (@RequestBody EgovMap param){
		
		EgovMap result = new EgovMap();
		
		EgovMap userInfo = (EgovMap) SessionUtil.getRequestAttributes("KSSM.user");
		String userId= (String)userInfo.get("userId");		// 로그인 사용자 ID
		
		param.put("register", userId);
		
		result = disPrintService.saveDspsnPopltn(param);
		
		return result;
	}
	
	
	
	
}
