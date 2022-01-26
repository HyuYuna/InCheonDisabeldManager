<%@ page import="kr.co.grit.common.util.SessionUtil"%>
<%@ page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
	String layerName = request.getParameter("layerName");
%>

				<!-- titleWrap : start -->
                <div class="titleWrap">
                    <h1>보조금 입금 조회</h1>
					<jsp:include page="../common/commonBtn.jsp">
						<jsp:param value="<%=layerName%>" name="layerName" />
					</jsp:include>                    
                </div>
                <!-- titleWrap : end -->
                
				<form name="<%=layerName%>searchForm1" onsubmit="return false;" autocomplete='off'>
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
                    		<th>복지시설</th>
                    			<td style="border-right: none;">
	                    			<input type="text" id="wffcltyCd" name="wffcltyCd" style="width:40%;" title="복지시설" oninput="<%=layerName%>fn_removeLinkNm();" onkeydown="<%=layerName%>fn_searchLinkCd(this.value)">
							        	<button type="button" class="iconSearchGlassBtn" onclick="<%=layerName%>fn_searchPop(); return false;">
							            	<img src="/resources/imagesV2/iconSearchGlass.png" class="iconSearchGlass">
							            </button>
							        	<input type="text" id="wffcltyNm" name="wffcltyNm" style="width:50%; margin-left: 0px" title="복지시설명"  readonly /> 
								</td>
								
								<th>보조금 유형</th>
								<td class="title">
									<select id="searchSubsidyTp" name="searchSubsidyTp" style="width: 100%; text-align-last: center;" tabindex="1">
										<option value="">전체</option>
										<c:if test="${!empty typeGrantList}">
											<c:forEach var="list" items="${typeGrantList}">
												<option value="${list.typeGrantCd}">
													<c:out value="${list.typeGrantNm}" /></option>
											</c:forEach>
										</c:if>
									</select>
								</td>
                    	</tr>
                        	<tr>
								<th>입금일</th>
								<td class="title">
									<input type="text" id="<%=layerName%>fDate" name="<%=layerName%>fDate" style="width: 40%;" class="datepicker hover_disabled" onKeyup="inputYMDNumber(this);" onblur="<%=layerName%>checkFDate(this.value);" onkeypress="<%=layerName%>fn_pressSys(this.form); ">
									<span style ="margin-left:30px;">~</span>
									<input type="text" id="<%=layerName%>eDate"name="<%=layerName%>eDate" style="width: 40%; margin-left: 5px;" class="datepicker hover_disabled" onKeyup="inputYMDNumber(this);" onblur="<%=layerName%>checkEDate(this.value);" onkeypress="<%=layerName%>fn_pressSys(this.form); ">
								</td>

								<th>보조금 구분</th>
								<td class="title">
									<select id="searchSubsidyFg" name="searchSubsidyFg" style="width: 100%; text-align-last: center;" tabindex="1">
										<option value="">전체</option>
										<c:if test="${!empty sbspyClsfcList}">
											<c:forEach var="list" items="${sbspyClsfcList}">
												<option value="${list.sbspyClsCd}">
													<c:out value="${list.sbspyClsNm}" /></option>
											</c:forEach>
										</c:if>
									</select>
								</td>
							</tr>
						</tbody>
					</table>
				</form>

				<h2>보조금 입금 리스트</h2>

				<div class="box-wrap mb10">
					<div id="<%=layerName%>grid_wrap" style="height: 621px;"></div>
				</div>

				
				<table class="layoutTable">
					<tr>
						<td valign="top" style="width: *">
						<form name="wlfpyListVwForm" id="wlfpyListVwForm" method="post" autocomplete='off'>
								<input type="hidden" id="linkCd" name="linkCd" value="" /> 
								<input type="hidden" id="saveMode" name="saveMode" value="" /> 
								<input type="hidden" id="rcpmnySeqno" name="rcpmnySeqno" value="" />
								</table>
							</form>
							</td>
					</tr>
				</table>
						

<style type="text/css">
/** 헤더 툴팁 아이콘 스타일 */
.tooltip-icon {
	background: url(/images/help_ico.png) no-repeat;
	width: 12px;
	height: 12px;
	cursor: default;
}

.tooltip {
	position: relative;
	display: inline-block;
	/* border-bottom: 1px dotted black; */
}

.tooltipbox .tooltiptext {
	visibility: hidden;
	width: 120px;
	background-color: #fff;
	color: black;
	text-align: center;
	border-radius: 6px;
	border: 1px solid #5d7cd4;
	padding: 5px 0;
	position: absolute;
	z-index: 1;
	bottom: 150%;
	left: 50%;
	margin-left: -60px;
}

.tooltip-icon:hover .tooltipbox .tooltiptext {
	visibility: visible;
}

.my-column-right {
	text-align: right;
}

.my-column-center {
	text-align: center;
}

.my-column-left {
	text-align: left;
}
</style>

