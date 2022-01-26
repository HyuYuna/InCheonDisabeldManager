<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
    String layerName = request.getParameter("layerName");
%>
<!-- <style>
		.subTitle {
			font-size:26px;
			white-space: nowrap;
			margin-top: 10px;
			font-weight: bold;
    	/*padding-left: 25px;
			background: white url(./imagesV2/subjectBullet.jpg) left center no-repeat ;
			background-size: 22px;*/
		}
		
		.subTitle2 {
			font-size:26px;
			white-space: nowrap;
    	padding-left: 178px;
			font-weight: bold;
		}
		
		.subTitle3 {
			font-size:22px;
			white-space: nowrap;
			font-weight: 300;
		}
		
		.dataTable th, .dataTable td {
		    font-size: 20px;
		}
	</style> -->
	
<!-- rMateChartH5 에서 사용하는 스타일 -->
<link rel="stylesheet" type="text/css" href="/resources/js/rMateChartH5Web_v6.0_EN_Trial/rMateChartH5/Assets/Css/rMateChartH5.css"/>
<!-- rMateChartH5 라이센스 -->
<script language="javascript" type="text/javascript" src="/resources/js/rMateChartH5Web_v6.0_EN_Trial/LicenseKey/rMateChartH5License.js"></script>
<!-- 실제적인 rMateChartH5 라이브러리 -->
<script type="text/javascript" src="/resources/js/rMateChartH5Web_v6.0_EN_Trial/rMateChartH5/JS/rMateChartH5.js"></script>
<!-- rMateChartH5 테마 js -->
<script type="text/javascript" src="/resources/js/rMateChartH5Web_v6.0_EN_Trial/rMateChartH5/Assets/Theme/theme.js"></script>

<!-- 샘플 작동을 위한 css와 js -->
<script type="text/javascript" src="/resources/js/rMateChartH5Web_v6.0_EN_Trial/Samples/Web/JS/common.js"></script>
<script type="text/javascript" src="/resources/js/rMateChartH5Web_v6.0_EN_Trial/Samples/Web/JS/sample_util.js"></script>
<!-- <link rel="stylesheet" type="text/css" href="/resources/js/rMateChartH5Web_v6.0_EN_Trial/Samples/Web/sample.css"/> -->

