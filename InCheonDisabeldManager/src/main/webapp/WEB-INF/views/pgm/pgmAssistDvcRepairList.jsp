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
                    <h1>보장구 수리 내역 조회</h1>
					<jsp:include page="../common/commonBtn.jsp">
						<jsp:param value="<%=layerName%>" name="layerName" />
					</jsp:include>                    
                </div>
                
                <!-- titleWrap : end -->
				<form name="<%=layerName%>searchAssDvcRepLisrtForm" onsubmit="return false;" autocomplete='off'>
					<table class="dataTable marginT10">
						<colgroup>
				        	 <col style="width:140px">
	                        <col style="width:auto">
	                        <col style="width:140px">
	                        <col style="width:auto">
	                        <col style="width:140px">
	                        <col style="width:auto">
				    </colgroup>
				     <tbody>
	                    <tr>
	                    	<th>복지시설</th>
							<td>
								<select id="sehWffcltyCd" name="sehWffcltyCd" style="width:290px; text-align-last : center;" tabindex="1">
									<c:choose>
			                    	<c:when test="${userGroupCd ne 'D'}">
			                    	<option value="">전체</option>
			                    	</c:when>
			                    	</c:choose>
									<c:if test="${!empty assDvcRepWffcltyList}">	
										<c:forEach var="list" items="${assDvcRepWffcltyList}">
											<option value="${list.wffcltyCd}">
												<c:out value="${list.wffcltyNm}" /></option>
										</c:forEach>
									</c:if>
								</select>
							</td>
	                    	<th>보장구</th>
							<td>
								<select id="sehAssistDvcKd" name="sehAssistDvcKd" style="width:290px; text-align-last : center;" tabindex="1">
								<option value="">전체</option>
									<c:if test="${!empty assistDvcRepairList}">	
										<c:forEach var="list" items="${assistDvcRepairList}">
											<option value="${list.assistDvcKd}">
												<c:out value="${list.assistDvcKdNm}" /></option>
										</c:forEach>
									</c:if>
								</select>
							</td>
							<th>장애인</th> 
							<td>
	                          	<input type="text" id="searchDspsnId" name="searchDspsnId" style="width: 100px;" title="장애인" oninput="<%=layerName%>fn_removeDspsnNm()" onkeydown="<%=layerName%>fn_searchDspsn(this.value)" >
	           					<button type="button" class="iconSearchGlassBtn" onclick="<%=layerName%>fn_selectDspsn(); return false;" margin-top: 2px">
	           					<img src="/resources/imagesV2/iconSearchGlass.png" class="iconSearchGlass">
	           					</button>
	       						<input type="text" id="dspsnNm" name="dspsnNm" style="width: 157px;" title="장애인명" disabled> 
							</td>
						</tr>
						<tr>
	                     <th>접수일</th>
	                     <td>
	                        <input type="text" id="sDateReceipt" name="sDateReceipt" style="width: 106px;" title="접수일" class="datepicker hover_disabled" maxlength="10" onkeypress="<%=layerName%>fn_pressSys(this.form); " onblur="<%=layerName%>checkDate(this.value,'sDateReceipt')" onKeyup="inputYMDNumber(this);" onKey> 
	                        <span style="margin-left:30px;">~</span>
	                        <input type="text" id="eDateReceipt" name="eDateReceipt" style="width: 106px; margin-left: 5px;" title="접수일" class="datepicker hover_disabled" maxlength="10" onkeypress="<%=layerName%>fn_pressSys(this.form);" onblur="<%=layerName%>checkDate(this.value,'eDateReceipt')" onKeyup="inputYMDNumber(this);">
	                     </td>
	                     <th>수리일</th>
	                     <td>
	                        <input type="text" id="sDateProcess" name="sDateProcess" style="width: 106px;" title="수리일" class="datepicker hover_disabled" maxlength="10" onkeypress="<%=layerName%>fn_pressSys(this.form); " onblur="<%=layerName%>checkDate(this.value,'sDateProcess')" onKeyup="inputYMDNumber(this);" onKey> 
	                        <span style="margin-left:30px;">~</span>
	                        <input type="text" id="eDateProcess" name="eDateProcess" style="width: 106px; margin-left: 5px;" title="수리일" class="datepicker hover_disabled" maxlength="10" onkeypress="<%=layerName%>fn_pressSys(this.form);" onblur="<%=layerName%>checkDate(this.value,'eDateProcess')" onKeyup="inputYMDNumber(this);">
	                     </td>
	                     <th>수리비 지급일</th>
	                     <td>
	                        <input type="text" id="sDateRepairPay" name="sDateRepairPay" style="width: 106px;" title="수리비 지급일" class="datepicker hover_disabled" maxlength="10" onkeypress="<%=layerName%>fn_pressSys(this.form); " onblur="<%=layerName%>checkDate(this.value,'sDateRepairPay')" onKeyup="inputYMDNumber(this);" onKey> 
	                        <span style="margin-left:30px;">~</span>
	                        <input type="text" id="eDateRepairPay" name="eDateRepairPay" style="width: 106px; margin-left: 5px;" title="수리비 지급일" class="datepicker hover_disabled" maxlength="10" onkeypress="<%=layerName%>fn_pressSys(this.form);" onblur="<%=layerName%>checkDate(this.value,'eDateRepairPay')" onKeyup="inputYMDNumber(this);">
	                     </td>
                  		</tr>
						</tbody>	
						</table>	
					</form>
				
					<table class="layoutTable">
				    <colgroup>
				        <col width="10%" />
				        <col width="16%" />
				        <col width="10%" />
				        <col width="16%" />
				        <col width="10%" />
				        <col width="16%" />
				        <col width="*" />
				    </colgroup>
					<tbody>
					<tr> 
					<div class="subtitleGroup">
                        <div class="subtitle">수리 리스트</div>
                        <div class="subBtnGroup">
                        </div>
                    <input type="hidden" id="rowIndex"      name="rowIndex"      value=""/>
                    </div>
						<div id="<%=layerName%>grid_wrap" style="height: 620px;"></div>
					</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- E:section-top -->

