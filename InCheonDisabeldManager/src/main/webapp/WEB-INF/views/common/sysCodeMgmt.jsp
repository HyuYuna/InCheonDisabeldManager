<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String layerName = request.getParameter("layerName");
%>
<div class="section-top">
	<!-- btn-group -->
	<jsp:include page="commonBtn.jsp">
		<jsp:param value="<%=layerName %>" name="layerName"/>
	</jsp:include>
	<!-- //btn-group -->
</div>
<!-- //section-top -->

<!-- section : 업무영역(스크롤 되는 부분) -->
<!-- <div class="section"> -->
	<div class="section-vertical top exp mb10">
		<!-- box-wrap -->
	<div class="box-wrap mb10">
		<!-- box-top -->
		<div class="box-top">
			<span class="sub-tit">분류코드 정보</span>
		</div>
		<!-- //box-top -->
		<div class="box-con">
			<form id="<%=layerName%>REG" onsubmit="return false;">
			<input type="hidden" name="Wmode" value="edit" />
			<table class="tb01" summary="분류코드 정보 입니다.">
				<caption>A분류코드 정보</caption>
				<colgroup>
					<col width="107px">
					<col width="200px">
					<col width="107px">
					<col width="200px">
					<col width="107px">
					<col width="200px">
					<col width="107px">
					<col width="200px">
					<col width="150px">
					<col width="*">
				</colgroup>
				<tbody>
					<tr class="dept1">
						<th scope="row"><span class="necessary">(필수)</span>
							분류코드
						</th>
						<td class="clsCd">
							<input type="text" style="width:150px" value="">
						</td>
						<th scope="row">
							코드명
						</th>
						<td class="cdNm">
							<input type="text" style="width:150px" value="">
						</td>
						<th scope="row">
							설명
						</th>
						<td class="dtlDesc" colspan="5">
							<input type="text" style="width:95%" value="">
						</td>
					</tr>
					<tr class="dept2">
						<th scope="row">
							참조값1
						</th>
						<td class="ref1Val">
							<input type="text" style="width:150px" value="">
						</td>
						<th scope="row">
							참조값2
						</th>
						<td class="ref2Val">
							<input type="text" style="width:150px" value="">
						</td>
						<th scope="row">
							참조값3
						</th>
						<td class="ref3Val">
							<input type="text" style="width:150px" value="">
						</td>
						<th scope="row">
							사용여부
						</th>
						<td class="useYn">
							<select class="sel_type" style="width:150px">
								<option value="1">사용</option>
								<option value="0">미사용</option>
							</select>
						</td>
						<th scope="row">
							상업시설 사용여부
						</th>
						<td class="comBizYn">
							<select class="sel_type" style="width:150px">
								<option value="1">사용</option>
								<option value="0">미사용</option>
							</select>
						</td>
					</tr>
				</tbody>
			</table>
			</form>
		</div>
	</div>
	<!-- //box-wrap -->
</div>
<!-- section-vertical top -->
<div class="section-vertical bottom mb10">
	<!-- box-wrap -->
	<div class="box-wrap mb10">
		<div id="<%=layerName%>DIV" class="box-con-black" style="height:150px;"></div>
	</div>
	<!-- //box-wrap -->

	<!-- box-wrap -->
	<div class="box-wrap">
		<div class="box-top ta-r mb4">
			<a href="#" class="btn-blue addcode"><span>코드추가</span></a>
		</div>
		<div id="<%=layerName%>DIV2" class="box-con-black" style="height:150px;"></div>
	</div>
	<!-- //box-wrap -->
</div>
<!-- section-vertical bottom -->

<script type="text/javascript">
var <%=layerName%>Fc = {
		form	   : '<%=layerName%>REG',
		gridApp	   : '',
		gridApp2   : '',
		gridRoot   : '',
		gridRoot2  : '',
		dataGrid   : '',
		dataGrid2  : '',
		layoutURL  : '/resources/js/rMateGridH5/layoutXml/sysCodeMgmt.xml',
		layoutURL2 : '/resources/js/rMateGridH5/layoutXml/sysCodeMgmt2.xml'
	}
