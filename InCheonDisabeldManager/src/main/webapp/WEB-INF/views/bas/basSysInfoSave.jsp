<%@ page import="kr.co.grit.common.util.SessionUtil"%>
<%@ page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%
    String layerName = request.getParameter("layerName");
%>
	
<!-- titleWrap : start -->
                <div class="titleWrap">
                    <h1>사용자정보 수정</h1>
					<jsp:include page="../common/commonBtn.jsp">
						<jsp:param value="<%=layerName%>" name="layerName" />
					</jsp:include>                    
                </div>
                <!-- titleWrap : end -->

                <!-- layout table : start -->
                <table class="layoutTable">
                    <colgroup>
                        <col style="width:450px;">
                        <col style="width:30px;">
                        <col style="width:auto;">
                    </colgroup>
                    <tr>
                        <td>
                            <div class="subtitleGroup">
                                <div class="subtitle">사용자 정보</div>
                                <div class="subBtnGroup">
                                </div>
                            </div>
							<form name="userInfoForm" id="userInfoForm" method="post" autocomplete="off">
								<table cellpadding="0" cellspacing="0" class="dataTable" id="align_common" border="1">
								 		<input type="hidden" id="hiddenPwd"  name="hiddenPwd" value="${userInfo.hiddenEncPassword}" />
				                    	<input type="hidden" id="userId"     name="userId" value="${userInfo.userId}" />  
				                        
									<colgroup>
										<col width="140px" />
										<col width="auto" />
									</colgroup>
									<tr>
										<th>사용자코드</th>
										<td colspan="2">
											<input type="text" id="userId" name="userId" value="${userInfo.userId}" style="width:26%"  title="사용자코드"  disabled>   
										</td>
									</tr>
									<tr>
										<th>사용자그룹</th>
										<td colspan="2">
											<input type="text" id="userGroupNm" name="userGroupNm" value="${userInfo.userGroupNm}" style="width:26%"  title="사용자그룹명"  disabled>
										</td>
									</tr>
									<tr>
										<th><span class="essentialItem">사용자명<span></th>
										<td colspan="2">
											<input type="text" id="userNm" name="userNm" value="${userInfo.userNm}" title="사용자명" style="width:26%" tabindex="1" onkeyup="checkByte(this, 40)" > 
										</td>
									</tr>
									<tr>
										<th>비밀번호</th>
										<td colspan="2">
											<input type="password" id="encPassword" name="encPassword" style="width:26%" title="비밀번호" tabindex="3" maxlength="16" readonly>
											<button type="button" class="normalBtn" onclick="<%=layerName%>fn_ChangePasswrod(); return false;">비밀번호 변경</button> 
										</td>
									</tr>
									<tr>
										<th>복지시설</th>
										<td colspan="2">
												<input type="text" id="linkNm" name="linkNm" value="${userInfo.linkNm}" style="width:26%"  title="복지시설명"  disabled>   
										</td>	
									</tr>
									<tr>
										<th>사용여부</th>
				                        <c:choose>
			                    		<c:when test="${userInfo.useFg eq 0}">
			                            <td colspan="2"><input type="text" id="useFg" name="useFg" value="미사용" style="width:26%;" title="사용여부" disabled> </td>
			                            </c:when>
			                            <c:when test="${userInfo.useFg eq 1}">
			                            <td colspan="2"><input type="text" id="useFg" name="useFg" value="사용"  style="width:26%;" title="사용여부"  disabled> </td>
			                            </c:when>
			                            </c:choose>
									</tr>
								</table>
						    </form>                            
                        </td>
                    </tr>
                </table>
                <!-- layout table : end -->

<style type="text/css" >

</style>

<script type="text/javascript" >
	
	// 저장
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .save').click(function(){
		<%=layerName%>fn_saveSysInfo();
	});
	
	
	// 닫기
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .close').click(function(){
		mFnc.tabMenuClose('<%=layerName%>');
	});
	
	
	$(function () {
		$(".<%=layerName%> #userNm").focus();
	});
	
	
	//저장 체크
	function <%=layerName%>fn_saveSysInfo() {	
		if ( $(".<%=layerName%> #userNm").val() == "" ) {
			$(".<%=layerName%> #userNm").focus();
			GRIT.msg.alert("[사용자명]은 필수 항목입니다."); return;
		}
		
		
		if(confirm("저장 하시겠습니까?")){
			<%=layerName%>fn_save();
	    } 
	}
	
	//저장
	function <%=layerName%>fn_save(){
        
		var sendData = $(".<%=layerName%> form[name=userInfoForm]").serializeObject();
		console.log(sendData);
         GRIT.tran.send({
			url: "/bas/sysInfoSave",
			async: false,
			sendData: sendData,
			success: function(result){
				
				
				GRIT.msg.alert(result.message);
			
			},
 			loadingTarget: "<%=layerName%>"
 		}); 
	}
	
	// 비밀번호 팝업
 	function <%=layerName%>fn_ChangePasswrod(){
 		
		 var layerName = "<%=layerName%>"; 
		 var url = "<c:url value='/pop/changePasswordPop?layerName="+layerName+"'/>";
		 var width="700";
		 var height="400";
		 var name="changePasswrod";
		 popitup(url, height, width, name);
	} 
	
 	// 비밀번호 callback
	function <%=layerName%>setNewPassword (pwd,  name) {
		var pwd = pwd;
		//10자리까지 보이게 설정
		pwd = pwd.substr(0,9);
		
		$(".<%=layerName%> #encPassword").val(pwd);
	}
	

	
</script>

