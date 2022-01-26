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
    	<h1>복지시설 조회</h1>
        <!-- conditionTable : start -->
        <div class="popupSearchBtnWrap"><button type="button" id="searchBtn" class="popupSearchBtn"><img src="/resources/imagesV2/iconGlass.png" class="iconGlass">검색</button></div>
        <form id="searchForm" name="searchForm"  onsubmit="return false;" autocomplete='off'>
        <table class="dataTable marginT20">
            <colgroup>
                <col style="width:140px">
                <col style="width:200px">
                <col style="width:140px">
                <col style="width:auto">
            </colgroup>
            <tbody>
                <tr>
                <th>시설구분</th>
                    <td >
						<select id="searchWffcltyclas" name="searchwffcltyclas" style="width: 190px; text-align-last : center">
							<option value="">전체</option>
							<c:if test="${!empty wffcltyCdList}">
								<c:forEach var="list" items="${wffcltyCdList}">
									<option value="${list.wffcltyClas}"><c:out
											value="${list.wffcltyNm}" /></option>
								</c:forEach>
							</c:if>
						</select>
                    </td>
                    <th>시설코드(명)</th>
                    <td>
                        <input type="text" name="searchWffcltyCd" id="searchWffcltyCd" style="width:100%" onkeypress="fn_pressItem(this.form);" tabindex="1">
                    </td>
				</tr>
            </tbody>
        </table>
        </form>
        <!-- conditionTable : end -->

		<!-- dataTable : start -->
		<div id="grid_wrap" class="marginT20" style="height:435px;"></div>
        <!-- dataTable : end -->

		<!-- 
        <div class="popupConfirmBtnWrap"><button type="button" class="popupConfirmBtn">확인</button> <button type="button" class="popupCencelBtn">닫기</button></div>
		 -->
    </div>
    <!-- popupWrapper : end  -->

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
	$(function () {
		$("#searchWffcltyCd").focus();
		
		if($(opener.document).find(".<%=layerName%> #wffcltyPopValue").val() == "" || $(opener.document).find(".<%=layerName%> #wffcltyPopValue").val() == null){
			$("#searchWffcltyCd").val($(opener.document).find(".<%=layerName%> #wffcltyCd").val());
		} else{
			$("#searchWffcltyCd").val($(opener.document).find(".<%=layerName%> #searchWffcltyCd").val());
		}
		
		
		// AUIGrid 그리드를 생성합니다.
		createAUIGrid(columnLayout);
		
		$("#searchBtn").on("click", function(){
			loadData();
		});
		
		var searchWffcltyCd = $("#searchWffcltyCd").val();
		
		if(searchWffcltyCd != "") {
			loadData();			
		}
		
	});
	
	// AUIGrid 칼럼 설정
	var columnLayout = [ {dataField : "wffcltyCd"     ,headerText : "시설코드"  ,width : "10%" } 
	                    ,{dataField : "wffcltyClas"   ,headerText : "시설분류"  ,width : "25%" , style : "my-column-left"} 
	                    ,{dataField : "wffcltyNm"     ,headerText : "시설명"    ,width : "35%" , style : "my-column-left"}
	                    ,{dataField : "uniqueNo"      ,headerText : "사업자번호" ,width : "20%" , style : "my-column-left"}
	                    ,{dataField : "useFg"         ,headerText : "사용여부"   ,width : "10%"}
	];

	// AUIGrid 를 생성합니다.
	function createAUIGrid(columnLayout) {
		var auiGridProps = {
			showRowCheckColumn : false,
			rowHeight : 38,
			headerHeight : 38,
			noDataMessage : "조회된 내용이 없습니다."
		};
		
		console.log(columnLayout);
		
		// 실제로 #grid_wrap 에 그리드 생성
		myGridID = AUIGrid.create("#grid_wrap", columnLayout, auiGridProps);
		
		// 선택 체인지 이벤트 바인딩
		AUIGrid.bind(myGridID, "selectionChange", function(event) {
			var primeCell = event.primeCell; // 선택 대표 셀
			var item = primeCell.item; // 행 정보
			
			window.opener.<%=layerName%>setSearchWffcltyPop (item, window.name);
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
		
		var searchWffcltyCd = $("#searchWffcltyCd").val();
		var searchWffcltyClas = $("#searchWffcltyclas").val();	
			
		
		var sendData ={"wffcltyCd"   : searchWffcltyCd
				      ,"wffcltyclas" : searchWffcltyClas};
		
		// ajax 요청 전 그리드에 로더 표시
		AUIGrid.showAjaxLoader(myGridID);
	
		GRIT.tran.send({
			url: "/pop/searchWffcltyList",
			sendData: sendData,
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
				GRIT.msg.alert("복지시설코드 조회하는데 문제가 발생했습니다.");
				// 로더 제거
				AUIGrid.removeAjaxLoader(myGridID);
			},
			loading : false
		});
		
	};
	
	
	
</script>
</html>
