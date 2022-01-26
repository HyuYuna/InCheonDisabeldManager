<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String layerName = request.getParameter("layerName");
%>

<div class="section-top">

	<jsp:include page="../common/commonBtn.jsp">
		<jsp:param value="<%=layerName %>" name="layerName"/>
	</jsp:include>

</div>

<!-- section : 업무영역(스크롤 되는 부분) -->
<div class="section">
	<div class="horizon-fix full-height fl-l" style="width:300px;">
		<div class="box-top">
			<span class="sub-tit">권한 그룹</span>
		</div>

		<div class="box-wrap vertical-fix mb10">
			<div class="box-con">

				<form name="<%=layerName%>inputForm">
					<input type="hidden" name="rowIndex"/>

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
									<input type="text" name="grpNm" class="autoBind"/>
								</td>
							</tr>
							<tr>
								<th scope="row" class="no-bg">그룹코드</th>
								<td>
									<input type="text" name="grpCd" class="autoBind" style="width:80px;" maxlength="2" readonly/>
									<a href="#" class="btn-gray" id="addGrpBtn"><span>등록</span></a>
									<a href="#" class="btn-gray" id="delGrpBtn"><span>삭제</span></a>
								</td>
							</tr>
							<tr>
								<th scope="row" class="no-bg">그룹구분</th>
								<td>
									<select name="grpFgCd" class="autoBind"></select>
								</td>
							</tr>
						</tbody>
					</table>

				</form>

			</div>
		</div>

		<div class="box-wrap vertical-resize">
			<div id="<%=layerName%>DIV1" class="box-con-black"></div>
		</div>
	</div>
	<div class="horizon-fix full-height fl-l" style="width:300px;">
		<div class="box-top">
			<span class="sub-tit">권한 그룹</span>
		</div>
		<div class="box-wrap vertical-resize">
			<div id="<%=layerName%>DIV1" class="box-con-black"></div>
		</div>
	</div>
	<!-- //section-half fixed exp -->

	<div class="horizon-resize full-height fl-r">
		<div class="box-top">
			<span class="sub-tit">권한그룹리스트</span>
		</div>

		<div class="box-wrap vertical-resize">
			<div id="<%=layerName%>DIV2" class="box-con-black"></div>
		</div>
	</div>

	<div class="clear"></div>
</div>
<!-- //section : 업무역영 -->
<script type="text/javascript">

var <%=layerName%>Fc = {
		gridApp	   : '',
		gridApp2   : '',
		gridRoot   : '',
		gridRoot2  : '',
		dataGrid   : '',
		dataGrid2  : '',
		collection : '',
		collection2 : '',
		layoutURL  : '/resources/js/rMateGridH5/layoutXml/sysUserAuthMgmt.xml',
		layoutURL2 : '/resources/js/rMateGridH5/layoutXml/sysUserAuthMgmt2.xml'
	};

