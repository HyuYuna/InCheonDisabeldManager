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
.aui-grid-drop-list-item-wrapper{
	overflow-y : auto;
	min-height: 35px;
}
</style>
                <!-- titleWrap : start -->
                <div class="titleWrap">
                    <h1>프로그램 운영현황 등록</h1>
					<jsp:include page="../common/commonBtn.jsp">
						<jsp:param value="<%=layerName%>" name="layerName" />
					</jsp:include>                    
                </div>
                <!-- titleWrap : end -->
                
                <!-- conditionTable : start -->
                <form name="<%=layerName%>searchForm1" onsubmit="return false;" autocomplete='off'>
                <table class="dataTable marginT10">
                    <colgroup>
                        <col style="width:80px">
                        <col style="width:300px">
                        <col style="width:90px">
                        <col style="width:150px">
                        <col style="width:90px">
                        <col style="width:150px">
                        <col style="width:90px">
                        <col style="width:150px">
                        <col style="width:100px">
                        <col style="width:auto">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>기간</th>
                            <td>
								<input type="text" id="<%=layerName%>schFr" name="<%=layerName%>schFr" class="monthpicker" 
								title="" style="width:100px" maxlength="7" class="datepicker hover_disabled" 
								onkeypress="<%=layerName%>fn_pressSys(this.form); " 
								onblur="<%=layerName%>checksDate(this.value)" 
								onKeyup="<%=layerName%>inputYMDNumber(this);" />
								<span style="margin-left:30px;">~</span>
								<input type="text" id="<%=layerName%>schTo" name="<%=layerName%>schTo" class="monthpicker" 
								title="" style="width:100px; margin-left:5px;" maxlength="7"  
								onkeypress="<%=layerName%>fn_pressSys(this.form);" 
								onblur="<%=layerName%>checkeDate(this.value)" 
								onKeyup="<%=layerName%>inputYMDNumber(this);" />
                            </td>
                            <th>대분류</th>
                            <td>
                                <select id="schLclas" name="schLclas" style="width:140px;text-align-last : center" onchange="<%=layerName%>setMclas(this.value)">
                                	<option value="">전체</option>
									<c:if test="${!empty lclassList}">	
										<c:forEach var="list" items="${lclassList}">
										<option value="${list.lclasCd}">
											<c:out value="${list.lclasNm}" /></option>
										</c:forEach>
									</c:if>
                                </select>
                            </td>
                            <th>중분류</th>
                            <td>
                                <select id="schMclas" name="schMclas" style="width:140px; text-align-last : center" onchange="<%=layerName%>setSclas(this.value)">
                                	<option value="">전체</option>
                                </select>
                            </td>
                            <th>소분류</th>
                            <td>
                                <select id="schSclas" name="schSclas" style="width:140px; text-align-last : center">
                                	<option value="">전체</option>
                                </select>
                            </td>
                            <th>프로그램명</th>
                            <td>
								<input type="text" id="schProgramNm" name="schProgramNm" style="width:100%;" title="" onkeypress="<%=layerName%>fn_pressSys(this.form);" />
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
                                <div class="subtitle">프로그램 현황</div>

                                <!-- 2020-11-19 추가 : start -->
                                <div class="subBtnGroup">
                                    <button type="button" class="subBtn" onclick="addRow();"><img src="/resources/imagesV2/iconPlusBlue.png" class="subBtnImg">추가</button>
                                    <button type="button" class="subBtn" onclick="removeRow();"><img src="/resources/imagesV2/iconTrashBlue.png" class="subBtnImg">삭제</button>
                                </div>
                                <!-- 2020-11-19 추가 : end -->

                            </div>
							<div id="<%=layerName%>grid_wrap" style="height: 658px;"></div>
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
	<%=layerName%>fn_save();
});

//신규
$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .new').click(function(){
	AUIGrid.clearGridData(<%=layerName%>myGridID);
});

