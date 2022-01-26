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
                    <h1>복지시설 이용 관리</h1>
					<jsp:include page="../common/commonBtn.jsp">
						<jsp:param value="<%=layerName%>" name="layerName" />
					</jsp:include>                    
                </div>
                <!-- titleWrap : end -->
                
				<form name="<%=layerName%>searchForm1" onsubmit="return false;" autocomplete='off'>
				<input type="hidden" id="<%=layerName%>groupType" name="groupType" value="${groupType}" />
					<table class="dataTable marginT10">
						<colgroup>
					        <col style="width:8%">
	                        <col style="width:14%">
	                        <col style="width:8%">
	                        <col style="width:14%">
	                        <col style="width:8%">
	                        <col style="width:14%;">
	                        <col style="width:8%">
	                        <col style="width:26%;">
				    	</colgroup>
							<tbody>
								<th>시설유형</th> 
								<td>
									<input type="text" id="sehUserNm" name="sehUserNm" style="width:100%" maxlength="40" onkeypress="<%=layerName%>fn_pressSys(this.form);" onkeyup="checkByte(this, 40)" value = "${fclList.wffcltyNmTp}" readonly>
								</td>
								
								<th>시설명</th>
								<td>
									<input type="text" id="search" name="sehUserNm" style="width:100%" maxlength="40" onkeypress="<%=layerName%>fn_pressSys(this.form);" onkeyup="checkByte(this, 40)" value = "${fclList.wffcltyNm}" readonly>
								</td>
								
								<th>장애인명</th>
								<td>
									<input type="text" id="searchDspsnNm" name="searchDspsnNm" style="width:100%" maxlength="40" onkeyup="checkByte(this, 40)" onkeypress="<%=layerName%>fn_pressSys(this.form);" onkeyup="checkByte(this, 40)" >
								</td>
								
								<th>이용일</th>
								<td>
									<input type="text" id="<%=layerName%>sDate" name="fDate" style="width: 130px;" class="datepicker hover_disabled" maxlength="10" onkeypress="<%=layerName%>fn_pressSys(this.form); " onblur="<%=layerName%>checkDate(this.value, 'sDate');" onKeyup="inputYMDNumber(this);"> 
									<span style="margin-left:30px;">~</span>
									<input type="text" id="<%=layerName%>eDate" name="tDate" style="width: 130px; margin-left:5px;" class="datepicker hover_disabled" maxlength="10" onkeypress="<%=layerName%>fn_pressSys(this.form);" onblur="<%=layerName%>checkDate(this.value, 'eDate')" onKeyup="inputYMDNumber(this);">
								</td>
							</tbody>
					</table>
				</form>
				
					<table class="layoutTable">
					<tbody>
						<tr>
							<td> 
						<h2>이용자 리스트</h2>
						<%-- <div id="<%=layerName%>grid_wrap" style="height: 309px;width:1355px;"></div> --%>
						<div id="<%=layerName%>grid_wrap" style="height: 245px;"></div>
					</td></tr>
					<tr><td>
					
						<table class="layoutTable">
						    <tr>
							    <td valign="top" style="width:100%;">
							    <h2>이용 등록</h2>
							        <form name="enextMgmtForm" id="enextMgmtForm" method="post" autocomplete='off'>
							        <input type="hidden" id="saveMode" name="saveMode" value=""/>
							        <input type="hidden" id="wffcltyCd" name="wffcltyCd" value="${linkCd}"/>
							        <input type="hidden" id="dspsnPopValue" name="dspsnPopValue" value="1"/>
							        <input type="hidden" id="linkCd" name="linkCd" value="${linkCd}"/>
							        <input type="hidden" id="hdenDspsnId" name="hdenDspsnId" />
							        <input type="hidden" id="hdenEntrncDd" name="hdenEntrncDd" />
							        <input type="hidden" id="dspsnPopValue" name="dspsnPopValue" />
							        <input type="hidden" id="saveDspsn" name="saveDspsn" value="0"/>
							        <input type="hidden" id="cmprsValue" name="cmprsValue" value="0"/>
							        <input type="hidden" id="encUpdateChk" name="encUpdateChk" value="0"/>
							        <input type="hidden" id="admCmp" name="admCmp" value="0"/>
							        
				                    <table cellpadding="0" cellspacing="0"  class="dataTable" id="align_common" border="1" >
				                        <colgroup>
				                            <col width="9%" />
				                            <col width="17%" />
				                            <col width="9%" />
				                            <col width="17%" />
				                        </colgroup>
				                        <tr>
											<td colspan="4">
												<div class="submsg">
				                        		<span class = "redTitle">이름+생년월일+연락처 신규 등록 시 중복확인을 해야 합니다.</span>
				                        		</div>
				                        	</td>
				                        </tr>                                               
				                        <tr>
				                            <th><span class="essentialItem">이용장애인</span></th>
				                            <td>
				                            	<input type="hidden" id="dspsnId" name="dspsnId" title="이용장애인" tabindex="4" />
					        					<input type="text" id="dspsnNm" name="dspsnNm" style="width:100%; margin-left: 0px" title="장애인명" onkeyup="checkByte(this, 40)" onkeydown="<%=layerName%>EnterFilter('encBirthDd');" oninput="<%=layerName%>fn_removeDspsnInfo()"/> 
				                            </td>
				                            <th><span class="essentialItem">생년월일</span></th>
				                            <td>
				                            	<input type="text" id="encBirthDd" name="encBirthDd" class="datepicker hover_disabled" style="width:93%;text-align:left;" title="생년월일" tabindex="1" onKeyup="inputYMDNumber(this);" onkeydown="<%=layerName%>EnterFilter('encPhoneNum');" onblur="<%=layerName%>checksDate(this.value,'encBirthDd')" maxlength="10" oninput="<%=layerName%>fn_removeDspsnInfo()" tabindex="1">
				                            </td>
				                        </tr>
				                        <tr>
				                            <th style ="border-bottom: 1px solid #5c78a7;">연락처</th>
				                            <td style="border-right:none; border-bottom: 1px solid #5c78a7;">
					        					<input type="text" id="encPhoneNum" name="encPhoneNum" style="width:100%; margin-left: 0px" title="연락처" maxlength="13" onkeydown="<%=layerName%>EnterFilter('encChk');GRIT.event.removeChar(event);" oninput="<%=layerName%>fn_removeDspsnInfo()"  /> 
				                            </td>
				                            <td style="border-left:none; border-right:none; padding-left: 0px; border-bottom: 1px solid #5c78a7;">
				                            	<button type="button" class="normalBtn" id ="encChk" tabindex="1" onclick="<%=layerName%>checkDspsn();" style="width:85px;">검색</button>	
				                            </td>
				                            <td colspan="4" style="border-bottom: 1px solid #5c78a7; border-left: none;" />
				                        </tr>
				                        <tr>
				                        	<td colspan="4" style=" padding-left: 0px; height: 15px;" />
				                        </tr>
				                        <tr>
					                        <th><span class="essentialItem">이용시작일자</span></th>
					                        <td style="border-right: none;" ><input type="text" id="<%=layerName%>entrncDd" name="entrncDd" style="width: 93%;" class="datepicker hover_disabled" maxlength="10" onblur="<%=layerName%>checkDate(this.value,'entrncDd');" onkeydown="<%=layerName%>EnterFilter('enterRsn');" onKeyup="inputYMDNumber(this);" oninput="<%=layerName%>fn_updateCheck();"></td>
				                            
				                            <th class ="thlvhsDdNm">이용종료일자</th>
				                            <td class ="tdlvhsDdNm">
				                            <input type="text" id="<%=layerName%>lvhsDd" name="lvhsDd" style="width: 93%;" onkeydown="<%=layerName%>EnterFilter('enterRsn');" class="datepicker hover_disabled" onKeyup="inputYMDNumber(this);" maxlength="10" onblur="<%=layerName%>dateLeavingCheck(); <%=layerName%>checkDate(this.value,'lvhsDd');">
				                            </td>
				                            <td class ="tdlvhsDdNmBnk" colspan="2" style="border-left: none;" ></td>
				                        </tr>
				                        
				                        <tr>
				                        <th><span class="essentialItem">이용사유</span></th>
				                            <td><input type="text" id="enterRsn" name="enterRsn" style="width:100%;text-align:left;" class="onlynum" title="이용사유" tabindex="1" onkeyup="checkByte(this, 100)" onkeydown="<%=layerName%>EnterFilter('daytimeUseFacility');"> </td>
				                         <th>종료사유</th>
										 <td>
				                            <select id="lvhsRsnFg" name="lvhsRsnFg" style="width: 49.3%; text-align-last : center;" tabindex="1" onchange="<%=layerName%>changelvhsRsnFg()">
				                            	<option value = "">없음</option>
													<c:if test="${!empty rsnLvngList}">	
														<c:forEach var="list" items="${rsnLvngList}">
															<option value="${list.rsnLvngCode}">
																<c:out value="${list.rsnLvngNm}" /></option>
														</c:forEach>
													</c:if>
												</select>
				                            <input type="text" id="lvhsRsnEtcDetail" name="lvhsRsnEtcDetail" style="width:50%;text-align:left;" class="onlynum" title="퇴소사유 기타내역" tabindex="1" onkeyup="checkByte(this, 50)" onkeydown="<%=layerName%>EnterFilter('enterPrprty');"> </td>  	
				                        </tr>
				                        <tr class = "<%=layerName%>abClass">
				                    		<th>낯동안 이용시설</th>
				                            <td colspan="3"><input type="text" id="daytimeUseFacility" name="daytimeUseFacility" style="width:100%;text-align:left;" class="onlynum" title="낯동안 이용시설" tabindex="1" onkeyup="checkByte(this, 100)" onkeydown="<%=layerName%>EnterFilter('enterPrprty');"> </td>
				                    	</tr>
				                    	<tr class = "<%=layerName%>aClass">
				                    		<th>입소전 소유재산</th>
				                            <td><input type="text" id="enterPrprty" name="enterPrprty" style="width:100%;text-align:left;" class="onlynum" title="입소전 소유재산"tabindex="1" onkeyup="checkByte(this, 200);" onkeydown="<%=layerName%>EnterFilter('lvhsPrprty');"> </td>
				                            <th>퇴소시 소유재산</th>
				                            <td><input type="text" id="lvhsPrprty" name="lvhsPrprty" style="width:100%;text-align:left;" class="onlynum" title="퇴소시 소유재산"tabindex="1" onkeyup="checkByte(this, 200);" onkeydown="<%=layerName%>EnterFilter('encBeforeAddrDetail');"> </td>
				                    	</tr>
				                    	
				                    	<tr class = "<%=layerName%>aClass">
				                    		<th>입소전 우편번호</th>
				                            <td colspan="3">
				                            <input type="text" id="beforeZipCd" name="beforeZipCd" style="width:36%;text-align:left;" class="onlynum" title="입소전 우편번호" tabindex="1" readonly>
					                            <button type="button" class="iconSearchGlassBtn" tabindex="1" onClick="<%=layerName%>goPopup();"  value="팝업_domainChk">
					                            	<img src="/resources/imagesV2/iconSearchGlass.png" class="iconSearchGlass">
					                            </button>
				                            </td>
										</tr>
				                    	<tr class = "<%=layerName%>aClass">
				                    		<th>입소전 기본주소</th>
				                            <td colspan="3"><input type="text" id="beforeAddrBase" name="beforeAddrBase" style="width:100%;text-align:left;" class="onlynum" title="입소전 기본주소" onkeydown="<%=layerName%>EnterFilter('addrDetail');" readonly > </td>
				                    	</tr class = "<%=layerName%>aClass">
				                    	<tr class = "<%=layerName%>aClass">
				                    		<th>입소전 상세주소</th>
				                            <td colspan="3"><input type="text" id="encBeforeAddrDetail" name="encBeforeAddrDetail" style="width:100%;text-align:left;" class="onlynum"  title="입소전 상세주소" onkeyup="checkByte(this, 250)" onkeydown="<%=layerName%>EnterFilter('establishDd');"> </td>
				                    	</tr>
				                    	<tr class = "<%=layerName%>bClass">
											<th>참여유형</th>
											<td colspan="3"><input type="radio" id="partcptnTp1" name="partcptnTp" value="1" checked/> 근로장애인
												 <input type="radio" id="partcptnTp2" name="partcptnTp" value="2" /> 훈련장애인</td>
										</tr>
										<tr class = "<%=layerName%>bClass">
											<th>당해년 월 임금</th>
												<td><input type="text" id="tyMlyWage" name="tyMlyWage" style="width:100%;text-align:right;" class="onlynum" title="당해년 월 임금" tabindex="1" maxlength="11" onkeyup="fn_comma(this)" onkeydown="<%=layerName%>EnterFilter('hlyWage');"> </td> 
											<th>전년도 월 임금</th>
												<td><input type="text" id="lyMlyWage" name="lyMlyWage" style="width:100%;text-align:right;" class="onlynum" title="전년도 월 임금" tabindex="1" maxlength="11" onkeyup="fn_comma(this)" onkeydown="<%=layerName%>EnterFilter('hlyWage');"> </td>
										</tr>
										<tr class = "<%=layerName%>bClass">
											<th>당해년 시급</th>
												<td><input type="text" id="tyHlyWage" name="tyHlyWage" style="width:100%;text-align:right;" class="onlynum" title="당해년 시급" tabindex="1" maxlength="11" onkeyup="fn_comma(this)"> </td>
											<th>전년도 시급</th>
												<td><input type="text" id="lyHlyWage" name="lyHlyWage" style="width:100%;text-align:right;" class="onlynum" title="전년도 시급" tabindex="1" maxlength="11" onkeyup="fn_comma(this)"> </td>
										</tr>
										<tr class = "<%=layerName%>cClass">
				                    		<th>이용료</th>
				                            <td>
				                            <input type="text" id="enextFee" name="enextFee" style="width:100%;text-align:right;" class="onlynum" title="이용료" tabindex="1" maxlength="11" onkeyup="fn_comma(this)"> 
				                            </td>
				                            <th>이용 계약서 기간</th>
				                            <td>
				                            <input type="text" id="<%=layerName%>contractStartDd" name="contractStartDd" style="width: 41%;" class="datepicker hover_disabled" maxlength="10" onkeypress="<%=layerName%>fn_pressSys(this.form); " onblur="<%=layerName%>checkConStartDate(this.value);" onKeyup="inputYMDNumber(this);">
				                            <span style="margin-left:30px;">~</span>
				                            <input type="text" id="<%=layerName%>contractEndDd" name="contractEndDd" style="width: 41%; margin-left:5px;" class="datepicker hover_disabled" maxlength="10" onkeypress="<%=layerName%>fn_pressSys(this.form);" onblur="<%=layerName%>checkConEndDate(this.value);" onKeyup="inputYMDNumber(this);">
				                            </td>
				                    	</tr>
				                    </table>
				                    </form>
							    </td>
						    </tr> 
						</table>
				   </td></tr>
				   </tbody></table>
			</div>
		</div>
	</div>
