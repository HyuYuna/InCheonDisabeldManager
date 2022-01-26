package kr.co.grit.pgm.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.grit.common.dao.CommonMainDAO;
import kr.co.grit.common.service.CommonCodeService;
import kr.co.grit.common.service.CommonMainService;
import kr.co.grit.common.util.FileUtil;
import kr.co.grit.common.util.SessionUtil;
import kr.co.grit.pgm.service.PgmMgmtService;

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

@Controller
public class PgmMgmtController {

	private static final Logger LOGGER = LoggerFactory.getLogger(PgmMgmtController.class);

	@Resource(name = "commonCodeService")
	private transient CommonCodeService commonCodeService;
	
	@Resource(name = "PgmMgmtService")
	private transient PgmMgmtService pgmMgmtService;
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/pgm/pgmMgmt")
	public String pgmOpStsReg(Model model, HttpServletRequest request, Map<String, Object> param) throws Exception{
		Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");
		String userGroupCd    = (String)userInfo.get("userGroupCd");
		String linkCd         = (String)userInfo.get("linkCd");            // 로그인 시설LINCCODE
		try {
			
//			List<Map> searchLclasList = pgmMgmtService.searchLclasList(param);
//			List<Map> searchMclasList = pgmMgmtService.searchMclasList(param);
//			List<Map> searchSclasList = pgmMgmtService.searchSclasList(param);
			List<Map> selectFacOp 	  = commonCodeService.selectFacOp();
			
			model.addAttribute("userGroupCd", userGroupCd);
			model.addAttribute("linkCd"		, linkCd);
			model.addAttribute("selectFacOp"		, selectFacOp);
//			model.addAttribute("searchLclasList"	,searchLclasList);
//			model.addAttribute("searchMclasList"	,searchMclasList);
//			model.addAttribute("searchSclasList"	,searchSclasList);
			
		} catch(BadSqlGrammarException e) {
			LOGGER.info(e.getMessage());
		}
		return "/pgm/pgmMgmt";
	}
	
	/* 프로그램 관리 조회 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/pgm/pgmMgmtGrid1", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map pgmMgmtGrid1(@RequestBody Map<String, Object> param, Model model,  HttpServletRequest request ) throws Exception{
		
		Map<String, Object> result = new ConcurrentHashMap<String, Object>();
		
		Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");
		
		List<Map> list = pgmMgmtService.selectProgramList(param);
		
		result.put("data", list);

		return result;
	}
	
	/* 프로그램 사진 조회 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/pgm/pgmMgmtGrid2", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map pgmMgmtGrid2(@RequestBody Map<String, Object> param, Model model,  HttpServletRequest request ) throws Exception{
		
		Map<String, Object> result = new ConcurrentHashMap<String, Object>();
		
		Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");
		
		List<Map> list = pgmMgmtService.selectProgramPictureList(param);
		
		result.put("data", list);

		return result;
	}
	
	/* 프로그램 등록 및 수정 */
	@RequestMapping(value={"/pgm/savePgmMgmt"})
	public @ResponseBody Map savePgmMgmt (@RequestBody Map<String, Object> param,
			Model model, HttpServletRequest request, HttpSession session) throws Exception {
		
		Map<String, String> result = new ConcurrentHashMap<String, String>();
		
		//Session을 이용하여 사용자 정보를 가져온다.
		Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");
		String userId= (String)userInfo.get("userId");		// 로그인 사용자 ID
		//String linkCd = request.getParameter("linkCd");
			param.put("register", userId);
			//param.put("linkCd", linkCd);
		
		try {
			//String programChaban = pgmMgmtService.selectProgramChaban(linkCd);
			result = pgmMgmtService.savePgmMgmt(param);
			/*result = pgmMgmtService.(param);*/
			
			//result.put("rtnCode", "0");
			//result.put("message", "정상적으로 저장 되었습니다");
		} catch(BadSqlGrammarException e){	
			LOGGER.info(e.getMessage());
			result.put("rtnCode", "-1");
			result.put("message", "저장에 실패하였습니다.");
		}
		
		return result;
	}
	