//엔터키 조회시
function <%=layerName%>fn_pressSys(e){ 
	if(event.keyCode == 13){ //javascript에서는 13이 enter키를 의미함 
		<%=layerName%>loadData ();
	}
}

//AUIGrid 생성 후 반환 ID
var <%=layerName%>myGridID;
var pgmList = [];
var <%=layerName%>columnLayout = [	
		{dataField : "ym", headerText : "년월", width : "9%", editable : true,
			dataType : "date",
			dateInputFormat : "yyyymm", // 실제 데이터의 형식 지정
			formatString : "yyyymm", // 실제 데이터 형식을 어떻게 표시할지 지정
			editRenderer : {
				type : "CalendarRenderer",
				defaultFormat : "yyyymm", // 달력 선택 시 데이터에 적용되는 날짜 형식
				showEditorBtnOver : true, // 마우스 오버 시 에디터버턴 출력 여부
				onlyMonthMode : true // 일 단위 달력이 아닌 월 단위 달력 출력
			}
		},
		{dataField : "programNm", width:"18%", headerText : "프로그램", colSpan:2, style:"my-column-nobdr",
			renderer : {
				type : "IconRenderer",
				iconWidth : 16, // icon 사이즈, 지정하지 않으면 rowHeight에 맞게 기본값 적용됨
				iconHeight : 16,
				iconPosition : "aisleRight",
				iconTableRef :  { // icon 값 참조할 테이블 레퍼런스
					"default" : "/resources/imagesV2/iconSearchGlass.png" // default
				}
			},
			editRenderer : {
				type : "RemoteListRenderer",
				//showEditorBtnOver : false, // 마우스 오버 시 에디터버턴 보이기
				fieldName : "programNm", // remoter 에서 가져온 데이터 중 실제 그리드에 적용시킬 필드명 (단순 배열이 아닌 경우 반드시 지정해야 함.)
				remoter : function( request, response ) { // remoter 지정 필수
					// 데이터 요청
					$.ajax({
						url: "/pgm/pgmMgmtGrid1",
						data : JSON.stringify({
							"linkCd" : ${linkCd},
							"searchLclasCd":"","searchMclasCd":"","searchSclasCd":"",
							"searchProgramNm" :request.term
							
						}),
						contentType : "application/json; charset=utf-8",
						type : "POST",
						dataType : "json",
						success: function(result) {
							pgmList = result.data;
							// 성공 시 완전한 배열 객체로 삽입하십시오.
							response(result.data); 
						}
					}); // end of ajax
				},
				listTemplateFunction : function(rowIndex, columnIndex, text, item, dataField, listItem) {
					var html = '<div class="myList-style">';
					html += '<span class="myList-col" style="width:120px;" title="' + listItem.programNm + '">' + listItem.programNm+ '</span>';
					html += '<span class="myList-col" style="width:200px;">' + listItem.lclasNm;
					html += ' > ' + listItem.mclasNm;
					html += ' > ' + listItem.sclasNm + '</span>';
					html += '<span class="myList-col" style="display:none;">' + listItem.programCd + '</span>';
					html += '</div>';
					return html;
				}
			}
		},
		{dataField : "programCd", editable : false, width : "15%" },
		{dataField : "sclasNm", editable : false, headerText : "소분류", width : "15%", style : "my-column-left"},
		{dataField : "operCnt", headerText : "운영횟수", width : "9%", style : "my-column-right",
			editRenderer : {
				type : "InputEditRenderer",
				onlyNumeric : true, // Input 에서 숫자만 가능케 설정
				textAlign : "right", // 오른쪽 정렬로 입력되도록 설정
				maxlength : 5
			}
		},
		{dataField : "partcptnNmpr", headerText : "참여인원", width : "9%", style : "my-column-right", 
			editRenderer : {
				type : "InputEditRenderer",
				onlyNumeric : true, // Input 에서 숫자만 가능케 설정
				textAlign : "right", // 오른쪽 정렬로 입력되도록 설정
				maxlength : 5
			}
		},
		{dataField : "note", headerText : "비고", width : "*", style : "my-column-left",
			editRenderer : {
				type : "InputEditRenderer",
				textAlign : "left",
				maxlength : 50
			}
		},
   ];

