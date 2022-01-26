<%@page import="kr.co.grit.common.util.SessionUtil, java.util.Map, java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	/* String layerName = "PMT100"; */
	String layerName = request.getParameter("layerName");
%>
<jsp:include page="../common/commonPopTop.jsp">
	<jsp:param value="<%=layerName%>" name="layerName"/>
</jsp:include>

<body>	
	
    <div class="popupWrapper minWidth650">
    	<h1>사용자 비밀번호 변경</h1>
        <!-- conditionTable : start -->
        <form id="<%=layerName%>inputForm" name="<%=layerName%>inputForm"  onsubmit="return false;" autocomplete='off'>
        <table class="dataTable marginT20">
            <colgroup>
                <col style="width:140px">
                <col style="width:200px">
                <col style="width:140px">
                <col style="width:auto">
            </colgroup>
            <tbody>
                <tr>
                	<th>사용자코드</th>
                    <td >
						<input type="text" name="userId" id="userId" style="width:100%" disabled>
                    </td>
                    <th>사용자명</th>
                    <td>
                        <input type="text" name="userNm" id="userNm" style="width:100%" disabled>
                    </td>
				</tr>
            </tbody>
        </table>
        <!-- conditionTable : end -->
        
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
                                </div>
                            </div>
								<table cellpadding="0" cellspacing="0" class="dataTable" id="align_common" border="1">
								<input type="hidden" id="hiddenPwd" name="hiddenPwd" />
									<colgroup>
										<col width="15%" />
										<col width="35%" />
									</colgroup>
									<tr>
										<th>이전 비밀번호</th>
										<td>
											<input type="password" name="prePwd" />  
										</td>
									</tr>
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
	    
<script type="text/javascript" >
	// AUIGrid 생성 후 반환 ID
	var myGridID;
	$(function () {
			$("#userId").val($(opener.document).find(".<%=layerName%> #userId").val());
			$("#userNm").val($(opener.document).find(".<%=layerName%> #userNm").val());
			$("#hiddenPwd").val($(opener.document).find(".<%=layerName%> #hiddenPwd").val());
			
			$('input[name=prePwd]').focus();
		});
	
	var <%=layerName%>Js = {

			goModifyPwd: function(){
				var inputForm = $("form[name='<%=layerName%>inputForm']");

				var userId = $("input[name='userId']", inputForm).val();
				var prePwd = $.trim($("input[name='prePwd']", inputForm).val());
				var pwd = $.trim($("input[name='pwd']", inputForm).val());
				var confPwd = $.trim($("input[name='confPwd']", inputForm).val());
				var hiddenPwd = $.trim($("input[name='hiddenPwd']", inputForm).val());
				
				//var pwReg = /^(?=.*[a-zA-Z])(?=.*[@.-_])(?=.*[0-9]).{8,16}$/;
				//var pwReg = /^(?=.*[a-zA-Z])(?=.*[@.\-_])(?=.*[0-9]).{8,16}$/;
				// var pwReg =  /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@.\-_])[A-Za-z\d@.\-_]{8,16}$/.test
				
				 
				if(prePwd == ""){
					GRIT.msg.alert("이전 비밀번호를 입력하여 주세요.", function(){$("input[name='prePwd']", inputForm).focus();}());
					return;
				}
				
				if(!/^(?=.*[A-Za-z])(?=.*\d)(?=.*[@.\-_])[A-Za-z\d@.\-_]{9,16}$/.test(pwd)){
					GRIT.msg.alert("비밀번호는 영문/숫자/특수문자를  포함하여 최소 9자리 ~ 최대 16자리 입니다.", function(){$("input[name='pwd']", inputForm).focus();}());
					return;
				}
				
				if(pwd == prePwd){
					GRIT.msg.alert("동일한 비밀번호로 변경할 수 없습니다.", function(){$("input[name='pwd']", inputForm).focus();}());
					return;
				}

				if(confPwd == ""){
					GRIT.msg.alert("비밀번호 확인을 입력하여 주세요.", function(){$("input[name='confPwd']", inputForm).focus();}());
					return;
				}

				if(pwd != confPwd){
					GRIT.msg.alert("새 비밀번호와 비밀번호 확인이 일치하지 않습니다.", function(){$("input[name='confPwd']", inputForm).focus();}());
					return;
				}
				
				var sendData = {
						"userId"    : userId,
						"prePwd"    : prePwd,
						"pwd"       : pwd,
						"hiddenPwd" : hiddenPwd
				};

				GRIT.tran.send({
					url: "/bas/changeSysPassword",
					sendData: sendData,
					success: function(result){
						if(result.rtnCode == "0") {
							alert("비밀번호를 변경하였습니다.");		
							window.opener.<%=layerName%>setNewPassword(result.pwd, window.name);
							window.close();	
						
						} else if(result.rtnCode == "9") {
							GRIT.msg.alert("이전 비밀번호가 맞지 않습니다.");
							//alert("이전 비밀번호가 맞지 않습니다.");
						}
					},
					loading: false
				});

			}
	};

	
	//수정
	$('form[name="<%=layerName%>inputForm"] #chgPwdConfirm').click(function(){
		<%=layerName%>Js.goModifyPwd();
	});
	
	$('form[name="<%=layerName%>inputForm"] #chgPwdCancel').click(function(){
		window.close();
	});
</script>
</html>
