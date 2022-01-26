package kr.co.grit.common.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.grit.common.service.CommonHomeService;
import kr.co.grit.common.util.SessionUtil;


@Controller
public class CommonHomeController {

	private static final Logger LOGGER = LoggerFactory.getLogger(CommonHomeController.class);

	@Resource(name = "commonHomeService")
	private CommonHomeService commonHomeService;

	@RequestMapping(value = "/common/CommonHome")
	public String goCommonHome(Model model){

		return "common/home";
	}

	/**
	 * 홈 정보 목록 조회
	 *
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/common/getHomeData")
	public @ResponseBody Map getHomeData(@RequestBody Map param,
			Model model, HttpServletRequest request) throws Exception {

		//메세지 객체 선언
		Map<String, Object> result = new HashMap<String, Object>();
		Map messageMap = new HashMap();

		try{
			//Session을 이용하여 사용자 정보를 가져온다.
			Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");
			param.put("userId",  (String)userInfo.get("userId"));
			param.put("userFgCd",  (String)userInfo.get("userFgCd"));
			param.put("setCnt",  10);

			param.put("viewFg", "THIS");
			
			param.put("viewFg", "PREV");
			
			List<Map> noticeList = commonHomeService.getHomeNoticeList(param);
			List<Map> referList = commonHomeService.getHomeReferList(param);

			result.put("noticeList", noticeList);
			result.put("referList", referList);

			messageMap.put("errCode", "0");
			messageMap.put("errMsg", "");

			result.put("message", messageMap);

		} catch(Exception e) {
			LOGGER.error(e.getMessage());
		} finally{}

		return result;
	}

}
