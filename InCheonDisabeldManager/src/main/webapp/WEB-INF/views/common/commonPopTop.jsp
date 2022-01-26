<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String layerName = request.getParameter("layerName");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta http-equiv="Content-Script-Type" content="text/javascript">
	<meta http-equiv="Content-Style-Type" content="text/css">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>인천 장애인 통합 플랫폼</title>
	
	<link rel="stylesheet" type="text/css" href="/resources/js/jquery-ui-1.12.1/jquery-ui.css">
	<!-- 
	<link rel="stylesheet" type="text/css" href="/resources/css/grit.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/grit_ext.css">
	 -->
	<link rel="stylesheet" href="/resources/cssV2/collection.css">
	<script type="text/javascript" src="/resources/js/jquery/jquery-1.9.0.min.js"></script>
	<script type="text/javascript" src="/resources/js/jquery/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="/resources/js/jquery/jquery.form.min.js"></script>
	<script type="text/javascript" src="/resources/js/jquery/jquery.ui.datepicker.customize.min.js"></script>
	<script type="text/javascript" src="/resources/js/jquery/jquery.mtz.monthpicker.min.js"></script>
	<script type="text/javascript" src="/resources/js/jquery/jquery.cookie.js"></script>
	<script type="text/javascript" src="/resources/js/jquery-ui-1.12.1/jquery-ui.js"></script>
	<script type="text/javascript" src="/resources/js/json2.min.js"></script>

	
	<script type="text/javascript" src="/resources/js/common/common.min.js"></script>
	<script type="text/javascript" src="/resources/js/common/sha256.js"></script>

	<!-- 기존  asp 버젼 설정용 -->
	<link rel="stylesheet" type="text/css" href="/resources/css/newmanager.css"/>
	<script type="text/javascript" src="/resources/js/common/common_OldGrit.js"></script>
	<!-- auiGrid -->
	<script type="text/javascript" src="/resources/js/AUIGrid_3.0.9_Trial/AUIGrid/AUIGridLicense.js"></script>
	<script type="text/javascript" src="/resources/js/AUIGrid_3.0.9_Trial/AUIGrid/AUIGrid.js"></script>
	<link rel="stylesheet" type="text/css" href="/resources/js/AUIGrid_3.0.9_Trial/AUIGrid/AUIGrid_style.css"/>
	<style>
	.aui-grid-default-header {
	    display: table-cell !important;
	    vertical-align: middle !important;
		text-align: center !Important;
		background: #cad4e5;
		border-top: 2px solid#5c78a7 !Important;
	}
	
	.aui-grid-default-header div span {
		font-size: 14px;
		font-weight: 700;
	}
	
	.aui-grid-default-column, .aui-grid-row-num-column { 
	    display: table-cell !important;
	    vertical-align: middle !important;
	}
	</style>
</head>