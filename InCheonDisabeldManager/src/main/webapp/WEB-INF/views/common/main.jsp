<%@page import="kr.co.grit.common.util.SessionUtil, java.util.Map, java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");

	if(userInfo == null || userInfo.get("userId") == null) {
%>
<html lang="ko">
<head>
<script type="text/javascript">
alert("비정상 접속입니다.");
window.location = '/common/login';
</script>
</head>
</html>
<%
	} else {

	String serverNm = request.getServerName();

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
	<link rel="stylesheet" type="text/css" href="/resources/css/newmanager.css"/>
	 -->
	<link rel="stylesheet" type="text/css" href="/resources/cssV2/collection.css"/>
	<!-- jQuery Validate -->
	<script type="text/javascript" src="/resources/js/jquery/jquery-1.9.0.min.js"></script>
	<script type="text/javascript" src="/resources/js/jquery/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="/resources/js/jquery/jquery.form.min.js"></script>
	<script type="text/javascript" src="/resources/js/jquery/jquery.ui.datepicker.customize.min.js"></script>
	<script type="text/javascript" src="/resources/js/jquery/jquery.mtz.monthpicker.min.js"></script>
	<script type="text/javascript" src="/resources/js/jquery/jquery.cookie.js"></script>
	<script type="text/javascript" src="/resources/js/jquery-ui-1.12.1/jquery-ui.js"></script>
	<script type="text/javascript" src="/resources/js/json2.min.js"></script>
	
	<!-- common -->
	<script type="text/javascript" src="/resources/js/common/common_OldGrit.js"></script>
	<script type="text/javascript" src="/resources/js/common/common.min.js"></script>
	
	<!-- auiGrid -->
	<script type="text/javascript" src="/resources/js/AUIGrid_3.0.9_Trial/AUIGrid/AUIGridLicense.js"></script>
	<script type="text/javascript" src="/resources/js/AUIGrid_3.0.9_Trial/AUIGrid/AUIGrid.js"></script>
	<!-- ubiReport -->
	<!-- <script type="text/javascript" src="/resources/js/ubi4/js/*.js"></script> -->
	
	<link rel="stylesheet" type="text/css" href="/resources/js/AUIGrid_3.0.9_Trial/AUIGrid/AUIGrid_style.css"/>
	<style>
	body {
		overflow-y: hidden; overflow-x: hidden;
	}
	
	#contentWrap { 
		padding-bottom:10px !important;
	}

	.aui-grid {
		border : solid 1px #b7b7b7 !important
	}
	
	.aui-grid-left-main-panel, .aui-grid-main-panel {
		border-top: 2px solid#5c78a7 !Important;
	}
	
	.aui-grid-default-header {
	    /*display: table-cell !important;*/
	    vertical-align: middle !important;
		text-align: center !Important;
		background: #cad4e5;
	}
	
	.aui-grid-default-header div span {
		font-size: 14px;
		font-weight: 700;
	}
	
	.aui-grid-header-panel .aui-grid-table tr td {
	    border-top: none;
	    border-right: 1px solid #b7b7b7 !Important;
	    border-bottom: 1px solid #b7b7b7 !Important;
	    border-left: none;
	}
	
	.aui-grid-fixed-column-rule {
		background:none !Important
	}

	.aui-grid-default-column, .aui-grid-row-num-column { 
	    display: table-cell !important;
	    vertical-align: middle !important;
	    text-align: center !important;
	}
	
	.aui-grid-button-percent-width {
		width:100%;
	}
	
	.my-column-center {
		text-align: center !important;
	}
	
	.my-column-right {
		text-align: right !important;
	}
	
	.my-column-left {
		text-align: left !important;
	}
	
	/*colspan 의 경우 가운데 낀 칼럼 우측 보더 제거*/
	.my-column-nobdr {
		border-right:none !important;
		text-align:left !important
	}
	
	</style>
		
	<!-- auiGrid excel download -->
	<script type="text/javascript" src="/resources/js/AUIGrid_3.0.9_Trial/export_server_samples/FileSaver.min.js"></script>

