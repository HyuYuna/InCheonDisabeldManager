package kr.co.grit.wfc.controller;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import kr.co.grit.common.service.CommonCodeService;
import kr.co.grit.common.util.SessionUtil;
import kr.co.grit.wfc.service.WfcInOutViewService;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 복지시설 이용 조회
 * @author SYW
 */
@Controller
public class WfcInOutViewController {

 	/**
	 * 공통 서비스 선언
	 */
	@Resource(name = "commonCodeService")
	private transient CommonCodeService commonCodeService;
	
 	/**
	 * 복지시설 이용 조회 서비스 선언
	 */
	@Resource
	private transient WfcInOutViewService wfcInOutVwService;

	/**
	 * 복지시설 이용 조회
	 * 
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/wfc/wfcInOutView")
	public String wfcDetailMgmt(Model model, HttpServletRequest request, Map<String, String> param) throws Exception{
		
		
		Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");
		String userGroupCd = (String)userInfo.get("userGroupCd");
		String linkCd = (String)userInfo.get("linkCd");
		
		param.put("linkCd", linkCd);
		
		
		List<Map> wffcltyCodeCList = wfcInOutVwService.selectWffcltyCodeC(param);
		List<Map> rsnLvngList = commonCodeService.selectRsnLvng();
		List<Map> typeExtFcltyList = wfcInOutVwService.selectWffcltyCodeAB(param);
		List<Map> groupCodeD = wfcInOutVwService.selectGroupCodeD(param);
		
		model.addAttribute("userGroupCd", userGroupCd);
		model.addAttribute("typeExtFcltyList", typeExtFcltyList);
		model.addAttribute("rsnLvngList", rsnLvngList);
		model.addAttribute("wffcltyCodeCList", wffcltyCodeCList);
		model.addAttribute("groupCodeD", groupCodeD);
		model.addAttribute("linkCd", linkCd);
		
		return "/wfc/wfcInOutView";
	}
	
	/**
	 * 복지시설 이용 리스트 조회
	 * 
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/wfc/WfcInOutViewGrid1", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map wfcEnextMgmtGrid1(@RequestBody Map<String, Object> param, Model model,  HttpServletRequest request ) throws Exception{
		
		Map<String, Object> result = new ConcurrentHashMap<String, Object>();
		
		List<Map> list = wfcInOutVwService.selectInOutViewList(param);
		
		result.put("data", list);

		return result;
	}
	
}

