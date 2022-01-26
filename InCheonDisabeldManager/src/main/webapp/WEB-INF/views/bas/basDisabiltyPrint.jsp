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
                    <h1>장애인 현황 출력</h1>
					<jsp:include page="../common/commonBtn.jsp">
						<jsp:param value="<%=layerName%>" name="layerName" />
					</jsp:include>                    
                </div>
                <!-- titleWrap : end -->
                <!-- conditionTable : start -->
                <form name="<%=layerName%>searchDisableForm" onsubmit="return false;" autocomplete='off'>
                <table class="dataTable marginT10">
                    <colgroup>
                        <col style="width:4.75%">
                        <col style="width:21%">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>년월</th>
                            <td>
                            	<select id="sehyyyymm" name="sehyyyymm" style="width: 26%; text-align-last : center" onchange="<%=layerName%>searchChangeYYYYMM();">
									<c:if test="${!empty dateList}">
										<c:forEach var="list" items="${dateList}">
											<option value="${list.yyyymm}">
											<c:out value="${list.yyyymm}" />
											</option>
										</c:forEach>
									</c:if>
								</select>
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
                	<input type="hidden" id="saveMode"     name="saveMode"     value=""/>
                	<input type="hidden" id="yyyymm"       name="yyyymm"       value=""/>
			    <tr>
				    <td valign="top">
					    <div  style="font-size:38px; font-weight: bold; text-align:center;">
					        仁川廣域市 障碍人 現況<br><span style="font-size:20px;vertical-align: top;">(</span><span class="yyymmDate" style="font-size:20px;vertical-align: top;"></span><span style="font-size:20px;vertical-align: top;">월말 현재)</span>
					    </div>	
					    <div class="subTitle sub_title">
					        □ 인천광역시 인구 : <input type="text" id="totalPopLtnCnt" name="totalPopLtnCnt" style="text-align: right;" maxlength="12" onkeyup="removeChar(event);fn_comma(this);"><span>(외국인 미포함)</span>
					    </div>
					    <div class="subTitle sub_title">
					        □ 장애인 등록인구 : <span class="disableCount"></span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>(전체인구의 </span><span class="percent"></span><span>%)</span>
					    </div>
					    <div class="subTitle sub_title">
					    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 남 : <span class="maleCount"></span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  여 : <span class="femaleCount"></span>
					    </div> 
					    <div class="subTitle sub_title">
					        □ 유형별 분류(15개 유형)
					    </div>
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
				    
				    	<div class="subTitle sub_title">
					        □ 장애정도별 분류
					    </div>
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
								<div class="subTitle sub_title">
						        □ 군·구별 현황
						    </div>
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
								<div class="subTitle sub_title">
						        □ 연령별 현황
						    </div>
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
			                <th>성인<br>(10~64세)</th>
			                <th>노인<br>(65세 이상)</th>
									</tr>
									<tr>
			                <td style="text-align:center;"><span class="age1"></span></td>
			                <td style="text-align:center;"><span class="age2"></span></td>
			                <td style="text-align:center;"><span class="age3"></span></td>
			                <td style="text-align:center;"><span class="age4"></span></td>
									</tr>
								</table>
								<div class="subTitle sub_title">
						        □ 보장자격별 분류
						    </div>
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
			                <td style="text-align:center;">
			               	    <input type="text" id="dspsnSlybslfCnt" name="dspsnSlybslfCnt" style="text-align: right; width: 100%" maxlength="12" onkeyup="removeChar(event);fn_comma(this);">
			                </td>
			                <td style="text-align:center;">
			                	<input type="text" id="dspsnSehighCnt" name="dspsnSehighCnt" style="text-align: right; width: 100%" maxlength="12" onkeyup="removeChar(event);fn_comma(this);">
			                </td>
			                <td style="text-align:center;">
			                	<input type="text" id="dspsnGnrlCnt" name="dspsnGnrlCnt" style="text-align: right; width: 100%" maxlength="12" onkeyup="removeChar(event);fn_comma(this);">
			                </td>
						</tr>
					</table>
				</td>
			    </tr> 
			</table>
			</form>

<style>
	.subTitle span {font-size:20px; font-weight: bold;}
	.sub_title{font-size:20px; font-weight: bold;}
	.sub_title2{font-size:15px; font-weight: bold;}
</style>
<script type="text/javascript">
//조회 클릭시
$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .search').click(function(){
	<%=layerName%>loadData();
});

//저장
$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .save').click(function(){
	<%=layerName%>fn_dspsnPopltn();
});


//출력
$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .print').click(function(){
	<%=layerName%>printData();
});


