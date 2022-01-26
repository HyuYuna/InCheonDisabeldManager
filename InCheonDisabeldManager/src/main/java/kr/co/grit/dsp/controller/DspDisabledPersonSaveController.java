package kr.co.grit.dsp.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import kr.co.grit.common.service.CommonCodeService;
import kr.co.grit.common.util.FileUtil;
import kr.co.grit.common.util.SessionUtil;
import kr.co.grit.dsp.service.DspDisabledPersonSaveService;

/**
 * 이용장애인 등록
 * @author JJS
 */
@Controller
public class DspDisabledPersonSaveController {
	
   /**
	* 로그 선언
	*/
	private static final Logger LOGEER = LoggerFactory.getLogger(DspDisabledPersonSaveController.class);
	
	/**
	 * 코드 서비스 선언
	 */
	@Resource(name = "commonCodeService")
	private transient CommonCodeService commonCodeService;
	
	/**
	 * 서비스 선언
	 */
	@Resource(name="DspDisabledPersonSaveService")
	private transient DspDisabledPersonSaveService disPerSaveService;
	
	
	/**
	 * 이용장애인 등록 화면
	 * @param model
	 * @return 
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/dsp/dspDisabledPersonSave")
	public String dspDisabledPersonSave(Model model) throws Exception{
		
		try {
			Map userInfo 		  = 	(Map) SessionUtil.getRequestAttributes("KSSM.user");
			String userGroupCd    = 	(String)userInfo.get("userGroupCd");            // 로그인 시설userGroup
			
			List<Map> useList              = commonCodeService.searchUse();                   // 사용여부
			List<Map> genderList           = commonCodeService.searchGenderList();            // 성별
			List<Map> bloodTypeList        = commonCodeService.searchBloodTypeList();         // 혈액형
			List<Map> maritalStatsList     = commonCodeService.searchMaritalStatusList();     // 혼인여부
			List<Map> guaranteedList       = commonCodeService.searchGuaranteedList();        // 보장자격
			List<Map> disabledList         = commonCodeService.searchDisableTp();             // 장애유형
			List<Map> disableDreeFgList    = commonCodeService.searchDisableDreeFgList();     // 장애정도
			List<Map> outbreakTimeFg       = commonCodeService.searchOutbreakTimeFg();        // 발생시기
			List<Map> outbreakRsnFg        = commonCodeService.searchOutbreakRsnFg();         // 발생사유
			List<Map> caseManageFgList     = commonCodeService.searchCaseManageFgList();      // 사례관리대상
			List<Map> caseManEndRsnList    = commonCodeService.searchCaseManageEndRsnList();  // 사례종료사유
			
			model.addAttribute("userGroupCd"           , userGroupCd);
			model.addAttribute("useList"               , useList);
			model.addAttribute("genderList"            , genderList);
			model.addAttribute("bloodTypeList"         , bloodTypeList);
			model.addAttribute("maritalStatsList"      , maritalStatsList);
			model.addAttribute("guaranteedList"        , guaranteedList);
			model.addAttribute("disabledList"          , disabledList);
			model.addAttribute("disableDreeFgList"     , disableDreeFgList);
			model.addAttribute("outbreakTimeFg"        , outbreakTimeFg);
			model.addAttribute("outbreakRsnFg"         , outbreakRsnFg);
			model.addAttribute("caseManageFgList"      , caseManageFgList);
			model.addAttribute("caseManEndRsnList"     , caseManEndRsnList);
		} catch(BadSqlGrammarException e) {
			LOGEER.info(e.getMessage());
		}
		
		return "/dsp/dspDisabledPersonSave";
	}
	
	/**
	 * 이용장애인 리스트 조회
	 * @param param
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/dsp/selectDisablePersonList", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody EgovMap selectDisablePersonList(@RequestBody EgovMap param){

		EgovMap result = new EgovMap();
		Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");
		String linkCd         = (String)userInfo.get("linkCd");            // 로그인 시설LINCCODE
		
		param.put("wffcltyCd", linkCd);
		try {
			List<EgovMap> data = disPerSaveService.selectDisablePersonList(param);
			result.put("data", data);
		} catch(BadSqlGrammarException e) {
			LOGEER.info(e.getMessage());
		}
		return result;
	}
	
	
	/**
	 * 이용장애인 저장
	 * @param param
	 * @return
	 * @throws Exception 
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/dsp/saveDisablePersonInfo", method=RequestMethod.POST)
	public @ResponseBody EgovMap saveDisablePersonInfo(MultipartHttpServletRequest mRequest,HttpServletRequest request ) throws Exception {
		EgovMap result = new EgovMap();

		//Session을 이용하여 사용자 정보를 가져온다.
		EgovMap userInfo = (EgovMap) SessionUtil.getRequestAttributes("KSSM.user");
		String userId= (String)userInfo.get("userId");		// 로그인 사용자 ID

		// 이미지정보 Util
		Map<String, Object> mapFile = null;		

		// 이미지정보
		List<MultipartFile> img = mRequest.getFiles("imgFile");

		String disableDataList  =  request.getParameter("disableData");

		JSONParser json = new JSONParser();
		JSONArray dataList = (JSONArray)json.parse(disableDataList);

		// JSONArray Map으로 변환
		Map<String, Object> param = (Map<String, Object>) dataList.get(0);

		String saveMode      = (String)param.get("saveMode");
		String pictureRealNm = (String)param.get("pictureRealNm");
		String dspsnId       = null;
		param.put("register", userId);

		
		if("I".equals(saveMode)){
			dspsnId = disPerSaveService.selectDspsnId();
			param.put("dspsnId", dspsnId);
		}else{
			dspsnId = (String)param.get("dspsnId");
		}
	
		if(img != null){
			for (int i = 0; i < img.size(); i++) {
				CommonsMultipartFile cmf = (CommonsMultipartFile) img.get(i);
				
				// 사진 수정일때
				if(img != null && "U".equals(saveMode)){
					FileUtil.fileDelete("dsp",pictureRealNm,dspsnId);
				}
				
				if(img != null && ("I".equals(saveMode) || "U".equals(saveMode))){
					mapFile = FileUtil.uploadFile("dsp",dspsnId,cmf);
					
					param.put("pictureNm"     , mapFile.get("ORI_FILE_NM"));
					param.put("picturePath"   , mapFile.get("WK_PATH"));
				}
			}
		}
			
		result = disPerSaveService.saveDisablePersonInfo(param);
			
	
		
		return result;
	}
	
	/**
	 * 장애정도 조회
	 * @param param
	 * @return
	 * @throws Exception 
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/dsp/selectDisableGradeList", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody EgovMap selectDisableGradeList(@RequestBody EgovMap param) throws Exception{
		
		EgovMap result = new EgovMap();
		
		String grade = (String)param.get("grade");
		
		// 장애등급
		List<Map> disableGradeList = commonCodeService.searchDisableGrade(grade);   
		result.put("disableGradeList", disableGradeList);
		
		return result;
	}
	
	
	/**
	 * 생년월일 중복체크
	 * @param param
	 * @return
	 */
	@RequestMapping(value = "/dsp/selectencBirthDd", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody EgovMap selectencBirthDd(@RequestBody EgovMap param){
		
		EgovMap result = new EgovMap();
		
		List<EgovMap> data = disPerSaveService.selectencBirthDd(param);   
		result.put("data", data);

		return result;
	}
	
	
}