var <%=layerName%>Js = {

	jsVars		: 'layoutURL='+ <%=layerName%>Fc.layoutURL +'&rMateOnLoadCallFunction=<%=layerName%>Js.gridReadyHandler',
	jsVars2		: 'layoutURL='+ <%=layerName%>Fc.layoutURL2 +'&rMateOnLoadCallFunction=<%=layerName%>Js.gridReadyHandler2',

	gridReadyHandler : function(id) {

		// rMateGrid 관련 객체
		<%=layerName%>Fc.gridApp = document.getElementById(id);	// 그리드를 포함하는 div 객체
		<%=layerName%>Fc.gridRoot = <%=layerName%>Fc.gridApp.getRoot();	// 데이터와 그리드를 포함하는 객체

		var layoutCompleteHandler = function(event) {
			<%=layerName%>Fc.dataGrid = <%=layerName%>Fc.gridRoot.getDataGrid();	// 생성된 그리드 객체
		};


		var selectionChangeHandler = function(event){

			var changedData = <%=layerName%>Fc.gridRoot.getChangedData();

			var changedData2 = <%=layerName%>Fc.gridRoot2.getChangedData();

			if(changedData.length != 0){
				GRIT.msg.alert("변경내역이 존재합니다. 저장 후 이동하여 주세요.");
				<%=layerName%>Fc.dataGrid.setSelectedIndex(<%=layerName%>inputForm.rowIndex.value);
				return;
			}

			if(changedData2.length != 0){
				GRIT.msg.alert("변경내역이 존재합니다. 저장 후 이동하여 주세요.");
				<%=layerName%>Fc.dataGrid.setSelectedIndex(<%=layerName%>inputForm.rowIndex.value);
				return;
			}
			//var columnIndex = event.columnIndex;
			//inputForm.itemXMLData.value = dataRow;

			//var column = dataGrid.getColumns()[columnIndex];
			//var dataField = column.getDataField();
			//var sArr = dataGrid.getSelectedIndices();

			var rowIndex = event.rowIndex;
			var dataRow = <%=layerName%>Fc.gridRoot.getItemAt(rowIndex);

			for(key in dataRow){
				if(<%=layerName%>inputForm[key]){
					<%=layerName%>inputForm[key].value = dataRow[key];
				}
			}


			<%=layerName%>inputForm.rowIndex.value = rowIndex;

			if(rowIndex < 0){
				return;
			}

			var grpCd = <%=layerName%>Fc.gridRoot.getItemFieldAt(rowIndex, "grpCd");

			<%=layerName%>Js.goSearch2(grpCd);

		};


		var dataCompleteHandler = function(event){
			//dataGrid = gridRoot.getDataGrid();
			<%=layerName%>Fc.dataGrid.addEventListener("change", selectionChangeHandler);
			//dataGrid.setSelectedIndices([2]);
			<%=layerName%>Fc.collection = <%=layerName%>Fc.gridRoot.getCollection();
		};


		var itemDataChangedHandler = function(event){

			//var rowIndex = event.rowIndex;                  // 변경된 행번호
		    //var columnIndex = event.columnIndex;        // 변경된 열번호
		    var dataField = event.dataField;                // 변경된 열의 데이터 필드
		    //var dataRow = gridRoot.getItemAt(rowIndex); // 변경된 데이터 레코드
		    //var oldValue = event.value;                     // 변경전 값
		    var newValue = event.newValue;                  // 변경후 값

		    if(<%=layerName%>inputForm[dataField]){
		    	<%=layerName%>inputForm[dataField].value = newValue;
		    }
		};


		// 레이아웃에 의해 그리드가 생성된 후 layoutComplete 이벤트가 발생합니다.
		<%=layerName%>Fc.gridRoot.addEventListener("layoutComplete", layoutCompleteHandler);
		<%=layerName%>Fc.gridRoot.addEventListener("dataComplete", dataCompleteHandler);
		<%=layerName%>Fc.gridRoot.addEventListener("itemDataChanged", itemDataChangedHandler);

	},

	gridReadyHandler2 : function(id) {

		// rMateGrid 관련 객체
		<%=layerName%>Fc.gridApp2 = document.getElementById(id);	// 그리드를 포함하는 div 객체
		<%=layerName%>Fc.gridRoot2 = <%=layerName%>Fc.gridApp2.getRoot();	// 데이터와 그리드를 포함하는 객체


		var layoutCompleteHandler = function(event) {
			<%=layerName%>Fc.dataGrid2 = <%=layerName%>Fc.gridRoot2.getDataGrid();	// 생성된 그리드 객체
		};


		var dataCompleteHandler = function(event){
			//dataGrid = gridRoot.getDataGrid();
			//<%=layerName%>Fc.dataGrid2.addEventListener("itemDoubleClick", selectionChangeHandler);
			//dataGrid.setSelectedIndices([2]);
			<%=layerName%>Fc.collection2 = <%=layerName%>Fc.gridRoot2.getCollection();

		};

		var selectionChangeHandler = function(event){
		};


		var itemDataChangedHandler = function(event){

			//var rowIndex = event.rowIndex;                  // 변경된 행번호
		    //var columnIndex = event.columnIndex;        // 변경된 열번호
		    //var dataField = event.dataField;                // 변경된 열의 데이터 필드
		    //var dataRow = <%=layerName%>Fc.gridRoot2.getItemAt(rowIndex); // 변경된 데이터 레코드
		    //var oldValue = event.value;                     // 변경전 값
		    //var newValue = event.newValue;                  // 변경후 값

		};



		// 레이아웃에 의해 그리드가 생성된 후 layoutComplete 이벤트가 발생합니다.

		<%=layerName%>Fc.gridRoot2.addEventListener("layoutComplete", layoutCompleteHandler);
		<%=layerName%>Fc.gridRoot2.addEventListener("dataComplete", dataCompleteHandler);
		//<%=layerName%>Fc.gridRoot2.addEventListener("itemDataChanged", itemDataChangedHandler);

		resizeMenuContent();
	},

	changeData: function(data) {
		 <%=layerName%>Fc.gridApp.setData(data);
		//gridApp.resize();
	},

	goSearch: function(){

		var params = {
				url: "/sys/searchSysUserAuthMgmt",
				success: function(result){

					if(result.data == ''){
						GRIT.msg.alert("조회 조건에 맞는 데이터가 없습니다.");
					}else{
						<%=layerName%>Js.changeData(result.data);
						<%=layerName%>Fc.gridRoot2.removeAll();
					}

					<%=layerName%>Js.formReset();
				},
				loadingTarget: "<%=layerName%>"
		};

		GRIT.tran.send(params);

	},


	goSearch2: function(grpCd) {

		var params = {
				url: "/sys/searchSysUserAuthMgmt2",
				sendData: {"grpCd" : grpCd},
				success: function(result){
					if(result.data == ''){
						GRIT.msg.alert("조회 조건에 맞는 데이터가 없습니다.");
					}else{
						<%=layerName%>Js.changeData2(result.data);
					}
				},
				loadingTarget : "<%=layerName%>"
		};

		GRIT.tran.send(params);

	},


	goSearch3: function(grpCd) {

		var rtn = "0";
		var sendData = {"grpCd" : grpCd};

		GRIT.tran.send({
			url: "/sys/searchSysUserAuthMgmt3",
			sendData: sendData,
			async : false,
			success: function(result){
				rtn = result.data.cnt;
			},
			loadingTarget: "<%=layerName%>"
		});

		return rtn;
	},


	changeData2: function(data) {
		 <%=layerName%>Fc.gridApp2.setData(data);
		//gridApp.resize();
	},


	setItemAt: function(elem) {
		//var item = {};
		//item[$(elem).attr("name")] = $(elem).val();
		<%=layerName%>Fc.gridRoot.setItemFieldAt($(elem).val(), <%=layerName%>inputForm.rowIndex.value, $(elem).attr("name") );
	},


	formValid: function(){

		var formObj = $("form[name='<%=layerName%>inputForm']");

		if($.trim($("input[name='grpNm']", formObj).val()) == ""){
			GRIT.msg.alert("그룹명을 입력하여 주세요.", function(){$("input[name='grpNm']", formObj).focus();}());
			return false;
		}

		if($.trim($("input[name='grpCd']", formObj).val()) == ""){
			GRIT.msg.alert("그룹코드를 입력하여 주세요.", function(){$("input[name='grpCd']", formObj).focus();}());
			return false;
		}

		return true;

	},


	goDelete: function(){

		var changedData = <%=layerName%>Fc.gridRoot.getChangedData();

		if(changedData.length == 0){
			return;
		}

		var changeDataObj = [];

	    if(changedData.length > 0){
	        for(var i = 0; i < changedData.length; i++){
	        	changeDataObj.push(changedData[i]);
	        }
	    }

	    var sendData = changeDataObj;

		var params = {
				url: "/sys/modifySysUserAuthMgmt",
				sendData: sendData,
				success: function(result){
					if(result.rtnCode == "0"){
						GRIT.msg.alert("권한그룹을 삭제하였습니다.");
						<%=layerName%>Js.goSearch();
					}
				},
				loadingTarget : "<%=layerName%>"
		};

		GRIT.tran.send(params);

	},


	goModify: function(){

		if(!<%=layerName%>Js.formValid()){
			return;
		}

		var changedData = <%=layerName%>Fc.gridRoot.getChangedData();

		if(changedData.length == 0){
			return;
		}

		var changeDataObj = [];

	    if(changedData.length > 0){
	        for(var i = 0; i < changedData.length; i++){
	        	changeDataObj.push(changedData[i]);
	        }
	    }

	    var sendData = changeDataObj;

		var params = {
				url: "/sys/modifySysUserAuthMgmt",
				sendData: sendData,
				success: function(result){
					if(result.rtnCode == "0"){
						GRIT.msg.alert("그룹코드를 저장하였습니다.");
						<%=layerName%>Js.goSearch();
					}
				},
				loadingTarget : "<%=layerName%>"
		};

		GRIT.tran.send(params);

	},


	goModify2: function(){

		var changedData = <%=layerName%>Fc.gridRoot2.getChangedData();

		if(changedData.length == 0){
			return;
		}

    	var changeDataObj = [];

	    if(changedData.length > 0){
	        for(var i = 0; i < changedData.length; i++){

	        	if(changedData[i]["data"]["lv"] == 1){
	        		changedData[i]["job"] = "N";
	        	}

	        	changeDataObj.push(changedData[i]);
	        }
	    }

		var params = {
				url: "/sys/modifySysUserAuthMgmt2",
				sendData: changeDataObj,
				success: function(result){
					if(result.rtnCode == "0"){
						if(result.rtnCode == "0"){
							  GRIT.msg.alert("권한 메뉴를 저장하였습니다.");
							  <%=layerName%>Fc.gridRoot2.resetChangedData();
						  }
					}
				},
				loadingTarget : "<%=layerName%>"
		};

		GRIT.tran.send(params);

	},


	// 그리드의 selctedIndex를 전달된 행으로 이동
	girdMoveSelctedIndex: function(idx) {
	    // addItemAt나 removeItemAt후에 바로 selctedIndex를 변경하면 무시되는 경우가 발생하여 setTimeout로 지연후 실행토록 함
	    setTimeout("<%=layerName%>Js.gridSetSelectedIndex("+idx+")", 100);
	},

	gridSetSelectedIndex: function(idx) {
	    // 현재 그리드의 verticalScrollPosition을 조사하여 스크롤을 일으킬지 조사하여 필요시 세팅
	    var verticalScrollPosition = <%=layerName%>Fc.dataGrid.getVerticalScrollPosition();
	    // 그리드의 행수를 가져옵니다 (이 값은 화면에 제대로 표시되지 않는 행을 포함하기 때문에 실제와 다른 값으로 보일 수 있으며, DataGrid의 variableRowHeight가 true일 경우에는 추정치를 의미합니다.
	    var rowCount = <%=layerName%>Fc.dataGrid.getRowCount();
	    if (rowCount > 0)
	        rowCount = rowCount - 1;
	    var halfRowCount = (rowCount / 2).toFixed();

	    // idx가 값이 없는 경우 collection에서 현재 데이터의 레코드수를 가져와 맨 마지막 행값을 계산.
	    if (idx == null || idx == undefined) {
	        if (!<%=layerName%>Fc.collection){
	        	<%=layerName%>Fc.collection = <%=layerName%>Fc.gridRoot.getCollection();
	        }

	        if(!<%=layerName%>Fc.collection){
				idx = 0;
			}else{
				idx = <%=layerName%>Fc.collection.getLength() - 1;
			}
	    }
	    <%=layerName%>Fc.dataGrid.setSelectedIndex(idx);
	    if (idx < verticalScrollPosition || idx > verticalScrollPosition + rowCount) {
	        if (idx - halfRowCount >= 0){ // 화면 중간에 위치하도록 계산
	        	<%=layerName%>Fc.dataGrid.setVerticalScrollPosition(idx - halfRowCount);
	        }else{
	        	<%=layerName%>Fc.dataGrid.setVerticalScrollPosition(0);
	        }
	    }
	},

	// 맨끝에 행 추가
	addItem: function(rowIndex){
		var formObj = $("form[name='<%=layerName%>inputForm']");

		$("input[name='grpCd']", formObj).val("");
		$("input[name='grpCd']", formObj).removeAttr("readonly");

		$("input[name='grpNm']", formObj).val("");
		$("select[name='grpFgCd']", formObj).val("3");

	    var item = {
	    		"grpCd": "",
	    		"grpNm": $("input[name='grpNm']", formObj).val(),
	    		"grpFgCd": $("select[name='grpFgCd']", formObj).val(),
	    		"grpFgNm": $("option:selected", "form[name='<%=layerName%>inputForm'] select[name='grpFgCd']").text()
	    };


	    <%=layerName%>Fc.gridRoot.addItemAt(item);
	    <%=layerName%>Js.girdMoveSelctedIndex();

	    <%=layerName%>inputForm.rowIndex.value = <%=layerName%>Fc.gridRoot.getLength() - 1;
	},

	// 행 추가
	addItemAt: function(item){
	    <%=layerName%>Fc.gridRoot.addItemAt(item, <%=layerName%>inputForm.rowIndex.value);
	    <%=layerName%>Js.girdMoveSelctedIndex(<%=layerName%>inputForm.rowIndex.value);
	},

	formReset: function(){
		$("input[type='text'], select", "form[name='<%=layerName%>inputForm']").val("");
		$("input[name='grpCd']", "form[name='<%=layerName%>inputForm']").attr("readonly",true);
	},

	confirmCallback: function(rtn){

		if(rtn){
			var selectedIndex = <%=layerName%>Fc.dataGrid.getSelectedIndex();
			<%=layerName%>Fc.gridRoot.removeItemAt(selectedIndex);
			<%=layerName%>Js.goDelete();
		}
	}

};


