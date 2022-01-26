package kr.co.grit.pgm.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import kr.co.grit.common.util.SessionUtil;
import kr.co.grit.pgm.service.LbrryBookExcelUploadService;


/**
 * 도서목록 엑셀 업로드
 * @author JJS
 */
@Controller
public class LbrryBookExcelUploadController {

	/**
	 * 서비스 선언
	 */	
	@Resource(name="LbrryBookExcelUploadService")
	private transient LbrryBookExcelUploadService lbrBoExUpService;
	
	
	/**
	 * 도서목록 엑셀 화면
	 * @param model
	 * @return 
	 */
	@RequestMapping(value = "/pgm/lbrryBookExcelUpload")
	public String lbrryBookCatalog(Model model) throws Exception {
		
		return "/pgm/lbrryBookExcelUpload";
	}
	
	/**
	 * 도서목록 엑셀 읽기
	 * @param file
	 * @return
	 */
	@RequestMapping(value = "/pgm/pgmLbrryBookExcelFile", method=RequestMethod.POST)
	public @ResponseBody Map pgmLbrryBookExcelFile(MultipartHttpServletRequest  request ) {
		
		EgovMap result = new EgovMap();
		EgovMap resultMap = new EgovMap();
		List<EgovMap> data = new ArrayList<EgovMap>();
		
		MultipartFile file = null;
		
		Iterator<String> iterator = request.getFileNames();  
		if(iterator.hasNext()) {
            file = request.getFile(iterator.next());
        }
		
		EgovMap userInfo = (EgovMap) SessionUtil.getRequestAttributes("KSSM.user");
		String linkCd  = (String)userInfo.get("linkCd");        // 로그인 시설LINCCODE
		
		
		// 엑셀 읽기
		resultMap = lbrBoExUpService.pgmLbrryBookExcelFile(file,linkCd);
		
		// 성공
		if("0".equals(resultMap.get("rtnCode"))){
			
			// temp에 저장된 데이터 조회
			data = lbrBoExUpService.selectLbrExcelTempList(linkCd);
			result.put("data", data);
			result.put("resultMap", resultMap);
		//실패	
		}else if("-1".equals(resultMap.get("rtnCode"))){
			data = lbrBoExUpService.selectLbrExcelTempErrorList(linkCd);
			result.put("data", data);
			result.put("resultMap", resultMap);
		}else{
			result.put("resultMap", resultMap);
		}
		
		
		return result;
		
	}

		
	/**
	 * 도서목록 확정
	 * @param list
	 * @return
	 */
	@RequestMapping(value = "/pgm/confirmLbrryBook", method=RequestMethod.POST)
	public @ResponseBody Map confirmLbrryBook (@RequestBody List<EgovMap> param) {
		
		EgovMap result = new EgovMap();
		
		EgovMap userInfo = (EgovMap) SessionUtil.getRequestAttributes("KSSM.user");
		String userId= (String)userInfo.get("userId");		// 로그인 사용자 ID
		
		for (int i = 0; i < param.size(); i++) {
			param.get(i).put("register", userId);
		}
		
		result = lbrBoExUpService.confirmLbrryBook(param);
		
		return result;
		
	}
	
}
