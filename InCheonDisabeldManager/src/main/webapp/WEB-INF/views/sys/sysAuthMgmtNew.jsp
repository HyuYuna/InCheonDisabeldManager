<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String layerName = request.getParameter("layerName");
%>
<style type="text/css">
	/* 커스텀 스타일 */
	.left {
		text-align:left;
	}
</style>

<div class="section-top">

	<jsp:include page="../common/commonBtn.jsp">
		<jsp:param value="<%=layerName %>" name="layerName"/>
	</jsp:include>

</div>

<!-- section : 업무영역(스크롤 되는 부분) -->
<div class="section">
	<div class="horizon-fix full-height fl-l" style="width:320px;height:700px;">
		<div class="box-top">
			<span class="sub-tit">권한 그룹</span>
		</div>

		<div class="box-wrap vertical-fix mb10">
			<div class="box-con">

				<form name="<%=layerName%>inputForm">
					<input type="hidden" id="rowIndex" name="rowIndex"/>
					<input type="hidden" id="newGb" name="newGb"/>
					
					<table class="tb01 tb-l-fixed">
						<caption></caption>
						<colgroup>
							<col width="90px">
							<col width="">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row" class="no-bg">그룹명</th>
								<td>
									<input type="text" id="grpNm" name="grpNm" class="autoBind"/>
								</td>
							</tr>
							<tr>
								<th scope="row" class="no-bg">그룹코드</th>
								<td>
									<input type="text" id="grpCd" name="grpCd" class="autoBind" style="width:80px;" maxlength="2" readonly/>
								</td>
							</tr>
							<tr>
								<th scope="row" class="no-bg">그룹구분</th>
								<td>
									<select id="grpFgCd" name="grpFgCd" class="autoBind"></select>
								</td>
							</tr>
						</tbody>
					</table>

				</form>

			</div>
		</div>

		<div class="box-wrap">
			<div id="<%=layerName%>grid_wrap" style="height:600px;"></div>
		</div>
	</div>
	<!-- //section-half fixed exp -->

	<div class="horizon-resize full-height fl-r" style="width:1300px;height:800px;">
		<div class="box-top">
			<span class="sub-tit">권한그룹리스트</span>
		</div>

		<div class="box-wrap">
			<div id="<%=layerName%>grid_wrap2"  style="height:710px;"></div>
		</div>
	</div>

	<div class="clear"></div>
</div>
<!-- //section : 업무역영 -->
<script type="text/javascript">

//조회 클릭시
$('.content .section-wrap .boxcontent.<%=layerName%> .section-top .btn-group a.search').click(function(){
	<%=layerName%>goSearch();
});

//신규 권한 추가
$('.content .section-wrap .boxcontent.<%=layerName%> .section-top .btn-group a.new').click(function(){
	$(".<%=layerName%> #newGb").val("I");
	
	var formObj = $("form[name='<%=layerName%>inputForm']");
	$("input[name='grpCd']", formObj).val("");
	$("input[name='grpCd']", formObj).removeAttr("readonly");

	$("input[name='grpNm']", formObj).val("");
	$("select[name='grpFgCd']", formObj).val("3");
	
	AUIGrid.setGridData(<%=layerName%>myGridID2, []);
});

