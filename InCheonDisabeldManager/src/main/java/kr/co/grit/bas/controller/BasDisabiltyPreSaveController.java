package kr.co.grit.bas.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

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
import kr.co.grit.bas.service.BasDisabiltyPreSaveService;

/**
 * 장애정도별 현황 등록
 * @author JJS
 */
@Controller
public class BasDisabiltyPreSaveController {
	
	/**
	 * 서비스 선언
	 */
	@Resource(name="BasDisabiltyPreSaveService")
	private transient BasDisabiltyPreSaveService disPreSaveService;
	
	
	/**
	 * 장애정도별 현황 등록 화면
	 * @param model
	 * @return 
	 */
	@RequestMapping(value = "/bas/basDisabiltyPreSave")
	public String basDisabiltyPreSave(Model model) throws Exception{

		return "/bas/basDisabiltyPreSave";
	}
	
	
	/**
	 * 장애정도별 현황 엑셀 읽기
	 * @param file
	 * @return 
	 */
	@RequestMapping(value = "/bas/basDisabiltyPreExcelFile", method=RequestMethod.POST)
	public @ResponseBody EgovMap basDisabiltyPreExcelFile(MultipartHttpServletRequest  request ) {
		
		EgovMap result = new EgovMap();
		EgovMap resultMap = new EgovMap();
		List<EgovMap> data = new ArrayList<EgovMap>();
		
		MultipartFile file = null;
		
		Iterator<String> iterator = request.getFileNames();  
		if(iterator.hasNext()) {
            file = request.getFile(iterator.next());
        }
		
		// 엑셀 읽기
		resultMap = disPreSaveService.disablePreExcelUpload(file);
		
		// 성공
		if("0".equals(resultMap.get("rtnCode"))){
			
			// temp에 저장된 데이터 조회
			data = disPreSaveService.selectExcelTempList();
			result.put("data", data);
			result.put("resultMap", resultMap);
		//실패	
		}else if("-1".equals(resultMap.get("rtnCode"))){
			data = disPreSaveService.selectExcelTempErrorList();
			result.put("data", data);
			result.put("resultMap", resultMap);
		}else{
			result.put("resultMap", resultMap);
		}
		
		
		return result;
		
	}

	
	/**
	 * 장애정도별 현황 확정
	 * @param file
	 * @return 
	 */
	@RequestMapping(value = "/bas/confirmDisablePre", method=RequestMethod.POST)
	public @ResponseBody EgovMap confirmDisablePre (@RequestBody List<EgovMap> param) {
		
		EgovMap result = new EgovMap();
		
		EgovMap userInfo = (EgovMap) SessionUtil.getRequestAttributes("KSSM.user");
		String userId= (String)userInfo.get("userId");		// 로그인 사용자 ID
		
		for (int i = 0; i < param.size(); i++) {
			param.get(i).put("register", userId);
		}
		
		result = disPreSaveService.confirmDisablePre(param);
		
		return result;
		
	}
}
