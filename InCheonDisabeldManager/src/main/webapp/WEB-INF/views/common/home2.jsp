<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<div class="section">
<table class="layoutTable">
	    <tr>
		    <td valign="top">
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
			    <div class="subTitle">
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
                <td style="text-align:center;">68,837</td>
                <td style="text-align:center;">68,837</td>
                <td style="text-align:center;">68,837</td>
                <td style="text-align:center;">68,837</td>
                <td style="text-align:center;">68,837</td>
                <td style="text-align:center;">68,837</td>
                <td style="text-align:center;">68,837</td>
                <td style="text-align:center;">68,837</td>
                <td style="text-align:center;">68,837</td>
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
                <td style="text-align:center;">68,837</td>
                <td style="text-align:center;">68,837</td>
                <td style="text-align:center;">68,837</td>
                <td style="text-align:center;">68,837</td>
                <td style="text-align:center;">68,837</td>
                <td style="text-align:center;">68,837</td>
                <td style="text-align:center;">68,837</td>
                <td style="text-align:center;">68,837</td>
						</tr>
					</table>
					<div class="subTitle3">
			       * 지체>청각/언어>시각>뇌병변>발달장애>신장>정신>장루요루>간>호흡기>뇌전증>심장>안면
			    </div>	
		    
		    	<div class="subTitle">
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
	                <td style="text-align:center;">68,837</td>
	                <td style="text-align:center;">68,837</td>
							</tr>
						</table>
						<div class="subTitle">
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
	                <td style="text-align:center;">68,837</td>
	                <td style="text-align:center;">68,837</td>
	                <td style="text-align:center;">68,837</td>
	                <td style="text-align:center;">68,837</td>
	                <td style="text-align:center;">68,837</td>
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
	                <td style="text-align:center;">68,837</td>
	                <td style="text-align:center;">68,837</td>
	                <td style="text-align:center;">68,837</td>
	                <td style="text-align:center;">68,837</td>
	                <td style="text-align:center;">68,837</td>
							</tr>
						</table>
						<div class="subTitle">
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
	                <td style="text-align:center;">68,837</td>
	                <td style="text-align:center;">68,837</td>
	                <td style="text-align:center;">68,837</td>
	                <td style="text-align:center;">68,837</td>
							</tr>
						</table>
						<div class="subTitle">
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
	                <td style="text-align:center;">68,837</td>
	                <td style="text-align:center;">68,837</td>
	                <td style="text-align:center;">68,837</td>
							</tr>
						</table>
					</td>
	    </tr> 
	</table>
</div>

