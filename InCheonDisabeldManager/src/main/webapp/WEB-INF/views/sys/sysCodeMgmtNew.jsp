<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String layerName = request.getParameter("layerName");
%>
<div class="section-top">

	<jsp:include page="../common/commonBtn.jsp">
		<jsp:param value="<%=layerName %>" name="layerName"/>
	</jsp:include>

<form name="<%=layerName%>searchForm" onsubmit="return false;">
	<div class="search-box-wrap">
		<div class="search-box">
			<dl>
				<dt>코드명</dt>
				<dd class="title">
					<input type="text" name="schCdNm" style="width:120px;"/>
				</dd>
			</dl>
		</div>
	</div>
</form>

</div>


<div class="section">
	<div class="box-top">
		<span class="sub-tit">분류코드 정보</span>
	</div>

	<div class="box-wrap vertical-fix mb10">
		<div class="box-con">
			<form name="<%=layerName%>inputForm">
				<input type="hidden" id="rowIndex" name="rowIndex"/>
				<input type="hidden" id="newGb" name="newGb"/>
				<input type="hidden" id="newGbDtl" name="newGbDtl"/>
				<table class="tb01 short" summary="분류코드 정보 입니다.">
					<caption>분류코드 정보</caption>
					<colgroup>
						<col width="80px">
						<col width="200px">
						<col width="80px">
						<col width="200px">
						<col width="80px">
						<col width="*">
						<col width="80px">
						<col width="*">
					</colgroup>
					<tbody>
						<tr class="dept1">
							<th scope="row"><span class="necessary">(필수)</span>
								분류코드
							</th>
							<td>
								<input type="text" id="clsCd" name="clsCd" style="width:150px" class="autoBind" disabled onkeyup="<%=layerName%>fnChkByte(this, '10')"/>
							</td>
							<th scope="row">
								코드명
							</th>
							<td>
								<input type="text" id="cdNm" name="cdNm" style="width:150px" class="autoBind" disabled onkeyup="<%=layerName%>fnChkByte(this, '50')"/>
							</td>
							<th scope="row">
								사용여부
							</th>
							<td>
								<select id="useYn" name="useYn" style="width:80px" class="autoBind" disabled>
									<option value="1">사용</option>
									<option value="0">미사용</option>
								</select>
							</td>
							<th scope="row" style="width:120px;">
								상업시설사용여부
							</th>
							<td>
								<select id="comBizYn" name="comBizYn" style="width:80px" class="autoBind" disabled>
									<option value="1">사용</option>
									<option value="0">미사용</option>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">
								참조값1
							</th>
							<td>
								<input type="text" id="ref1Val" name="ref1Val" style="width:150px" class="autoBind" disabled onkeyup="<%=layerName%>fnChkByte(this, '50')"/>
							</td>
							<th scope="row">
								참조값2
							</th>
							<td>
								<input type="text" id="ref2Val" name="ref2Val" style="width:150px" class="autoBind" disabled onkeyup="<%=layerName%>fnChkByte(this, '50')"/>
							</td>
							<th scope="row">
								참조값3
							</th>
							<td colspan="3">
								<input type="text" id="ref3Val" name="ref3Val" style="width:150px" class="autoBind" disabled onkeyup="<%=layerName%>fnChkByte(this, '50')"/>
							</td>

						</tr>
						<tr>
							<th scope="row">
								설명
							</th>
							<td colspan="7">
								<input type="text" id="dtlDesc" name="dtlDesc" style="width:95%" class="autoBind" disabled onkeyup="<%=layerName%>fnChkByte(this, '1000')"/>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>

	<div class="box-wrap mb10">
		<div id="<%=layerName%>grid_wrap" style="height:200px;"></div>
	</div>

	<form name="<%=layerName%>detailForm">
	<input type="hidden" name="rowIndex"/>
	<div class="box-top">
		<span class="sub-tit">코드 정보</span>
		<span class="fl-r" >
			<a href="#" class="btn-blue addcode" id="addDtlCd"><span>코드추가</span></a>
		</span>
	</div>
	</form>

	<div class="box-wrap">
		<div id="<%=layerName%>grid_wrap2"  style="height:200px;"></div>
	</div>

</div>

