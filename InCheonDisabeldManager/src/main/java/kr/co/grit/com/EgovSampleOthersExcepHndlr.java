
package kr.co.grit.com;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import egovframework.rte.fdl.cmmn.exception.handler.ExceptionHandler;


/**  
 * @Class Name : EgovSampleOthersExcepHndlr.java
 * @Description : EgovSampleOthersExcepHndlr Class
 * @Modification Information  
 * @author 개발프레임웍크 실행환경 개발팀
 */
public class EgovSampleOthersExcepHndlr implements ExceptionHandler {

	final Log log = LogFactory.getLog(this.getClass());
    
    /**
    * @param exception
    * @param packageName
    * @see 개발프레임웍크 실행환경 개발팀
    */
    public void occur(Exception exception, String packageName) {
		log.debug(" EgovServiceExceptionHandler run...............");
    }

}