<script type="text/javascript">
	// 조회 클릭시
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .search').click(function(){
		<%=layerName%>loadData();
	});
	
	// 신규
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .new').click(function(){
		<%=layerName%>fn_newAll();
	});
	
	// 저장
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .save').click(function(){
		<%=layerName%>fn_savePyMgmt();
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
	
	// AUIGrid 생성 후 반환 ID
	var <%=layerName%>myGridID;
	
	// AUIGrid 칼럼 설정
	// AUIGrid 칼럼 설정
	var <%=layerName%>columnLayout  = [
	                                {dataField : "wffcltyNm"      ,headerText : "복지시설", width : "20%", style : "my-column-left"}   
	                       	       ,{dataField : "rcpmnyDd"      ,headerText : "입금일자", width : "8%", dataType : "date", formatString : "yyyy-mm-dd",style : "my-column-center"}
	                       	       ,{dataField : "subsidyFgNm"      ,headerText : "보조금 구분", width : "8%", style : "my-column-center"}
	                       	       ,{dataField : "subsidyTpNm"      ,headerText : "보조금 유형", width : "10%", style : "my-column-left" } 
	                       	       ,{dataField : "rcpmnyAmt"      ,headerText : "입금금액", dataType : "numeric", formatString : "#,##0", width : "10%", style : "my-column-right"} 
	                       	       ,{dataField : "note"      ,headerText : "비고"    ,width : "39%", style : "my-column-left"} 
	                       	       ,{dataField : "useFgNm"      ,headerText : "사용여부"    ,width : "5%", style : "my-column-center"}
	                       	       ];
	
	// 푸터 설정
	var footerLayout = [ {
		labelText : "합계금액",
		positionField : "rcpmnyDd",
		style : "aui-grid-my-column"
	}, {
		dataField : "rcpmnyAmt",
		positionField : "rcpmnyAmt",
		operation : "SUM",
		formatString : "#,##0",
		style : "my-column-right"
	}];
	
	$(function () {
		$(".<%=layerName%> .datepicker").datepicker({
	        changeMonth: true,
	        changeYear: true,
	        yearRange: year_range,
	        showOn: "both",
	        buttonImage: "/resources/images/btn_cal.png",
	        buttonImageOnly: true,
	        buttonText: "선택하세요",
	        inline: true,
	        duration: 300,
	        showAnim: "slideDown"
	    });
		// AUIGrid 그리드를 생성합니다.
		<%=layerName%>createAUIGrid(<%=layerName%>columnLayout);
		
		// 데이터 요청, 요청 성공 시 AUIGrid 에 데이터 삽입합니다.
		var _today1 = new Date();
		var firstDay;

		firstDay = dayFormatChk(_today1, 1); //sysdate 첫일
		
		$(".<%=layerName%> #<%=layerName%>fDate").val(firstDay);	
		$(".<%=layerName%> #<%=layerName%>eDate").val(new Date().yyyymmdd());
	});
	
	

	// AUIGrid 를 생성합니다.
	function <%=layerName%>createAUIGrid(columnLayout) {
		
		var <%=layerName%>auiGridProps = {
			showFooter : true,
			showRowCheckColumn : false,
			rowHeight : 38,
			headerHeight : 38,
			noDataMessage : "조회된 내용이 없습니다."
		};
		
		// 실제로 #grid_wrap 에 그리드 생성
		<%=layerName%>myGridID = AUIGrid.create("#<%=layerName%>grid_wrap", columnLayout, <%=layerName%>auiGridProps);
		
		// 그리드 ready 이벤트 바인딩
		AUIGrid.bind(<%=layerName%>myGridID, "ready", <%=layerName%>auiGridCompleteHandler);
		
		// 푸터 레이아웃 세팅
		AUIGrid.setFooter(<%=layerName%>myGridID, footerLayout);
	}

	// 그리드 ready 이벤트 핸들러
	function <%=layerName%>auiGridCompleteHandler(event) {
		var rowIndex = $(".<%=layerName%> #rowIndex").val();
		
		if (rowIndex != ""){
			AUIGrid.setSelectionByIndex(<%=layerName%>myGridID, rowIndex); // 선택한 셀 선택되도록 지정
		}else{
			AUIGrid.setSelectionByIndex(<%=layerName%>myGridID, 0, 0); // 첫번째 셀 선택되도록 지정
		}
	};
	
	//조회
	function <%=layerName%>loadData () {
		
		var wffcltyCd = $(".<%=layerName%> #wffcltyCd").val();	
		var fDate = $(".<%=layerName%> #<%=layerName%>fDate").val();	
		var eDate = $(".<%=layerName%> #<%=layerName%>eDate").val();	
		var searchSubsidyFg = $(".<%=layerName%> #searchSubsidyFg").val();
		var searchSubsidyTp = $(".<%=layerName%> #searchSubsidyTp").val();
		
		if(	$(".<%=layerName%> #<%=layerName%>eDate").val().length != "10"){
			GRIT.msg.alert("입금일 종료일 날짜형식이 잘못되었습니다.");
			$(".<%=layerName%> #<%=layerName%>eDate").focus();
			return;
		}
		
		if(!GRIT.date.compareDateFT(fDate, eDate)){
			GRIT.msg.alert('입금일 시작날짜가 종료일 날짜보다 더 작습니다. 기간을 수정 후 다시조회해주시길 바랍니다.');
			return false;
		}
		else if(fDate =='' || fDate ==null || eDate =='' || eDate ==null){
			GRIT.msg.alert('입금일 날짜를 입력 후 조회해주시길 바랍니다.');
			return;
		}
		
		if(	$(".<%=layerName%> #<%=layerName%>fDate").val().length != "10"){
			GRIT.msg.alert("입금일 시작일 날짜형식이 잘못되었습니다.");
			$(".<%=layerName%> #<%=layerName%>fDate").focus();
			return;
		}
		
		if(	$(".<%=layerName%> #wffcltyCd").val() != ""){
			if($(".<%=layerName%> #wffcltyCd").length == "4" ||$(".<%=layerName%> #wffcltyNm").val() == ""){
			$(".<%=layerName%> #wffcltyCd").focus();
			GRIT.msg.alert("복지시설 코드를 올바르게 조회 후 재 조회 해주시길 바랍니다.")
			return;
			}
		}
		
		var sendData = {"wffcltyCd" : wffcltyCd
					   ,"fDate" : fDate
				       ,"eDate" : eDate
				       ,"searchSubsidyFg" : searchSubsidyFg
				       ,"searchSubsidyTp" : searchSubsidyTp};
		
		// ajax 요청 전 그리드에 로더 표시
		AUIGrid.showAjaxLoader(<%=layerName%>myGridID);
		
		GRIT.tran.send({
			url: "/wfc/wlfpyListVwGrid1",
			sendData : sendData,
			success: function(result){
				// 그리드에 데이터 세팅
				// resData 는 JSON 을 파싱한 Array-Object 입니다.
				AUIGrid.setGridData(<%=layerName%>myGridID, result.data);
				
				// 로더 제거
				AUIGrid.removeAjaxLoader(<%=layerName%>myGridID);
	 			
				AUIGrid.setSelectionByIndex(<%=layerName%>myGridID, 0,0);
			},
			error: function(request, status, error){
				GRIT.msg.alert("사용자 조회하는데 문제가 발생했습니다.");
				// 로더 제거
				AUIGrid.removeAjaxLoader(<%=layerName%>myGridID);
			},
			loading : false
		});
	}
		