var <%=layerName%>Js = {
	jsVars		: 'layoutURL='+ <%=layerName%>Fc.layoutURL +'&rMateOnLoadCallFunction=<%=layerName%>Js.gridReadyHandler',
	jsVars2		: 'layoutURL='+ <%=layerName%>Fc.layoutURL2 +'&rMateOnLoadCallFunction=<%=layerName%>Js.gridReadyHandler2',
	gridReadyHandler : function(id) {
		// rMateGrid 관련 객체
		<%=layerName%>Fc.gridApp = document.getElementById(id);	// 그리드를 포함하는 div 객체
		<%=layerName%>Fc.gridRoot = <%=layerName%>Fc.gridApp.getRoot();	// 데이터와 그리드를 포함하는 객체

		var itemClickHandler = function(event) {
			var rowIndex = event.rowIndex;
			var dataRow = <%=layerName%>Fc.gridRoot.getItemAt(rowIndex);
			var data1 = dataRow["clsCd"];
			console.log('rowIndex : '+ rowIndex +' / data1 : '+ data1);

			getSysCodeByClsCd(data1);
		}

		var layoutCompleteHandler = function(event) {
			<%=layerName%>Fc.dataGrid = <%=layerName%>Fc.gridRoot.getDataGrid();	// 그리드 객체
			<%=layerName%>Fc.dataGrid.addEventListener("itemClick", itemClickHandler);
		}
		<%=layerName%>Fc.gridRoot.addEventListener("layoutComplete", layoutCompleteHandler); // 레이아웃 끝나면 이벤트 시작
	},


	gridReadyHandler2 : function(id) {
		// rMateGrid 관련 객체
		<%=layerName%>Fc.gridApp2 = document.getElementById(id);	// 그리드를 포함하는 div 객체
		<%=layerName%>Fc.gridRoot2 = <%=layerName%>Fc.gridApp2.getRoot();	// 데이터와 그리드를 포함하는 객체
	},
	insertRow: function() {
		var item = {"cd":"", "cdNm":"", "dtlDesc":"", "ref1Val":"", "ref2Val":"", "ref3Val":"", "useYn":"미사용", "comBizYn":"미사용", "regDtm":"", "regrId":"", "modDtm":"", "modrId":""};
		<%=layerName%>Fc.gridRoot2.addItemAt(item);
	},

}


var tagPath = ".content .section-wrap .boxcontent.<%=layerName%>";



// 조회 클릭시
$(tagPath + " .section-top .btn-group a.search").click(function(){
	searchCommonCode();
});



// 저장
$(tagPath + " .section-top .btn-group a.save").click(function(){
	saveCommonCode();
});



// exel
$(tagPath + " .section-top .btn-group a.exel").click(function(){
	GRIT.grid.excelExport("<%=layerName%>", <%=layerName%>Fc.gridRoot, "공통코드관리.xlsx", "3", <%=layerName%>Fc.dataGrid2);

});



// 코드 추가
$(tagPath + " .mb10 .box-wrap .mb4 .addcode").click(function(){
	<%=layerName%>Js.insertRow();
});



// 닫기
$(tagPath + " .section-top .btn-group a.close").click(function(){
	mFnc.tabMenuClose('<%=layerName%>');
});



// 페이지 로딩 되면 실행
$(document).ready(function() {
	mFnc.rMCreate('<%=layerName%>',2);
});

var gClsCd;

// 해당 내역 클릭시
function getSysCodeByClsCd(clsCd) {
	var param = {
		"clsCd" : ""
	};

	param.clsCd = clsCd;

	GRIT.tran.send({
		url: "/sys/getSysCodeByClsCd",
		sendData: param,
		success: function(data){
			if(JSON.stringify(data.data) != '{}') {
				gClsCd = clsCd;
				<%=layerName%>Fc.gridApp2.setData(data.data);
			}
		},
		loadingTarget : "<%=layerName%>"
	});

}


