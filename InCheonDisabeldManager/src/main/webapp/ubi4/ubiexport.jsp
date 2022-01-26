<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="com.ubireport.viewer.report.preview.UbiViewer" %>
<%!
	String nullToStr(String s1, String s2) {
		return ((s1 == null)?s2:s1);
	}
%>
<%
	String jrf = nullToStr(request.getParameter("jrf"), "ubi_sample.jrf");
	String arg = nullToStr(request.getParameter("arg"), "user#홍길동#");

	String appUrl		= "http://localhost:8080/myapp";
	String fileURL		= appUrl + "/ubi4";	
	String ubiServerURL	= appUrl + "/UbiServer";							 

	String dataSource	= "Tutorial";
	String jrfFileDir	= "/webapp/myapp/ubi4/work/";
	
	String exportFileType	= "PDF";
	String exportPath	= "/webapp/myapp/ubi4/export/";
	String exportFileName	= jrf.substring(0, jrf.lastIndexOf(".")) + ".pdf";
	String exportFilePath	= exportPath + java.io.File.separator + exportFileName;

	try {

		UbiViewer ubi = new UbiViewer(false, false);

		ubi.exectype = "TYPE6";
		ubi.fileURL = fileURL;
		ubi.ubiServerURL = ubiServerURL;
		ubi.isLocalFile = true;
		ubi.dataSource = dataSource;
		ubi.jrfFileDir = jrfFileDir;
		ubi.jrfFileName = jrf;
		ubi.arg = arg;
		ubi.setExportParams(exportFileType, exportFilePath);

		boolean isSuccess = ubi.loadReport();

		if( isSuccess ) 
			out.println("Export Success!");
		else
			out.println("Export Fail!");
	}
	catch(Exception e) {

		out.println(e.getMessage());
		e.printStackTrace();
	}
%>