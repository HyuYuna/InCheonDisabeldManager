<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
    String n = request.getParameter("n");
    String msg = request.getParameter("msg");
    System.out.println("1 : " + n);
    System.out.println("2 : " + msg);
%>
<script type="text/javascript">

$(document).ready(function(){
	
	$("#alert_wrap").attr("tabindex", -1).focus();
	
	var replace = $('#msg').html().replace(/&amp;lt;br&amp;gt;/gi,"<br>").replace(/&amp;&amp;#35;40;/gi,"(").replace(/&amp;&amp;#35;41;/gi,")"); 
	$('#msg').html(replace);

    $(window).keypress(function (e) {
		if(e.keyCode == 13){//키가 13이면 실행 (엔터는 13)
			mFnc.layerClose("<%=n%>");
        }
 
    });
    
});
 
</script>

    <div class="popupWrapper minWidth300">
        <div class="errorMessageWrap">
            <img src="/resources/imagesV2/iconCaution.png"><br/>
           <%--  <%= msg %> --%>
          <span id="msg"><%= msg %></span>
        </div>
        <div class="popupConfirmBtnWrap"><button type="button" class="popupConfirmBtn popupclose" data-pname="<%= n %>"">확인</button></div>

    </div>
<!--  
<h1>알림</h1>
<div class="popup_content">
	<div class="err_box">
	<p class="txt_err"><em class="img_alert"></em><span id=msg><%= msg %></span></p>
	</div>
</div>
<div class="btn_cent">
<a href="#"><img src="/resources/images/btn_ok.gif" class="popupclose" data-pname="<%= n %>"></a>
</div>
-->