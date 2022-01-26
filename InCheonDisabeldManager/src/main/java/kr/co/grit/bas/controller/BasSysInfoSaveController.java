package kr.co.grit.bas.controller;

import javax.annotation.Resource;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import kr.co.grit.bas.service.BasSysInfoSaveService;
import kr.co.grit.common.util.SessionUtil;

/**
 * 사용자 수정
 * @author JJS
 */
@Controller
public class BasSysInfoSaveController {
	
	
	/**
	 * 서비스 선언
	 */
	@Resource(name="BasSysInfoSaveService")
	private transient BasSysInfoSaveService sysInfoService;
	
	/**
	 * 사용자수정 화면
	 * @param model
	 * @return 
	 */
	@RequestMapping(value = "/bas/basSysInfoSave")
	public String basSysInfoSave(Model model) {
		
		EgovMap userInfo = (EgovMap) SessionUtil.getRequestAttributes("KSSM.user");
		model.addAttribute("userInfo", userInfo);
		
		return "/bas/basSysInfoSave";
	}
	
	/**
	 * 사용자수정 
	 * @param param
	 * @return 
	 */
	@RequestMapping(value="/bas/sysInfoSave", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody EgovMap updateSys(@RequestBody EgovMap param){
		
		EgovMap result = new EgovMap();
		
		result  = sysInfoService.updateSys(param);
		
		return result;
	}
	
}