<script type="text/javascript">
//조회 클릭시
$('.content .section-wrap .boxcontent.<%=layerName%> .section-top .btn-group a.search').click(function(){
	<%=layerName%>goSearch();
	$("input[name='clsCd']", "form[name='<%=layerName%>inputForm']").prop("disabled", true);
	
	<%=layerName%>formDisableSet(true);
});

//코드명에서 엔터시
$('input[name=schCdNm]').keydown(function(key) {
	if(key.keyCode == 13){
		<%=layerName%>goSearch();
		$("input[name='clsCd']", "form[name='<%=layerName%>inputForm']").prop("disabled", true);
		
		<%=layerName%>formDisableSet(true);
	}
});

//신규 코드 추가
$('.content .section-wrap .boxcontent.<%=layerName%> .section-top .btn-group a.new').click(function(){
	$(".<%=layerName%> #newGb").val("I");
	$(".<%=layerName%> #addDtlCd").css("display","none");
	
	$("input[name='clsCd']", "form[name='<%=layerName%>inputForm']").prop("disabled", false);
	<%=layerName%>formDisableSet(false);
});

//저장
$('.content .section-wrap .boxcontent.<%=layerName%> .section-top .btn-group a.save').click(function(){
	var newGb = $(".<%=layerName%> #newGb").val();
	var newGbDtl = $(".<%=layerName%> #newGbDtl").val();
	
	// 업데이트할 필드와 값 설정
	var item = new Object();
	item.clsCd = $(".<%=layerName%> #clsCd").val();
	item.cdNm = $(".<%=layerName%> #cdNm").val();
	var useYnView = $(".<%=layerName%> #useYn").val();
	var useYn = "";
	if (useYnView  == "1"){
		useYnView = "사용";
		useYn ="1";
	} else {
		useYnView = "미사용";
		useYn ="0";
	}
	item.useYnView = useYnView;
	item.useYn = useYn;
	
	var comBizYnView = $(".<%=layerName%> #comBizYn").val();
	var comBizYn = "";
	if (comBizYnView  == "1"){
		comBizYnView = "사용";
		comBizYn = "1";
	} else {
		comBizYnView = "미사용";
		comBizYn = "0";
	}
	item.comBizYnView = comBizYnView;
	item.comBizYn = comBizYn;
	
	item.ref1Val = $(".<%=layerName%> #ref1Val").val();
	item.ref2Val = $(".<%=layerName%> #ref2Val").val();
	item.ref3Val = $(".<%=layerName%> #ref3Val").val();
	item.dtlDesc = $(".<%=layerName%> #dtlDesc").val();
	
	if (newGb == "I"){
		AUIGrid.addRow(<%=layerName%>myGridID, item, "first");
	}else{
		// 지정한 item 을 현재행(selectedIndex)에 업데이트함.
		AUIGrid.updateRow(<%=layerName%>myGridID, item, "selectedIndex");	
	}
	
	
	
	//////////////////////////////////////////////////////////////////////////
	
	// 추가된 행 아이템들(배열)
	var addedRowItems = AUIGrid.getAddedRowItems(<%=layerName%>myGridID);
	var addedRowItems2 = AUIGrid.getAddedRowItems(<%=layerName%>myGridID2);
	 
	// 수정된 행 아이템들(배열) : 수정된 필드와 수정안된 필드 모두를 얻음.
	var editedRowItems = AUIGrid.getEditedRowItems(<%=layerName%>myGridID);
	var editedRowItems2 = AUIGrid.getEditedRowItems(<%=layerName%>myGridID2);
	
	//추가
	if (newGb == "I"){
		if(addedRowItems.length > 0) {
			if(!<%=layerName%>formValid()){
				return;
			}
		
			var changeDataObj = [];
			for(i=0, len=addedRowItems.length; i<len; i++) {
				changeDataObj.push(addedRowItems[i]); // 행아이템
			}
			
			var sendData = changeDataObj;
			
		    GRIT.tran.send({
				url: "/sys/insertSysCommonCode",
				sendData: sendData,
				success: function(result){
					if(result.rtnCode == "0"){
						if(result.isExist == "Y"){
						 	GRIT.msg.alert("이미 존재하는 분류코드입니다.");
							
							AUIGrid.removeRow(<%=layerName%>myGridID, "selectedIndex");
						}else{
							$(".<%=layerName%> #newGb").val("");
							$(".<%=layerName%> #newGbDtl").val("");
						 	GRIT.msg.alert("저장하였습니다.");
					  		<%=layerName%>goSearch(false);
						}
				  	}
				}
			});
		}
	}else{
		//수정
		if(editedRowItems.length > 0) {
			if(!<%=layerName%>formValid()){
				return;
			}
			
			var changeDataObj = [];
			for(i=0, len=editedRowItems.length; i<len; i++) {
				changeDataObj.push(editedRowItems[i]); // 행아이템
			}
			
			var sendData = changeDataObj;
			
		    GRIT.tran.send({
				url: "/sys/updateSysCommonCodeNew",
				sendData: sendData,
				success: function(result){
					if(result.rtnCode == "0"){
					 	GRIT.msg.alert("저장하였습니다.");
				 		<%=layerName%>goSearch(true);
				 		//수정한 행 선택 필요
				  	}
				}
			});
		}
		
		//상세정보 코드추가
		if (newGbDtl == "I"){
			if(addedRowItems2.length > 0) {
				
				var changeDataObj = [];
				for(i=0, len=addedRowItems2.length; i<len; i++) {
					if(addedRowItems2[i]["cd"] == ""){
						alert("코드를 입력하여 주세요.");
						return false;
					}
					if(addedRowItems2[i]["cdNm"] == ""){
						alert("코드명을 입력하여 주세요.");
						return false;
					}
					if(addedRowItems2[i]["sortSeq"] == ""){
						alert("순서를 입력하여 주세요.");
						return false;
					}
					
					if (addedRowItems2[i]["useYn"] == "사용" || addedRowItems2[i]["useYn"] == "1"){
						addedRowItems2[i]["useYn"] = "1";	
					}else{
						addedRowItems2[i]["useYn"] = "0";
					}
					
					if (addedRowItems2[i]["comBizYn"] == "사용" || addedRowItems2[i]["comBizYn"] == "1"){
						addedRowItems2[i]["comBizYn"] = "1";	
					}else{
						addedRowItems2[i]["comBizYn"] = "0";
					}
		            
					changeDataObj.push(addedRowItems2[i]); // 행아이템
					/* rowItem = addedRowItems2[i]; // 행아이템
					// 전체 조회
					for(var name in rowItem) {
						str += name + " : " + rowItem[name] + ", ";	
					} */
				}
				
				var sendData = changeDataObj;
				
				//alert(JSON.stringify(sendData));
				
			    GRIT.tran.send({
					url: "/sys/insertSysCommonCodeDtl",
					sendData: sendData,
					success: function(result){
						if(result.rtnCode == "0"){
							if(result.isExist == "Y"){
							 	GRIT.msg.alert("이미 존재하는 분류코드입니다.");
							}else{
								$(".<%=layerName%> #newGb").val("");
								$(".<%=layerName%> #newGbDtl").val("");
							 	GRIT.msg.alert("저장하였습니다.");
						  		<%=layerName%>goSearch(false);
							}
					  	}
					}
				});
			}
		}else{
			//수정
			if(editedRowItems2.length > 0) {
				
				var changeDataObj = [];
				for(i=0, len=editedRowItems2.length; i<len; i++) {
					if(editedRowItems2[i]["cd"] == ""){
						alert("코드를 입력하여 주세요.");
						return false;
					}
					if(editedRowItems2[i]["cdNm"] == ""){
						alert("코드명을 입력하여 주세요.");
						return false;
					}
					if(editedRowItems2[i]["sortSeq"] == ""){
						alert("순서를 입력하여 주세요.");
						return false;
					}
					if (editedRowItems2[i]["useYn"] == "사용" || editedRowItems2[i]["useYn"] == "1"){
						editedRowItems2[i]["useYn"] = "1";	
					}else{
						editedRowItems2[i]["useYn"] = "0";
					}
					
					if (editedRowItems2[i]["comBizYn"] == "사용" || editedRowItems2[i]["comBizYn"] == "1"){
						editedRowItems2[i]["comBizYn"] = "1";	
					}else{
						editedRowItems2[i]["comBizYn"] = "0";
					}
					
					changeDataObj.push(editedRowItems2[i]); // 행아이템
				}
				
				var sendData = changeDataObj;
				//alert(JSON.stringify(sendData));
			    GRIT.tran.send({
					url: "/sys/updateSysCommonCodeDtl",
					sendData: sendData,
					success: function(result){
						if(result.rtnCode == "0"){
						 	GRIT.msg.alert("저장하였습니다.");
					 		<%=layerName%>goSearch(true);
					 		//수정한 행 선택 필요
					  	}
					}
				});
			}
		}
		
		
	}
});

