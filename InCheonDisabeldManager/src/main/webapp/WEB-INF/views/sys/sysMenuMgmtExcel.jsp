<%@ page language="java" contentType="application/vnd.ms-excel; charset=utf-8" pageEncoding="utf-8"
%><%@ page import="java.util.ArrayList" 
%><%@ page import="java.util.HashMap" 
%><%@ page import="java.util.List" 
%><%@ page import="java.util.Map" 
%><%@ page import="java.util.Date" 
%><%@ page import="java.text.SimpleDateFormat" 
%><%@ page import="java.net.URLEncoder" 
%><%@ page import="org.apache.commons.lang3.StringUtils" 
%><%@ page import="egovframework.rte.psl.dataaccess.util.EgovMap" 
%><%
	String filename = (String)request.getAttribute("filename");
	String today = new SimpleDateFormat("yyyyMMdd_HHmmss_SSS").format(new Date());
	response.setHeader("Content-Disposition", "inline; filename=GRIT_" + URLEncoder.encode(filename, "UTF-8") + "_" + today + ".xls");
	response.setHeader("Content-Description", "JSP Generated Data");
	//response.setHeader("Content-Type", "application/vnd.ms-xls");// 주석해제: 바로 저장, 주석설정: 열기/저장 선택창이 뜬다.
	
	ArrayList<EgovMap> data = (ArrayList<EgovMap>)request.getAttribute("data");
	int size = data != null ? data.size() : 0;
%><!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta http-equiv="Content-Script-Type" content="text/javascript">
	<meta http-equiv="Content-Style-Type" content="text/css">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>거룡아이티 시스템</title>
<style type="text/css">
td { mso-number-format:\@; } 
table {width:100%;}
.tb01 th {position:relative; min-width:120px; height:28px; padding-left:15px; text-align:left; font-weight:normal; background:#f5f5f5; color:#242424; border:1px solid #cccccc;}
.tb01 td {position:relative; height:28px; padding-left:5px; border:1px solid #cccccc; background:#fff}
.tb01 td input[type="text"] {vertical-align:baseline;}
.tb01 .necessary {position:absolute; display:inline-block; left:0; top:0; width:15px; height:100%; text-indent:-9999px; background:url('<%=request.getContextPath()%>/resources/images/btn_icon4.png') no-repeat center;}

.tb02 tr:nth-child(2n) {background:#f9f9f9;}
.tb02 thead th {padding:6px 0; line-height:1.1; text-align:center; background:#6e7376; color:#fff; border-left:1px solid #9da0a1; border-bottom: 1px solid #9da0a1; font-weight:normal;}
.tb02 thead th:first-child, .tb02 tbody td:first-child {border-left:none;}
.tb02 tbody tr {border-top:1px solid #ccc;}
.tb02 tbody tr:first-child {border-top:none;}
.tb02 tbody tr:hover {background:#edffb7}
.tb02 tbody td {padding:6px 0; line-height:1; text-align:center; border-left:1px solid #e5e5e5}
</style>
</head>
<body>
<table class="tb02" border="1">
	<caption><%=filename%></caption>
	<colgroup>
		<col width="100px">
		<col width="100px">
		<col width="100px">
		<col width="100px">
		<col width="100px">
		<col width="100px">
		<col width="100px">
		<col width="100px">
		<col width="100px">
		<col width="100px">
		<col width="100px">
	</colgroup>
	<thead>
		<tr>
			<th scope="col">상위메뉴코드</th>
			<th scope="col">메뉴코드</th>
			<th scope="col">메뉴명</th>
			<th scope="col">정렬순서</th>
			<th scope="col">경로명</th>
			<th scope="col">이미지파일명</th>
			<th scope="col">사용여부</th>
			<th scope="col">등록일시</th>
			<th scope="col">등록자</th>
			<th scope="col">수정일시</th>
			<th scope="col">수정자</th>
		</tr>
	</thead>
	<tbody>
	<% 
	for(int i=0; i<size; i++) {
		EgovMap map = (EgovMap)data.get(i);
	%>
		<tr>
			<td><%=StringUtils.defaultIfEmpty((String)map.get("상위메뉴코드"), "")%></td>
			<td><%=StringUtils.defaultIfEmpty((String)map.get("메뉴코드"), "")%></td>
			<td><%=StringUtils.defaultIfEmpty((String)map.get("메뉴명"), "")%></td>
			<td><%=StringUtils.defaultIfEmpty((String)map.get("정렬순서"), "")%></td>
			<td><%=StringUtils.defaultIfEmpty((String)map.get("경로명"), "")%></td>
			<td><%=StringUtils.defaultIfEmpty((String)map.get("이미지파일명"), "")%></td>
			<td><%=StringUtils.defaultIfEmpty((String)map.get("사용여부"), "")%></td>
			<td><%=StringUtils.defaultIfEmpty((String)map.get("등록일시"), "")%></td>
			<td><%=StringUtils.defaultIfEmpty((String)map.get("등록자"), "")%></td>
			<td><%=StringUtils.defaultIfEmpty((String)map.get("수정일시"), "")%></td>
			<td><%=StringUtils.defaultIfEmpty((String)map.get("수정자"), "")%></td>
		</tr>
	<%
	}
	%>
	</tbody>
</table>	
</body>
</html>