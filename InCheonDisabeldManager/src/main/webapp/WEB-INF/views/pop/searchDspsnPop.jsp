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
            <h1>장애인 검색</h1>
        <div class="btn_right">  
	   		<div class="popupSearchBtnWrap"><button type="button" id="searchBtn" class="popupSearchBtn"><img src="/resources/imagesV2/iconGlass.png" class="iconGlass">검색</button></div>
        </div>
        
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
					<th>장애인(명)</th>
					<td class="title">
						<input type="text" name="searchDspsnNm" id="searchDspsnNm" style="width:97%;" onkeypress="fn_pressItem(this.form);" tabindex="1">
					</td>
					<th>장애유형</th>
					<td class="title">
						<select id="searchOgnztFg" name="searchOgnztFg" style="width: 195px; text-align-last : center">
							<option value="">전체</option>
							<c:if test="${!empty DspsnTpList}">
								<c:forEach var="list" items="${DspsnTpList}">
									<option value="${list.dspsnTpCode}"><c:out
											value="${list.dspsnTpNm}" /></option>
								</c:forEach>
							</c:if>
						</select>
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
	var columnLayout = [ {dataField : "dspsnNm"      ,headerText : "장애인명"   ,width : "20%", style : "my-column-left"} 
	                    ,{dataField : "gender"    ,headerText : "성별" ,width : "10%" , style : "my-column-center"} 
	                    ,{dataField : "disableTpNm"  ,headerText : "장애유형" ,width : "20%" , style : "my-column-left"}
	                    ,{dataField : "disableDgreeFg"  ,headerText : "장애정도" ,width : "20%" , style : "my-column-left"}
	                    ,{dataField : "encBirthDd"  ,headerText : "생년월일" ,width : "20%" , dataType : "date", formatString : "yyyy-mm-dd", style : "my-column-center"}
	                    ,{dataField : "useFg"       ,headerText : "사용여부" ,width : "10%"}
	];
	
	$(function () {
		$("#searchDspsnNm").focus();
		
		if($(opener.document).find(".<%=layerName%> #dspsnPopValue").val() == "" || $(opener.document).find(".<%=layerName%> #dspsnPopValue").val() == null){
			$("#searchDspsnNm").val($(opener.document).find(".<%=layerName%> #searchDspsnId").val());
		} else{
			$("#searchDspsnNm").val($(opener.document).find(".<%=layerName%> #dspsnId").val());
		}
		// AUIGrid 그리드를 생성합니다.
		createAUIGrid(columnLayout);
		
		$("#searchBtn").on("click", function(){
			loadData();
		});
		
		var searchDspsnNm = $("#searchDspsnNm").val();
		
		if(searchDspsnNm != "") {
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
			
			if($(opener.document).find(".<%=layerName%> #dspsnPopValue").val() == "" || $(opener.document).find(".<%=layerName%> #dspsnPopValue").val() == null){
				window.opener.<%=layerName%>setSearchDspsnPop(item, window.name);
			} else{
				if(item.useFg == "미사용"){
					GRIT.msg.alert("관리 대상이 아닌 장애인이므로 사용할 수 없습니다.");
					return;
				}
				window.opener.<%=layerName%>setSearchDspsnPop2(item, window.name);
			}
			
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
		var searchDspsnCd = $("#searchDspsnCd").val();
		var searchDspsnNm = $("#searchDspsnNm").val();
		var searchOgnztFg = $("#searchOgnztFg").val();
				
		var sendData ={"searchDspsnNm"  : searchDspsnNm
				   	   ,"searchOgnztFg" : searchOgnztFg};
		
		// ajax 요청 전 그리드에 로더 표시
		AUIGrid.showAjaxLoader(myGridID);
		
		GRIT.tran.send({
			url: "/pop/searchDspsnTpList",
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
				GRIT.msg.alert("운영단체코드 조회하는데 문제가 발생했습니다.");
				// 로더 제거
				AUIGrid.removeAjaxLoader(myGridID);
			},
			loading : false
		});
		
	};
	
</script>
</html>
