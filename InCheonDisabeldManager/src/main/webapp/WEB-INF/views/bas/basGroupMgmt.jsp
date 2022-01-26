<%@ page import="kr.co.grit.common.util.SessionUtil"%>
<%@ page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
    String layerName = request.getParameter("layerName");
%>
                <!-- titleWrap : start -->
                <div class="titleWrap">
                    <h1>운영주체관리</h1>
					<jsp:include page="../common/commonBtn.jsp">
						<jsp:param value="<%=layerName%>" name="layerName" />
					</jsp:include>                    
                </div>
                <!-- titleWrap : end -->
				
			    <table class="dataTable marginT10">
				    <colgroup>
				        <col style="width:8%">
                        <col style="width:17%">
                        <col style="width:8%">
                        <col style="width:17%">
                        <col style="width:8%">
                        <col style="width:17%;">
                        <col style="width:8%">
                        <col style="width:17%;">
				    </colgroup>
					<tbody>
					<tr>
						<form:form id="searchForm" name="searchForm" onsubmit="return false;">
							<tr>
								<th>운영주체명</th>
								<td class="title">
									<input type="text" id="searchOgnztNm" name="searchognztNm" style="width: 100%;" tabindex="1" onkeyup="checkByte(this, 80)" onkeypress="<%=layerName%>fn_pressSys(this.form);">
								</td>
								<th>대표자</th>
								<td class="title">
									<input type="text" id="searchRprsntvNm" name="searchRprsntvNm" style="width: 100%;" tabindex="1" onkeyup="checkByte(this, 40)" onkeypress="<%=layerName%>fn_pressSys(this.form);"> 
								</td>
								<th>운영주체구분</th>
								<td class="title">
									<select id="searchOgnztFg" name="searchOgnztFg" style="width:100%; text-align-last : center;">
										<option value="">전체</option>
										<c:if test="${!empty groupClsfcList}">
											<c:forEach var="list" items="${groupClsfcList}">
												<option value="${list.groupCode}">
													<c:out value="${list.groupNm}" /></option>
											</c:forEach>
										</c:if>
									</select>
								</td>
								<th>시설운영</th>
								<td class="title" style = "">
									<select id="searchWffcltyOperFg" name="searchWffcltyOperFg" style="width: 100%; text-align-last : center;">
										<option value="">전체</option>
										<c:if test="${!empty facOpList}">
											<c:forEach var="list" items="${facOpList}">
												<option value="${list.facCode}">
													<c:out value="${list.facNm}" /></option>
											</c:forEach>
										</c:if>
									</select>
								</td>
								</tr>
						</form:form>
					</tr>
					</tbody>
					</table>
					
						<table class="layoutTable">
						    <tr>
							    <td style="width:400px;" valign="top">
							        <!-- 그리드 영역 -->
							        
							        <div id="<%=layerName%>grid_wrap" style="height:659px;">
							        <h2>운영주체 리스트</h2>
							        <!-- 그리드 영역 -->
							    </td>                               
							    <td style="width:10px;">  </td>                            
							    <td valign="top" style="width:*">
							    <h2>운영주체정보</h2>
							        <form name="GrpForm" id="GrpForm" method="post" >
								        <input type="hidden" id="saveMode" name="saveMode" value=""/>
										<input type="hidden" id="userId" name="userId" value=""/>
										<input type="hidden" id="encChkNo" value="0"/>
				                    <table cellpadding="0" cellspacing="0"  class="dataTable" id="align_common" border="1" >
				                        <colgroup>
				                            <col width="9%" />
				                            <col width="20%" />
				                            <col width="9%" />
				                            <col width="20%" />
				                        </colgroup>
				                        <tr>
											<td colspan="4">
												<div class="submsg">
				                        		<span class = "redTitle">고유번호 등록/수정시 중복확인을 해야합니다</span>
				                        		</div>
				                        	</td>
				                        </tr>
				                        <tr>
				                            <th>운영주체코드</th>
				                            <td>
				                            <input type="text" id="ognztCd" name="ognztCd" style="width:100%; text-align:left;" title="운영주체코드" maxlength="5" tabindex="1" readonly>
				                            </td>
				                            <th><span class="essentialItem">운영주체구분</span></th>
				                            <td>
				                            	<select id="ognztFg" name="ognztFg" style="width:100%; text-align-last : center;" mandatory=true tabindex="1">
													<option value="" hidden></option>
													<c:if test="${!empty groupClsfcList}">
														<c:forEach var="list" items="${groupClsfcList}">
															<option value="${list.groupCode}">
																<c:out value="${list.groupNm}" /></option>
														</c:forEach>
														</c:if>
												</select>
				                            </td>
				                        </tr>
				                        <tr>
					                        <th><span class="essentialItem">운영주체명</span></th>
				                            <td colspan="3"><input type="text" id="ognztNm" name="ognztNm" style="width:100%;" mandatory=true title="운영주체명" maxlength="40" tabindex="1" onkeyup="checkByte(this, 80)" onkeydown="<%=layerName%>EnterFilter('rprsntvNm');"></td>
				                        </tr>
				                        <tr>
				                            <th><span class="essentialItem">대표자</span></th>
				                            <td style="border-right: none;"><input type="text" id="rprsntvNm" name="rprsntvNm" style="width:100%; text-align:left;" class="onlynum" title="대표자" mandatory=true  maxlength="13" tabindex="1" oninput="<%=layerName%>changeRprsntvNm();" onkeydown="<%=layerName%>EnterFilter('encPrmisnNo');" onkeyup="checkByte(this, 40)">
				                            <input type="hidden" id="hdenRprsntvNm" name="hdenRprsntvNm" value="">
				                            </td>
				                        <td colspan="2"  style="border-left: none;" />	
				                        </tr>
				                        
				                    	<tr>
				                    	<th><span class="essentialItem"><span id = "changNo" style = "font-weight: bold;">고유번호</span></span></th>
				                            <td><input type="text" id="encPrmisnNo" class ="onlynum" name="encPrmisnNo" style="width:70%; text-align:left;" title="고유번호" maxlength="50" tabindex="1" onkeydown="<%=layerName%>EnterFilter('encChk');" onkeyup="checkByte(this, 80); GRIT.event.removeChar(event);" onkeypress="GRIT.event.removeChar(event); ">
				                            <button type="button" class="normalBtn" id ="encChk" tabindex="1" onclick="<%=layerName%>chkData();" value="팝업_domainChk" style="width:85px;">중복확인</button>
				                            <input type="hidden" id="hdenEncPrmisnNo" name="hdenEncPrmisnNo" value="">
				                            </td>
				                        <th>팩스번호</th>
										<td><input type="text" id="faxNum" name="faxNum" style="width:100%;text-align:left;" class="onlynum" title="팩스번호"tabindex="1" onkeydown="<%=layerName%>EnterFilter('phoneNum1');" onkeyup="checkByte(this, 20); GRIT.event.removeChar(event);"> </td>
				                    	
				                    	</tr>
				                    	<tr>
				                    		<th>연락처1</th>
				                            <td><input type="text" id="phoneNum1" name="phoneNum1" style="width:100%;text-align:left;" class="onlynum" title="연락처1" tabindex="1" onkeydown="<%=layerName%>EnterFilter('phoneNum2');" onkeyup="checkByte(this, 20); GRIT.event.removeChar(event);"> </td>
				                            <th>연락처2</th>
				                            <td><input type="text" id="phoneNum2" name="phoneNum2" style="width:100%;text-align:left;" class="onlynum" title="연락처2" tabindex="1" onkeydown="<%=layerName%>EnterFilter('encPrmisnNo');" onkeyup="checkByte(this, 20); GRIT.event.removeChar(event);"> </td>				                            
				                    	</tr>
				                    	<tr>
				                    		<th>우편번호</th>
				                            <td colspan="3"><input type="text" id="zipCd" name="zipCd" style="width:36%;text-align:left;" class="onlynum" title="우편번호" tabindex="1" onkeydown="<%=layerName%>EnterFilter('addrBase');" readonly>
				                            <button type="button" class="iconSearchGlassBtn" tabindex="1" onClick="goPopup();"  value="팝업_domainChk">
				                            	<img src="/resources/imagesV2/iconSearchGlass.png" class="iconSearchGlass">
				                            </button></td>
											
										</tr>
				                    	<tr>
				                    		<th>기본주소</th>
				                            <td colspan="3"><input type="text" id="addrBase" name="addrBase" style="width:100%;text-align:left;" class="onlynum" title="기본주소" onkeydown="<%=layerName%>EnterFilter('addrDetail');" readonly > </td>
				                    	</tr>
				                    	<tr>
				                    		<th>상세주소</th>
				                            <td colspan="3"><input type="text" id="addrDetail" name="addrDetail" style="width:100%;text-align:left;" class="onlynum"  title="상세주소" onkeydown="<%=layerName%>EnterFilter('establishDd');" onkeyup="checkByte(this, 100)"> </td>
				                    	</tr>
				                       <tr>
				                    		<th>설립일자</th>
				                            <td><input type="text" id="establishDd" name="establishDd" style="width: 91%;" class="datepicker hover_disabled" onKeyup="inputYMDNumber(this);" maxlength="10" onblur ="<%=layerName%>checkJoinDd(this.value);" onkeydown="<%=layerName%>EnterFilter('chargerNm');"></td>
				                            <th>담당자</th>
				                            <td><input type="text" id="chargerNm" name="chargerNm" style="width:100%;text-align:left;" class="onlynum" title="담당자" tabindex="1" onkeydown="<%=layerName%>EnterFilter('executiveDetail');" onkeyup="checkByte(this, 40)" > </td>
				                    	</tr>
				                    	<tr>
				                    		<th>임원내역</th>
				                            <td colspan="3"><input type="text" id="executiveDetail" name="executiveDetail" style="width:100%;text-align:left;" class="onlynum" title="임원내역" onkeydown="<%=layerName%>EnterFilter('assets');" onkeyup="checkByte(this, 200);"> </td>
				                        </tr>
				                        <tr>
				                    		<th>자산</th>
				                            	<td><input type="text" id="assets" name="assets" style="width:78%;text-align:right;" class="onlynum" title="자산" tabindex="1" onkeydown="<%=layerName%>EnterFilter('memberCnt');" maxlength="6" onkeyup="<%=layerName%>inputNumberFormat(this);"> (단위:백만)</td>
				                        	<th>회원수</th>
				                            	<td><input type="text" id="memberCnt" name="memberCnt" style="width:100%;text-align:right;" class="onlynum" title="회원수" tabindex="1" onkeydown="<%=layerName%>EnterFilter('facOp');" maxlength="6" onkeyup="<%=layerName%>inputNumberFormat(this);"> </td>
				                        </tr>
				                    	<tr>
				                    		<th><span class="essentialItem">시설운영</span></th>
				                            <td>
				                            <select id="facOp" name="facOp" style="width:100%; text-align-last : center;" title="시설운영" mandatory=true tabindex="1">
													<c:if test="${!empty facOpList}">
														<c:forEach var="list" items="${facOpList}">
														<option value="${list.facCode}"><c:out value="${list.facNm}"/></option>
														</c:forEach>
													</c:if>
												</select>
				                            </td>
				                        <th><span class="essentialItem">사용여부</span></th>
				                            <td>
				                            <select id="useFg" name="useFg" style="width:100%; text-align-last : center;" title="사용여부" mandatory=true tabindex="1">
													<c:if test="${!empty useFgList}">
														<c:forEach var="list" items="${useFgList}">
														<option value="${list.useFg}"><c:out value="${list.useFgNm}"/></option>
														</c:forEach>
													</c:if>
												</select>
				                        </tr>
				                    </table>
				                    <div class="blank_10px"></div>
							    </td>
						    </tr> 
						</table>  
				<!-- E:section-top -->

