package kr.co.grit.sys.controller;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.grit.common.constants.GritConstants;
import kr.co.grit.common.service.CommonCodeService;
import kr.co.grit.common.util.SessionUtil;
import kr.co.grit.sys.service.SysLinkedOpenDataService;

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
 * @Class Name : SysLinkedOpenDataController.java
 * @Description : SysLinkedOpenData class
 * @Modification Information
 *
 */
@Controller
public class SysLinkedOpenDataController {
	
	/**
	 * 로그 선언
	 */
	private static final Logger LOGGER = LoggerFactory.getLogger(SysLinkedOpenDataController.class);
	
	/**
	 * 서비스 선언
	 */
	@Resource(name = "SysLinkedOpenDataService")
	private transient SysLinkedOpenDataService linOpDaService;
	
	/**
	 * 메뉴
	 */
	@RequestMapping("/sys/sysLinkedOpenData")
	public final String goPage(final Model model, final HttpServletRequest request) throws Throwable{

		return "/sys/sysLinkedOpenData";
	}
	
	/**
	 * 공공데이터 조회
	 * @param param
	 * @return
	 */
	@RequestMapping(value = "/sys/selectLinkOpenDataList", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody EgovMap selectLinkOpenDataList(@RequestBody EgovMap param){

		EgovMap result = new EgovMap();
		
		try {
			List<EgovMap> data = linOpDaService.selectLinkOpenDataList(param);
			result.put("data", data);
		} catch(BadSqlGrammarException e) {
			LOGGER.info(e.getMessage());
		}
		
		return result;
	}


}