<div class="section">
	<table class="layoutTable">
	    <tr>
		    <td valign="top" colspan="5">
			    <!-- <div  style="font-size:38px; font-weight: bold; text-align:center;">
			        仁川廣域市 障碍人 現況<br><span style="font-size:20px;vertical-align: top;">(2020. 12월말 현재)</font>
			    </div>	
			    <div class="subTitle">
			        □ 인천광역시 인구 : 2,945,565명<span style="font-size:16px;">(외국인 미포함)</span>
			    </div>
			    <div class="subTitle">
			        □ 장애인 등록인구 : 145,591명(전체인구의 4.94%)
			    </div>
			    <div class="subTitle2">
			        남 : 86,883&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 여 : 58,708
			    </div>  -->
			    <div style="font-weight: bold; text-align:right;margin-top: -15px;">${data.yyyymm}월</div>
			    <div class="subTitle">
			        <h2>유형별 분류(15개 유형)</h2>
			    </div>
		          <table cellpadding="0" cellspacing="0"  class="dataTable" id="align_common" border="1" >
		            <colgroup>
		                <col width="10%" />
		                <col width="6%" />
		                <col width="6%" />
		                <col width="6%" />
		                <col width="7%" />
		                <col width="7%" />
		                <col width="6%" />
		                <col width="6%" />
		                <col width="7%" />
		                <col width="7%" />
		                <col width="6%" />
		                <col width="7%" />
		                <col width="6%" />
		                <col width="6%" />
		                <col width="7%" />
		            </colgroup>                                               
		            <tr>
		                <th>지체</th>
		                <th>시각</th>
		                <th>뇌병변</th>
		                <th>청각</th>
		                <th>언어</th>
		                <th>지적</th>
		                <th>자폐성</th>
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
		                <td style="text-align:center;" class="disableTp01"><fmt:formatNumber value="${data.disableTp01}" pattern="#,###" /></td>
		                <td style="text-align:center;" class="disableTp02"><fmt:formatNumber value="${data.disableTp02}" pattern="#,###" /></td>
		                <td style="text-align:center;" class="disableTp03"><fmt:formatNumber value="${data.disableTp03}" pattern="#,###" /></td>
		                <td style="text-align:center;" class="disableTp04"><fmt:formatNumber value="${data.disableTp04}" pattern="#,###" /></td>
		                <td style="text-align:center;" class="disableTp05"><fmt:formatNumber value="${data.disableTp05}" pattern="#,###" /></td>
		                <td style="text-align:center;" class="disableTp06"><fmt:formatNumber value="${data.disableTp06}" pattern="#,###" /></td>
		                <td style="text-align:center;" class="disableTp07"><fmt:formatNumber value="${data.disableTp07}" pattern="#,###" /></td>
		                <td style="text-align:center;" class="disableTp08"><fmt:formatNumber value="${data.disableTp08}" pattern="#,###" /></td>
		                <td style="text-align:center;" class="disableTp09"><fmt:formatNumber value="${data.disableTp09}" pattern="#,###" /></td>
		                <td style="text-align:center;" class="disableTp10"><fmt:formatNumber value="${data.disableTp10}" pattern="#,###" /></td>
		                <td style="text-align:center;" class="disableTp11"><fmt:formatNumber value="${data.disableTp11}" pattern="#,###" /></td>
		                <td style="text-align:center;" class="disableTp12"><fmt:formatNumber value="${data.disableTp12}" pattern="#,###" /></td>
		                <td style="text-align:center;" class="disableTp13"><fmt:formatNumber value="${data.disableTp13}" pattern="#,###" /></td>
		                <td style="text-align:center;" class="disableTp14"><fmt:formatNumber value="${data.disableTp14}" pattern="#,###" /></td>
		                <td style="text-align:center;" class="disableTp15"><fmt:formatNumber value="${data.disableTp15}" pattern="#,###" /></td>
					</tr>
				</table>
				<div style="width:100%; height:150px;border:1px solid #c3c3c3;margin-top: 5px;" id="<%=layerName%>chartHolder1"></div>
	    	</td>
	    <tr>
	    <tr>
			<td colspan="5">	
				<div class="subTitle">
			       <h2>군·구별 현황</h2>
			    </div>
			    <table cellpadding="0" cellspacing="0"  class="dataTable" id="align_common" border="1" >
		            <colgroup>
		                <col width="14%" />
		                <col width="9%" />
		                <col width="9%" />
		                <col width="9%" />
		                <col width="9%" />
		                <col width="10%" />
		                <col width="10%" />
		                <col width="10%" />
		                <col width="10%" />
		                <col width="10%" />
		            </colgroup>            
					<tr>
		                <th>중 구</th>
		                <th>동 구</th>
		                <th>미추홀구</th>
		                <th>연수구</th>
		                <th>남동구</th>
		                <th>부평구</th>
		                <th>계양구</th>
		                <th>서 구</th>
		                <th>강화군</th>
		                <th>옹진군</th>
					</tr>
					<tr>
		                <td style="text-align:center;" class="guCd01"><fmt:formatNumber value="${data.guCd01}" pattern="#,###" /></td>
		                <td style="text-align:center;" class="guCd02"><fmt:formatNumber value="${data.guCd02}" pattern="#,###" /></td>
		                <td style="text-align:center;" class="guCd03"><fmt:formatNumber value="${data.guCd03}" pattern="#,###" /></td>
		                <td style="text-align:center;" class="guCd04"><fmt:formatNumber value="${data.guCd04}" pattern="#,###" /></td>
		                <td style="text-align:center;" class="guCd05"><fmt:formatNumber value="${data.guCd05}" pattern="#,###" /></td>
		                <td style="text-align:center;" class="guCd06"><fmt:formatNumber value="${data.guCd06}" pattern="#,###" /></td>
		                <td style="text-align:center;" class="guCd07"><fmt:formatNumber value="${data.guCd07}" pattern="#,###" /></td>
		                <td style="text-align:center;" class="guCd08"><fmt:formatNumber value="${data.guCd08}" pattern="#,###" /></td>
		                <td style="text-align:center;" class="guCd09"><fmt:formatNumber value="${data.guCd09}" pattern="#,###" /></td>
		                <td style="text-align:center;" class="guCd10"><fmt:formatNumber value="${data.guCd10}" pattern="#,###" /></td>
					</tr>
				</table>
				<div style="width:100%; height:150px;border:1px solid #c3c3c3;margin-top: 5px;" id="<%=layerName%>chartHolder2"></div>
			</td>
	    </tr> 
	    <tr>
	    	<td style="width:32%;">
		    	<div class="subTitle">
			        <h2>장애정도별 분류</h2>
			    </div>
			    <table  class="layoutTable">
			    	<tr>
			    		<td style="width:50%;">
			    			<table cellpadding="0" cellspacing="0"  class="dataTable" id="align_common" border="1" >
					            <tr>
					                <th>심한<br>장애</th>
								</tr>
								<tr>
					                <td style="text-align:center;" class="seriousCnt"><fmt:formatNumber value="${data.seriousCnt}" pattern="#,###" /></td>
								</tr>
								<tr>
					                <th>심하지않은<br>장애</th>
								</tr>
								<tr>
					                <td style="text-align:center;" class="moderateCnt"><fmt:formatNumber value="${data.moderateCnt}" pattern="#,###" /></td>
								</tr>
							</table>
			    		</td>
			    		<td style="width:5px;"></td>
			    		<td style="width:*;">
			    			<div style="width:100%; height:176px;border:1px solid #c3c3c3;" id="<%=layerName%>chartHolder3"></div>
			    		</td>
			    	</tr>
			    </table>
			</td>
			<td style="width:10px"></td>	
			<td  style="width:32%;">
				<div class="subTitle">
			        <h2>연령별 분류</h2>
			    </div>
			    <table  class="layoutTable">
			    	<tr>
			    		<td style="width:50%;">
						    <table cellpadding="0" cellspacing="0"  class="dataTable" id="align_common" border="1" >
					            <colgroup>
					                <col width="25%" />
					                <col width="25%" />
					            </colgroup>            
								<tr>
					                <th>영유아<br>(6세 이하)</th>
					                <th>청소년<br>(7~18세)</th>
								</tr>
								<tr>
					                <td style="text-align:center;" class="age1"><fmt:formatNumber value="${data.age1}" pattern="#,###" /></td>
					                <td style="text-align:center;" class="age2"><fmt:formatNumber value="${data.age2}" pattern="#,###" /></td>
								</tr>
								<tr>
					                <th>성인<br>(10~64세)</th>
					                <th>노인<br>(65세 이상)</th>
								</tr>
								<tr>
					                <td style="text-align:center;" class="age3"><fmt:formatNumber value="${data.age3}" pattern="#,###" /></td>
					                <td style="text-align:center;" class="age4"><fmt:formatNumber value="${data.age4}" pattern="#,###" /></td>
								</tr>
							</table>
						</td>
			    		<td style="width:5px;"></td>
			    		<td style="width:*;">
			    			<div style="width:100%; height:176px;border:1px solid #c3c3c3;" id="<%=layerName%>chartHolder4"></div>
			    		</td>	
			    	</tr>
			    </table>		
			</td>
			<td style="width:10px"></td>	
			<td  style="width:*">
				<div class="subTitle">
			        <h2>보장자격별 분류</h2>
			    </div>
			    <table  class="layoutTable">
			    	<tr>
			    		<td style="width:50%;">
						    <table cellpadding="0" cellspacing="0"  class="dataTable" id="align_common" border="1" >
					            <colgroup>
					                <col width="50%" />
					                <col width="50%" />
					            </colgroup>    
								<tr>
					                <th>차상위<br>계층</th>
					                <th>일반</th>
								</tr>
								<tr>
					                <td style="text-align:center;" class="dspsnSehighCnt"><fmt:formatNumber value="${data.dspsnSehighCnt}" pattern="#,###" /></td>
					                <td style="text-align:center;" class="dspsnGnrlCnt"><fmt:formatNumber value="${data.dspsnGnrlCnt}" pattern="#,###" /></td>
								</tr>
								<tr>
					                <th colspan="2">기초생활<br>수급자</th>
								</tr>
								<tr>
					                <td  colspan="2" style="text-align:center;" class="dspsnSlybslfCnt"><fmt:formatNumber value="${data.dspsnSlybslfCnt}" pattern="#,###" /></td>
								</tr>
							</table>
						</td>
			    		<td style="width:5px;"></td>
			    		<td style="width:*;">
			    			<div style="width:100%; height:176px;border:1px solid #c3c3c3;" id="<%=layerName%>chartHolder5"></div>
			    		</td>	
			    	</tr>
			    </table>		
			</td>
		</tr>
	</table>
