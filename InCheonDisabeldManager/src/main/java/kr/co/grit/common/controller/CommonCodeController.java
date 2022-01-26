package kr.co.grit.common.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.grit.common.service.CommonCodeService;


/**
 * @Class Name : CommonCodeController.java
 * @Description : CommonCodeController class
 * @Modification Information
 */

@Controller
public class CommonCodeController {

	private static final Logger LOGGER = LoggerFactory.getLogger(CommonCodeController.class);

	@Resource(name = "commonCodeService")
	private CommonCodeService commonCodeService;

	/**
	 * 복지시설 서브코드 :  시설분류 > 시설유형 PKH
	 * @param param
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/common/searchWffcltyCdSubList", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map searchWffcltyCdSubList(@RequestBody Map<String, String> param,
			Model model, HttpServletRequest request, HttpSession session) throws Exception{
		
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			String code = (String) param.get("code");

			switch(code) {
				case "A": code="WF02"; break;
				case "B": code="WF03"; break;
				case "C": code="WF04"; break;
				case "D": code="WF05"; break;
				case "E": code="WF06"; break;
				default : code="WF02"; break;
			}
			List<Map> list = commonCodeService.searchWffcltyCdSubList(code);
			result.put("result", "success");
			result.put("list", list);
		} catch(Exception e) {
			result.put("result", "exception");
			LOGGER.info(e.getMessage());
		}
		return result;
	}
}