//조회 클릭시
$('.content .section-wrap .boxcontent.<%=layerName%> .section-top .btn-group a.search').click(function(){

	<%=layerName%>Js.goSearch();

});

//저장
$('.content .section-wrap .boxcontent.<%=layerName%> .section-top .btn-group a.save').click(function(){

	var changedData = <%=layerName%>Fc.gridRoot.getChangedData();
	var changedData2 = <%=layerName%>Fc.gridRoot2.getChangedData();

	if(changedData.length != 0){
		<%=layerName%>Js.goModify();
	}

	if(changedData2.length != 0){
		<%=layerName%>Js.goModify2();
	}

});

//닫기
$('.content .section-wrap .boxcontent.<%=layerName%> .section-top .btn-group a.close').click(function(){
	mFnc.tabMenuClose('<%=layerName%>');
});


//권한그룹 등록
$("#addGrpBtn", "form[name='<%=layerName%>inputForm']").click(function(){

	var changedData = <%=layerName%>Fc.gridRoot.getChangedData();
	var changedData2 = <%=layerName%>Fc.gridRoot2.getChangedData();

	if(changedData.length != 0){
		GRIT.msg.alert("변경내역이 존재합니다. 저장 후 등록하여 주세요.");
		<%=layerName%>Fc.dataGrid.setSelectedIndex(<%=layerName%>inputForm.rowIndex.value);
		return;
	}

	if(changedData2.length != 0){
		GRIT.msg.alert("변경내역이 존재합니다. 저장 후 등록하여 주세요.");
		<%=layerName%>Fc.dataGrid.setSelectedIndex(<%=layerName%>inputForm.rowIndex.value);
		return;
	}


	<%=layerName%>Js.addItem();

	<%=layerName%>Fc.gridRoot2.removeAll();

});


