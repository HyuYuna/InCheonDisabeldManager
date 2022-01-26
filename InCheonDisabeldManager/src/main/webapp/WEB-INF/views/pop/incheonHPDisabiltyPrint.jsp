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
<head>
	<link rel="stylesheet" type="text/css" href="/resources/js/jquery-ui-1.12.1/jquery-ui.css">
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
</head>
                <!-- conditionTable : start -->
                <form name="searchDisableForm" onsubmit="return false;" autocomplete='off'>
                <table class="dataTable marginT10">
                    <tbody>
                        <tr>
                            <th>년월</th>
                            <td>
                            	<select id="sehyyyymm" name="sehyyyymm" style="width: 26%; text-align-last : center" onchange="searchChangeYYYYMM();">
									<c:if test="${!empty dateList}">
										<c:forEach var="list" items="${dateList}">
											<option value="${list.yyyymm}">
											<c:out value="${list.yyyymm}" />
											</option>
										</c:forEach>
									</c:if>
								</select>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						   		<button type="button" id="HPSearchBtn" class="popupSearchBtn"><img src="/resources/imagesV2/iconGlass.png" class="iconGlass">조회</button>
						   		<button type="button" id="HPCloseBtn" class="popupSearchBtn"><img src="/resources/imagesV2/iconX.png" class="iconGlass">닫기</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
                </form>
                <!-- conditionTable : end -->
                
                <form name="disableForm" id="disableForm" method="post" autocomplete="off">
                <table class="layoutTable">
                	<input type="hidden" id="printStats"   name="printStats"   value=""/>
                	<input type="hidden" id="searchStats"  name="searchStats"  value=""/>
                	
                	<input type="hidden" id="yyyymm"       name="yyyymm"       value=""/>
			    <tr>
				    <td valign="top">
					    <div  style="font-size:34px; font-weight: bold; text-align:center;">
					        인천광역시 장애인 현황<br><span style="font-size:20px;vertical-align: top;">(</span><span class="yyymmDate" style="font-size:20px;vertical-align: top;"></span><span style="font-size:20px;vertical-align: top;">월말 현재)</span>					        
					    </div>	
					    <div class="subTitle3 sub_title">
					        ■ 인천광역시 인구 : <span class="totalPopLtnCnt" name="totalPopLtnCnt"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>(외국인 미포함)</span>
					    </div>
					    <div class="subTitle3 sub_title">
					        ■ 장애인 등록인구 : <span class="disableCount"></span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>(전체인구의 </span><span class="percent"></span><span>%)</span>
					        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;남 : <span class="maleCount"></span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  여 : <span class="femaleCount"></span>
					    </div>
					    <br>					
					    <div class="subTitle sub_title">
					         유형별 분류(15개 유형)
					    </div>
					    <br>
			         <table cellpadding="0" cellspacing="0"  class="dataTable" id="align_common" border="1" >
			           <colgroup>
			               <col width="11%" />
			               <col width="11%" />
			               <col width="13%" />
			               <col width="11%" />
			               <col width="10%" />
			               <col width="11%" />
			               <col width="11%" />
			               <col width="11%" />
			               <col width="11%" />
			           </colgroup>                                               
			           <tr>
			               <th rowspan="2">지체</th>
			               <th rowspan="2">시각</th>
			               <th rowspan="2">뇌병변</th>
			               <th colspan="3">청각 · 언어</th>
			               <th colspan="3">발달장애</th>
								</tr>
								<tr>
			               <th>계</th>
			               <th>청각</th>
			               <th>언어</th>
			               <th>계</th>
			               <th>지적</th>
			               <th>자폐성</th>
								</tr>
								<tr>
			               <td style="text-align:center;"><span class="disableTp01"></span></td>
			               <td style="text-align:center;"><span class="disableTp02"></span></td>
			               <td style="text-align:center;"><span class="disableTp03"></span></td>
			               <td style="text-align:center;"><span class="disableTpSum"></span></td>
			               <td style="text-align:center;"><span class="disableTp04"></span></td>
			               <td style="text-align:center;"><span class="disableTp05"></span></td>
			               <td style="text-align:center;"><span class="disableTpSum2"></span></td>
			               <td style="text-align:center;"><span class="disableTp06"></span></td>
			               <td style="text-align:center;"><span class="disableTp07"></span></td>
								</tr>
							</table>	
							<table cellpadding="0" cellspacing="0"  class="dataTable" id="align_common" border="1" >
			           <colgroup>
			               <col width="11%" />
			               <col width="11%" />
			               <col width="13%" />
			               <col width="16%" />
			               <col width="16%" />
			               <col width="11%" />
			               <col width="11%" />
			               <col width="11%" />
			           </colgroup>            
								<tr>
			               <th>신장</th>
			               <th>정신</th>
			               <th>장루·요루</th>
			               <th>간</th>
			               <th>호흡기</th>
			               <th>뇌전증</th>
			               <th>심장</th>
			               <th>안면</th>
								</tr>
								<tr>
			               <td style="text-align:center;"><span class="disableTp08"></span></td>
			               <td style="text-align:center;"><span class="disableTp09"></span></td>
			               <td style="text-align:center;"><span class="disableTp10"></span></td>
			               <td style="text-align:center;"><span class="disableTp11"></span></td>
			               <td style="text-align:center;"><span class="disableTp12"></span></td>
			               <td style="text-align:center;"><span class="disableTp13"></span></td>
			               <td style="text-align:center;"><span class="disableTp14"></span></td>
			               <td style="text-align:center;"><span class="disableTp15"></span></td>
								</tr>
							</table>
							<div class="subTitle sub_title2">
					       * 지체>청각/언어>시각>뇌병변>발달장애>신장>정신>장루요루>간>호흡기>뇌전증>심장>안면
					    </div>	
				    	<br>
				    	<div class="subTitle sub_title">
					         장애정도별 분류
					    </div>
					    <br>
					    <table cellpadding="0" cellspacing="0"  class="dataTable" id="align_common" border="1" >
			            <colgroup>
			                <col width="50%" />
			                <col width="50%" />
			            </colgroup>            
									<tr>
			                <th>심한장애</th>
			                <th>심하지않은장애</th>
									</tr>
									<tr>
			                <td style="text-align:center;"><span class="seriousCnt"></span></td>
			                <td style="text-align:center;"><span class="moderateCnt"></span></td>
									</tr>
								</table>
								<br>
								<div class="subTitle sub_title">
						         군·구별 현황
						    </div>
						    <br>
						    <table cellpadding="0" cellspacing="0"  class="dataTable" id="align_common" border="1" >
			            <colgroup>
			                <col width="20%" />
			                <col width="20%" />
			                <col width="20%" />
			                <col width="20%" />
			                <col width="20%" />
			            </colgroup>            
									<tr>
			                <th>중 구</th>
			                <th>동 구</th>
			                <th>미추홀구</th>
			                <th>연수구</th>
			                <th>남동구</th>
									</tr>
									<tr>
			                <td style="text-align:center;"><span class="guCd01"></span></td>
			                <td style="text-align:center;"><span class="guCd02"></span></td>
			                <td style="text-align:center;"><span class="guCd03"></span></td>
			                <td style="text-align:center;"><span class="guCd04"></span></td>
			                <td style="text-align:center;"><span class="guCd05"></span></td>
									</tr>
								</table>
								<table cellpadding="0" cellspacing="0"  class="dataTable" id="align_common" border="1" >
			            <colgroup>
			                <col width="20%" />
			                <col width="20%" />
			                <col width="20%" />
			                <col width="20%" />
			                <col width="20%" />
			            </colgroup>            
									<tr>
			                <th>부평구</th>
			                <th>계양구</th>
			                <th>서 구</th>
			                <th>강화군</th>
			                <th>옹진군</th>
									</tr>
									<tr>
			                <td style="text-align:center;"><span class="guCd06"></span></td>
			                <td style="text-align:center;"><span class="guCd07"></span></td>
			                <td style="text-align:center;"><span class="guCd08"></span></td>
			                <td style="text-align:center;"><span class="guCd09"></span></td>
			                <td style="text-align:center;"><span class="guCd10"></span></td>
									</tr>
								</table>
								<br>
								<div class="subTitle sub_title">
						         연령별 현황
						    </div>
						    <br>
						    <table cellpadding="0" cellspacing="0"  class="dataTable" id="align_common" border="1" >
			            <colgroup>
			                <col width="25%" />
			                <col width="25%" />
			                <col width="25%" />
			                <col width="25%" />
			            </colgroup>            
									<tr>
			                <th>영유아<br>(6세 이하)</th>
			                <th>청소년<br>(7~18세)</th>
			                <th>성인<br>(19~64세)</th>
			                <th>노인<br>(65세 이상)</th>
									</tr>
									<tr>
			                <td style="text-align:center;"><span class="age1"></span></td>
			                <td style="text-align:center;"><span class="age2"></span></td>
			                <td style="text-align:center;"><span class="age3"></span></td>
			                <td style="text-align:center;"><span class="age4"></span></td>
									</tr>
								</table>
								<br>
								<div class="subTitle sub_title">
						         보장자격별 분류
						    </div>
						    <br>
						    <table cellpadding="0" cellspacing="0"  class="dataTable" id="align_common" border="1" >
			            <colgroup>
			                <col width="34%" />
			                <col width="33%" />
			                <col width="33%" />
			            </colgroup>            
									<tr>
			                <th>기초생활수급자</th>
			                <th>차상위계층</th>
			                <th>일반</th>
									</tr>
									<tr>
			                <td style="text-align:center;"><span class="dspsnSlybslfCnt"></span></td>
			                <td style="text-align:center;"><span class="dspsnSehighCnt"></span></td>
			                <td style="text-align:center;"><span class="dspsnGnrlCnt"></span></td>
						</tr>
					</table>
				</td>
			    </tr> 
			</table>
			</form>