<style type="text/css" >

	/** 헤더 툴팁 아이콘 스타일 */
	.tooltip-icon {
		background: url(/images/help_ico.png) no-repeat;
		width: 12px;
		height: 12px;
		cursor: default;
	}

	.tooltip{
	    position: relative;
	    display: inline-block;
	    /* border-bottom: 1px dotted black; */
	}
	.tooltipbox .tooltiptext{
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
	
	.tooltip-icon:hover .tooltipbox .tooltiptext{
	    visibility: visible;
	}
	
	.my-column-left {
		text-align: left;
	}
	
	.my-column-center {
		text-align: center;
	}
	
	.my-column-right {
		text-align: right;
	}
	
		.auiGridHeader{
	/*
	    background-color: #cad4e5;
	    border: 1px solid #b7b7b7;
	    text-align: center;
	    font-weight: 700;
	    *//*
		background: #cad4e5;
		color:#555;
		text-align: center;
		*/
		color:#ffffff;
		text-align: center;
		font-weight: 700;
		font-size: 13px;
		background: #cad4e5;
	}
	
	.essentialItem #changNo{
	margin: 0;
    padding: 0;
    color: #555;
    font-size: 14px;
    list-style: none;
    box-sizing: border-box;
    font-family: 'Noto Sans KR';
    font-style: normal;
    }

	.submsg span{color: #FF0000;}
</style>

<script type="text/javascript" >
	// 조회 클릭시
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .search').click(function(){
		<%=layerName%>fn_newGroup();
		<%=layerName%>loadData();
	});
	
	// 신규
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .new').click(function(){
		<%=layerName%>fn_newAll();
	});
	
	// 저장
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .save').click(function(){
		<%=layerName%>fn_regItemMst();
	});
	
	// 삭제
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .delete').click(function(){
		var items = AUIGrid.getSelectedItems(<%=layerName%>myGridID);
		 // 그리드 선택 row
		 var row = items[0].rowIndex;
		 var ognztNm = items[0].item.ognztNm;
		
		if(ognztNm != ''){
			if(confirm('"'+ognztNm+'"'+' 삭제하시겠습니까?')){
				 <%=layerName%>deleteBasGroup();
			}
		}
		else{
			alert("운영주체를 조회하고 해당하는 운영주체를 선택 후 삭제해주세요.");
		}
	});
	
	// 닫기
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .close').click(function(){
		mFnc.tabMenuClose('<%=layerName%>');
	});
	
	function goPopup(){
		// IE에서 opener관련 오류가 발생하는 경우, window에 이름을 명시해줍니다.
		window.name="jusoPopup";
		
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("/pop/jusoPop","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	}


	function jusoCallBack(addrBase, zipCd){
			// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
			
			document.GrpForm.zipCd.value = zipCd;
			document.GrpForm.addrBase.value = addrBase;
			
			
	}
	var jumin1;
	var jumin2;
	
	// AUIGrid 생성 후 반환 ID
	var <%=layerName%>myGridID;
	var <%=layerName%>strVatFlag;
	// AUIGrid 칼럼 설정
	var <%=layerName%>columnLayout = [
    {dataField : "ognztCd", headerText : "운영주체코드", width : 120 , style : "my-column-center", headerStyle:"auiGridHeader"}
    ,{dataField : "ognztNm", headerText : "운영주체명", width : 239 ,style : "my-column-left", headerStyle:"auiGridHeader"}
    ];
	
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
		 
		$('.<%=layerName%> #vatFlag').focus(function() {
			<%=layerName%>strVatFlag = $(this).val();
		});
		
		$(".<%=layerName%> #searchItmName").focus();
		
		// AUIGrid 그리드를 생성합니다.
		<%=layerName%>createAUIGrid(<%=layerName%>columnLayout);
		
		// 데이터 요청, 요청 성공 시 AUIGrid 에 데이터 삽입합니다.
		$(".<%=layerName%> #itemForm").find( "#datesStView").val(new Date().yyyymmdd());
		$(".<%=layerName%> #itemForm").find("#").val("I");
		
		$(".<%=layerName%> #GrpForm").find("#saveMode").val("I");
		$(".<%=layerName%> #GrpForm").find( "#facOp").val("1");
		$(".<%=layerName%> #GrpForm").find( "#useFg").val("1");
		$('.<%=layerName%> #ognztNm').focus();
	});
	
	//엔터키 조회시
	function <%=layerName%>fn_pressSys(e){ 
    	if(event.keyCode == 13){ //javascript에서는 13이 enter키를 의미함 
    		<%=layerName%>loadData ();
		}
	}
	
	// AUIGrid 를 생성합니다.
	function <%=layerName%>createAUIGrid(columnLayout) {
		
		var <%=layerName%>auiGridProps = {
			selectionMode : "singleCell",
			showRowCheckColumn : false,
			// Home, End 키가 칼럼의 시작과 끝으로 이동함.
			isColumnOriented : true,
			rowHeight : 38,
			headerHeight : 38,
			noDataMessage : "조회된 내용이 없습니다."
		};
		
		// 실제로 #grid_wrap 에 그리드 생성
		<%=layerName%>myGridID = AUIGrid.create("#<%=layerName%>grid_wrap", columnLayout, <%=layerName%>auiGridProps);
		
		// 선택 체인지 이벤트 바인딩
		AUIGrid.bind(<%=layerName%>myGridID, "selectionChange", function(event) {
			
			$(".<%=layerName%> #GrpForm").find( "#encChkNo").val("1");
			
			var primeCell = event.primeCell; // 선택 대표 셀
			var item = primeCell.item; // 행 정보
			<%=layerName%>setFieldToFormWindow(primeCell, item);
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
	};
	
	// 셀 셀렉션 변경 시 아이템의 정보를 Form 필드에 세팅함
	function <%=layerName%>setFieldToFormWindow(primeCell, item) {
		//상태값
		$(".<%=layerName%> #GrpForm").find("#saveMode").val("U");
		$(".<%=layerName%> #ognztCd").val(item.ognztCd);
		$(".<%=layerName%> #ognztNm").val(item.ognztNm);
		$(".<%=layerName%> #ognztFg").val(item.ognztFg);
		$(".<%=layerName%> #encPrmisnNo").val(item.encPrmisnNo);
		$(".<%=layerName%> #hdenEncPrmisnNo").val(item.encPrmisnNo);
		$(".<%=layerName%> #rprsntvNm").val(item.rprsntvNm);
		$(".<%=layerName%> #hdenRprsntvNm").val(item.rprsntvNm);
		var phoneNum1 = item.phoneNum1;
		if(phoneNum1 != "" && phoneNum1 != null){
			$(".<%=layerName%> #phoneNum1").val(chk_tel(item.phoneNum1));
		}
		else{
			$(".<%=layerName%> #phoneNum1").val(item.phoneNum1);
		}
		
		var phoneNum2 = item.phoneNum2;
		if(phoneNum2 != "" && phoneNum2 != null){
			$(".<%=layerName%> #phoneNum2").val(chk_tel(item.phoneNum2));
		}
		else{
			$(".<%=layerName%> #phoneNum2").val(item.phoneNum2);
		}
		var faxNum = item.faxNum;
		if(faxNum != "" && faxNum != null){
			$(".<%=layerName%> #faxNum").val(chk_tel(item.faxNum));
		}
		else{
			$(".<%=layerName%> #faxNum").val(item.faxNum);
		}
		$(".<%=layerName%> #zipCd").val(item.zipCd);
		$(".<%=layerName%> #addrBase").val(item.addrBase);
		$(".<%=layerName%> #addrDetail").val(item.addrDetail);
		$(".<%=layerName%> #establishDd").val(item.establishDd);
		$(".<%=layerName%> #executiveDetail").val(item.executiveDetail);
		$(".<%=layerName%> #chargerNm").val(item.chargerNm);
		$(".<%=layerName%> #assets").val(item.assets);
		$(".<%=layerName%> #memberCnt").val(item.memberCnt);
		$(".<%=layerName%> #facOp").val(item.wffcltyOperFg);
		$(".<%=layerName%> #useFg").val(item.useFg);
	}
	
	//행사코드
	function <%=layerName%>fn_evtCodeSet(linkCode){
		var sendData = {searchItmName : linkCode};
		
	}
	
	//엔터키 조회시
	function <%=layerName%>fn_pressItem(e){ 
    	if(event.keyCode == 13){ //javascript에서는 13이 enter키를 의미함 
    		<%=layerName%>loadData ();
		}
	}
	
	//조회
	function <%=layerName%>loadData () {
		
		/* if ( (searchItmName == ""  || searchItmName == null ) && 
			 (searchVendorName == ""  || searchVendorName == null ) &&
			 (searchClsName == ""  || searchClsName == null )) {
			 alert ( "조회 조건을 하나 이상 입력해주세요.");   return;
		};  */
		var searchOgnztNm      = $(".<%=layerName%> #searchOgnztNm").val();
		var searchRprsntvNm = $(".<%=layerName%> #searchRprsntvNm").val();
		var searchOgnztFg      = $(".<%=layerName%> #searchOgnztFg").val();
		var searchWffcltyOperFg = $(".<%=layerName%> #searchWffcltyOperFg").val();
		
		var sendData = {"searchOgnztNm" : searchOgnztNm
						,"searchRprsntvNm" : searchRprsntvNm
						,"searchOgnztFg" : searchOgnztFg
						,"searchWffcltyOperFg" : searchWffcltyOperFg};
		
		// ajax 요청 전 그리드에 로더 표시
		AUIGrid.showAjaxLoader(<%=layerName%>myGridID);
		
		GRIT.tran.send({
			url: "/bas/basGroupMgmtGrid1",
			sendData : sendData,
			success: function(result){
				// 그리드에 데이터 세팅
				// resData 는 JSON 을 파싱한 Array-Object 입니다.
				AUIGrid.setGridData(<%=layerName%>myGridID, result.data);
				
				//var gridData =  AUIGrid.getGridData(myGridID); 
				//var rowCount = gridData.length; //전체 조회수
				
				// 로더 제거
				AUIGrid.removeAjaxLoader(<%=layerName%>myGridID);
				AUIGrid.setSelectionByIndex(<%=layerName%>myGridID, 0,0);
	 			
			},
			error: function(request, status, error){
				GRIT.msg.alert("상품마스터 조회하는데 문제가 발생했습니다.");
				// 로더 제거
				AUIGrid.removeAjaxLoader(<%=layerName%>myGridID);
			},
			loading : false
		});
	}
	
	// 신규
	function <%=layerName%>fn_newAll() {
		if ( confirm ("신규로 입력 하시겠습니까?") ) {
			<%=layerName%>fn_newGroup();
			$(".<%=layerName%> #ognztFg").focus();
		}
	}
	
	//삭제
	function <%=layerName%>deleteBasGroup(){
		var GroupList = AUIGrid.getGridData(<%=layerName%>myGridID);
		
		if(GroupList.length == 0){
			GRIT.msg.alert("조회 후 삭제 할 수 있습니다.");
			return false;
		}
		
		var ognztCd = $(".<%=layerName%> #ognztCd").val();
		var sendData = {"ognztCd" : ognztCd
						,"jobDetail" : ognztCd};
		
        GRIT.tran.send({
			url: "/bas/deleteBasGroupMgmt",
			async: false,
			sendData: sendData,
			success: function(result){
				if(result.rtnCode == "0"){
					GRIT.msg.alert(result.message);
					<%=layerName%>loadData();
				}else if(result.rtnCode == "1"){
					GRIT.msg.alert(result.message);
					
				}else{
					GRIT.msg.alert(result.message);
				}
			},
			loadingTarget: "<%=layerName%>"
		}); 
		 
	}
	
	
	// 중복 확인 체크값
	var encChkNum = 0;
	
	//고유번호
	function <%=layerName%>chkData() {
		
		var changNo = $(".<%=layerName%> #GrpForm").find("#changNo").text();
		var ognztFg      = $(".<%=layerName%> #ognztFg").val();
		var rprsntvNm    = $(".<%=layerName%> #rprsntvNm").val();
		var encPrmisnNo  = $(".<%=layerName%> #encPrmisnNo").val();
		var sendData = {};
		
		if($(".<%=layerName%> #GrpForm").find( "#encPrmisnNo").val() == jumin1){
			GRIT.msg.alert("같은 ["+changNo+"]입니다. 다른["+changNo+"]입력하시고 다시 중복확인 바랍니다.");
			$(".<%=layerName%> #GrpForm").find( "#encChkNo").val("1");
			return;
		}
		
		if(ognztFg == ""){
				GRIT.msg.alert("중복 확인 전 운영주체구분은 필수 항목입니다.");
				return;
		}
		
		if(encPrmisnNo == ""  || encPrmisnNo == null ){
			GRIT.msg.alert ("중복 확인 전 입력은 필수 항목입니다");   
		return;
		}
		
		if(ognztFg == "E"){
			if ($(".<%=layerName%> #rprsntvNm").val() == $(".<%=layerName%> #hdenRprsntvNm").val()) {
				GRIT.msg.alert ("현재 운영주체에 등록되어있는 [대표자] 입니다."); return;
				if ($(".<%=layerName%> #encPrmisnNo").val() == $(".<%=layerName%> #hdenEncPrmisnNo").val()){
					GRIT.msg.alert ("현재 운영주체에 등록되어있는 ["+changNo+"] 입니다."); return;
				}
			}
		} else{
			if ($(".<%=layerName%> #encPrmisnNo").val() == $(".<%=layerName%> #hdenEncPrmisnNo").val()){
				GRIT.msg.alert ("해당 운영주체에 등록되어있는 ["+changNo+"] 입니다."); return;
			}
		}
		
		if(ognztFg == "E"){
			sendData = {"ognztFg" : ognztFg
						,"encPrmisnNo" : encPrmisnNo
						,"rprsntvNm"   : rprsntvNm};
		}
		else{
			sendData = {"ognztFg" : ognztFg
						,"encPrmisnNo" : encPrmisnNo};
		}
		
		GRIT.tran.send({
			url: "/bas/encChk",
			sendData : sendData,
			success: function(result){
				var changNo = $(".<%=layerName%> #GrpForm").find("#changNo").text();
				var encPrmisnNo = $(".<%=layerName%> #GrpForm").find( "#encPrmisnNo").val()
				if(changNo == "생년월일"){
					if(encPrmisnNo.length != 8){
						GRIT.msg.alert('생년월일는 8자리로 입력해주세요');
						return;
					}
				}
				
				if($(".<%=layerName%> #GrpForm").find( "#encPrmisnNo").val() == jumin1){
					GRIT.msg.alert("같은 ["+changNo+"]입니다. 다른["+changNo+"]입력하시고 다시 중복확인 바랍니다.");
					$(".<%=layerName%> #GrpForm").find( "#encChkNo").val("1");
					return;
				}
				else{
					// 사용가능한지 체크
					if(result.data == 0){
						GRIT.msg.alert("사용가능한 ["+changNo+"]입니다");
						$(".<%=layerName%> #GrpForm").find( "#encChkNo").val("1");
					} else if(result.data != 0 && $(".<%=layerName%> #GrpForm").find("#ognztFg").val() == "E"){
						if(confirm("중복되는 해당 [대표자]와 [생년월일]입니다. \n그래도 계속 진행하시겠습니까?")){
							$(".<%=layerName%> #GrpForm").find( "#encChkNo").val("1");
						}
						else{
							$(".<%=layerName%> #GrpForm").find( "#encChkNo").val("0");
							$(".<%=layerName%> #GrpForm").find( "#encPrmisnNo").val("");
						}
					} 
					else{
						GRIT.msg.alert("이미 존재하는 ["+changNo+"]입니다");
						$(".<%=layerName%> #GrpForm").find( "#encChkNo").val("0");
						return;
						}	
				}
				// 로더 제거
				AUIGrid.removeAjaxLoader(<%=layerName%>myGridID);
	 			
			},
			error: function(request, status, error){
				GRIT.msg.alert("중복확인 문제가 발생했습니다.");
				// 로더 제거
			},
			loading : false
		});
	}
	
	//
	function <%=layerName%>fn_newGroup() {
		$(".<%=layerName%> #GrpForm").find( "#ognztCd").val("");
		$(".<%=layerName%> #GrpForm").find( "#ognztFg").val("");
		$(".<%=layerName%> #ognztFg").attr('disabled', false);
		$(".<%=layerName%> #GrpForm").find( "#ognztNm").val("");
		$(".<%=layerName%> #GrpForm").find( "#itmType").val("");
		$(".<%=layerName%> #GrpForm").find( "#encPrmisnNo").val("");
		$(".<%=layerName%> #GrpForm").find( "#rprsntvNm").val("");
		$(".<%=layerName%> #GrpForm").find( "#phoneNum1").val("");
		$(".<%=layerName%> #GrpForm").find( "#phoneNum2").val("");
		$(".<%=layerName%> #GrpForm").find( "#faxNum").val("");
		$(".<%=layerName%> #GrpForm").find( "#zipCd").val("");
		$(".<%=layerName%> #GrpForm").find( "#addrBase").val("");
		$(".<%=layerName%> #GrpForm").find( "#addrDetail").val("");
		$(".<%=layerName%> #GrpForm").find( "#chargerNm").val("");
		$(".<%=layerName%> #GrpForm").find( "#executiveDetail").val("");
		$(".<%=layerName%> #GrpForm").find( "#assets").val("");
		$(".<%=layerName%> #GrpForm").find( "#memberCnt").val("");
		$(".<%=layerName%> #GrpForm").find( "#wffcltyOperFg").val("");
		$(".<%=layerName%> #GrpForm").find( "#facOp").val("1");
		$(".<%=layerName%> #GrpForm").find( "#useFg").val("1");
		$(".<%=layerName%> #GrpForm").find( "#establishDd").val("");
		$(".<%=layerName%> #encPrmisnNo").attr('disabled', false);
		$(".<%=layerName%> #GrpForm").find("#encChk").show();
		// 상태값
		$(".<%=layerName%> #GrpForm").find("#saveMode").val("I");
		$(".<%=layerName%> #GrpForm").find("#hdenRprsntvNm").val("");
		$(".<%=layerName%> #GrpForm").find("#hdenEncPrmisnNo").val("");
		$('.<%=layerName%> #ognztNm').focus();
	}
	
	
	
	
	//저장 체크
	function <%=layerName%>fn_regItemMst() {
		if ( $(".<%=layerName%> #ognztFg").val() == "" ) {
			$(".<%=layerName%> #ognztFg").focus();
			GRIT.msg.alert("[운영주체구분]은 필수 항목입니다."); return;
		}
		
		
		if ( $(".<%=layerName%> #ognztNm").val() == "" ) {
			$(".<%=layerName%> #ognztNm").focus();
			GRIT.msg.alert("[운영주체명]은 필수 항목입니다."); return;
		}
		
		if ( $(".<%=layerName%> #rprsntvNm").val() == "" ) {
			$(".<%=layerName%> #rprsntvNm").focus();
			GRIT.msg.alert("[대표자]는 필수 항목입니다."); return;
		}
		
		if ( $(".<%=layerName%> #encPrmisnNo").val() == "" ) {
			$(".<%=layerName%> #encPrmisnNo").focus();
			GRIT.msg.alert("["+$(".<%=layerName%> #GrpForm").find("#changNo").text()+"]은 필수 항목입니다."); return;
		}
		
		
		var regExp = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
		
		var phoneNum1 = $(".<%=layerName%> #phoneNum1").val();
		var phoneNum2 = $(".<%=layerName%> #phoneNum2").val();
		
		var phone1 = phoneNum1.substring(0,1);
		var phone2 = phoneNum2.substring(0,1);
		
		if ( phone1 == 0 ) {
			if ( $(".<%=layerName%> #phoneNum1").val() != "" ) {
				if (!regExp.test($(".<%=layerName%> #phoneNum1").val())) {
					GRIT.msg.alert("[연락처1] 형식이 잘못되었습니다.");
				      return;
				}
			}
		}
		
		if ( phone2 == 0 ) {
			if ( $(".<%=layerName%> #phoneNum2").val() != "" ) {
				if (!regExp.test($(".<%=layerName%> #phoneNum2").val())) {
					GRIT.msg.alert("[연락처2] 형식이 잘못되었습니다.");
				      return;
				}
			}
		}
		
		if ( $(".<%=layerName%> #establishDd").val().length != ""){
			if ( $(".<%=layerName%> #establishDd").val().length != "10") {
				$(".<%=layerName%> #establishDd").focus();
				GRIT.msg.alert("[설립일자]를  올바르게 입력해주세요."); return;
			}
		}
		if ( $(".<%=layerName%> #facOp").val() == "" ) {
			$(".<%=layerName%> #facOp").focus();
			GRIT.msg.alert("[시설운영]는 필수 항목입니다."); return;
		}
		if ( $(".<%=layerName%> #useFg").val() == '' ) {
			$(".<%=layerName%> #useFg").focus();
			GRIT.msg.alert("[사용여부]는 필수 항목입니다."); return;
		}
		
		if($(".<%=layerName%> #GrpForm").find("#ognztFg").val() == "E"){
			if ($(".<%=layerName%> #rprsntvNm").val() == $(".<%=layerName%> #hdenRprsntvNm").val()) {
				if ($(".<%=layerName%> #encPrmisnNo").val() == $(".<%=layerName%> #hdenEncPrmisnNo").val()){
					$(".<%=layerName%> #GrpForm").find("#encChkNo").val(1);
				}
			}
		} 
		
		if(($(".<%=layerName%> #GrpForm").find("#ognztFg").val() != "E")){
			if ($(".<%=layerName%> #encPrmisnNo").val() == $(".<%=layerName%> #hdenEncPrmisnNo").val()){
				$(".<%=layerName%> #GrpForm").find("#encChkNo").val(1);
			}
		}
		
		if($(".<%=layerName%> #GrpForm").find("#encChkNo").val() == 0){
			$(".<%=layerName%> #encChk").focus();
			var changNo = $(".<%=layerName%> #GrpForm").find("#changNo").text();
			GRIT.msg.alert(""+changNo+" 중복확인 후 저장 해야합니다."); return;
		}
		
		if(confirm("저장 하시겠습니까?")){
			<%=layerName%>fn_save();
	    }
		
	}
	
	//저장
	function <%=layerName%>fn_save(){
		$(".<%=layerName%> #ognztFg").attr('disabled', false);
		var sendData = $(".<%=layerName%> form[name=GrpForm]").serializeObject();
		
         GRIT.tran.send({
			url: "/bas/saveGroupInfo",
			async: false,
			sendData: sendData,
			success: function(result){
				if($(".<%=layerName%> #GrpForm").find("#ognztFg").val() == 'E' && $(".<%=layerName%> #GrpForm").find("#encChkNo").val() == '1'){
					$(".<%=layerName%> #GrpForm").find("#encPrmisnNo").val(jumin2);
				}
				if(result.rtnCode == "0"){
					GRIT.msg.alert(result.message);
					var saveMode = $(".<%=layerName%> #saveMode").val();
					if (saveMode == "I"){
						var linkCode = $(".<%=layerName%> #linkCode").val();
						if (linkCode == ""){
							var itmName = $(".<%=layerName%> #itmName").val();
							$(".<%=layerName%> #searchItmName").val( itmName );
						}else{
							$(".<%=layerName%> #searchItmName").val( linkCode );	
						}
						
					}
					
				}else{
					GRIT.msg.alert(result.message);
				}
				<%=layerName%>loadData();
				<%=layerName%>fn_newGroup();
			},
 			loadingTarget: "<%=layerName%>"
 		}); 
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
	
	//날짜 자동 하이픈(-) 함수
	function inputYMDNumber(obj) {



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

                    ymd += "-";

                    ymd += number.substr(6);

                }



                // @see 입력 가능 날짜 제한 기능 - 선택

                // if(ymd.length == 10) {

                //

                //     const birthDay = new Date(number.substr(0,4)+"/"+number.substr(4,2)+"/"+number.substr(6)+" 00:00:00");

                //     const limitDay = new Date("2000/10/04 23:59:59");

                //

                //     if(birthDay > limitDay) {

                //         alert("2000년 10월 04일 이후의 날짜는\n선택할 수 없습니다.");

                //         obj.value = "";

                //         obj.focus();

                //         return false;

                //     }

                // }



                obj.value = ymd;



            } else {

                GRIT.msg.alert("숫자 이외의 값은 입력하실 수 없습니다.");



                //@see 숫자와 하이픈(-)기호 이외의 모든 값은 삭제한다.

                obj.value = obj.value.replace(/[^0-9 ^\-]/g,"");

                return false;

            }

        } else {

            return false;

        }

    }
	
	function <%=layerName%>inputNumberFormat(obj) {
	    obj.value = comma(uncomma(obj.value));
	}

	function comma(str) {
	    str = String(str);
	    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	}

	function uncomma(str) {
	    str = String(str);
	    return str.replace(/[^\d]+/g, '');
	}
	
	function juminMasking(str) {
		 str = String(str);
		    return str.replace(/([0-9]{6})$/gi,"******");
	}	
	
	function <%=layerName%>checkJoinDd(obj){
		
		var yyyymmdd = obj.replace(/\-/g,'');
		
		if(!GRIT.date.isValidDate(yyyymmdd)){
			GRIT.msg.alert("날짜형식이 잘못되었습니다.");
			$(".<%=layerName%> #establishDd").val("");
			$(".<%=layerName%> #establishDd").focus();
			}
		}
/* 	function isLeapYear (str) {
	    return (year % 4 == 0) && ((year % 100 != 0) || (year % 400 == 0));
	} */
	function <%=layerName%>checkNum(e) {
        var keyVal = event.keyCode;
 
        if(((keyVal >= 48) && (keyVal <= 57))){
            return true;
        }
        else{
            GRIT.msg.alert("숫자만 입력가능합니다");
            return false;
        }
    }
	
	function <%=layerName%>changeRprsntvNm(){
		if($(".<%=layerName%> #GrpForm").find("#ognztFg").val() == "E"){
			$(".<%=layerName%> #GrpForm").find("#encChkNo").val("0");
		}
	}
</script>