//권한그룹 삭제
$("#delGrpBtn", "form[name='<%=layerName%>inputForm']").click(function(){

	var selectedIndex = <%=layerName%>Fc.dataGrid.getSelectedIndex();

	if(selectedIndex < 0){
		GRIT.msg.alert("삭제할 그룹코드를 선택하여 주세요.");
		return;
	}

	var grpCd = <%=layerName%>Fc.gridRoot.getItemFieldAt(selectedIndex, "grpCd");
	var grpNm = <%=layerName%>Fc.gridRoot.getItemFieldAt(selectedIndex, "grpNm");

	var userCnt = <%=layerName%>Js.goSearch3(grpCd);

	if(userCnt != "0"){
		GRIT.msg.alert("해당 권한정보['" + grpNm + "']를 가진 사용자가 존재합니다.");
		return;
	}

	GRIT.msg.confirm("그룹코드 '" + grpCd +"' 를 삭제하시겠습니까?", <%=layerName%>Js.confirmCallback);

});



$(".autoBind", "form[name='<%=layerName%>inputForm']").change(function(){

	var selectedIndex = <%=layerName%>Fc.dataGrid.getSelectedIndex();

	if(selectedIndex < 0){
		return;
	}

	var thisObj = $(this);
	var attrName = thisObj.attr("name");
	var selectTxt = $("option:selected", this).text();
	var rowIndex = <%=layerName%>inputForm.rowIndex.value;

	if(thisObj[0].tagName == "SELECT"){

		switch(attrName){
			case "grpFgCd" : <%=layerName%>Fc.gridRoot.setItemFieldAt(selectTxt, rowIndex, "grpFgNm");
			break;
			default:
				break;
		}

	}

	<%=layerName%>Fc.gridRoot.setItemFieldAt(thisObj.val(), rowIndex, attrName);

});


// 페이지 로딩 되면 실행
$(document).ready(function() {

	rMateGridH5.create("<%=layerName%>Grid1", "<%=layerName%>DIV1", <%=layerName%>Js.jsVars, "100%", "100%");
	rMateGridH5.create("<%=layerName%>Grid2", "<%=layerName%>DIV2", <%=layerName%>Js.jsVars2, "100%", "100%");

	GRIT.util.initComboBoxCmmTR("form[name='<%=layerName%>inputForm'] select[name='grpFgCd']", 'GRP000', 'cd', 'cdNm', '', '0');
});


</script>