//저장
$('.content .section-wrap .boxcontent.<%=layerName%> .section-top .btn-group a.save').click(function(){
	var newGb = $(".<%=layerName%> #newGb").val();
	
	// 업데이트할 필드와 값 설정
	var item = new Object();
	item.grpCd = $(".<%=layerName%> #grpCd").val();
	item.grpNm = $(".<%=layerName%> #grpNm").val();
	<%-- item.grpFgCdView = $(".<%=layerName%> #grpFgCd option:selected").text(); --%>
	item.grpFgCd = $(".<%=layerName%> #grpFgCd").val();
	
	if (newGb == "I"){
		AUIGrid.addRow(<%=layerName%>myGridID, item, "first");
	}else{
		// 지정한 item 을 현재행(selectedIndex)에 업데이트함.
		AUIGrid.updateRow(<%=layerName%>myGridID, item, "selectedIndex");	
	}
	
	//////////////////////////////////////////////////////////////////////////
	
	// 추가된 행 아이템들(배열)
	var addedRowItems = AUIGrid.getAddedRowItems(<%=layerName%>myGridID);
	 
	// 수정된 행 아이템들(배열) : 수정된 필드와 수정안된 필드 모두를 얻음.
	var editedRowItems = AUIGrid.getEditedRowItems(<%=layerName%>myGridID);
	var editedRowItems2 = AUIGrid.getEditedRowItems(<%=layerName%>myGridID2);
	
	// 수정된 행의 진짜 수정된 칼럼들 (배열)
	var editedCells = AUIGrid.getEditedRowColumnItems(<%=layerName%>myGridID); 
	
	//등록 merge
	if (newGb == "I"){
		if(addedRowItems.length > 0) {
			var changeDataObj = [];
			for(i=0, len=addedRowItems.length; i<len; i++) {
				changeDataObj.push(addedRowItems[i]); // 행아이템
			}
			
			var sendData = changeDataObj;
			
		    GRIT.tran.send({
				url: "/sys/updateSysAuthMgmt",
				sendData: sendData,
				success: function(result){
					if(result.rtnCode == "0"){
						$(".<%=layerName%> #newGb").val("");
					 	GRIT.msg.alert("그룹코드를 저장하였습니다.");
				  		<%=layerName%>goSearch();
				  	}
				}
			});
		}
	}else{
		//수정
		if(editedCells.length > 0) {
			if(editedRowItems.length > 0) {
				var changeDataObj = [];
				for(i=0, len=editedRowItems.length; i<len; i++) {
					changeDataObj.push(editedRowItems[i]); // 행아이템
				}
				
				var sendData = changeDataObj;
				
			    GRIT.tran.send({
					url: "/sys/updateSysAuthMgmt",
					sendData: sendData,
					success: function(result){
						if(result.rtnCode == "0"){
						 	GRIT.msg.alert("그룹코드를 저장하였습니다.");
					 		<%=layerName%>goSearch();
					  	}
					}
				});
			}
		}
		
		//권한그룹 상세수정
		if(editedRowItems2.length > 0) {
			
			var changeDataObj = [];
			for(i=0, len=editedRowItems2.length; i<len; i++) {
				changeDataObj.push(editedRowItems2[i]); // 행아이템
			}
			
			var sendData = changeDataObj;
			//alert(JSON.stringify(sendData));
		    GRIT.tran.send({
				url: "/sys/updateSysAuthMgmt2",
				sendData: sendData,
				success: function(result){
					if(result.rtnCode == "0"){
					 	GRIT.msg.alert("저장하였습니다.");
				 		<%=layerName%>goSearch();
				  	}
				}
			});
		}
	}
});

