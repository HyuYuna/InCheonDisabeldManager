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
                    <h1>시설 이용 예약 관리</h1>
					<jsp:include page="../common/commonBtn.jsp">
						<jsp:param value="<%=layerName%>" name="layerName" />
					</jsp:include>                    
                </div>
                <!-- titleWrap : end -->
				<form name="<%=layerName%>searchForm1" onsubmit="return false;" autocomplete='off'>
					<table class="dataTable marginT10">
	                	<colgroup>
	                        <col style="width:12%">
	                        <col style="width:20%">
	                        <col style="width:12%">
	                        <col style="width:22%">
	                        <col style="width:12%">
	                        <col style="width:21%">
	                    </colgroup>
                    	<tbody>
                        	<tr>
								<th>진행상태</th>
								<td class="title">
									<select id="searchprogressSts" name="searchprogressSts" style="width: 100%; text-align-last : center;" tabindex="1">
													<option value = "">전체</option>
													<c:if test="${!empty progressList}">	
														<c:forEach var="list" items="${progressList}">
															<option value="${list.progressCode}">
																<c:out value="${list.progressNm}" /></option>
														</c:forEach>
													</c:if>
												</select>
								</td>
								<th>등록일자</th>
								<td class="title">
									<input type="text" id="<%=layerName%>sDate" name="fDate" style="width: 90px;" class="datepicker hover_disabled" maxlength="10" onkeypress="<%=layerName%>fn_pressSys(this.form); " onKeyup="inputYMDNumber(this);" onblur="<%=layerName%>checkSDate(this.value);"> 
									<span style="margin-left:30px;">~</span>
									<input type="text" id="<%=layerName%>eDate" name="tDate" style="width: 90px; margin-left: 5px;" class="datepicker hover_disabled" maxlength="10" onkeypress="<%=layerName%>fn_pressSys(this.form);" onKeyup="inputYMDNumber(this);" onblur="<%=layerName%>checkEDate(this.value);">
								</td>
								
								<th>예약자</th>
								<td class="title">
									<input type="text" id="searchMemberNm" name="searchMeberNm" style="width:100%;" title="회원명" maxlength="5" onkeypress="<%=layerName%>fn_pressSys(this.form); " onkeyup="<%=layerName%>fn_removeLinkNm()" onkeydown="<%=layerName%>fn_searchOgnztCd2(this.value)" >
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			   
						<table class="layoutTable">
						    <tr>
							    <td style="width:800px;" valign="top">
							        <!-- 그리드 영역 -->
							        <h2>시설 예약 리스트</h2>
							        <div id="<%=layerName%>grid_wrap" style="height: 659px;"></div>
							    </td>                               
							    <td style="width:10px;">  </td>                            
							    <td valign="top" style="width:*">
							    <h2>시설 예약 정보</h2>
							        <form name="waitInfoForm" id="waitInfoForm" method="post" autocomplete='off'>
				                    <table cellpadding="0" cellspacing="0"  class="dataTable" id="align_common" >
				                        <input type="hidden" id="chkUnq"   name="chkUnq" value=""/>
				                        <input type="hidden" id="progressStsNo"   name="progressStsNo" value=""/>
				                        <input type="hidden" id="wffcltyCd"     name="wffcltyCd" value="${wffcltyCd}"/>
				                        <input type="hidden" id="receiveDd"  name="receiveDd" value=""/>
				                        <colgroup>
				                            <col width="20%" />
				                            <col width="80%" />
				                      
				                        </colgroup>                                               
				                        <tr>
				                            <th>등록일시</th>
				                            <td><input type="text" id="registDt" name="receiveDd" title="등록일시" style="width:100%;"onkeydown="<%=layerName%>EnterFilter('memberNm');" readonly> </td>
				                        </tr>
				                        <tr>
					                        <th>등록순번</th>
				                            <td><input type="text" id="receiveSeqno" name="receiveSeqno" title="등록순번" style="width:100%;" onkeydown="<%=layerName%>EnterFilter('encPhoneNum');" readonly> </td>
				                        </tr>
				                        <tr>
					                        <th>예약자</th>
				                            <td><input type="text" id="rsvctm" name="rsvctm" title="예약자" style="width:100%;" onkeydown="<%=layerName%>EnterFilter('encPhoneNum');" readonly> </td>
				                        </tr>
				                        
				                        <tr>
					                        <th>연락처</th>
				                            <td><input type="text" id="encPhoneNum" name="encPhoneNum" title="연락처" style="width:100%;  onkeydown="<%=layerName%>EnterFilter('email');" readonly> </td>
				                        </tr>
				                        
				                        <tr>
				                        	<th>이메일</th>
				                            <td><input type="text" id="email" name="email" style="width:100%;" title="이메일" style="width:100%;  maxlength="40" tabindex="2" onkeydown="<%=layerName%>EnterFilter('disableTp');" readonly> </td>
 				                        </tr>
 				                        
				                        <tr>
				                    		<th>장애유형</th>
				                            <td><input type="text" id="disableTpNm" name="disableTpNm" style="width:100%; title="장애유형"  maxlength="40" tabindex="2" onkeydown="<%=layerName%>EnterFilter('disableDgreeFg');" readonly> </td>
				                    	</tr>
				                    	
				                    	<tr>
				                    		<th>장애정도</th>
				                            <td><input type="text" id="disableDgreeFgNm" name="disableDgreeFgNm" style="width:100%;" title="장애정도"  maxlength="40" tabindex="2" onkeydown="<%=layerName%>EnterFilter('note');" readonly> </td>
				                    	</tr>
				                    	
				                    	<tr>
				                        	<th>특이사항</th>
				                            <td><input type="text" id="note" name="note" style="width:100%;" title="특이사항"  maxlength="40" tabindex="2" onkeydown="<%=layerName%>EnterFilter('progressSts');" readonly> </td>
 				                        </tr>
 				                        
 				                         <tr>
					                        <th>진행상태</th>
				                            <td><input type="text" id="progressStsNm" name="progressStsNm" style="width:100%;" title="진행상태"  maxlength="40" tabindex="2" onkeydown="<%=layerName%>EnterFilter('uniqueNo');" readonly> </td>
				                        </tr>
				                        <tr>
					                        <th>처리일자</th>
				                            <td><input type="text" id="processDt" name="processDt" title="회원명" style="width:100%;" onkeydown="<%=layerName%>EnterFilter('encPhoneNum');" readonly> </td>
				                        </tr>
				                        <tr>
					                        <th>처리자</th>
				                            <td><input type="text" id="disposer" name="disposer" title="회원명" style="width:100%;" onkeydown="<%=layerName%>EnterFilter('encPhoneNum');" readonly> </td>
				                        </tr>
				                        <tr>
				                        <td colspan="3" style="text-align: center;">
				                        <div>
				                        	<button type="button" class="normalBtn" id ="encChk" tabindex="1" onclick="<%=layerName%>fn_receipt_button();" style ="width: 85px;">예약접수</button>
				                        	<button type="button" class="normalBtn" id ="encChk" tabindex="1" onclick="<%=layerName%>fn_waitingCancel_button();" style ="width: 85px;">접수취소</button>
				                        </div>
				                        </td>
				                    </table>
							    </td>
						    </tr> 
						</table>
				    
			</div>
		</div>
	</div>