//엑셀
$('.content .section-wrap .boxcontent.<%=layerName%> .section-top .btn-group a.exel').click(function(){
	var exportProps = [{
		sheetName : "분류코드"
	}, {
		sheetName : "분류코드 상세"
	
	}];
	// 다수의 그리드를 1개의 엑셀의 각각의 시트(Sheets)로  내보내기 하기
	AUIGrid.exportToXlsxMulti(<%=layerName%>myGridID, [<%=layerName%>myGridID2], exportProps);
});

//닫기
$('.content .section-wrap .boxcontent.<%=layerName%> .section-top .btn-group a.close').click(function(){
	mFnc.tabMenuClose('<%=layerName%>');
});

//상세코드 추가
$("#addDtlCd", "form[name='<%=layerName%>detailForm']").click(function(){
	$(".<%=layerName%> #newGbDtl").val("I");
	
	var item = new Object();
	item.clsCd = $(".<%=layerName%> #clsCd").val();
	item.cd = "";
	item.cdNm = "";
	item.dtlDesc = "";
	item.ref1Val = "";
	item.ref2Val = "";
	item.ref3Val = "";
	item.sortSeq = "";
	
	
	item.useYn = "";
	item.comBizYn = "";
	

	
	AUIGrid.addRow(<%=layerName%>myGridID2, item, "first");
	
	$("input[name='clsCd']", "form[name='<%=layerName%>inputForm']").prop("disabled", true);
	<%=layerName%>formDisableSet(true);

});

