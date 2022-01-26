package kr.co.grit.bas.controller;

import java.util.List;
import java.util.Map;

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
import kr.co.grit.common.service.CommonCodeService;
import kr.co.grit.bas.service.BasGroupListService;

/**
 * 단체조회
 * @author JJS
 */
@Controller
public class BasGroupListController {

	/**
	 * 로그 선언
	 */
	private static final Logger LOGGER = LoggerFactory.getLogger(BasGroupListController.class);
	
	/**
	 * 코드 서비스 선언
	 */
	@Resource(name = "commonCodeService")
	private transient CommonCodeService commonCodeService;
	

	/**
	 * 서비스 선언
	 */
	@Resource(name="BasGroupListService")
	private transient BasGroupListService groupListService;
	
	
	/**
	 * 단체조회 화면
	 * @param model
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/bas/basGroupList")
	public String basGroupList(Model model) throws Exception{
		
		try {
			List<Map> ognztList = commonCodeService.searchOgnztCdList();
			List<Map> facOpList = commonCodeService.selectFacOp();
			
			model.addAttribute("ognztList" , ognztList);
			model.addAttribute("facOpList" , facOpList);
		} catch(BadSqlGrammarException e) {
			LOGGER.info(e.getMessage());
		}
		return "/bas/basGroupList";
	}
	
	
	/**
	 * 단체조회
	 * @param param
	 * @return
	 */
	@RequestMapping(value = "/bas/basGroupSearchList", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody EgovMap selectGroupList(@RequestBody EgovMap param){
		
		EgovMap result = new EgovMap();
		
		try {
			List<EgovMap> data = groupListService.selectGroupList(param);
			result.put("data", data);
		} catch(BadSqlGrammarException e) {
			LOGGER.info(e.getMessage());
		}
		return result;
	}
	
	
}
