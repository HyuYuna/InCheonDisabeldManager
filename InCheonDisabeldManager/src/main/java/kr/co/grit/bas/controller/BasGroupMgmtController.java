package kr.co.grit.bas.controller;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.grit.bas.service.BasGroupMgmtService;
import kr.co.grit.common.service.CommonCodeService;
import kr.co.grit.common.util.SessionUtil;

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

/**
 * 단체관리
 * @author SYW
 */

@Controller
@SuppressWarnings("rawtypes")
public class BasGroupMgmtController {
	
 	/**
	 * 로그 선언
	 */
	private static final Logger LOGGER = LoggerFactory.getLogger(BasGroupMgmtController.class);

 	/**
	 * 공통 서비스 선언
	 */
	@Resource(name = "commonCodeService")
	private transient CommonCodeService commonCodeService;
	
 	/**
	 * 로그 선언
	 */
	@Resource(name = "BasGroupMgmtService")
	private transient BasGroupMgmtService basGrpMgmtService;

	 /**
	 * 단체관리 화면 
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/bas/basGroupMgmt")
	public String basGroupMgmt(Model model, HttpServletRequest request, Map<String, Object> param) throws Exception{
		
		List<Map> groupClsfcList = commonCodeService.selectGroupClsfc();
		List<Map> useFgList = commonCodeService.searchUse();
		List<Map> facOpList = commonCodeService.selectFacOp();
		
		model.addAttribute("groupClsfcList", groupClsfcList);
		model.addAttribute("useFgList"  , useFgList);
		model.addAttribute("facOpList"       , facOpList);
		
		return "/bas/basGroupMgmt";
	}
	 /**
	 * 단체관리 리스트 조회
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/bas/basGroupMgmtGrid1", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map selectGroupGrid1(@RequestBody Map<String, Object> param, Model model,  HttpServletRequest request ) throws Exception{
		
		Map<String, Object> result = new ConcurrentHashMap<String, Object>();
		
		//Session을 이용하여 사용자 정보를 가져온다.
		/*Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");*/
		//String loginId= (String)userInfo.get("userId");		// 로그인 사용자 ID
		
		List<Map> list = basGrpMgmtService.readGroupList(param);
		
		result.put("data", list);

		return result;
	}
	
	 /**
	 * 단체관리 신규등록 및 수정
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value={"/bas/saveGroupInfo"})
	public @ResponseBody Map saveGroupInfo (@RequestBody Map<String, Object> param,
			Model model, HttpServletRequest request, HttpSession session) throws Exception {
		
		Map<String, String> result = new ConcurrentHashMap<String, String>();

		
		//Session을 이용하여 사용자 정보를 가져온다.
		Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");
		String userId= (String)userInfo.get("userId");		// 로그인 사용자 ID

		param.put("register", userId);
		
		try {
			result = basGrpMgmtService.insertGroupInfo(param);
			
			//result.put("rtnCode", "0");
			//result.put("message", "정상적으로 저장 되었습니다");
		} catch(BadSqlGrammarException e){
			LOGGER.info(e.getMessage());
			result.put("rtnCode", "-1");
			result.put("message", "저장에 실패하였습니다.");
		}
		
		return result;
	}
	
	 /**
	 * 허가번호 중복 검사
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/bas/encChk", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map encCheck (@RequestBody Map<String, Object> param,
			Model model, HttpServletRequest request, HttpSession session) throws Exception {
		
		Map<String, Object> result = new ConcurrentHashMap<String, Object>();
		
		int count = basGrpMgmtService.selectEncChk(param);
		
		result.put("data", count);
		
		return result;
	}
	
	/**
	 * 단체관리 삭제
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/bas/deleteBasGroupMgmt", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map deleteBasGroupMgmt (@RequestBody Map<String, Object> param,
			Model model, HttpServletRequest request, HttpSession session) throws Exception {
		
		Map<String, Object> result = new ConcurrentHashMap<String, Object>();
		Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");
		String userId= (String)userInfo.get("userId");		// 로그인 사용자 ID
			//메뉴코드 하드코딩
			param.put("menuCd", "BAS002");
			param.put("register", userId);
			param.put("jobFg", "D");
		try {
			result = basGrpMgmtService.deleteBasGroupMgmt(param);
			
		} catch(BadSqlGrammarException e){
			LOGGER.info(e.getMessage());
		}
		
		
		return result;
	}
}