function <%=layerName%>checkFDate(obj){
	
	var yyyymmdd = obj.replace(/\-/g,'');
	
	if(!GRIT.date.isValidDate(yyyymmdd)){
		alert("날짜형식이 잘못되었습니다.");
		$(".<%=layerName%> #<%=layerName%>fDate").val("");
		$(".<%=layerName%> #<%=layerName%>fDate").focus();
		}
	}
	
function <%=layerName%>checkEDate(obj){
	
	var yyyymmdd = obj.replace(/\-/g,'');
	
	if(!GRIT.date.isValidDate(yyyymmdd)){
		GRIT.msg.alert("날짜형식이 잘못되었습니다.");
		$(".<%=layerName%> #<%=layerName%>eDate").val("");
		$(".<%=layerName%> #<%=layerName%>eDate").focus();
		}
	}
	
//복지시설
function <%=layerName%>fn_searchLinkCd(value){

	   if(event.keyCode != 13 && event.keyCode != 9){
	   	   return false;
	   }
	   
	   if($(".<%=layerName%> #wffcltyCd").val().length == "4" && $(".<%=layerName%> #wffcltyNm").val() != ""){
		   <%=layerName%>loadData();
		   return;
	   }
	   
		var linkCd      = $(".<%=layerName%> #wffcltyCd").val();

		var sendData ={"linkCd"      : linkCd};
	   
        GRIT.tran.send({
			url: "/bas/WffcltyList",
			async: false,
			sendData: sendData,
			success: function(result){
				if(result.data.length > 1){
					if($(".<%=layerName%> #wffcltyCd").val() != '' || $(".<%=layerName%> #wffcltyCd").val().length != 4){
        				<%=layerName%>fn_searchPop();        	
        			}
				}else if(result.data.length == 1){
					$(".<%=layerName%> #wffcltyCd").val(result.data[0].linkcd);
					$(".<%=layerName%> #wffcltyNm").val(result.data[0].linknm);
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
	}

	//운영단체 이름 제거
	function <%=layerName%>fn_removeLinkNm(){
			$(".<%=layerName%> #wffcltyNm").val("");
		 }
	
	//엑셀 내보내기(Export);
	function <%=layerName%>exportTo() {
		
		var excelList = AUIGrid.getGridData(<%=layerName%>myGridID);
		
		if(excelList.length == 0){
			GRIT.msg.alert("보조금 입금 리스트 조회된 내용이 없습니다.");
			return false;
		}
		
			AUIGrid.exportToXlsx(<%=layerName%>myGridID, {
				fileName : "보조금_입금_조회",
				// 스타일 상태 유지 여부(기본값:true)
			});
		}
</script>

