<%@ page import="kr.co.grit.common.util.SessionUtil"%>
<%@ page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- rMateChartH5 에서 사용하는 스타일 -->
<link rel="stylesheet" type="text/css" href="/resources/js/rMateChartH5Web_v6.0_EN_Trial/rMateChartH5/Assets/Css/rMateChartH5.css"/>
<!-- rMateChartH5 라이센스 -->
<script language="javascript" type="text/javascript" src="/resources/js/rMateChartH5Web_v6.0_EN_Trial/LicenseKey/rMateChartH5License.js"></script>
<!-- 실제적인 rMateChartH5 라이브러리 -->
<script type="text/javascript" src="/resources/js/rMateChartH5Web_v6.0_EN_Trial/rMateChartH5/JS/rMateChartH5.js"></script>
<!-- rMateChartH5 테마 js -->
<script type="text/javascript" src="/resources/js/rMateChartH5Web_v6.0_EN_Trial/rMateChartH5/Assets/Theme/theme.js"></script>

<!-- 샘플 작동을 위한 css와 js -->
<script type="text/javascript" src="/resources/js/rMateChartH5Web_v6.0_EN_Trial/Samples/Web/JS/common.js"></script>
<script type="text/javascript" src="/resources/js/rMateChartH5Web_v6.0_EN_Trial/Samples/Web/JS/sample_util.js"></script>
<!-- <link rel="stylesheet" type="text/css" href="/resources/js/rMateChartH5Web_v6.0_EN_Trial/Samples/Web/sample.css"/> -->

<%
	String layerName = request.getParameter("layerName");
%>

                <!-- titleWrap : start -->
                <div class="titleWrap">
                    <h1>프로그램 운영현황 조회</h1>
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
                    	<c:if test="${userGroupCd eq 'A' or userGroupCd eq 'B' or userGroupCd eq 'D' or userGroupCd eq 'E'}">
                    	<tr>
                    		<th>복지시설</th>
                    		<td colspan="9">
	                    		<c:if test="${userGroupCd eq 'A' or userGroupCd eq 'B' or userGroupCd eq 'E' }">
                    			<!-- 사용자 그룹 “A”, “B”인 경우 화면 -->
	                    			<input type="text" id="wffcltyCd" name="wffcltyCd" style="width:100px;" title="복지시설"
	                    			oninput="<%=layerName%>fn_removeLinkNm();"
	                    			onkeydown="<%=layerName%>fn_searchLinkCd(this.value)">
						        	<button type="button" class="iconSearchGlassBtn" onclick="<%=layerName%>fn_searchPop(); return false;">
						            	<img src="/resources/imagesV2/iconSearchGlass.png" class="iconSearchGlass">
						            </button>
						        	<input type="text" id="wffcltyNm" name="wffcltyNm" style="width:150px; margin-left: 0px" title="복지시설명"  readonly />
								</c:if>
								<c:if test="${userGroupCd eq 'D'}">
				        		<!-- 사용자 그룹 “D”인 경우 화면 -->
				        		<select id="wffcltyCd" name="wffcltyCd" style="text-align-last : center; width:270px" onchange="<%=layerName%>setLclas(this.value);">
				        			<option value="">선택</option>
									<c:if test="${!empty wffcltyList}">	
										<c:forEach var="list" items="${wffcltyList}">
										<option value="${list.wffcltyCd}">
											<c:out value="${list.wffcltyNm}" /></option>
										</c:forEach>
									</c:if>
				        		</select>
				        		</c:if>
				        		<!-- 사용자 그룹 “C”인 경우 화면 : 복지시설 조건 없음-->
                    		</td>
                    	</tr>
                    	</c:if>
                        <tr>
                            <th>기간</th>
                            <td>
								<input type="text" id="<%=layerName%>schFr" name="<%=layerName%>schFr" class="monthpicker" 
								title="" style="width:100px" maxlength="7" 
								onkeypress="<%=layerName%>fn_pressSys(this.form); " 
								onblur="<%=layerName%>checksDate(this.value)" 
								onKeyup="<%=layerName%>inputYMDNumber(this);" />
								<span style="margin-left:30px;">~</span>
								<input type="text" id="<%=layerName%>schTo" name="<%=layerName%>schTo" class="monthpicker" 
								title="" style="width:100px; margin-left:5px;" maxlength="7"  
								onkeypress="<%=layerName%>fn_pressSys(this.form);" 
								onblur="<%=layerName%>checkeDate(this.value)" 
								onKeyup="<%=layerName%>inputYMDNumber(this);" />                            </td>
                            <th>대분류</th>
                            <td>
                                <select id="schLclas" name="schLclas" style="width:140px; text-align-last : center" onchange="<%=layerName%>setMclas(this.value)">
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
				
                <div class="subtitleGroup">
                    <div class="subtitle">프로그램 조회</div>
                    <div class="subBtnGroup">
                    </div>
                </div>
				<!-- <div class="box-top">
					<h2>프로그램 조회</h2>
				</div> -->
				<input type="hidden" id="rowIndex"      name="rowIndex"      value=""/>
				<div class="box-wrap mb10">
					<div id="<%=layerName%>grid_wrap" style="height:305px"></div>
				</div>
				
				<div class="box-top">
					<h2>프로그램 실적</h2>
				</div>

				<table class="dataTable">
				    <colgroup>
				    	<col width="49%" />
				    	<col width="2%" />
				    	<col width="49%" />
				    </colgroup>				
				    <tr>
				    	<td style="height:240px">
				    		<div id="<%=layerName%>chartHolder1" style="height:230px"></div>
				    		<div style="text-align:center; margin-top:10px">전년대비 프로그램 운영횟수</div>
				    	</td>
				    	<td></td>
				    	<td>
				    		<div id="<%=layerName%>chartHolder2" style="height:230px"></div>
				    		<div style="text-align:center; margin-top:10px">전년대비 프로그램 참여인원</div>
				    	</td>
				    </tr>
				    </tbody>
				</table>
