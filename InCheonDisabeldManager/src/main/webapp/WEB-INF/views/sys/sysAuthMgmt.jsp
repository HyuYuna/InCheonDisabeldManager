<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String layerName = request.getParameter("layerName");
%>

 				<!-- titleWrap : start -->
                <div class="titleWrap">
                    <h1>그룹별 프로그램 권한</h1>
					<jsp:include page="../common/commonBtn.jsp">
						<jsp:param value="<%=layerName%>" name="layerName" />
					</jsp:include>                    
                </div>
                <!-- titleWrap : end -->
            

                <!-- layout table : start -->
                <table class="layoutTable">
                    <colgroup>
                        <!-- <col style="width:450px;"> -->
                        <col style="width:460px;">
                        <col style="width:10px;">
                        <col style="width:*;">
                    </colgroup>
                    <tr>
                        <td>
                            <div class="subtitleGroup">
                                <div class="subtitle">권한 그룹 리스트</div>
                                <div class="subBtnGroup">
                                </div>
                            </div>
                            <form name="<%=layerName%>sysAuthInfo" onsubmit="return false;" autocomplete='off'>
                            	<input type="hidden" id="rowIndex" name="rowIndex"/>
			                <table class="dataTable marginT10">
			                    <colgroup>
			                        <col style="width:12%">
			                        <col style="width:21%">
			                        <col style="width:12%">
			                        <col style="width:21%">
			                        <col style="width:12%">
			                        <col style="width:21%">
			                    </colgroup>
			                    <tbody>
			                    	<tr>
			                            <th>그룹명</th>
			                            <td>
			                            	<input type="text" id="grpNm" name="grpNm" style="width: 100%" readonly>
			                            </td>
			                        </tr>
			                        <tr>
			                            <th>그룹코드</th>
			                            <td>
			                            	<input type="text" id="grpCd" name="grpCd" style="width: 100%" readonly>
			                            </td>
			                        </tr>
			                    </tbody>
			                </table>
			                </form>
			                <!-- conditionTable : end -->
                            
                          <div id="<%=layerName%>grid_wrap" style="height:623px;  margin-top: 5px;"></div>
                        </td>
                        <td>&nbsp;</td>
                        <td>
                           <div class="subtitleGroup">
                                <div class="subtitle">권한 그룹</div>
                                <div class="subBtnGroup">
                                </div>
                            </div>
							<div id="<%=layerName%>grid_wrap2"  style="height:708px;"></div>                 
                        </td>
                    </tr>
                </table>
                <!-- layout table : end -->

<script type="text/javascript">

	//조회 클릭시
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .search').click(function(){
		<%=layerName%>goSearch();
	});
	
	//저장
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .save').click(function(){
		<%=layerName%>saveGroupList();
	});
	
	//권한그룹 삭제
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .delete').click(function(){
		<%=layerName%>deleteGroupList();
		<%--  var groupList3 = AUIGrid.getRemovedItems(<%=layerName%>myGridID2);
		alert(JSON.stringify(groupList3)); --%>
	});
	
	//닫기
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .close').click(function(){
		mFnc.tabMenuClose('<%=layerName%>');
	});

//AUIGrid 생성 후 반환 ID
var <%=layerName%>myGridID;
var <%=layerName%>myGridID2;

//AUIGrid 칼럼 설정
var <%=layerName%>columnLayout = [ 
     {dataField : "grpCd",headerText : "그룹코드",width : "30%"} 
    ,{dataField : "grpNm",headerText : "그룹명",width : "70%"}
    ];

var <%=layerName%>columnLayout2 = [ 
    {dataField : "menuNm",headerText : "메뉴명",style : "my-column-left",width : "30%" ,
       	renderer : {
    		type : "IconRenderer",
    		iconPosition:"aisle",
    		iconWidth : 12, // icon 사이즈, 지정하지 않으면 rowHeight에 맞게 기본값 적용됨
    		iconHeight : 12,
    		iconFunction : function(rowIndex, columnIndex, value, item) {
    			//alert(JSON.stringify(item));
    			switch(item.highMenuCd) {
    			case "000000":
    				return "/resources/images/FolderOpen.png";
    			default:
    				return "/resources/images/Node.png";
    			}
    		} // end of iconFunction
    }} 
   ,{dataField : "menuCd",headerText : "메뉴코드",width : "10%"}
   ,{dataField : "inqAuthYn",headerText : "조회",width : "10%", dataType : "boolean",
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
		/* visibleFunction : function(rowIndex, columnIndex, value, isChecked, item, dataField) {
			if(item.highMenuCd == "000000")
				return false; // 000000 인 대메뉴인 경우 체크박스 표시 안함.
			return true;
		} */
	}}
   ,{dataField : "newAuthYn",headerText : "신규",width : "10%", dataType : "boolean",
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
			/* visibleFunction : function(rowIndex, columnIndex, value, isChecked, item, dataField) {
				if(item.highMenuCd == "000000")
					return false; // 000000 인 대메뉴인 경우 체크박스 표시 안함.
				return true;
			} */
		}}
   ,{dataField : "savAuthYn",headerText : "저장",width : "10%", dataType : "boolean",
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
			/* visibleFunction : function(rowIndex, columnIndex, value, isChecked, item, dataField) {
				if(item.highMenuCd == "000000")
					return false; // 000000 인 대메뉴인 경우 체크박스 표시 안함.
				return true;
			} */
		}}
   ,{dataField : "delAuthYn",headerText : "삭제",width : "10%", dataType : "boolean",
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
			/* visibleFunction : function(rowIndex, columnIndex, value, isChecked, item, dataField) {
				if(item.highMenuCd == "000000")
					return false; // 000000 인 대메뉴인 경우 체크박스 표시 안함.
				return true;
			} */
		}}
   ,{dataField : "exlAuthYn",headerText : "엑셀",width : "10%", dataType : "boolean",
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
			unCheckValue : 0
		}}
   ,{dataField : "priAuthYn",headerText : "출력",width : "10%", dataType : "boolean",
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
			unCheckValue : 0
		}}
     ,{dataField : "stats" ,headerText : "상태값",width : 0}
   ];

