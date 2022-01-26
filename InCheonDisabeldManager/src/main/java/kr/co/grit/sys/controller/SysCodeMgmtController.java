package kr.co.grit.sys.controller;

import java.util.List;

import javax.annotation.Resource;

import kr.co.grit.sys.service.SysCodeMgmtService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.jdbc.BadSqlGrammarException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.rte.psl.dataaccess.util.EgovMap;


/** 공통코드
 * @Class Name : .SysCodeMgmtController.java
 * @Description : .SysCodeMgmtController class
 * @Modification Information
 */
@Controller
@SuppressWarnings("rawtypes")
public class SysCodeMgmtController {

	/**
	 * 로그 선언
	 */
	private static final Logger LOGGER = LoggerFactory.getLogger(SysCodeMgmtController.class);
	
	/**
	 * 서비스 선언
	 */
	@Resource(name = "sysCodeMgmtService")
	private transient SysCodeMgmtService sysCMService;
	//longvariable : 가독 및 식별이 용이한 변수이름을 짓는 것을 권장하기 위해서 길이제한을 두는 것은 제외 권장
	
	
	/**
	 * constructor
	 */
	public SysCodeMgmtController() {
		//constructor
		//unnecessaryconstructor : 생성자 없는 경우보다 pmd rule 에 검출 건수가 적음. 제외 권장
	}
	
	/**
	 * 공통코드 화면
	 * @param model
	 * @return
	 */
	@RequestMapping("/sys/sysCodeMgmt")
	public final String sysCodeMgmt(){

		return "sys/sysCodeMgmt";
	}
	
	/**
	 * 공통코드 조회 실행
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/sys/sysCodeMgmtList", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody EgovMap sysCodeMgmtList(@RequestBody final EgovMap param) throws Throwable {
		
		final EgovMap result = new EgovMap();
		
		try {
			final List<EgovMap> list = sysCMService.selectSysCodeMgmt(param);
			result.put("result", "success");
			result.put("list", list);
		} catch(BadSqlGrammarException  e) {
			result.put("result", "exception");
			LOGGER.info(e.getMessage());
		}
		return result;
	}
	
	/**
	 * 공통코드 저장 처리
	 * @param param
	 * @return
	 * @throws Throwable
	 */
	@RequestMapping(value = "/sys/sysCodeMgmtSave", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody final EgovMap sysCodeMgmtSave(@RequestBody final EgovMap param) throws Throwable {
		
		final EgovMap result = new EgovMap();
		
		try {
			sysCMService.saveSysCodeMgmt(param);
			result.put("result", "success");
		} catch(BadSqlGrammarException  e) {
			result.put("result", "exception");
			LOGGER.info(e.getMessage());
		}
		
		return result;
	}
	

}