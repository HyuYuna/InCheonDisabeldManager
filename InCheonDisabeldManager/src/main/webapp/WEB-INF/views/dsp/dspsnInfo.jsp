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
                    <h1>이용장애인 조회</h1>
					<jsp:include page="../common/commonBtn.jsp">
						<jsp:param value="<%=layerName%>" name="layerName" />
					</jsp:include>                    
                </div>
                <!-- titleWrap : end -->
                
                <!-- titleWrap : end -->
				<form name="<%=layerName%>searchForm1" onsubmit="return false;" autocomplete='off'>
				<input type="hidden" id="<%=layerName%>groupType" name="groupType" value="${groupType}" />
					<table class="dataTable marginT10">
						<colgroup>
	                        <col style="width:140px">
	                        <col style="width:400px">
	                        <col style="width:140px">
	                        <col style="width:auto">
	                        <col style="width:140px">
	                        <col style="width:auto">
	                    </colgroup>
	                    <tbody>
	                    	<tr>
								<th>장애인명</th> 
								<td class="title">
									<input type="text" id="schDspsnNm" name="schDspsnNm" style="width: 100%;" title="장애인명" onkeypress="<%=layerName%>fn_pressSys(this.form);"> 
								</td>
								
								<th>장애유형</th>
								<td class="title">
									<select id="schDisableTp" name="schDisableTp" style="width: 100%; text-align-last : center;">
									<option value="">전체</option>
									<c:if test="${!empty disableTpList}">	
										<c:forEach var="list" items="${disableTpList}">
											<option value="${list.disableTp}">
												<c:out value="${list.disableTpNm}" /></option>
										</c:forEach>
									</c:if>
									</select>
								</td>
								<th>보장자격</th>
								<td class="title">
									<select id="schGuaranteeFg" name="schGuaranteeFg" style="width: 100%; text-align-last : center;">
									<option value="">전체</option>
									<c:if test="${!empty guaranteedList}">	
										<c:forEach var="list" items="${guaranteedList}">
											<option value="${list.guaranteedFg}">
												<c:out value="${list.guaranteedNm}" /></option>
										</c:forEach>
									</c:if>
									</select>
								</td>
							</tr>
						</tbody>
					</table>
				</form>
				
				<table class="layoutTable">
					<tbody>
						<tr>
							<td> 
	                            <div class="subtitleGroup">
	                                <div class="subtitle">장애인 리스트</div>
	                                <div class="subBtnGroup">
	                                </div>
	                            </div>
								<!-- <h2>장애인 리스트</h2> -->
								<div id="<%=layerName%>grid_wrap" style="height: 459px;"></div>
							</td>
						</tr>
						<tr>
							<td>
								<form id="detailForm">
								<input type="hidden" id="rowIndex"           name="rowIndex"          value=""/>
									<table class="layoutTable">
									    <colgroup>
									        <col width="48%" />
									        <col width="10px" />
									        <col width="*" />
									    </colgroup>
									    <tbody>
											<tr>
												<td>
						                            <div class="subtitleGroup">
						                                <div class="subtitle">보호자정보</div>
						                                <div class="subBtnGroup">
						                                </div>
						                            </div>
													<!-- <h2>보호자정보</h2> -->
													<table cellpadding="0" cellspacing="0" class="dataTable" id="align_common" border="1">
														<colgroup>
															<col width="25%" />
															<col width="75%" />
														</colgroup>
														<tr>
															<th>보호자명</th>
															<td>
																<input type="text" id="prtctorNm" name="prtctorNm" style="width:100%; text-align: left;"  title="시설코드" readonly> 
															</td>
														</tr>
														<tr>
															<th>보호자관계</th>
															<td>
																<input type="text" id="prtctorRelation" name="prtctorRelation" style="width:100%; text-align: left;"  title="시설코드" readonly> 
															</td>
														</tr>
														<tr>
															<th>보호자연락처</th>
															<td>
																<input type="text" id="encPrtctorPhoneNum" name="encPrtctorPhoneNum" style="width:100%; text-align: left;"  title="시설코드" readonly> 
															</td>
														</tr>
														<tr>
															<th>보호자직업</th>
															<td>
																<input type="text" id="prtctorJob" name="prtctorJob" style="width:100%; text-align: left;"  title="시설코드" readonly> 
															</td>
														</tr>
													</table>
												</td>
												<td></td>
												<td>
													<div class="subtitleGroup">
						                                <div class="subtitle">건강상태</div>
						                                <div class="subBtnGroup">
						                                </div>
						                            </div>
													<!-- <h2>건강상태</h2> -->
													<table cellpadding="0" cellspacing="0" class="dataTable" id="align_common" border="1">
														<colgroup>
															<col width="25%" />
															<col width="75%" />
														</colgroup>
														<tr>
															<th>청각문제</th>
															<td>
																<input type="text" id="healthSts01" name="healthSts01" style="width:100%; text-align: left;"  title="시설코드" readonly> 
															</td>
														</tr>
														<tr>
															<th>시각문제</th>
															<td>
																<input type="text" id="healthSts02" name="healthSts01" style="width:100%; text-align: left;"  title="시설코드" readonly> 
															</td>
														</tr>
														<tr>
															<th>언어문제</th>
															<td>
																<input type="text" id="healthSts03" name="healthSts03" style="width:100%; text-align: left;"  title="시설코드" readonly> 
															</td>
														</tr>
														<tr>
															<th>질환</th>
															<td>
																<input type="text" id="healthSts06" name="healthSts06" style="width:100%; text-align: left;"  title="시설코드" readonly> 
															</td>
														</tr>
													</table>
												</td>
											</tr>
										</tbody>
									</table>
								</form>							
							</td>	
						</tr>
					</tbody>
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
	
	.my-column-center {
		text-align: left;
	}
	
	.my-column-left {
		text-align: left;
	}
	