// 페이지 로딩 되면 실행
$(document).ready(function() {
	// AUIGrid 그리드를 생성합니다.
	<%=layerName%>createAUIGrid(<%=layerName%>columnLayout);
	<%=layerName%>createAUIGrid2(<%=layerName%>columnLayout2);
});

//AUIGrid 를 생성합니다.
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
		var grpCd = primeCell.item.grpCd; // 분류코드
		$(".<%=layerName%> #rowIndex").val(primeCell.rowIndex);
		
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
			showRowCheckColumn : false,
			softRemoveRowMode : true,
			showStateColumn : true,
			rowHeight : 38,
			headerHeight : 38,
			noDataMessage : "조회된 내용이 없습니다."
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
	
	
	// 클릭한 권한 삭제
	function <%=layerName%>deleteGroupList(){
		var items = AUIGrid.getSelectedItems(<%=layerName%>myGridID2);
		 // 그리드 선택 row
		 var row = items[0].rowIndex;
		 
		 // row의 highMenuCd
		 var highMenuCd = items[0].item.highMenuCd;
		 var groupList = AUIGrid.getGridData(<%=layerName%>myGridID2);
		 var menuCd = items[0].item.menuCd;
		 
		 // 삭제버튼 눌렀을때 그리드 - 표시
		 if(!AUIGrid.isRemovedById(<%=layerName%>myGridID2,items[0].rowIdValue)){
			 
			// 상위메뉴코드일때 전부 삭제
			if(highMenuCd == "000000"){
				
				if(!confirm("삭제시 하위메뉴 까지 삭제 적용됩니다. 삭제 하시겠습니까?")){
					return false;
				}
				
				for (var i = 0; i < groupList.length; i++) {
					if(groupList[i].highMenuCd == menuCd || groupList[i].menuCd == menuCd){
						AUIGrid.removeRow(<%=layerName%>myGridID2,i);						
					}
				}
				
			// 단일 선택 삭제	
			}else{
				AUIGrid.removeRow(<%=layerName%>myGridID2,row);				
			}
			
		 // 상위메뉴코드에서 삭제버튼 두번 눌렀을때 삭제X
		 }else{
			 if(highMenuCd == "000000"){
				 
				for (var i = 0; i < groupList.length; i++) {
					if(groupList[i].highMenuCd == menuCd || groupList[i].menuCd == menuCd){
						AUIGrid.restoreSoftRows(<%=layerName%>myGridID2,i);						
					}
				}
				
			// 단일선택 삭제X
			}else{
				
				// 상위메뉴 일괄 삭제처리 후 하위메뉴 삭제해제 했을시 막기
				var rowId;
				for (var i = 0; i < groupList.length; i++) {
					if(groupList[i].menuCd == highMenuCd){
						 rowId = groupList[i]._$uid;
					}
				}
				
				// 상위메뉴 삭제된 행인지 여부 (삭제 : true 미삭제:false)
				var isCheck = AUIGrid.isRemovedById(<%=layerName%>myGridID2,rowId);
				
				if(!isCheck){
					AUIGrid.restoreSoftRows(<%=layerName%>myGridID2,row);
				}
			}
		}
	}
	
	// 저장
	function <%=layerName%>saveGroupList(){
		
		
		// 저장/수정 , 삭제된 데이터를 담는 배열
		var sendData = new Array();
		
		// 수정된 행 아이템들(배열) : 수정된 필드와 수정안된 필드 모두를 얻음.
		var updateGroupList = AUIGrid.getEditedRowItems(<%=layerName%>myGridID2);
		// 삭제한 데이터
		var deleteGroupList = AUIGrid.getRemovedItems(<%=layerName%>myGridID2);
		
		
		if(deleteGroupList.length != 0){
			for (var i = 0; i < deleteGroupList.length; i++) {
				deleteGroupList[i].stats = "D";
				sendData.push(deleteGroupList[i]);
			}
		}
		
		if(updateGroupList.length != 0){
			for (var i = 0; i < updateGroupList.length; i++) {
				updateGroupList[i].stats = "U";
				sendData.push(updateGroupList[i]);
			}
		}
		
		// 수정/삭제가 없다면
		if(sendData == 0){
			GRIT.msg.alert("저장할 데이터가 없습니다.");
			return false;
		}
		
		
		if(!confirm("저장 하시겠습니까?")){
			return false;
	    } 
		
		
	  	GRIT.tran.send({
			url: "/sys/saveSysAuthMgmt",
			sendData: sendData,
			success: function(result){
				if(result.rtnCode == "0"){
				 	GRIT.msg.alert(result.message);
			 		<%=layerName%>goSearch();
			  	}else if(result.rtnCode == "-1"){
			  		GRIT.msg.alert(result.message);
			  	}
			}
		});  
	}

	//그리드 사이즈변경
	gridResize();
</script>