//AUIGrid 생성 후 반환 ID
var <%=layerName%>myGridID;
var <%=layerName%>myGridID2;
var <%=layerName%>useYnList = [{"code":"1", "value":"사용"}, {"code":"0", "value":"미사용"}];

// AUIGrid 칼럼 설정
var <%=layerName%>columnLayout = [ 
     {dataField : "clsCd",headerText : "분류코드",width : 100} 
    ,{dataField : "cdNm",headerText : "코드명",width : 100}
    ,{dataField : "dtlDesc",headerText : "설명",width : 100}
    ,{dataField : "ref1Val",headerText : "참조값1",width : 100}
    ,{dataField : "ref2Val",headerText : "참조값2",width : 100}
    ,{dataField : "ref3Val",headerText : "참조값3",width : 100}
    ,{dataField : "useYnView",headerText : "사용여부",width : 100}
    ,{dataField : "comBizYnView",headerText : "상업시설여부",width : 100}
    ,{dataField : "regDtm",headerText : "등록일자",width : 100}
    ,{dataField : "regrNm",headerText : "등록자",width : 100}
    ,{dataField : "modDtm",headerText : "수정일자",width : 100}
    ,{dataField : "modrNm",headerText : "수정자",width : 100}
    ];

var <%=layerName%>columnLayout2 = [ 
    {dataField : "cd",headerText : "코드",width : 100} 
   ,{dataField : "cdNm",headerText : "코드명",width : 100}
   ,{dataField : "dtlDesc",headerText : "설명",width : 100}
   ,{dataField : "ref1Val",headerText : "참조값1",width : 100}
   ,{dataField : "ref2Val",headerText : "참조값2",width : 100}
   ,{dataField : "ref3Val",headerText : "참조값3",width : 100}
   ,{dataField : "sortSeq",headerText : "순서",width : 100,
	   editRenderer  : {
		   onlyNumeric : true, // 0~9만 입력가능
	   }
   }
   ,{dataField : "useYn",headerText : "사용여부",width : 100,
		labelFunction : function(  rowIndex, columnIndex, value, headerText, item ) { 
			var retStr = value;
			for(var i=0,len=<%=layerName%>useYnList.length; i<len; i++) {
				if(<%=layerName%>useYnList[i]["code"] == value) {
					retStr = <%=layerName%>useYnList[i]["value"];
					break;
				}
			}
			return retStr;
		},
		editRenderer : {
			type : "DropDownListRenderer",
			list : <%=layerName%>useYnList, //key-value Object 로 구성된 리스트
			keyField : "code", // key 에 해당되는 필드명
			valueField : "value" // value 에 해당되는 필드명
		}
	}
   ,{dataField : "comBizYn",headerText : "상업시설여부",width : 100,
		labelFunction : function(  rowIndex, columnIndex, value, headerText, item ) { 
			var retStr = value;
			for(var i=0,len=<%=layerName%>useYnList.length; i<len; i++) {
				if(<%=layerName%>useYnList[i]["code"] == value) {
					retStr = <%=layerName%>useYnList[i]["value"];
					break;
				}
			}
			return retStr;
		},
		editRenderer : {
			type : "DropDownListRenderer",
			list : <%=layerName%>useYnList, //key-value Object 로 구성된 리스트
			keyField : "code", // key 에 해당되는 필드명
			valueField : "value" // value 에 해당되는 필드명
		}
	}
   ,{dataField : "regDtm",headerText : "등록일자",width : 100,editable : false}
   ,{dataField : "regrNm",headerText : "등록자",width : 100,editable : false}
   ,{dataField : "modDtm",headerText : "수정일자",width : 100,editable : false}
   ,{dataField : "modrNm",headerText : "수정자",width : 100,editable : false}
   ];
   
