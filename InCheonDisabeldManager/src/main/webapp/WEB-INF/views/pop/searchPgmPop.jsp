<%@page import="kr.co.grit.common.util.SessionUtil, java.util.Map, java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%
	String layerName = request.getParameter("layerName");
	String rowIndex = request.getParameter("rowIndex");
%>


<jsp:include page="../common/commonPopTop.jsp">
	<jsp:param value="<%=layerName%>" name="layerName"/>
</jsp:include>

<body>	
    <div class="wrapperPop">
        <div class="credit_conts_title">
            <p class="blt_img">프로그램 검색</p>
        </div>
        <div class="btn_right">  
	   		<div class="popupSearchBtnWrap"><button type="button" id="searchBtn" class="popupSearchBtn"><img src="/resources/imagesV2/iconGlass.png" class="iconGlass">검색</button></div>
        </div>
        
       <form id="searchForm" name="searchForm"  onsubmit="return false;" autocomplete='off'>
		<table class="dataTable marginT20">
			<colgroup>
	                <col style="width:90px">
	                <col style="width:140px">
	                <col style="width:90px">
	                <col style="width:140px">
	                <col style="width:90px">
	                <col style="width:auto">
            </colgroup>
            <tbody>
            	<tr>
            		<th>대분류</th>
					<td class="title">
						<select id="lclas" name="lclas" style="width:120px" onchange="setMclas(this.value)">
							<option value="">전체</option>
							<c:if test="${!empty lclassList}">	
							<c:forEach var="list" items="${lclassList}">
								<option value="${list.lclasCd}"><c:out value="${list.lclasNm}" /></option>
							</c:forEach>
							</c:if>
						</select>
					</td>
            		<th>중분류</th>
					<td class="title">
						<select id="mclas" name="mclas" style="width:120px" onchange="setSclas(this.value)">
                      		<option value="">전체</option>
						</select>
					</td>
            		<th>소분류</th>
					<td class="title">
						<select id="sclas" name="sclas" style="width:120px">
                        	<option value="">전체</option>
						</select>
					</td>
            	</tr>
                <tr>
					<th>프로그램명</th>
					<td class="title" colspan="5">
						<input type="text" name="programNm" id="programNm" style="width:97%;" onkeypress="fn_pressItem(this.form);" tabindex="1">
					</td>
				</tr>
			</tbody>
		</table>
	</form>
        
	<!-- 그리드 영역 -->
		<div id="grid_wrap" class="marginT20" style="height:405px;"></div>
	<!-- 그리드 영역 -->
    </div>
</body>
<style type="text/css" >
 	.my-column-right {
		text-align: right;
	}
	
	.my-column-left {
		text-align: left;
	}
</style>
<script type="text/javascript" >
	// AUIGrid 생성 후 반환 ID
	var myGridID;
	
	// AUIGrid 칼럼 설정
	var columnLayout = [ 
		 {dataField : "programCd", headerText : "프로그램코드", width : "30%", style : "my-column-center"},
		 {dataField : "programNm", headerText : "프로그램명", width : "40%", style : "my-column-center"},
		 {dataField : "operateNm", headerText : "운영여부", width : "30%", style : "my-column-center"}
	];
	
	var winName = window.name;
	
	$(function () {
		$("#lclas").focus();
		
		// AUIGrid 그리드를 생성합니다.
		createAUIGrid(columnLayout);
		
		$("#searchBtn").on("click", function(){
			loadData();
		});
		
		loadData();			
		
	});
	
	// AUIGrid 를 생성합니다.
	function createAUIGrid(columnLayout) {
		var auiGridProps = {
			showRowCheckColumn : false,
			rowHeight : 38,
			headerHeight : 38
		};
		
		// 실제로 #grid_wrap 에 그리드 생성
		myGridID = AUIGrid.create("#grid_wrap", columnLayout, auiGridProps);
		
		// 선택 더블클릭 이벤트 바인딩
		AUIGrid.bind(myGridID, "selectionChange", function(event) {
			var primeCell = event.primeCell; // 선택 대표 셀
			var item = primeCell.item; // 행 정보
			window.opener.<%=layerName%>setSchPop(item,'<%=rowIndex%>');
			window.close();
		});
	}

	//엔터키 조회시
	function fn_pressItem(e){ 
    	if(event.keyCode == 13){ //javascript에서는 13이 enter키를 의미함 
    		loadData ();
		}
	}

	//조회조건 대분류코드로 중분류코드 셋팅
	function setMclas(val){
		var sendData = {"lclasCd"   : val};
		 GRIT.tran.send({
			url: "/pgm/selectMclaCdList",
			async: false,
			sendData: sendData,
			success: function(result){
				//중분류 코드 셀렉트 박스 초기화
				$('#mclas option').remove();
				$('#mclas').append("<option value=''>전체</option>");
				//소분류코드 셀렉트 박스 초기화
				$('#sclas option').remove();
				$('#sclas').append("<option value=''>전체</option>");
				if(val != ""){
					for(var i=0; i<result.data.length; i++){
						$('#mclas').append("<option value="+result.data[i].mclasCd+"> "+result.data[i].mclasNm+ "</option>");	
					}
				}
			},
				loadingTarget: "<%=layerName%>"
			});  
	}

	// 조회조건 중분류코드로 소분류코드 셋팅
	function setSclas(val){
		var sendData = {"mclasCd"   : val};
		 GRIT.tran.send({
			url: "/pgm/selectSclaCdList",
			async: false,
			sendData: sendData,
			success: function(result){
				$('#sclas option').remove();
				$('#sclas').append("<option value=''>전체</option>");
				
				if(val != ""){
					for(var i=0; i<result.data.length; i++){
						$('#sclas').append("<option value="+result.data[i].sclasCd+"> "+result.data[i].sclasNm+ "</option>");	
					}
				}
			},
				loadingTarget: "<%=layerName%>"
			});  
	}
	
	function loadData () {

		var sendData = {
				"searchLclasCd" : $("#lclas option:selected").val(),
				"searchMclasCd" : $("#mclas option:selected").val(),
				"searchSclasCd" : $("#sclas option:selected").val(),
				"searchProgramNm" : $("#programNm").val()
				};
		
		// ajax 요청 전 그리드에 로더 표시
		AUIGrid.showAjaxLoader(myGridID);
		
		GRIT.tran.send({
			url: "/pgm/pgmMgmtGrid1",
			sendData : sendData,
			success: function(result){
				// 그리드에 데이터 세팅
				// resData 는 JSON 을 파싱한 Array-Object 입니다.
				AUIGrid.setGridData(myGridID, result.data);
				
				//var gridData =  AUIGrid.getGridData(myGridID); 
				//var rowCount = gridData.length; //전체 조회수
				
				// 로더 제거
				AUIGrid.removeAjaxLoader(myGridID);
	 			
			},
			error: function(request, status, error){
				GRIT.msg.alert("도서유형을 조회하는데 문제가 발생했습니다.");
				// 로더 제거
				AUIGrid.removeAjaxLoader(myGridID);
			},
			loading : false
		});
		
	};
	
</script>
</html>
