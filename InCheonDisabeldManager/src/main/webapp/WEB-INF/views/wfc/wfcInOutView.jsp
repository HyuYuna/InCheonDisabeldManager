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
                    <h1>복지시설 이용 조회</h1>
					<jsp:include page="../common/commonBtn.jsp">
						<jsp:param value="<%=layerName%>" name="layerName" />
					</jsp:include>                    
                </div>
                <!-- titleWrap : end -->
                
				<form name="<%=layerName%>searchForm1" onsubmit="return false;" autocomplete='off'>
					<input type="hidden" id="userGroupCd" name="userGroupCd" value="${userGroupCd}"/>
					<table class="dataTable marginT10">
	                    <colgroup>
	                        <col style="width:12%">
	                        <col style="width:21%">
	                        <col style="width:12%">
	                        <col style="width:21%">
	                        <col style="width:12%">
	                        <col style="width:21%">
	                    </colgroup>
                    	<tbody>
                        	<tr>
								<th>복지시설</th> 
								<td class="title">
													 <c:if test="${userGroupCd == 'A' || userGroupCd == 'B' || userGroupCd == 'E'}">
														<input type="text" id="wffcltyCd" name="wffcltyCd" style="width:40%;" title="복지시설" oninput="<%=layerName%>fn_removeLinkNm();" onkeydown="<%=layerName%>fn_searchLinkCd(this.value)">
						            					<button type="button" class="iconSearchGlassBtn" onclick="<%=layerName%>fn_searchPop(); return false;">
						            						<img src="/resources/imagesV2/iconSearchGlass.png" class="iconSearchGlass">
						            					</button>
						        						<input type="text" id="wffcltyNm" name="wffcltyNm" style="width:50%; margin-left: 0px" title="복지시설명"  readonly /> 
													</c:if>
													<c:if test="${userGroupCd == 'C'}">	
														<select id="wffcltyCd" name="wffcltyCd" style="width: 100%; text-align-last : center;" tabindex="1" >
															<c:forEach var="list" items="${wffcltyCodeCList}">
																<option value="${list.wffcltyCd}">
																	<c:out value="${list.wffcltyNm}" /></option>
															</c:forEach>
														</select>
													</c:if>
													<c:if test="${userGroupCd == 'D'}">	
														<select id="wffcltyCd" name="wffcltyCd" style="width: 100%; text-align-last : center;" tabindex="1" >
															<c:forEach var="list" items="${groupCodeD}">
																<option value="${list.wffcltyCd}">
																	<c:out value="${list.wffcltyNm}" /></option>
															</c:forEach>
														</select>
													</c:if>
								</td>
								
								<th>장애인명</th>
								<td class="title">
									<input type="text" id="searchDspsnNm" name="searchDspsnNm" maxlength="40" style="width:100%" onkeypress="<%=layerName%>fn_pressSys(this.form);" onkeyup="checkByte(this, 40)" >
								</td>
								
								<th>입퇴소여부</th>
								<td class="title"> 
									<select id="searchlvhsRsnFg" name="searchlvhsRsnFg" style="width: 100%; text-align-last : center;" tabindex="1">
				                            	<option value = "">전체</option>
												<option value = "1">입소</option>
												<option value = "2">퇴소</option>
									</select>
								</td>
								</tr>
							</tbody>
						</table>
				</form>
				
					<div class="box-top">
						<h2>이용 리스트</h2>
					</div>

					<div class="box-wrap mb10">
						<div id="<%=layerName%>grid_wrap" style="height: 195px;"></div>
					</div>
			
						<table class="layoutTable">
						    <tr>
							    <td valign="top" style="width:*">
							    <h2>상세 정보</h2>
							        <form name="InOutViewForm" id="InOutViewForm" method="post" autocomplete='off'>
							        <input type="hidden" id="groupType" name="saveMode" value="${groupType}"/>
							        <input type="hidden" id="<%=layerName%>wffcltyTp" name="wffcltyTp" value=""/>
							        <input type="hidden" id="wffcltyCd" name="wffcltyCd" value=""/>
				                    <table cellpadding="0" cellspacing="0"  class="dataTable" id="align_common" border="1" >
				                        <colgroup>
				                            <col width="9%" />
				                            <col width="20%" />
				                            <col width="9%" />
				                            <col width="20%" />
				                            <col width="9%" />
				                            <col width="20%" />
				                        </colgroup>                                               
				                        <tr>
				                            <th>장애인코드</th>
				                            <td><input type="text" id="dspsnId" name="dspsnId" style="width:100%; text-align:left;" class="onlynum" title="장애인코드" tabindex="1" onfocus="this.blur();" readonly> </td>
				                            <th>장애인명</th>
				                            <td><input type="text" id="dspsnNm" name="dspsnNm" style="width:100%; text-align:left;" class="onlynum" title="장애인명" tabindex="1" readonly> </td>
				                            <th>보장자격</th>
				                            <td><input type="text" id="guaranteeFg" name="guaranteeFg" style="width:100%; text-align:left;" class="onlynum" title="보장자격" tabindex="1" readonly> </td>
										</tr>
										<tr>
				                            <th>장애유형</th>
				                            <td><input type="text" id="disableTp" name="disableTp" style="width:100%; text-align:left;" class="onlynum" title="장애유형" tabindex="1" readonly> </td>
				                            <th>장애정도</th>
				                            <td><input type="text" id="disableDgreeFg" name="disableDgreeFg" style="width:100%; text-align:left;" class="onlynum" title="장애정도" tabindex="1" readonly> </td>
				                            <th>발생시기</th>
				                            <td><input type="text" id="outbreakTimeFg" name="outbreakTimeFg" style="width:100%; text-align:left;" class="onlynum" title="발생시기" tabindex="1" readonly> </td>
				                        </tr>
				                        <tr>
					                        <th>이용시작일</th>
					                        <td><input type="text" id="entrncDd" name="entrncDd" style="width: 100%;" readonly> </td>
				                            <th class ="thlvhsDdNm">퇴소일자</th>
				                            <td class ="tdlvhsDdNm">
				                            <input type="text" id="lvhsDd" name="lvhsDd" style="width: 100%;" readonly>
				                            </td>
				                            <th>경과일수</th>
				                            <td colspan="3"><input type="text" id="sumEntrncDd" name="sumEntrncDd" style="width:39.1%; text-align:right;" class="onlynum" title="경과일수" tabindex="1" readonly> 일 </td>
				                        </tr>
				                        <tr>
				                        <th>이용사유</th>
				                            <td><input type="text" id="enterRsn" name="enterRsn" style="width:100%;text-align:left;" class="onlynum" title="입소사유" tabindex="1" readonly> </td>
				                         <th>종료사유</th>
										 <td colspan="3">
				                            <select id="lvhsRsnFg" name="lvhsRsnFg" style="width: 39.1%; text-align-last : center;" tabindex="1" disabled>
				                            	<option value = "">없음</option>
													<c:if test="${!empty rsnLvngList}">	
														<c:forEach var="list" items="${rsnLvngList}">
															<option value="${list.rsnLvngCode}">
																<c:out value="${list.rsnLvngNm}" /></option>
														</c:forEach>
													</c:if>
												</select>
				                            <input type="text" id="lvhsRsnEtcDetail" name="lvhsRsnEtcDetail" style="width:60.5%;text-align:left;" class="onlynum" title="퇴소사유 기타내역" tabindex="1" onkeyup="checkByte(this, 50)" onkeydown="<%=layerName%>EnterFilter('enterPrprty');" readonly> </td>  	
				                        </tr>
				                        <tr class = "<%=layerName%>abClass">
				                    		<th>낯동안 이용시설</th>
				                            <td colspan="6"><input type="text" id="daytimeUseFacility" name="daytimeUseFacility" style="width:24.4%;text-align:left;" class="onlynum" title="낯동안 이용시설" tabindex="1" onkeyup="checkByte(this, 100)" onkeydown="<%=layerName%>EnterFilter('enterPrprty');" readonly> </td>
				                    	</tr>
				                    	
				                    	<!--  시설코드의 A01 A02 A03 A04 -->
				                    	<tr class = "<%=layerName%>aClass">
				                    		<th>입소전 소유재산</th>
				                            <td><input type="text" id="enterPrprty" name="enterPrprty" style="width:100%;text-align:left;" title="입소전 소유재산" tabindex="1"readonly> </td>
				                            <th>퇴소시 소유재산</th>
				                            <td colspan="3"><input type="text" id="lvhsPrprty" name="lvhsPrprty" style="width:39.1%;text-align:left;" title="퇴소시 소유재산" tabindex="1" readonly> </td>
				                    	</tr>
				                    	<tr class = "<%=layerName%>aClass">
				                    		<th>입소전 기본주소</th>
				                            <td colspan="6"><input type="text" id="fullAddrView" name="fullAddrView" style="width:100%;text-align:left;" title="입소전 주소" readonly > </td>
				                    	</tr>
				                    	<!-- 시설코드의 A01 A02 A03 A04 -->
				                    	
				                    	
				                    	
				                    	<!--  시설코드의 B01 B02 B03 -->
				                    	<tr class = "<%=layerName%>bClass">
											<th>참여유형</th>
												<td  colspan="6"><input type="radio" id="partcptnTp1" name="partcptnTp" value="1" checked/> 근로장애인
													<input type="radio" id="partcptnTp2" name="partcptnTp" value="2" /> 훈련장애인
												</td>
										</tr>
										
										<tr class = "<%=layerName%>bClass">
											<th>당해년 월 임금</th>
												<td><input type="text" id="tyMlyWageView" name="tyMlyWageView" style="width:100%;text-align:right;" class="onlynum" title="당해년 월 임금" tabindex="1" maxlength="11" onkeyup="fn_comma(this)" onkeydown="<%=layerName%>EnterFilter('hlyWage');" readonly> </td> 
											<th>전년도 월 임금</th>
												<td colspan="3"><input type="text" id="lyMlyWageView" name="lyMlyWageView" style="width:39.1%;text-align:right;" class="onlynum" title="전년도 월 임금" tabindex="1" maxlength="11" onkeyup="fn_comma(this)" onkeydown="<%=layerName%>EnterFilter('hlyWage');" readonly> </td>
										</tr>
										
										<tr class = "<%=layerName%>bClass">
											<th>당해년 시급</th>
												<td><input type="text" id="tyHlyWageView" name="tyHlyWageView" style="width:100%;text-align:right;" class="onlynum" title="당해년 시급" tabindex="1" maxlength="11" onkeyup="fn_comma(this)" readonly> </td>
											<th>전년도 시급</th>
												<td colspan="3"><input type="text" id="lyHlyWageView" name="lyHlyWageView" style="width:39.1%;text-align:right;" class="onlynum" title="전년도 시급" tabindex="1" maxlength="11" onkeyup="fn_comma(this)" readonly> </td>
										</tr>
										
				                    	<!--  시설코드의  C02-->
				                    	<tr class = "<%=layerName%>cClass">
				                    		<th>이용료</th>
				                            <td>
				                            <input type="text" id="enextFeeView" name="enextFeeView" style="width:100%;text-align:right;" class="onlynum" title="이용료" tabindex="1" maxlength="11" onkeyup="fn_comma(this)" readonly> 
				                            </td>
				                            <th>이용 계약서 기간</th>
				                            <td  colspan="3">
				                            <input type="text" id="contractStartDd" name="contractStartDd" style="width: 18.8%;" readonly >
				                            ~
				                            <input type="text" id="contractEndDd" name="contractEndDd" style="width: 18.8%;" readonly>
				                            </td>
				                    	</tr>
				                    	
				                    	<!--  시설코드의 C02 -->
				                    </table>
				                    </form>
							    </td>
						    </tr> 
						</table>
				    

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
	input[readonly]
{
    background-color:#ccc;
}
</style>