	// 중분류코드 조회
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/pgm/selectMclaCdList", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map selectMclaCdList(@RequestBody Map<String, String> param,
			Model model, HttpServletRequest request, HttpSession session) throws Exception {

			Map<String, Object> result = new ConcurrentHashMap<String, Object>();
			
			Map userInfo  = (Map) SessionUtil.getRequestAttributes("KSSM.user");

			List<Map> data = pgmMgmtService.searchMclasList(param);
			result.put("data", data);

			return result;
		}
	
	// 소분류코드 조회
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/pgm/selectSclaCdList", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map selectSclaCdList(@RequestBody Map<String, String> param,
			Model model, HttpServletRequest request, HttpSession session) throws Exception {

				Map<String, Object> result = new ConcurrentHashMap<String, Object>();
				
				Map userInfo  = (Map) SessionUtil.getRequestAttributes("KSSM.user");

				List<Map> data = pgmMgmtService.searchSclasList(param);
				result.put("data", data);

				return result;
			}
	
	/* 사진 저장 */
	@RequestMapping(value = "/pgm/imgUpload", method=RequestMethod.POST)
	public @ResponseBody Map imgUpload(MultipartHttpServletRequest mRequest,HttpServletRequest request ) throws Exception {
		
		Map<String, String> result = new ConcurrentHashMap<String, String>();
		
		// 이미지정보를 담을 배열
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");
		String register      = (String)userInfo.get("userId");	   // 로그인 사용자 ID
		String linkCd = request.getParameter("linkCd");
		
		
		// 이미지정보Util
		Map<String, Object> mapFile = null;		
		
		// 이미지정보들
		List<MultipartFile> mfile = mRequest.getFiles("uploadfiles[]");
		
		// 행에 복지시설 코드, 행에 상태값, 실제파일명 
		String[] wffcltyCd      =  request.getParameterValues("wffcltyCd");
		String[] programCd      =  request.getParameterValues("programCd");
		String[] stats          =  request.getParameterValues("stats");
		String[] pictureRealNm  =  request.getParameterValues("pictureRealNm");
		//saveMode
		String saveMode = request.getParameter("saveMode");
		
		
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
				Map<String, Object> dParam = new ConcurrentHashMap<String, Object>();
				String delstats = (String) dlist.get("stats");
				String delWffcltyCd = (String) dlist.get("wffcltyCd");
				String delProgramCd = (String) dlist.get("programCd");
				String delpictureRealNm = (String) dlist.get("pictureRealNm");
				
				// 사진 수정일때 사진 삭제
				if("D".equals(delstats)){
					FileUtil.pgmFileDelete(delpictureRealNm, delWffcltyCd, delProgramCd);
				}
				
				dParam.put("wffcltyCd"     , delWffcltyCd);
				dParam.put("programCd" , delProgramCd);
				dParam.put("pictureRealNm" , delpictureRealNm);
				dParam.put("stats"         , delstats);
				dParam.put("register"      , register);
				
				list.add(dParam);
			}
		}
			
		try {
		
			//사진 업로드 처리
			for (int i = 0; i < mfile.size(); i++) {
				Map<String, Object> param = new HashMap<String, Object>();
				CommonsMultipartFile cmf = (CommonsMultipartFile) mfile.get(i);
				String fileName = mfile.get(i).getOriginalFilename();
				
				// 사진 수정일때 사진 삭제
				if("U".equals(stats[i])){
					FileUtil.pgmFileDelete(pictureRealNm[i] , wffcltyCd[i], programCd[i]);
				}
				
				String programChaban = "";				
				if("I".equals(saveMode)){
					programChaban = pgmMgmtService.selectProgramChaban(linkCd);
					param.put("programCd", programChaban);
				}
				// 신규사진이나 사진 업데이트일때 사진 업로드
				if("I".equals(stats[i]) || "U".equals(stats[i])){
					mapFile = FileUtil.pmgUploadFile(wffcltyCd[i],cmf, programCd[i]+programChaban);
					
					param.put("pictureRealNm" , pictureRealNm[i]);
					
					if("I".equals(saveMode)){
						programChaban = pgmMgmtService.selectProgramChaban(linkCd);
						param.put("programCd", programChaban);
					}
					else{
						param.put("programCd", programCd[i]);
					}
					param.put("pictureNm"     , mapFile.get("ORI_FILE_NM"));
					param.put("picturePath"   , mapFile.get("WK_PATH"));
				}
				
					param.put("wffcltyCd"     , wffcltyCd[i]);
					if("I".equals(saveMode)){
						programChaban = pgmMgmtService.selectProgramChaban(linkCd);
						param.put("programCd", programChaban);
					}
					else{
					param.put("programCd"     , programCd[i]);
					}
					param.put("stats"         , stats[i]);
					param.put("register"      , register);
				
				list.add(param);
			 }
				// 저장
			 	result = pgmMgmtService.saveImg(list);
			 	
		} catch (BadSqlGrammarException e) {
			result.put("rtnCode", "-1");
			result.put("message", "사진 저장에 실패하였습니다.");
			
		}
		
		return result;
		
	}
	
	
	
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/pgm/getLclasCd", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map getLclasCd(@RequestBody Map<String, String> param, Model model, HttpServletRequest request) throws Exception{
		
		Map<String, Object> result = new ConcurrentHashMap<String, Object>();
			
		List<Map> data = pgmMgmtService.searchLclasList(param);
		
		result.put("data", data);
			
		return result;
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/pgm/deleteProgram", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map deleteProgram(@RequestBody Map<String, String> param, Model model, HttpServletRequest request) throws Exception{
		
		Map<String, Object> result = new ConcurrentHashMap<String, Object>();
		Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");
		String userId= (String)userInfo.get("userId");		// 로그인 사용자 ID
			//메뉴코드 하드코딩
			param.put("menuCd", "PGM010");
			param.put("register", userId);
			param.put("jobFg", "D");
		try{
			result = pgmMgmtService.deleteProgramMgmt(param);
		} catch(BadSqlGrammarException e){
			e.printStackTrace();
		}
		return result;
	}
}
