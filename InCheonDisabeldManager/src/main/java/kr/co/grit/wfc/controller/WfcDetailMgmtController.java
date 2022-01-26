package kr.co.grit.wfc.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
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
import kr.co.grit.wfc.service.WfcDetailService;

/**
 * 복지시설 상세관리
 * @author JJS
 */
@Controller
public class WfcDetailMgmtController {
	
	/**
	 * 로그 선언
	 */
	private static final Logger LOGEER = LoggerFactory.getLogger(WfcDetailMgmtController.class);
	
	
	/**
	 * 코드 서비스 선언
	 */
	@Resource(name = "commonCodeService")
	private transient CommonCodeService commonCodeService;
	
	/**
	 * 서비스 선언
	 */
	@Resource(name="WfcDetailService")
	private transient WfcDetailService wfcDetailService;

	/**
	 * 시설유형
	 *//*
	private static final String A01 = "A01";
	private static final String A02 = "A02";
	private static final String A03 = "A03";
	private static final String A04 = "A04";
	private static final String C01 = "C01";
	private static final String C02 = "C02";
	private static final String C03 = "C03";
	private static final String B01 = "B01";
	private static final String B02 = "B02";
	private static final String B03 = "B03";
	private static final String B04 = "B04";
	private static final String B05 = "B05";
	private static final String B07 = "B07";
	private static final String B08 = "B08";
	private static final String D03 = "D03";
	private static final String D04 = "D04";
	private static final String D05 = "D05";
	private static final String D06 = "D06";*/
	private static final String C = "C";
	private static final String E = "E";
	
	/**
	 * 상태값
	 */
	private static final String INSERT = "I";
	private static final String UPDATE = "U";
	private static final String DELETE = "D";
	
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/wfc/wfcDetailMgmt")
	public String wfcDetailMgmt(Model model) throws Exception{
		
		EgovMap param = new EgovMap();
		String path = "";
		
		try {
			
			EgovMap userInfo = (EgovMap) SessionUtil.getRequestAttributes("KSSM.user");
			String userId      = (String)userInfo.get("userId");	   // 로그인 사용자 ID
			String userGroupCd = (String)userInfo.get("userGroupCd");  // 로그인 사용자그룹CODE
			String linkCd      = (String)userInfo.get("linkCd");       // 로그인 시설CODE
			
			param.put("userId"      , userId);
			param.put("userGroupCd" , userGroupCd);
			param.put("wffcltyCd"   , linkCd);
			
			List<Map> revenueTpList   = commonCodeService.searchRevenueTp();
			List<Map> ownershipTpList = commonCodeService.searchOwnershipTp();
			List<Map> lunchTpList     = commonCodeService.searchLunchTp();
			List<Map> disableTpList   = commonCodeService.searchDisableTp();
			
			
			if(C.equals(userGroupCd)){
				path = "/wfc/wfcDetailMgmt";
				
				// 기본시설정보
				EgovMap wffcltyBaseList = wfcDetailService.selectWffcltyBaseList(param);
				model.addAttribute("wffcltyBaseList"  , wffcltyBaseList);
				
			}else if(E.equals(userGroupCd)){
				path = "/wfc/wfcDetailMgmtManager";
			}
			
			model.addAttribute("revenueTpList"    , revenueTpList);
			model.addAttribute("ownershipTpList"  , ownershipTpList);
			model.addAttribute("lunchTpList"      , lunchTpList);
			model.addAttribute("disableTpList"    , disableTpList);
			
			
		} catch(BadSqlGrammarException e) {
			LOGEER.info(e.getMessage());
		}
		return path;
	}
		
	
	// 상세,서비스장애 조회
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/wfc/selectList", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody EgovMap selectList(@RequestBody EgovMap param){

		EgovMap result = new EgovMap();
		try {
			// 시설상세정보
			List<EgovMap> wffcltyDetailList = wfcDetailService.selectWffcltyDetailList(param);
			// 서비스 유형
			List<EgovMap> wffDisableTpList = wfcDetailService.selectwffcltyDisableTpList(param);
			// 시설사진
			List<EgovMap> wffPictureList = wfcDetailService.selectwffcltyPictureList(param);
			
			result.put("wffcltyDisableTpList" , wffDisableTpList);
			result.put("wffcltyDetailList"   , wffcltyDetailList);
			result.put("wffcltyPictureList"   , wffPictureList);
		
		} catch(BadSqlGrammarException e) {
			LOGEER.info(e.getMessage());
		}
		