//권한그룹 삭제
$('.content .section-wrap .boxcontent.<%=layerName%> .section-top .btn-group a.delete').click(function(){
	AUIGrid.removeRow(<%=layerName%>myGridID, "selectedIndex");
	
	// 삭제된 행 아이템들(배열)
	var removedRowItems = AUIGrid.getRemovedItems(<%=layerName%>myGridID);
	
	if(removedRowItems.length > 0) {
		var changeDataObj = [];
		for(i=0, len=removedRowItems.length; i<len; i++) {
			changeDataObj.push(removedRowItems[i]); // 행아이템
		}

		var strData = JSON.stringify(removedRowItems[0]);
		var parsData = JSON.parse(strData);
		
		//alert(parsData.grpCd);
		if (confirm("그룹코드 '"+ parsData.grpCd +"' 를 삭제하시겠습니까?")==true){
			var sendData = changeDataObj;
			
			GRIT.tran.send({
				url: "/sys/deleteSysAuthMgmt",
				sendData: sendData,
				success: function(result){
					if(result.rtnCode == "0"){
						$(".<%=layerName%> #newGb").val("");
					 	GRIT.msg.alert("그룹코드를 삭제하였습니다.");
				  		<%=layerName%>goSearch();
				  	}
				}
			});
		}else{
			AUIGrid.restoreSoftRows(<%=layerName%>myGridID, "selectedIndex");
		}
	}else{
		GRIT.msg.alert("삭제할 그룹코드를 선택하여 주세요.");
		return;
	}
	
	<%-- 

	var grpCd = <%=layerName%>Fc.gridRoot.getItemFieldAt(selectedIndex, "grpCd");
	var grpNm = <%=layerName%>Fc.gridRoot.getItemFieldAt(selectedIndex, "grpNm");

	var userCnt = <%=layerName%>Js.goSearch3(grpCd);

	if(userCnt != "0"){
		GRIT.msg.alert("해당 권한정보['" + grpNm + "']를 가진 사용자가 존재합니다.");
		return;
	}

	GRIT.msg.confirm("그룹코드 '" + grpCd +"' 를 삭제하시겠습니까?", <%=layerName%>Js.confirmCallback); --%>
	
});

//닫기
$('.content .section-wrap .boxcontent.<%=layerName%> .section-top .btn-group a.close').click(function(){
	mFnc.tabMenuClose('<%=layerName%>');
});

//AUIGrid 생성 후 반환 ID
var <%=layerName%>myGridID;
var <%=layerName%>myGridID2;

//AUIGrid 칼럼 설정
var <%=layerName%>columnLayout = [ 
     {dataField : "grpCd",headerText : "그룹코드",width : 70} 
    ,{dataField : "grpNm",headerText : "그룹명",width : 100}
    ,{dataField : "grpFgNm",headerText : "그룹구분",width : 80}
    ];

