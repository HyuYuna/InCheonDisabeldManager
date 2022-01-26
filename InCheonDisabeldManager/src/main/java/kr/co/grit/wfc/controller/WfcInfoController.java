package kr.co.grit.wfc.controller;

import java.util.HashMap;
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

import kr.co.grit.common.service.CommonCodeService;

import kr.co.grit.wfc.service.WfcInfoService;

/**
 * 복지시설 조회
 * @author PKH
 */
@Controller
public class WfcInfoController {

	/**
	 * 로그 선언
	 */
	private static final Logger LOGGER = LoggerFactory.getLogger(WfcInfoController.class);

	/**
	 * 코드 서비스 선언
	 */
	@Resource(name = "commonCodeService")
	private transient CommonCodeService commonCodeService;
	
	/**
	 * 서비스 선언
	 */
	@Resource(name="WfcInfoService")
	private transient WfcInfoService wfcInfoService;

	/**
	 * constructor
	 */
	public WfcInfoController() {
		//constructor
		//unnecessaryconstructor : 생성자 없는 경우보다 pmd rule 에 검출 건수가 적음. 제외 권장
	}
	
	/**
	 * 복지시설 화면
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping("/wfc/wfcInfo")
	public String wfcInfo(final Model model) throws Exception{
		
		try {
			final List<Map> sigunguList   = commonCodeService.selectSigungu(); //시군구
			final List<Map> wffcltyList = commonCodeService.searchWffcltyCdList(); //시설유형
			final List<Map> ownershipList = commonCodeService.searchOwnershipTp(); //시설소유형태
			final List<Map> revenueList = commonCodeService.searchRevenueTp(); //자체수입제원
			//signaturedeclarethrowsexception : 공통코드의 throws exception 동시 삭제 처리 필요
			
			model.addAttribute("sigunguList",sigunguList);
			model.addAttribute("wffcltyList",wffcltyList);
			model.addAttribute("ownershipList",ownershipList);
			model.addAttribute("revenueList",revenueList);
		} catch(BadSqlGrammarException e) {
			LOGGER.info(e.getMessage());
		}
		return "/wfc/wfcInfo";
	}
	
	/**
	 * 복지시설 목록 조회
	 * @param param
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/wfc/wfcInfoList", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map wfcInfoList(@RequestBody final Map<String, String> param) {

		final Map<String, Object> result = new HashMap<String, Object>();
		
		try {
			final List<Map> wfcInfoList = wfcInfoService.selectWfcInfo(param);
			result.put("result","success");
			result.put("wfcInfoList",wfcInfoList);
		} catch(BadSqlGrammarException e) {
			result.put("result","exception");
			LOGGER.info(e.getMessage());
		}
		
		return result;
	}
	
	/**
	 * 복지시설 서비스장애 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/wfc/wfcInfoListDis", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map wfcInfoListDis(@RequestBody final Map<String, String> param) {

		final Map<String, Object> result = new HashMap<String, Object>();
		
		try {
			final List<Map> wfcInfoListDis = wfcInfoService.selectWfcInfoDis(param);
			result.put("result","success");
			result.put("wfcInfoListDis",wfcInfoListDis);
		} catch(BadSqlGrammarException e) {
			result.put("result","exception");
			LOGGER.info(e.getMessage());
		}
		
		return result;
	}
	
}