// 조회
function searchCommonCode() {
	var param = {
		"clsCd":"",
		"cdNm" : "",
		"dtlDesc":"",
		"ref1Val":"",
		"ref2Val":"",
		"ref3Val":"",
		"useYn":"미사용",
		"comBizYn":"미사용"
	};

	var valuePath = ".content .section-wrap .<%=layerName%> .section-vertical .box-wrap .box-con #<%=layerName%>REG .tb01 tbody";

	param.clsCd   = $(valuePath + " .dept1 .clsCd    input").val();
	param.cdNm    = $(valuePath + " .dept1 .cdNm     input").val();
	param.dtlDesc = $(valuePath + " .dept1 .dtlDesc  input").val();

	param.ref1Val = $(valuePath + " .dept2 .ref1Val  input").val();
	param.ref2Val = $(valuePath + " .dept2 .ref2Val  input").val();
	param.ref3Val = $(valuePath + " .dept2 .ref3Val  input").val();

	param.useYn   	= $(valuePath + " .dept2 .useYn    select option:selected").val();
	param.comBizYn  = $(valuePath + " .dept2 .comBizYn select option:selected").val();

	GRIT.tran.send({
		url: "/sys/getSysCodeList",
		sendData: param,
		success: function(data){
			if(JSON.stringify(data.data) != '{}'){
				<%=layerName%>Fc.gridRoot.removeAll();
				<%=layerName%>Fc.gridRoot2.removeAll();
				<%=layerName%>Fc.gridApp.setData(data.data);
			}
		},
		loadingTarget : "<%=layerName%>"
	});

}

// 저장
function saveCommonCode() {
	//  변경된 데이터 JSON 으로 리턴
	var param = <%=layerName%>Fc.gridRoot2.getChangedData();
	console.log("get save data");
	console.log(param);
	console.log("length : " + Object.keys(param).length);
	if (Object.keys(param).length > 0) {
        for (var i = 0; i < Object.keys(param).length; i++) {
        	// data setting
        	param[i].data.clsCd = gClsCd;

        	//sortSeq

        	if (param[i].data.sortSeq == undefined || param[i].data.sortSeq == "") {
        		var tempData = <%=layerName%>Fc.gridRoot2.getGridData();
        		console.log("tempData");
        		console.log(tempData);
        		if (Object.keys(tempData).length > 0) {
        			var tempLarge = 0;
        			for (var j = 0; j < Object.keys(tempData).length; j++) {
        				tempData[j].sortSeq;
        				if (tempLarge < tempData[j].sortSeq) {
        					tempLarge = tempData[j].sortSeq;
        				}
        			}
        			tempLarge++;
        			param[i].data.sortSeq = tempLarge;
        		} else {
        			param[i].data.sortSeq = 1;
        		}
        	}

        	//useYn
        	if (param[i].data.useYn == "사용" ) {
        		param[i].data.useYn = "1";
        	} else {
        		param[i].data.useYn = "0";
        	}

        	//comBizYn
        	if (param[i].data.comBizYn == "사용" ) {
        		param[i].data.comBizYn = "1";
        	} else {
        		param[i].data.comBizYn = "0";
        	}

        	//ref1Val
        	console.log(param[i].data.ref1Val);
        	if ( param[i].data.ref1Val == undefined || param[i].data.ref1Val == null || param[i].data.ref1Val == "" ) {
        		param[i].data.ref1Val = "";
        	}

        	//ref2Val
        	if ( param[i].data.ref2Val == undefined || param[i].data.ref2Val == null || param[i].data.ref2Val == "" ) {
        		param[i].data.ref2Val = "";
        	}

        	//ref3Val
        	if ( param[i].data.ref3Val == undefined || param[i].data.ref3Val == null || param[i].data.ref3Val == "" ) {
        		param[i].data.ref3Val = "";
        	}

        	//dtlDesc
        	if ( param[i].data.dtlDesc == undefined || param[i].data.dtlDesc == null || param[i].data.dtlDesc == "" ) {
        		param[i].data.dtlDesc = "";
        	}

        	GRIT.tran.send({
        		url: "/sys/addSysCommonCode",
        		sendData: param[i].data,
        		success: function(data){
        			<%=layerName%>Fc.gridRoot.removeAll();
        	    	<%=layerName%>Fc.gridRoot2.removeAll();
        	    	searchCommonCode();
        		},
        		loadingTarget : "<%=layerName%>"
        	});

        }
    }
}
</script>