<script>
//조회 클릭시
$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .search').click(function(){
	<%=layerName%>loadData();
});

// 엑셀 다운로드
$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .exel').click(function(){
	<%=layerName%>exportTo();
});

// 닫기
$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .close').click(function(){
	mFnc.tabMenuClose('<%=layerName%>');
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
		{dataField : "wffcltyNm", headerText : "복지시설", width : "10%", style : "my-column-left"},
		{dataField : "programNm", width:"18%", headerText : "프로그램", style : "my-column-left"},
		{dataField : "ym", headerText : "년월", width : "8%"},
		{dataField : "operCnt", headerText : "운영횟수", width : "7%", style : "my-column-right"},
		{dataField : "partcptnNmpr", headerText : "참여인원", width : "7%", style : "my-column-right"},
		{dataField : "lclasNm",  headerText : "대분류", width : "10%", style : "my-column-left"},
		{dataField : "mclasNm",  headerText : "중분류", width : "10%", style : "my-column-left"},
		{dataField : "sclasNm",  headerText : "소분류", width : "10%", style : "my-column-left"},
		{dataField : "note", headerText : "비고", width : "20%", style : "my-column-left"},
   ];

/////////////////////////////////////////////////////////////////////////////////////////////////
<c:if test="${userGroupCd eq 'A' or userGroupCd eq 'B' or userGroupCd eq 'E'}">
//복지시설
function <%=layerName%>fn_searchLinkCd(value){

   if(event.keyCode != 13 && event.keyCode != 9){
   	   return false;
   }
   
   if($(".<%=layerName%> #wffcltyCd").val().length == "4" && $(".<%=layerName%> #wffcltyNm").val() != ""){
	   <%=layerName%>loadData();
	   return false;
   }
   
	var linkCd      = $(".<%=layerName%> #wffcltyCd").val();

	var sendData ={"wffcltyCd"      : linkCd};
   
       GRIT.tran.send({
		url: "/pop/searchWffcltyList",
		async: false,
		sendData: sendData,
		success: function(result){
			
			if(result.data.length > 1){
				if($(".<%=layerName%> #wffcltyCd").val() != ''){
       				<%=layerName%>fn_searchPop();        	
       			}
			}else if(result.data.length == 1){
				$(".<%=layerName%> #wffcltyCd").val(result.data[0].wffcltyCd);
				$(".<%=layerName%> #wffcltyNm").val(result.data[0].wffcltyNm);
				<%=layerName%>setLclas(result.data[0].wffcltyCd);
			}else{
				setTimeout(function(){
					GRIT.msg.alert("해당 복지시설이 존재하지 않습니다");
					},50);
				
				$(".<%=layerName%> #wffcltyCd").focus();
				$(".<%=layerName%> #wffcltyCd").val("");
			}
			
		},
		loadingTarget: "<%=layerName%>"
	}); 
	
}

