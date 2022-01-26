package kr.co.grit.common.util;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

/**
 * @Class Name : SessionUtil.java
 * @Description : SessionUtil class
 * @Modification Information
 */
public class SessionUtil {
	
	public static void setRequestAttributes(HttpServletRequest request, String paramKey, Object obj) {
		HttpSession httpsession = request.getSession();			
		httpsession.setAttribute(paramKey, obj);
	}
	
	public static Object getRequestAttributes(String paramKey) {
		return RequestContextHolder.currentRequestAttributes().getAttribute(paramKey, RequestAttributes.SCOPE_SESSION);
	}
	
	public static String getButtonAuth(String menuCd, int authIdx) {
		String authYn = "N";
		
		Map userInfo = (Map) getRequestAttributes("KSSM.user");
		
		if(userInfo == null) {
			return authYn;
		}

		if(userInfo.get("userId") == null || userInfo.get("userId").equals("")) {
			return authYn;
		}

		List<Map> sysGroupMenuBtn = (List<Map>) getRequestAttributes("KSSM.sysGroupMenuBtn");

		//조회 || 신규 || 저장 || 삭제 || 엑셀
		String btnAuth = "00000";
		Map m = null;

		if(sysGroupMenuBtn != null) {
			for(int i=0; i < sysGroupMenuBtn.size(); i++){
				m = sysGroupMenuBtn.get(i);
				if(m.get("menuCd").equals(menuCd)) {
					btnAuth = (String)m.get("auth");
					
					char btnAuthArr[] = btnAuth.toCharArray();
					
					if(btnAuthArr[authIdx] == '1') {
						authYn = "Y";
					}
					break;
				}
			}
		}
		
		return authYn;
	}
}
