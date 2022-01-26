﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	/* 사용자 접속 IP 정보 */
	String loginIp = request.getRemoteAddr();
	String timeOutYn = request.getParameter("timeOut")==null ? "" : request.getParameter("timeOut");

	if("y".equals(timeOutYn)) {
%>
	<script language='javascript'>
		parent.window.location.href="/common/login"
	</script>
<%
	}
	
	String errPathYn = request.getParameter("errPathYn"); 
	
	if("y".equals(errPathYn)) {
%>
	<script language='javascript'>
	alert("비정상 접속입니다.");
	</script>
<%
	}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Script-Type" content="text/javascript">
<meta http-equiv="Content-Style-Type" content="text/css">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>인천 장애인 통합 플랫폼  로그인</title>

<!--  
<link rel="stylesheet" type="text/css" href="/resources/js/jquery-ui-1.12.1/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="/resources/css/grit.css">
<link rel="stylesheet" type="text/css" href="/resources/css/grit_ext.css">
-->
<link rel="stylesheet" href="/resources/cssV2/collection.css">
<link rel="stylesheet" href="/resources/cssV2/login.css">

<script type="text/javascript" src="/resources/js/jquery/jquery-1.9.0.min.js"></script>

<script type="text/javascript" src="/resources/js/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery/jquery.form.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery/jquery.ui.datepicker.customize.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery/jquery.mtz.monthpicker.min.js"></script>

<script type="text/javascript" src="/resources/js/jquery/jquery.cookie.js"></script>
<script type="text/javascript" src="/resources/js/jquery-ui-1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="/resources/js/json2.min.js"></script>
<script type="text/javascript" src="/resources/js/common/common.min.js"></script>

<script type="text/javascript" src="/resources/js/common/common_fnc.js"></script>
<script type="text/javascript" src="/resources/js/common/login_fnc.js"></script>
<script type="text/javascript" src="/resources/js/common/sha256.js"></script>


<style type="text/css">
html{overflow:auto}
</style>
</head>
<body>
    <div class="loginFrame">
        <div><img src="/resources/imagesV2/logoIncheon.png" class="logoIncheonLogin"></div>
        <div><span class="appTitleBoldLogin">장애인복지</span><span class="appTitleLightLogin">통합플랫폼</span></div>
        <div class="formIDWrap"><span class="loginID">아이디</span><input type="text" class="loginIDInput" id="loginId" name="loginId" onkeypress="nextFocus(this);" autocomplete='off'></div>
        <div class="formPwWrap"><span class="loginPW">비밀번호</span><input type="password" class="loginPWInput" id="loginPw" name="loginPw" onkeypress="nextFocus(this);"></div>
        <div class="loginBtnWrap btn_login"><button type="button" class="loginBtn" style="cursor:pointer;" onclick="fn_loginButtonBlur()">로그인</button></div>
        <div class="securityPolicyWrap login_footer"><a href="javascript:;" onblur="blur()"  onclick="fn_searchPop();fn_searchPopBlur();">개인정보취급방침 <img src="/resources/imagesV2/iconFooterArrowRight.svg" class="iconFooterArrowRight"></a></div>
        <div class="copyrightWrap">Copyrightⓒ Incheon Metropolitan City.All rights reserved</div>
        <input type="hidden" id="lastLoginIp" name="lastLoginIp" value="<%=loginIp%>" >
    </div>



</body>

<script type="text/javascript">
$(function () {
	$("#loginId").focus();
});


function nextFocus(obj){
	if(obj.id == "loginId") {
		if(event.keyCode == 13){
			$("#loginPw").focus();
		}
	} else if(obj.id == "loginPw") {
		if(event.keyCode == 13){
			if($("#alert_wrap").size() > 0){
				$(".popupclose").click();
			}else{
				//$("#login_container .btn_login img").click();
				$(".loginBtn").click();
			}
		}
	}
}

// 포커스 해제
function fn_loginButtonBlur(){
	$('.loginBtn').blur();
}

 //포커스 해제
function fn_searchPopBlur(){
	$('.iconFooterArrowRight').blur();
	if($("#privacyPolicyPop_wrap").size() > 0){
		$(".popupclose").click();
	}
}

// 개인정보취급방침 팝업
function fn_searchPop(){

	$.ajax({
	    url: '/pop/privacyPolicyPop' ,
	    type: 'post',
	    datatype: 'html',
	    contentType: "application/html; charset=utf-8",
	    success: function(data){
	    	mFnc.layerPopup('privacyPolicyPop',700,800);
	    	mFnc.layerPopupADD('privacyPolicyPop', data );
	    	return;
		},
		error: function() {
			mFnc.layerError();
			return;
		}
});
		 
}
</script>
</html>