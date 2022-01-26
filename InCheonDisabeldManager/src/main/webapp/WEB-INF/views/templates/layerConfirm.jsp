<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
    String n = request.getParameter("n");
    String msg = request.getParameter("msg");
    String yes = request.getParameter("yes");
    String no = request.getParameter("no");
%>
<h1>알림</h1>
<div class="popup_content">
	<div class="err_box">
	<p class="txt_err"><em class="img_alert"></em><span><%= msg %></span></p>
	</div>
</div>
<div class="btn_cent">
	<a href="javascript:<%=yes%>('<%=n%>');"><img src="/resources/images/btn_yes.gif" alt="예"></a>
	<%if (no != null && no != "") {%>
		<a href="javascript:<%=no%>('<%=n%>');"><img src="/resources/images/btn_no.gif" alt="아니오"></a>
	<%} else {%>
		<a href="javascript:;"><img src="/resources/images/btn_no.gif" class="popupclose" data-pname="<%= n %>" alt="아니오"></a>
	<%}%>
</div>