var <%=layerName%>columnLayout2 = [ 
    {dataField : "menuNm",headerText : "메뉴명",style : "left",width : 200,
   	renderer : {
		type : "IconRenderer",
		iconPosition:"aisle",
		iconWidth : 12, // icon 사이즈, 지정하지 않으면 rowHeight에 맞게 기본값 적용됨
		iconHeight : 12,
		iconFunction : function(rowIndex, columnIndex, value, item) {
			//alert(JSON.stringify(item));
			switch(item.pMenuCd) {
			case "000000":
				return "/resources/images/FolderOpen.png";
			default:
				return "/resources/images/Node.png";
			}
		} // end of iconFunction
	}} 
   ,{dataField : "menuCd",headerText : "메뉴코드",width : 100}
   ,{dataField : "inqAuthYn",headerText : "조회",width : 100,
	headerRenderer : {
		type : "CheckBoxHeaderRenderer",
		dependentMode : true, 		
		position : "right"
	},
	renderer : {
		type : "CheckBoxEditRenderer",
		showLabel : false, // 참, 거짓 텍스트 출력여부( 기본값 false )
		editable : true, // 체크박스 편집 활성화 여부(기본값 : false)
		checkValue : 1, // true, false 인 경우가 기본
		unCheckValue : 0,
		
		// 체크박스 Visible 함수
		visibleFunction : function(rowIndex, columnIndex, value, isChecked, item, dataField) {
			if(item.pMenuCd == "000000")
				return false; // 000000 인 대메뉴인 경우 체크박스 표시 안함.
			return true;
		}
	}}
   ,{dataField : "newAuthYn",headerText : "신규",width : 100,
		headerRenderer : {
			type : "CheckBoxHeaderRenderer",
			dependentMode : true, 		
			position : "right"
		},
		renderer : {
			type : "CheckBoxEditRenderer",
			showLabel : false, // 참, 거짓 텍스트 출력여부( 기본값 false )
			editable : true, // 체크박스 편집 활성화 여부(기본값 : false)
			checkValue : 1, // true, false 인 경우가 기본
			unCheckValue : 0,
			
			// 체크박스 Visible 함수
			visibleFunction : function(rowIndex, columnIndex, value, isChecked, item, dataField) {
				if(item.pMenuCd == "000000")
					return false; // 000000 인 대메뉴인 경우 체크박스 표시 안함.
				return true;
			}
		}}
   ,{dataField : "savAuthYn",headerText : "저장",width : 100,
		headerRenderer : {
			type : "CheckBoxHeaderRenderer",
			dependentMode : true, 		
			position : "right"
		},
		renderer : {
			type : "CheckBoxEditRenderer",
			showLabel : false, // 참, 거짓 텍스트 출력여부( 기본값 false )
			editable : true, // 체크박스 편집 활성화 여부(기본값 : false)
			checkValue : 1, // true, false 인 경우가 기본
			unCheckValue : 0,
			
			// 체크박스 Visible 함수
			visibleFunction : function(rowIndex, columnIndex, value, isChecked, item, dataField) {
				if(item.pMenuCd == "000000")
					return false; // 000000 인 대메뉴인 경우 체크박스 표시 안함.
				return true;
			}
		}}
   ,{dataField : "delAuthYn",headerText : "삭제",width : 100,
		headerRenderer : {
			type : "CheckBoxHeaderRenderer",
			dependentMode : true, 		
			position : "right"
		},
		renderer : {
			type : "CheckBoxEditRenderer",
			showLabel : false, // 참, 거짓 텍스트 출력여부( 기본값 false )
			editable : true, // 체크박스 편집 활성화 여부(기본값 : false)
			checkValue : 1, // true, false 인 경우가 기본
			unCheckValue : 0,
			
			// 체크박스 Visible 함수
			visibleFunction : function(rowIndex, columnIndex, value, isChecked, item, dataField) {
				if(item.pMenuCd == "000000")
					return false; // 000000 인 대메뉴인 경우 체크박스 표시 안함.
				return true;
			}
		}}
   ,{dataField : "exlAuthYn",headerText : "엑셀",width : 100,
		headerRenderer : {
			type : "CheckBoxHeaderRenderer",
			dependentMode : true, 		
			position : "right"
		},
		renderer : {
			type : "CheckBoxEditRenderer",
			showLabel : false, // 참, 거짓 텍스트 출력여부( 기본값 false )
			editable : true, // 체크박스 편집 활성화 여부(기본값 : false)
			checkValue : 1, // true, false 인 경우가 기본
			unCheckValue : 0,
			
			// 체크박스 Visible 함수
			visibleFunction : function(rowIndex, columnIndex, value, isChecked, item, dataField) {
				if(item.pMenuCd == "000000")
					return false; // 000000 인 대메뉴인 경우 체크박스 표시 안함.
				return true;
			}
		}}
   ];

// 페이지 로딩 되면 실행
$(document).ready(function() {
	// AUIGrid 그리드를 생성합니다.
	<%=layerName%>createAUIGrid(<%=layerName%>columnLayout);
	<%=layerName%>createAUIGrid2(<%=layerName%>columnLayout2);
	
	GRIT.util.initComboBoxCmmTR("form[name='<%=layerName%>inputForm'] select[name='grpFgCd']", 'GRP000', 'cd', 'cdNm', '', '0');
});

//AUIGrid 를 생성합니다.
function <%=layerName%>createAUIGrid(columnLayout) {
	var <%=layerName%>auiGridProps = {
			showRowCheckColumn : false
	};
	
	// 실제로 #grid_wrap 에 그리드 생성
	<%=layerName%>myGridID = AUIGrid.create("#<%=layerName%>grid_wrap", columnLayout, <%=layerName%>auiGridProps);
	
	// 선택 체인지 이벤트 바인딩
	AUIGrid.bind(<%=layerName%>myGridID, "selectionChange", function(event) {
		var primeCell = event.primeCell; // 선택 대표 셀
		var item = primeCell.item; // 행 정보
		var grpCd = primeCell.item.grpCd; // 분류코드
		$(".<%=layerName%> #rowIndex").val(primeCell.rowIndex);
		
		$(".<%=layerName%> #newGb").val("");
		//분류코드정보 설정
		<%=layerName%>setFieldToFormWindow(primeCell, item);
		
		//분류코드 상세정보
		<%=layerName%>goSearch2 (grpCd);
	});

	// 그리드 ready 이벤트 바인딩
	AUIGrid.bind(<%=layerName%>myGridID, "ready", auiGridCompleteHandler);
}

