package kr.co.grit.common.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.util.Properties;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.ServletContext;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.core.io.Resource;
import org.springframework.util.StringUtils;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.ServletContextResource;

/**
 * Properties 파일 로더<br/>
 * 클래스패쓰 상의 properties 파일 또는 ServletContext 객체 접근이 가능한 위치에서 properties 파일을 읽는다.
 * 
 * @author 
 */
public class PropertyLoader {

	private static final String SUFFIX = ".properties";

	private static final ConcurrentHashMap<String, Properties> PROPERTIES_MAP = new ConcurrentHashMap<String, Properties>();
	
	private static final Log LOG = LogFactory.getLog(PropertyLoader.class);


	/**
	 * 클래스 패쓰 상에 있는 리소스를 로딩한다. 리소스는 프로퍼티 파일이어야 하며, "." 또는 "/"로 패키지 패쓰를 모두 담은 이름을
	 * 넘겨주어야 한다. 특히 .properties 확장자가 없어도 무방하다.
	 * 
	 * <pre>
	 * some.pkg.Resource
	 * some.pkg.Resource.properties
	 * some/pkg/Reousrce
	 * some/pkg/Resource.properties
	 * </pre>
	 * 
	 * @param name
	 * @param loader
	 * @return
	 */
	public static Properties loadProperties(String nameParam, ClassLoader loaderParam) {
		
		Properties result = PROPERTIES_MAP.get(nameParam);
		if(result != null)
			return result;

		String name = nameParam;
		ClassLoader loader = loaderParam;

		if (name == null) {
			throw new IllegalArgumentException("name is null");
		}

		if (name.startsWith("/")) {
			name = name.substring(1);
		}

		if (name.endsWith(SUFFIX)) {
			name = name.substring(0, name.length() - SUFFIX.length());
		}

		InputStream in = null;

		try {
			if (loader == null) {
				loader = ClassLoader.getSystemClassLoader();
			}

			name = name.replace('.', '/');

			if (!name.endsWith(SUFFIX)) {
				name = name.concat(SUFFIX);
			}

			in = loader.getResourceAsStream(name);

			if (in != null) {
				result = new Properties();
				result.load(in);
			}
		} catch (Exception e) {
			result = null;
		} finally {
			if (in != null) {
				try {
					in.close();
				} catch (IOException ignore) {
					// 예외 무시
					LOG.error("InputStream of Property close error", ignore);
				}
			}
		}

		if (result == null) {
			throw new IllegalArgumentException("Could not load [" + name + "] as a classloader resource");
		}
		
		PROPERTIES_MAP.put(nameParam, result);
		
		return result;
	}

	/**
	 * 클래스 패쓰 상에 있는 리소스를 로딩한다. 리소스는 프로퍼티 파일이어야 하며, "." 또는 "/"로 패키지 패쓰를 모두 담은 이름을
	 * 넘겨주어야 한다. 특히 .properties 확장자가 없어도 무방하다.
	 * 
	 * <pre>
	 * some.pkg.Resource
	 * some.pkg.Resource.properties
	 * some/pkg/Reousrce
	 * some/pkg/Resource.properties
	 * </pre>
	 * 
	 * @param name
	 * @return
	 */
	public static Properties loadProperties(final String name) {
		return loadProperties(name, Thread.currentThread().getContextClassLoader());
	}

	/**
	 * Web Controller 등의 ServletContext가 접근 가능한 클래스에서 사용하는 .properties 파일 로더
	 * 
	 * @param servletContext
	 * @param path .properties 파일 위치
	 * @return
	 * @throws Exception 
	 */
	public static Properties loadProperties(ServletContext servletContext, String path) throws Exception {

		Resource location = new ServletContextResource(servletContext, path);

		InputStream is = null;
		Properties props = new Properties();
		try {
			is = location.getInputStream();
			doLoad(props, new InputStreamReader(is, "UTF-8"));
		} catch (IOException e) {
			
			/*if (log.isWarnEnabled()) {
				log.warn("Could not load properties from " + location + ": " + e.getMessage(), e);
			}*/
		}

		return props;
	}

	/**
	 * SpringMVC의 Web Controller 에서 사용하는 .properties 파일 로더
	 * 
	 * @param context
	 * @param path
	 * @return
	 * @throws Exception 
	 */
	public static Properties loadProperties(WebApplicationContext context, String path) throws Exception {
		return loadProperties(context.getServletContext(), path);
	}

	private static void doLoad(Properties props, Reader reader) throws IOException {
		BufferedReader in = new BufferedReader(reader);
		int maxSize = 200000;
		for(int i=0 ; i < maxSize; i++){
			String line = in.readLine();
			if (line == null) {
				return;
			}
			line = StringUtils.trimLeadingWhitespace(line);
			if (line.length() > 0) {
				char firstChar = line.charAt(0);
				if (firstChar != '#' && firstChar != '!') {
					while (endsWithContinuationMarker(line)) {
						String nextLine = in.readLine();
						line = line.substring(0, line.length() - 1);
						if (nextLine != null) {
							line += StringUtils.trimLeadingWhitespace(nextLine);
						}
					}
					int separatorIndex = line.indexOf('=');
					if (separatorIndex == -1) {
						separatorIndex = line.indexOf(':');
					}
					String key = (separatorIndex != -1 ? line.substring(0, separatorIndex) : line);
					String value = (separatorIndex != -1) ? line.substring(separatorIndex + 1) : "";
					key = StringUtils.trimTrailingWhitespace(key);
					value = StringUtils.trimLeadingWhitespace(value);
					props.put(unescape(key), unescape(value));
				}
			}
		}
		in.close();
	}

	private static boolean endsWithContinuationMarker(String line) {
		boolean evenSlashCount = true;
		int index = line.length() - 1;
		while (index >= 0 && line.charAt(index) == '\\') {
			evenSlashCount = !evenSlashCount;
			index--;
		}
		return !evenSlashCount;
	}

	private static String unescape(String str) {
		StringBuilder result = new StringBuilder(str.length());
		for (int index = 0; index < str.length();) {
			char c = str.charAt(index++);
			if (c == '\\') {
				c = str.charAt(index++);
				if (c == 't') {
					c = '\t';
				} else if (c == 'r') {
					c = '\r';
				} else if (c == 'n') {
					c = '\n';
				} else if (c == 'f') {
					c = '\f';
				}
			}
			result.append(c);
		}
		return result.toString();
	}

}