<script type="text/javascript" >
	// 조회 클릭시
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
	
	
	// AUIGrid 생성 후 반환 ID
	var <%=layerName%>myGridID;
	
	var <%=layerName%>columnLayout  = [
		{dataField : "dspsnNm"          ,headerText : "장애인명"       ,width : "10%", style : "my-column-left"}
	   ,{dataField : "wffcltyNm"        ,headerText : "복지시설명"    ,width : "20%", style : "my-column-left"}
       ,{dataField : "receiptDd"        ,headerText : "접수일"        ,width : "10%", dataType : "date", formatString : "yyyy-mm-dd", style : "my-column-center"} 
       ,{dataField : "processDd"        ,headerText : "처리일"        ,width : "10%",dataType : "date", formatString : "yyyy-mm-dd", style : "my-column-center"} 
       ,{dataField : "repairPayDd"      ,headerText : "수리비 지급일"   ,width : "10%",dataType : "date", formatString : "yyyy-mm-dd", style : "my-column-center"}
       ,{dataField : "assistDvcKd"      ,headerText : "보장구"        ,width : "10%", style : "my-column-center"}
       ,{dataField : "repairRetail"     ,headerText : "수리내역"      ,width : "20%", style : "my-column-left"}
       ,{dataField : "repairItem"       ,headerText : "수리품목"      ,width : "20%", style : "my-column-left"}
       ,{dataField : "repairAmt"        ,headerText : "수리금액"      ,width : "10%", style : "my-column-right", dataType : "numeric" ,ormatString : "#,##0",xlsxTextConversion : true}
       ,{dataField : "repairCcpy"       ,headerText : "수리 협력업체"   ,width : "15%", style : "my-column-left"}
       ,{dataField : "useFg"            ,headerText : "사용여부"       ,width : "5%", style : "my-column-center"}
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
		
		// 데이터 요청, 요청 성공 시 AUIGrid 에 데이터 삽입합니다.
		$(".<%=layerName%> #assistDvcForm").find("#saveMode").val("I");
		$(".<%=layerName%> #sehUserNm").focus();
		
		
		
	});
	
	
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

	//엔터키 조회시
	function <%=layerName%>fn_pressSys(e){ 
    	if(event.keyCode == 13){ //javascript에서는 13이 enter키를 의미함 
    		<%=layerName%>loadData ();
		}
	}
	
	//조회
	function <%=layerName%>loadData () {
		
		if($(".<%=layerName%> #searchDspsnId").val() != ""){
			if($(".<%=layerName%> #dspsnNm").val() == ""){
				GRIT.msg.alert("[장애인 코드]와 [장애인명]을 정확히 입력해주세요."); return;
			}
		}
		
		if( $(".<%=layerName%> #sDateReceipt").val() != "" || $(".<%=layerName%> #eDateReceipt").val() != ""){
			if( $(".<%=layerName%> #sDateReceipt").val().length != "10"){
				GRIT.msg.alert("조회 조건중 [접수일] 시작날짜가 올바르지 않습니다."); return;
			}
		}
		
		if($(".<%=layerName%> #sDateReceipt").val() != "" || $(".<%=layerName%> #eDateReceipt").val() != ""){
			if( $(".<%=layerName%> #eDateReceipt").val().length != "10"){
				GRIT.msg.alert("조회 조건중 [접수일] 종료날짜가 올바르지 않습니다."); return;
			}
		}
		
		if( $(".<%=layerName%> #sDateReceipt").val() != "" || $(".<%=layerName%> #eDateReceipt").val() != ""){
			if(!GRIT.date.compareDateFT($(".<%=layerName%> #sDateReceipt").val(), $(".<%=layerName%> #eDateReceipt").val())){
				GRIT.msg.alert("[접수일]의 시작일이 조회 종료일보다 클 수 없습니다."); return;
			}
		}
		
		if( $(".<%=layerName%> #sDateProcess").val() != "" || $(".<%=layerName%> #eDateProcess").val() != ""){
			if( $(".<%=layerName%> #sDateProcess").val().length != "10"){
				GRIT.msg.alert("조회 조건중 [수리일] 시작날짜가 올바르지 않습니다."); return;
			}
		}
		
		
		if( $(".<%=layerName%> #sDateProcess").val() != "" || $(".<%=layerName%> #eDateProcess").val() != ""){
			if( $(".<%=layerName%> #eDateProcess").val().length != "10"){
				GRIT.msg.alert("조회 조건중 [수리일] 종료날짜가 올바르지 않습니다."); return;
			}
		}
		
		if( $(".<%=layerName%> #sDateProcess").val() != "" || $(".<%=layerName%> #eDateProcess").val() != ""){
			if(!GRIT.date.compareDateFT($(".<%=layerName%> #sDateProcess").val(), $(".<%=layerName%> #eDateProcess").val())){
				GRIT.msg.alert("[수리일]의 시작일이 조회 종료일보다 클 수 없습니다."); return;
			}
		}
		
		if( $(".<%=layerName%> #sDateRepairPay").val() != "" || $(".<%=layerName%> #eDateRepairPay").val() != ""){
			if( $(".<%=layerName%> #sDateRepairPay").val().length != "10"){
				GRIT.msg.alert("조회 조건중 [수리비 지급일] 시작날짜가 올바르지 않습니다."); return;
			}
		}
		
		if( $(".<%=layerName%> #sDateRepairPay").val() != "" || $(".<%=layerName%> #eDateRepairPay").val() != ""){
			if( $(".<%=layerName%> #eDateRepairPay").val().length != "10"){
				GRIT.msg.alert("조회 조건중 [수리비 지급일] 종료날짜가 올바르지 않습니다."); return;
			}
		}
		
		if( $(".<%=layerName%> #sDateRepairPay").val() != "" || $(".<%=layerName%> #eDateRepairPay").val() != ""){
			if(!GRIT.date.compareDateFT($(".<%=layerName%> #sDateRepairPay").val(), $(".<%=layerName%> #eDateRepairPay").val())){
				GRIT.msg.alert("[수리비 지급일]의 시작일이 조회 종료일보다 클 수 없습니다.");return;
			}
		}
		
		var sendData = { "wffcltyCd"        : <%=layerName%>searchAssDvcRepLisrtForm.sehWffcltyCd.value
						,"dspsnId"          : <%=layerName%>searchAssDvcRepLisrtForm.searchDspsnId.value
						,"assistDvcKd"      : <%=layerName%>searchAssDvcRepLisrtForm.sehAssistDvcKd.value
						,"sDateReceipt"     : <%=layerName%>searchAssDvcRepLisrtForm.sDateReceipt.value.replace(/\-/g,'')
						,"eDateReceipt"     : <%=layerName%>searchAssDvcRepLisrtForm.eDateReceipt.value.replace(/\-/g,'')
						,"sDateProcess"     : <%=layerName%>searchAssDvcRepLisrtForm.sDateProcess.value.replace(/\-/g,'')
						,"eDateProcess"     : <%=layerName%>searchAssDvcRepLisrtForm.eDateProcess.value.replace(/\-/g,'')
						,"sDateRepairPay"   : <%=layerName%>searchAssDvcRepLisrtForm.sDateRepairPay.value.replace(/\-/g,'')
						,"eDateRepairPay"   : <%=layerName%>searchAssDvcRepLisrtForm.eDateRepairPay.value.replace(/\-/g,'')};
		
		// ajax 요청 전 그리드에 로더 표시
		AUIGrid.showAjaxLoader(<%=layerName%>myGridID);
		
		GRIT.tran.send({
			url: "/pgm/selectAssDcvRepairList",
			sendData : sendData,
			success: function(result){
				// 그리드에 데이터 세팅
				// resData 는 JSON 을 파싱한 Array-Object 입니다.
				AUIGrid.setGridData(<%=layerName%>myGridID, result.data);
				
				// 로더 제거
				AUIGrid.removeAjaxLoader(<%=layerName%>myGridID);
	 			
			},
			error: function(request, status, error){
				GRIT.msg.alert("사용자 조회하는데 문제가 발생했습니다.");
				// 로더 제거
				AUIGrid.removeAjaxLoader(<%=layerName%>myGridID);
			},
			loading : false
		});
	}
	
	
	// 장애인 팝업
 	function <%=layerName%>fn_selectDspsn(){
 		
 	$(".<%=layerName%> #assistDvcForm").find("#dspsnPopValue").val("");
 		
		 var layerName = "<%=layerName%>"; 
		 var url = "<c:url value='/pop/searchDspsnPop?layerName="+layerName+"'/>";
		 var width="700";
		 var height="610";
		 var name="searchDspsnPop";
		 popitup(url, height, width, name);
	}
 	
 	//조회조건 - 장애인검색
	function <%=layerName%>fn_searchDspsn(value){

		   if(event.keyCode != 13 && event.keyCode != 9){
		   	   return false;
		   }
			var sendData ={"dspsnId" : value};
			
	        GRIT.tran.send({
	        	url: "/pgm/searchAssDcvDspsn",
				async: false,
				sendData: sendData,
				success: function(result){
					if(result.data.length > 1){
						<%=layerName%>fn_selectDspsn();
					}else if(result.data.length == 1){
						$(".<%=layerName%> #searchDspsnId").val(result.data[0].dspsnId);
						$(".<%=layerName%> #dspsnNm").val(result.data[0].dspsnNm);
					}else{
						setTimeout(function(){					
						GRIT.msg.alert("조회된 데이터가 없습니다");
						$(".<%=layerName%> #searchDspsnId").val("");
						},50);
					}
					
				},
				loadingTarget: "<%=layerName%>"
			}); 
			
		}
	
	// 이용장애인 이름 제거
	function <%=layerName%>fn_removeDspsnNm(){
			$(".<%=layerName%> #dspsnNm").val("");
	}
		
	//장애인 검색 callback
	function <%=layerName%>setSearchDspsnPop(item,  name){
		$(".<%=layerName%> #searchDspsnId").val(item.dspsnId);
		$(".<%=layerName%> #dspsnNm").val(item.dspsnNm);
	}
	
	function <%=layerName%>checkDate(obj,fid){
	      
	      var yyyymmdd = obj.replace(/\-/g,'');
	      
	      if(!GRIT.date.isValidDate(yyyymmdd)){
	         GRIT.msg.alert("날짜형식이 잘못되었습니다.");
	         $(".<%=layerName%> #"+fid).val("");
	         }
	   }
	
	// 엑셀 다운로드
	function <%=layerName%>exportTo() {
		
		var assDvcRepairList = AUIGrid.getGridData(<%=layerName%>myGridID);
		
		if(assDvcRepairList.length == 0){
			GRIT.msg.alert("수리 리스트 조회된 내용이 없습니다.");
			return false;
		}
		
		AUIGrid.exportToXlsx(<%=layerName%>myGridID, {
			fileName : "보장구_수리내역_조회",
		});
	}
</script>

