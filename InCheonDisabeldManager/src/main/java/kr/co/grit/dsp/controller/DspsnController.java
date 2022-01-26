package kr.co.grit.dsp.controller;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

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
import kr.co.grit.common.util.SessionUtil;
import kr.co.grit.dsp.service.DspsnInfoService;

/**
 * 장애인조회
 * @author PKH
 */
@Controller
public class DspsnController {

	/**
	 * 로그 선언
	 */
	private static final Logger LOGGER = LoggerFactory.getLogger(DspsnController.class);

	/**
	 * 코드 서비스 선언
	 */
	@Resource(name = "commonCodeService")
	private transient CommonCodeService commonCodeService;

	/**
	 * 서비스 선언
	 */
	@Resource(name="DspsnInfoService")
	private transient DspsnInfoService dspsnInfoService;
	
	/**
	 * constructor
	 */
	public DspsnController() {
		//constructor
		//unnecessaryconstructor : 생성자 없는 경우보다 pmd rule 에 검출 건수가 적음. 제외 권장
	}

	/**
	 * 장애인 조회 화면
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping("/dsp/dspsnInfo")
	public String dspsnInfo(final Model model) throws Exception{
		
		final List<Map> disableTpList   = commonCodeService.searchDisableTp();
		final List<Map> guaranteedList   = commonCodeService.searchGuaranteedList();
		//signaturedeclarethrowsexception : 공통코드의 throws exception 동시 삭제 처리 필요
		
		model.addAttribute("disableTpList",disableTpList);
		model.addAttribute("guaranteedList",guaranteedList);
		
		return "/dsp/dspsnInfo";
	}
	
	/**
	 * 장애인 조회 조회 실행
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/dsp/dspsnInfoList", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map dspsnInfoList(@RequestBody final EgovMap param) {

		final Map<String, Object> result = new ConcurrentHashMap();
		EgovMap userInfo = (EgovMap) SessionUtil.getRequestAttributes("KSSM.user");
		String userGroupCd= (String)userInfo.get("userGroupCd");		// 사용자 그룹코드
		
		// 사용자그룹코드가 C일경우
		if("C".equals(userGroupCd)){
			String linkCd = (String)userInfo.get("linkCd");
			param.put("wffcltyCd", linkCd);
		}
		

		try {
			final List<Map> dspsnInfoList = dspsnInfoService.selectDspsnInfo(param);
			result.put("result","success");
			result.put("dspsnInfoList",dspsnInfoList);
		} catch(BadSqlGrammarException e) {
			result.put("result","exception");
			LOGGER.info(e.getMessage());
		}
		
		return result;
	}
}
