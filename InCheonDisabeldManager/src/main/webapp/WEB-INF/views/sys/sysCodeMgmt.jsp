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
<style>
/* 리스트 템플릿에서 사용할 클래스*/
.myList-style {
	text-align :left;
	white-space:nowrap;
}
.myList-style .myList-col {
	overflow: hidden;
	text-overflow: ellipsis;
	display:inline-block;
}
</style>
                <!-- titleWrap : start -->
                <div class="titleWrap">
                    <h1>공통코드관리</h1>
					<jsp:include page="../common/commonBtn.jsp">
						<jsp:param value="<%=layerName%>" name="layerName" />
					</jsp:include>                    
                </div>
                <!-- titleWrap : end -->
                
                <!-- conditionTable : start -->
                <form name="<%=layerName%>searchForm1" onsubmit="return false;" autocomplete='off'>
                <table class="dataTable marginT10">
                    <colgroup>
                        <col style="width:100px">
                        <col style="width:300px">
                        <col style="width:100px">
                        <col style="width:auto">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>코드구분</th>
                            <td>
								<input type="text" id="schCommcd" name="schCommcd" style="width:100%;" title="" onkeypress="<%=layerName%>fn_pressSys(this.form);" />
							</td>
                            <th>코드명</th>
                            <td>
								<input type="text" id="schCommcdValue" name="schCommcdValue" style="width:100%;" title="" onkeypress="<%=layerName%>fn_pressSys(this.form);" />
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
                                <div class="subtitle">통합코드 리스트</div>
                            </div>
							<div id="<%=layerName%>grid_wrap" style="height: 490px;"></div>
						</td>
					</tr>
						<tr>
							<td>
	                            <div class="subtitleGroup">
	                                <div class="subtitle">통합코드 정보</div>
	                                <div class="subBtnGroup">
	                            </div>
						                            </div>
								<form id="detailForm" name="detailForm">

									<!-- <h2>보호자정보</h2> -->
									<table cellpadding="0" cellspacing="0" class="dataTable" id="align_common" border="1">
										<input type="hidden" id="rowIndex"   name="rowIndex"  value=""/>
										<colgroup>
											<col width="15%" />
											<col width="35%" />
											<col width="15%" />
											<col width="35%" />
										</colgroup>
										<tr>
											<th>코드구분</th>
											<td>
												<input type="text" id="commcdFg" name="commcdFg" style="width:100%; text-align: left;"  title="통합코드구분" 
												onkeyup="checkByte(this, 4)"  onkeydown="<%=layerName%>EnterFilter('commcdFgNm');"> 
											</td>
											<th>구분명</th>
											<td>
												<input type="text" id="commcdFgNm" name="commcdFgNm" style="width:100%; text-align: left;"  title="통합코드구분명" 
												onkeyup="checkByte(this, 70)"  onkeydown="<%=layerName%>EnterFilter('commcd');"> 
											</td>
										</tr>
										<tr>
											<th>통합코드</th>
											<td>
												<input type="text" id="commcd" name="commcd" style="width:100%; text-align: left;"  title="통합코드" 
												onkeyup="checkByte(this, 4)"  onkeydown="<%=layerName%>EnterFilter('commcdValue');"> 
											</td>
											<th>통합코드값</th>
											<td>
												<input type="text" id="commcdValue" name="commcdValue" style="width:100%; text-align: left;"  title="통합코드값" 
												onkeyup="checkByte(this, 70)"  onkeydown="<%=layerName%>EnterFilter('sortOrd');"> 
											</td>
										</tr>
										<tr>
											<th>정렬순서</th>
											<td>
												<input type="text" id="sortOrd" name="sortOrd" style="width:100%; text-align: left;"  title="정렬순서" 
												onkeyup="removeChar(event); checkByte(this, 3)"  onkeydown="<%=layerName%>EnterFilter('useFg');"> 
											</td>
											<th>사용여부</th>
											<td>
												<select id="useFg" name="useFg" style="width:100%; text-align-last:center">
													<option value="1">사용</option>
													<option value="0">미사용</option>
												</select>
											</td>
										</tr>
									</table>

								</form>							
							</td>	
						</tr>
					</tbody>
				</table>

<script>
// 조회 클릭시
$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .search').click(function(){
	<%=layerName%>loadData();
});

//엑셀 다운로드
$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .exel').click(function(){
	<%=layerName%>exportTo();
});

// 닫기
$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .close').click(function(){
	mFnc.tabMenuClose('<%=layerName%>');
});

// 저장
$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .save').click(function(){
	<%=layerName%>fn_saveCode();
});

//신규
$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .new').click(function(){
	<%=layerName%>fn_newAll();
});

//엔터키 조회시
function <%=layerName%>fn_pressSys(e){ 
	if(event.keyCode == 13){ //javascript에서는 13이 enter키를 의미함 
		<%=layerName%>loadData ();
	}
}

//엔터키 이동
function <%=layerName%>EnterFilter(next) { 
	if (event.keyCode == 13) {
		$('.<%=layerName%> #'+next).focus();	
	}
}

