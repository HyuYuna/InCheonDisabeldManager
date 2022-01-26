<%@ page import="kr.co.grit.common.util.SessionUtil"%>
<%@ page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%
	String layerName = request.getParameter("layerName");
%>

                <!-- titleWrap : start -->
                <div class="titleWrap">
                    <h1>복지시설 조회</h1>
					<jsp:include page="../common/commonBtn.jsp">
						<jsp:param value="<%=layerName%>" name="layerName" />
					</jsp:include>                    
                </div>
                <!-- titleWrap : end -->

                <!-- conditionTable : start -->
                <form name="<%=layerName%>searchForm1" onsubmit="return false;" autocomplete='off'>
                <input type="hidden" id="ognztPopValue"  name="ognztPopValue" value=""/>
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
                            <th>운영단체</th>
                            <td>
								<input type="text" id="searchOgnztCd" name="searchOgnztCd" style="width:20%;" title="운영단체" 
								oninput="<%=layerName%>fn_removeSearchOgnztNm();" 
								onkeydown="<%=layerName%>fn_searchOgnztCd2(this.value)">
				            	<button type="button" class="iconSearchGlassBtn" onclick="<%=layerName%>fn_searchPop(); return false;" ><img src="/resources/imagesV2/iconSearchGlass.png" class="iconSearchGlass"></button>
				        		<input type="text" id="searchOgnztNm" name="searchOgnztNm" style="width:65%; margin-left: 0px" title="복지시설명"  disabled>
                            </td>
                            <th>시설명</th>
                            <td>
                                <input type="text" id="schWffcltyNm" name="schWffcltyNm" style="width:100%" onkeypress="<%=layerName%>fn_pressSys(this.form);">
                            </td>
                            <th>시설장</th>
                            <td>
                                <input type="text" id="schIntendantNm" name="schIntendantNm" style="width:100%" onkeypress="<%=layerName%>fn_pressSys(this.form);"> 
                            </td>
                        </tr>
                        <tr>
                            <th>시군구</th>
                            <td>
                            	<select id="schGucd" name="schGucd" style="width: 100%; text-align-last : center" >
									<option value="">전체</option>
									<c:if test="${!empty sigunguList}">	
										<c:forEach var="list" items="${sigunguList}">
											<option value="${list.sigunguCd}">
												<c:out value="${list.sigunguNm}" /></option>
										</c:forEach>
									</c:if>
								</select>
                            </td>
                            <th>시설분류</th>
                            <td>
                            	<select id="schWffcltyClas" name="schWffcltyClas" style="width: 100%; text-align-last : center">
                            		<option value="">전체</option>
									<c:if test="${!empty wffcltyList}">	
										<c:forEach var="list" items="${wffcltyList}">
											<option value="${list.wffcltyClas}">
												<c:out value="${list.wffcltyNm}" /></option>
										</c:forEach>
									</c:if>
								</select>
                            </td>
                            <th>시설유형</th>
                            <td>
								<select id="schWffcltyTp" name="schWffcltyTp" style="width:100%; text-align-last:center">
									<option value="">전체</option>
								</select>
                            </td>
                        </tr>
                        <tr>
                            <th>보조금</th>
                            <td>
								<input type="checkbox" id="schGovsubyFg" name="schGovsubyFg" value="1" checked />국비
								<input type="checkbox" id="schCitsubyFg" name="schCitsubyFg" value="1" checked />시비
								<input type="checkbox" id="schGusubyFg" name="schGusubyFg" value="1" checked />군구비
                            </td>
                            <th>자체수입제원</th>
                            <td>
                            	<select id="schRevenueSourceTp" name="schRevenueSourceTp" style="width: 100%; text-align-last : center" tabindex="1">
									<option value="">전체</option>
									<c:if test="${!empty revenueList}">	
										<c:forEach var="list" items="${revenueList}">
											<option value="${list.revenueSourceTp}">
												<c:out value="${list.revenueSourceTpNm}" /></option>
										</c:forEach>
									</c:if>
								</select>
                            </td>
                            <th>시설소유형태</th>
                            <td>
	                            	<select id="schOwnershipTp" name="schOwnershipTp" style="width: 100%; text-align-last : center" >
										<option value="">전체</option>
										<c:if test="${!empty ownershipList}">	
											<c:forEach var="list" items="${ownershipList}">
												<option value="${list.ownershipTp}">
													<c:out value="${list.ownershipTpNm}" /></option>
											</c:forEach>
										</c:if>
									</select>
                            </td>
                        </tr>
                    </tbody>
                </table>
                </form>
                <!-- conditionTable : end -->

                <!-- layout table : start -->
                <table class="layoutTable">
                    <colgroup>
                        <col style="width:450px;">
                        <col style="width:10px;">
                        <col style="width:auto;">
                    </colgroup>
                    <tr>
                        <td>
                            <div class="subtitleGroup">
                                <div class="subtitle">시설리스트</div>
                                <div class="subBtnGroup">
                                </div>
                            </div>
                            <!-- <h2>시설리스트</h2> -->
                            <div id="<%=layerName%>grid_wrap" style="width: 550px;"></div>
                            
                            <div class="subtitleGroup serviceDis" style="display:none">
                                <div class="subtitle">서비스장애</div>
                                <div class="subBtnGroup">
                                </div>
                            </div>
                            <!-- <h2>시설리스트</h2> -->
                            <div id="<%=layerName%>grid_wrap01" class="serviceDis" style="height: 150px; width: 550px; display:none"></div>
                        </td>
                        <td>&nbsp;</td>
                        <td>
                            <div class="subtitleGroup">
                                <div class="subtitle">시설기초정보</div>
                                <div class="subBtnGroup">
                                </div>
                            </div>
                            <!-- <h2>시설기초정보</h2> -->
                            
							<form name="detailForm" id="detailForm" method="post" autocomplete="off">
								<table cellpadding="0" cellspacing="0" class="dataTable" id="align_common">
									<colgroup>
										<col width="15%" />
										<col width="35%" />
										<col width="15%" />
										<col width="35%" />
									</colgroup>
									<tr>
										<th>시설코드</th>
										<td>
											<input type="text" id="wffcltyCd" name="wffcltyCd" style="width:100%; text-align: left;"  title="시설코드" readonly> 
										</td>
										<th>시설명</th>
										<td>
											<input type="text" id="wffcltyNm" name="wffcltyNm" style="width:100%; text-align: left;"  title="시설명" readonly> 
										</td>	
									</tr>
									<tr>
										<th>시설유형</th>
										<td>
											<input type="text" id="wffcltyTpNm" name="wffcltyTpNm" style="width:100%; text-align: left;"  title="시설유형" readonly> 
										</td>
										<th>운영단체</th>
										<td>
											<input type="text" id="ognztNm" name="ognztNm" style="width:100%; text-align: left;"  title="운영단체" readonly> 
										</td>	
									</tr>
									<tr>
										<th>고유번호</th>
										<td style="border-right:none;">
											<input type="text" id="uniqueNo" name="uniqueNo" style="width:100%; text-align: left;"  title="고유번호" readonly> 
										</td> 
										<td colspan="2"  style="border-left:none;">
									</tr>
									<tr>
										<th>운영여부</th>
										<td>
											<input type="text" id="operateFgNm" name="operateFgNm" style="width:100%; text-align: left;"  title="운영여부" readonly> 
										</td>
										<th>사용여부</th>
										<td>
											<input type="text" id="useFgNm" name="useFgNm" style="width:100%; text-align: left;"  title="사용여부" readonly> 
										</td>	
									</tr>
									<tr>
										<th>우편번호</th>
										<td style="border-right:none;">
											<input type="text" id="zipCd" name="zipCd" style="width:100%; text-align: left;"  title="우편번호" readonly> 
										</td>	
										<td colspan="2"  style="border-left:none;">
									</tr>
									<tr>
										<th>주소</th>
										<td colspan="3">
											<input type="text" id="addr" name="addr" style="width:100%; text-align: left;"  title="주소" readonly> 
										</td>	
									</tr>
									<tr>
										<th>연락처</th>
										<td>
											<input type="text" id="phoneNum" name="phoneNum" style="width:100%; text-align: left;"  title="연락처" readonly> 
										</td>
										<th>백스번호</th>
										<td>
											<input type="text" id="faxNum" name="faxNum" style="width:100%; text-align: left;"  title="팩스번호" readonly> 
										</td>	
									</tr>
									<tr>
										<th>시설장</th>
										<td>
											<input type="text" id="intendantNm" name="intendantNm" style="width:100%; text-align: left;"  title="시설장" readonly> 
										</td>
										<th>설립일자</th>
										<td>
											<input type="text" id="establishDd" name="establishDd" style="width:100%; text-align: left;"  title="설립일자" readonly> 
										</td>	
									</tr>
									<tr>
										<th>종사자</th>
										<td colspan="3">
											<input type="text" id="workerCnt" name="workerCnt" style="width:10%; text-align: left;"  title="종사자" readonly>
											명
											<input type="text" id="workerDetail" name="workerDetail" style="width:81.7%; text-align: left;"  title="종사기타" readonly> 
										</td>	
									</tr>
									<tr>
										<th>웹사이트</th>
										<td>
											<input type="text" id="homepageUrl" name="homepageUrl" style="width:100%; text-align: left;"  title="웹사이트" readonly> 
										</td>
										<th>보조금</th>
										<td>
											<input type="checkbox" id="govsubyFg" name="govsubyFg" title="국비" disabled>
											국비
											<input type="checkbox" id="citsubyFg" name="citsubyFg" title="시비" disabled>
											시비
											<input type="checkbox" id="gusubyFg" name="gusubyFg" title="군구비" disabled>
											군구비 
										</td>	
									</tr>
								</table>
						    </form>                            
                            
                        </td>
                    </tr>
                </table>
                <!-- layout table : end -->