// 페이지 로딩 되면 실행
$(function () {
	$(".<%=layerName%> #addDtlCd").css("display","none");
	
	// AUIGrid 그리드를 생성합니다.
	<%=layerName%>createAUIGrid(<%=layerName%>columnLayout);
	<%=layerName%>createAUIGrid2(<%=layerName%>columnLayout2);
	
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
		var clsCd = primeCell.item.clsCd; // 분류코드
		$(".<%=layerName%> #rowIndex").val(primeCell.rowIndex);
		
		$(".<%=layerName%> #newGb").val("");
		$(".<%=layerName%> #newGbDtl").val("");
		$(".<%=layerName%> #addDtlCd").css("display","");
		
		//분류코드정보 설정
		<%=layerName%>setFieldToFormWindow(primeCell, item);
		
		//분류코드 상세정보
		<%=layerName%>goSearch2 (clsCd);
		
		$("input[name='clsCd']", "form[name='<%=layerName%>inputForm']").prop("disabled", true);
		<%=layerName%>formDisableSet(false);
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
		editable : true
	};
	
	// 실제로 #grid_wrap 에 그리드 생성
	<%=layerName%>myGridID2 = AUIGrid.create("#<%=layerName%>grid_wrap2", columnLayout, <%=layerName%>auiGridProps);
	
}

//셀 셀렉션 변경 시 아이템의 정보를 Form 필드에 세팅함
function <%=layerName%>setFieldToFormWindow(primeCell, item) {
	$(".<%=layerName%> #clsCd").val(item.clsCd);
	$(".<%=layerName%> #cdNm").val(item.cdNm);
	$(".<%=layerName%> #useYn").val(item.useYn);
	$(".<%=layerName%> #comBizYn").val(item.comBizYn);
	$(".<%=layerName%> #ref1Val").val(item.ref1Val);
	$(".<%=layerName%> #ref2Val").val(item.ref2Val);
	$(".<%=layerName%> #ref3Val").val(item.ref3Val);
	$(".<%=layerName%> #dtlDesc").val(item.dtlDesc);
}

function <%=layerName%>formDisableSet(disabledGb){
	$("input[name='cdNm']", "form[name='<%=layerName%>inputForm']").prop("disabled", disabledGb);
	$("select[name='useYn']", "form[name='<%=layerName%>inputForm']").prop("disabled", disabledGb);
	$("select[name='comBizYn']", "form[name='<%=layerName%>inputForm']").prop("disabled", disabledGb);
	$("input[name='ref1Val']", "form[name='<%=layerName%>inputForm']").prop("disabled", disabledGb);
	$("input[name='ref2Val']", "form[name='<%=layerName%>inputForm']").prop("disabled", disabledGb);
	$("input[name='ref3Val']", "form[name='<%=layerName%>inputForm']").prop("disabled", disabledGb);
	$("input[name='dtlDesc']", "form[name='<%=layerName%>inputForm']").prop("disabled", disabledGb);

}