//AUIGrid 서비스장애를 생성합니다.
function <%=layerName%>createAUIGrid(columnLayout) {
	var <%=layerName%>auiGridProps = {
		softRemoveRowMode : false,
		editable : true,
		rowHeight : 38,
		headerHeight : 38,
		selectionMode : "multipleCells",
		noDataMessage : "조회된 내용이 없습니다."
	};
	// 실제로 #grid_wrap 에 그리드 생성
	<%=layerName%>myGridID = AUIGrid.create("#<%=layerName%>grid_wrap", <%=layerName%>columnLayout, <%=layerName%>auiGridProps);
	// 선택 체인지 이벤트 바인딩
	AUIGrid.bind(<%=layerName%>myGridID, "selectionChange", function(event) {
		var primeCell = event.primeCell; // 선택 대표 셀
		var item = primeCell.item; // 행 정보
		$(".<%=layerName%> #rowIndex").val(primeCell.rowIndex);
	});
	
	// 에디팅 정상 종료 이벤트 바인딩
	AUIGrid.bind(<%=layerName%>myGridID, "cellEditEnd", auiCellEditHandler);
	
	// 에디팅 취소 이벤트 바인딩
	AUIGrid.bind(<%=layerName%>myGridID, "cellEditCancel", auiCellEditHandler);
	
	// 행추가 후 값 셋팅
	AUIGrid.bind(<%=layerName%>myGridID, "addRowFinish", function( event ) {
		//row 생성시 년월 값을 자동으로 셋팅하면 전송시 null 로 처리됨
		/*var now = new Date();
		var today = new Date(now.getFullYear(), now.getMonth());
		AUIGrid.updateRow(<%=layerName%>myGridID, {
			ym : today
		}, event.rowIndex);*/
	});
	
	// 에디팅 시작 이벤트 바인딩
	AUIGrid.bind(<%=layerName%>myGridID, "cellEditBegin", function(event) {
		// rowIdField 설정 값 얻기
		var rowIdField = AUIGrid.getProp(event.pid, "rowIdField");
		
		if(event.dataField == "ym" || event.dataField=="programNm") {
			// 추가된 행 아이템인지 조사하여 추가된 행인 경우만 에디팅 진입 허용
			if(AUIGrid.isAddedById(event.pid, event.item[rowIdField])) {
				return true; 
			} else {
				return false; // false 반환하면 기본 행위 안함(즉, cellEditBegin 의 기본행위는 에디팅 진입임)
			}
		}
		return true; // 다른 필드들은 편집 허용
	});
	
	// 행추가 이벤트 바인딩
	//AUIGrid.bind(<%=layerName%>myGridID, "addRowFinish", auiAddRowHandler);
	
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
	if($("#<%=layerName%>schFr").val() == ""){
		setTimeout(function(){
			GRIT.msg.alert("기간 시작일을 입력해주세요");
		},50);
		return;
	}
	
	if($("#<%=layerName%>schTo").val() == ""){
		setTimeout(function(){
			GRIT.msg.alert("기간 종료일을 입력해주세요");
		},50);
		return;
	}
	
	if(!GRIT.date.compareDateFT($("#<%=layerName%>schFr").val(), $("#<%=layerName%>schTo").val())){
		GRIT.msg.alert('기간 날짜 시작일이 종료일보다 날짜가 더 빠릅니다. 조회조건중 기간 날짜를 수정 후 조회해주시길 바랍니다.');
		return false;
	}
	
	var sendData = {
			"schFr" : $("#<%=layerName%>schFr").val(),
			"schTo" : $("#<%=layerName%>schTo").val(),
			"schLclasCd" : $(".<%=layerName%> #schLclas option:selected").val(),
			"schMclasCd" : $(".<%=layerName%> #schMclas option:selected").val(),
			"schSclasCd" : $(".<%=layerName%> #schSclas option:selected").val(),
			"schProgramNm" : $(".<%=layerName%> #schProgramNm").val()
	};
	AUIGrid.showAjaxLoader(<%=layerName%>myGridID);
	GRIT.tran.send({
		url: "/pgm/pgmOpStsRegList",
		sendData: sendData,
		success: function(data){
			// 그리드에 데이터 세팅
			AUIGrid.setGridData(<%=layerName%>myGridID, data.list);
			// 선택 체인지 이벤트 바인딩
			AUIGrid.bind(<%=layerName%>myGridID, "ready", <%=layerName%>auiGridCompleteHandler);
			// 로더 제거
			AUIGrid.removeAjaxLoader(<%=layerName%>myGridID);
		},
		error: function(request, status, error){
			GRIT.msg.alert("운영현황 목록을 조회하는데 문제가 발생했습니다.");
			// 로더 제거
			AUIGrid.removeAjaxLoader(<%=layerName%>myGridID);
		},
		loading : false
		
	});
}