//AUIGrid 생성 후 반환 ID
var <%=layerName%>myGridID;
var pgmList = [];
var <%=layerName%>columnLayout = [	
		{dataField : "commcdFg", headerText : "코드구분", width : "10%"},
		{dataField : "commcdFgNm", width:"30%", headerText : "구분명", style : "my-column-left"},
		{dataField : "commcd", headerText : "통합코드", width : "10%" },
		{dataField : "commcdValue", headerText : "통합코드값", width : "30%", style : "my-column-left" },
		{dataField : "sortOrd", headerText : "정렬순서", width : "10%", style : "my-column-right",
			editRenderer : {
				type : "InputEditRenderer",
				onlyNumeric : true, // Input 에서 숫자만 가능케 설정
				textAlign : "center", // 오른쪽 정렬로 입력되도록 설정
				maxlength : 5
			}
		},
		{dataField : "useFgNm", headerText : "사용여부", width : "10%"}
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

//AUIGrid 서비스장애를 생성합니다.
function <%=layerName%>loadData() {
	var sendData = {
			"schCommcd" : $("#schCommcd").val(),
			"schCommcdValue" : $("#schCommcdValue").val()
	};
	AUIGrid.showAjaxLoader(<%=layerName%>myGridID);
	GRIT.tran.send({
		url: "/sys/sysCodeMgmtList",
		sendData: sendData,
		success: function(data){
			// 그리드에 데이터 세팅
			AUIGrid.setGridData(<%=layerName%>myGridID, data.list);
			// 선택 체인지 이벤트 바인딩
			AUIGrid.bind(<%=layerName%>myGridID, "ready", <%=layerName%>auiGridCompleteHandler);
			// 폼에 셋팅
			if(data.list[0]) {
				<%=layerName%>setGrdToFrm(data.list[0]);
			} else { //데이터가 없는 경우
				$("#detailForm")[0].reset();
			}
			// 로더 제거
			AUIGrid.removeAjaxLoader(<%=layerName%>myGridID);
		},
		error: function(request, status, error){
			GRIT.msg.alert("공통코드를 조회하는데 문제가 발생했습니다.");
			// 로더 제거
			AUIGrid.removeAjaxLoader(<%=layerName%>myGridID);
		},
		loading : false
		
	});
}

function <%=layerName%>setGrdToFrm(data) {
	$(".<%=layerName%> #commcdFg, .<%=layerName%> #commcd").prop('disabled',true);
	$.each(data, function(key, value){ 
		if(key != "_$uid") $(".<%=layerName%> #"+key).val(value);
	});
}

// 신규
function <%=layerName%>fn_newAll() {
	if ( confirm ("신규로 입력 하시겠습니까?") ) {
		$(".<%=layerName%> #detailForm")[0].reset();
		$(".<%=layerName%> #commcdFg, .<%=layerName%> #commcd").prop('disabled',false);
		$(".<%=layerName%> #commcdFg").focus();
	}
}

function <%=layerName%>exportTo() {
	
	var excelList = AUIGrid.getGridData(<%=layerName%>myGridID);
	
	if(excelList.length == 0){
		GRIT.msg.alert("장애인 리스트에 조회된 내용이 없습니다.");
		return false;
	}
	AUIGrid.exportToXlsx(<%=layerName%>myGridID, {
		fileName : "통합코드",
		// 스타일 상태 유지 여부(기본값:true)
	});
}

//저장전 검사
function <%=layerName%>fn_saveCode(){
	if ( $(".<%=layerName%> #commcdFg").val() == "" ) {
		$(".<%=layerName%> #commcdFg").focus();
		GRIT.msg.alert("[코드구분]은 필수 항목입니다."); return;
	}
	if ( $(".<%=layerName%> #commcdFgNm").val() == "" ) {
		$(".<%=layerName%> #commcdFgNm").focus();
		GRIT.msg.alert("[구분명]은 필수 항목입니다."); return;
	}
	if ( $(".<%=layerName%> #commcd").val() == "" ) {
		$(".<%=layerName%> #commcd").focus();
		GRIT.msg.alert("[통합코드]는 필수 항목입니다."); return;
	}
	if ( $(".<%=layerName%> #commcdValue").val() == "" ) {
		$(".<%=layerName%> #commcdValue").focus();
		GRIT.msg.alert("[통합코드값]은 필수 항목입니다."); return;
	}
	if ( $(".<%=layerName%> #sortOrd").val() == "" ) {
		$(".<%=layerName%> #sortOrd").focus();
		GRIT.msg.alert("[정렬순서]는 필수 항목입니다."); return;
	}		
	
	if(confirm("저장 하시겠습니까?")){
		<%=layerName%>fn_save();
    } 
}
//저장
function <%=layerName%>fn_save(){
	
	$("#commcdFg, #commcd").removeAttr("disabled",false);
	var sendData = $(".<%=layerName%> form[name=detailForm]").serializeObject();
	$("#commcdFg, #commcd").attr("disabled",true);
	
     GRIT.tran.send({
		url: "/sys/sysCodeMgmtSave",
		async: false,
		sendData: sendData,
		success: function(result){
			if(result.result=="success") {
				alert("저장 되었습니다");
				<%=layerName%>loadData ();
			} else {
				alert("처리중 오류가 발생하였습니다");
			}
		},
			loadingTarget: "<%=layerName%>"
		}); 
}

// 페이지 로딩 되면 실행
$(function () {
	// AUIGrid 서비스 장애그리드를 생성합니다.
	<%=layerName%>createAUIGrid(<%=layerName%>columnLayout);
});
</script>				