<style>
	.subTitle span {font-size:20px; font-weight: bold;}
	.subTitle3 span {font-size:20px; font-weight: bold;}
	.sub_title{font-size:20px; font-weight: bold;}
	.sub_title2{font-size:15px; font-weight: bold;}
	.subtitle {float: initial;}
	body { margin-left: 15px; margin-right: 15px; margin-bottom: 15px;}
 	.subtitle3{
    float: initial;
    color:#33426d;
    font-weight: bold;
    font-size: 20px;
    line-height: 100%;
    white-space: nowrap;
    padding-left: 0px;
    margin-top:10px;
	}
	.submsg span{
	color: #FF0000;
    font-weight: 700;
    font-size: 20px;
    line-height: 100%;
    white-space: nowrap;
    padding-left: 15px;
    margin-top:20px;
    margin-bottom: 8px;
     }
</style>
<script type="text/javascript">
//조회 클릭시
$('#HPSearchBtn').click(function(){
	loadData();
});
//닫기 클릭시
$('#HPCloseBtn').click(function(){
	closeBtn();
});

	// 페이지 로딩 되면 실행
	$(function () {
		// 출력 상태값
		$("#disableForm").find( "#printStats").val("0");
		$("#disableForm").find( "#searchStats").val("0");
		$("#disableForm").find( "#yyyymm").val(searchDisableForm.sehyyyymm.value.replace(/\-/g,''));
		
		loadData();
	});

	//조회
	function loadData() {
	var sendData = {"yyyymm"      : searchDisableForm.sehyyyymm.value.replace(/\-/g,'')};
	GRIT.tran.send({
		url: "/bas/disablePrintList",
		sendData: sendData,
		success: function(result){
			//alert('정상적으로 조회되었습니다.');
			// 상단
			$("#disableForm").find( ".yyymmDate").text(result.data[0].yyyymm);
			$("#disableForm").find( ".totalPopLtnCnt").text(numberComma(result.data[0].totalPopltnCnt));
			$("#disableForm").find( ".disableCount").text(numberComma(result.data[0].disableCount));
		    $("#disableForm").find( ".maleCount").text(numberComma(result.data[0].maleCount));
			$("#disableForm").find( ".femaleCount").text(numberComma(result.data[0].femaleCount));
			$("#disableForm").find( ".percent").text(result.data[0].percent); 
			
			// 유형별 분류(15개)
			$("#disableForm").find( ".disableTp01").text(numberComma(result.data[0].disableTp01));
			$("#disableForm").find( ".disableTp02").text(numberComma(result.data[0].disableTp02));
			$("#disableForm").find( ".disableTp03").text(numberComma(result.data[0].disableTp03));
			$("#disableForm").find( ".disableTpSum").text(numberComma(result.data[0].disableTp04+result.data[0].disableTp05));
			$("#disableForm").find( ".disableTp04").text(numberComma(result.data[0].disableTp04));
			$("#disableForm").find( ".disableTp05").text(numberComma(result.data[0].disableTp05));
			$("#disableForm").find( ".disableTpSum2").text(numberComma(result.data[0].disableTp06+result.data[0].disableTp07));
			$("#disableForm").find( ".disableTp06").text(numberComma(result.data[0].disableTp06));
			$("#disableForm").find( ".disableTp07").text(numberComma(result.data[0].disableTp07));
			$("#disableForm").find( ".disableTp08").text(numberComma(result.data[0].disableTp08));
			$("#disableForm").find( ".disableTp09").text(numberComma(result.data[0].disableTp09));
			$("#disableForm").find( ".disableTp10").text(numberComma(result.data[0].disableTp10));
			$("#disableForm").find( ".disableTp11").text(numberComma(result.data[0].disableTp11));
			$("#disableForm").find( ".disableTp12").text(numberComma(result.data[0].disableTp12));
			$("#disableForm").find( ".disableTp13").text(numberComma(result.data[0].disableTp13));
			$("#disableForm").find( ".disableTp14").text(numberComma(result.data[0].disableTp14));
			$("#disableForm").find( ".disableTp15").text(numberComma(result.data[0].disableTp15));
			
			// 장애정도별 분류
			$("#disableForm").find( ".seriousCnt").text(numberComma(result.data[0].seriousCnt));
			$("#disableForm").find( ".moderateCnt").text(numberComma(result.data[0].moderateCnt));
			
			// 군.구별
			$("#disableForm").find( ".guCd01").text(numberComma(result.data[0].guCd01));
			$("#disableForm").find( ".guCd02").text(numberComma(result.data[0].guCd02));
			$("#disableForm").find( ".guCd03").text(numberComma(result.data[0].guCd03));
			$("#disableForm").find( ".guCd04").text(numberComma(result.data[0].guCd04));
			$("#disableForm").find( ".guCd05").text(numberComma(result.data[0].guCd05));
			$("#disableForm").find( ".guCd06").text(numberComma(result.data[0].guCd06));
			$("#disableForm").find( ".guCd07").text(numberComma(result.data[0].guCd07));
			$("#disableForm").find( ".guCd08").text(numberComma(result.data[0].guCd08));
			$("#disableForm").find( ".guCd09").text(numberComma(result.data[0].guCd09));
			$("#disableForm").find( ".guCd10").text(numberComma(result.data[0].guCd10));
			
			// 연령별
			$("#disableForm").find( ".age1").text(numberComma(result.data[0].age1));
			$("#disableForm").find( ".age2").text(numberComma(result.data[0].age2));
			$("#disableForm").find( ".age3").text(numberComma(result.data[0].age3));
			$("#disableForm").find( ".age4").text(numberComma(result.data[0].age4));
			
			// 보장자격
			$("#disableForm").find( ".dspsnSlybslfCnt").text(numberComma(result.data[0].dspsnSlybslfCnt));
			$("#disableForm").find( ".dspsnSehighCnt").text(numberComma(result.data[0].dspsnSehighCnt));
			$("#disableForm").find( ".dspsnGnrlCnt").text(numberComma(result.data[0].dspsnGnrlCnt));
			
		},
		error: function(request, status, error){
			GRIT.msg.alert("장애인현황 리스트 조회하는데 문제가 발생했습니다.");
			
		},
		loading : false
	});
}



	// 조회조건 년월 변경시 
	function searchChangeYYYYMM(){
		// 출력 상태값
		$("#disableForm").find( "#printStats").val("1");
		$("#disableForm").find( "#searchStats").val("1");
		$("#disableForm").find( "#yyyymm").val(searchDisableForm.sehyyyymm.value.replace(/\-/g,''));
	}
	
	// 닫기 클릭
	function closeBtn(){
		sessionStorage.clear();
		window.location.href='/common/logout';
		window.close();
	}


</script>