<!-- ------------------------------------------------------------------------------------------------------------------------------ -->

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

	//서비스장애 보여줄 서비스유형 
	$grid01Arr = ["A01","A02","A03","A04","B01","B02","B03","B05","B07","B08","C01","C02","C03","D03","D04"];
	
	// 조회 클릭시
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .search').click(function(){
		<%=layerName%>loadData();
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

	// 운영단체 이름 제거
	function <%=layerName%>fn_removeSearchOgnztNm(){
			$(".<%=layerName%> #searchOgnztNm").val("");
	}

	//검색 운영단체
	function <%=layerName%>fn_searchOgnztCd2(value){

		if(event.keyCode != 13 && event.keyCode != 9){
			return false;
		}
		   
		if($(".<%=layerName%> #searchOgnztCd").val().length == '4' && $(".<%=layerName%> #searchOgnztNm").val() != ""){
			<%=layerName%>loadData();
			return;
		}
		   
		var ognztCd      = 	$(".<%=layerName%> #searchOgnztCd").val();
		var sendData ={"ognztCd"      : ognztCd};

        GRIT.tran.send({
			url: "/bas/ognztCdList",
			async: false,
			sendData: sendData,
			success: function(result){
				if(result.data.length > 1){
					if($(".<%=layerName%> #searchOgnztCd").val() != '' || $(".<%=layerName%> #searchOgnztCd").val().length != 4){
        				<%=layerName%>fn_searchPop();        	
        			}
				}else if(result.data.length == 1){
					$(".<%=layerName%> #searchOgnztCd").val(result.data[0].linkcd);
					$(".<%=layerName%> #searchOgnztNm").val(result.data[0].linknm);
				}else{
					GRIT.msg.alert("조회된 데이터가 없습니다");
					$(".<%=layerName%> #searchOgnztCd").focus();
					$(".<%=layerName%> #searchOgnztNm").val("");
				}
				
			},
			loadingTarget: "<%=layerName%>"
		}); 
	}
	
	//검색조건 운영단체 팝업
	function <%=layerName%>fn_searchPop(name){
		$(".<%=layerName%> #ognztPopValue").val("1");
		var layerName = "<%=layerName%>"; 
		 var url = "<c:url value='/pop/searchOgnztPop?layerName="+layerName+"'/>";
		 var width="700";
		 var height="610";
		 var name="schOgnzt";
		 popitup(url, height, width, name);
	}
	
	//운영단체 callback
	function <%=layerName%>setSearchOgmztPop2(item,  name){
		$(".<%=layerName%> #searchOgnztCd").val(item.ognztCd);
		$(".<%=layerName%> #searchOgnztNm").val(item.ognztNm);
	}
	
	//AUIGrid 생성 후 반환 ID
	var <%=layerName%>myGridID;
	//AUIGrid 생성 후 반환 ID 서비스 장애
	var <%=layerName%>myGridID01;
    
	// AUIGrid 칼럼 설정
	var <%=layerName%>columnLayout = [ 
		 {dataField : "wffcltyCd", headerText : "시설코드", width : "30%"}
	    ,{dataField : "wffcltyNm", headerText : "시설명", width : "70%", style:"my-column-left"}
	    ];
	// AUIGrid 칼럼 설정 서비스 장애
	var <%=layerName%>columnLayout01 = [ 
		 {dataField : "disTitle", headerText : "장애유형", width : "30%", style:"my-column-left"}
	    ,{dataField : "disDetail", headerText : "상세", width : "70%", style:"my-column-left"}
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
			<%=layerName%>setGrdToFrm(item);
			$(".<%=layerName%> #rowIndex").val(primeCell.rowIndex);
			<%=layerName%>loadData01(primeCell, item);
		});
		
		// 그리드 ready 이벤트 바인딩
		AUIGrid.bind(<%=layerName%>myGridID, "ready", <%=layerName%>auiGridCompleteHandler);
	}
	
	//AUIGrid 서비스장애를 생성합니다. 서비스장애
	function <%=layerName%>createAUIGrid01(columnLayout) {
		var <%=layerName%>auiGridProps = {
			blankToNullOnEditing : true,
			softRemoveRowMode : false,
			wordWrap : false,
			rowHeight : 38,
			headerHeight : 38,
			noDataMessage : "조회된 내용이 없습니다."
		};
		// 실제로 #grid_wrap 에 그리드 생성
		<%=layerName%>myGridID01 = AUIGrid.create("#<%=layerName%>grid_wrap01", <%=layerName%>columnLayout01, <%=layerName%>auiGridProps);
		
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
	
	//AUIGrid 서비스장애를 생성합니다.
	function <%=layerName%>loadData() {
		var sendData = {
				"schOgnztCd" : $("#searchOgnztCd").val(),
				"schWffcltyNm" : $("#schWffcltyNm").val(),
				"schIntendantNm" : $("#schIntendantNm").val(),
				"schGucd" : $("#schGucd option:selected").val(),
				"schWffcltyClas" : $("#schWffcltyClas option:selected").val(),
				"schWffcltyTp" : $("#schWffcltyTp option:selected").val(),
				"schGovsubyFg" : $("input[name='schGovsubyFg']:checked").val(),
				"schCitsubyFg" : $("input[name='schCitsubyFg']:checked").val(),
				"schGusubyFg" : $("input[name='schGusubyFg']:checked").val(),
				"schRevenueSourceTp" : $("#schRevenueSourceTp option:selected").val(),
				"schOwnershipTp" : $("#schOwnershipTp option:selected").val()
		};
		AUIGrid.showAjaxLoader(<%=layerName%>myGridID);
		GRIT.tran.send({
			url: "/wfc/wfcInfoList",
			sendData: sendData,
			success: function(data){
				// 그리드에 데이터 세팅
				AUIGrid.setGridData(<%=layerName%>myGridID, data.wfcInfoList);
				// 선택 체인지 이벤트 바인딩
				AUIGrid.bind(<%=layerName%>myGridID, "ready", <%=layerName%>auiGridCompleteHandler);
				// 폼에 셋팅
				if(data.wfcInfoList[0]) {
					<%=layerName%>setGrdToFrm(data.wfcInfoList[0]);
					<%=layerName%>loadData01('',data.wfcInfoList[0]);
				} else { //데이터가 없는 경우
					$("#detailForm")[0].reset();
					AUIGrid.destroy("#<%=layerName%>grid_wrap01");
					var myGridID01 = "<%=layerName%>myGridID01";
					myGridID01 = null;
					$(".<%=layerName%> .serviceDis").hide();
				}
				// 로더 제거
				AUIGrid.removeAjaxLoader(<%=layerName%>myGridID);
			},
			error: function(request, status, error){
				GRIT.msg.alert("복지시설을 조회하는데 문제가 발생했습니다.");
				// 로더 제거
				AUIGrid.removeAjaxLoader(<%=layerName%>myGridID);
			},
			loading : false
			
		});
	}
	
	//AUIGrid 서비스장애를 생성합니다. 서비스장애
	function <%=layerName%>loadData01(primeCell, item) {
		//console.log("aa");
		AUIGrid.destroy("#<%=layerName%>grid_wrap01");
		var myGridID01 = "<%=layerName%>myGridID01";
		myGridID01 = null;
		
		if($.inArray(item.wffcltyTp, $grid01Arr)>-1) {
			AUIGrid.resize(<%=layerName%>myGridID, 550, 387);
			$(".<%=layerName%> .serviceDis").show();
			<%=layerName%>createAUIGrid01(<%=layerName%>columnLayout01);
		} else {
			AUIGrid.resize(<%=layerName%>myGridID, 550, 582);
			$(".<%=layerName%> .serviceDis").hide();
		}
		
		var sendData = {
				"wffcltyCd" : item.wffcltyCd
		};
		AUIGrid.showAjaxLoader(<%=layerName%>myGridID01);
		GRIT.tran.send({
			url: "/wfc/wfcInfoListDis",
			sendData: sendData,
			success: function(data){
				// 그리드에 데이터 세팅
				AUIGrid.setGridData(<%=layerName%>myGridID01, data.wfcInfoListDis);
				// 로더 제거
				AUIGrid.removeAjaxLoader(<%=layerName%>myGridID01);
			},
			error: function(request, status, error){
				GRIT.msg.alert("서비스장애 조회중 문제가 발생했습니다.");
				// 로더 제거
				AUIGrid.removeAjaxLoader(<%=layerName%>myGridID01);
			},
			loading : false
			
		});
	}
	
	function <%=layerName%>setGrdToFrm(data) {
		$("#detailForm")[0].reset();
		$("#govsubyFg, #citsubyFg, #gusubyFg").prop("checked",false);
		//시설장
		$viewArr0101 = ["B01"]; //관장
		$viewArr0102 = ["A01","A02","A03","A04","B02","C01","C02","C03"]; //시설장
		$viewArr0103 = ["B03","B05","B07","B08","D03","D04","D05","D06"]; //센터장
		$viewArr0104 = ["B04"]; //도서관장
		//본부/센터
		$viewArr02 = ["B03","D05"];
		//하단부전체
		$viewArr0301 = ["A01","A02","A03","A04"];
		$viewArr0302 = ["B01"];
		$viewArr0303 = ["B02"];
		$viewArr0304 = ["B03"];
		$viewArr0305 = ["B04"];
		$viewArr0306 = ["B05"];
		$viewArr0307 = ["B07","B08","D03"];
		$viewArr0308 = ["D04"];
		$viewArr0309 = ["D05","D06"];
		$viewArr0310 = ["C01","C02","C03"];
		//서비스장애 그리드
		
		$.each(data, function(key, value){ 
			//화면처리 start
			if(key=="wffcltyTp") {
				console.log(key+" : "+value);
				//시설장
				if($.inArray(value,$viewArr0101)>-1) {
					$("#intendantNm").closest("tr").find("th").eq(0).html('관장');
				} else if($.inArray(value,$viewArr0102)>-1) {
					$("#intendantNm").closest("tr").find("th").eq(0).html('시설장');
				} else if($.inArray(value,$viewArr0103)>-1) {
					$("#intendantNm").closest("tr").find("th").eq(0).html('센터장');
				} else if($.inArray(value,$viewArr0104)>-1) {
					$("#intendantNm").closest("tr").find("th").eq(0).html('도서관장');
				} else {
					$("#intendantNm").closest("tr").find("th").eq(0).html('시설장');
				}
				//본부/센터
				if($.inArray(value,$viewArr02)>-1) { //B03","B10
					//alert($("#uniqueNo").closest("tr").find("td").eq(0).html());
					$("#uniqueNo").closest("tr").find("td").eq(0).attr("colSpan",1);
					//$("#uniqueNo").closest("tr").find("td").eq(0).attr("border-right","none");
					$("#uniqueNo").css("width","100%");
					$("#uniqueNo").closest("tr").find("td").eq(0).css("border-right","")
					$("#uniqueNo").closest("tr").find("th").eq(1).remove();
					$("#uniqueNo").closest("tr").find("td").eq(1).remove();
					//th갯수가 1일 경우만 처리할것
					if($("#uniqueNo").closest("tr").find("th").length==1) {
						$("#uniqueNo").closest("tr").append('<th>본부/센터</th><td><input type="text" id="highWffcltyCdNm" name="highWffcltyCdNm" style="width:100%; text-align: left;"  title="고유번호" readonly></td>');
					}
				} else {
					$("#uniqueNo").closest("tr").find("td").eq(0).attr("colSpan",1);
					$("#uniqueNo").css("width","100%");
					$("#uniqueNo").closest("tr").find("td").eq(0).css("border-right","none")
					$("#uniqueNo").closest("tr").find("th").eq(1).remove();
					$("#uniqueNo").closest("tr").find("td").eq(1).remove();
					$("#uniqueNo").closest("tr").append("<td colSpan='2' style='border-left:none !important'/> ");
					
				}
				//하단부
				if($.inArray(value,$viewArr0301)>-1) { //A01","A02","A03","A04 장애인거주시설 (A01),공동생활가정 (A02),단기거주시설 (A03),개인운영시설 (A04)
					$html = "<tr class='append'><th>수입제원</th><td style='border-right:none !important'><input type='text' id='revenueSourceTpNm' name='revenueSourceTpNm' style='width:100%; text-align:left' title='' readonly /><td colspan='2'  style='border-left:none;'></td></tr>";
					$html += "<tr class='append'><th>시설소유</th><td style='border-right:none !important'><input type='text' id='ownershipTpNm' name='ownershipTpNm' style='width:100%; text-align:left' title='' readonly /></td><td colspan='2'  style='border-left:none;'></td></tr>";
					$html += "<tr class='append'><th>중식제공</th><td style='border-right:none !important'><input type='text' id='lunchTpNm' name='lunchTpNm' style='width:100%; text-align:left' title='' readonly /> </td><td colspan='2'  style='border-left:none;'></td></tr>";
					$html += "<tr class='append'><th>입소자정원</th><td style='border-right:none !important'><input type='text' id='capacity' name='capacity' style='width:94.9%; text-align:right' title='' readonly />명 </td><td colspan='2'  style='border-left:none;'></td></tr>";
					$html += "<tr class='append'><th>입소자현원</th><td style='border-right:none !important'><input type='text' id='nowCapacity' name='nowCapacity' style='width:94.9%; text-align:right' title='' readonly />명 </td><td colspan='2'  style='border-left:none;'></td></tr>";
					$html += "<tr class='append'><th>면적</th><td style='border-right:none !important'><input type='text' id='area' name='area' style='width:100%; text-align:left' title='' readonly /></td><td colspan='2'  style='border-left:none;'></td></tr>";
				} else if($.inArray(value,$viewArr0302)>-1) { //B01 장애인 복지관 (B01)
					$html = "<tr class='append'><th>수입제원</th><td style='border-right:none !important'><input type='text' id='revenueSourceTpNm' name='revenueSourceTpNm' style='width:100%; text-align:left' title='' readonly /></td><td colspan='2'  style='border-left:none;'></td></tr>";
					$html += "<tr class='append'><th>시설소유</th><td style='border-right:none !important'><input type='text' id='ownershipTpNm' name='ownershipTpNm' style='width:100%; text-align:left' title='' readonly /></td><td colspan='2'  style='border-left:none;'></td></tr>";
					$html += "<tr class='append'><th>중식제공</th><td style='border-right:none !important'><input type='text' id='lunchTpNm' name='lunchTpNm' style='width:100%; text-align:left' title='' readonly /></td><td colspan='2'  style='border-left:none;'></td></tr>";
					$html += "<tr class='append'><th>일평균 인원</th><td style='border-right:none !important'><input type='text' id='etcDetail1' name='etcDetail1' style='width:94.9%; text-align:right' title='' readonly />명 </td><td colspan='2'  style='border-left:none;'></td></tr>";
					$html += "<tr class='append'><th>주평균 인원</th><td style='border-right:none !important'><input type='text' id='etcDetail2' name='etcDetail2' style='width:94.9%; text-align:right' title='' readonly />명 </td><td colspan='2'  style='border-left:none;'></td></tr>";
				} else if($.inArray(value,$viewArr0303)>-1) { //B02 장애인 주간보호 시설 (B02)
					$html = "<tr class='append'><th>수입제원</th><td style='border-right:none !important'><input type='text' id='revenueSourceTpNm' name='revenueSourceTpNm' style='width:100%; text-align:left' title='' readonly /></td><td colspan='2'  style='border-left:none;'></td></tr>";
					$html += "<tr class='append'><th>시설소유</th><td style='border-right:none !important'><input type='text' id='ownershipTpNm' name='ownershipTpNm' style='width:100%; text-align:left' title='' readonly /></td><td colspan='2'  style='border-left:none;'></td></tr>";
					$html += "<tr class='append'><th>중식제공</th><td style='border-right:none !important'><input type='text' id='lunchTpNm' name='lunchTpNm' style='width:100%; text-align:left' title='' readonly /></td><td colspan='2'  style='border-left:none;'></td></tr>";
					$html += "<tr class='append'><th>입소자정원</th><td style='border-right:none !important'><input type='text' id='capacity' name='capacity' style='width:94.9%; text-align:right' title='' readonly />명 </td><td colspan='2'  style='border-left:none;'></td></tr>";
					$html += "<tr class='append'><th>입소자현원</th><td style='border-right:none !important'><input type='text' id='nowCapacity' name='nowCapacity' style='width:94.9%; text-align:right' title='' readonly />명 </td><td colspan='2'  style='border-left:none;'></td></tr>";
					$html += "<tr class='append'><th>면적</th><td style='border-right:none !important'><input type='text' id='area' name='area' style='width:100%; text-align:left' title='' readonly /></td><td colspan='2'  style='border-left:none;'></td></tr>";
					$html += "<tr class='append'><th>서비스공간</th><td style='border-right:none !important'><input type='text' id='etcDetail1' name='etcDetail1' style='width:100%; text-align:left' title='' readonly /></td><td colspan='2'  style='border-left:none;'></td></tr>";
					$html += "<tr class='append'><th>이용료</th><td style='border-right:none !important'><input type='text' id='etcDetail2' name='etcDetail2' style='width:94.9%; text-align:right' title='' readonly />원</td><td colspan='2'  style='border-left:none;'></td></tr>";
				} else if($.inArray(value,$viewArr0304)>-1) { //B03 인천수어통역센터 (B03)
					$html = "<tr class='append'><th>수입제원</th><td style='border-right:none !important'><input type='text' id='revenueSourceTpNm' name='revenueSourceTpNm' style='width:100%; text-align:left' title='' readonly /></td><td colspan='2'  style='border-left:none;'></td></tr>";
					$html += "<tr class='append'><th>시설소유</th><td style='border-right:none !important'><input type='text' id='ownershipTpNm' name='ownershipTpNm' style='width:100%; text-align:left' title='' readonly /></td><td colspan='2'  style='border-left:none;'></td></tr>";
					$html += "<tr class='append'><th>일평균 인원</th><td style='border-right:none !important'><input type='text' id='etcDetail1' name='etcDetail1' style='width:94.9%; text-align:right' title='' readonly />명 </td><td colspan='2'  style='border-left:none;'></td></tr>";
					$html += "<tr class='append'><th>주평균 인원</th><td style='border-right:none !important'><input type='text' id='etcDetail2' name='etcDetail2' style='width:94.9%; text-align:right' title='' readonly />명 </td><td colspan='2'  style='border-left:none;'></td></tr>";
				} else if($.inArray(value,$viewArr0305)>-1) { //B04 점자도서관 (B04)
					$html = "<tr class='append'><th>수입제원</th><td  style='border-right:none !important'><input type='text' id='revenueSourceTpNm' name='revenueSourceTpNm' style='width:100%; text-align:left' title='' readonly /></td><td colspan='2'  style='border-left:none;'></td></tr>";
					$html += "<tr class='append'><th>시설소유</th><td  style='border-right:none !important'><input type='text' id='ownershipTpNm' name='ownershipTpNm' style='width:100%; text-align:left' title='' readonly /></td><td colspan='2'  style='border-left:none;'></td></tr>";
					$html += "<tr class='append'><th>이용자</th><td style='border-right:none !important'><input type='text' id='etcDetail1' name='etcDetail1' style='width:94.9%; text-align:right' title='' readonly />명 </td><td colspan='2'  style='border-left:none;'></td></tr>";
				} else if($.inArray(value,$viewArr0306)>-1) { //B05 장애인 생활이동지원센터 (B05)
					$html = "<tr class='append'><th>수입제원</th><td style='border-right:none !important'><input type='text' id='revenueSourceTpNm' name='revenueSourceTpNm' style='width:100%; text-align:left' title='' readonly /></td><td colspan='2'  style='border-left:none;'></td></tr>";
					$html += "<tr class='append'><th>시설소유</th><td style='border-right:none !important'><input type='text' id='ownershipTpNm' name='ownershipTpNm' style='width:100%; text-align:left' title='' readonly /></td><td colspan='2'  style='border-left:none;'></td></tr>";
					$html += "<tr class='append'><th>이용자수</th><td style='border-right:none !important'><input type='text' id='capacity' name='capacity' style='width:94.9%; text-align:right' title='' readonly />명 </td><td colspan='2'  style='border-left:none;'></td></tr>";
					$html += "<tr class='append'><th>차량보유</th><td style='border-right:none !important'><input type='text' id='etcDetail1' name='etcDetail1' style='width:100%; text-align:left' title='' readonly /></td><td colspan='2'  style='border-left:none;'></td></tr>";
				} else if($.inArray(value,$viewArr0307)>-1) { //"B07","B08",,"D03" ,장애인 재활지원센터 (B07), 지적장애인 지립지원센터(B08), 장애인 자립생활센터 (D03)
					$html = "<tr class='append'><th>수입제원</th><td style='border-right:none !important'><input type='text' id='revenueSourceTpNm' name='revenueSourceTpNm' style='width:100%; text-align:left' title='' readonly /></td><td colspan='2'  style='border-left:none;'></td></tr>";
					$html += "<tr class='append'><th>시설소유</th><td style='border-right:none !important'><input type='text' id='ownershipTpNm' name='ownershipTpNm' style='width:100%; text-align:left' title='' readonly /></td><td colspan='2'  style='border-left:none;'></td></tr>";
					$html += "<tr class='append'><th>이용자 정원</th><td style='border-right:none !important'><input type='text' id='capacity' name='capacity' style='width:94.9%; text-align:right' title='' readonly />명 </td><td colspan='2'  style='border-left:none;'></td></tr>";
					$html += "<tr class='append'><th>서비스공간</th><td style='border-right:none !important'><input type='text' id='etcDetail1' name='etcDetail1' style='width:100%; text-align:left' title='' readonly /></td><td colspan='2'  style='border-left:none;'></td></tr>";					
				} else if($.inArray(value,$viewArr0308)>-1) { //D04 장애인보조기구 AS센터 (D04)
					$html = "<tr class='append'><th>이용대상</th><td style='border-right:none !important'><input type='text' id='etcDetail1' name='etcDetail1' style='width:100%; text-align:left' title='' readonly /></td><td colspan='2'  style='border-left:none;'></td></tr>";
					$html += "<tr class='append'><th>수리품목</th><td style='border-right:none !important'><input type='text' id='etcDetail3' name='etcDetail3' style='width:100%; text-align:left' title='' readonly /></td><td colspan='2'  style='border-left:none;'></td></tr>";
					$html += "<tr class='append'><th>지원금액</th><td style='border-right:none !important'><input type='text' id='etcDetail2' name='etcDetail2' style='width:100%; text-align:left' title='' readonly /></td><td colspan='2'  style='border-left:none;'></td></tr>";
					$html += "<tr class='append'><th>제출서류</th><td style='border-right:none !important'><input type='text' id='etcDetail4' name='etcDetail4' style='width:100%; text-align:left' title='' readonly /></td><td colspan='2'  style='border-left:none;'></td></tr>";
				} else if($.inArray(value,$viewArr0309)>-1) { //B010,B11 장애인편의증진 기술지원센터 (B10)
					$html = "";
				} else if($.inArray(value,$viewArr0310)>-1) { //C01","C02","C03  장애인 근로사업장 (C01),장애인 보호사업장 (C02),장애인 생산품판매시설 (C03) 
					$html = "<tr class='append'><th>수입제원</th><td style='border-right:none !important'><input type='text' id='revenueSourceTpNm' name='revenueSourceTpNm' style='width:100%; text-align:left' title='' readonly /></td><td colspan='2'  style='border-left:none;'></td></tr>";
					$html += "<tr class='append'><th>시설소유</th><td style='border-right:none !important'><input type='text' id='ownershipTpNm' name='ownershipTpNm' style='width:100%; text-align:left' title='' readonly /></td><td colspan='2'  style='border-left:none;'></td></tr>";
					$html += "<tr class='append'><th>중식제공</th><td style='border-right:none !important'><input type='text' id='lunchTpNm' name='lunchTpNm' style='width:100%; text-align:left' title='' readonly /></td><td colspan='2'  style='border-left:none;'></td></tr>";
					$html += "<tr class='append'><th>입소자정원</th><td style='border-right:none !important'><input type='text' id='capacity' name='capacity' style='width:94.9%; text-align:right' title='' readonly />명 </td><td colspan='2'  style='border-left:none;'></td></tr>";
					$html += "<tr class='append'><th>입소자현원</th><td style='border-right:none !important'><input type='text' id='nowCapacity' name='nowCapacity' style='width:94.9%; text-align:right' title='' readonly />명 </td><td colspan='2'  style='border-left:none;'></td></tr>";
					$html += "<tr class='append'><th>면적</th><td style='border-right:none !important'><input type='text' id='area' name='area' style='width:100%; text-align:left' title='' readonly /></td><td colspan='2'  style='border-left:none;'></td></tr>";
					$html += "<tr class='append'><th>고용장려금</th><td style='border-right:none !important'><input type='text' id='etcDetail1' name='etcDetail1' style='width:100%; text-align:left' title='' readonly /></td><td colspan='2'  style='border-left:none;'></td></tr>";
				} else {
					$html = "";
				}
				//console.log($html);
				$(".<%=layerName%> .append").remove();
				$(".<%=layerName%> #align_common:last-child").append($html);
			}
			//화면처리 end
			if(key=="govsubyFg" || key=="citsubyFg" || key=="gusubyFg") {
				if(value=="1") $(".<%=layerName%> #"+key).prop("checked",true);
			} else {
				//console.log(key);
				if(key != "_$uid") $(".<%=layerName%> #"+key).val(value);
			}
		});
	}
	

	// 페이지 로딩 되면 실행
	$(function () {
		// AUIGrid 서비스 장애그리드를 생성합니다.
		<%=layerName%>createAUIGrid(<%=layerName%>columnLayout);
		AUIGrid.resize(<%=layerName%>myGridID, 550, 582);
		//시설분류 선택에 따른 시설유형 항목 선택
		$("#schWffcltyClas").on("change",function(){
			$val = $(this).val();
			if($val == "") {
				$("#schWffcltyTp").children('option').remove();
				$("#schWffcltyTp").append("<option value=''>전체</option>");
			} else if($val != "") {
				var sendData = { "code" : $val };
				GRIT.tran.send({
					url: "/common/searchWffcltyCdSubList",
					sendData: sendData,
					success: function(data){
						if(data.result=="success") {
							$html = "<option value=''>전체</option>";
							$.each(data.list, function(index, item){ 
								$html += "<option value='"+item.wffcltyClas+"'>"+item.wffcltyNm+"</option>";
							});
							$("#schWffcltyTp").children('option').remove();
							$("#schWffcltyTp").append($html);
						}
					},
					error: function(request, status, error){
						GRIT.msg.alert("시설유형을 조회하는데 문제가 발생했습니다.");
					},
					loading : false
					
				});
			}
		});
	});

</script>