</div>
<script>
function <%=layerName%>chartDraw() {
	
	rMateChartH5.create("<%=layerName%>chart1", "<%=layerName%>chartHolder1", "", "100%", "148px");
	 
	// 스트링 형식으로 레이아웃 정의.
	var layoutStr1 =
            '<rMateChart backgroundColor="#FFFFFF" borderStyle="none">'
                +'<SeriesInterpolate id="ss"/>'
                  +'<Column2DChart showDataTips="true" selectionMode="multiple" columnWidthRatio="0.48">'
                      +'<horizontalAxis>'
                          +'<CategoryAxis categoryField="TITLE"/>'
                       +'</horizontalAxis>'
                     +'<verticalAxis>'
                        +'<LinearAxis />'
                     +'</verticalAxis>'
                       +'<series>'
                          +'<Column2DSeries yField="TP" displayName="명" showDataEffect="{ss}" />'
                      +'</series>'
                 +'</Column2DChart>'
              +'</rMateChart>';

	var chartData1 = [
		{"TITLE":"지체", "TP":$(".disableTp01").text().replace(/,/g, '')},
		{"TITLE":"시각", "TP":$(".disableTp02").text().replace(/,/g, '')},
		{"TITLE":"뇌병변", "TP":$(".disableTp03").text().replace(/,/g, '')},
		{"TITLE":"청각", "TP":$(".disableTp04").text().replace(/,/g, '')},
		{"TITLE":"언어", "TP":$(".disableTp05").text().replace(/,/g, '')},
		{"TITLE":"지적", "TP":$(".disableTp06").text().replace(/,/g, '')},
		{"TITLE":"자폐성", "TP":$(".disableTp07").text().replace(/,/g, '')},
		{"TITLE":"신장", "TP":$(".disableTp08").text().replace(/,/g, '')},
		{"TITLE":"정신", "TP":$(".disableTp09").text().replace(/,/g, '')},
		{"TITLE":"장루·요루", "TP":$(".disableTp10").text().replace(/,/g, '')},
		{"TITLE":"간", "TP":$(".disableTp11").text().replace(/,/g, '')},
		{"TITLE":"호흡기", "TP":$(".disableTp12").text().replace(/,/g, '')},
		{"TITLE":"뇌전증", "TP":$(".disableTp13").text().replace(/,/g, '')},
		{"TITLE":"심장", "TP":$(".disableTp14").text().replace(/,/g, '')},
		{"TITLE":"안면", "TP":$(".disableTp15").text().replace(/,/g, '')}
	];
	            	   
	rMateChartH5.calls("<%=layerName%>chart1", {
		"setLayout" : layoutStr1,
	    "setData" : chartData1
	});

	var layoutStr2 =
        '<rMateChart backgroundColor="#FFFFFF" borderStyle="none">'
            +'<SeriesInterpolate id="ss"/>'
              +'<Column2DChart showDataTips="true" selectionMode="multiple" columnWidthRatio="0.48">'
                  +'<horizontalAxis>'
                      +'<CategoryAxis categoryField="TITLE"/>'
                   +'</horizontalAxis>'
                 +'<verticalAxis>'
                    +'<LinearAxis />'
                 +'</verticalAxis>'
                   +'<series>'
                      +'<Column2DSeries yField="TP" displayName="명" showDataEffect="{ss}" />'
                  +'</series>'
             +'</Column2DChart>'
          +'</rMateChart>';
          
	rMateChartH5.create("<%=layerName%>chart2", "<%=layerName%>chartHolder2", "", "100%", "148px");

	var chartData2 = [
		{"TITLE":"중구", "TP":$(".guCd01").text().replace(/,/g, '')},
		{"TITLE":"동구", "TP":$(".guCd02").text().replace(/,/g, '')},
		{"TITLE":"미추홀구", "TP":$(".guCd03").text().replace(/,/g, '')},
		{"TITLE":"연수구", "TP":$(".guCd04").text().replace(/,/g, '')},
		{"TITLE":"남동구", "TP":$(".guCd05").text().replace(/,/g, '')},
		{"TITLE":"부평구", "TP":$(".guCd06").text().replace(/,/g, '')},
		{"TITLE":"계양구", "TP":$(".guCd07").text().replace(/,/g, '')},
		{"TITLE":"서구", "TP":$(".guCd08").text().replace(/,/g, '')},
		{"TITLE":"강화군", "TP":$(".guCd09").text().replace(/,/g, '')},
		{"TITLE":"옹진군", "TP":$(".guCd10").text().replace(/,/g, '')}
	];
	            	   
	rMateChartH5.calls("<%=layerName%>chart2", {
		"setLayout" : layoutStr2,
	    "setData" : chartData2
	});
	
	rMateChartH5.create("<%=layerName%>chart3", "<%=layerName%>chartHolder3", "", "100%", "148px");
	 
	// 스트링 형식으로 레이아웃 정의.
	var layoutStr3 =
            '<rMateChart backgroundColor="#FFFFFF" borderStyle="none" >'
                 //+'<Options>'
                 //   +'<Legend useVisibleCheck="true"/>'
                 // +'</Options>'
                +'<CurrencyFormatter id="numFmt" currencySymbol="%" alignSymbol="right"/>'
                   +'<Pie2DChart showDataTips="true">'
                     +'<series>'
                          +'<Pie2DSeries nameField="TITLE" field="TP" labelPosition="inside" color="#ffffff">'
                              +'<showDataEffect>'
                                  +'<SeriesSlide duration="1000"/>'
                              +'</showDataEffect>'
                         +'</Pie2DSeries>'
                    +'</series>'
                 +'</Pie2DChart>'
             +'</rMateChart>';

	var chartData3 = [
		{"TITLE":"심한장애", "TP":$(".seriousCnt").text().replace(/,/g, '')},
		{"TITLE":"심하지않은장애", "TP":$(".moderateCnt").text().replace(/,/g, '')}
	];
	            	   
	rMateChartH5.calls("<%=layerName%>chart3", {
		"setLayout" : layoutStr3,
	    "setData" : chartData3
	});
	
	rMateChartH5.create("<%=layerName%>chart4", "<%=layerName%>chartHolder4", "", "100%", "148px");
	
	var layoutStr4 =
        '<rMateChart backgroundColor="#FFFFFF" borderStyle="none" >'
             //+'<Options>'
             //   +'<Legend useVisibleCheck="true"/>'
             // +'</Options>'
            +'<CurrencyFormatter id="numFmt" currencySymbol="%" alignSymbol="right"/>'
               +'<Pie2DChart showDataTips="true">'
                 +'<series>'
                      +'<Pie2DSeries nameField="TITLE" field="TP" labelPosition="inside" color="#ffffff">'
                          +'<showDataEffect>'
                              +'<SeriesSlide duration="1000"/>'
                          +'</showDataEffect>'
                     +'</Pie2DSeries>'
                +'</series>'
             +'</Pie2DChart>'
         +'</rMateChart>';
         
	var chartData4 = [
		{"TITLE":"영유아", "TP":$(".age1").text().replace(/,/g, '')},
		{"TITLE":"청소년", "TP":$(".age2").text().replace(/,/g, '')},
		{"TITLE":"성인", "TP":$(".age3").text().replace(/,/g, '')},
		{"TITLE":"노인", "TP":$(".age4").text().replace(/,/g, '')}
	];
	            	   
	rMateChartH5.calls("<%=layerName%>chart4", {
		"setLayout" : layoutStr4,
	    "setData" : chartData4
	});
	
	rMateChartH5.create("<%=layerName%>chart5", "<%=layerName%>chartHolder5", "", "100%", "148px");
	
	var layoutStr5 =
        '<rMateChart backgroundColor="#FFFFFF" borderStyle="none" >'
             //+'<Options>'
             //   +'<Legend useVisibleCheck="true"/>'
             // +'</Options>'
            +'<CurrencyFormatter id="numFmt" currencySymbol="%" alignSymbol="right"/>'
               +'<Pie2DChart showDataTips="true">'
                 +'<series>'
                      +'<Pie2DSeries nameField="TITLE" field="TP" labelPosition="inside" color="#ffffff">'
                          +'<showDataEffect>'
                              +'<SeriesSlide duration="1000"/>'
                          +'</showDataEffect>'
                     +'</Pie2DSeries>'
                +'</series>'
             +'</Pie2DChart>'
         +'</rMateChart>';
         
	var chartData5 = [
		{"TITLE":"일반", "TP":$(".dspsnGnrlCnt").text().replace(/,/g, '')},
		{"TITLE":"차상위계층", "TP":$(".dspsnSehighCnt").text().replace(/,/g, '')},
		{"TITLE":"기초생활수급자", "TP":$(".dspsnSlybslfCnt").text().replace(/,/g, '')}
	];
	            	   
	rMateChartH5.calls("<%=layerName%>chart5", {
		"setLayout" : layoutStr5,
	    "setData" : chartData5
	});
}

$(document).ready(function(){
	<%=layerName%>chartDraw();
});
</script>

