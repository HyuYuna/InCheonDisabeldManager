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
%>


<jsp:include page="../common/commonPopTop.jsp">
	<jsp:param value="<%=layerName%>" name="layerName"/>
</jsp:include>

<body>	
    <div class="popupWrapper minWidth650">
    	<h1>도서유형 검색</h1>
        <div class="popupSearchBtnWrap">
        	<button type="button" id="searchBtn" class="popupSearchBtn"><img src="/resources/imagesV2/iconGlass.png" class="iconGlass">검색</button>
        </div>
        
       <form id="searchForm" name="searchForm"  onsubmit="return false;" autocomplete='off'>
		<table class="dataTable marginT20">
			<colgroup>
	                <col style="width:140px">
	                <col style="width:auto">
            </colgroup>
            <tbody>
                <tr>
					<th>도서유형명</th>
					<td class="title">
						<input type="text" name="schTypeCd" id="schTypeCd" style="width:100%;" onkeypress="fn_pressItem(this.form);" tabindex="1">
					</td>
				</tr>
			</tbody>
		</table>
	</form>
        
	<!-- 그리드 영역 -->
		<div id="grid_wrap" class="marginT20" style="height:435px;"></div>
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
		 {dataField : "typeCd", headerText : "유형코드", width : "30%", style : "my-column-center"},
		 {dataField : "typeNm", headerText : "유형명", width : "60%", style : "my-column-left"},
		 {dataField : "useFg" , headerText : "사용여부", width : "10%",
			 labelFunction : function( rowIndex, columnIndex, value, headerText, item ) {
				 if(value == "1"){
					 return "사용";
				 }else{
					 return "미사용";
				 }
			 }
		 }
	];
	
	var winName = window.name;
	
	$(function () {
		$("#schTypeCd").focus();
		
		$fid = (winName=="searchLbrryBookTypePop") ? "schTypeCd" : "typeCd";
		
		$("#schTypeCd").val($(opener.document).find(".<%=layerName%> #"+$fid).val());
		
		// AUIGrid 그리드를 생성합니다.
		createAUIGrid(columnLayout);
		
		$("#searchBtn").on("click", function(){
			loadData();
		});
		
		if($("#schTypeCd").val() != "") {
			loadData();			
		}
		
	});
	
	// AUIGrid 를 생성합니다.
	function createAUIGrid(columnLayout) {
		var auiGridProps = {
			showRowCheckColumn : false,
			rowHeight : 38,
			headerHeight : 38,
			noDataMessage : "조회된 내용이 없습니다."
		};
		
		// 실제로 #grid_wrap 에 그리드 생성
		myGridID = AUIGrid.create("#grid_wrap", columnLayout, auiGridProps);
		
		// 선택 더블클릭 이벤트 바인딩
		AUIGrid.bind(myGridID, "selectionChange", function(event) {
			var primeCell = event.primeCell; // 선택 대표 셀
			var item = primeCell.item; // 행 정보
			window.opener.<%=layerName%>setSchPop(item, window.name);
			window.close();
		});
	}

	//엔터키 조회시
	function fn_pressItem(e){ 
    	if(event.keyCode == 13){ //javascript에서는 13이 enter키를 의미함 
    		loadData ();
		}
	}
	
	function loadData () {

		var sendData ={"schTypeCd"  : $("#schTypeCd").val()};
		
		// ajax 요청 전 그리드에 로더 표시
		AUIGrid.showAjaxLoader(myGridID);
		
		GRIT.tran.send({
			url: "/pgm/lbrryBookTypeList",
			sendData : sendData,
			success: function(result){
				// 그리드에 데이터 세팅
				// resData 는 JSON 을 파싱한 Array-Object 입니다.
				AUIGrid.setGridData(myGridID, result.list);
				
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