//복지시설 팝업
function <%=layerName%>fn_searchPop(name){
	
		var layerName = "<%=layerName%>"; 
		 var url = "<c:url value='/pop/searchWffcltyPop?layerName="+layerName+"'/>";
		 var width="700";
		 var height="610";
		 var name="searchWffclty";
		 popitup(url, height, width, name);
}

//복지시설 callback
function <%=layerName%>setSearchWffcltyPop(item,  name){

	$(".<%=layerName%> #wffcltyCd").val(item.wffcltyCd);
	$(".<%=layerName%> #wffcltyNm").val(item.wffcltyNm);			
	<%=layerName%>setLclas(item.wffcltyCd);
}

//운영단체 이름 제거
function <%=layerName%>fn_removeLinkNm(){
	$(".<%=layerName%> #wffcltyNm").val("");
 }
</c:if>
//////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////////
<c:if test="${userGroupCd eq 'A' or userGroupCd eq 'B' or userGroupCd eq 'D' or userGroupCd eq 'E'}">
//조회조건 : 복지시설 select 선택시 대분류코드 셋팅
function <%=layerName%>setLclas(val){
	var sendData = {"linkCd"   : val};
	 GRIT.tran.send({
		url: "/pgm/selectWffcltyLclaCdList",
		async: false,
		sendData: sendData,
		success: function(result){
			//중분류 코드 셀렉트 박스 초기화
			$('.<%=layerName%> #schLclas option').remove();
			$('.<%=layerName%> #schLclas').append("<option value=''>전체</option>");
			//중소분류코드 셀렉트 박스 초기화
			$('.<%=layerName%> #schMclas option').remove();
			$('.<%=layerName%> #schMclas').append("<option value=''>전체</option>");
			$('.<%=layerName%> #schSclas option').remove();
			$('.<%=layerName%> #schSclas').append("<option value=''>전체</option>");
			if(val != ""){
				for(var i=0; i<result.data.length; i++){
					$('.<%=layerName%> #schLclas').append("<option value="+result.data[i].lclasCd+"> "+result.data[i].lclasNm+ "</option>");	
				}
			}
		},
		loadingTarget: "<%=layerName%>"
	});  
}
</c:if>
//////////////////////////////////////////////////////////////////////////////////////////

//엑셀 내보내기(Export);
function <%=layerName%>exportTo() {
	
	var excelList = AUIGrid.getGridData(<%=layerName%>myGridID);
	
	if(excelList.length == 0){
		setTimeout(function(){
			GRIT.msg.alert("프로그램 운영현황 조회 조회된 내용이 없습니다.");
		}, 50);
		return false;
	}
	
	AUIGrid.exportToXlsx(<%=layerName%>myGridID, {
		fileName : "프로그램_운영현황_조회",
		// 스타일 상태 유지 여부(기본값:true)
	});
}

