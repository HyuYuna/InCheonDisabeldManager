
package kr.co.grit.com.web;

import egovframework.rte.ptl.mvc.tags.ui.pagination.AbstractPaginationRenderer;

/**  
 * @Class Name : ImagePaginationRenderer.java
 * @Description : ImagePaginationRenderer Class
 * @Modification Information  
 * @author 개발프레임웍크 실행환경 개발팀
 */
public class EgovImgPaginationRenderer extends AbstractPaginationRenderer {
	
    /**
    * PaginationRenderer
	* 
    * @see 개발프레임웍크 실행환경 개발팀
    */
	public EgovImgPaginationRenderer() {

		firstPageLabel = "<span class='prev'><a href=\"#\" onclick=\"{0}({1}); return false;\">" +
							"<img src='/html/images/event/btn_pag_first.gif' alt='처음페이지' /></a>"; 
        previousPageLabel = "<a href=\"#\" onclick=\"{0}({1}); return false;\">" +
        						"<img src='/html/images/event/btn_pag_prev.gif' alt='이전페이지' /></a></span>";
        currentPageLabel = "<span class='num'><strong>{0}</strong></span>";
        otherPageLabel = "<span class='num'><a href=\"#\" onclick=\"{0}({1}); return false;\">{2}</a></span>";
        nextPageLabel = "<span class='next'><a href=\"#\" onclick=\"{0}({1}); return false;\">" +
        					"<img src='/html/images/event/btn_pag_next.gif' alt='다음페이지' /></a></span>";
        lastPageLabel = "<a href=\"#\" onclick=\"{0}({1}); return false;\">" +
        					"<img src='/html/images/event/btn_pag_last.gif' alt='마지막페이지' /></span>";
        
	}
}
