<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%!
	String nullToStr(String s1, String s2) {
		return ((s1 == null)?s2:s1);
	}
%>
<%
    // 년월 파라미터
	String yyyymm = request.getParameter("yyyymm");
    String param = "yyyymm#"+yyyymm;

	String jrf = nullToStr(request.getParameter("jrf"), "db_disablePrint.jrf");
	//String arg = nullToStr(request.getParameter("arg"), "yyyymm#yyyymm");
	String resId = nullToStr(request.getParameter("resId"), "UBIHTML");
%>

<!DOCTYPE html PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN' 'http://www.w3.org/TR/html4/loose.dtd'>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>UbiReport4 HTMLViewer</title>
<!--[if IE]><script src='./js/ubiexcanvas.js'></script><![endif]-->
<script src='/resources/js/ubi4/js/ubihtml.js'></script>
<script src='/resources/js/ubi4/js/msg.js'></script>
<script src='/resources/js/ubi4/js/ubinonax.js'></script>
<script language='javascript'>

/*-----------------------------------------------------------------------------------
htmlViewer.setUserSaveList('Image,Pdf,Docx,Xls,Pptx,Hml,Cell');
htmlViewer.setUserPrintList('Ubi,Html,Pdf');
htmlViewer.setVisibleToolbar('INFO', false);
htmlViewer.HmlExtension='hwp';
htmlViewer.printHTML();		// HTML PrintSet
htmlViewer.printPDF();		// PDF PrintSet
htmlViewer.export('PDF');	// PDF/EXCEL/EXCEL_NO/HWP/PPTX/HML/DOCX/CELL/IMAGE
htmlViewer.print();		// Direct Print(WS VIEWER)
htmlViewer.printSet();		// PrintSet(WS VIEWER)
//htmlViewer.events.printEnd = UbiPrintEnd;
//htmlViewer.events.exportEnd = UbiExportEnd;
-----------------------------------------------------------------------------------*/
	/* URL 정보 */
	var app = '';
	var appUrl = self.location.protocol + '//' + self.location.host + (app==''?'':('/' + app));

	/* Viewer Object */
	var htmlViewer = null;

	/* Viewer Param */
	var pKey = '<%= session.getId() %>';
	var pServerUrl = appUrl + '/UbiServer';
	var pResUrl = appUrl + '/ubi4/js/';
	var pDivId = 'UbiHTMLViewer';
	var pScale = 'WholePage';	//WholePage/PageWidth/60~300

	/* Modify for your environment */
	var pJrf = '<%= jrf %>';
	var pArg = '<%= param %>';
	var pResId = '<%= resId %>';

	/* Report Preview */
	function UbiLoadReport() {

		UbiResize();
		htmlViewer = new UbiViewer( {

			key : pKey,
			ubiserverurl : pServerUrl,
			resource : pResUrl,
			resid : pResId,
			divid : pDivId,
			scale : pScale,
			jrffile : pJrf,
			useplugin : true,
			arg : pArg
		});
		htmlViewer.showReport(UbiPreviewEnd);
	}

	/* Preview Callback */
	function UbiPreviewEnd() {
		
		htmlViewer.setUserPrintList("Ubi,Pdf");
		
		// 전용뷰어 사용 기준 페이지 : 50페이지 이상이면 전용뷰어 인쇄만 활성화 됩니다.
		var basePageNum = 50;
		try {
			if( basePageNum <= htmlViewer.totalPage ) {
				
				htmlViewer.setEnableToolbar("PRINT_UBI", true);
				htmlViewer.setEnableToolbar("PRINT_PDF", true);
				htmlViewer.setEnableToolbar("PRINT_HTML", false);
				htmlViewer.setPluginprogress(true);
			}
			else {
				
				htmlViewer.setEnableToolbar("PRINT_UBI", true);
				htmlViewer.setEnableToolbar("PRINT_PDF", true);
				htmlViewer.setEnableToolbar("PRINT_HTML", false);
				htmlViewer.setPluginprogress(false);
			}
		}
		catch (e) {}
	}

	/* Print Callback */
	function UbiPrintEnd(flag) {
	}

	/* Export Callback */
	function UbiExportEnd(flag, msg) {
	}

	/* Viewer Object Resize */
	function UbiResize() {

		/* Size Gap */
		var gap = 6;
		var w = ((self.innerWidth || (document.documentElement && document.documentElement.clientWidth) || document.body.clientWidth)) - gap;
		var h = ((self.innerHeight || (document.documentElement && document.documentElement.clientHeight) || document.body.clientHeight)) - gap;
		document.getElementById(pDivId).style.width = w + 'px';
		document.getElementById(pDivId).style.height = h + 'px';
	}

//-->
</script>
</head>
<body style='margin:1px' onload='UbiLoadReport()' onresize='UbiResize()'>
	<div id='UbiHTMLViewer' style='border:1px solid #767676; border-bottom-width:2px;'></div>
</body>
</html>