//아이템 반환.
function getPgmList(programNm) {
	var item;
	$.each(pgmList, function(n, v) {
		if(v.programNm == programNm) {
			item = v;
			return false;
		}
	});
	return item;
};   

//편집 핸들러
function auiCellEditHandler(event) {

	switch(event.type) {
	case "cellEditEnd" :
		if(event.dataField == "programNm") {
			
			var pgmItem = getPgmList(event.value);
			console.log(pgmItem);
			if(typeof pgmItem === "undefined") {
				return;
			}
			AUIGrid.updateRow(<%=layerName%>myGridID, {
				programCd : pgmItem.programCd,
				sclasNm : pgmItem.sclasNm
			}, event.rowIndex);
		}
		break;
	case "cellEditCancel" :
		if(event.dataField == "programNm") {
			if(typeof event.item.programNm == "undefined" || event.item.programNm == "") {
				AUIGrid.removeRow(<%=layerName%>myGridID, event.rowIndex);
			}
		}
		break;
	}
};



var cnt = 0;
//행 추가, 삽입
function addRow() {
	
	var rowPos = "last"; //first,last
	
	var item = new Object();
	item.ym = "",
	item.programNm = "",
	item.programCd = "",
	item.sclasNm = "",
	item.operCnt = "",
	item.partcptnNmpr = "",
	item.note = ""

	// parameter
	// item : 삽입하고자 하는 아이템 Object 또는 배열(배열인 경우 다수가 삽입됨)
	// rowPos : rowIndex 인 경우 해당 index 에 삽입, first : 최상단, last : 최하단, selectionUp : 선택된 곳 위, selectionDown : 선택된 곳 아래
	AUIGrid.addRow(<%=layerName%>myGridID, item, rowPos);

};

//addRowFinish 이벤트 핸들링
/*
function auiAddRowHandler(event) {
	// 행 추가 시 추가된 행에 선택자가 이동합니다.
	// 이 때 칼럼은 기존 칼럼 그래도 유지한채 이동함.
	// 원하는 칼럼으로 선택자를 보내 강제로 편집기(inputer) 를 열기 위한 코드
	var selected = AUIGrid.getSelectedIndex(<%=layerName%>myGridID);
	if(selected.length <= 0) {
		return;
	}
	
	var rowIndex = selected[0];
	var colIndex = AUIGrid.getColumnIndexByDataField(<%=layerName%>myGridID, "programNm");
	AUIGrid.setSelectionByIndex(<%=layerName%>myGridID, rowIndex, colIndex); // ISBN 으로 선택자 이동

	// 빈행 추가 후 isbn 에 인푸터 열기
	AUIGrid.openInputer(<%=layerName%>myGridID);
};*/

//행 삭제
function removeRow() {	
	AUIGrid.removeRow(<%=layerName%>myGridID, "selectedIndex");
};

