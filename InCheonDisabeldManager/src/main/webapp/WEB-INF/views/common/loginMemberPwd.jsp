<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String layerName = "loginMemberPwd";
	String userId = request.getParameter("userId")==null ? "" : request.getParameter("userId");
	String fromPage = request.getParameter("fromPage")==null ? "" : request.getParameter("fromPage");
%>
<div class="popup_content">

<form name="<%=layerName%>inputForm">

<div class="popupWrapper minWidth650">
    	<h1>비밀번호 변경</h1>
        <form id="<%=layerName%>inputForm" name="<%=layerName%>inputForm"  onsubmit="return false;" autocomplete='off'>
        
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
                         <div class="subtitle">회원정보</div>
                         <div class="subBtnGroup">
                         <div class="subMsg"> ＊ 초기 비밀번호로 로그인 및 비밀번호 변경 3개월 지났을 시 변경</div>
                         </div>
                     </div>
					<table cellpadding="0" cellspacing="0" class="dataTable" id="align_common" border="1">
					<input type="hidden" name="userId" value="<%=userId%>"/>
						<colgroup>
							<col width="15%" />
							<col width="35%" />
						</colgroup>
						<tr>
							<th>새 비밀번호</th>
							<td>
								<input type="password" name="pwd" /> 
							</td>
						</tr>
						<tr>
							<th>비밀번호 확인</th>
							<td>
								<input type="password" name="confPwd" />
							</td>
						</tr>
					</table>
			    </form>                            
                     </td>
                 </tr>
             </table>
            <div class="readMsg">
            <div>＊ 비밀번호 입력조건</div>
			<div>&nbsp;&nbsp;&nbsp;&nbsp; - 영문, 숫자, 특수문자 조합 (9 ~ 16자)</div>
			<div>&nbsp;&nbsp;&nbsp;&nbsp; - 입력 가능 특수문자 종류 : @ (@기호) . (마침표) - (하이폰/대시) _ (밑줄)</div>
			</div>
			<br/>
			<div align="center">
				<button type="button" id="chgPwdConfirm" class="popupSearchBtn">수정</button>
				<button type="button" id="chgPwdCancel" class="popupSearchBtn">닫기</button>
			</div>
			</form>
		  </div>
  <!-- popupWrapper : end  -->
	    
<script type="text/javascript">
$(function () {
	$('input[name=pwd]').focus();
});



var <%=layerName%>Js = {

	goModifyPwd: function(){

		var inputForm = $("form[name='<%=layerName%>inputForm']");

		var userId = $("input[name='userId']", inputForm).val();
		var pwd = $.trim($("input[name='pwd']", inputForm).val());
		var confPwd = $.trim($("input[name='confPwd']", inputForm).val());

		if(pwd == ""){
			alert("비밀번호를 입력하여 주세요.", function(){$("input[name='pwd']", inputForm).focus();}());
			return;
		}
		
		if(pwd == "a1234567@"){
			alert("동일한 비밀번호로 변경 할 수 없습니다.", function(){$("input[name='pwd']", inputForm).focus();}());
			return;
		}

		if(!/^(?=.*[A-Za-z])(?=.*\d)(?=.*[@.\-_])[A-Za-z\d@.\-_]{9,16}$/.test(pwd)){
			alert("비밀번호는 영문/숫자/특수문자를  포함하여 최소 9자리 ~ 최대 16자리 입니다.", function(){$("input[name='pwd']", inputForm).focus();}());
			return;
		}

		if(confPwd == ""){
			alert("비밀번호 확인을 입력하여 주세요.", function(){$("input[name='confPwd']", inputForm).focus();}());
			return;
		}

		if(pwd != confPwd){
			alert("새 비밀번호와 비밀번호 확인이 일치하지 않습니다.", function(){$("input[name='confPwd']", inputForm).focus();}());
			return;
		}

		var sendData = {
				"userId": userId,
				"pwd": pwd
		};

		GRIT.tran.send({
			url: "/common/chageMemberPwd",
			sendData: sendData,
			success: function(result){
				if(result.rtnCode == "0") {
					alert("비밀번호를 변경하였습니다.\n새로운 비밀번호로 로그인 해주세요.");
					mFnc.layerClose("<%=layerName%>");
					window.location.href = "/common/login";
				}
			},
			loading: false
		});

	}
};


//저장
$('form[name="<%=layerName%>inputForm"] #chgPwdConfirm').click(function(){
	<%=layerName%>Js.goModifyPwd();
});

$('form[name="<%=layerName%>inputForm"] #chgPwdCancel').click(function(){
	 mFnc.layerClose("<%=layerName%>");
});

function fnReturn(){}

</script>