</div>
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

<script type="text/javascript" >
	// 조회 클릭시
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .search').click(function(){
		<%=layerName%>loadData();
		<%=layerName%>fn_newSys();
	});
	
	// 신규
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .new').click(function(){
		<%=layerName%>fn_newAll();
	});
	
	// 저장
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .save').click(function(){
		
		var <%=layerName%>chkUnq = $(".<%=layerName%> #mgntWelForm").find( "#chkUnq").val();
		
		if(<%=layerName%>chkUnq == "" || <%=layerName%>chkUnq == null){
			GRIT.msg.alert("번호를 입력 후 중복확인 바랍니다.")
		}
		if(<%=layerName%>chkUnq == 0){
			GRIT.msg.alert("번호를 재입력 후 중복확인 바랍니다.")
		}
		if(<%=layerName%>chkUnq == 1){
		<%=layerName%>fn_saveAwaiter();
		}
	});
	
	// 엑셀 다운로드
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .exel').click(function(){
		
	});
	
	// 닫기
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .close').click(function(){
		mFnc.tabMenuClose('<%=layerName%>');
	});
	
	
	// AUIGrid 생성 후 반환 ID
	var <%=layerName%>myGridID;
	
	// AUIGrid 칼럼 설정
	var <%=layerName%>columnLayout  = [
        {dataField : "registDt" ,headerText : "등록일시"   ,width : "17%", style : "my-column-center"}
        ,{dataField : "rsvctm" ,headerText : "예약자"       ,width : "15%", style : "my-column-center"}
       ,{dataField : "disableTpNm" ,headerText : "장애유형"       ,width : "15%", style : "my-column-center"}
       ,{dataField : "disableDgreeFgNm" ,headerText : "장애정도"       ,width : "14%", style : "my-column-center"}
       ,{dataField : "progressStsNm" ,headerText : "진행상태"       ,width : "17%", style : "my-column-center"}
       ,{dataField : "processDt" ,headerText : "처리일자"       ,width : "22%", style : "my-column-cemter"}
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
		// AUIGrid 그리드를 생성합니다.
		<%=layerName%>createAUIGrid(<%=layerName%>columnLayout);
		$(".<%=layerName%> #operateFg").val("1");
		$(".<%=layerName%> #useFg").val("1");
		// 데이터 요청, 요청 성공 시 AUIGrid 에 데이터 삽입합니다.
		$(".<%=layerName%> #mgntWelForm").find("#saveMode").val("I");
		
		$(".<%=layerName%> #sehUserNm").focus();
		
		var _today1 = new Date();
		
		var firstDay;

		firstDay = dayFormatChk(_today1, 1); //sysdate 첫일
		
		$(".<%=layerName%> #<%=layerName%>sDate").val(firstDay);
		$(".<%=layerName%> #<%=layerName%>eDate").val(new Date().yyyymmdd());
	});
	
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

	// AUIGrid 를 생성합니다.
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
		
		var userGroupCd = item.userGroupCd;
		
		$(".<%=layerName%> #registDt").val(item.registDt);
		$(".<%=layerName%> #receiveSeqno").val(item.receiveSeqno);
		$(".<%=layerName%> #rsvctm").val(item.rsvctm);
		var encPhoneNum = item.encPhoneNum;
		if(encPhoneNum != "" && encPhoneNum != null){
			$(".<%=layerName%> #encPhoneNum").val(chk_tel(item.encPhoneNum));
		} 
		else{
			$(".<%=layerName%> #encPhoneNum").val(item.encPhoneNum);
		}
		$(".<%=layerName%> #email").val(item.email);
		$(".<%=layerName%> #disableTpNm").val(item.disableTpNm);
		$(".<%=layerName%> #disableDgreeFgNm").val(item.disableDgreeFgNm);
		$(".<%=layerName%> #disableDgreeFg").val(item.disableDgreeFgNm);
		$(".<%=layerName%> #note").val(item.note);
		$(".<%=layerName%> #progressStsNo").val(item.progressSts);
		$(".<%=layerName%> #progressStsNm").val(item.progressStsNm);
		$(".<%=layerName%> #processDt").val(item.processDt);
		$(".<%=layerName%> #disposer").val(item.disposer);
		$(".<%=layerName%> #receiveDd").val(item.receiveDd);
		
		// 상태값
		$(".<%=layerName%> #mgntWelForm").find("#saveMode").val("U");
	}
	
	// 신규
	function <%=layerName%>fn_newAll() {
		if ( confirm ("신규로 입력 하시겠습니까?") ) {
			<%=layerName%>fn_newSys();
			$(".<%=layerName%> #userGroupCd").focus();
		}
	}
	
	//초기화
	function <%=layerName%>fn_newSys() {
		
		$(".<%=layerName%> #registDt").val("");
		$(".<%=layerName%> #receiveSeqno").val("");
		$(".<%=layerName%> #rsvctm").val("");
		$(".<%=layerName%> #encPhoneNum").val("");
		$(".<%=layerName%> #email").val("");
		$(".<%=layerName%> #disableTpNm").val("");
		$(".<%=layerName%> #disableDgreeFgNm").val("");
		$(".<%=layerName%> #note").val("");
		$(".<%=layerName%> #progressStsNm").val("");
		$(".<%=layerName%> #processDt").val("");
		$(".<%=layerName%> #disposer").val("");
		$(".<%=layerName%> #waitInfoForm").find( "#progressStsNo").val("");
	}
	
	//엔터키 조회시
	function <%=layerName%>fn_pressSys(e){ 
    	if(event.keyCode == 13){ //javascript에서는 13이 enter키를 의미함 
    		<%=layerName%>loadData ();
		}
	}
	
	//조회
	function <%=layerName%>loadData () {
		
		var wffcltyCd              = 	$(".<%=layerName%>#wffcltyCd").val();
		var searchprogressSts      = 	$(".<%=layerName%>#searchprogressSts").val();
		var sDate 	  			   = 	$("#<%=layerName%>sDate").val();
		var eDate         		   = 	$("#<%=layerName%>eDate").val();
		var searchMemberNm         = 	$(".<%=layerName%>#searchMemberNm").val();
		
		if(!GRIT.date.compareDateFT(sDate, eDate)){
			GRIT.msg.alert('등록일자 조회 중 시작날짜보다 종료일날짜 더 작습니다. 등록일자를 수정 후 조회해주시길 바랍니다.');
			return false;
		}
		else if(sDate =='' || sDate == null || eDate =='' || eDate == null){
			GRIT.msg.alert('등록일자를 입력 후 조회하시길 바랍니다.');
			return false;
		}
		
		var sendData = {"wffcltyCd"			 : wffcltyCd
						,"searchprogressSts" : searchprogressSts
						,"sDate" : sDate
						,"eDate" : eDate
						,"searchMemberNm" : searchMemberNm};
		
		
		// ajax 요청 전 그리드에 로더 표시
		AUIGrid.showAjaxLoader(<%=layerName%>myGridID);
		
		GRIT.tran.send({
			url: "/wfc/wfcAwaiterGrid",
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
				<%=layerName%>fn_newSys();
	 			
			},
			error: function(request, status, error){
				GRIT.msg.alert("상품마스터 조회하는데 문제가 발생했습니다.");
				// 로더 제거
				AUIGrid.removeAjaxLoader(<%=layerName%>myGridID);
			},
			loading : false
		});
	}
	
	//접수 버튼
	function <%=layerName%>fn_receipt_button(){
		if($(".<%=layerName%> #waitInfoForm").find( "#memberNm").val() == ""){
			GRIT.msg.alert("회원을 선택 후 접수해주세요");return;
		}
		
		var progressStsNo = $(".<%=layerName%> #waitInfoForm").find( "#progressStsNo").val();
		
		if(progressStsNo == ""){
			GRIT.msg.alert('예약중인 회원을 선택 후 접수해주세요.');
			return false;
		}
		
		if(progressStsNo == 2){
			GRIT.msg.alert('현재 접수 상태 회원입니다.');
			return false;
		}
		
		if(progressStsNo == 1 || progressStsNo == 3){
			GRIT.msg.alert('예약 취소된 회원입니다.');
			return false;
		}
		
		/* if(progressStsNo == 2){
			GRIT.msg.alert('대기 상태인  회원만 접수가 가능합니다.');
			return false;
		} */

		if(confirm("접수 하시겠습니까?")){
			<%=layerName%>fn_receipt();
		}
	}
	
	//접수로직
	function <%=layerName%>fn_receipt(){
		
		var progressStsNo = $(".<%=layerName%> #waitInfoForm").find( "#progressStsNo").val();
		
		var sendData = $(".<%=layerName%> form[name=waitInfoForm]").serializeObject();
		
		
         GRIT.tran.send({
			url: "/wfc/wfcReceipt",
			async: false,
			sendData: sendData,
			success: function(result){
					GRIT.msg.alert('접수가 완료되었습니다.');
					var progressStsNo = $(".<%=layerName%> #waitInfoForm").find( "#progressStsNo").val(1);
					$(".<%=layerName%> #progressSts").val('접수'); 
					<%=layerName%>loadData();
			},
 			loadingTarget: "<%=layerName%>"
 		}); 
	}
	
	//대기취소 버튼
	function <%=layerName%>fn_waitingCancel_button(){
		if($(".<%=layerName%> #waitInfoForm").find( "#memberNm").val() == ""){
			GRIT.msg.alert("회원을 선택 후 접수를 취소해주세요");return;
		}
		var progressStsNo = $(".<%=layerName%> #waitInfoForm").find( "#progressStsNo").val();
		
		/* if(progressStsNo == 1){
			GRIT.msg.alert('대기 상태인  회원만 접수가 가능합니다.');
			return false;
		} */
		if(progressStsNo == ""){
			GRIT.msg.alert('예약중인 회원을 선택 후 접수를 취소해주세요.');
			return false;
		}
		
		if(progressStsNo == 1 || progressStsNo == 3){
			GRIT.msg.alert('현재  예약 취소 상태인 회원입니다.');
			return false;
		}
		
		if(confirm("접수를 취소 하시겠습니까?")){
			<%=layerName%>fn_waitingCancel();
		}
	}
	
	//대기취소 로직
	function <%=layerName%>fn_waitingCancel(){
		
		if($(".<%=layerName%> #memberId").val() == ''){
			GRIT.msg.alert('해당 회원을 선택 후 대기취소 바랍니다.');
			return false;
		}
		
		var sendData = $(".<%=layerName%> form[name=waitInfoForm]").serializeObject();
		
         GRIT.tran.send({
			url: "/wfc/waitingCancel",
			async: false,
			sendData: sendData,
			success: function(result){
					GRIT.msg.alert('접수가 취소되었습니다.');
					<%-- <%=layerName%>fn_newSys(); --%>
					<%-- $(".<%=layerName%> #progressSts").val('대기취소'); --%>
					var progressStsNo = $(".<%=layerName%> #waitInfoForm").find( "#progressStsNo").val(2);
					<%=layerName%>loadData ();
			},
 			loadingTarget: "<%=layerName%>"
 		}); 
	}
	function <%=layerName%>checkSDate(obj){
			
			var yyyymmdd = obj.replace(/\-/g,'');
			
			if(!GRIT.date.isValidDate(yyyymmdd)){
				GRIT.msg.alert("날짜형식이 잘못되었습니다.");
				$(".<%=layerName%> #<%=layerName%>sDate").val("");
				$(".<%=layerName%> #<%=layerName%>sDate").focus();
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
	
	//저장 체크
	function <%=layerName%>fn_saveAwaiter() {
		
		if(confirm("저장 하시겠습니까?")){
			<%=layerName%>fn_save();
	    }
		
	}
</script>

