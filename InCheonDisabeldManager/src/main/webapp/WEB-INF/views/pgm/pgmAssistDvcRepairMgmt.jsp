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
                    <h1>보장구 수리 내역 관리</h1>
					<jsp:include page="../common/commonBtn.jsp">
						<jsp:param value="<%=layerName%>" name="layerName" />
					</jsp:include>                    
                </div>
                
                <!-- titleWrap : end -->
				<form name="<%=layerName%>searchAssDvcRepForm" onsubmit="return false;" autocomplete='off'>
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
							<td style="border-right: none;">
	                          	<input type="text" id="searchDspsnId" name="searchDspsnId" style="width: 100px;"  title="장애인" oninput="<%=layerName%>fn_removeDspsnNm()" onkeydown="<%=layerName%>fn_searchDspsn2(this.value)" >
	           					<button type="button" class="iconSearchGlassBtn" onclick="<%=layerName%>fn_selectDspsn(); return false;" margin-top: 2px">
	           					<img src="/resources/imagesV2/iconSearchGlass.png" class="iconSearchGlass">
	           					</button>
	       						<input type="text" id="dspsnNm" name="dspsnNm" style="width: 157px;"  title="장애인명" disabled> 
							</td>
							<td colspan="2" style="border-left: none;width: 453px;"></td>
						</tr>
						<tr>
							<th>접수일</th>
							<td>
								<input type="text" id="sDateReceipt" name="sDateReceipt" style="width: 106px;" title="접수일" class="datepicker hover_disabled" maxlength="10" onkeypress="<%=layerName%>fn_pressSys(this.form); " onblur="<%=layerName%>checksDate(this.value)" onKeyup="inputYMDNumber(this);" onKey> 
								<span style="margin-left:30px;">~</span>
								<input type="text" id="eDateReceipt" name="eDateReceipt" style="width: 106px; margin-left: 5px;" title="접수일" class="datepicker hover_disabled" maxlength="10" onkeypress="<%=layerName%>fn_pressSys(this.form);" onblur="<%=layerName%>checkeDate(this.value)" onKeyup="inputYMDNumber(this);">
							</td>
							<th>수리일</th>
							<td>
								<input type="text" id="sDateProcess" name="sDateProcess" style="width: 106px;" title="수리일" class="datepicker hover_disabled" maxlength="10" onkeypress="<%=layerName%>fn_pressSys(this.form); " onblur="<%=layerName%>checksDate(this.value)" onKeyup="inputYMDNumber(this);" onKey> 
								<span style="margin-left:30px;">~</span>
								<input type="text" id="eDateProcess" name="eDateProcess" style="width: 106px; margin-left: 5px;" title="수리일" class="datepicker hover_disabled" maxlength="10" onkeypress="<%=layerName%>fn_pressSys(this.form);" onblur="<%=layerName%>checkeDate(this.value)" onKeyup="inputYMDNumber(this);">
							</td>
							<th>수리비지급일</th>
							<td>
								<input type="text" id="sDateRepairPay" name="sDateRepairPay" style="width: 106px;" title="수리비지급일" class="datepicker hover_disabled" maxlength="10" onkeypress="<%=layerName%>fn_pressSys(this.form); " onblur="<%=layerName%>checksDate(this.value)" onKeyup="inputYMDNumber(this);" onKey> 
								<span style="margin-left:30px;">~</span>
								<input type="text" id="eDateRepairPay" name="eDateRepairPay" style="width: 106px; margin-left: 5px;" title="수리비지급일" class="datepicker hover_disabled" maxlength="10" onkeypress="<%=layerName%>fn_pressSys(this.form);" onblur="<%=layerName%>checkeDate(this.value)" onKeyup="inputYMDNumber(this);">
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
                    </div>
						<div id="<%=layerName%>grid_wrap" style="height: 279px;"></div>
					</tr>
					<tr>
						<table class="layoutTable">
						    <tr>
							    <td valign="top" style="width:*">
							    <div class="subtitleGroup">
	                                <div class="subtitle">수리 정보</div>
	                                <div class="subBtnGroup">
	                                </div>
	                            </div>
							        <form name="assistDvcForm" id="assistDvcForm" method="post" autocomplete='off'>
				                    <table cellpadding="0" cellspacing="0"  class="dataTable" id="align_common" border="1" >
				                    	<input type="hidden" id="saveMode"      name="saveMode"      value=""/>
				                    	<input type="hidden" id="rowIndex"      name="rowIndex"      value=""/>
				                    	<input type="hidden" id="vDspsnId"      name="vDspsnId"      value=""/>
				                    	<input type="hidden" id="vReceiptDd"    name="vReceiptDd"    value=""/>
							        	<input type="hidden" id="dspsnPopValue" name="dspsnPopValue" value=""/>
							        	<input type="hidden" id="wffcltyCd"     name="wffcltyCd"     value="${wffcltyCd}" />
							        	<input type="hidden" id="saveDspsn"      name="saveDspsn"      value=""/>
				                        <colgroup>
				                            <col width="9%" />
				                            <col width="20%" />
				                            <col width="9%" />
				                            <col width="20%" />
				                            <col width="9%" />
				                            <col width="20%" />
				                        </colgroup>                                               
				                        <tr>
				                            <th style="border-bottom: 1px solid #5c78a7;"><span class="essentialItem">장애인</span></th>
				                            <td style="border-bottom: 1px solid #5c78a7;">
				                            	<input type="hidden" id="dspsnId" name="dspsnId" style="width: 90%;"  title="장애인" tabindex="1">
					        					<input type="text" id="assDspsnNm" name="assDspsnNm" style="width: 100%;" title="장애인명" onkeydown="<%=layerName%>EnterFilter('assEncJuminNo');" oninput="<%=layerName%>fn_removeDspsnInfo();"> 
				                            </td>
				                            <th style="border-bottom: 1px solid #5c78a7;"><span class="essentialItem">생년월일</span></th>
				                            <td style="border-bottom: 1px solid #5c78a7;">
				                            	<input type="text" id="assEncJuminNo" name="assEncJuminNo" class="datepicker hover_disabled" style="width:93%;text-align:left;" title="생년월일" tabindex="1" onKeyup="inputYMDNumber(this);" onkeydown="<%=layerName%>EnterFilter('assGender');" onblur="<%=layerName%>checkDate(this.value,'assEncJuminNo') " oninput="<%=layerName%>fn_removeDspsnInfo();" maxlength="10">
				                            </td>
				                            <th style="border-bottom: 1px solid #5c78a7;">연락처</th>
				                            <td style="border-bottom: 1px solid #5c78a7;">
				                            	<input type="text" id="assGender" name="assGender" style="width:73%; text-align:left;" title="연락처" tabindex="1" onkeydown="<%=layerName%>EnterFilter('encChk');" oninput="<%=layerName%>fn_removeDspsnInfo();">
				                            	<button type="button" class="normalBtn" id ="encChk" tabindex="1" onclick="<%=layerName%>checkDspsn();" style="width:75px;">검색</button>
				                            </td>
				                        </tr>
				                        <tr>
				                        	<td colspan="6" style="border-top: 1px solid #5c78a7; padding-left: 0px; height: 20px;" />
				                        </tr>
				                        <tr>
	                                       <th>장애유형</th>
	                                        <td>
	                                           <input type="text" id="assDisableTp" name="disableTp" style="width:100%; text-align:left;" title="장애유형" tabindex="1" onkeydown="<%=layerName%>EnterFilter('assHealthSts03');" readonly>
	                                        </td>
	                                        <th>장애정도</th>
	                                        <td>
	                                           <input type="text" id="assDisableDgreeFg" name="assDisableDgreeFg" style="width:100%; text-align:left;" title="장애정도" tabindex="1" onkeydown="<%=layerName%>EnterFilter('assHealthSts01');" readonly>
	                                        </td>
	                                        <th>발생시기</th>
	                                        <td>
	                                           <input type="text" id="assOutbreakTimeFg" name="assOutbreakTimeFg" style="width:100%; text-align:left;" title="발생시기" tabindex="1" onkeydown="<%=layerName%>EnterFilter('assHealthSts02');" readonly>
	                                        </td>
	                                    </tr>
	                                    <tr>
	                                       <th><span class="essentialItem">접수일</th>
	                                        <td>
	                                          <input type="text" id="assReceiptDd" name="assReceiptDd" style="width:90%" title="접수일" class="datepicker hover_disabled" maxlength="10" tabindex="1" onblur="<%=layerName%>checkAssReceiptDd(this.value);" onKeyup="inputYMDNumber(this);">
	                                       </td>
	                                       <th><span class="essentialItem">처리일</th>
	                                        <td>
	                                          <input type="text" id="assProcessDd" name="assProcessDd" style="width:90%" title="처리일"class="datepicker hover_disabled" maxlength="10" tabindex="1" onblur="<%=layerName%>checkAssProcessDd(this.value)" onKeyup="inputYMDNumber(this);">
	                                       </td>
	                                       <th><span class="essentialItem">수리비지급일</th>
	                                        <td>
	                                          <input type="text" id="assRepairPayDd" name="assRepairPayDd" style="width:90%" title="수리비지급일" class="datepicker hover_disabled" maxlength="10" tabindex="1" onblur="<%=layerName%>checkAssRepairPayDd(this.value)" onKeyup="inputYMDNumber(this);">    
	                                       </td>
	                                    </tr>
				                         <tr>
				                        	<th><span class="essentialItem">보장구</th>
				                            <td>
				                            	<select id="assAssistDvcKd" name="assAssistDvcKd" style="width:100%; text-align-last : center;" tabindex="1">
													<option value=""> </option>
													<c:if test="${!empty assistDvcRepairList}">	
														<c:forEach var="list" items="${assistDvcRepairList}">
															<option value="${list.assistDvcKd}">
																<c:out value="${list.assistDvcKdNm}" /></option>
														</c:forEach>
													</c:if>
												</select>
				                            </td>
				                            <th><span class="essentialItem">수리금액</th>
				                            <td>
				                            	<input type="text" id="assRepairAmt" name="assRepairAmt" style="width:100%; text-align:right;" title="수리금액" tabindex="1" maxlength="10" onkeyup="removeChar(event);fn_comma(this);"onkeydown="<%=layerName%>EnterFilter('assRepairCcpy');" >
				                            </td>
				                            <th>협력업체</th>
				                            <td>
				                            	<input type="text" id="assRepairCcpy" name="assRepairCcpy" style="width:100%; text-align:left;" title="협력업체" tabindex="1" onkeyup="checkByte(this, 100)" onkeydown="<%=layerName%>EnterFilter('assRepairRetail');">
				                            </td>
				                        </tr>
				                        <tr>
					                        <th><span class="essentialItem">수리내역</th>
					                        <td colspan="5">
					                        	<input type="text" id="assRepairRetail" name="assRepairRetail" style="width:100%; text-align:left;" title="수리내역" tabindex="1" onkeyup="checkByte(this, 100)" onkeydown="<%=layerName%>EnterFilter('assRepairItem');" >
					                        </td>	
				                        </tr>
				                        <tr>
					                        <th>수리품목</th>
					                        <td colspan="5">
					                        	<input type="text" id="assRepairItem" name="assRepairItem" style="width:100%; text-align:left;" title="수리품목" tabindex="1" onkeyup="checkByte(this, 100)" onkeydown="<%=layerName%>EnterFilter('useFg');" >
					                        </td>	
				                       </tr>
				                       <tr>
			                       	  	   <th>사용여부</th>
					                       <td style="border-right: none;">
					                       		<select id="useFg" name="useFg" style="width:100%; text-align-last : center" tabindex="1">
												<c:if test="${!empty useList}">	
													<c:forEach var="list" items="${useList}">
														<option value="${list.useFg}">
															<c:out value="${list.useFgNm}" /></option>
													</c:forEach>
												</c:if>
											</select> 
					                       </td>
					                       <td style="border-left: none;" colspan="4">
					                       </td>
				                       </tr>
				                    </table>
				                    </form>
							    </td>
						    </tr> 
						</table>
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
	
	// 신규
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .new').click(function(){
		<%=layerName%>fn_newAll();
	});
	
	// 저장
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .save').click(function(){
		<%=layerName%>fn_saveAssMgmt();
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
		{dataField : "dspsnId"          ,headerText : "장애인코드"     ,width : "10%", style : "my-column-center"}                                 
       ,{dataField : "dspsnNm"          ,headerText : "장애인명"       ,width : "10%", style : "my-column-left"}
       ,{dataField : "receiptDd"        ,headerText : "접수일"        ,width : "10%", dataType : "date", formatString : "yyyy-mm-dd", style : "my-column-center"} 
       ,{dataField : "processDd"        ,headerText : "처리일"        ,width : "10%",dataType : "date", formatString : "yyyy-mm-dd", style : "my-column-center"} 
       ,{dataField : "repairPayDd"      ,headerText : "수리비 지급일"   ,width : "10%",dataType : "date", formatString : "yyyy-mm-dd", style : "my-column-center"}
       ,{dataField : "assistDvcKdNm"    ,headerText : "보장구"        ,width : "10%", style : "my-column-center"}
       ,{dataField : "repairRetail"     ,headerText : "수리내역"      ,width : "20%", style : "my-column-left"}
       ,{dataField : "repairItem"       ,headerText : "수리품목"      ,width : "20%", style : "my-column-left"}
       ,{dataField : "repairAmt"        ,headerText : "수리금액"      ,width : "10%", style : "my-column-right", dataType : "numeric" ,ormatString : "#,##0",xlsxTextConversion : true}
       ,{dataField : "repairCcpy"       ,headerText : "수리 협력업체"   ,width : "15%", style : "my-column-left"}
       ,{dataField : "useFgNm"          ,headerText : "사용여부"       ,width : "5%", style : "my-column-center"}
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
		
		// 선택 체인지 이벤트 바인딩
		AUIGrid.bind(<%=layerName%>myGridID, "selectionChange", function(event) {
		
			var primeCell = event.primeCell; // 선택 대표 셀
			var item = primeCell.item; // 행 정보
			<%=layerName%>setFieldToFormWindow(primeCell, item);
			//$(".<%=layerName%> #rowIndex").val(primeCell.rowIndex);
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
		
		$(".<%=layerName%> #dspsnId").val(item.dspsnId);
		$(".<%=layerName%> #vDspsnId").val(item.dspsnId);
		$(".<%=layerName%> #assDspsnNm").val(item.dspsnNm);
		$(".<%=layerName%> #assEncJuminNo").val(item.encBirthDd);
		$(".<%=layerName%> #assGender").val(item.encPhoneNum);
		$(".<%=layerName%> #assDisableTp").val(item.disableTp);
		$(".<%=layerName%> #assDisableDgreeFg").val(item.disableDgreeFg);
		$(".<%=layerName%> #assOutbreakTimeFg").val(item.outbreakTimeFg);
		$(".<%=layerName%> #vReceiptDd").val(item.receiptDd);
		$(".<%=layerName%> #assReceiptDd").val(fn_yyymmdd(item.receiptDd));
		$(".<%=layerName%> #assProcessDd").val(fn_yyymmdd(item.processDd));
		$(".<%=layerName%> #assRepairPayDd").val(fn_yyymmdd(item.repairPayDd));
		$(".<%=layerName%> #assAssistDvcKd").val(item.assistDvcKd);
		$(".<%=layerName%> #assRepairRetail").val(item.repairRetail);
		$(".<%=layerName%> #assRepairItem").val(item.repairItem);
		$(".<%=layerName%> #assRepairAmt").val(numberComma(item.repairAmt));
		$(".<%=layerName%> #assRepairCcpy").val(item.repairCcpy);
		$(".<%=layerName%> #useFg").val(item.useFg);
		
		
		$(".<%=layerName%> #saveDspsn").val(0);
		// 상태값
		$(".<%=layerName%> #assistDvcForm").find("#saveMode").val("U");
		
		$(".<%=layerName%> #assDspsnNm").attr('readonly', true);
		$(".<%=layerName%> #assEncJuminNo").attr('readonly', true);
		$(".<%=layerName%> #assGender").attr('readonly', true);
		$(".<%=layerName%> #assGender").width('88%');
		$(".<%=layerName%> #encChk").hide();
	}

	
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
				GRIT.msg.alert("조회 조건중 [수리비지급일] 시작날짜가 올바르지 않습니다."); return;
			}
		}
		
		if( $(".<%=layerName%> #sDateRepairPay").val() != "" || $(".<%=layerName%> #eDateRepairPay").val() != ""){
			if( $(".<%=layerName%> #eDateRepairPay").val().length != "10"){
				GRIT.msg.alert("조회 조건중 [수리비지급일] 종료날짜가 올바르지 않습니다."); return;
			}
		}
		
		if( $(".<%=layerName%> #sDateRepairPay").val() != "" || $(".<%=layerName%> #eDateRepairPay").val() != ""){
			if(!GRIT.date.compareDateFT($(".<%=layerName%> #sDateRepairPay").val(), $(".<%=layerName%> #eDateRepairPay").val())){
				GRIT.msg.alert("[수리비지급일]의 시작일이 조회 종료일보다 클 수 없습니다.");return;
			}
		}
		
		var wffcltyCd = $(".<%=layerName%> #wffcltyCd").val();
		
		var sendData = { "wffcltyCd"        : wffcltyCd
						,"dspsnId"          : <%=layerName%>searchAssDvcRepForm.searchDspsnId.value
						,"assistDvcKd"      : <%=layerName%>searchAssDvcRepForm.sehAssistDvcKd.value
						,"sDateReceipt"     : <%=layerName%>searchAssDvcRepForm.sDateReceipt.value.replace(/\-/g,'')
						,"eDateReceipt"     : <%=layerName%>searchAssDvcRepForm.eDateReceipt.value.replace(/\-/g,'')
						,"sDateProcess"     : <%=layerName%>searchAssDvcRepForm.sDateProcess.value.replace(/\-/g,'')
						,"eDateProcess"     : <%=layerName%>searchAssDvcRepForm.eDateProcess.value.replace(/\-/g,'')
						,"sDateRepairPay"   : <%=layerName%>searchAssDvcRepForm.sDateRepairPay.value.replace(/\-/g,'')
						,"eDateRepairPay"   : <%=layerName%>searchAssDvcRepForm.eDateRepairPay.value.replace(/\-/g,'')};
		
		// ajax 요청 전 그리드에 로더 표시
		AUIGrid.showAjaxLoader(<%=layerName%>myGridID);
		
		GRIT.tran.send({
			url: "/pgm/selectAssistDcvRepairList",
			sendData : sendData,
			success: function(result){
				<%=layerName%>fn_newAss();
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
	
	// 신규
	function <%=layerName%>fn_newAll() {
		if ( confirm ("신규로 입력 하시겠습니까?") ) {
			<%=layerName%>fn_newAss();
		}
	}
	
	//초기화
	function <%=layerName%>fn_newAss() {
		$(".<%=layerName%> #dspsnId").val("");
		$(".<%=layerName%> #hdnDspsnId").val("");
		$(".<%=layerName%> #assDspsnNm").val("");
		$(".<%=layerName%> #assEncJuminNo").val("");
		$(".<%=layerName%> #assGender").val("");
		$(".<%=layerName%> #assDisableTp").val("");
		$(".<%=layerName%> #assDisableDgreeFg").val("");
		$(".<%=layerName%> #assOutbreakTimeFg").val("");
		$(".<%=layerName%> #assReceiptDd").val("");
		$(".<%=layerName%> #assProcessDd").val("");
		$(".<%=layerName%> #assRepairPayDd").val("");
		$(".<%=layerName%> #assAssistDvcKd").val("");
		$(".<%=layerName%> #assRepairRetail").val("");
		$(".<%=layerName%> #assRepairItem").val("");
		$(".<%=layerName%> #assRepairAmt").val("");
		$(".<%=layerName%> #assRepairCcpy").val("");
		$(".<%=layerName%> #useFg").val("1");
		
		
		//히든값
		$(".<%=layerName%> #vDspsnId").val("");
		$(".<%=layerName%> #vReceiptDd").val("");
		
		
		// 상태값
		$(".<%=layerName%> #assistDvcForm").find("#saveMode").val("I");
		
		$(".<%=layerName%> #assDspsnNm").focus();
		$(".<%=layerName%> #saveDspsn").val("");
		
		$(".<%=layerName%> #assDspsnNm").attr('readonly', false);
		$(".<%=layerName%> #assEncJuminNo").attr('readonly', false);
		$(".<%=layerName%> #assGender").attr('readonly', false);
		$(".<%=layerName%> #assGender").width('65%');
		$(".<%=layerName%> #encChk").show();
	}
	
	var <%=layerName%>overlapCnt = "";
	
	function <%=layerName%>overlapCheck(){
		   /* if(event.keyCode != 13 && event.keyCode != 9){
		   	   return false;
		   } */
			   
		   var dspsnId         = 	$(".<%=layerName%> #dspsnId").val();
		   var encBirthDd       = 	$(".<%=layerName%> #assEncJuminNo").val();
		   var receiptDd      = 	$(".<%=layerName%> #assReceiptDd").val();;
		   var sendData ={"dspsnId" : dspsnId
						   ,"encBirthDd" : encBirthDd
						   ,"receiptDd" : receiptDd};

	        GRIT.tran.send({
				url: "/pgm/selectSaveCnt",
				async: false,
				sendData: sendData,
				success: function(result){
					<%=layerName%>overlapCnt = result.data;
				},
				loadingTarget: "<%=layerName%>"
			}); 
			
		}
	
	//저장 체크
	function <%=layerName%>fn_saveAssMgmt() {
		if($(".<%=layerName%> #saveDspsn").val() == 0){
			if ( $(".<%=layerName%> #dspsnId").val() == "" || $(".<%=layerName%> #assDspsnNm").val() == "" ) {
				$(".<%=layerName%> #dspsnId").focus();
				GRIT.msg.alert("[이용 장애인] 검색 후 저장해주세요."); return;
			}
		}
		var assReceiptYYYYMMDD = $(".<%=layerName%> #assReceiptDd").val().replace(/\-/g,'');
		if (assReceiptYYYYMMDD.length != 8) {
			GRIT.msg.alert("[접수일] 날짜형식이 잘못되었습니다. "); 
			return;
		}
		
		//장애인 Ajax 검색
		<%=layerName%>overlapCheck();
		if($(".<%=layerName%> #vDspsnId").val() != $(".<%=layerName%> #dspsnId").val() || $(".<%=layerName%> #assReceiptDd").val().replace(/-/g, "") != $(".<%=layerName%> #vReceiptDd").val()){
			if(<%=layerName%>overlapCnt != 0){
				GRIT.msg.alert('해당 장애인은 수리 접수 날짜가 등록이 되어있는 상태입니다');
				<%=layerName%>overlapCnt = "";
				return;
			}
		}
		
		var assProcessYYYYMMDD = $(".<%=layerName%> #assProcessDd").val().replace(/\-/g,'');
		if (assProcessYYYYMMDD.length != 8) {
			GRIT.msg.alert("[처리일] 날짜형식이 잘못되었습니다. "); return;
		}
			
		var assRepairPayYYYYMMDD = $(".<%=layerName%> #assRepairPayDd").val().replace(/\-/g,'');
		if (assRepairPayYYYYMMDD.length != 8) {
			GRIT.msg.alert("[수리비지급] 날짜형식이 잘못되었습니다. "); return;
		}
	
		if ( $(".<%=layerName%> #assAssistDvcKd").val() == "" ) {
			$(".<%=layerName%> #assAssistDvcKd").focus();
			GRIT.msg.alert("[보장구]는 필수 항목입니다."); return;
		}
		
		if ( $(".<%=layerName%> #assRepairAmt").val() == "" ) {
			$(".<%=layerName%> #assRepairAmt").focus();
			GRIT.msg.alert("[수리금액]은 필수 항목입니다."); return;
		}
		
		if ( $(".<%=layerName%> #assRepairRetail").val() == "" ) {
			$(".<%=layerName%> #assRepairRetail").focus();
			GRIT.msg.alert("[수리내역]은 필수 항목입니다."); return;
		}
		
		
		// 중복체크
		var saveMode = $(".<%=layerName%> #saveMode").val();
		var saveDspsn = $(".<%=layerName%> #saveDspsn").val();
		var rowIndex = $(".<%=layerName%> #rowIndex").val();
		var checkDspsnId = $(".<%=layerName%> #dspsnId").val();
		var checkWffcltyCd = $(".<%=layerName%> #wffcltyCd").val();
		var checkAssReceiptDd = $(".<%=layerName%> #assReceiptDd").val().replace(/\-/g,'');
		
		var assDvcRepList = AUIGrid.getGridData(<%=layerName%>myGridID);

			
			/* // 신규입력
			if(saveMode == "I" && saveDspsn != "1"){
				if(assDvcRepList[i].wffcltyCd == checkWffcltyCd && assDvcRepList[i].dspsnId == checkDspsnId && 
			   		assDvcRepList[i].receiptDd == checkAssReceiptDd){
			   		GRIT.msg.alert("대상 [장애인코드]가 해당 [접수일]에 이미 등록 되어있습니다."); return;	
				}
			}
			
			// 수정
			if(saveMode == "U" && row != rowIndex){
				if(assDvcRepList[i].wffcltyCd == checkWffcltyCd && assDvcRepList[i].dspsnId == checkDspsnId && 
			   		assDvcRepList[i].receiptDd == checkAssReceiptDd){
			   		GRIT.msg.alert("[장애인코드]와 [접수일] 이미 등록된 정보가 있습니다."); return;	
				}
			} */
		
		if(confirm("저장 하시겠습니까?")){
			<%=layerName%>fn_save();
	    } 
	}
	
	//저장
	function <%=layerName%>fn_save(){
        
		var sendData = $(".<%=layerName%> form[name=assistDvcForm]").serializeObject();
		
         GRIT.tran.send({
			url: "/pgm/saveAssistDvcRepair",
			async: false,
			sendData: sendData,
			success: function(result){
				if(result.rtnCode == "0"){
					GRIT.msg.alert(result.message);
					<%=layerName%>loadData ();
				}else{
					//GRIT.msg.alert("[장애인코드]와[접수일]에 등록된 수리 정보가 있습니다.");
					GRIT.msg.alert(result.message);
				}
			},
 			loadingTarget: "<%=layerName%>"
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
 	
 	// 장애인 팝업2
 	function <%=layerName%>fn_selectDspsn2(){
 		
 		$(".<%=layerName%> #assistDvcForm").find("#dspsnPopValue").val(2);
 		
		 var layerName = "<%=layerName%>"; 
		 var url = "<c:url value='/pop/searchDspsnPop2?layerName="+layerName+"'/>";
		 var width="700";
		 var height="610";
		 var name="searchDspsnPop2";
		 popitup(url, height, width, name);
	}
 	
 	//조회조건 - 장애인검색
	function <%=layerName%>fn_searchDspsn2(value){

		   if(event.keyCode != 13 && event.keyCode != 9){
		   	   return false;
		   }
			var sendData ={"dspsnId" : value};
			
	        GRIT.tran.send({
	        	url: "/pgm/searchAssDspsn",
				async: false,
				sendData: sendData,
				success: function(result){
					if(result.data.length > 1){
						<%=layerName%>fn_selectDspsn();
					}else if(result.data.length == 1){
						$(".<%=layerName%> #searchDspsnId").val(result.data[0].dspsnId);
						$(".<%=layerName%> #dspsnNm").val(result.data[0].dspsnNm);
					}else{
						alert("조회된 데이터가 없습니다");
						$(".<%=layerName%> #searchDspsnId").focus();
						$(".<%=layerName%> #searchDspsnId").val("");
						$(".<%=layerName%> #dspsnNm").val("");
					}
					
				},
				loadingTarget: "<%=layerName%>"
			}); 
			
		}
	
	//수리정보 - 장애인검색
	function <%=layerName%>fn_searchAssDspsn(value){

		  if(event.keyCode != 13 && event.keyCode != 9){
		   	   return false;
		  }
			var sendData ={"dspsnId" : value};
			
	        GRIT.tran.send({
				url: "/pgm/searchAssDspsn2",
				async: false,
				sendData: sendData,
				success: function(result){
					if(result.data.length > 1){
						<%=layerName%>fn_selectDspsn2();
					}else if(result.data.length == 1){
						if(result.data[0].useFg == "미사용"){
							setTimeout(function(){
							$(".<%=layerName%> #dspsnId").val("");
							$(".<%=layerName%> #assDspsnNm").val("");
							$(".<%=layerName%> #assEncJuminNo").val("");
							$(".<%=layerName%> #assGender").val("");
							$(".<%=layerName%> #assDisableTp").val("");
							$(".<%=layerName%> #assDisableDgreeFg").val("");
							$(".<%=layerName%> #assOutbreakTimeFg").val("");
							
							alert("미사용 중인 장애인은 사용할 수 없습니다.");
							return;
							}, 50);
						}else{
							$(".<%=layerName%> #dspsnId").val(result.data[0].dspsnId);
							$(".<%=layerName%> #assDspsnNm").val(result.data[0].dspsnNm);
							$(".<%=layerName%> #assEncJuminNo").val(result.data[0].encBirthDd);
							$(".<%=layerName%> #assGender").val(result.data[0].gender);
							$(".<%=layerName%> #assDisableTp").val(result.data[0].disableTp);
							$(".<%=layerName%> #assDisableDgreeFg").val(result.data[0].disableDgreeFg);
							$(".<%=layerName%> #assOutbreakTimeFg").val(result.data[0].outbreakTimeFg);
						}
						
					}else{
						setTimeout(function(){					
						GRIT.msg.alert("조회된 데이터가 없습니다");
						$(".<%=layerName%> #dspsnId").val("");
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
	
	function <%=layerName%>fn_removeDspsnInfo(){
		$(".<%=layerName%> #dspsnId").val("");
		$(".<%=layerName%> #assDisableTp").val("");
		$(".<%=layerName%> #assDisableDgreeFg").val("");
		$(".<%=layerName%> #assOutbreakTimeFg").val("");
	}
	
	//장애인 검색 callback
	function <%=layerName%>setSearchDspsnPop(item,  name){
		$(".<%=layerName%> #searchDspsnId").val(item.dspsnId);
		$(".<%=layerName%> #dspsnNm").val(item.dspsnNm);
	}
	
	//장애인 검색 callback2
	function <%=layerName%>setSearchDspsnPop2(item,  name){
		
		if(item.useFg == "미사용"){
			$(".<%=layerName%> #dspsnId").val("");
			$(".<%=layerName%> #assDspsnNm").val("");
			$(".<%=layerName%> #assEncJuminNo").val("");
			$(".<%=layerName%> #assGender").val("");
			$(".<%=layerName%> #assDisableTp").val("");
			$(".<%=layerName%> #assDisableDgreeFg").val("");
			$(".<%=layerName%> #assOutbreakTimeFg").val("");
			
			GRIT.msg.alert("미사용 장애인을 선택 할 수 없습니다.");
			
		}else{
			$(".<%=layerName%> #dspsnId").val(item.dspsnId);
			$(".<%=layerName%> #assDspsnNm").val(item.dspsnNm);
			$(".<%=layerName%> #assEncJuminNo").val(fn_yyymmdd(item.encBirthDd));
			$(".<%=layerName%> #assGender").val(item.encPhoneNum);
			$(".<%=layerName%> #assDisableTp").val(item.disableTpNm);
			$(".<%=layerName%> #assDisableDgreeFg").val(item.disableDgreeFg);
			$(".<%=layerName%> #assOutbreakTimeFg").val(item.outbreakTimeFg);
			$(".<%=layerName%> #saveDspsn").val("0");
			<%=layerName%>checkDspsn();
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

	// 접수일 날짜 체크
	function <%=layerName%>checkAssReceiptDd(obj){
		
		var yyyymmdd = obj.replace(/\-/g,'');
		
		if(!GRIT.date.isValidDate(yyyymmdd)){
			alert("날짜형식이 잘못되었습니다.");
			$(".<%=layerName%> #assReceiptDd").val("");
			$(".<%=layerName%> #assReceiptDd").focus();
		}
	}
	
	// 수리일 날짜체크
	function <%=layerName%>checkAssProcessDd(obj){
	
		var yyyymmdd = obj.replace(/\-/g,'');
	
		if(!GRIT.date.isValidDate(yyyymmdd)){
			alert("날짜형식이 잘못되었습니다.");
			$(".<%=layerName%> #assProcessDd").val("");
			$(".<%=layerName%> #assProcessDd").focus();
		}
	}
	
	// 수리비지급일 날짜체크
	function <%=layerName%>checkAssRepairPayDd(obj){
		
		var yyyymmdd = obj.replace(/\-/g,'');
	
		if(!GRIT.date.isValidDate(yyyymmdd)){
			alert("날짜형식이 잘못되었습니다.");
			$(".<%=layerName%> #assRepairPayDd").val("");
			$(".<%=layerName%> #assRepairPayDd").focus();
		}
	}
	
	function <%=layerName%>checkDate(obj,fid){
	      
	      var yyyymmdd = obj.replace(/\-/g,'');
	      
	      if(!GRIT.date.isValidDate(yyyymmdd)){
	         GRIT.msg.alert("날짜형식이 잘못되었습니다.");
	         $(".<%=layerName%> #"+fid).val("");
	         }
	   }
	
	
	
	//장애인 Ajax 검색
	function <%=layerName%>checkDspsn(){
		   /* if(event.keyCode != 13 && event.keyCode != 9){
		   	   return false;
		   } */
		   var dspsnId         =    $(".<%=layerName%> #dspsnId").val();  
		   var dspsnNm         = 	$(".<%=layerName%> #assDspsnNm").val();
		   var encBirthDd       = 	$(".<%=layerName%> #assEncJuminNo").val();
		   var encPhoneNum      = 	$(".<%=layerName%> #assGender").val();
		   var sendData ={	"dspsnId" : dspsnId
				   		    ,"dspsnNm" : dspsnNm
							,"encBirthDd" : encBirthDd
							,"encPhoneNum" : encPhoneNum};
		   
		   if(dspsnNm == ""){
			   setTimeout(function() {
				   GRIT.msg.alert("장애인 이름을 입력 후 검색해주세요.");
					} , 10);
			   $(".<%=layerName%> #assDspsnNm").focus();
			   return;
		   }
		   
		   if(encBirthDd == ""){
			   setTimeout(function() {
				   GRIT.msg.alert("생년월일을 입력 후 검색해주세요.");
					} , 10);
			   $(".<%=layerName%> #encBirthDd").focus();
			   return;
		   }

	        GRIT.tran.send({
				url: "/pgm/selectCheckDspsn",
				async: false,
				sendData: sendData,
				success: function(result){
					if(result.data[0].useFg == 0){
						GRIT.msg.alert('관리 대상이 아닌 장애인이므로 사용할 수 없습니다');
						return;
					}
					var count = result.data.length;
					//장애인 0건 조회시
	        		if(count == 0){
						if(confirm("존재하지 않는 장애인입니다. 새로 추가하시겠습니까?")){
							$(".<%=layerName%> #saveDspsn").val('1');
							$(".<%=layerName%> #<%=layerName%>entrncDd").focus();
						} else{
							return;
						}
					//장애인 1건 조회시
					} else if(count == 1){
							GRIT.msg.alert('사용가능한 장애인입니다.');
							$(".<%=layerName%> #saveDspsn").val('0');
							$(".<%=layerName%> #dspsnId").val(result.data[0].dspsnId);
							$(".<%=layerName%> #assDisableTp").val(result.data[0].disableTp);
							$(".<%=layerName%> #assDisableDgreeFg").val(result.data[0].disableDgreeFg);
							$(".<%=layerName%> #assOutbreakTimeFg").val(result.data[0].outbreakTimeFg);
					//장애인 2건 이상 조회시
					} else{
						<%=layerName%>fn_selectDspsn2();
					}
					
				},
				loadingTarget: "<%=layerName%>"
			}); 
			
		}
	
	// 엑셀 다운로드
	function <%=layerName%>exportTo() {
		
		var assDvcRepairMgmt = AUIGrid.getGridData(<%=layerName%>myGridID);
		
		if(assDvcRepairMgmt.length == 0){
			GRIT.msg.alert("수리 리스트 조회된 내용이 없습니다.");
			return false;
		}
		
		AUIGrid.exportToXlsx(<%=layerName%>myGridID, {
			fileName : "보장구_수리내역_관리",
		});
	}
</script>

