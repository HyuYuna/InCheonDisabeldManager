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
                    <h1>복지지설 종사자 조회</h1>
					<jsp:include page="../common/commonBtn.jsp">
						<jsp:param value="<%=layerName%>" name="layerName" />
					</jsp:include>                    
                </div>
                <!-- titleWrap : end -->
                
				<form name="<%=layerName%>searchForm1" onsubmit="return false;" autocomplete='off'>
					<table class="dataTable marginT10">
	                    <colgroup>
	                        <col style="width:140px">
	                        <col style="width:300px">
	                        <col style="width:140px">
	                        <col style="width:300px">
	                        <col style="width:140px">
	                        <col style="width:300px">
	                    </colgroup>
                    	<tbody>
                        	<tr>
								<c:if test="${userGroupCd == 'A' || userGroupCd == 'B' || userGroupCd == 'E'}">
									<th>복지시설</th> 
									<td>
										<input type="text" id="wffcltyCd" name="wffcltyCd" style="width:40%;" title="복지시설" oninput="<%=layerName%>fn_removeLinkNm();" onkeydown="<%=layerName%>fn_searchLinkCd(this.value);">
					            			<button type="button" class="iconSearchGlassBtn" onclick="<%=layerName%>fn_searchPop(); return false;">
					            				<img src="/resources/imagesV2/iconSearchGlass.png" class="iconSearchGlass">
					            			</button>
					        				<input type="text" id="linkNm" name="linkNm" style="width:49%; margin-left: 0px" title="복지시설명"  readonly /> 
									</td>
								</c:if>
													
									<c:if test="${userGroupCd == 'D'}">	
									<th>복지시설</th> 
										<td>
										<select id="wffcltyCd" name="wffcltyCd" style="width: 100%; text-align-last : center;" tabindex="1" >
											<c:forEach var="list" items="${orgnzCodeList}">
												<option value="${list.groupCd}">
												<c:out value="${list.groupNm}" /></option>
											</c:forEach>
										</select>
										</td>
									</c:if>
									
									<c:if test="${userGroupCd == 'C'}">	
										<input type="hidden" id ="wffcltyCd" style="width: 100%"; name="wffcltyCd" value="${linkCd}" />
									</c:if>
								
								<th>종사자명</th>
								<td>
									<input type="text" id="searchWffcltyNm" name="searchWffcltyNm" maxlength="40" style="width: 100%;" onkeypress="<%=layerName%>fn_pressSys(this.form);" onkeyup="checkByte(this, 40)" >
								</td>
								
								<th>장애여부</th>
								<td> 
									<select id="searchDisability" name="searchDisability" style="width: 100%; text-align-last : center;" tabindex="1">
											<option value ="">전체</option>
											<c:if test="${!empty disabilityList}">
												<c:forEach var="list" items="${disabilityList}">
													<option value="${list.disabilityCd}"><c:out value="${list.disabilityNm}"/></option>
												</c:forEach>
											</c:if>
									</select>
								</td>
							</tr>
						</tbody>
						</table>
					</form>
				
					<div class="box-top">
						<h2>종사자 리스트</h2>
					</div>

					<div class="box-wrap mb10">
						<div id="<%=layerName%>grid_wrap" style="height: 423px;"></div>
					</div>
					
					<table class="dataTable">
				    <colgroup>
				        <col width="10%" />
				        <col width="16%" />
				        <col width="10%" />
				        <col width="16%" />
				        <col width="10%" />
				        <col width="16%" />
				        <col width="*" />
				    </colgroup>
					<tbody>
					<tr style="width:10px;"></tr>
					<tr>
						<table class="layoutTable">
						    <tr>
							    <td valign="top">
							    <h2>종사자 정보</h2>
							        <form name="workerHistoryForm" id="workerHistoryForm" method="post" autocomplete='off'>
							        <input type="hidden" id="wffcltyCd" name="wffcltyCd" value=""/>
				                    <table cellpadding="0" cellspacing="0"  class="dataTable" id="align_common" border="1" >
				                        <colgroup>
				                            <col width="11%" />
				                            <col width="20%" />
				                            <col width="9%" />
				                            <col width="20%" />
				                            <col width="9%" />
				                            <col width="18%" />
				                        </colgroup>                                               
				                        <tr>
				                            <th>종사자코드</th>
				                            <td><input type="text" id="workerId" name="workerId" style="width:100%; text-align:left;" class="onlynum" title="종사자코드" tabindex="1" readonly> </td>
				                            <th>종사자명</th>
				                            <td><input type="text" id="workerNm" name="workerNm" style="width:100%; text-align:left;" class="onlynum" title="종사자명" tabindex="1" readonly> </td>
				                            <th>장애여부</th>
				                            <td><input type="text" id="disableHaveNm" name="disableHaveNm" style="width:100%; text-align:left;" class="onlynum" title="장애여부" tabindex="1" readonly> </td>
										</tr>
										<tr>
				                            <th>주소</th>
				                            <td colspan="10"><input type="text" id="fullAddr" name="fullAddr" style="width:100%; text-align:left;" class="onlynum" title="주소" tabindex="1" readonly> </td>
				                        </tr>
				                        <tr>
				                        	<th>현 근무시설</th>
					                        <td><input type="text" id="wffcltyNm" name="wffcltyNm" style="width: 100%;" readonly> </td>
					                        <th>직위</th>
					                        <td><input type="text" id="positionCdNm" name="positionCdNm" style="width: 100%;" readonly> </td>
				                            <th>호봉</th>
				                            <td >
				                            <input type="text" id="salaryClass" name="salaryClass" style="width: 100%;" readonly>
				                            </td>
				                        </tr>
				                        <tr>
				                        	<th>입사일</th>
				                            	<td><input type="text" id="<%=layerName %>joinDd" name="joinDd" style="width:100%;text-align:left;" class="onlynum" title="입사일" tabindex="1" readonly> </td>
				                         	<th>퇴사일</th>
										 <td colspan="4"><input type="text" id="<%=layerName %>retireDd" name="retireDd" style="width:39.6%;text-align:left;" class="onlynum" title="입사일" tabindex="1" readonly> </td>
				                        </tr>
				                        <tr>
				                    		<th>시설근무이력</th>
				                            <td colspan="6"><input type="text" id="workRecord" name="workRecord" style="width:100%;text-align:left;" class="onlynum" title="시설근무이력" tabindex="1" onkeyup="checkByte(this, 100)" onkeydown="<%=layerName%>EnterFilter('enterPrprty');" readonly> </td>
				                    	</tr>
				                    </table>
				                    </form>
							    </td>
							    <td style="width: 549px;">
							    <div id="<%=layerName%>grid_wrap1" style="max-width: 100%; width: 550px; height: 192px; margin-left: 10px;">
							    	<h2>근무 이력</h2>
							    </div>
							    </td>
						    </tr> 
						</table>
				    </tr>
				</tbody>
				</table>
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
	