//그리드 팝업
/* 레이어 조회로 변경되어 사용하지 않음
function <%=layerName%>fn_schPgmPop(rowIndex) {
	 var layerName = "<%=layerName%>"; 
	 var url = "<c:url value='/pop/searchPgmPop?layerName="+layerName+"&rowIndex="+rowIndex+"'/>";
	 var width="700";
	 var height="540";
	 popitup(url, height, width, name);
}

//팝업창콜백 분류
function <%=layerName%>setSchPop(item,rowIndex) {
	console.log(item);	
	console.log(rowIndex);	
	$programCd = item.programCd;
	console.log($programCd);
}
*/

//저장
function <%=layerName%>fn_save(){
	
	//프로그램이 지정되지 않은 신규행 검사 필요
	var isValid = AUIGrid.validateGridData(<%=layerName%>myGridID, ["ym", "programNm", "programCd", "sclasNm","operCnt","partcptnNmpr"], "필수 필드는 반드시 값을 직접 입력해야 합니다.");
	
	if(isValid) {
		// 추가된 행 아이템들(배열)
		var addedRowItems = AUIGrid.getAddedRowItems(<%=layerName%>myGridID);

		// 수정된 행 아이템들(배열)
		var editedRowItems = AUIGrid.getEditedRowItems(<%=layerName%>myGridID); 

		// 수정된 행 아이템들(배열) - 진짜 수정될 필드만 갖고 있음.
		// 예를들어 칼럼이 총 10개 있다고 했을 때 그 중 2개 칼럼만 수정했다면 해당 2개 칼럼만을 반환합니다.
		//var editedRowItems = AUIGrid.getEditedRowColumnItems(myGridID);
			
		// 삭제된 행 아이템들(배열)
		var removedRowItems = AUIGrid.getRemovedItems(<%=layerName%>myGridID);

		if(addedRowItems.length==0 && editedRowItems==0 && removedRowItems==0) {
			setTimeout(function(){
				GRIT.msg.alert("데이터 변경이 없습니다");
			},50);
			return false;
		}
		alert(AUIGrid.getRemovedColumnFields(<%=layerName%>myGridID));
		// 서버로 보낼 데이터 작성
		var data = {
			"add" : addedRowItems,
			"edt" : editedRowItems,
			"rmv" : removedRowItems,
		};
		
		//console.log(data);
		//return false;
		
	     GRIT.tran.send({
			url: "/pgm/pgmOpStsRegSave",
			async: false,
			sendData: data,
			success: function(result){
				if(result.result == "dupl"){
					setTimeout(function(){
						GRIT.msg.alert("동일 년월에 프로그램을 중복 등록할 수 없습니다");
					},50);
				} else if(result.result == "success"){
					setTimeout(function(){
						GRIT.msg.alert("저장되었습니다");
					},50);
					<%=layerName%>loadData ();
				}else{
					//중복등록 검사 추가 필요
					setTimeout(function(){
						GRIT.msg.alert("저장중 문제가 발생하였습니다");
					},50);
				}
			},
			loadingTarget: "<%=layerName%>"
		}); 
	}

}

//조회조건 대분류코드로 중분류코드 셋팅
function <%=layerName%>setMclas(val){
	var sendData = {"lclasCd"   : val};
	 GRIT.tran.send({
		url: "/pgm/selectMclaCdList",
		async: false,
		sendData: sendData,
		success: function(result){
			//중분류 코드 셀렉트 박스 초기화
			$('.<%=layerName%> #schMclas option').remove();
			$('.<%=layerName%> #schMclas').append("<option value=''>전체</option>");
			//소분류코드 셀렉트 박스 초기화
			$('.<%=layerName%> #schSclas option').remove();
			$('.<%=layerName%> #schSclas').append("<option value=''>전체</option>");
			if(val != ""){
				for(var i=0; i<result.data.length; i++){
					$('.<%=layerName%> #schMclas').append("<option value="+result.data[i].mclasCd+"> "+result.data[i].mclasNm+ "</option>");	
				}
			}
		},
			loadingTarget: "<%=layerName%>"
		});  
}

