
package kr.co.grit.com;

import egovframework.rte.fdl.cmmn.exception.handler.ExceptionHandler;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**  
 * @Class Name : EgovSampleExcepHndlr.java
 * @Description : EgovSampleExcepHndlr Class
 * @Modification Information  
 * @author 개발프레임웍크 실행환경 개발팀
 */
public class EgovSampleExcepHndlr implements ExceptionHandler {

	private static final Logger LOGGER = LoggerFactory.getLogger(EgovSampleExcepHndlr.class);
    
    /**
    * @param ex
    * @param packageName
    * @see 개발프레임웍크 실행환경 개발팀
    */
    @Override
	public void occur(Exception ex, String packageName) {

    	LOGGER.debug(" EgovServiceExceptionHandler run...............");

		try {
			LOGGER.debug(" EgovServiceExceptionHandler try ");
		} catch (Exception e) {
			LOGGER.error(e.getMessage());
		}
    }

}