</div>
<!-- E:section-top -->

<style type="text/css" >
	/** 헤더 툴팁 아이콘 스타일 */
	.tooltip-icon {
		background: url(/images/help_ico.png) no-repeat;
		width: 12px;
		height: 12px;
		cursor: default;
	}

	.tooltip{
	    position: relative;
	    display: inline-block;
	    /* border-bottom: 1px dotted black; */
	}
	.tooltipbox .tooltiptext{
	    visibility: hidden;
	    width: 120px;
	    background-color: #fff;
	    color: black;
	    text-align: center;
	    border-radius: 6px;
	    border: 1px solid #5d7cd4;
	    padding: 5px 0;
	
	    position: absolute;
	    z-index: 1;
	    bottom: 150%;
	    left: 50%;
	    margin-left: -60px;
	}
	
	.tooltip-icon:hover .tooltipbox .tooltiptext{
	    visibility: visible;
	}
 	
 	.my-column-right {
		text-align: right;
	}
	
	.my-column-center{
		text-align: center;
	}
	
	.my-column-left {
		text-align: left;
	}
	
	.submsg span{color: #FF0000;}
</style>

<script type="text/javascript" >
	// 조회 클릭시
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .search').click(function(){
		<%=layerName%>loadData();
		<%=layerName%>fn_newSys();
	});
	
	// 신규
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .new').click(function(){
		<%=layerName%>fn_newAll();
	});
	
	// 저장
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .save').click(function(){
		<%=layerName%>fn_saveEnextMgmt();
	});
	
	// 엑셀 다운로드
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .exel').click(function(){
		<%=layerName%>exportTo();
	});
	
	// 닫기
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .close').click(function(){
		mFnc.tabMenuClose('<%=layerName%>');
	});
	
	//엔터키 조회시
	function <%=layerName%>fn_pressSys(e){ 
    	if(event.keyCode == 13){ //javascript에서는 13이 enter키를 의미함 
    		<%=layerName%>loadData ();
		}
	}
	
	// AUIGrid 생성 후 반환 ID
	var <%=layerName%>myGridID;
	var <%=layerName%>columnGroupType = $(".<%=layerName%> #<%=layerName%>groupType").val();
	
	if(<%=layerName%>columnGroupType == 'A01'||<%=layerName%>columnGroupType == 'A02'||<%=layerName%>columnGroupType == 'A03'||<%=layerName%>columnGroupType =='A04'){
		var <%=layerName%>columnLayout  = [ 
	        {dataField : "dspsnId"      ,headerText : "장애인코드"   ,width : "6%", style : "my-column-center"}
	       ,{dataField : "dspsnNm" ,headerText : "장애인명"       ,width : "6%", style : "my-column-center"}
	       ,{dataField : "disableTp"      ,headerText : "장애유형"    ,width : "6%", style : "my-column-left"}
	       ,{dataField : "entrncDd"      ,headerText : "이용시작일"    ,width : "7%", dataType : "date", formatString : "yyyy-mm-dd", style : "my-column-center" } 
	       ,{dataField : "enterRsn"      ,headerText : "입소사유"    ,width : "15%", style : "my-column-left"} 
	       ,{dataField : "lvhsDd"      ,headerText : "퇴소일"    ,width : "7%",dataType : "date", formatString : "yyyy-mm-dd", style : "my-column-center"} 
	       ,{dataField : "lvhsRsnNm"      ,headerText : "퇴소사유"    ,width : "15%", style : "my-column-left"}
	       ,{dataField : "daytimeUseFacility"      ,headerText : "낯동안 이용시설"    ,width : "14%", style : "my-column-left"} 
	       ,{dataField : "fullAddr"      ,headerText : "입소전 주소지"    ,width : "24%", style : "my-column-left"}
	       ];
	}
	else if(<%=layerName%>columnGroupType == 'C01'||<%=layerName%>columnGroupType == 'C02'){
	var <%=layerName%>columnLayout  = [ 
	                                   {dataField : "dspsnId"      ,headerText : "장애인코드"   ,width : "6%", style : "my-column-center"}
	                                  ,{dataField : "dspsnNm" ,headerText : "장애인명"       ,width : "6%", style : "my-column-center"}
	                                  ,{dataField : "disableTp"      ,headerText : "장애유형"    ,width : "6%", style : "my-column-left"}
	                                  ,{dataField : "entrncDd"      ,headerText : "입소일"    ,width : "5%", dataType : "date", formatString : "yyyy-mm-dd", style : "my-column-center" } 
	                                  ,{dataField : "enterRsn"      ,headerText : "입소사유"    ,width : "16%", style : "my-column-left"} 
	                                  ,{dataField : "lvhsDd"      ,headerText : "퇴소일"    ,width : "5%",dataType : "date", formatString : "yyyy-mm-dd", style : "my-column-center"} 
	                                  ,{dataField : "lvhsRsnNm"      ,headerText : "퇴소사유"    ,width : "15%", style : "my-column-left"}
	                                  ,{dataField : "daytimeUseFacility"      ,headerText : "낯동안 이용시설"    ,width : "15%", style : "my-column-left"} 
	                                  ,{dataField : "tyMlyWage"      ,headerText : "당해년 임금"    ,width : "14%", dataType : "numeric", formatString : "#,##0", style : "my-column-right"} 
	                                  ,{dataField : "tyHlyWage"      ,headerText : "당해년 시급 "    ,width : "14%", dataType : "numeric", formatString : "#,##0", style : "my-column-right"} 
	                                  ];
	}
	
	else if(<%=layerName%>columnGroupType == 'B02'){
	var <%=layerName%>columnLayout  = [ 
        {dataField : "dspsnId"      ,headerText : "장애인코드"   ,width : "7%", style : "my-column-center"}
       ,{dataField : "dspsnNm" ,headerText : "장애인명"       ,width : "6%", style : "my-column-center"}
       ,{dataField : "disableTp"      ,headerText : "장애유형"    ,width : "6%", style : "my-column-left"}
       ,{dataField : "entrncDd"      ,headerText : "입소일"    ,width : "7%", dataType : "date", formatString : "yyyy-mm-dd", style : "my-column-center" } 
       ,{dataField : "enterRsn"      ,headerText : "입소사유"    ,width : "16%", style : "my-column-left"} 
       ,{dataField : "lvhsDd"      ,headerText : "퇴소일"    ,width : "7%",dataType : "date", formatString : "yyyy-mm-dd", style : "my-column-center"} 
       ,{dataField : "lvhsRsnNm"      ,headerText : "퇴소사유"    ,width : "15%", style : "my-column-left"}
       ,{dataField : "fee"      ,headerText : "이용료"    ,width : "15%", dataType : "numeric", formatString : "#,##0", style : "my-column-right"} 
       ,{dataField : "fullContractDd"      ,headerText : "이용 계약서 기간"    ,width : "21%", style : "my-column-center"} 
       ];
	}
	else{
		var <%=layerName%>columnLayout  = [ 
	        {dataField : "dspsnId"      ,headerText : "장애인코드"   ,width : "10%", style : "my-column-center"}
	       ,{dataField : "dspsnNm" ,headerText : "장애인명"       ,width : "10%", style : "my-column-center"}
	       ,{dataField : "disableTp"      ,headerText : "장애유형"    ,width : "10%", style : "my-column-left"}
	       ,{dataField : "entrncDd"      ,headerText : "입소일"    ,width : "10%", dataType : "date", formatString : "yyyy-mm-dd", style : "my-column-center" } 
	       ,{dataField : "enterRsn"      ,headerText : "입소사유"    ,width : "25%", style : "my-column-left"} 
	       ,{dataField : "lvhsDd"      ,headerText : "퇴소일"    ,width : "10%",dataType : "date", formatString : "yyyy-mm-dd", style : "my-column-center"} 
	       ,{dataField : "lvhsRsnNm"      ,headerText : "퇴소사유"    ,width : "25%", style : "my-column-left"}
	       ];
		}
	
	$(function () {
		$(".<%=layerName%> .datepicker").datepicker({
	        changeMonth: true,
	        changeYear: true,
	        yearRange: year_range,
	        showOn: "both",
	        buttonImage: "/resources/images/btn_cal.png",
	        buttonImageOnly: true,
	        buttonText: "선택하세요",
	        inline: true,
	        duration: 300,
	    });
		// AUIGrid 그리드를 생성합니다.
		<%=layerName%>createAUIGrid(<%=layerName%>columnLayout);
		
		// 데이터 요청, 요청 성공 시 AUIGrid 에 데이터 삽입합니다.
		$(".<%=layerName%> #enextMgmtForm").find("#saveMode").val("I");
		$(".<%=layerName%> #sehUserNm").focus();
		$(".<%=layerName%> #lvhsRsnEtcDetail").hide();
		$(".<%=layerName%> .thlvhsDdNm").hide();
		$(".<%=layerName%> .tdlvhsDdNm").hide();
		$(".<%=layerName%> .tdlvhsDdNmBnk").show();
		
		var _today1 = new Date();
		var firstDay;

		firstDay = dayFormatChk(_today1, 1); //sysdate 첫일
		
		$(".<%=layerName%> #<%=layerName%>sDate").val(firstDay);	
		$(".<%=layerName%> #<%=layerName%>eDate").val(new Date().yyyymmdd());
		$('.<%=layerName%> #dspsnId').focus();
		<%=layerName%>groupType();
	});
	
	

	// AUIGrid 를 생성합니다.
	function <%=layerName%>createAUIGrid(columnLayout) {
		
		var <%=layerName%>auiGridProps = {
			showRowCheckColumn : false,
			rowHeight : 38,
			headerHeight : 38,
			noDataMessage : "조회된 내용이 없습니다."
		};
		
		// 실제로 #grid_wrap 에 그리드 생성
		<%=layerName%>myGridID = AUIGrid.create("#<%=layerName%>grid_wrap", columnLayout, <%=layerName%>auiGridProps);
		
		// 선택 체인지 이벤트 바인딩
		AUIGrid.bind(<%=layerName%>myGridID, "selectionChange", function(event) {
		
			var primeCell = event.primeCell; // 선택 대표 셀
			var item = primeCell.item; // 행 정보
			<%=layerName%>setFieldToFormWindow(primeCell, item);
			$(".<%=layerName%> #rowIndex").val(primeCell.rowIndex);
		});
		
		// 그리드 ready 이벤트 바인딩
		AUIGrid.bind(<%=layerName%>myGridID, "ready", <%=layerName%>auiGridCompleteHandler);
	}

	// 그리드 ready 이벤트 핸들러
	function <%=layerName%>auiGridCompleteHandler(event) {
		var rowIndex = $(".<%=layerName%> #rowIndex").val();
		
		if (rowIndex != ""){
			AUIGrid.setSelectionByIndex(<%=layerName%>myGridID, rowIndex); // 선택한 셀 선택되도록 지정
		}else{
			AUIGrid.setSelectionByIndex(<%=layerName%>myGridID, 0, 0); // 첫번째 셀 선택되도록 지정
		}
	};
	// 셀 셀렉션 변경 시 아이템의 정보를 Form 필드에 세팅함
	function <%=layerName%>setFieldToFormWindow(primeCell, item) {
		$(".<%=layerName%> #dspsnNm").attr('readonly', true);
		$(".<%=layerName%> #encBirthDd").attr('readonly', true);
		$(".<%=layerName%> #encPhoneNum").attr('readonly', true);
		
		$(".<%=layerName%> #encChk").hide();
		
		$(".<%=layerName%> #wffcltyCd").val(item.wffcltyCd);
		$(".<%=layerName%> #dspsnId").val(item.dspsnId);
		//업데이트 전 값
		$(".<%=layerName%> #hdenDspsnId").val(item.dspsnId);
		$(".<%=layerName%> #hdenEntrncDd").val(item.entrncDd);
		$(".<%=layerName%> #dspsnNm").val(item.dspsnNm);
		if(item.encBirthDd != "" && item.encBirthDd != null){
			$(".<%=layerName%> #encBirthDd").val(item.encBirthDd.replace(/(\d{4})(\d{2})(\d{2})/, '$1-$2-$3'));
		} else{
			$(".<%=layerName%> #encBirthDd").val(item.encBirthDd);
		}
		$(".<%=layerName%> #encPhoneNum").val(item.encPhoneNum);
		var encPhoneNum = item.encPhoneNum;
		if(encPhoneNum != "" && encPhoneNum != null){
			$(".<%=layerName%> #encPhoneNum").val(chk_tel(item.encPhoneNum));
		}
		else{
			$(".<%=layerName%> #encPhoneNum").val(item.phoneNum1);
		}
		$(".<%=layerName%> #disableTp").val(item.disableTp);
		$(".<%=layerName%> #<%=layerName%>entrncDd").val(item.entrncDd);
		$(".<%=layerName%> #enterRsn").val(item.enterRsn);
		$(".<%=layerName%> #<%=layerName%>lvhsDd").val(item.lvhsDd);
		$(".<%=layerName%> #lvhsRsnFg").val(item.lvhsRsnFg);
		$(".<%=layerName%> #lvhsRsnEtcDetail").val(item.lvhsRsnEtcDetail);
		$(".<%=layerName%> #beforeZipCd").val(item.beforeZipCd);
		$(".<%=layerName%> #beforeAddrBase").val(item.beforeAddrBase);
		$(".<%=layerName%> #encBeforeAddrDetail").val(item.encBeforeAddrDetail);
		$(".<%=layerName%> #daytimeUseFacility").val(item.daytimeUseFacility);
		$(".<%=layerName%> #enterPrprty").val(item.enterPrprty);
		$(".<%=layerName%> #lvhsPrprty").val(item.lvhsPrprty);
		$(".<%=layerName%> #lyMlyWage").val(item.lyMlyWage);
		$(".<%=layerName%> #lyHlyWage").val(item.lyHlyWage);
		$(".<%=layerName%> #tyMlyWage").val(item.tyMlyWage);
		$(".<%=layerName%> #tyHlyWage").val(item.tyHlyWage);
		$(".<%=layerName%> #enextFee").val(item.fee);
		$(".<%=layerName%> #partcptnTp").val(item.partcptnTp);
		if(item.partcptnTp == 1){
			$(".<%=layerName%> #partcptnTp1").prop('checked', true);
		}
		if(item.partcptnTp == 2){
			$(".<%=layerName%> #partcptnTp2").prop('checked', true);
		}
		$(".<%=layerName%> #<%=layerName%>contractStartDd").val(item.contractStartDd);
		$(".<%=layerName%> #<%=layerName%>contractEndDd").val(item.contractEndDd);
		$(".<%=layerName%> #useFg").val(item.useFg);
		$(".<%=layerName%> #enextMgmtForm").find("#saveMode").val("U");
		
		<%=layerName%>changelvhsRsnFg();
		
		
		$(".<%=layerName%> #userGroupCd").attr('readonly', true); 
		$(".<%=layerName%> #encPassword").attr('readonly', true); 
		
		// 상태값
		$(".<%=layerName%> #enextMgmtForm").find("#saveMode").val("U");
		$(".<%=layerName%> #saveDspsn").val(0);
		$(".<%=layerName%> #encUpdateChk").val("0");
		
		//퇴소하였을경우 
		<%=layerName%>fn_blindHandling(item.dspsnId, item.lvhsRsnFg, item.lvhsDd);
	}
	
	function <%=layerName%>goPopup(){
		// IE에서 opener관련 오류가 발생하는 경우, window에 이름을 명시해줍니다.
		window.name="jusoPopup";
		
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("/pop/jusoPop","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	}


	function jusoCallBack(addrBase, zipCd){
			// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
			
			document.enextMgmtForm.beforeZipCd.value = zipCd;
			document.enextMgmtForm.beforeAddrBase.value = addrBase;
			
			
	}
	

	
	//엔터키 조회시
	function <%=layerName%>fn_pressSys(e){ 
    	if(event.keyCode == 13){ //javascript에서는 13이 enter키를 의미함 
    		<%=layerName%>loadData ();
		}
	}
	
	//조회
	function <%=layerName%>loadData () {
		var groupType = $(".<%=layerName%> #<%=layerName%>groupType").val();
		var searchDspsnNm      = $(".<%=layerName%> #searchDspsnNm").val();
		var sDate = $(".<%=layerName%> #<%=layerName%>sDate").val();	
		var eDate = $(".<%=layerName%> #<%=layerName%>eDate").val();	
		
		if(	$(".<%=layerName%> #<%=layerName%>sDate").val().length != "10"){
			GRIT.msg.alert("날짜형식이 잘못되었습니다.");
			$(".<%=layerName%> #<%=layerName%>sDate").focus();
			return;
			}
		
		if(	$(".<%=layerName%> #<%=layerName%>eDate").val().length != "10"){
			GRIT.msg.alert("날짜형식이 잘못되었습니다.");
			$(".<%=layerName%> #<%=layerName%>eDate").focus();
			return;
			}
		
		if(!GRIT.date.compareDateFT(sDate, eDate)){
			GRIT.msg.alert('이용시작일이 종료일보다 날짜가 더 빠릅니다. 조회조건중 이용일을 수정 후 조회해주시길 바랍니다.');
			return false;
		}
		
		var sendData = {"searchDspsnNm"      : searchDspsnNm
				       ,"groupType" : groupType
					   ,"sDate" : sDate
				       ,"eDate" : eDate};
		
		// ajax 요청 전 그리드에 로더 표시
		AUIGrid.showAjaxLoader(<%=layerName%>myGridID);
		
		GRIT.tran.send({
			url: "/wfc/WfcEnextMgmtGrid1",
			sendData: sendData,
			success: function(result){
				// 그리드에 데이터 세팅
				// resData 는 JSON 을 파싱한 Array-Object 입니다.
				AUIGrid.setGridData(<%=layerName%>myGridID, result.data);
				
				// 로더 제거
				AUIGrid.removeAjaxLoader(<%=layerName%>myGridID);
				AUIGrid.setSelectionByIndex(<%=layerName%>myGridID, 0,0);
	 			
			},
			error: function(request, status, error){
				GRIT.msg.alert("사용자 조회하는데 문제가 발생했습니다.");
				// 로더 제거
				AUIGrid.removeAjaxLoader(<%=layerName%>myGridID);
			},
			loading : false
		});
	}
	
	// 신규
	function <%=layerName%>fn_newAll() {
		if ( confirm ("신규로 입력 하시겠습니까?") ) {
			<%=layerName%>fn_newSys();
			$(".<%=layerName%> #userGroupCd").focus();
		}
	}
	
	//초기화
	function <%=layerName%>fn_newSys() {
		$(".<%=layerName%> #hdenDspsnId").val("");
		$(".<%=layerName%> #hdenEntrncDd").val("");
		$(".<%=layerName%> #dspsnId").val("");
		$(".<%=layerName%> #dspsnNm").val("");
		$(".<%=layerName%> #disableTp").val("");
		$(".<%=layerName%> #<%=layerName%>entrncDd").val("");
		$(".<%=layerName%> #<%=layerName%>lvhsDd").val("");
		$(".<%=layerName%> #enterRsn").val("");
		$(".<%=layerName%> #lvhsRsnFg").val("");
		$(".<%=layerName%> #lvhsRsnEtcDetail").val("");
		$(".<%=layerName%> #daytimeUseFacility").val("");
		$(".<%=layerName%> #enterPrprty").val("");
		$(".<%=layerName%> #lvhsPrprty").val("");
		$(".<%=layerName%> #beforeZipCd").val("");
		$(".<%=layerName%> #beforeAddrBase").val("");
		$(".<%=layerName%> #encBeforeAddrDetail").val("");
		$(".<%=layerName%> #partcptnTp1").prop('checked', true);
		$(".<%=layerName%> #lyMlyWage").val("");
		$(".<%=layerName%> #lyHlyWage").val("");
		$(".<%=layerName%> #tyMlyWage").val("");
		$(".<%=layerName%> #tyHlyWage").val("");
		$(".<%=layerName%> #enextFee").val("");
		$(".<%=layerName%> #<%=layerName%>contractStartDd").val("");
		$(".<%=layerName%> #<%=layerName%>contractEndDd").val("");
		$(".<%=layerName%> .thlvhsDdNm").hide();
		$(".<%=layerName%> .tdlvhsDdNm").hide();
		$(".<%=layerName%> .tdlvhsDdNmBnk").show();
		$(".<%=layerName%> #lvhsRsnEtcDetail").hide();
		// 상태값
		$(".<%=layerName%> #enextMgmtForm").find("#saveMode").val("I");
		$(".<%=layerName%> #encBirthDd").val("");
		$(".<%=layerName%> #encPhoneNum").val("");
		$(".<%=layerName%> #saveDspsn").val("0");
		$('.<%=layerName%> #dspsnNm').focus();
		
		$(".<%=layerName%> #encChk").show();
		$(".<%=layerName%> #dspsnNm").attr('readonly', false);
		$(".<%=layerName%> #encBirthDd").attr('readonly', false);
		$(".<%=layerName%> #encPhoneNum").attr('readonly', false);
		$(".<%=layerName%> #<%=layerName%>entrncDd").attr('readonly', false);
		$(".<%=layerName%> #<%=layerName%>lvhsDd").attr('readonly', false);
		$(".<%=layerName%> #enterRsn").attr('readonly', false);
		$(".<%=layerName%> #lvhsRsnFg").attr('disabled', false);
		$(".<%=layerName%> #daytimeUseFacility").attr('disabled', false);
		$(".<%=layerName%> #enterPrprty").attr('disabled', false);
		$(".<%=layerName%> #lvhsPrprty").attr('disabled', false);
		$(".<%=layerName%> #enterPrprty").attr('disabled', false);
		$(".<%=layerName%> #encBeforeAddrDetail").attr('readonly', false);
		
		$(".<%=layerName%> #tyMlyWage").attr('readonly', false);
		$(".<%=layerName%> #lyMlyWage").attr('readonly', false);
		$(".<%=layerName%> #tyHlyWage").attr('readonly', false);
		$(".<%=layerName%> #lyHlyWage").attr('readonly', false);
		
		$(".<%=layerName%> #enextFee").attr('readonly', false);
		$(".<%=layerName%> #<%=layerName%>contractStartDd").attr('readonly', false);
		$(".<%=layerName%> #<%=layerName%>contractEndDd").attr('readonly', false);
		
		$(".<%=layerName%> #encUpdateChk").val("0");
		
		$(".<%=layerName%> #enextMgmtForm").find($(".<%=layerName%> .ui-datepicker-trigger")).css('display', 'inline-block');
	}
	
	//저장 체크
	function <%=layerName%>fn_saveEnextMgmt() {
		
		if ( $(".<%=layerName%> #saveMode").val() == "" ) {
			GRIT.msg.alert("현재 입소중인 장애인의 과거 정보를 수정할 수 없습니다."); return;
		}
		
		if ( $(".<%=layerName%> #saveDspsn").val() != 1 ) {
			if ( $(".<%=layerName%> #dspsnId").val() == "" ) {
				$(".<%=layerName%> #dspsnId").focus();
				GRIT.msg.alert("[이용장애인] 정보를 입력 후 검색해주세요."); return;
			}
		}
		
		if ( $(".<%=layerName%> #saveDspsn").val() == '' ) {
			GRIT.msg.alert("[이용장애인] 정보를 입력 후 검색해주세요."); return;
		}
		
		if ( $(".<%=layerName%> #encBirthDd").val() == "" ) {
			$(".<%=layerName%> #encBirthDd").focus();
			GRIT.msg.alert("[생년월일]을 필수 항목입니다."); return;
		}
		
		if ( $(".<%=layerName%> #<%=layerName%>entrncDd").val() == "" ) {
			$(".<%=layerName%> #<%=layerName%>entrncDd").focus();
			GRIT.msg.alert("[이용시작일]은 필수 항목입니다."); return;
		}
		
		
		if ( $(".<%=layerName%> #enterRsn").val() == "" ) {
			$(".<%=layerName%> #enterRsn").focus();
			GRIT.msg.alert("[이용사유]는 필수 항목입니다."); return;
		}
		
		if ( $(".<%=layerName%> #<%=layerName%>contractStartDd").val() != ''){
			if($(".<%=layerName%> #<%=layerName%>contractEndDd").val() == ''){
				GRIT.msg.alert("[이용 계약서 기간] 작성시 시작과 종료일은 필수 항목입니다."); return;
			}
		}
		
		if ( $(".<%=layerName%> #<%=layerName%>contractEndDd").val() != ''){
			if($(".<%=layerName%> #<%=layerName%>contractStartDd").val() == ''){
				GRIT.msg.alert("[이용 계약서 기간] 작성시 시작과 종료일은 필수 항목입니다."); return;
			}
		}
		
		if ( $(".<%=layerName%> #lvhsRsnFg").val() != "") {
				if( $(".<%=layerName%> #<%=layerName%>lvhsDd").val().length != "10"){
		
						$(".<%=layerName%> #<%=layerName%>lvhsDd").focus();
					GRIT.msg.alert("[이용종료일]를 입력해주세요."); return;
				}
		}
		
		if( $(".<%=layerName%> #<%=layerName%>lvhsDd").val().length == "10"){
			if(!GRIT.date.compareDateFT($(".<%=layerName%> #<%=layerName%>entrncDd").val(), $(".<%=layerName%> #<%=layerName%>lvhsDd").val())){
				GRIT.msg.alert('이용종료일이 이용시작일보다 더 빠릅니다. 이용종료일 및 이용시작일을 수정 후 저장해주시길 바랍니다.');
				return false;
			}
		}
		
		if ( $(".<%=layerName%> #<%=layerName%>entrncDd").val().length != "10") {
			$(".<%=layerName%> #<%=layerName%>entrncDd").focus();
			GRIT.msg.alert("[이용시작일]를 올바르게 입력해주세요."); return;
		}
		
		if ( $(".<%=layerName%> #<%=layerName%>contractStartDd").val() != "") {
			if ( $(".<%=layerName%> #<%=layerName%>contractStartDd").val().length != "10") {
				$(".<%=layerName%> #<%=layerName%>contractStartDd").focus();
				GRIT.msg.alert("[이용 계약서 기간] 시작날짜를 올바르게 입력해주세요."); return;
			}
		}
		if ( $(".<%=layerName%> #<%=layerName%>contractStartDd").val() != "") {
			if ( $(".<%=layerName%> #<%=layerName%>contractEndDd").val().length != "10") {
				$(".<%=layerName%> #<%=layerName%>contractEndDd").focus();
				GRIT.msg.alert("[이용 계약서 기간] 종료날짜를 올바르게 입력해주세요."); return;
			}
		}
		
		var contractStartDd = $(".<%=layerName%> #<%=layerName%>contractStartDd").val();
		var contractEndDd =$(".<%=layerName%> #<%=layerName%>contractEndDd").val();
		
		if(!GRIT.date.compareDateFT(contractStartDd, contractEndDd)){
			GRIT.msg.alert('이용 계약서 기간을 시작 날짜를 종료날짜보다 빠른 날짜로 입력해주세요.');
			return false;
		}
		<%=layerName%>fn_saveCmprsCheck();
		
		if($(".<%=layerName%> #<%=layerName%>entrncDd").val() != $(".<%=layerName%> #hdenEntrncDd").val()){
			$(".<%=layerName%> #encUpdateChk").val("1");
		} else{
			$(".<%=layerName%> #encUpdateChk").val("0");
		}
		
		if($(".<%=layerName%> #cmprsValue").val() == 1 && $(".<%=layerName%> #encUpdateChk").val() == 1){
			setTimeout(function(){					
				GRIT.msg.alert($(".<%=layerName%> #<%=layerName%>entrncDd").val()+'일은 이미 등록이 되어있는 장애인입니다.');
				$(".<%=layerName%> #<%=layerName%>entrncDd").val("");
				},50);
			
			$(".<%=layerName%> #<%=layerName%>entrncDd").focus();
			return;
		}
		
		<%=layerName%>fn_admCmp();
		
		if($(".<%=layerName%> #admCmp").val() == "1"){
			setTimeout(function(){					
				GRIT.msg.alert("이미 시설을 이용했었던 이용 시작일 날짜입니다.");
				},50);
			$(".<%=layerName%> #<%=layerName%>entrncDd").val("");
			$(".<%=layerName%> #<%=layerName%>entrncDd").focus();
		return
		}
		
		if(confirm("저장 하시겠습니까?")){
			<%=layerName%>fn_save();
	    } 
	}
	
	//저장
	function <%=layerName%>fn_save(){
        
		var sendData = $(".<%=layerName%> form[name=enextMgmtForm]").serializeObject();
		
         GRIT.tran.send({
			url: "/wfc/saveEnextMgmtA",
			async: false,
			sendData: sendData,
			success: function(result){
				if(result.rtnCode == "0"){
					GRIT.msg.alert(result.message);
					var saveMode = $(".<%=layerName%> #saveMode").val();
					if (saveMode == "I"){
						var linkCd = $(".<%=layerName%> #linkCd").val();
						if (linkCd == ""){
							var itmName = $(".<%=layerName%> #itmName").val();
							$(".<%=layerName%> #searchItmName").val( itmName );
						}else{
							$(".<%=layerName%> #searchItmName").val( linkCd );	
						}
						
					}
					<%=layerName%>fn_newSys();
					<%=layerName%>loadData ();
				}else{
					GRIT.msg.alert(result.message);
				}
				
			},
 			loadingTarget: "<%=layerName%>"
 		}); 
	}
	
	// 장애인 팝업
 	function <%=layerName%>fn_selectDspsn(){
 		
 		var userId = $(".<%=layerName%> #userId").val();
 		
 		/* if(userId == "" || userId == null){
 			GRIT.msg.alert("사용자 조회 후 변경이 가능합니다.");
 			return false;
 		} */
 		
		 var layerName = "<%=layerName%>"; 
		 var url = "<c:url value='/pop/searchDspsnPop?layerName="+layerName+"'/>";
		 var width="700";
		 var height="610";
		 var name="searchDspsnPop";
		 popitup(url, height, width, name);
	}
 	
 	//장애인 Ajax 검색
	function <%=layerName%>fn_searchAjaxDspsn(){

		   if(event.keyCode == 13 && event.keyCode == 9){
		   	   return false;
		   } 	  
			var dspsnId      = 	$(".<%=layerName%> #dspsnId").val();
			var sendData ={"dspsnId" : dspsnId};

	        GRIT.tran.send({
				url: "/wfc/searchAjaxDspsn",
				async: false,
				sendData: sendData,
				success: function(result){
					<%-- if(result.data[0].useFg == '0'){
						$(".<%=layerName%> #dspsnId").val("");
						alert("미사용 중인 장애인은 사용할 수 없습니다.");
						return;
					}
					
					if(result.data.length > 1){
						<%=layerName%>fn_selectDspsn();
					}else if(result.data.length == 1){
						$(".<%=layerName%> #dspsnId").val(result.data[0].dspsnId);
						$(".<%=layerName%> #dspsnNm").val(result.data[0].dspsnNm);
						$(".<%=layerName%> #disableTp").val(result.data[0].disableTpNm);
					}else{
						alert("조회된 데이터가 없습니다");
						$(".<%=layerName%> #dspsnId").focus();
						$(".<%=layerName%> #dspsnNm").val("");
					} --%>
					
				},
				loadingTarget: "<%=layerName%>"
			}); 
			
		}
	
	//장애인 Ajax 검색
	function <%=layerName%>checkDspsn(){
		   /* if(event.keyCode != 13 && event.keyCode != 9){
		   	   return false;
		   } */
		   var dspsnId         = 	$(".<%=layerName%> #dspsnId").val();
		   var hdenDspsnId         = 	$(".<%=layerName%> #hdenDspsnId").val();
		   var entrncDd         = 	$(".<%=layerName%> #entrncDd").val();
		   var dspsnNm         = 	$(".<%=layerName%> #dspsnNm").val();
		   var encBirthDd       = 	$(".<%=layerName%> #encBirthDd").val();
		   var encPhoneNum      = 	$(".<%=layerName%> #encPhoneNum").val();
		   var sendData ={	"dspsnId"  : dspsnId
				   			,"dspsnNm" : dspsnNm
							,"encBirthDd" : encBirthDd
							,"encPhoneNum" : encPhoneNum};
		   
		   if(dspsnNm == ""){
			   setTimeout(function() {
				   GRIT.msg.alert("장애인 이름을 입력 후 검색해주세요.");
					} , 10);
			   $(".<%=layerName%> #dspsnNm").focus();
			   return;
		   }
		   
		   if(encBirthDd == ""){
			   setTimeout(function() {
				   GRIT.msg.alert("생년월일을 입력 후 검색해주세요.");
					} , 10);
			   $(".<%=layerName%> #encBirthDd").focus();
			   return;
		   }

	        GRIT.tran.send({
				url: "/wfc/selectCheckDspsn",
				async: false,
				sendData: sendData,
				success: function(result){
					
					var count = result.data.length;
					//장애인 0건 조회시
	        		if(count == 0){
						if(confirm("존재하지 않는 장애인입니다. 새로 추가하시겠습니까?")){
							$(".<%=layerName%> #saveDspsn").val('1');
							$(".<%=layerName%> #<%=layerName%>entrncDd").focus();
						} else{
							return;
						}
					//장애인 1건 조회시
					} else if(count == 1){
						if(result.data[0].entrncDd != null && result.data[0].lvhsDd == null){
							GRIT.msg.alert('현재 시설에 이용 중인 장애인입니다.');
							$(".<%=layerName%> #saveDspsn").val('');
							$(".<%=layerName%> #dspsnId").val('');
							$(".<%=layerName%> #dspsnNm").val('');
							$(".<%=layerName%> #encBirthDd").val('');
							$(".<%=layerName%> #encPhoneNum").val('');
							$(".<%=layerName%> #dspsnNm").focus();
							return;
							 
						}else{
							if(result.data[0].useFg == '0'){
								GRIT.msg.alert('관리 대상이 아닌 장애인이므로 사용할 수 없습니다');
								return;
							}
							
							setTimeout(function() {
								GRIT.msg.alert('등록이 가능한 장애인입니다.');
							}, 50);
							$(".<%=layerName%> #saveDspsn").val('0');
							$(".<%=layerName%> #dspsnId").val(result.data[0].dspsnId);
							$(".<%=layerName%> #<%=layerName%>entrncDd").focus();
							<%-- $(".<%=layerName%> #dspsnId").val(result.data[0].dspsnId);
							$(".<%=layerName%> #encBirthDd").val(result.data[0].encBirthDd);
							$(".<%=layerName%> #encPhoneNum").val(chk_tel(result.data[0].encPhoneNum)); --%>
						}
					//장애인 2건 이상 조회시
					} else if(count > 1){
						<%=layerName%>fn_selectDspsn2();
					}
					
				},
				loadingTarget: "<%=layerName%>"
			}); 
			
		}
	
	function <%=layerName%>fn_searchLinkCd(value){

	   if(event.keyCode != 13 && event.keyCode != 9){
	   	   return false;
	   } 	  
	   
		var userGroupCd = $(".<%=layerName%> #userGroupCd").val();
		var linkCd = value;

		var sendData ={"linkCd"      : linkCd
				      ,"userGroupCd" : userGroupCd};
	   
        GRIT.tran.send({
			url: "/bas/searchLinkcdList",
			async: false,
			sendData: sendData,
			success: function(result){
				if(result.data.length > 1){
					if($(".<%=layerName%> #linkCd").val() != '' || $(".<%=layerName%> #linkCd").val().length != 4){
        				<%=layerName%>fn_searchPop();        	
        			}
				}else if(result.data.length == 1){
					$(".<%=layerName%> #linkCd").val(result.data[0].linkcd);
					$(".<%=layerName%> #linkNm").val(result.data[0].linknm);
				}else{
					alert("조회된 데이터가 없습니다");
					$(".<%=layerName%> #linkCd").focus();
					$(".<%=layerName%> #linkCd").val("");
				}
				
			},
			loadingTarget: "<%=layerName%>"
		}); 
	}
	
	//날짜 자동 하이픈(-) 함수
	function inputYMDNumber(obj) {
        // @see DELETE 키버튼이 눌리지 않은 경우에만 실행
        if(event.keyCode != 8) {
            // @see 숫자와 하이픈(-)기호의 값만 존재하는 경우 실행
            if(obj.value.replace(/[0-9 \-]/g, "").length == 0) {



                // @see 하이픈(-)기호를 제거한다.

                let number = obj.value.replace(/[^0-9]/g,"");

                let ymd = "";



                // @see 문자열의 길이에 따라 Year, Month, Day 앞에 하이픈(-)기호를 삽입한다.

                if(number.length < 4) {

                    return number;

                } else if(number.length < 6){

                    ymd += number.substr(0, 4);

                    ymd += "-";

                    ymd += number.substr(4);

                } else {

                    ymd += number.substr(0, 4);

                    ymd += "-";

                    ymd += number.substr(4, 2);

                    ymd += "-";

                    ymd += number.substr(6);

                }



                // @see 입력 가능 날짜 제한 기능 - 선택

                // if(ymd.length == 10) {

                //

                //     const birthDay = new Date(number.substr(0,4)+"/"+number.substr(4,2)+"/"+number.substr(6)+" 00:00:00");

                //     const limitDay = new Date("2000/10/04 23:59:59");

                //

                //     if(birthDay > limitDay) {

                //         alert("2000년 10월 04일 이후의 날짜는\n선택할 수 없습니다.");

                //         obj.value = "";

                //         obj.focus();

                //         return false;

                //     }

                // }



                obj.value = ymd;



            } else {

                //@see 숫자와 하이픈(-)기호 이외의 모든 값은 삭제한다.

                obj.value = obj.value.replace(/[^0-9 ^\-]/g,"");

                return false;

            }

        } else {

            return false;

        }

    }
	
/* 	function checkByteTest(comp,maxByte) {
		var totalByte = 0;
		//var message = frm.messagebox.value;
		var message = comp.value;
		var limitByte = maxByte;
		var tempData = "";
		
		for(var i =0; i <= message.length; i++) {
			var currentByte = message.charCodeAt(i);
			if(currentByte > 128) totalByte += 2;
			else totalByte++;
			
			// 기준바이트보다 작을경우에만 tempData에 담음
			if(totalByte <= limitByte){
				tempData = tempData + message.charAt(i);
				if(totalByte > limitByte) {
					$("#"+comp.id).val(tempData);
				}
			}else{
				alert("입력할 수 있는 최대 글자 수를 초과하였습니다.");
				return false;
			}
		}
	} */
	function <%=layerName%>changelvhsRsnFg(){
		if($(".<%=layerName%> #enextMgmtForm").find("#lvhsRsnFg").val() == "E"){
			$(".<%=layerName%> .thlvhsDdNm").show();
			$(".<%=layerName%> .tdlvhsDdNm").show();
			$(".<%=layerName%> .tdlvhsDdNmBnk").hide();
			$(".<%=layerName%> #lvhsRsnEtcDetail").show();
		}
		else if($(".<%=layerName%> #enextMgmtForm").find("#lvhsRsnFg").val() == ""){
			$(".<%=layerName%> .thlvhsDdNm").hide();
			$(".<%=layerName%> .tdlvhsDdNm").hide();
			$(".<%=layerName%> .tdlvhsDdNmBnk").show();
			$(".<%=layerName%> #lvhsRsnEtcDetail").hide();
			$(".<%=layerName%> #<%=layerName%>lvhsDd").val("");
			$(".<%=layerName%> #lvhsRsnEtcDetail").val("");
			
		}
		else{
			$(".<%=layerName%> #lvhsRsnEtcDetail").hide();
			$(".<%=layerName%> .thlvhsDdNm").show();
			$(".<%=layerName%> .tdlvhsDdNm").show();
			$(".<%=layerName%> .tdlvhsDdNmBnk").hide();
		}
	}
	
	//엔터키 이동
	function <%=layerName%>EnterFilter(next) { 
		if (event.keyCode == 13) {
				$('.<%=layerName%> #'+next).focus();
		}
	}
	
	function <%=layerName%>checksDate(obj, id){
		
		var yyyymmdd = obj.replace(/\-/g,'');
		var idVal = id;
		if(!GRIT.date.isValidDate(yyyymmdd)){
			GRIT.msg.alert("날짜형식이 잘못되었습니다.");
			$(".<%=layerName%> #"+idVal).val("");
			$(".<%=layerName%> #"+idVal).focus();
			}
		}
	
function <%=layerName%>checkDate(obj, id){
		
		var yyyymmdd = obj.replace(/\-/g,'');
		
		if(!GRIT.date.isValidDate(yyyymmdd)){
			setTimeout(function() {
				GRIT.msg.alert("날짜형식이 잘못되었습니다.");
				} , 10);
			$(".<%=layerName%> #<%=layerName%>"+id).val('');
			$(".<%=layerName%> #<%=layerName%>"+id).focus();
			}
		}
		
	function <%=layerName%>checkEndDate(obj){
		
		var yyyymmdd = obj.replace(/\-/g,'');
		
		if(!GRIT.date.isValidDate(yyyymmdd)){
			GRIT.msg.alert("날짜형식이 잘못되었습니다.");
			$(".<%=layerName%> #<%=layerName%>lvhsDd").focus();
			}
		}
	
	function <%=layerName%>groupType(){
		var groupType = $(".<%=layerName%> #<%=layerName%>groupType").val();
		var aClass = $(".<%=layerName%> .<%=layerName%>aClass");
		var abClass = $(".<%=layerName%> .<%=layerName%>abClass");
		var bClass = $(".<%=layerName%> .<%=layerName%>bClass");
		var cClass = $(".<%=layerName%> .<%=layerName%>cClass");
		
	if(groupType == 'A01'|| groupType == 'A02'|| groupType == 'A03'|| groupType =='A04' ){
		aClass.show();
		abClass.show();
		bClass.hide();
		cClass.hide();
	} else if(groupType == 'C01'|| groupType == 'C02'){
		aClass.hide();
		abClass.show();
		bClass.show();
		cClass.hide();
	} else if(groupType == 'B02' ){
		aClass.hide();
		abClass.hide();
		bClass.hide();
		cClass.show();
	} else{
		aClass.hide();
		abClass.hide();
		bClass.hide();
		cClass.hide();
	}
}
	
	function <%=layerName%>dateLeavingCheck(){
		var entrncDd = $(".<%=layerName%> #<%=layerName%>entrncDd");
		var lvhsDd = $(".<%=layerName%> #<%=layerName%>lvhsDd");
		if(!GRIT.date.compareDateFT(entrncDd, lvhsDd)){
			GRIT.msg.alert('이용종료일이 이용시작일보다 기간이 더 빠릅니다. 재 입력하시길 바랍니다.');
			return false;
		}
	}
	
function <%=layerName%>exportTo() {
		
		AUIGrid.exportToXlsx(<%=layerName%>myGridID, {
			fileName : "시설_이용관리",
			// 스타일 상태 유지 여부(기본값:true)
		});
	}
	
	// 장애인 팝업2
	function <%=layerName%>fn_selectDspsn2(){
		
	$(".<%=layerName%> #enextMgmtForm").find("#dspsnPopValue").val(3);
		
	 var layerName = "<%=layerName%>"; 
	 var url = "<c:url value='/pop/searchDspsnPop2?layerName="+layerName+"'/>";
	 var width="700";
	 var height="610";
	 var name="searchDspsnPop2";
	 popitup(url, height, width, name);
}
	
	//장애인 검색 callback2
	function <%=layerName%>setSearchDspsnPop2(item,  name){
		<%=layerName%>checkDspsn();
		if(item.useFg == "미사용"){
			GRIT.msg.alert("관리 대상이 아닌 장애인이므로 사용할 수 없습니다");
		}else{
			$(".<%=layerName%> #dspsnId").val(item.dspsnId);
			$(".<%=layerName%> #dspsnNm").val(item.dspsnNm);
			$(".<%=layerName%> #encBirthDd").val(fn_yyymmdd(item.encBirthDd));
			$(".<%=layerName%> #encPhoneNum").val(item.encPhoneNum);
			<%=layerName%>checkDspsn();
		}
	}

	function <%=layerName%>fn_removeDspsnInfo(){
		$(".<%=layerName%> #dspsnId").val("");
	}
	function <%=layerName%>fn_updateCheck(){
		if($(".<%=layerName%> #saveMode").val() != "S"){
			$(".<%=layerName%> #encUpdateChk").val("1");
		}
	}
	
 	//장애인 Ajax 검색
	function <%=layerName%>fn_saveCmprsCheck(){

		   if(event.keyCode == 13 && event.keyCode == 9){
		   	   return false;
		   } 	  
			var dspsnId      = 	$(".<%=layerName%> #dspsnId").val();
			var entrncDd      = 	$(".<%=layerName%> #<%=layerName%>entrncDd").val();
			var sendData ={"dspsnId" : dspsnId
							,"entrncDd" : entrncDd};

	        GRIT.tran.send({
				url: "/wfc/insertCmprs",
				async: false,
				sendData: sendData,
				success: function(result){
					$(".<%=layerName%> #cmprsValue").val(result.data);
				},
				loadingTarget: "<%=layerName%>"
			}); 
			
		}
		
	 	//장애인 Ajax 검색
		function <%=layerName%>fn_admCmp(){

			   if(event.keyCode == 13 && event.keyCode == 9){
			   	   return false;
			   } 	  
			   
				var dspsnId      = 	$(".<%=layerName%> #dspsnId").val();
				var entrncDd      = 	$(".<%=layerName%> #<%=layerName%>entrncDd").val();
				var sendData ={"dspsnId" : dspsnId
								,"entrncDd" : entrncDd};

		        GRIT.tran.send({
					url: "/wfc/admCmp",
					async: false,
					sendData: sendData,
					success: function(result){
						$(".<%=layerName%> #admCmp").val(result.data);
					},
					loadingTarget: "<%=layerName%>"
				}); 
				
			}
		
		//장애인 Ajax 검색
		function <%=layerName%>fn_blindHandling(dspsnId, lvhsRsnFg, lvhsDd){

			   if(event.keyCode == 13 && event.keyCode == 9){
			   	   return false;
			   } 	  
				var sendData ={"dspsnId" : dspsnId
								,"lvhsDd" : lvhsDd};

		        GRIT.tran.send({
					url: "/wfc/blindHandling",
					async: false,
					sendData: sendData,
					success: function(result){
						if(result.data >= 1 && lvhsRsnFg != undefined){
							$(".<%=layerName%> #<%=layerName%>entrncDd").attr('readonly', true);
							$(".<%=layerName%> #<%=layerName%>lvhsDd").attr('readonly', true);
							$(".<%=layerName%> #enterRsn").attr('readonly', true);
							$(".<%=layerName%> #lvhsRsnFg").attr('disabled', true);
							$(".<%=layerName%> #daytimeUseFacility").attr('disabled', true);
							$(".<%=layerName%> #enterPrprty").attr('disabled', true);
							$(".<%=layerName%> #lvhsPrprty").attr('disabled', true);
							$(".<%=layerName%> #enterPrprty").attr('disabled', true);
							$(".<%=layerName%> #encBeforeAddrDetail").attr('readonly', true);
							
							$(".<%=layerName%> #tyMlyWage").attr('readonly', true);
							$(".<%=layerName%> #lyMlyWage").attr('readonly', true);
							$(".<%=layerName%> #tyHlyWage").attr('readonly', true);
							$(".<%=layerName%> #lyHlyWage").attr('readonly', true);
							
							$(".<%=layerName%> #enextFee").attr('readonly', true);
							$(".<%=layerName%> #<%=layerName%>contractStartDd").attr('readonly', true);
							$(".<%=layerName%> #<%=layerName%>contractEndDd").attr('readonly', true);
							
							
							
							$(".<%=layerName%> #saveMode").val("");
							
							$(".<%=layerName%> #enextMgmtForm").find($(".<%=layerName%> .ui-datepicker-trigger")).css('display', 'none');
							$(".<%=layerName%> #enextMgmtForm").removeClass(".ui-datepicker-trigger");
							$(".<%=layerName%> #enextMgmtForm").addClass(".ui-datepicker-trigger");
						} else{
							$(".<%=layerName%> #<%=layerName%>entrncDd").attr('readonly', false);
							$(".<%=layerName%> #<%=layerName%>lvhsDd").attr('readonly', false);
							$(".<%=layerName%> #enterRsn").attr('readonly', false);
							$(".<%=layerName%> #lvhsRsnFg").attr('disabled', false);
							$(".<%=layerName%> #daytimeUseFacility").attr('disabled', false);
							$(".<%=layerName%> #enterPrprty").attr('disabled', false);
							$(".<%=layerName%> #lvhsPrprty").attr('disabled', false);
							$(".<%=layerName%> #enterPrprty").attr('disabled', false);
							$(".<%=layerName%> #encBeforeAddrDetail").attr('readonly', false);
							
							$(".<%=layerName%> #tyMlyWage").attr('readonly', false);
							$(".<%=layerName%> #lyMlyWage").attr('readonly', false);
							$(".<%=layerName%> #tyHlyWage").attr('readonly', false);
							$(".<%=layerName%> #lyHlyWage").attr('readonly', false);
							
							$(".<%=layerName%> #enextFee").attr('readonly', false);
							$(".<%=layerName%> #<%=layerName%>contractStartDd").attr('readonly', false);
							$(".<%=layerName%> #<%=layerName%>contractEndDd").attr('readonly', false);
							
							$(".<%=layerName%> #enextMgmtForm").find($(".<%=layerName%> .ui-datepicker-trigger")).css('display', 'inline-block');
						}
					},
					loadingTarget: "<%=layerName%>"
				}); 
				
			}
//그리드 사이즈변경
gridResize();
</script>