<script type="text/javascript" >
	// 조회 클릭시
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .search').click(function(){
		<%=layerName%>loadData();
		<%=layerName%>fn_newInOutView();
	});
	
	// 신규
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .new').click(function(){
		<%=layerName%>fn_newAll();
	});
	
	// 저장
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .save').click(function(){
		<%=layerName%>fn_saveSysInfo();
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
	
	// AUIGrid 칼럼 설정
	var <%=layerName%>columnLayout  = [ 
        {dataField : "dspsnId"      ,headerText : "장애인코드"   ,width : "10%", style : "my-column-center"}
       ,{dataField : "dspsnNm" ,headerText : "장애인명"       ,width : "10%", style : "my-column-left"}
       ,{dataField : "wffcltyNm"      ,headerText : "복지시설"    ,width : "15%", style : "my-column-left"}
       ,{dataField : "entrncDd"      ,headerText : "이용시작일"    ,width : "8%", dataType : "date", formatString : "yyyy-mm-dd", style : "my-column-center" } 
       ,{dataField : "enterRsn"      ,headerText : "이용사유"    ,width : "24%", style : "my-column-left"} 
       ,{dataField : "lvhsDd"      ,headerText : "이용종료일"    ,width : "8%",dataType : "date", formatString : "yyyy-mm-dd", style : "my-column-center"} 
       ,{dataField : "lvhsRsnNm"      ,headerText : "종료사유"    ,width : "25%", style : "my-column-left"}
       ];
	
	$(function () {
		// AUIGrid 그리드를 생성합니다.
		<%=layerName%>createAUIGrid(<%=layerName%>columnLayout);
		
		// 데이터 요청, 요청 성공 시 AUIGrid 에 데이터 삽입합니다.
		$(".<%=layerName%> #sehUserNm").focus();
		$(".<%=layerName%> #lvhsRsnEtcDetail").hide();
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
		$(".<%=layerName%> #<%=layerName%>wffcltyTp").val(item.wffcltyTp);
		<%=layerName%>wffcltyTp();
		$(".<%=layerName%> #dspsnId").val(item.dspsnId);
		$(".<%=layerName%> #dspsnNm").val(item.dspsnNm);
		$(".<%=layerName%> #guaranteeFg").val(item.guaranteeFg);
		$(".<%=layerName%> #disableTp").val(item.disableTp);
		$(".<%=layerName%> #disableDgreeFg").val(item.disableDgreeFg);
		$(".<%=layerName%> #outbreakTimeFg").val(item.outbreakTimeFg);
		$(".<%=layerName%> #entrncDd").val(item.entrncDd);
		$(".<%=layerName%> #sumEntrncDd").val(item.sumEntrncDd);
		$(".<%=layerName%> #enterRsn").val(item.enterRsn);
		$(".<%=layerName%> #lvhsDd").val(item.lvhsDd);
		$(".<%=layerName%> #lvhsRsnFg").val(item.lvhsRsnFg);
		$(".<%=layerName%> #lvhsRsnEtcDetail").val(item.lvhsRsnEtcDetail);
		$(".<%=layerName%> #daytimeUseFacility").val(item.daytimeUseFacility);
		$(".<%=layerName%> #enterPrprty").val(item.enterPrprty);
		$(".<%=layerName%> #lvhsPrprty").val(item.lvhsPrprty);
		$(".<%=layerName%> #fullAddrView").val(item.fullAddr);
		$(".<%=layerName%> #lyMlyWageView").val(item.lyMlyWage);
		$(".<%=layerName%> #lyHlyWageView").val(item.lyHlyWage);
		$(".<%=layerName%> #tyMlyWageView").val(item.tyMlyWage);
		$(".<%=layerName%> #tyHlyWageView").val(item.tyHlyWage);
		$(".<%=layerName%> #enextFeeView").val(item.fee);
		$(".<%=layerName%> #partcptnTp").val(item.partcptnTp);
		if(item.partcptnTp == 1){
			$(".<%=layerName%> #partcptnTp1").prop('checked', true);
		}
		if(item.partcptnTp == 2){
			$(".<%=layerName%> #partcptnTp2").prop('checked', true);
		}
		$(".<%=layerName%> #contractStartDd").val(item.contractStartDd);
		$(".<%=layerName%> #contractEndDd").val(item.contractEndDd);
		
		
		
		$(".<%=layerName%> #userGroupCd").attr('readonly', true); 
		$(".<%=layerName%> #encPassword").attr('readonly', true); 
	}
	
	//엔터키 조회시
	function <%=layerName%>fn_pressSys(e){ 
    	if(event.keyCode == 13){ //javascript에서는 13이 enter키를 의미함 
    		<%=layerName%>loadData ();
		}
	}
	
	//조회
	function <%=layerName%>loadData () {			
		
		var searchDspsnNm      = $(".<%=layerName%> #searchDspsnNm").val();
		var sDate = $(".<%=layerName%> #sDate").val();	
		var eDate = $(".<%=layerName%> #eDate").val();	
		var searchlvhsRsnFg = $(".<%=layerName%> #searchlvhsRsnFg").val();
		var searchlwffcltyFg = $(".<%=layerName%> #wffcltyCd").val();
		var sendData = {"searchDspsnNm"      : searchDspsnNm
				       ,"searchlvhsRsnFg" : searchlvhsRsnFg
				       ,"searchlwffcltyFg" : searchlwffcltyFg};
		
		// ajax 요청 전 그리드에 로더 표시
		AUIGrid.showAjaxLoader(<%=layerName%>myGridID);
		
		GRIT.tran.send({
			url: "/wfc/WfcInOutViewGrid1",
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
	
	function <%=layerName%>fn_newInOutView() {
		$(".<%=layerName%> #dspsnId").val("");
		$(".<%=layerName%> #dspsnNm").val("");
		$(".<%=layerName%> #guaranteeFg").val("");
		$(".<%=layerName%> #disableTp").val("");
		$(".<%=layerName%> #disableDgreeFg").val("");
		$(".<%=layerName%> #outbreakTimeFg").val("");
		$(".<%=layerName%> #entrncDd").val("");
		$(".<%=layerName%> #sumEntrncDd").val("");
		$(".<%=layerName%> #enterRsn").val("");
		$(".<%=layerName%> #lvhsRsnFg").val("");
		$(".<%=layerName%> #daytimeUseFacility").val("");
		$(".<%=layerName%> #enterPrprty").val("");
		$(".<%=layerName%> #lvhsPrprty").val("");
		$(".<%=layerName%> #fullAddrView").val("");
		$(".<%=layerName%> #enextFeeView").val("");
		$(".<%=layerName%> #contractStartDd").val("");
		$(".<%=layerName%> #contractEndDd").val("");
		$(".<%=layerName%> #partcptnTp1").prop('checked', true);
		$(".<%=layerName%> #tyMlyWageView").val("");
		$(".<%=layerName%> #lyMlyWageView").val("");
		$(".<%=layerName%> #tyHlyWageView").val("");
		$(".<%=layerName%> #lyHlyWageView").val("");
	}
	
	
	function <%=layerName%>wffcltyTp(){
	var wffcltyTp = $(".<%=layerName%> #<%=layerName%>wffcltyTp").val();
	var aClass = $(".<%=layerName%> .<%=layerName%>aClass");
	var bClass = $(".<%=layerName%> .<%=layerName%>bClass");
	var abClass = $(".<%=layerName%> .<%=layerName%>abClass");
	var cClass = $(".<%=layerName%> .<%=layerName%>cClass");
	
	
	if(wffcltyTp == 'A01'||wffcltyTp == 'A02'||wffcltyTp == 'A03'||wffcltyTp =='A04' ){
		aClass.show();
		bClass.hide();
		abClass.show();
		cClass.hide();
	} else if(wffcltyTp == 'C01'||wffcltyTp == 'C02'||wffcltyTp == 'C03' ){
		aClass.hide();
		bClass.show();
		abClass.show();
		cClass.hide();
	} else if(wffcltyTp == 'B02'){
		aClass.hide();
		bClass.hide();
		abClass.hide();
		cClass.show();
	} else{
		aClass.hide();
		bClass.hide();
		abClass.hide();
		cClass.hide();
	}
}
	
	//복지시설 팝업
	function <%=layerName%>fn_searchPop(name){
			var layerName = "<%=layerName%>"; 
			 var url = "<c:url value='/pop/searchWffcltyPop?layerName="+layerName+"'/>";
			 var width="700";
			 var height="610";
			 var name="searchWffclty";
			 popitup(url, height, width, name);
	}
	
	//복지시설 callback
	function <%=layerName%>setSearchWffcltyPop(item,  name){
		$(".<%=layerName%> #wffcltyCd").val(item.wffcltyCd);
		$(".<%=layerName%> #wffcltyNm").val(item.wffcltyNm);			
	}
	
	// 운영단체 이름 제거
	function <%=layerName%>fn_removeLinkNm(){
			$(".<%=layerName%> #wffcltyNm").val("");
		 }
	
	//복지시설
	function <%=layerName%>fn_searchLinkCd(value){

		   if(event.keyCode != 13 && event.keyCode != 9){
		   	   return false;
		   } 	
		   
		   if($(".<%=layerName%> #wffcltyCd").val().length == "4" && $(".<%=layerName%> #wffcltyNm").val() != ""){
			   <%=layerName%>loadData();
			   return;
		   }
		   
			var linkCd      = $(".<%=layerName%> #wffcltyCd").val();

			var sendData ={"linkCd"      : linkCd};
		   
	        GRIT.tran.send({
				url: "/bas/WffcltyList",
				async: false,
				sendData: sendData,
				success: function(result){
					if(result.data.length > 1){
						if($(".<%=layerName%> #wffcltyCd").val() != '' || $(".<%=layerName%> #wffcltyCd").val().length != 4){
	        				<%=layerName%>fn_searchPop();        	
	        			}
					}else if(result.data.length == 1){
						$(".<%=layerName%> #wffcltyCd").val(result.data[0].linkcd);
						$(".<%=layerName%> #wffcltyNm").val(result.data[0].linknm);
					}else{
						setTimeout(function(){					
							GRIT.msg.alert("해당 복지시설이 존재하지 않습니다");
							},50);
						$(".<%=layerName%> #wffcltyCd").focus();
						$(".<%=layerName%> #wffcltyCd").val("");
					}
					
				},
				loadingTarget: "<%=layerName%>"
			});
		}
	
	function <%=layerName%>exportTo() {
		
		var excelList = AUIGrid.getGridData(<%=layerName%>myGridID);
		
		if(excelList.length == 0){
			GRIT.msg.alert("이용자 리스트에 조회된 내용이 없습니다.");
			return false;
		}
		AUIGrid.exportToXlsx(<%=layerName%>myGridID, {
			fileName : "시설_이용조회",
			// 스타일 상태 유지 여부(기본값:true)
		});
	}
</script>

