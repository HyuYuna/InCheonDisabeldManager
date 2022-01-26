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
                    <h1>보조금 입금 관리</h1>
					<jsp:include page="../common/commonBtn.jsp">
						<jsp:param value="<%=layerName%>" name="layerName" />
					</jsp:include>                    
                </div>
                <!-- titleWrap : end -->
                
				<form name="<%=layerName%>searchForm1" onsubmit="return false;" autocomplete='off'>
					<table class="dataTable marginT10">
	                    <colgroup>
	                        <col style="width:12%">
	                        <col style="width:22%">
	                        <col style="width:12%">
	                        <col style="width:20%">
	                        <col style="width:12%">
	                        <col style="width:21%">
	                    </colgroup>
                    	<tbody>
                        	<tr>
								<th>입금일</th>
								<td class="title">
									<input type="text" id="<%=layerName%>fDate" name="<%=layerName%>fDate" style="width: 35%;" class="datepicker hover_disabled" onKeyup="inputYMDNumber(this);" onblur="<%=layerName%>checkFDate(this.value);" onkeypress="<%=layerName%>fn_pressSys(this.form);">
									<span style ="margin-left:30px;">~</span>
									<input type="text" id="<%=layerName%>eDate"name="<%=layerName%>eDate" style="width: 35%; margin-left: 5px;" class="datepicker hover_disabled" onKeyup="inputYMDNumber(this);" onblur="<%=layerName%>checkEDate(this.value);" onkeypress="<%=layerName%>fn_pressSys(this.form);">
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
						</tbody>
					</table>
				</form>

				<h2>보조금 입금 리스트</h2>

				<div class="box-wrap mb10">
					<div id="<%=layerName%>grid_wrap" style="height: 423px;"></div>
				</div>

				
							<table class="layoutTable">
								<tr>
									<td valign="top" style="width: *">
									<h2>보조금 입금 등록</h2>
										<form name="pymntRgstrForm" id="pymntRgstrForm" method="post" autocomplete='off'>
											<input type="hidden" id="linkCd" name="linkCd" value="" /> 
											<input type="hidden" id="saveMode" name="saveMode" value="" /> 
											<input type="hidden" id="rcpmnySeqno" name="rcpmnySeqno" value="" />
											<table cellpadding="0" cellspacing="0" class="dataTable" id="align_common" border="1">
												<colgroup>
													<col width="10%" />
													<col width="16%" />
													<col width="10%" />
													<col width="16%" />
												</colgroup>
												<tr>
													<th>복지시설</th>
													<td><input type="text" id="wffcltyNm" name="wffcltyNm" style="width: 100%; text-align: left;" class="onlynum" onkeydown="<%=layerName%>EnterFilter('rcpmnyDd');" title="복지시설" tabindex="1" value='${Wffclty.wffcltyNm}' disabled></td>
													
													<th><span class="essentialItem">입금일</span></th>
													<td><input type="text" id="rcpmnyDd" name="rcpmnyDd" style="width: 93%;" maxlength="10" title="입금일" onkeydown="<%=layerName%>EnterFilter('subsidyFg');" onKeyup="inputYMDNumber(this);" onblur="<%=layerName%>checkDate(this.value);" class="datepicker hover_disabled"></td>
												</tr>
													
												<tr>
													<th><span class="essentialItem">보조금 구분</span></th>
													<td><select id="subsidyFg" name="subsidyFg" onkeydown="<%=layerName%>EnterFilter('subsidyTp');" style="width: 100%; text-align-last: center;" tabindex="1">
															<option value="" hidden></option>
															<c:if test="${!empty sbspyClsfcList}">
																<c:forEach var="list" items="${sbspyClsfcList}">
																	<option value="${list.sbspyClsCd}">
																		<c:out value="${list.sbspyClsNm}" /></option>
																</c:forEach>
															</c:if>
													</select></td>
													
													<th><span class="essentialItem">보조금 유형</span></th>
													<td><select id="subsidyTp" name="subsidyTp" onkeydown="<%=layerName%>EnterFilter('rcpmnyAmt');" style="width: 100%; text-align-last: center;" tabindex="1">
															<option value="" hidden></option>
															<c:if test="${!empty typeGrantList}">
																<c:forEach var="list" items="${typeGrantList}">
																	<option value="${list.typeGrantCd}">
																		<c:out value="${list.typeGrantNm}" /></option>
																</c:forEach>
															</c:if>
													</select></td>
												</tr>
												<tr>
													<th><span class="essentialItem">입금금액</span></th>
													<td colspan="3"><input type="text" id="rcpmnyAmt" name="rcpmnyAmt" onkeydown="<%=layerName%>EnterFilter('note');" style="width: 37%; text-align: right;" class="onlynum" onkeyup="fn_comma(this)" maxlength="12" title="입금금액" tabindex="1">
													</td>
											
												<tr>
													<th><span class="essentialItem">사용여부</span></th>
													<td colspan="3"><select id="useFg" name="useFg" style="width: 37%; text-align-last: center;" title="사용여부" mandatory=true tabindex="1">
															<c:if test="${!empty useFgList}">
																<c:forEach var="list" items="${useFgList}">
																	<option value="${list.useFg}"><c:out
																			value="${list.useFgNm}" /></option>
																</c:forEach>
															</c:if>
													</select>
													</td>
												</tr>
												<tr>
													<th>비고</th>
													<td colspan="3"><input type="text" id="note" name="note" style="width: 100%; text-align: left;" onkeydown="<%=layerName%>EnterFilter('useFg');" class="onlynum" title="비고" onkeyup="checkByte(this, 100)" tabindex="1"></td>
												</tr>
												<!--  시설코드의 C02 -->
											</table>
										</form>
										</td>
								</tr>
							</table>
						</tr>
					</tbody>
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
		<%=layerName%>fn_newSys(0);
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
	                       	        {dataField : "rcpmnyDd"      ,headerText : "입금일자", width : "15%", dataType : "date", formatString : "yyyy-mm-dd",style : "my-column-center"}
	                       	       ,{dataField : "subsidyFgNm"      ,headerText : "보조금 구분", width : "10%", style : "my-column-center"}
	                       	       ,{dataField : "subsidyTpNm"      ,headerText : "보조금 유형", width : "15%", dataType : "date", formatString : "yyyy-mm-dd", style : "my-column-center" } 
	                       	       ,{dataField : "rcpmnyAmt"      ,headerText : "입금금액", dataType : "numeric", formatString : "#,##0", width : "15%", style : "my-column-right"} 
	                       	       ,{dataField : "note"      ,headerText : "비고"    ,width : "35%", style : "my-column-left"} 
	                       	       ,{dataField : "useFgNm"      ,headerText : "사용여부"    ,width : "10%", style : "my-column-center"}
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
		$(".<%=layerName%> #pymntRgstrForm").find("#saveMode").val("I");
		$(".<%=layerName%> #sehUserNm").focus();
		$(".<%=layerName%> #lvhsRsnEtcDetail").hide();
		$(".<%=layerName%> .thlvhsDdNm").hide();
		$(".<%=layerName%> .tdlvhsDdNm").hide();
		
		var _today1 = new Date();
		var _today2 = new Date().yyyymmdd();
		var firstDay, lastDay;

		firstDay = dayFormatChk(_today1, 1); //sysdate 첫일
		
		$(".<%=layerName%> #<%=layerName%>fDate").val(firstDay);	
		$(".<%=layerName%> #<%=layerName%>eDate").val(_today2);
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
		
		// 선택 체인지 이벤트 바인딩
		AUIGrid.bind(<%=layerName%>myGridID, "selectionChange", function(event) {
		
			var primeCell = event.primeCell; // 선택 대표 셀
			var item = primeCell.item; // 행 정보
			<%=layerName%>setFieldToFormWindow(primeCell, item);
			$(".<%=layerName%> #rowIndex").val(primeCell.rowIndex);
		});
		
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
	// 셀 셀렉션 변경 시 아이템의 정보를 Form 필드에 세팅함
	function <%=layerName%>setFieldToFormWindow(primeCell, item) {
		$(".<%=layerName%> #rcpmnySeqno").val(item.rcpmnySeqno);
		$(".<%=layerName%> #wffcltyCd").val(item.wffcltyCd);
		$(".<%=layerName%> #wffcltyNm").val(item.wffcltyNm);
		$(".<%=layerName%> #rcpmnyDd").val((item.rcpmnyDd).replace(/(\d{4})(\d{2})(\d{2})/, "$1-$2-$3"));
		$(".<%=layerName%> #subsidyFg").val(item.subsidyFg);
		$(".<%=layerName%> #subsidyTp").val(item.subsidyTp);
		$(".<%=layerName%> #rcpmnyAmt").val(numberComma(item.rcpmnyAmt));
		$(".<%=layerName%> #note").val(item.note);
		$(".<%=layerName%> #useFg").val(item.useFg);
		
		// 상태값
		$(".<%=layerName%> #pymntRgstrForm").find("#saveMode").val("U");
	}
	
	//엔터키 조회시
	function <%=layerName%>fn_pressSys(e){ 
    	if(event.keyCode == 13){ //javascript에서는 13이 enter키를 의미함 
    		<%=layerName%>loadData ();
		}
	}
	
	//조회
	function <%=layerName%>loadData () {
		
		var fDate = $(".<%=layerName%> #<%=layerName%>fDate").val();	
		var eDate = $(".<%=layerName%> #<%=layerName%>eDate").val();	
		var searchSubsidyFg = $(".<%=layerName%> #searchSubsidyFg").val();
		var searchSubsidyTp = $(".<%=layerName%> #searchSubsidyTp").val();
		
		if(!GRIT.date.compareDateFT(fDate, eDate)){
			GRIT.msg.alert('입금일 조회 중 시작날짜보다 종료일날짜 더 작습니다. 조회조건 종료일 수정 후 조회해주시길 바랍니다.');
			return false;
		}
		else if(fDate =='' || fDate ==null || eDate =='' || eDate ==null){
			GRIT.msg.alert('입금일을 입력 후 조회해주시길 바랍니다.');
		}
		var sendData = {"fDate" : fDate
				       ,"eDate" : eDate
				       ,"searchSubsidyFg" : searchSubsidyFg
				       ,"searchSubsidyTp" : searchSubsidyTp};
		
		// ajax 요청 전 그리드에 로더 표시
		AUIGrid.showAjaxLoader(<%=layerName%>myGridID);
		
		GRIT.tran.send({
			url: "/wfc/wlfpyMgmtGrid1",
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
	
	// 신규
	function <%=layerName%>fn_newAll() {
		if ( confirm ("신규로 입력 하시겠습니까?") ) {
			<%=layerName%>fn_newSys(1);
		}
	}
	
	//초기화
	function <%=layerName%>fn_newSys(val) {
		
		$(".<%=layerName%> #wffcltyNm").val("${Wffclty.wffcltyNm}");
		$(".<%=layerName%> #rcpmnyDd").val("");
		$(".<%=layerName%> #subsidyFg").val("");
		$(".<%=layerName%> #subsidyTp").val("");
		$(".<%=layerName%> #rcpmnyAmt").val("");
		$(".<%=layerName%> #note").val("");
		$(".<%=layerName%> #useFg").val("1");
		// 상태값
		$(".<%=layerName%> #pymntRgstrForm").find("#saveMode").val("I");
		if(val==1){
			$('.<%=layerName%> #rcpmnyDd').focus();
		}
	}
	
	//저장 체크
	function <%=layerName%>fn_savePyMgmt() {
		
		 if ( $(".<%=layerName%> #rcpmnyDd").val() == "" ) {
			$(".<%=layerName%> #rcpmnyDd").focus();
			GRIT.msg.alert("[입금일]은 필수 항목입니다."); return;
		}
		
		if ( $(".<%=layerName%> #subsidyFg").val() == "" ) {
			$(".<%=layerName%> #subsidyFg").focus();
			GRIT.msg.alert("[보조금 구분]는 필수 항목입니다."); return;
		}
		
		if ( $(".<%=layerName%> #subsidyTp").val() == "" ) {
			$(".<%=layerName%> #subsidyTp").focus();
			GRIT.msg.alert("[보조금 유형]는 필수 항목입니다."); return;
		}
		
		if ( $(".<%=layerName%> #rcpmnyAmt").val() == "" ) {
			$(".<%=layerName%> #rcpmnyAmt").focus();
			GRIT.msg.alert("[입금금액]는 필수 항목입니다."); return;
		}
		
		if ( $(".<%=layerName%> #useFg").val() == "" ) {
			$(".<%=layerName%> #useFg").focus();
			GRIT.msg.alert("[사용여부]는 필수 항목입니다."); return;
		}
		
		
			if( $(".<%=layerName%> #rcpmnyDd").val().length != "10"){
	
					$(".<%=layerName%> #lvhsDd").focus();
				GRIT.msg.alert("[입금일]을 올바르게 입력해주세요."); return;
			}
		
		if ( $(".<%=layerName%> #useFg").val() == "" ) {
			$(".<%=layerName%> #useFg").focus();
			GRIT.msg.alert("[사용여부]는 필수 항목입니다."); return;
		}
		
		if(confirm("저장 하시겠습니까?")){
			<%=layerName%>fn_save();
	    } 
	}
	
	//저장
	function <%=layerName%>fn_save(){
        
		var sendData = $(".<%=layerName%> form[name=pymntRgstrForm]").serializeObject();
         GRIT.tran.send({
			url: "/wfc/saveWlfpyMgmt",
			async: false,
			sendData: sendData,
			success: function(result){
				if(result.rtnCode == "0"){
					GRIT.msg.alert(result.message);
					var saveMode = $(".<%=layerName%> #saveMode").val();
					if (saveMode == "I"){
						var linkCd = $(".<%=layerName%> #linkCd").val();
						if (linkCd == ""){
							var itmName = $(".<%=layerName%> #itmName").val();
							$(".<%=layerName%> #searchItmName").val( itmName );
						}else{
							$(".<%=layerName%> #searchItmName").val( linkCd );	
						}
						
					}
					<%=layerName%>loadData ();
				}else{
					GRIT.msg.alert(result.message);
				}
				<%=layerName%>fn_newSys(0);
			},
 			loadingTarget: "<%=layerName%>"
 		}); 
	}
	
	function <%=layerName%>wffcltyTp(){
	var wffcltyTp = $(".<%=layerName%> #<%=layerName%>wffcltyTp").val();
	var aClass = $(".<%=layerName%> .aClass");
	var bClass = $(".<%=layerName%> .bClass");
	var cClass = $(".<%=layerName%> .cClass");
	
	if(wffcltyTp == 'A01'||wffcltyTp == 'A02'||wffcltyTp == 'A03'||wffcltyTp =='A04' ){
		aClass.show();
		bClass.hide();
		cClass.hide();
	} else if(wffcltyTp == 'B01'||wffcltyTp == 'B02'||wffcltyTp == 'B03' ){
		aClass.hide();
		bClass.show();
		cClass.hide();
	} else if(wffcltyTp == 'C02' ){
		aClass.hide();
		bClass.hide();
		cClass.show();
	}
}

	//엔터키 이동
	function <%=layerName%>EnterFilter(next) { 
		if (event.keyCode == 13) {
			if (next == "commit"){
				<%=layerName%>fn_regItemMst();
			}else{
				$('.<%=layerName%> #'+next).focus();
			}	
		}
	}
	
function <%=layerName%>checkDate(obj){
		
		var yyyymmdd = obj.replace(/\-/g,'');
		
		if(!GRIT.date.isValidDate(yyyymmdd)){
			GRIT.msg.alert("날짜형식이 잘못되었습니다.");
			$(".<%=layerName%> #<%=layerName%>rcpmnyDd").val("");
			$(".<%=layerName%> #<%=layerName%>rcpmnyDd").focus();
			}
		}
		
function <%=layerName%>checkFDate(obj){
	
	var yyyymmdd = obj.replace(/\-/g,'');
	
	if(!GRIT.date.isValidDate(yyyymmdd)){
		GRIT.msg.alert("날짜형식이 잘못되었습니다.");
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
	
//엑셀 내보내기(Export);
function <%=layerName%>exportTo() {
		var excelList = AUIGrid.getGridData(<%=layerName%>myGridID);
		
		if(excelList.length == 0){
			GRIT.msg.alert("보조금 입금 리스트 조회된 내용이 없습니다.");
			return false;
		}
	
		AUIGrid.exportToXlsx(<%=layerName%>myGridID, {
			fileName : "보조금_입금_관리_내역",
			// 스타일 상태 유지 여부(기본값:true)
		});
	}
</script>

