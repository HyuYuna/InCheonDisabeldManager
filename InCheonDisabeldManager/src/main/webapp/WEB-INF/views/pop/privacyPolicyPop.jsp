<%@page import="kr.co.grit.common.util.SessionUtil, java.util.Map, java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String layerName = "privacyPolicyPop";
System.out.println(layerName);
%>
<jsp:include page="../common/commonPopTop.jsp">
	<jsp:param value="<%=layerName%>" name="layerName"/>
</jsp:include>

<body>	
	
    <div class="popupWrapper minWidth650">
    	<h1>개인정보처리방침</h1>
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
            </tbody>
        </table>
        <!-- conditionTable : end -->
        
         <!-- layout table : start -->
                <table class="layoutTable">
                    <tr>
                        <td>
<div class="nostyle" style="overflow-y:auto; overflow-x:hidden; width:100%; height:650px; bor: 1px solid black;">
<span style="line-height:100%"><span style="text-autospace:none">인천광역시<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">(</span></span>이하 단체<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">)</span></span>는 개인정보보호법에 따라 이용자의 개인정보 보호 및 권익을 보호하고<br>
개인정보와 관련한 이용자의 고충을 원활하게 처리할 수 있도록 다음과 같은 처리방침을 두고 있습니다<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">.</span></span></span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">&nbsp;</span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">단체는 개인정보처리방침을 개정하는 경우 웹사이트 공지사항<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">(</span></span>또는 개별공지<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">)</span></span>을 통하여 공지할 것입니다<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">.</span></span></span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">&nbsp;</span></span><br>
<span style="font-size:18px;"><span style="color:#000000;"><span style="line-height:100%"><span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt"><span style="font-weight:bold">1. </span></span></span><span style="font-weight:bold">개인정보 수집 및 이용 목적</span></span></span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">&nbsp;</span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">단체는 개인정보를 다음의 목적을 위해 처리합니다<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">. </span></span>처리한 개인정보는 다음의 목적이외의 용도로는 사용되지 않으며 이용 목적이 변경될 시에는 사전동의를 구할 예정입니다<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">.</span></span></span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">&nbsp;</span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">가<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">. </span></span>민원사무 처리</span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">민원인의 신원 확인<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">, </span></span>민원사항 확인<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">, </span></span>사실조사를 위한 연락<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">·</span></span>통지<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">, </span></span>처리결과 통보 등을 목적으로 개인정보를 처리합니다<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">.</span></span></span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">&nbsp;</span></span><br>
<span style="color:#000000;"><span style="font-size:18px;"><span style="line-height:100%"><span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt"><span style="font-weight:bold">2. </span></span></span><span style="font-weight:bold">수집하는 개인정보의 항목 및 수집방법</span></span></span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">&nbsp;</span></span><br>
<span style="line-height:100%"><span style="text-autospace:none"><span style="letter-spacing:0.0pt"><span style="font-weight:bold">① </span></span><span style="font-weight:bold">수집 항목</span></span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">&nbsp;</span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">가<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">. </span></span>자동 수집</span></span><br>
<span style="line-height:100%"><span style="text-autospace:none"><span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">- </span></span><span style="font-weight:bold">접속 </span><span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt"><span style="font-weight:bold">IP </span></span></span><span style="font-weight:bold">정보</span><span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt"><span style="font-weight:bold">, </span></span></span><span style="font-weight:bold">쿠키</span><span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt"><span style="font-weight:bold">, </span></span></span><span style="font-weight:bold">서비스 이용 기록</span><span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt"><span style="font-weight:bold">, </span></span></span><span style="font-weight:bold">접속로그 등</span></span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">&nbsp;</span></span><br>
<span style="color:#000000;"><span style="font-size:18px;"><span style="line-height:100%"><span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt"><span style="font-weight:bold">3. </span></span></span><span style="font-weight:bold">개인정보 자동 수집 장치의 설치</span><span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt"><span style="font-weight:bold">·</span></span></span><span style="font-weight:bold">운영 및 거부에 관한 사항</span></span></span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">&nbsp;</span></span><br>
<span style="line-height:100%"><span style="text-autospace:none"><span style="letter-spacing:0.0pt">① </span>개별적인 맞춤서비스를 제공하기 위해 이용정보를 저장하고 수시로 불러오는 <span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">‘</span></span>쿠키<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">(cookie)’</span></span>를 사용합니다<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">.</span></span></span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">&nbsp;</span></span><br>
<span style="line-height:100%"><span style="text-autospace:none"><span style="letter-spacing:0.0pt">② </span>쿠키는 웹사이트를 운영하는데 이용되는 서버<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">(http)</span></span>가 이용자의 컴퓨터 브라우저에게 보내는 소량의 정보이며 이용자들의 <span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">PC </span></span>컴퓨터내의 하드디스크에 저장되기도 합니다<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">.</span></span></span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">&nbsp;</span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">가<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">. </span></span>쿠키의 사용 목적 <span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">: </span></span>이용자가 방문한 각 서비스와 웹 사이트들에 대한 방문 및 이용형태<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">, </span></span>인기 검색어<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">, </span></span>보안접속 여부<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">, </span></span>등을 파악하여 이용자에게 최적화된 정보 제공을 위해 사용됩니다<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">.</span></span></span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">&nbsp;</span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">나<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">. </span></span>쿠키의 설치<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">·</span></span>운영 및 거부 <span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">: </span></span>웹브라우저 상단의 <span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">‘</span></span>도구<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">&gt;</span></span>인터넷 옵션<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">&gt;</span></span>개인정보<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">’ </span></span>메뉴의 옵션 설정을 통해 쿠키 저장을 거부 할 수 있습니다<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">.</span></span></span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">&nbsp;</span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">다<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">. </span></span>쿠키 저장을 거부할 경우 맞춤형 서비스 이용에 어려움이 발생할 수 있습니다<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">.</span></span></span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">&nbsp;</span></span><br>
<span style="color:#000000;"><span style="font-size:18px;"><span style="line-height:100%"><span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt"><span style="font-weight:bold">4. </span></span></span><span style="font-weight:bold">개인정보의 처리 및 보유 기간</span></span></span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">&nbsp;</span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">가<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">. </span></span>단체는 법령에 따른 개인정보 보유<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">·</span></span>이용기간 또는 정보주체로부터 개인정보를 수집시에 동의 받은 개인정보 보유<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">,</span></span>이용기간 내에서 개인정보를 처리<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">,</span></span>보유합니다<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">.</span></span></span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">&nbsp;</span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">나<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">. </span></span>각각의 개인정보 처리 및 보유 기간은 다음과 같이 수집 목적 또는 제공 받은 목적이 달성되면 파기됩니다<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">.</span></span></span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">&nbsp;</span></span><br>
<span style="line-height:100%"><span style="text-autospace:none"><span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">- </span></span>설문조사<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">, </span></span>이벤트 등 일시적 목적을 위하여 수집한 경우 <span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">: </span></span>당해 설문조사<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">, </span></span>이벤트 등이 종료한 때</span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">&nbsp;</span></span><br>
<span style="font-size:18px;"><span style="color:#000000;"><span style="line-height:100%"><span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt"><span style="font-weight:bold">5. </span></span></span><span style="font-weight:bold">개인정보의 제</span><span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt"><span style="font-weight:bold">3</span></span></span><span style="font-weight:bold">자 제공 및 공유</span></span></span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">&nbsp;</span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">단체는 이용자의 동의가 있거나 관련 법령의 규정에 의한 경우를 제외하고는 어떠한 경우에도 <span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">"</span></span>개인정보의 수집항목 및 수집 목적<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">", "</span></span>개인정보의 이용목적<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">"</span></span>에서 고지한 범위를 넘어 이용자의 개인정보를 이용하거나 제<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">3</span></span>자에게 제공하지 않습니다<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">. </span></span>다만<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">, </span></span>다음의 경우에는 예외로 합니다<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">.</span></span></span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">&nbsp;</span></span><br>
<span style="line-height:100%"><span style="text-autospace:none"><span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">- </span></span>이용자들이 사전에 동의한 경우<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">.</span></span></span></span><br>
<span style="line-height:100%"><span style="text-autospace:none"><span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">- </span></span>서비스 제공에 따른 요금정산을 위해 필요한 경우<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">.</span></span></span></span><br>
<span style="line-height:100%"><span style="text-autospace:none"><span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">- </span></span>계약 이행을 위해 필요한 경우<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">(</span></span>제품 배송<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">/</span></span>설치<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">, </span></span>서비스 업무<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">)</span></span></span></span><br>
<span style="line-height:100%"><span style="text-autospace:none"><span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">- </span></span>타인에게 정신적<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">, </span></span>물질적 피해를 줌으로써 그에 대한 법적 조치를 취하기 위해 고객정보를 공개해야 한다고 판단되는 충분한 근거가 있는 경우<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">.</span></span></span></span><br>
<span style="line-height:100%"><span style="text-autospace:none"><span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">- </span></span>통계작성<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">, </span></span>마케팅분석 또는 시장조사를 위해 필요한 경우로 특정 개인을 식별할 수 없는 형태로 가공하여 외부 기관 또는 단체 등에 제공하는 경우<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">.</span></span></span></span><br>
<span style="line-height:100%"><span style="text-autospace:none"><span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">- </span></span>기타 관련 법령의 규정에 의하거나<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">, </span></span>수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">.</span></span></span></span><br>
<span style="line-height:100%"><span style="text-autospace:none"><span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">- </span></span>서비스의 제공에 관한 계약의 이행을 위하여 필요한 개인정보로서 경제적<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">/</span></span>기술적인 사유로 통상의 동의를 받는 것이 현저히 곤란한 경우<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">.</span></span></span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">&nbsp;</span></span><br>
<span style="color:#000000;"><span style="font-size:18px;"><span style="line-height:100%"><span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt"><span style="font-weight:bold">6. </span></span></span><span style="font-weight:bold">정보주체의 권리</span><span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt"><span style="font-weight:bold">, </span></span></span><span style="font-weight:bold">의무 및 그 행사방법 이용자는 개인정보주체로서 다음과 같은 권리를 행사할 수 있습니다</span><span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt"><span style="font-weight:bold">.</span></span></span></span></span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">&nbsp;</span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">가<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">. </span></span>정보주체는 단체에 대해 언제든지 다음 각 호의 개인정보 보호 관련 권리를 행사할 수 있습니다<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">.</span></span></span></span><br>
<span style="line-height:100%"><span style="text-autospace:none"><span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">- </span></span>개인정보 열람요구</span></span><br>
<span style="line-height:100%"><span style="text-autospace:none"><span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">- </span></span>오류 등이 있을 경우 정정 요구</span></span><br>
<span style="line-height:100%"><span style="text-autospace:none"><span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">- </span></span>삭제요구</span></span><br>
<span style="line-height:100%"><span style="text-autospace:none"><span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">- </span></span>처리정지 요구</span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">&nbsp;</span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">나<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">. </span></span>제<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">1</span></span>항에 따른 권리 행사는단체에 대해 개인정보 보호법 시행규칙 별지 제<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">8</span></span>호 서식에 따라 서면<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">, </span></span>전자우편<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">, </span></span>모사전송<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">(FAX) </span></span>등을 통하여 하실 수 있으며 단체는 이에 대해 지체 없이 조치하겠습니다<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">.</span></span></span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">&nbsp;</span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">다<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">. </span></span>정보주체가 개인정보의 오류 등에 대한 정정 또는 삭제를 요구한 경우에는 단체는 정정 또는 삭제를 완료할 때까지 당해 개인정보를 이용하거나 제공하지 않습니다<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">.</span></span></span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">&nbsp;</span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">라<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">. </span></span>제<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">1</span></span>항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">. </span></span>이 경우 개인정보 보호법 시행규칙 별지 제<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">11</span></span>호 서식에 따른 위임장을 제출하셔야 합니다<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">.</span></span></span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">&nbsp;</span></span><br>
<span style="color:#000000;"><span style="font-size:18px;"><span style="line-height:100%"><span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt"><span style="font-weight:bold">7. </span></span></span><span style="font-weight:bold">개인정보의 파기단체는 원칙적으로 개인정보 처리목적이 달성된 경우에는 지체없이 해당 개인정보를 파기합니다</span><span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt"><span style="font-weight:bold">. </span></span></span><span style="font-weight:bold">파기의 절차</span><span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt"><span style="font-weight:bold">, </span></span></span><span style="font-weight:bold">기한 및 방법은 다음과 같습니다</span><span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt"><span style="font-weight:bold">.</span></span></span></span></span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">&nbsp;</span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">가<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">. </span></span>파기절차</span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">이용자가 입력한 정보는 목적 달성 후 별도의 <span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">DB</span></span>에 옮겨져<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">(</span></span>종이의 경우 별도의 서류<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">) </span></span>내부 방침 및 기타 관련 법령에 따라 일정기간 저장된 후 혹은 즉시 파기됩니다<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">. </span></span>이 때<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">, DB</span></span>로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 다른 목적으로 이용되지 않습니다<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">.</span></span></span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">&nbsp;</span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">나<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">. </span></span>파기기한</span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">이용자의 개인정보는 개인정보의 보유기간이 경과된 경우에는 보유기간의 종료일로부터 <span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">5</span></span>일 이내에<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">, </span></span>개인정보의 처리 목적 달성<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">, </span></span>해당 서비스의 폐지<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">, </span></span>사업의 종료 등 그 개인정보가 불필요하게 되었을 때에는 개인정보의 처리가 불필요한 것으로 인정되는 날로부터 <span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">5</span></span>일 이내에 그 개인정보를 파기합니다<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">.</span></span></span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">&nbsp;</span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">다<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">. </span></span>파기방법</span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">전자적 파일 형태의 정보는 기록을 재생할 수 없는 기술적 방법을 사용합니다<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">.</span></span></span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">.</span></span></span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">&nbsp;</span></span><br>
<span style="font-size:18px;"><span style="color:#000000;"><span style="line-height:100%"><span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt"><span style="font-weight:bold">8. </span></span></span><span style="font-weight:bold">개인정보의 안전성 확보 조치 단체는 개인정보보호법 제</span><span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt"><span style="font-weight:bold">29</span></span></span><span style="font-weight:bold">조에 따라 다음과 같이 안전성 확보에 필요한 기술적</span><span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt"><span style="font-weight:bold">/</span></span></span><span style="font-weight:bold">관리적 및 물리적 조치를 하고 있습니다</span><span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt"><span style="font-weight:bold">.</span></span></span></span></span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">&nbsp;</span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">가<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">. </span></span>개인정보 취급 직원의 최소화 및 교육</span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">개인정보를 취급하는 직원을 지정하고 담당자에 한정시켜 최소화 하여 개인정보를 관리하는 대책을 시행하고 있습니다<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">.</span></span></span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">&nbsp;</span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">나<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">. </span></span>정기적인 자체 감사 실시</span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">개인정보 취급 관련 안정성 확보를 위해 정기적<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">(</span></span>분기 <span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">1</span></span>회<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">)</span></span>으로 자체 감사를 실시하고 있습니다<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">.</span></span></span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">&nbsp;</span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">다<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">. </span></span>내부관리계획의 수립 및 시행</span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">개인정보의 안전한 처리를 위하여 내부관리계획을 수립하고 시행하고 있습니다<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">.</span></span></span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">&nbsp;</span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">라<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">. </span></span>개인정보의 암호화</span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">이용자의 개인정보는 비밀번호는 암호화 되어 저장 및 관리되고 있어<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">, </span></span>본인만이 알 수 있으며 중요한 데이터는 파일 및 전송 데이터를 암호화 하거나 파일 잠금 기능을 사용하는 등의 별도 보안기능을 사용하고 있습니다<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">.</span></span></span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">&nbsp;</span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">마<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">. </span></span>해킹 등에 대비한 기술적 대책</span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">단체은 해킹이나 컴퓨터 바이러스 등에 의한 개인정보 유출 및 훼손을 막기 위하여 보안프로그램을 설치하고 주기적인 갱신<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">·</span></span>점검을 하며 외부로부터 접근이 통제된 구역에 시스템을 설치하고 기술적<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">/</span></span>물리적으로 감시 및 차단하고 있습니다<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">.</span></span></span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">&nbsp;</span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">바<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">. </span></span>개인정보에 대한 접근 제한</span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">개인정보를 처리하는 데이터베이스시스템에 대한 접근권한의 부여<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">,</span></span>변경<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">,</span></span>말소를 통하여 개인정보에 대한 접근통제를 위하여 필요한 조치를 하고 있으며 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있습니다<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">.</span></span></span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">&nbsp;</span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">사<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">. </span></span>접속기록의 보관 및 위변조 방지</span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">개인정보처리시스템에 접속한 기록을 최소 <span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">6</span></span>개월 이상 보관<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">, </span></span>관리하고 있으며<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">, </span></span>접속 기록이 위변조 및 도난<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">, </span></span>분실되지 않도록 보안기능 사용하고 있습니다<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">.</span></span></span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">&nbsp;</span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">아<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">. </span></span>문서보안을 위한 잠금장치 사용</span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">개인정보가 포함된 서류<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">, </span></span>보조저장매체 등을 잠금장치가 있는 안전한 장소에 보관하고 있습니다<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">.</span></span></span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">&nbsp;</span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">자<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">. </span></span>비인가자에 대한 출입 통제</span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">개인정보를 보관하고 있는 물리적 보관 장소를 별도로 두고 이에 대해 출입통제 절차를 수립<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">, </span></span>운영하고 있습니다<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">.</span></span></span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">&nbsp;</span></span><br>
<span style="color:#000000;"><span style="font-size:18px;"><span style="line-height:100%"><span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt"><span style="font-weight:bold">9. </span></span></span><span style="font-weight:bold">개인정보 보호책임자</span></span></span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">&nbsp;</span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">가<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">. </span></span>단체는 개인정보 처리에 관한 업무를 총괄해서 책임지고<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">, </span></span>개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">.</span></span></span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">&nbsp;</span></span><br>
<span style="line-height:100%"><span style="text-autospace:none"><span style="font-weight:bold">성명 </span><span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt"><span style="font-weight:bold">: ${prsnInfN.commcdValue}</span></span></span></span></span><br>
<span style="line-height:100%"><span style="text-autospace:none"><span style="font-weight:bold">직책 </span><span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt"><span style="font-weight:bold">: ${prsnInfP.commcdValue}</span></span></span></span></span><br>
<span style="line-height:100%"><span style="text-autospace:none"><span style="font-weight:bold">소속부서 </span><span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt"><span style="font-weight:bold">: ${prsnInfD.commcdValue}</span></span></span></span></span><br>
<span style="line-height:100%"><span style="text-autospace:none"><span style="font-weight:bold">전화번호 </span><span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt"><span style="font-weight:bold">: ${prsnInfT.commcdValue}</span></span></span></span></span><br>
<span style="line-height:100%"><span style="text-autospace:none"><span style="font-weight:bold">팩스번호 </span><span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt"><span style="font-weight:bold">: ${prsnInfF.commcdValue}</span></span></span></span></span><br>
<span style="line-height:100%"><span style="text-autospace:none"><span style="font-weight:bold">전자우편 </span><span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt"><span style="font-weight:bold">: ${prsnInfE.commcdValue}</span></span></span></span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">&nbsp;</span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">나<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">. </span></span>정보주체께서는 단체의 서비스<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">(</span></span>또는 사업<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">)</span></span>을 이용하시면서 발생한 모든 개인정보 보호 관련 문의<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">, </span></span>불만처리<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">, </span></span>피해구제 등에 관한 사항을 개인정보 보호책임자 및 담당부서로 문의하실 수 있습니다<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">. </span></span>단체는 정보주체의 문의에 대해 지체 없이 답변 및 처리해드릴 것입니다<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">.</span></span></span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">&nbsp;</span></span><br>
<span style="color:#000000;"><span style="font-size:18px;"><span style="line-height:100%"><span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt"><span style="font-weight:bold">10. </span></span></span><span style="font-weight:bold">개인정보 처리방침 변경</span></span></span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">&nbsp;</span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">가<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">. </span></span>이 개인정보처리방침은 시행일로부터 적용되며<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">, </span></span>법령 및 방침에 따른 변경내용의 추가<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">, </span></span>삭제 및 정정이 있는 경우에는 변경사항의 시행 <span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">7</span></span>일 전부터 공지사항을 통하여 고지할 것입니다<span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt">.</span></span></span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">&nbsp;</span></span><br>
<span style="line-height:100%"><span style="text-autospace:none">&nbsp;</span></span>
<div class="nostyle" style="text-align: center;"><span style="line-height:150%"><span style="word-break:keep-all"><span style="text-autospace:none"><span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt"><span style="font-weight:bold">&lt;</span></span></span><span style="font-weight:bold">본 방침은 </span><span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt"><span style="font-weight:bold">2020.12.17. </span></span></span><span style="font-weight:bold">부터 시행됩니다</span><span lang="EN-US" style="font-family:맑은 고딕"><span style="letter-spacing:0.0pt"><span style="font-weight:bold">.&gt;</span></span></span></span></span></span></div>
</div>

                        </td>
                    </tr>
                </table>
				<div align="center">
				<br>
					<button type="button" id="cancelWindow" class="popupSearchBtn" onclick="closeWindow();">닫기</button>
				</div>
			</form>
	    </div>
	    <!-- popupWrapper : end  -->
	    
	    
<style type="text/css" >
 	
 	.font-color {
		color: #ff0000;
	}
	
	
	
</style>
<script type="text/javascript" >
$(document).ready(function(){
	$(window).keypress(function (e) {
		if(e.keyCode == 13){//키가 13이면 실행 (엔터는 13)
			mFnc.layerClose("<%=layerName%>");
	    }
	});
});
	function closeWindow() {
		mFnc.layerClose("<%=layerName%>");
	}
</script>