</style>
			
<script type="text/javascript">

	// 조회 클릭시
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .search').click(function(){
		<%=layerName%>loadData();
	});
	
	// 엑셀 다운로드
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .exel').click(function(){
		<%=layerName%>exportTo();
	});
	
	// 닫기
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .close').click(function(){
		mFnc.tabMenuClose('<%=layerName%>');
	});
	
	//AUIGrid 생성 후 반환 ID
	var <%=layerName%>myGridID;

	// AUIGrid 칼럼 설정
	var <%=layerName%>columnLayout = [ 
			{dataField : "dspsnId", headerText : "코드", width : "10%"},
			{dataField : "dspsnNm", headerText : "장애인명", width : "7%", style:"my-column-left"},
			{dataField : "genderNm", headerText : "성별", width : "7%"},
			{dataField : "disableTpNm", headerText : "장애유형", width : "7%"},
			{dataField : "disableDgreeFgNm", headerText : "장애정도", width : "10%", style:"my-column-left"},
			{dataField : "outbreakTimeFgNm", headerText : "장애발생시기", width : "7%"},
			{dataField : "outbreakRsnFgNm", headerText : "발생사유", width : "7%"},
			{dataField : "dspsnJob", headerText : "직업", width : "10%", style:"my-column-left"},
			{dataField : "academicDetail", headerText : "학력", width : "10%", style:"my-column-left"},
			{dataField : "addrBase", headerText : "주소", width : "25%", style:"my-column-left"},
	    ];
	
	//AUIGrid 서비스장애를 생성합니다.
	function <%=layerName%>createAUIGrid(columnLayout) {
		var <%=layerName%>auiGridProps = {
			softRemoveRowMode : false,
			rowHeight : 38,
			headerHeight : 38,
			noDataMessage : "조회된 내용이 없습니다."
		};
		// 실제로 #grid_wrap 에 그리드 생성
		<%=layerName%>myGridID = AUIGrid.create("#<%=layerName%>grid_wrap", <%=layerName%>columnLayout, <%=layerName%>auiGridProps);
		// 선택 체인지 이벤트 바인딩
		AUIGrid.bind(<%=layerName%>myGridID, "selectionChange", function(event) {
			var primeCell = event.primeCell; // 선택 대표 셀
			var item = primeCell.item; // 행 정보
			<%=layerName%>setFieldToFormWindow(primeCell, item);
			//$(".<%=layerName%> #rowIndex").val(primeCell.rowIndex);
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
	}
	
	//엔터키 조회시
	function <%=layerName%>fn_pressSys(e){ 
    	if(event.keyCode == 13){ //javascript에서는 13이 enter키를 의미함 
    		<%=layerName%>loadData ();
		}
	}
	
	//AUIGrid 서비스장애를 생성합니다.
	function <%=layerName%>loadData() {
		var sendData = {
				"schDspsnNm" : $("#schDspsnNm").val(),
				"schDisableTp" : $("#schDisableTp option:selected").val(),
				"schGuaranteeFg" : $("#schGuaranteeFg option:selected").val()
		};
		AUIGrid.showAjaxLoader(<%=layerName%>myGridID);
		GRIT.tran.send({
			url: "/dsp/dspsnInfoList",
			sendData: sendData,
			success: function(data){
				// 그리드에 데이터 세팅
				AUIGrid.setGridData(<%=layerName%>myGridID, data.dspsnInfoList);
				
				// 로더 제거
				AUIGrid.removeAjaxLoader(<%=layerName%>myGridID);
			},
			error: function(request, status, error){
				GRIT.msg.alert("장애인을 조회하는데 문제가 발생했습니다.");
				// 로더 제거
				AUIGrid.removeAjaxLoader(<%=layerName%>myGridID);
			},
			loading : false
			
		});
	}
	
	// 초기화
	   function <%=layerName%>fn_dspsnInfo(){
	      
	      // 보호자정보
	      $(".<%=layerName%> #prtctorNm").val("");
	      $(".<%=layerName%> #prtctorRelation").val("");
	      $(".<%=layerName%> #encPrtctorPhoneNum").val("");
	      $(".<%=layerName%> #prtctorJob").val("");
	      
	      // 건강상태
	      $(".<%=layerName%> #healthSts01").val("");
	      $(".<%=layerName%> #healthSts02").val("");
	      $(".<%=layerName%> #healthSts03").val("");
	      $(".<%=layerName%> #healthSts06").val("");
	   }
	
	function <%=layerName%>setFieldToFormWindow(primeCell, item) {
		
		// 보호자정보
		$(".<%=layerName%> #prtctorNm").val(item.prtctorNm);
		$(".<%=layerName%> #prtctorRelation").val(item.prtctorRelation);
		
		var encPrtctorPhoneNum = item.encPrtctorPhoneNum;
		if(typeof encPrtctorPhoneNum != "undefined"){
			$(".<%=layerName%> #encPrtctorPhoneNum").val(chk_tel(item.encPrtctorPhoneNum));	
		}else{
			$(".<%=layerName%> #encPrtctorPhoneNum").val("");
		}
		
		$(".<%=layerName%> #prtctorJob").val(item.prtctorJob);
		
		// 건강상태
		$(".<%=layerName%> #healthSts01").val(item.healthSts01);
		$(".<%=layerName%> #healthSts02").val(item.healthSts02);
		$(".<%=layerName%> #healthSts03").val(item.healthSts03);
		$(".<%=layerName%> #healthSts06").val(item.healthSts06);
		
	}
	
	function <%=layerName%>exportTo() {
		
		var excelList = AUIGrid.getGridData(<%=layerName%>myGridID);
		
		if(excelList.length == 0){
			GRIT.msg.alert("장애인 리스트에 조회된 내용이 없습니다.");
			return false;
		}
		AUIGrid.exportToXlsx(<%=layerName%>myGridID, {
			fileName : "장애인_조회",
			// 스타일 상태 유지 여부(기본값:true)
		});
	}
	
	// 페이지 로딩 되면 실행
	$(function () {
		// AUIGrid 서비스 장애그리드를 생성합니다.
		<%=layerName%>createAUIGrid(<%=layerName%>columnLayout);
		<%=layerName%>fn_dspsnInfo();
	});
</script>