</head>
<body>
	<!-- publish start -->
	<div id="wrap" class="bodyWrapper">

	
	
	    <!-- leftFrame : start  -->
        <div id="headerWrap" class="leftFrame">
            <div><img src="/resources/imagesV2/logoIncheon.png" class="logoIncheon" alt="인천광역시"></div>
            <div class="appTitle" data-title="홈" data-layername="home" data-pageinfo="/common/home" title="메인으로 이동"><span class="appTitleBold">장애인복지</span><span class="appTitleLight">통합플랫폼</span></div>
            <div class="userDivision"></div>
            <!-- userInfoWrap : start -->
            <div class="userInfoWrap">
                <span class="userName user-info">홍길동</span><button type="button" class="btnLogout btn-logout" title="로그아웃" style="cursor:pointer;"></button>
            </div>
            <!-- userInfoWrap : send -->
            <!-- leftMenuWrap: start -->
            <div id="lnbWrap" class="leftMenuWrap"></div>    
            <!-- leftMenuWrap: end -->
        </div>
        <!-- leftFrame : end  -->     
        
        <div class="foldBtnWrap"><button type="button" class="foldBtn" onclick="foldLeftMenu()"><img src="/resources/imagesV2/iconFold.png" class="foldBtnImg"></button></div>
        
        <!-- mainFrame : start  -->
        <div id="contentWrap" class="mainFrame">
            <!-- mdi button :start -->
            <div class="topMdiWrap">
                <!-- <div class="mdi active">MDI 제목MDI 제목MDI 제목MDI 제목MDI 제목 <button type="button" class="mdiCloseBtn"><img src="../images/mdiClose.png"></button></div>
                <div class="mdi tabClose">MDI 제목 <button type="button" class="mdiCloseBtn"><img src="../images/mdiClose.png"></button></div> -->
            </div>
            <div class="mdiMoveBtnWrap">
                <button type="button" class="mdiPrev">prev</button>
                <button type="button" class="mdiNext">next</button>
            </div>
            <!-- mdi button :end -->
            
            <!-- content : start -->
            <div class="contentsWrap section-wrap">
            
            </div>
            <!-- content : end -->

			
            
        </div>
    </div>
    <!-- mainFrame : end  -->
    
    <!-- footer : start -->
    <footer id="footerWrap">
        <span>프로그램 ID : <span class="program_name"></span></span>
        <span>접속 IP : <span class="enterIp"></span></span>
        <span>접속 시간 : <span class="enterTime"></span></span>
        <div class="currentTime current-time"></div>
    </footer>
    <!-- footer : end -->
    <!-- <script src="../scripts/common.js"></script>  -->
       
	<!-- publish end -->

</body>
<script type="text/javascript" src="/resources/js/common/common_fnc.js"></script>
<script type="text/javascript" src="/resources/js/common/ui.js"></script>
<script type="text/javascript" src="/resources/js/common/main_fnc.js"></script>
<script>
$(document).ready(function () {
	// mdi 숨겨진 버튼 보이기
	// mdi 숨겨진 버튼 이동 시 x좌표 제한하기
	var mdiMoving = false;
	$(".mdiNext").on("click", function () {

		var limitLeftValue = $(".mdi:last-child").offset().left;
	    if (limitLeftValue < 1300) return;
	    if (mdiMoving == false)
	    {
	        mdiMoving = true; 
	        $(".mdi").stop().animate({ left: "-=150" }, 500, function () {
	            //animation complete
	            mdiMoving = false;
	        });
	    }
	});
	
	// mdi 숨겨진 버튼 보이기
	// mdi 숨겨진 버튼 이동 시 x좌표 제한하기
	$(".mdiPrev").on("click", function () {

		var limitLeftValue = $(".mdi:first-child").offset().left;
	    if (limitLeftValue > 125) return;
	    if (mdiMoving == false)
	    {
	        mdiMoving = true; 
	        $(".mdi").stop().animate({ left: "+=150" }, 500, function () {
	            //animation complete
	            mdiMoving = false;
	        });
	    }
	});
	
});

//left frame menu 펼치기/ 접기
function expandMenu(index) {
    if ($(".menuDepth2").eq(index).css("display") == "none") {
        $(".menuDepth2").eq(index).slideDown();
        $(".menuDepth1").eq(index).addClass("active");
    }
    else {
        $(".menuDepth2").eq(index).slideUp();
        $(".menuDepth1").eq(index).removeClass("active");
    }
}

// left frame 접기, 펼치기
function foldLeftMenu() {
	var pgmId = $('#footerWrap .program_name').text();
	var menuId = $('#footerWrap .program_name').text();
	
	menuId = "#"+menuId;
	var fullWidth = $(window).innerWidth() - 55;
	
	if ($(".leftFrame").is(":visible") == true)
    {
        $(".leftFrame").hide();
        $(".foldBtnImg").addClass("foldBtnImgRotate");
        
        //grid width 조절
    	if (fullWidth == $(menuId+"grid_wrap").width()){
    		contentWH(menuId,fullWidth,$(menuId).height());
    	}	
        
    	if (pgmId == 'SYS003'){
			contentWH2(menuId,fullWidth-470,$(menuId).height());
		}
    } else {
        $(".leftFrame").show();
        $(".foldBtnImg").removeClass("foldBtnImgRotate");
        
        //grid width 조절
        if (fullWidth == $(menuId+"grid_wrap").width()){
    		contentWH(menuId,fullWidth-270,$(menuId).height());
        }	
        
        if (pgmId == 'SYS003'){
	    	contentWH2(menuId,fullWidth-270-470,$(menuId).height());
		}
    }
    
	
}
</script>
</html>
<%}%>