//조회조건 대분류코드로 중분류코드 셋팅
function <%=layerName%>setMclas(val){
	var sendData = {"lclasCd" :val, "linkCd":$(".<%=layerName%> #wffcltyCd").val()};
	console.log(sendData);
	 GRIT.tran.send({
		url: "/pgm/selectWffcltyMclaCdList",
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
	var sendData = {"mclasCd" : val, "linkCd":$(".<%=layerName%> #wffcltyCd").val()};
	 GRIT.tran.send({
		url: "/pgm/selectWffcltySclaCdList",
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

//AUIGrid 서비스장애를 생성합니다.
function <%=layerName%>createAUIGrid(columnLayout) {
	var <%=layerName%>auiGridProps = {
		softRemoveRowMode : false,
		editable : false,
		rowHeight : 38,
		headerHeight : 38,
		fixedColumnCount : 1,
		selectionMode : "multipleCells",
		noDataMessage : "조회된 내용이 없습니다."
	};
	// 실제로 #grid_wrap 에 그리드 생성
	<%=layerName%>myGridID = AUIGrid.create("#<%=layerName%>grid_wrap", <%=layerName%>columnLayout, <%=layerName%>auiGridProps);
	// 선택 체인지 이벤트 바인딩
	AUIGrid.bind(<%=layerName%>myGridID, "selectionChange", function(event) {
		var primeCell = event.primeCell; // 선택 대표 셀
		var item = primeCell.item; // 행 정보
		<%=layerName%>setGrdToFrm(item);
		//$(".<%=layerName%> #rowIndex").val(primeCell.rowIndex);
	});
	
	// 그리드 ready 이벤트 바인딩
	AUIGrid.bind(<%=layerName%>myGridID, "ready", <%=layerName%>auiGridCompleteHandler);
}

//그리드 ready 이벤트 핸들러
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
	
	<c:if test="${userGroupCd eq 'A' or userGroupCd eq 'B' or userGroupCd eq 'E'}">
	if($(".<%=layerName%> #wffcltyCd").val()=="") {
		setTimeout(function(){
			GRIT.msg.alert("복지시설을 선택해주세요.");
		},50);
		$(".<%=layerName%> #wffcltyCd").focus();
		return false;
	}
	</c:if>
	
	<c:if test="${userGroupCd eq 'D' }">
	if($(".<%=layerName%> #wffcltyCd option:selected").val()=="") {
		setTimeout(function(){
			GRIT.msg.alert("복지시설을 선택해주세요.");
		}, 50);
		return false;
	}
	</c:if>
	
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
		GRIT.msg.alert('이용시작일이 종료일보다 날짜가 더 빠릅니다. 조회조건중 이용일을 수정 후 조회해주시길 바랍니다.');
		return false;
	}
	
	var sendData = {
			<c:if test="${userGroupCd eq 'A' or userGroupCd eq 'B' or userGroupCd eq 'D' or userGroupCd eq 'E'}">
			"linkCd" : $(".<%=layerName%> #wffcltyCd").val(),
			</c:if>
			"schFr" : $("#<%=layerName%>schFr").val(),
			"schTo" : $("#<%=layerName%>schTo").val(),
			"schLclasCd" : $(".<%=layerName%> #schLclas option:selected").val(),
			"schMclasCd" : $(".<%=layerName%> #schMclas option:selected").val(),
			"schSclasCd" : $(".<%=layerName%> #schSclas option:selected").val(),
			"schProgramNm" : $(".<%=layerName%> #schProgramNm").val()
	};
	AUIGrid.showAjaxLoader(<%=layerName%>myGridID);
	GRIT.tran.send({
		url: "/pgm/pgmOpStsSchList", //구현할차례
		sendData: sendData,
		success: function(data){
			// 그리드에 데이터 세팅
			AUIGrid.setGridData(<%=layerName%>myGridID, data.list);
			// 선택 체인지 이벤트 바인딩
			AUIGrid.bind(<%=layerName%>myGridID, "ready", <%=layerName%>auiGridCompleteHandler);
			//console.log(data.list[0]);
			if(data.list[0]) {
				<%=layerName%>setGrdToFrm(data.list[0])
			}else{
				var chartData = [];    
				document.getElementById("<%=layerName%>chart1").setData(chartData);
				document.getElementById("<%=layerName%>chart2").setData(chartData);
			}
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

function <%=layerName%>setGrdToFrm(item) {
	<%=layerName%>chartDraw('1', item.wffcltyCd, item.wffcltyNm, item.ym, item.programCd, item.programNm);
	<%=layerName%>chartDraw('2', item.wffcltyCd, item.wffcltyNm, item.ym, item.programCd, item.programNm);
}

function <%=layerName%>checksDate(obj){
	
	var yyyymmdd = obj.replace(/\-/g,'');
	
	if(!GRIT.date.isValidDate(yyyymmdd)){
		setTimeout(function(){
			GRIT.msg.alert("날짜형식이 잘못되었습니다.");
		}, 50);
		$(".<%=layerName%> #<%=layerName%>schFr").val("");
		$(".<%=layerName%> #<%=layerName%>schFr").focus();
		}
	}

function <%=layerName%>checkeDate(obj){
	var yyyymmdd = obj.replace(/\-/g,'');
	if(!GRIT.date.isValidDate(yyyymmdd)){
		setTimeout(function(){
			GRIT.msg.alert("날짜형식이 잘못되었습니다.");
		}, 50);
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
        	monthNames: ['1월(JAN)', '2월(FEB)', '3월(MAR)', '4월(APR)', '5월(MAY)', '6월(JUN)',
 	                    '7월(JUL)', '8월(AUG)', '9월(SEP)', '10월(OCT)', '11월(NOV)', '12월(DEC)'],
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
	
	
	<%=layerName%>chartDraw("1",null,null,null,null,"프로그램명");
	<%=layerName%>chartDraw("2",null,null,null,null,"프로그램명");
	
	/*
	<c:if test="${userGroupCd eq 'A' or userGroupCd eq 'B' or userGroupCd eq 'C'}">
	AUIGrid.resize(<%=layerName%>myGridID, '', 310);
	</c:if>
	<c:if test="${userGroupCd eq 'D'}">
	AUIGrid.resize(<%=layerName%>myGridID, '', 340);
	</c:if>
	*/
	
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

/*****************chart start****************/
// rMateChart 를 생성합니다.
//파라메터 (순서대로)
//1. 차트의 id ( 임의로 지정하십시오. )
//2. 차트가 위치할 div 의 id (즉, 차트의 부모 div 의 id 입니다.)
//3. 차트 생성 시 필요한 환경 변수들의 묶음인 chartVars
//4. 차트의 가로 사이즈 (생략 가능, 생략 시 100%)
//5. 차트의 세로 사이즈 (생략 가능, 생략 시 100%)
function <%=layerName%>chartDraw(type,wffcltyCd,wffcltyNm,ym,programCd,programNm) {
	if(type=='1') {
		$chart1 = "<%=layerName%>chart1";
		$chartHolder = "<%=layerName%>chartHolder1";
		$chartTitle = "운영횟수";
	} else {
		$chart1 = "<%=layerName%>chart2";
		$chartHolder = "<%=layerName%>chartHolder2";
		$chartTitle = "참여인원";
	}
	
	programNm = programNm.substr(0,34);
	
	rMateChartH5.create($chart1, $chartHolder, "", "100%", "230px");
	
	//스트링 형식으로 레이아웃 정의.
	var layoutStr =
		'<rMateChart backgroundColor="#FFFFFF" borderStyle="none">'
			+'<Options>'
				+'<Caption text="'+programNm+'"/>'
				+'<Legend />'
			+'</Options>'
			+'<NumberFormatter id="nft" precision="2"/>'
			+'<Line2DChart showDataTips="true" dataTipFormatter="{nft}">'
				+'<horizontalAxis>'
					+'<CategoryAxis id="hAxis" categoryField="months"/>'
				+'</horizontalAxis>'
				+'<verticalAxis>'
					+'<LinearAxis id="vAxis" title="'+$chartTitle+'"/>'
				+'</verticalAxis>'
				+'<series>'
					+'<Line2DSeries yField="tymData" displayName="기준년월">'
						+'<showDataEffect>'
							+ '<SeriesClip duration="1000"/>'
						+'</showDataEffect>'
					+'</Line2DSeries>'
					+'<Line2DSeries yField="bymData" displayName="전년기간">'
						+'<showDataEffect>'
							+ '<SeriesClip duration="1000"/>'
						+'</showDataEffect>'
					+'</Line2DSeries>'
				+'</series>'
			+'</Line2DChart>'
		+'</rMateChart>';

	var chartData;
	
	var sendData = {
			"chartType" : type,
			"wffcltyCd" : wffcltyCd,
			"programCd" : programCd,
			"ym" : ym
	};
	
	GRIT.tran.send({
		url: "/pgm/pgmOpStsSchChart",
		sendData: sendData,
		async : false,
		success: function(data){
			chartData = data.list;
			rMateChartH5.calls($chart1, {
				"setLayout" : layoutStr,
				"setData" : chartData
			});
		},
		error: function(request, status, error){
			setTimeout(function(){
				GRIT.msg.alert("차트 데이터를 조회하는데 문제가 발생했습니다.");
			},50);
		},
		loading : false
	});

}
/*****************chart start****************/
</script>

