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
	/* Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");
	String grpCd = (String)userInfo.get("grpCd"); */
%>
 	   <!-- titleWrap : start -->
                <div class="titleWrap">
                    <h1>복지시설 종사자 관리</h1>
					<jsp:include page="../common/commonBtn.jsp">
						<jsp:param value="<%=layerName%>" name="layerName" />
					</jsp:include>                    
                </div>
                <!-- titleWrap : end -->
			    
						<form:form id="searchForm" name="searchForm" onsubmit="return false;">
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
                    	<c:if test="${userGroupCd == 'E'}">
									<tr>
										<th>복지시설</th> 
										<td style="border-right: none;"> 
											<input type="text" id="wffcltyCd" name="wffcltyCd" style="width:40%;" title="복지시설" oninput="<%=layerName%>fn_removeLinkNm();" onkeydown="<%=layerName%>fn_searchLinkCd(this.value);<%=layerName%>fn_selectWffcltyTp(this.value);">
						            			<button type="button" class="iconSearchGlassBtn" onclick="<%=layerName%>fn_searchPop(); return false;">
						            				<img src="/resources/imagesV2/iconSearchGlass.png" class="iconSearchGlass">
						            			</button>
						        				<input type="text" id="linkNm" name="linkNm" style="width:49%; margin-left: 0px" title="복지시설명"  readonly /> 
										</td>
										<td colspan="5" style="border-left: none;"/>
									</tr>
								</c:if>
                        	<tr>
								<th>종사자명</th>
								<td>
									<input type="text" id="searchWorkerNm" name="searchWorkerNm" style="width: 100%;" tabindex="1" onkeypress="<%=layerName%>fn_pressSys(this.form);" onkeyup="checkByte(this, 40)">
								</td>
								
								<th>직위</th>
								<td>
									<select id="searchPosition" name="searchPosition" style="width:100%; text-align-last : center;" title="직위" mandatory=true tabindex="1" onkeydown="<%=layerName%>EnterFilter('joinDd');">
										<option value ="">전체</option>
									</select>
								</td>
								
								<th>핸드폰번호</th>
								<td>
									<input type="text" id="searchEncMoblphonNum" name="searchEncMoblphonNum" maxlength="13" style="width: 100%;" tabindex="1" onkeypress="<%=layerName%>fn_pressSys(this.form);" onkeyup="checkByte(this, 20);GRIT.event.removeChar(event);"> 
								</td>
							</tr>
						</tbody>
						</table>
						</form:form>
					</tr>
					<tr style="height:10px;"></tr>
					<tr>
						<table class="layoutTable">
						    <tr>
							    <td style="width:400px;" valign="top">
							        <!-- 그리드 영역 -->
							        
							        <div id="<%=layerName%>grid_wrap" style="height:659px;">
							        <h2>종사자 리스트</h2>
							        <!-- 그리드 영역 -->
							    </td>                               
							    <td style="width:10px;">  </td>                            
							    <td valign="top" style="width:*">
							    <h2>종사자 정보</h2>
							        <form name="workerMgmtForm" id="workerMgmtForm" method="post" >
							        	<input type="hidden" id="fcltyType" name="fcltyType" value=""/>
							        	<input type="hidden" id="userGroupCd" name="userGroupCd" value="${userGroupCd}"/>
								        <input type="hidden" id="saveMode" name="saveMode" value="I"/>
								        <input type="hidden" id="linkCd" name="linkCd" value="${linkCd}"/>
										<input type="hidden" id="chkJumin" value="0"/>
										<input type="hidden" id="updateJuminNo" name="updateJuminNo" value = "1" />
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
				                        		<span class = "redTitle">종사자명+생년월일 등록/수정시 중복확인을 해야합니다</span>
				                        		</div>
				                        	</td>
				                        </tr>                                            
				                        <tr>
				                            <th>종사자 코드</th>
				                            <td colspan="3">
				                            <input type="text" id="workerId" name="workerId" style="width:39.2%; text-align:left;" title="종사자코드" maxlength="5" tabindex="1" onkeydown="<%=layerName%>EnterFilter('workerNm');" readonly>
				                            </td>
				                        </tr>
				                        <tr>
					                        <th><span class="essentialItem">종사자명</span></th>
				                            <td colspan="3"><input type="text" id="workerNm" name="workerNm" style="width:39.2%;" mandatory=true title="종사자명" maxlength="40" tabindex="1" oninput="<%=layerName%>changeValue();" onkeydown="<%=layerName%>EnterFilter('encMoblphonNum');" onkeyup="checkByte(this, 40)"></td>
				                        	<input type="hidden" id="hdenWorkerNm" name="hdenWorkerNm" value="">
				                        </tr>
				                        <tr>
				                    		<th>핸드폰번호</th>
				                            <td colspan="3"><input type="text" id="encMoblphonNum" name="encMoblphonNum" style="width:39.2%;text-align:left;" class="onlynum" title="핸드폰번호" maxlength="13" tabindex="1"  oninput="<%=layerName%>changeValue();" onkeydown="<%=layerName%>EnterFilter('encBirthDd');" onkeyup="checkByte(this, 50);GRIT.event.removeChar(event);" > </td>
				                    	</tr>
				                        <tr> 
				                        	<th><span class="essentialItem">생년월일</span></th>
				                            <td colspan="3"><input type="text" id="encBirthDd" name="encBirthDd" style="width:39.2%; text-align:left;" title="생년월일" maxlength="8" tabindex="1" onkeyup="GRIT.event.removeChar(event);" onkeydown="<%=layerName%>EnterFilter('juminChk');"  oninput="<%=layerName%>updateJuminNo();">
				                            <button type="button" class="normalBtn" id ="juminChk" tabindex="1" onclick="<%=layerName%>chkData();" value="팝업_domainChk" style="width:85px;">중복확인</button>
				                            <input type="hidden" id="hdenEncBirthDd" name="hdenEncBirthDd" value="">
				                            </td>
				                        </tr>
				                        <tr>
				                    		<th>우편번호</th>
				                            <td colspan="3"><input type="text" id="zipCd" name="zipCd" style="width:39.2%;text-align:left;" class="onlynum" title="우편번호" maxlength="6" onkeydown="<%=layerName%>EnterFilter('addrBase');" readonly>
				                            <button type="button" class="iconSearchGlassBtn" tabindex="1" onClick="<%=layerName%>goPopup();"  value="팝업_domainChk">
				                            	<img src="/resources/imagesV2/iconSearchGlass.png" class="iconSearchGlass">
				                            </button>
				                            </td>
											
										</tr>
				                    	<tr>
				                    		<th>기본주소</th>
				                            <td colspan="3"><input type="text" id="<%=layerName%>addrBase" name="addrBase" style="width:100%;text-align:left;" class="onlynum" title="기본주소" onkeyup="checkByte(this, 100)" onkeydown="<%=layerName%>EnterFilter('encAddrDetail');" readonly > </td>
				                    	</tr>
				                    	<tr>
				                    		<th>상세주소</th>
				                            <td colspan="3"><input type="text" id="encAddrDetail" name="encAddrDetail" style="width:100%;text-align:left;" title="상세주소" onkeydown="<%=layerName%>EnterFilter('position');" onkeyup="checkByte(this, 250)"> </td>
				                    	</tr>
				                    	<tr>
				                    		<th>직위</th>
				                            <td>
				                            <select id="position" name="position" style="width:100%; text-align-last : center;" title="직위" mandatory=true tabindex="1" onkeydown="<%=layerName%>EnterFilter('salaryClass');">
											
											</select>
													
				                             <th>호봉</th>
				                            <td>
				                            <select id="salaryClass" name="salaryClass" style="width:100%; text-align-last : center;" title="호봉" mandatory=true tabindex="1" onkeydown="<%=layerName%>EnterFilter('disableHaveFg');">
															<option value=""></option>
															<c:forEach var="i" begin="01" end="40" step="1">
																<option value="${i}">${i}</option>
															</c:forEach>
													</select>
				                             </td>
				                    	</tr>
				                    	<tr>
				                    		<th><span class="essentialItem">장애여부</span></th>
					                    	<td colspan="3">
					                    	<select id="disableHaveFg" name="disableHaveFg" style="width:39.2%; text-align-last : center;" title="장애여부" mandatory=true tabindex="1" onkeydown="<%=layerName%>EnterFilter('joinDd');">
														<option value="" hidden></option>
														<c:if test="${!empty disabilityList}">
															<c:forEach var="list" items="${disabilityList}">
															<option value="${list.disabilityCd}">
															<c:out value="${list.disabilityNm}" /></option>
															</c:forEach>
														</c:if>
													</select>
											</td>
				                    	</tr>
				                       <tr>
				                    		<th><span class="essentialItem">입사일</span></th>
				                            <td><input type="text" id="joinDd"  name="joinDd" style="width: 91%;" class="datepicker hover_disabled" onKeyup="inputYMDNumber(this);" maxlength="10" onkeydown="<%=layerName%>EnterFilter('retireDd');" onblur ="<%=layerName%>checkJoinDd(this.value);"></td>
				                            
				                            <th>퇴사일</th>
				                            <td><input type="text" id="retireDd" name="retireDd" style="width: 91%;" class="datepicker hover_disabled" onKeyup="inputYMDNumber(this);" maxlength="10" onkeydown="<%=layerName%>EnterFilter('workRecord');" onblur="<%=layerName%>checkRetireDd(this.value)"></td>
				                    	</tr>
				                    	<tr>
				                    		<th>시설근무이력</th>
				                            <td colspan="3"><input type="text" id="workRecord" name="workRecord" style="width:39.2%;text-align:left;" class="onlynum" title="시설근무이력" onkeydown="<%=layerName%>EnterFilter('useFg');" onkeyup="checkByte(this, 200)"> </td>
				                        </tr>
				                    	<tr>
				                        	<th>사용여부</th>
				                            	<td colspan="3">
					                            <select id="useFg" name="useFg" style="width:39.2%; text-align-last : center;" title="사용여부" mandatory=true tabindex="1">
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
	
	.submsg span{color: #FF0000;}
</style>

<script type="text/javascript" >
	// 조회 클릭시
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .search').click(function(){
		<%=layerName%>loadData();
	});
	
	// 신규
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .new').click(function(){
		<%=layerName%>fn_newAll();
		$('.<%=layerName%> #workerNm').focus();
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
		 var workerNm = items[0].item.workerNm;
		 
		if(workerNm != ''){
			if(confirm('"'+workerNm+'"'+' 삭제하시겠습니까?')){
				 <%=layerName%>deleteWorker();
			}
		}
		else{
			alert("종사자를 조회하고 해당하는 종사자를 선택 후 삭제해주세요.");
		}
	});
	
	// 엑셀 다운로드
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .exel').click(function(){
	});
	
	// 닫기
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .close').click(function(){
		mFnc.tabMenuClose('<%=layerName%>');
	});
	
	function <%=layerName %>goPopup(){
		// IE에서 opener관련 오류가 발생하는 경우, window에 이름을 명시해줍니다.
		window.name="<%=layerName%>jusoPopup";
		
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("/pop/jusoPop","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	}


	function jusoCallBack(addrBase, zipCd){
			// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
			document.workerMgmtForm.zipCd.value = zipCd;
			document.workerMgmtForm.addrBase.value = addrBase;
	}
	
	var jumin1;
	var jumin2;
	var <%=layerName%>encBirthDd;
	
	// AUIGrid 생성 후 반환 ID
	var <%=layerName%>myGridID;
	var <%=layerName%>strVatFlag;
	// AUIGrid 칼럼 설정
	var <%=layerName%>columnLayout = [
    {dataField : "workerId",headerText : "종사자 코드", width : "25%" , style : "my-column-center"}
    ,{dataField : "workerNm",headerText : "종사자명", width : "40%", style : "my-column-left"}
    ,{dataField : "positionNm",headerText : "직위", width : "35%", dataType : "numeric" ,style : "my-column-left"}
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
		$(".<%=layerName%> #workerMgmtForm").find("#saveMode").val("I");
		$('.<%=layerName%> #workerNm').focus();
		
		if($(".<%=layerName%> #userGroupCd").val() != 'E'){
			
			var fcltyType = $(".<%=layerName%> #fcltyType").val();
			
			<%=layerName%>fn_selectWffcltyTp($(".<%=layerName%> #linkCd").val());
			<%=layerName%>fn_selectPosition(fcltyType);
		}
		
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
			
			var primeCell = event.primeCell; // 선택 대표 셀
			var item = primeCell.item; // 행 정보
			<%=layerName%>setFieldToFormWindow(primeCell, item);
			$(".<%=layerName%> #rowIndex").val(primeCell.rowIndex);
			
			$(".<%=layerName%> #workerMgmtForm").find("#saveMode").val("U");
			
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
		$(".<%=layerName%> #workerId").val(item.workerId);
		$(".<%=layerName%> #workerNm").val(item.workerNm);
		$(".<%=layerName%> #hdenWorkerNm").val(item.workerNm);
		$(".<%=layerName%> #encBirthDd").val(item.encBirthDd);
		$(".<%=layerName%> #hdenEncBirthDd").val(item.encBirthDd);
		<%=layerName%>encBirthDd = item.encBirthDd;
		
		$(".<%=layerName%> #zipCd").val(item.zipCd);
		
		$(".<%=layerName%> #<%=layerName%>addrBase").val(item.addrBase);
		$(".<%=layerName%> #encAddrDetail").val(item.encAddrDetail);
		var encMoblphonNum = item.encMoblphonNum;
		if(encMoblphonNum != "" && encMoblphonNum != null){
			$(".<%=layerName%> #encMoblphonNum").val(chk_tel(item.encMoblphonNum));
		}
		else{
			$(".<%=layerName%> #encMoblphonNum").val(item.encMoblphonNum);
		}
		
		$(".<%=layerName%> #position").val(item.positionCd);
		$(".<%=layerName%> #salaryClass").val(item.salaryClass);
		$(".<%=layerName%> #disableHaveFg").val(item.disableHaveFg);
		$(".<%=layerName%> #joinDd").val(item.joinDd.replace(/(\d{4})(\d{2})(\d{2})/, '$1-$2-$3'));
		var retireDd = item.retireDd;
		if(retireDd != "" && retireDd != null){
			$(".<%=layerName%> #retireDd").val(item.retireDd.replace(/(\d{4})(\d{2})(\d{2})/, '$1-$2-$3'));
		}
		else{
			$(".<%=layerName%> #retireDd").val(item.retireDd);
		}
		$(".<%=layerName%> #workRecord").val(item.workRecord);
		$(".<%=layerName%> #useFg").val(item.useFg);
		$(".<%=layerName%> #chkJumin").val("1");
		$(".<%=layerName%> #workerMgmtForm").find( "#updateJuminNo").val("0");
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
		
		if ( $(".<%=layerName%> #linkCd").val().length != "4") {
			$(".<%=layerName%> #wffcltyCd").focus();
			GRIT.msg.alert("조회 조건에 [복지시설]을  입력 후 조회해주세요.");
			return;

		}
		
		var linkCd      = $(".<%=layerName%> #linkCd").val();
		var searchWorkerNm      = $(".<%=layerName%> #searchWorkerNm").val();
		var searchPosition = $(".<%=layerName%> #searchPosition").val();
		var searchEncMoblphonNum      = $(".<%=layerName%> #searchEncMoblphonNum").val();
		
		var sendData = {"linkCd"		  : linkCd
						,"searchWorkerNm" : searchWorkerNm
						,"searchPosition" : searchPosition
						,"searchEncMoblphonNum" : searchEncMoblphonNum};
		
		// ajax 요청 전 그리드에 로더 표시
		AUIGrid.showAjaxLoader(<%=layerName%>myGridID);
		
		GRIT.tran.send({
			url: "/emp/empWorkerMgmtGrid1",
			sendData : sendData,
			success: function(result){
				<%=layerName%>fn_newWorker();
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
		
		if($(".<%=layerName%> #linkCd").val() == ""){
			GRIT.msg.alert("복지시설을 조회 후 신규 입력을 할 수 있습니다.")
			return;
		}
		
		if ( confirm ("신규로 입력 하시겠습니까?") ) {
			<%=layerName%>fn_newWorker();
			$(".<%=layerName%> #linkCode").focus();
		}
	}
	
	//삭제
	function <%=layerName%>deleteWorker(){
		var workerList = AUIGrid.getGridData(<%=layerName%>myGridID);
		
		if(workerList.length == 0){
			GRIT.msg.alert("조회 후 삭제 할 수 있습니다.");
			return false;
		}
		
		var workerId = $(".<%=layerName%> #workerId").val();
		var sendData = {"workerId" : workerId
						,"jobDetail" : workerId};
		
        GRIT.tran.send({
			url: "/emp/deleteWorker",
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
	
	//생년월일 체크
	function <%=layerName%>chkData() {
		
		var workerNm        = $(".<%=layerName%> #workerNm").val();
		var encMoblphonNum  = $(".<%=layerName%> #encMoblphonNum").val();
		var encBirthDd      = $(".<%=layerName%> #encBirthDd").val();
		
		if(encBirthDd == ""  || encBirthDd == null ){
			GRIT.msg.alert ("중복 확인 전 입력은 필수 항목입니다");   
		return;
		}
		
		if ( $(".<%=layerName%> #workerNm").val() == "") {
			$(".<%=layerName%> #workerNm").focus();
			GRIT.msg.alert("[종사자명]을 입력하시고 중복 확인해주세요."); return;
		}
		
		if ( $(".<%=layerName%> #encBirthDd").val().length != "8") {
			$(".<%=layerName%> #encBirthDd").focus();
			GRIT.msg.alert("[생년월일]를  8자리로 입력해주세요."); return;
		}
		
		var sendData = {"workerNm" : workerNm
						,"encMoblphonNum" : encMoblphonNum
						,"encBirthDd" : encBirthDd};
		GRIT.tran.send({
			url: "/emp/empJuminChk",
			sendData : sendData,
			success: function(result){ 
				if(result.data.encBirthDd== 0){
					GRIT.msg.alert("사용가능한 종사자 입니다");
					var chkJumin = $(".<%=layerName%> #chkJumin").val("1");
				}
				else if(result.data.encBirthDd== 1 && result.data.retireDd== 1){
					GRIT.msg.alert("해당 종사자는 다른 시설에서 등록되어있던 종사자이므로 기존의 정보를 불러옵니다.");
					var chkJumin = $(".<%=layerName%> #chkJumin").val("1");
					<%=layerName%>keyValue();
					
				}
				else{
					var chkJumin = $(".<%=layerName%> #chkJumin").val("0");
					<%=layerName%>empJuminUse();
					
				}
				
			},
			error: function(request, status, error){
				GRIT.msg.alert("중복확인 문제가 발생했습니다.");
				// 로더 제거
			},
			loading : false
		});
	}
	
	// 중복검사시 퇴사일이 있을경우
	function <%=layerName%>keyValue() {
		
		var workerNm        = $(".<%=layerName%> #workerNm").val();
		var encBirthDd      = $(".<%=layerName%> #encBirthDd").val();
		
		var sendData = {"encBirthDd" : encBirthDd
						,"workerNm"  : workerNm};
		GRIT.tran.send({
			url: "/emp/empKeyValue",
			sendData : sendData,
			success: function(result){
				$(".<%=layerName%> #workerId").val(result.data.workerId);
				$(".<%=layerName%> #workerNm").val(result.data.workerNm);
				$(".<%=layerName%> #encBirthDd").val(result.data.encBirthDd);
				$(".<%=layerName%> #zipCd").val(result.data.zipCd);
				$(".<%=layerName%> #<%=layerName%>addrBase").val(result.data.addrBase);
				$(".<%=layerName%> #encAddrDetail").val(result.data.encAddrDetail);
				$(".<%=layerName%> #encMoblphonNum").val(result.data.encMoblphonNum);
				$(".<%=layerName%> #useFg").val(result.data.useFg);
				$(".<%=layerName%> #workerMgmtForm").find("#saveMode").val("U");
			},
			error: function(request, status, error){
				GRIT.msg.alert("중복확인 문제가 발생했습니다.");
				// 로더 제거
			},
			loading : false
		});
	}
	
	// 중복검사시 퇴사일이 있을경우
	function <%=layerName%>empJuminUse() {
		
		var encBirthDd      = $(".<%=layerName%> #encBirthDd").val();
		var sendData = {"encBirthDd" : encBirthDd};
		GRIT.tran.send({
			url: "/emp/empJuminUse",
			sendData : sendData,
			success: function(result){
				if(confirm((result.data.wffcltyNm+"의 시설 종사자입니다. \n 계속 진행하시겠습니까?"))){
					$(".<%=layerName%> #chkJumin").val("1");
				}
				else{
					$(".<%=layerName%> #encBirthDd").val("");
				}
				;
			},
			error: function(request, status, error){
				GRIT.msg.alert("중복확인 문제가 발생했습니다.");
				// 로더 제거
			},
			loading : false
		});
	}
	
	// 초기화
	function <%=layerName%>fn_newWorker() {
		$(".<%=layerName%> #workerId").val("");
		$(".<%=layerName%> #workerNm").val("");
		$(".<%=layerName%> #hdenWorkerNm").val("");
		$(".<%=layerName%> #encBirthDd").val("");
		$(".<%=layerName%> #encBirthDd").attr('readonly',false); 
		$(".<%=layerName%> #hdenEncBirthDd").val("");
		$(".<%=layerName%> #zipCd").val("");
		$(".<%=layerName%> #<%=layerName%>addrBase").val("");
		$(".<%=layerName%> #encAddrDetail").val("");
		$(".<%=layerName%> #encMoblphonNum").val("");
		$(".<%=layerName%> #position option:eq(0)").prop('selected', true);
		$(".<%=layerName%> #salaryClass").val("");
		$(".<%=layerName%> #disableHaveFg").val("");
		$(".<%=layerName%> #joinDd").val("");
		$(".<%=layerName%> #retireDd").val("");
		$(".<%=layerName%> #workRecord").val("");
		$(".<%=layerName%> #useFg").val("1");
		// 상태값
		$(".<%=layerName%> #chkJumin").val("0");
		$(".<%=layerName%> #workerMgmtForm").find("#saveMode").val("I");
		$(".<%=layerName%> #workerMgmtForm").find( "#updateJuminNo").val(1);
	}
	
	//저장 체크
	function <%=layerName%>fn_regItemMst() {
		
		if ( $(".<%=layerName%> #linkCd").val().length != "4") {
			$(".<%=layerName%> #wffcltyCd").focus();
			GRIT.msg.alert("조회 조건에 [복지시설]을  입력 후 저장해주세요.");
			return;
		}
		
		if ( $(".<%=layerName%> #workerNm").val() == "" ) {
			$(".<%=layerName%> #workerNm").focus();
			GRIT.msg.alert("[종사자명]은 필수 항목입니다."); return;
		}
		if ( $(".<%=layerName%> #encBirthDd").val() == "" ) {
			$(".<%=layerName%> #encBirthDd").focus();
			GRIT.msg.alert("[생년월일]는 필수 항목입니다."); return;
		}
		var regExp = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
		if ( $(".<%=layerName%> #encMoblphonNum").val() != "" ) {
			if (!regExp.test($(".<%=layerName%> #encMoblphonNum").val())) {
				GRIT.msg.alert("[핸드폰번호] 형식이 잘못되었습니다.");
			      return;
			}
		}
		
		<%-- if ( $(".<%=layerName%> #position").val() == "" || $(".<%=layerName%> #position").val() == null ) {
			$(".<%=layerName%> #position").focus();
			GRIT.msg.alert("[직위]는 필수 항목입니다."); return;
		} --%>
		if ( $(".<%=layerName%> #disableHaveFg").val() == "" || $(".<%=layerName%> #position").val() == null ) {
			$(".<%=layerName%> #disableHaveFg").focus();
			GRIT.msg.alert("[장애여부]은 필수 항목입니다."); return;
		}
		if ( $(".<%=layerName%> #joinDd").val() == "" ) {
			$(".<%=layerName%> #joinDd").focus();
			GRIT.msg.alert("[입사일]은 필수 항목입니다."); return;
		}
		if ( $(".<%=layerName%> #joinDd").val().length != "10") {
			$(".<%=layerName%> #joinDd").focus();
			GRIT.msg.alert("[입사일]을  올바르게 입력해주세요."); return;
		}
		if ( $(".<%=layerName%> #joinDd").val() != "") {
			if ( $(".<%=layerName%> #joinDd").val().length != "10") {
				$(".<%=layerName%> #joinDd").focus();
				GRIT.msg.alert("[입사일]을  올바르게 입력해주세요."); return;
			}
		}
		/* if(!GRIT.date.compareDateFT(fDate, eDate)){
			GRIT.msg.alert('입금일 조회 중 시작날짜보다 종료일날짜 더 작습니다. 조회조건 종료일 수정 후 조회해주시길 바랍니다.');
			return false;
		} */
		
		
		var joinDd = $(".<%=layerName%> #joinDd").val();
		var retireDd =$(".<%=layerName%> #retireDd").val();
		
		if(!GRIT.date.compareDateFT(joinDd, retireDd)){
			GRIT.msg.alert('입사일 이후로 퇴사일을 작성해주세요.');
			return false;
		}
		
		if ( $(".<%=layerName%> #workerNm").val() == $(".<%=layerName%> #hdenWorkerNm").val()  ) {
			if ( $(".<%=layerName%> #encBirthDd").val() == $(".<%=layerName%> #hdenEncBirthDd").val()  )
			$(".<%=layerName%> #chkJumin").val('1');
		}
		
		var chkJumin = $(".<%=layerName%> #chkJumin").val();
		
		if(chkJumin == 0){
			GRIT.msg.alert("생년월일을 중복확인 후 저장 해야합니다.");
			return;
		}
		
		if(confirm("저장 하시겠습니까?")){
			<%=layerName%>fn_save();
	    	}
		
	}
	
	function <%=layerName%>changeValue(){
		var chkJumin = $(".<%=layerName%> #chkJumin").val("0");
	}
	
	//저장
	function <%=layerName%>fn_save(){
		
		var sendData = $(".<%=layerName%> form[name=workerMgmtForm]").serializeObject();
         GRIT.tran.send({
			url: "/emp/saveWorkerMgmt",
			async: false,
			sendData: sendData,
			success: function(result){
				
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
					<%=layerName%>loadData ();
				}else{
					GRIT.msg.alert(result.message);
				}
				<%=layerName%>fn_newWorker();
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

                alert("숫자 이외의 값은 입력하실 수 없습니다.");



                //@see 숫자와 하이픈(-)기호 이외의 모든 값은 삭제한다.

                obj.value = obj.value.replace(/[^0-9 ^\-]/g,"");

                return false;

            }

        } else {

            return false;

        }

    }
		
	function <%=layerName%>checkJoinDd(obj){
		
		var yyyymmdd = obj.replace(/\-/g,'');
		
		if(!GRIT.date.isValidDate(yyyymmdd)){
			alert("날짜형식이 잘못되었습니다.");
			$(".<%=layerName%> #joinDd").val("");
			$(".<%=layerName%> #joinDd").focus();
			}
		}
	
	function <%=layerName%>checkRetireDd(obj){
			
			var yyyymmdd = obj.replace(/\-/g,'');
			
			if(!GRIT.date.isValidDate(yyyymmdd)){
				alert("날짜형식이 잘못되었습니다.");
				$(".<%=layerName%> #retireDd").val("");
				$(".<%=layerName%> #retireDd").focus();
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
            alert("숫자만 입력가능합니다");
            return false;
        }
    }
	
	function <%=layerName%>updateJuminNo() {
		$(".<%=layerName%> #chkJumin").val("0");
		<%-- var updateJuminNo = $(".<%=layerName%> #workerMgmtForm").find( "#updateJuminNo");
		if(updateJuminNo.val() == "0"){
				$(".<%=layerName%> #chkJumin").val("0");
				updateJuminNo.val("1");
		} --%>
	}
	
	function <%=layerName%>updateJuminNoClick() {
		var updateJuminNo = $(".<%=layerName%> #workerMgmtForm").find( "#updateJuminNo");
		if(updateJuminNo.val() == "0"){
			if(confirm("생년월일를 변경하시겠습니까?")){
				$(".<%=layerName%> #workerMgmtForm").find( "#encBirthDd").val("");
				$(".<%=layerName%> #chkJumin").val("0");
				updateJuminNo.val("1");
			}
		}
		else{
			<%=layerName%>chkData();
		}
	}
	
	function <%=layerName%>fn_selectWffcltyTp(val){
	
			var sendData ={"linkCd"      : val};
			if($(".<%=layerName%> #userGroupCd").val() == "E"){
				if($(".<%=layerName%> #wffcltyCd").val().length != "4" || $(".<%=layerName%> #linkNm").val() == ""){
					return;
				}
			}
			
	        GRIT.tran.send({
				url: "/emp/empWffcltyTp",
				async: false,
				sendData: sendData,
				success: function(result){
					var wffcltyTp = result.data.wffcltyTp;
					var fcltyType = $(".<%=layerName%> #fcltyType").val();
					
					$(".<%=layerName%> #fcltyType").val(wffcltyTp);
					<%=layerName%>fn_selectPosition(fcltyType);
				},
				loadingTarget: "<%=layerName%>"
			}); 
	}
	
	function <%=layerName%>fn_selectPosition(val){
		
		val = $(".<%=layerName%> #fcltyType").val();
		
		var sendData ={"wffcltyTp" : val};
		
        GRIT.tran.send({
			url: "/emp/empPosition",
			async: false,
			sendData: sendData,
			success: function(result){
					
					$('.<%=layerName%> #searchPosition option').remove();
					$('.<%=layerName%> #searchPosition').append("<option value=''>전체</option>");
					
					$('.<%=layerName%> #position option').remove();
					$('.<%=layerName%> #position').append("<option value=''></option>");
					
					 for(var i=0; i<result.data.length; i++){
						$('.<%=layerName%> #searchPosition').append("<option value="+result.data[i].positionCd+"> "+result.data[i].positionNm+ "</option>");
						$('.<%=layerName%> #position').append("<option value="+result.data[i].positionCd+"> "+result.data[i].positionNm+ "</option>");
					}
			},
			loadingTarget: "<%=layerName%>"
		}); 
}
	
	function <%=layerName%>fn_searchPop(){
		// 복지시설
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
		$(".<%=layerName%> #linkCd").val(item.wffcltyCd);
		$(".<%=layerName%> #linkNm").val(item.wffcltyNm);		
		<%=layerName%>fn_selectWffcltyTp(item.wffcltyCd);
	}
	
	//복지시설
	function <%=layerName%>fn_searchLinkCd(value){

		   if(event.keyCode != 13 && event.keyCode != 9){
		   	   return false;
		   }
		   
		   if($(".<%=layerName%> #wffcltyCd").val().length == "4" && $(".<%=layerName%> #linkNm").val() != ""){
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
						$(".<%=layerName%> #linkCd").val(result.data[0].linkcd);
						$(".<%=layerName%> #linkNm").val(result.data[0].linknm);
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
	
	// 복지시설 이름 제거
	function <%=layerName%>fn_removeLinkNm(){
			$(".<%=layerName%> #linkNm").val("");
			$(".<%=layerName%> #linkCd").val("");
			$(".<%=layerName%> #workerId").val("");
			$(".<%=layerName%> #workerNm").val("");
			$(".<%=layerName%> #hdenWorkerNm").val("");
			$(".<%=layerName%> #encBirthDd").val("");
			$(".<%=layerName%> #encBirthDd").attr('readonly',false); 
			$(".<%=layerName%> #hdenEncBirthDd").val("");
			$(".<%=layerName%> #zipCd").val("");
			$(".<%=layerName%> #<%=layerName%>addrBase").val("");
			$(".<%=layerName%> #encAddrDetail").val("");
			$(".<%=layerName%> #encMoblphonNum").val("");
			$(".<%=layerName%> #position option:eq(0)").prop('selected', true);
			$(".<%=layerName%> #salaryClass").val("1");
			$(".<%=layerName%> #disableHaveFg").val("1");
			$(".<%=layerName%> #joinDd").val("");
			$(".<%=layerName%> #retireDd").val("");
			$(".<%=layerName%> #workRecord").val("");
			$(".<%=layerName%> #useFg").val("1");
			// 상태값
			$(".<%=layerName%> #chkJumin").val("0");
			$(".<%=layerName%> #workerMgmtForm").find("#saveMode").val("I");
			$(".<%=layerName%> #workerMgmtForm").find( "#updateJuminNo").val(1);
			
			AUIGrid.setGridData(<%=layerName%>myGridID, []);
			
			$('.<%=layerName%> #searchPosition option').remove();
			$('.<%=layerName%> #position option').remove();
			
			$('.<%=layerName%> #searchPosition').append("<option value=''>전체</option>");
		 }
</script>

