package kr.co.grit.common.interceptor;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.grit.common.constants.GritConstants;
import kr.co.grit.common.util.PropertyLoader;
import kr.co.grit.common.util.SessionUtil;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter {
	protected Log log = LogFactory.getLog(LoginCheckInterceptor.class);

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    	String uri = request.getRequestURI().trim();
        if("/".equals(uri)){
    		//response.sendRedirect("/common/login");
        	response.sendRedirect("/common/index");
    		return false;
        }
        
        Map userInfo = (Map) SessionUtil.getRequestAttributes(GritConstants.USER_SESSION);
		
        if(userInfo == null){
        	// properties에서 none_filter_urls 정보를 가져온다.
    		Properties prop = PropertyLoader.loadProperties("/properties/resource.properties");
        	String url    = prop.getProperty("none_filter_urls").replaceAll(" ", "");
    		String[] urls = url.split(",");
    		List<String> urlList = Arrays.asList(urls);
    		if(urlList.contains(uri) || uri.startsWith("/common/home")){
        		//response.sendRedirect("/common/login?timeOut=y");
        		response.sendRedirect("/common/index");
       			return false;
        	}
    		else if(urlList.contains(uri) || uri.startsWith("/common/")) {
    			return true;
    		}
    		//response.sendRedirect("/common/login?timeOut=y");
    		response.sendRedirect("/common/index");
   			return false;
        }

        if (log.isDebugEnabled()) {
            log.debug("URL : " + uri);
        }
        return true;
    }
}