// 조회조건 중분류코드로 소분류코드 셋팅
function <%=layerName%>setSclas(val){
	var sendData = {"mclasCd"   : val};
	 GRIT.tran.send({
		url: "/pgm/selectSclaCdList",
		async: false,
		sendData: sendData,
		success: function(result){
			$('.<%=layerName%> #schSclas option').remove();
			$('.<%=layerName%> #schSclas').append("<option value=''>전체</option>");
			
			if(val != ""){
				for(var i=0; i<result.data.length; i++){
					$('.<%=layerName%> #schSclas').append("<option value="+result.data[i].sclasCd+"> "+result.data[i].sclasNm+ "</option>");	
				}
			}
		},
			loadingTarget: "<%=layerName%>"
		});  
}

//엑셀 내보내기(Export);
function <%=layerName%>exportTo() {
	
	var excelList = AUIGrid.getGridData(<%=layerName%>myGridID);
	
	if(excelList.length == 0){
		setTimeout(function(){
			GRIT.msg.alert("프로그램 운영현황 등록 리스트 조회된 내용이 없습니다.");
		},50);
		return false;
	}
	
	AUIGrid.exportToXlsx(<%=layerName%>myGridID, {
		fileName : "프로그램_운영현황_등록",
		// 스타일 상태 유지 여부(기본값:true)
	});
}

function <%=layerName%>checksDate(obj){
	
	var yyyymmdd = obj.replace(/\-/g,'');
	
	if(!GRIT.date.isValidDate(yyyymmdd)){
		setTimeout(function(){
			GRIT.msg.alert("날짜형식이 잘못되었습니다.");
		},50);
		$(".<%=layerName%> #<%=layerName%>schFr").val("");
		$(".<%=layerName%> #<%=layerName%>schFr").focus();
		}
	}

function <%=layerName%>checkeDate(obj){
	var yyyymmdd = obj.replace(/\-/g,'');
	if(!GRIT.date.isValidDate(yyyymmdd)){
		setTimeout(function(){
			GRIT.msg.alert("날짜형식이 잘못되었습니다.");
		},50);
		$(".<%=layerName%> #<%=layerName%>schTo").val("");
		$(".<%=layerName%> #<%=layerName%>schTo").focus();
	}
}
	
//날짜 자동 하이픈(-) 함수
function <%=layerName%>inputYMDNumber(obj) {
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
            }
            obj.value = ymd;
        } else {
            alert("숫자 이외의 값은 입력하실 수 없습니다.");
            //@see 숫자와 하이픈(-)기호 이외의 모든 값은 삭제한다.
            obj.value = obj.value.replace(/[^0-9 ^\-]/g,"");
            return false;
        }
    } else {
        return false;
    }
}
//페이지 로딩 되면 실행
$(function () {
	$(".<%=layerName%> .monthpicker").monthpicker({
    	monthNames: ['1월', '2월', '3월', '4월', '5월', '6월',
	                    '7월', '8월', '9월', '10월', '11월', '12월'],
	                monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	                showOn: "button",
	                buttonImage: "/resources/images/btn_cal.png",
	                buttonImageOnly: true,
	                changeYear: false,
	                yearRange: 'c-2:c+2',
	                dateFormat: 'yy-mm'
});
	// AUIGrid 서비스 장애그리드를 생성합니다.
	<%=layerName%>createAUIGrid(<%=layerName%>columnLayout);
	
	var date = new Date();
    var year = date.getFullYear();
    var month = date.getMonth()+1
    var day = date.getDate();
    if(month < 10){
        month = "0"+month;
    }
    
    if(day < 10){
        day = "0"+day;
    }
    
    var todayMonth1 = year+"-"+month;
    var todayMonth = year+"-"+month;
    
    $(".<%=layerName%> #<%=layerName%>schFr").val(todayMonth1);
	$(".<%=layerName%> #<%=layerName%>schTo").val(todayMonth);

});
</script>				