//닫기
$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .close').click(function(){
	mFnc.tabMenuClose('<%=layerName%>');
});


	// 페이지 로딩 되면 실행
	$(function () {
		// 출력 상태값
		$(".<%=layerName%> #disableForm").find( "#printStats").val("0");
		$(".<%=layerName%> #disableForm").find( "#searchStats").val("0");
		$(".<%=layerName%> #disableForm").find( "#yyyymm").val(<%=layerName%>searchDisableForm.sehyyyymm.value.replace(/\-/g,''));
	});

	//조회
	function <%=layerName%>loadData () {
	
	var sendData = {"yyyymm"      : <%=layerName%>searchDisableForm.sehyyyymm.value.replace(/\-/g,'')};
	
	GRIT.tran.send({
		url: "/bas/disablePrintList",
		sendData: sendData,
		success: function(result){
			// 상단
			$(".<%=layerName%> #disableForm").find( ".yyymmDate").text(result.data[0].yyyymm);
			$(".<%=layerName%> #disableForm").find( "#totalPopLtnCnt").val(numberComma(result.data[0].totalPopltnCnt));
			$(".<%=layerName%> #disableForm").find( ".disableCount").text(numberComma(result.data[0].disableCount));
		    $(".<%=layerName%> #disableForm").find( ".maleCount").text(numberComma(result.data[0].maleCount));
			$(".<%=layerName%> #disableForm").find( ".femaleCount").text(numberComma(result.data[0].femaleCount));
			$(".<%=layerName%> #disableForm").find( ".percent").text(result.data[0].percent); 
			
			// 유형별 분류(15개)
			$(".<%=layerName%> #disableForm").find( ".disableTp01").text(numberComma(result.data[0].disableTp01));
			$(".<%=layerName%> #disableForm").find( ".disableTp02").text(numberComma(result.data[0].disableTp02));
			$(".<%=layerName%> #disableForm").find( ".disableTp03").text(numberComma(result.data[0].disableTp03));
			$(".<%=layerName%> #disableForm").find( ".disableTpSum").text(numberComma(result.data[0].disableTp04+result.data[0].disableTp05));
			$(".<%=layerName%> #disableForm").find( ".disableTp04").text(numberComma(result.data[0].disableTp04));
			$(".<%=layerName%> #disableForm").find( ".disableTp05").text(numberComma(result.data[0].disableTp05));
			$(".<%=layerName%> #disableForm").find( ".disableTpSum2").text(numberComma(result.data[0].disableTp06+result.data[0].disableTp07));
			$(".<%=layerName%> #disableForm").find( ".disableTp06").text(numberComma(result.data[0].disableTp06));
			$(".<%=layerName%> #disableForm").find( ".disableTp07").text(numberComma(result.data[0].disableTp07));
			$(".<%=layerName%> #disableForm").find( ".disableTp08").text(numberComma(result.data[0].disableTp08));
			$(".<%=layerName%> #disableForm").find( ".disableTp09").text(numberComma(result.data[0].disableTp09));
			$(".<%=layerName%> #disableForm").find( ".disableTp10").text(numberComma(result.data[0].disableTp10));
			$(".<%=layerName%> #disableForm").find( ".disableTp11").text(numberComma(result.data[0].disableTp11));
			$(".<%=layerName%> #disableForm").find( ".disableTp12").text(numberComma(result.data[0].disableTp12));
			$(".<%=layerName%> #disableForm").find( ".disableTp13").text(numberComma(result.data[0].disableTp13));
			$(".<%=layerName%> #disableForm").find( ".disableTp14").text(numberComma(result.data[0].disableTp14));
			$(".<%=layerName%> #disableForm").find( ".disableTp15").text(numberComma(result.data[0].disableTp15));
			
			// 장애정도별 분류
			$(".<%=layerName%> #disableForm").find( ".seriousCnt").text(numberComma(result.data[0].seriousCnt));
			$(".<%=layerName%> #disableForm").find( ".moderateCnt").text(numberComma(result.data[0].moderateCnt));
			
			// 군.구별
			$(".<%=layerName%> #disableForm").find( ".guCd01").text(numberComma(result.data[0].guCd01));
			$(".<%=layerName%> #disableForm").find( ".guCd02").text(numberComma(result.data[0].guCd02));
			$(".<%=layerName%> #disableForm").find( ".guCd03").text(numberComma(result.data[0].guCd03));
			$(".<%=layerName%> #disableForm").find( ".guCd04").text(numberComma(result.data[0].guCd04));
			$(".<%=layerName%> #disableForm").find( ".guCd05").text(numberComma(result.data[0].guCd05));
			$(".<%=layerName%> #disableForm").find( ".guCd06").text(numberComma(result.data[0].guCd06));
			$(".<%=layerName%> #disableForm").find( ".guCd07").text(numberComma(result.data[0].guCd07));
			$(".<%=layerName%> #disableForm").find( ".guCd08").text(numberComma(result.data[0].guCd08));
			$(".<%=layerName%> #disableForm").find( ".guCd09").text(numberComma(result.data[0].guCd09));
			$(".<%=layerName%> #disableForm").find( ".guCd10").text(numberComma(result.data[0].guCd10));
			
			// 연령별
			$(".<%=layerName%> #disableForm").find( ".age1").text(numberComma(result.data[0].age1));
			$(".<%=layerName%> #disableForm").find( ".age2").text(numberComma(result.data[0].age2));
			$(".<%=layerName%> #disableForm").find( ".age3").text(numberComma(result.data[0].age3));
			$(".<%=layerName%> #disableForm").find( ".age4").text(numberComma(result.data[0].age4));
			
			// 보장자격
			$(".<%=layerName%> #disableForm").find( "#dspsnSlybslfCnt").val(numberComma(result.data[0].dspsnSlybslfCnt));
			$(".<%=layerName%> #disableForm").find( "#dspsnSehighCnt").val(numberComma(result.data[0].dspsnSehighCnt));
			$(".<%=layerName%> #disableForm").find( "#dspsnGnrlCnt").val(numberComma(result.data[0].dspsnGnrlCnt));
			
			var checkSaveMode = result.data[0].savemode;
			if(checkSaveMode == "0"){
				$(".<%=layerName%> #disableForm").find( "#saveMode").val("I");
			}else{
				$(".<%=layerName%> #disableForm").find( "#saveMode").val("U");
			}
			
			// 출력 상태값
			$(".<%=layerName%> #disableForm").find( "#printStats").val("2");
			// 조회 상태값
			$(".<%=layerName%> #disableForm").find( "#searchStats").val("2");
		},
		error: function(request, status, error){
			GRIT.msg.alert("장애인현황 리스트 조회하는데 문제가 발생했습니다.");
			
		},
		loading : false
	});
}
    // 저장 체크
	function <%=layerName%>fn_dspsnPopltn(){
		
		var searchStats = $(".<%=layerName%> #searchStats").val();
		
		if(searchStats == "0" || searchStats == "1"){
		 	GRIT.msg.alert("조회 후 저장 할 수 있습니다.");
		 	return false;
		}
		
		if ( $(".<%=layerName%> #totalPopLtnCnt").val() == "0" || $(".<%=layerName%> #totalPopLtnCnt").val() == "") {
			$(".<%=layerName%> #totalPopLtnCnt").focus();
			GRIT.msg.alert("[인천광역시 인구]는 필수 항목입니다."); return;
		}
		
		if ( $(".<%=layerName%> #dspsnSlybslfCnt").val() == "0" || $(".<%=layerName%> #dspsnSlybslfCnt").val() == "") {
			$(".<%=layerName%> #dspsnSlybslfCnt").focus();
			GRIT.msg.alert("[기초생활수급자]는 필수 항목입니다."); return;
		}
		
		if ( $(".<%=layerName%> #dspsnSehighCnt").val() == "0" || $(".<%=layerName%> #dspsnSehighCnt").val() == "") {
			$(".<%=layerName%> #dspsnSehighCnt").focus();
			GRIT.msg.alert("[차상위계층]은 필수 항목입니다."); return;
		}
		
		if ( $(".<%=layerName%> #dspsnGnrlCnt").val() == "0" || $(".<%=layerName%> #dspsnGnrlCnt").val() == "") {
			$(".<%=layerName%> #dspsnGnrlCnt").focus();
			GRIT.msg.alert("[일반]은 필수 항목입니다."); return;
		}
		
		if(confirm("저장 하시겠습니까?")){
			<%=layerName%>fn_save();
	    } 
	}
	
	
	//저장
	function <%=layerName%>fn_save(){
	    
		var sendData = $(".<%=layerName%> form[name=disableForm]").serializeObject();
		
	     GRIT.tran.send({
			url: "/bas/saveDspsnPopltn",
			async: false,
			sendData: sendData,
			success: function(result){
				if(result.rtnCode == "0"){
					GRIT.msg.alert(result.message);
					<%=layerName%>loadData ();
				}else{
					GRIT.msg.alert(result.message);
					return;
				}
			},
				loadingTarget: "<%=layerName%>"
			}); 
	}


	// 출력
	function <%=layerName%>printData(){
		
		var printStats = $(".<%=layerName%> #printStats").val();
		
		if(printStats == "0" || printStats == "1"){
		 	GRIT.msg.alert("조회 후 출력 할 수 있습니다.");
		 	return false;
		}
		
		 var yyyymm = <%=layerName%>searchDisableForm.sehyyyymm.value.replace(/\-/g,'');
		 
		 var layerName = "<%=layerName%>"; 
		 var url = "<c:url value='/pop/disabiltyPrint?yyyymm="+yyyymm+"'/>";
		 var width="700";
		 var height="570";
		 var name="searchWffclty";
		 popitup(url, height, width, name);
	}

	// 조회조건 년월 변경시 
	function <%=layerName%>searchChangeYYYYMM(){
		// 출력 상태값
		$(".<%=layerName%> #disableForm").find( "#printStats").val("1");
		$(".<%=layerName%> #disableForm").find( "#searchStats").val("1");
		$(".<%=layerName%> #disableForm").find( "#yyyymm").val(<%=layerName%>searchDisableForm.sehyyyymm.value.replace(/\-/g,''));
	}

</script>