//조회
function <%=layerName%>goSearch () {		
	$(".<%=layerName%> #newGb").val("");
	$(".<%=layerName%> #newGbDtl").val("");
	$(".<%=layerName%> #addDtlCd").css("display","none");
	
	var sendData = {cdNm : <%=layerName%>searchForm.schCdNm.value,
			procFgCd : "CLS"};
	
	// ajax 요청 전 그리드에 로더 표시
	AUIGrid.showAjaxLoader(<%=layerName%>myGridID);
	
	GRIT.tran.send({
		url: "/sys/getSysCodeList",
		sendData: sendData,
		success: function(result){
			// 그리드에 데이터 세팅
			// resData 는 JSON 을 파싱한 Array-Object 입니다.
			AUIGrid.setGridData(<%=layerName%>myGridID, result.data);
			//alert(JSON.stringify(result.data));
			//var gridData =  AUIGrid.getGridData(myGridID); 
			//var rowCount = gridData.length; //전체 조회수
			
			AUIGrid.setGridData(<%=layerName%>myGridID2, []);
			//분류코드정보 리셋
			<%-- <%=layerName%>formReset(); --%>
			
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

function <%=layerName%>formReset(){
	$("input[type='text'], input[type='checkbox'], select", "form[name='<%=layerName%>inputForm']")
	.not(":input[name^='sch'], select[name^='sch']")
	.val("").prop("checked", false);
	$("input[type='radio']", "form[name='<%=layerName%>inputForm']").prop("checked", false);
	$("select[name='useYn'], select[name='comBizYn']", "form[name='<%=layerName%>inputForm']").val("1");
}

//상세코드조회
function <%=layerName%>goSearch2 (clsCd) {	
	var sendData = {clsCd : clsCd};
	
	// ajax 요청 전 그리드에 로더 표시
	AUIGrid.showAjaxLoader(<%=layerName%>myGridID2);
	
	GRIT.tran.send({
		url: "/sys/getSysCodeByClsCd",
		sendData: sendData,
		success: function(result){
			// 그리드에 데이터 세팅
			// resData 는 JSON 을 파싱한 Array-Object 입니다.
			AUIGrid.setGridData(<%=layerName%>myGridID2, result.data);
			//alert(JSON.stringify(result.data));
			//var gridData =  AUIGrid.getGridData(myGridID); 
			//var rowCount = gridData.length; //전체 조회수
			
			// 로더 제거
			AUIGrid.removeAjaxLoader(<%=layerName%>myGridID2);
			
		},
		error: function(request, status, error){
			GRIT.msg.alert("공통코드를 조회하는데 문제가 발생했습니다.");
			// 로더 제거
			AUIGrid.removeAjaxLoader(<%=layerName%>myGridID2);
		},
		loading : false
	});
	
	
}

function <%=layerName%>formValid(){

	var formObj = $("form[name='<%=layerName%>inputForm']");

	if($.trim($("input[name='clsCd']", formObj).val()) == ""){
		GRIT.msg.alert("분류코드를 입력하여 주세요.", function(){$("input[name='clsCd']", formObj).focus();}());
		return false;
	}
	if($.trim($("input[name='cdNm']", formObj).val()) == ""){
		GRIT.msg.alert("코드명을 입력하여 주세요.", function(){$("input[name='cdNm']", formObj).focus();}());
		return false;
	}

	return true;

}

function <%=layerName%>fnChkByte(obj, maxByte){
	var str = obj.value;
	var str_len = str.length;

	var rbyte = 0;
	var rlen = 0;
	var one_char = "";
	var str2 = "";

	for(var i=0; i<str_len; i++){
		one_char = str.charAt(i);
		if(escape(one_char).length > 4){
		    rbyte += 2;                                         //한글2Byte
		}else{
		    rbyte++;                                            //영문 등 나머지 1Byte
		}

		if(rbyte <= maxByte){
		    rlen = i+1;                                          //return할 문자열 갯수
		}
	}

	if(rbyte > maxByte){
		//GRIT.msg.alert("한글 "+(maxByte/2)+"자 / 영문 "+maxByte+"자를 초과 입력할 수 없습니다.");
	    str2 = str.substr(0,rlen);                                  //문자열 자르기
	    obj.value = str2;
	    fnChkByte(obj, maxByte);
	}else{
	    //document.getElementById('byteInfo').innerText = rbyte;
	}
}

</script>