//그리드 ready 이벤트 핸들러
function auiGridCompleteHandler(event) {
	var rowIndex = $(".<%=layerName%> #rowIndex").val();

	if (rowIndex != ""){
		AUIGrid.setSelectionByIndex(<%=layerName%>myGridID, rowIndex); // 선택한 셀 선택되도록 지정
	}else{
		AUIGrid.setSelectionByIndex(<%=layerName%>myGridID, 0, 0); // 첫번째 셀 선택되도록 지정
	}
};

function <%=layerName%>createAUIGrid2(columnLayout) {
	var <%=layerName%>auiGridProps = {
		showRowCheckColumn : false
	};
	
	// 실제로 #grid_wrap 에 그리드 생성
	<%=layerName%>myGridID2 = AUIGrid.create("#<%=layerName%>grid_wrap2", columnLayout, <%=layerName%>auiGridProps);
	
}

//셀 셀렉션 변경 시 아이템의 정보를 Form 필드에 세팅함
function <%=layerName%>setFieldToFormWindow(primeCell, item) {
	$(".<%=layerName%> #grpNm").val(item.grpNm);
	$(".<%=layerName%> #grpCd").val(item.grpCd);
	$(".<%=layerName%> #grpFgCd").val(item.grpFgCd);
}

//조회
function <%=layerName%>goSearch () {	
	$(".<%=layerName%> #newGb").val("");
	
	// ajax 요청 전 그리드에 로더 표시
	AUIGrid.showAjaxLoader(<%=layerName%>myGridID);
	
	GRIT.tran.send({
		url: "/sys/searchSysAuthMgmt",
		success: function(result){
			if(result.data == ''){
				GRIT.msg.alert("조회 조건에 맞는 데이터가 없습니다.");
			}else{
				// resData 는 JSON 을 파싱한 Array-Object 입니다.
				AUIGrid.setGridData(<%=layerName%>myGridID, result.data);
				//alert(JSON.stringify(result.data));
				//var gridData =  AUIGrid.getGridData(myGridID); 
				//var rowCount = gridData.length; //전체 조회수
				
				AUIGrid.setGridData(<%=layerName%>myGridID2, []);
				
			}
			
			// 로더 제거
			AUIGrid.removeAjaxLoader(<%=layerName%>myGridID);
		},
		error: function(request, status, error){
			GRIT.msg.alert("권한그룹을 조회하는데 문제가 발생했습니다.");
			// 로더 제거
			AUIGrid.removeAjaxLoader(<%=layerName%>myGridID);
		}
	});
}

//권한상세조회
function <%=layerName%>goSearch2 (grpCd) {	
	var sendData = {grpCd : grpCd};
	
	// ajax 요청 전 그리드에 로더 표시
	AUIGrid.showAjaxLoader(<%=layerName%>myGridID2);
	
	GRIT.tran.send({
		url: "/sys/searchSysAuthMgmt2",
		sendData: sendData,
		success: function(result){
			if(result.data == ''){
				GRIT.msg.alert("조회 조건에 맞는 데이터가 없습니다.");
			}else{
				AUIGrid.setGridData(<%=layerName%>myGridID2, result.data);
			}
			// 로더 제거
			AUIGrid.removeAjaxLoader(<%=layerName%>myGridID2);
			
		},
		error: function(request, status, error){
			GRIT.msg.alert("권한상세를 조회하는데 문제가 발생했습니다.");
			// 로더 제거
			AUIGrid.removeAjaxLoader(<%=layerName%>myGridID2);
		}
	});
}



</script>