</style>

<script type="text/javascript" >
	// 조회 클릭시
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .search').click(function(){
		<%=layerName%>loadData();
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
		
		//gridResize();
	});
	
	//엔터키 조회시
	function <%=layerName%>fn_pressSys(e){ 
    	if(event.keyCode == 13){ //javascript에서는 13이 enter키를 의미함 
    		<%=layerName%>loadData ();
		}
	}
	
	// AUIGrid 생성 후 반환 ID
	var <%=layerName%>myGridID;
	var <%=layerName%>myGridID1;
	
	// AUIGrid 칼럼 설정
	var <%=layerName%>columnLayout  = [ 
        {dataField : "workerId"      ,headerText : "코드"   ,width : "8%", style : "my-column-center"}
       ,{dataField : "workerNm" ,headerText : "종사자명"       ,width : "12%", style : "my-column-left"}
       ,{dataField : "wffcltyNm"      ,headerText : "복지시설"    ,width : "15%", style : "my-column-left"}
       ,{dataField : "positionCdNm"      ,headerText : "직위"    ,width : "15%", style : "my-column-left" } 
       ,{dataField : "salaryClass"      ,headerText : "호봉"    ,width : "5%", style : "my-column-right"} 
       ,{dataField : "joinDd"      ,headerText : "입사일"    ,width : "10%", dataType : "date", formatString : "yyyy-mm-dd", style : "my-column-center"} 
       ,{dataField : "retireDd"      ,headerText : "퇴사일"    ,width : "10%", dataType : "date", formatString : "yyyy-mm-dd", style : "my-column-center"}
       ,{dataField : "disableHaveNm"      ,headerText : "장애여부"    ,width : "5%", style : "my-column-center"}
       ,{dataField : "workRecord"      ,headerText : "근무이력"    ,width : "20%", style : "my-column-left"}
       ];
	
	// AUIGrid 칼럼 설정
	var <%=layerName%>columnLayout1  = [
        {dataField : "inoutFg"      ,headerText : "구분"   ,width : "15%", style : "my-column-center"}
       ,{dataField : "wffcltyNm" ,headerText : "복지시설"       ,width : "40%", style : "my-column-left"}
       ,{dataField : "inoutDd" ,headerText : "입/퇴사일"       ,width : "20%", dataType : "date", formatString : "yyyy-mm-dd", style : "my-column-center"}
       ,{dataField : "positionTp" ,headerText : "직위"       ,width : "25%", style : "my-column-left"}
       ];
	
	$(function () {
		// AUIGrid 그리드를 생성합니다.
		<%=layerName%>createAUIGrid(<%=layerName%>columnLayout);
		<%=layerName%>createAUIGrid1(<%=layerName%>columnLayout1);
		
		// 데이터 요청, 요청 성공 시 AUIGrid 에 데이터 삽입합니다.
		$(".<%=layerName%> #sehUserNm").focus();
		$(".<%=layerName%> #lvhsRsnEtcDetail").hide();
		$(".<%=layerName%> .thlvhsDdNm").hide();
		$(".<%=layerName%> .tdlvhsDdNm").hide();
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
			<%=layerName%>setHistoryGrid(primeCell, item);
		});
		
		// 그리드 ready 이벤트 바인딩
		AUIGrid.bind(<%=layerName%>myGridID, "ready", <%=layerName%>auiGridCompleteHandler);
	}
	
	// AUIGrid 를 생성합니다.
	function <%=layerName%>createAUIGrid1(columnLayout1) {
		
		var <%=layerName%>auiGridProps = {
			showRowCheckColumn : false,
			rowHeight : 38,
			headerHeight : 38,
			noDataMessage : "조회된 내용이 없습니다."
		};
		
		// 실제로 #grid_wrap 에 그리드 생성
		<%=layerName%>myGridID1 = AUIGrid.create("#<%=layerName%>grid_wrap1", columnLayout1, <%=layerName%>auiGridProps);
		
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
		$(".<%=layerName%> #workerId").val(item.workerId);
		$(".<%=layerName%> #workerNm").val(item.workerNm);
		$(".<%=layerName%> #wffcltyNm").val(item.wffcltyNm);
		$(".<%=layerName%> #positionCdNm").val(item.positionCdNm);
		$(".<%=layerName%> #salaryClass").val(item.salaryClass);
		$(".<%=layerName%> #fullAddr").val(item.fullAddr);
		var joinDd = item.joinDd;
		if(joinDd != "" && joinDd != null){
			$(".<%=layerName%> #<%=layerName %>joinDd").val(item.joinDd.replace(/(\d{4})(\d{2})(\d{2})/, '$1-$2-$3'));
		}
		else{
			$(".<%=layerName%> #<%=layerName %>joinDd").val(item.joinDd);
		}
		var retireDd = item.retireDd;
		if(retireDd != "" && retireDd != null){
			$(".<%=layerName%> #<%=layerName %>retireDd").val(item.retireDd.replace(/(\d{4})(\d{2})(\d{2})/, '$1-$2-$3'));
		}
		else{
			$(".<%=layerName%> #<%=layerName %>retireDd").val(item.retireDd);
		}
		$(".<%=layerName%> #disableHaveNm").val(item.disableHaveNm);
		$(".<%=layerName%> #useFg").val(item.useFg);
		$(".<%=layerName%> #workRecord").val(item.workRecord);
	}
	
	//엔터키 조회시
	function <%=layerName%>fn_pressSys(e){ 
    	if(event.keyCode == 13){ //javascript에서는 13이 enter키를 의미함 
    		<%=layerName%>loadData ();
		}
	}
	
	//조회
	function <%=layerName%>loadData () {
		
		var linkCd      	= $(".<%=layerName%> #wffcltyCd").val();
		var searchWffcltyNm = $(".<%=layerName%> #searchWffcltyNm").val();
		var searchDisability = $(".<%=layerName%> #searchDisability").val();
		var sendData = {"linkCd"      : linkCd
						,"searchWffcltyNm"      : searchWffcltyNm
						,"searchDisability"      : searchDisability};
		
		// ajax 요청 전 그리드에 로더 표시
		AUIGrid.showAjaxLoader(<%=layerName%>myGridID);
		
		GRIT.tran.send({
			url: "/emp/empWorkerListVwGrid1",
			sendData : sendData,
			success: function(result){
				// 그리드에 데이터 세팅
				// resData 는 JSON 을 파싱한 Array-Object 입니다.
				AUIGrid.setGridData(<%=layerName%>myGridID, result.data);
				AUIGrid.setSelectionByIndex(<%=layerName%>myGridID, 0,0);
				// 로더 제거
				AUIGrid.removeAjaxLoader(<%=layerName%>myGridID);
				<%=layerName%>fn_newEmpWorker();
			},
			error: function(request, status, error){
				GRIT.msg.alert("사용자 조회하는데 문제가 발생했습니다.");
				// 로더 제거
				AUIGrid.removeAjaxLoader(<%=layerName%>myGridID);
			},
			loading : false
		});
	}
	
	// 초기화
	function <%=layerName%>fn_newEmpWorker() {
		$(".<%=layerName%> #workerId").val("");
		$(".<%=layerName%> #workerNm").val("");
		$(".<%=layerName%> #disableHaveNm").val("");
		$(".<%=layerName%> #fullAddr").val("");
		$(".<%=layerName%> #wffcltyNm").val("");
		$(".<%=layerName%> #positionCdNm").val("");
		$(".<%=layerName%> #salaryClass").val("");
		$(".<%=layerName%> #<%=layerName%>joinDd").val("");
		$(".<%=layerName%> #<%=layerName%>retireDd").val("");
		$(".<%=layerName%> #workRecord").val("");
		AUIGrid.setGridData(<%=layerName%>myGridID1, []);
	}
	
	//근무이력 Grid
	function <%=layerName%>setHistoryGrid(primeCell, item){
		
		var sendData = {workerId : item.workerId};

			// ajax 요청 전 그리드에 로더 표시
			AUIGrid.showAjaxLoader(<%=layerName%>myGridID1);
			
			GRIT.tran.send({
			url: "/emp/empWorkerHistoryGrid2",
			sendData: sendData,
			success: function(result){
				// 그리드에 데이터 세팅
				// resData 는 JSON 을 파싱한 Array-Object 입니다.
				AUIGrid.setGridData(<%=layerName%>myGridID1, result.data);
				
				// 로더 제거
				AUIGrid.removeAjaxLoader(<%=layerName%>myGridID1);
				
			},
			error: function(request, status, error){
				GRIT.msg.alert("공통코드를 조회하는데 문제가 발생했습니다.");
				// 로더 제거
				AUIGrid.removeAjaxLoader(<%=layerName%>myGridID1);
			},
			loading : false
		});

	}
	
	function <%=layerName%>fn_searchPop(){
		// 복지시설
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
		$(".<%=layerName%> #linkNm").val(item.wffcltyNm);			
	}
	
	//복지시설
	function <%=layerName%>fn_searchLinkCd(value){

		   if(event.keyCode != 13 && event.keyCode != 9){
		   	   return false;
		   }
		   
		   if($(".<%=layerName%> #wffcltyCd").val().length == "4" && $(".<%=layerName%> #linkNm").val() != ""){
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
						$(".<%=layerName%> #linkNm").val(result.data[0].linknm);
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
	
	// 복지시설 이름 제거
	function <%=layerName%>fn_removeLinkNm(){
			$(".<%=layerName%> #linkNm").val("");
		 }
	
	function <%=layerName%>exportTo() {
		
		var excelList = AUIGrid.getGridData(<%=layerName%>myGridID);
		
		if(excelList.length == 0){
			GRIT.msg.alert("종사자 리스트 조회된 내용이 없습니다.");
			return false;
		}
		
		AUIGrid.exportToXlsx(<%=layerName%>myGridID, {
			fileName : "종사자_조회_내역",
			// 스타일 상태 유지 여부(기본값:true)
		});
	}
</script>