		return result;
	}
	
	
	
	/* 복지시설 상세정보 저장 */
	@RequestMapping(value="/wfc/saveWfcDetail")
	public @ResponseBody EgovMap saveWfcDetail (@RequestBody String param) throws ParseException   {	
		
		EgovMap result = new EgovMap();
		
		JSONParser json = new JSONParser();
		JSONArray jsonArr = (JSONArray)json.parse(param);
		
		result = wfcDetailService.saveWfcDetail(jsonArr);
		
		return result;
	}
	
	/* 사진 저장 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/wfc/imgUpload", method=RequestMethod.POST)
	public @ResponseBody EgovMap imgUpload(MultipartHttpServletRequest mRequest,HttpServletRequest request ) throws ParseException{
		
		EgovMap result = new EgovMap();
		
		// 이미지정보를 담을 배열
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		
		EgovMap userInfo = (EgovMap) SessionUtil.getRequestAttributes("KSSM.user");
		String register      = (String)userInfo.get("userId");	   // 로그인 사용자 ID
		
		// 이미지정보Util
		Map<String, Object> mapFile = null;		
		
		// 이미지정보들
		List<MultipartFile> mfile = mRequest.getFiles("uploadfiles[]");
		
		// 행에 복지시설 코드, 행에 상태값, 실제파일명 
		String[] wffcltyCd      =  request.getParameterValues("wffcltyCd");
		String[] stats          =  request.getParameterValues("stats");
		String[] pictureRealNm  =  request.getParameterValues("pictureRealNm");
		
		
		//이미지 삭제데이터
		String pictureList  =  request.getParameter("delPictureList");
		
		if(pictureList != null){
			// 삭제된 데이터를 JSON 배열로 만듬
			JSONParser json = new JSONParser();
			JSONArray delPictureList = (JSONArray)json.parse(pictureList);
			
			for (int i = 0; i < delPictureList.size(); i++) {
				// 삭제된 데이터
				Map<String, Object> dlist = (Map<String, Object>) delPictureList.get(i);
				
				//삭제된  데이터 정보
				EgovMap dParam = new EgovMap();
				String delstats = (String) dlist.get("stats");
				String delWffcltyCd = (String) dlist.get("wffcltyCd");
				String delpictureRealNm = (String) dlist.get("pictureRealNm");
				
				// 사진 삭제
				if(DELETE.equals(delstats)){
					FileUtil.fileDelete("wfc",delpictureRealNm , delWffcltyCd);
				}
				
				dParam.put("wffcltyCd"     , delWffcltyCd);
				dParam.put("pictureRealNm" , delpictureRealNm);
				dParam.put("stats"         , delstats);
				dParam.put("register"      , register);
				
				list.add(dParam);
			}
		}
			
		try {
		
			//사진 업로드 처리
			for (int i = 0; i < mfile.size(); i++) {
				EgovMap param = new EgovMap();
				CommonsMultipartFile cmf = (CommonsMultipartFile) mfile.get(i);
				
				// 사진 수정일때 사진 삭제
				if(UPDATE.equals(stats[i])){
					FileUtil.fileDelete("wfc",pictureRealNm[i] , wffcltyCd[i]);
				}
				
				// 신규사진이나 사진 업데이트일때 사진 업로드
				if(INSERT.equals(stats[i]) || UPDATE.equals(stats[i])){
					mapFile = FileUtil.uploadFile("wfc",wffcltyCd[i],cmf);
					
					param.put("pictureRealNm" , pictureRealNm[i]);
					param.put("pictureNm"     , mapFile.get("ORI_FILE_NM"));
					param.put("picturePath"   , mapFile.get("WK_PATH"));

				}
	
					param.put("wffcltyCd"     , wffcltyCd[i]);
					param.put("stats"         , stats[i]);
					param.put("register"      , register);
	
				list.add(param);
			 }
	
				// 저장
			 	result = wfcDetailService.saveImg(list);
			 	
		} catch (BadSqlGrammarException e) {
			result.put("rtnCode", "-1");
			result.put("message", "저장에 실패하였습니다.");
		}
		
		return result;
		
	}
	
	/**
	 * 복지시설코드 조회
	 * @param param
	 * @return
	 */
	@RequestMapping(value = "/wfc/selectWffcltyList", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody EgovMap selectWffcltyList(@RequestBody EgovMap param){

		EgovMap result = new EgovMap();
		
		try {
			List<EgovMap> data = wfcDetailService.selectWffcltyList(param);
			result.put("data", data);
		} catch(BadSqlGrammarException e) {
			result.put("result","exception");
			LOGEER.info(e.getMessage());
		}
		
		return result;
	}

}

