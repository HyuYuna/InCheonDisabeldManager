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
                    <h1>장애인 특이사항 기록</h1>
					<jsp:include page="../common/commonBtn.jsp">
						<jsp:param value="<%=layerName%>" name="layerName" />
					</jsp:include>                    
                </div>
                
                <!-- titleWrap : end -->
				<form name="<%=layerName%>searchForm1" onsubmit="return false;" autocomplete='off'>
				<input type="hidden" id="<%=layerName%>groupType" name="groupType" value="${groupType}" />
					<table class="dataTable marginT10">
						<colgroup>
				        	<col style="width:140px">
	                        <col style="width:450px">
	                        <col style="width:140px">
	                        <col style="width:295px">
	                        <col style="width:140px">
	                        <col style="width:auto">
				    </colgroup>
	                    </colgroup>
	                    <tbody>
								<th>장애인</th> 
								<td class="title">
				                            	<input type="text" id="searchDspsnId" name="searchDspsnId" maxlength="10" style="width:45%;" title="장애인" oninput="<%=layerName%>fn_removeDspsnNm()" onkeydown="<%=layerName%>fn_searchAjaxDspsn(this.value)" >
					            				<button type="button" class="iconSearchGlassBtn" onclick="<%=layerName%>fn_selectDspsn(); return false;" margin-top: 2px">
					            					<img src="/resources/imagesV2/iconSearchGlass.png" class="iconSearchGlass">
					            				</button>
					        					<input type="text" id="searchDspsnNm" name="searchDspsnNm" style="width:47.7%;" title="장애인명"  disabled> 
								</td>
								
								<th>기록일</th>
								<td class="title">
									<input type="text" id="<%=layerName%>sDate" name="sDate" style="width: 100px;" class="datepicker hover_disabled" maxlength="10" onkeypress="<%=layerName%>fn_pressSys(this.form); " onblur="<%=layerName%>checksDate(this.value)" onKeyup="inputYMDNumber(this);" onKey> 
									<span style="margin-left:30px;">~</span>
									<input type="text" id="<%=layerName%>eDate" name="eDate" style="width: 100px; margin-left: 5px;" class="datepicker hover_disabled" maxlength="10" onkeypress="<%=layerName%>fn_pressSys(this.form);" onblur="<%=layerName%>checkeDate(this.value)" onKeyup="inputYMDNumber(this);">
								</td>
								
								<th>사례구분</th>
								<td class="title">
									<select id="searchUnusalFg" name="searchUnusalFg" style="width: 100%; text-align-last : center;" tabindex="1" onkeypress="<%=layerName%>fn_pressSys(this.form);">
									<option value="">전체</option>
										<c:if test="${!empty csmnDvsnList}">	
											<c:forEach var="list" items="${csmnDvsnList}">
												<option value="${list.csmnDvsnCd}">
													<c:out value="${list.csmnDvsnNm}" /></option>
											</c:forEach>
										</c:if>
									</select>
								</td>
				
				</tbody>
				</table>
					</form>
					<table class="layoutTable">
					<tbody>
						<tr>
							<td> 
					<h2>특이사항 리스트</h2>
					
						<div id="<%=layerName%>grid_wrap" style="height: 302px;"></div>
					</td>
					</tr>
					<tr><td>
						<table class="layoutTable">
						    <tr>
							    <td valign="top" style="width:*">
							    <h2>특이사항 기록</h2>
							        <form name="spclRecordForm" id="spclRecordForm" method="post" autocomplete='off'>
							        <input type="hidden" id="saveMode" name="saveMode" value=""/>
							        <input type="hidden" id="dspsnPopValue" name="dspsnPopValue" value=""/>
							        <input type="hidden" id="hdnDspsnId" name="hdnDspsnId" value=""/>
							        <input type="hidden" id="hdnRecordDd" name="hdnRecordDd" value=""/>
							        <input type="hidden" id="hdnRecordTt" name="hdnRecordTt" value=""/>
							        <input type="hidden" id="<%=layerName%>linkCd" name="linkCd" value="${linkCd}"/>
				                    <table cellpadding="0" cellspacing="0"  class="dataTable" id="align_common" border="1" >
				                        <colgroup>
				                            <col width="15%" />
				                            <col width="35%" />
				                            <col width="15%" />
				                            <col width="35%" />
				                            <col width="1%;" />
				                        </colgroup>                                               
				                        <tr>
				                            <th><span class="essentialItem">장애인</span></th>
				                            <td colspan="3">
				                            	<input type="text" id="dspsnId" name="dspsnId" style="width:15%;" maxlength="10" title="장애인" tabindex="4" oninput="<%=layerName%>fn_removeDspsnInfo();" onkeydown="<%=layerName%>fn_searchAjaxSpcDspsn2(this.value)" >
				                            	<span class="btn_left">
					            					<button type="button" class="iconSearchGlassBtn" onclick="<%=layerName%>fn_selectDspsn2(); return false;" tabindex="6">
					            						<img src="/resources/imagesV2/iconSearchGlass.png" class="iconSearchGlass">
					            					</button>
					        					</span>
					        					<input type="text" id="dspsnNm" name="dspsnNm" style="width:20.5%; margin-left: 0px" title="장애인명"  disabled> 
				                            </td>
				                            <td rowspan="4">
				                            	<div class="<%=layerName%>image-container">
				                            		<img id="<%=layerName%>img-view" src=" ">
				                            	 </div>
				                            </td>
				                          </tr>
				                          <tr>
				                            <th>생년월일</th>
				                            <td><input type="text" id="encBirthDd" name="encBirthDd" style="width:100%;text-align:left;" title="주민번호" tabindex="1" onkeydown="<%=layerName%>EnterFilter('spcGender');" readonly> 
				                            </td>
				                            <th>성별</th>
				                            <td><input type="text" id="spcGender" name="spcGender" style="width:100%;text-align:left;" title="성별" tabindex="1" onkeydown="<%=layerName%>EnterFilter('spcDisableTp');" readonly> </td>
				                        </tr>
				                        <tr>
				                        <th>장애유형</th>
				                            <td><input type="text" id="spcDisableTp" name="disableTp" style="width:100%;text-align:left;" title="장애유형" tabindex="1" onkeydown="<%=layerName%>EnterFilter('spcHealthSts03');" readonly> </td>
				                        <th>청각문제</th>
				                            <td><input type="text" id="spcHealthSts03" name="spcHealthSts03" style="width:100%;text-align:left;" title="청각문제" tabindex="1" onkeydown="<%=layerName%>EnterFilter('spcDisableDgreeFg');" readonly> </td>
				                        </tr>
				                        <tr>
					                        <th>장애정도</th>
				                            <td><input type="text" id="spcDisableDgreeFg" name="spcDisableDgreeFg" style="width:100%;text-align:left;" title="장애정도" tabindex="1" onkeydown="<%=layerName%>EnterFilter('spcHealthSts01');" readonly> </td>
				                        	<th>시각문제</th>
				                            <td><input type="text" id="spcHealthSts01" name="spcHealthSts01" style="width:100%;text-align:left;" title="시각문제" tabindex="1" onkeydown="<%=layerName%>EnterFilter('spcOutbreakTimeFg');" readonly> </td>
				                        </tr>
				                        <tr>
					                        <th>발생시기</th>
					                            <td><input type="text" id="spcOutbreakTimeFg" name="spcOutbreakTimeFg" style="width:100%;text-align:left;" title="발생시기" tabindex="1" onkeydown="<%=layerName%>EnterFilter('spcHealthSts02');" readonly> </td>
					                         <th>언어문제</th>
					                            <td colspan="2" ><input type="text" id="spcHealthSts02" name="spcHealthSts02" style="width:100%;text-align:left;" title="언어문제" tabindex="1" onkeydown="<%=layerName%>EnterFilter('unusalFg');" readonly> </td>
				                         		
				                         </tr>	
				                         <tr>
				                         <th><span class="essentialItem">사례구분</span></th>
										 <td>
				                            <select id="unusalFg" name="unusalFg" style="width: 100%; text-align-last : center;" onchange="<%=layerName%>selectBoxList(this.value);">
													<option value="" hidden></option>
													<c:if test="${!empty csmnDvsnList}">	
														<c:forEach var="list" items="${csmnDvsnList}">
															<option value="${list.csmnDvsnCd}">
																<c:out value="${list.csmnDvsnNm}" /></option>
														</c:forEach>
													</c:if>
												</select>
										</td>
										<th>질환</th>
					                            <td colspan="2"><input type="text" id="spcHealthSts06" name="spcHealthSts06" style="width:100%;text-align:left;" title="질환" tabindex="1" onkeydown="<%=layerName%>EnterFilter('actTp');" readonly> </td>
				                        </tr>
				                        <tr>
				                    		<th><span class="essentialItem">행동유형</span></th>
				                    		<td colspan = "4" >
					                            <select id="actTp" name="actTp" style="width: 36.8%; text-align-last : center;" tabindex="1" onchange="<%=layerName%>actTpDetail();" >
													<option value="" hidden></option>
													<c:if test="${!empty rsnLvngList}">	
														<c:forEach var="list" items="${rsnLvngList}">
															<option value="${list.rsnLvngCode}">
																<c:out value="${list.rsnLvngNm}" /></option>
														</c:forEach>
													</c:if>
												</select>
												<input type="text" id="actTpDetail" name="actTpDetail" style="width:63%;text-align:left;" title="기타행동유형" tabindex="1" onkeyup="checkByte(this, 200);" onkeydown="<%=layerName%>EnterFilter('measureDetail');">
											</td>
				                    	</tr>
				                    	 <tr>
				                    		<th>조치내역</th>
					                            <td colspan = "4" ><input type="text" id="measureDetail" name="measureDetail" style="width:100%;text-align:left;" title="조치내역" tabindex="1" onkeyup="checkByte(this, 500);"> </td>
				                    	</tr>
				                    </table>
				                    </form>
							    </td>
						    </tr> 
						</table>
				   </td></tr></tbody></table>
				
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
	
	.my-column-center{
		text-align: center;
	}
	
	.my-column-left {
		text-align: left;
	}
	.<%=layerName%>image-container{
            width: 120px;
            height: 150px;
    }
    
     #<%=layerName%>img-view {
     	width: 100%;
     	height: 100%;
    }
    
    td li {float: left; margin: 1px;}
    
    .auiGridHeader {
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
		<%=layerName%>fn_saveEnextMgmt();
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
	
	// 전역변수 값 설정
	var <%=layerName%>actTp = "";
	
	var <%=layerName%>columnGroupType = $(".<%=layerName%> #<%=layerName%>groupType").val();
	
	var <%=layerName%>columnLayout  = [ 
       {dataField : "dspsnNm" ,headerText : "장애인명"       ,width : "6%", style : "my-column-left" , headerStyle:"auiGridHeader"}
       ,{dataField : "disableTp"      ,headerText : "장애유형"    ,width : "6%", style : "my-column-left", headerStyle:"auiGridHeader"}
       ,{dataField : "disableDgreeFg"      ,headerText : "장애정도"    ,width : "7%", style : "my-column-left", headerStyle:"auiGridHeader" } 
       ,{dataField : "recordDd"      ,headerText : "기록일자"    ,width : "7%", dataType : "date", formatString : "yyyy-mm-dd", style : "my-column-center", headerStyle:"auiGridHeader"} 
       ,{dataField : "recordTt"      ,headerText : "기록시간"    ,width : "5%",dataType : "date", formatString : "yy:mm:dd", style : "my-column-center", headerStyle:"auiGridHeader"} 
       ,{dataField : "unusalFgNm"      ,headerText : "사례구분"    ,width : "15%", style : "my-column-left", headerStyle:"auiGridHeader"}
       ,{dataField : "actTpNm"      ,headerText : "행동유형"    ,width : "18%", style : 	"my-column-left", headerStyle:"auiGridHeader"} 
       ,{dataField : "measureDetail"      ,headerText : "조치사항"    ,width : "36%", style : "my-column-left", headerStyle:"auiGridHeader"}
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
		$(".<%=layerName%> #spclRecordForm").find("#saveMode").val("I");
		$(".<%=layerName%> #sehUserNm").focus();
		$(".<%=layerName%> #lvhsRsnEtcDetail").hide();
		$(".<%=layerName%> #actTpDetail").hide();
		
		var _today1 = new Date();
		var firstDay;

		firstDay = dayFormatChk(_today1, 1); //sysdate 첫일
		
		$(".<%=layerName%> #<%=layerName%>sDate").val(firstDay);	
		$(".<%=layerName%> #<%=layerName%>eDate").val(new Date().yyyymmdd());	
		
		$('.<%=layerName%> #dspsnId').focus();
		<%=layerName%>selectBoxList($(".<%=layerName%> #unusalFg").val());
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
		var Ipath = item.picturePath;
		var INm   = item.pictureNm;
		
		if(typeof Ipath != "undefined" && typeof INm != "undefined"){
			<%=layerName%>setViewImg(Ipath,INm);
		}else{
			$('#<%=layerName%>img-view').attr('src'," ");
		}
		$(".<%=layerName%> #wffcltyCd").val(item.wffcltyCd);
		$(".<%=layerName%> #dspsnId").val(item.dspsnId);
		$(".<%=layerName%> #hdnDspsnId").val(item.dspsnId);
		$(".<%=layerName%> #dspsnNm").val(item.dspsnNm);
		$(".<%=layerName%> #encBirthDd").val(item.encBirthDd.replace(/(\d{4})(\d{2})(\d{2})/, "$1-$2-$3"));
		$(".<%=layerName%> #spcGender").val(item.gender);
		$(".<%=layerName%> #spcDisableTp").val(item.disableTp);
		$(".<%=layerName%> #spcHealthSts03").val(item.healthSts03);
		$(".<%=layerName%> #spcDisableDgreeFg").val(item.disableDgreeFg);
		$(".<%=layerName%> #spcHealthSts01").val(item.healthSts01);
		$(".<%=layerName%> #spcOutbreakTimeFg").val(item.outbreakTimeFg);
		$(".<%=layerName%> #spcHealthSts02").val(item.healthSts02);
		$(".<%=layerName%> #unusalFg").val(item.unusalFg);
		$(".<%=layerName%> #actTp").val(item.actTp);
		<%=layerName%>actTp = item.actTp;
		
		if(<%=layerName%>actTp == 'EE'){
			$(".<%=layerName%> #actTpDetail").show();
		}
		else{
			$(".<%=layerName%> #actTpDetail").hide();
		}
		
		$(".<%=layerName%> #spcHealthSts06").val(item.healthSts06);
		$(".<%=layerName%> #actTpDetail").val(item.actTpDetail);
		$(".<%=layerName%> #measureDetail").val(item.measureDetail);
		$(".<%=layerName%> #<%=layerName%>img-view").val(item.picturePath);
		$(".<%=layerName%> #hdnRecordDd").val(item.recordDd);
		$(".<%=layerName%> #hdnRecordTt").val(item.recordTt);
		// 상태값
		$(".<%=layerName%> #spclRecordForm").find("#saveMode").val("U");
	}

	//조회
	function <%=layerName%>loadData () {
		
		var linkCd  =  $("#<%=layerName%>linkCd").val();
		var searchDspsnId = $(".<%=layerName%> #searchDspsnId").val();
		var searchUnusalFg = $(".<%=layerName%> #searchUnusalFg").val();
		var sDate 		   =  $(".<%=layerName%> #<%=layerName%>sDate").val();
		var eDate		   =  $(".<%=layerName%> #<%=layerName%>eDate").val();
		var searchUnusalFg =  $(".<%=layerName%> #searchUnusalFg").val();
		
		if( $("#<%=layerName%>sDate").val().length != "10"){
			 $("#<%=layerName%>sDate").focus();
		GRIT.msg.alert("조회 조건중 [기록일] 시작날짜가 올바르지 않습니다."); return;
		}
		
		if( $("#<%=layerName%>eDate").val().length != "10"){
			 $("#<%=layerName%>eDate").focus();
		GRIT.msg.alert("조회 조건중 [기록일] 종료날짜가 올바르지 않습니다."); return;
		}
		
		if(!GRIT.date.compareDateFT(sDate, eDate)){
			GRIT.msg.alert('기록일을 조회 시작일을 조회 종료일보다 빠르게 작성해주세요.');
			return false;
		}
		
		var sendData ={"searchDspsnId" : searchDspsnId
						,"sDate" : sDate
						,"eDate" : eDate
						,"searchUnusalFg" : searchUnusalFg
						,"linkCd" : linkCd};
		
		// ajax 요청 전 그리드에 로더 표시
		AUIGrid.showAjaxLoader(<%=layerName%>myGridID);
		
		GRIT.tran.send({
			url: "/wfc/selectWfcSpclRecordGrid",
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
			<%=layerName%>fn_newSys();
			$(".<%=layerName%> #userGroupCd").focus();
		}
	}
	
	//초기화
	function <%=layerName%>fn_newSys() {
		
		$(".<%=layerName%> #dspsnId").val("");
		$(".<%=layerName%> #dspsnNm").val("");
		$(".<%=layerName%> #disableTp").val("");
		$(".<%=layerName%> #encBirthDd").val("");
		$(".<%=layerName%> #spcGender").val("");
		$(".<%=layerName%> #spcDisableTp").val("");
		$(".<%=layerName%> #spcHealthSts03").val("");
		$(".<%=layerName%> #spcDisableDgreeFg").val("");
		$(".<%=layerName%> #spcHealthSts01").val("");
		$(".<%=layerName%> #spcOutbreakTimeFg").val("");
		$(".<%=layerName%> #spcHealthSts02").val("");
		$(".<%=layerName%> #unusalFg").val("");
		$(".<%=layerName%> #spcHealthSts06").val("");
		$(".<%=layerName%> #actTp").val("");
		$(".<%=layerName%> #measureDetail").val("");
		$('.<%=layerName%> #<%=layerName%>img-view').attr('src'," ");
		// 상태값
		$(".<%=layerName%> #spclRecordForm").find("#saveMode").val("I");
		$(".<%=layerName%> #hdnDspsnId").val("");
		$(".<%=layerName%> #hdnRecordDd").val("");
		$(".<%=layerName%> #hdnRecordTt").val("");
		$(".<%=layerName%> #spclRecordForm").find("#actTpDetail").hide();
		$('.<%=layerName%> #dspsnId').focus();
	}
	
	//저장 체크
	function <%=layerName%>fn_saveEnextMgmt() {
		
		if ( $(".<%=layerName%> #dspsnId").val() == "" || $(".<%=layerName%> #dspsnNm").val() == "" ) {
			$(".<%=layerName%> #dspsnId").focus();
			GRIT.msg.alert("[이용 장애인]은 필수 항목입니다."); return;
		}
		
		if ( $(".<%=layerName%> #unusalFg").val() == "" ) {
			$(".<%=layerName%> #unusalFg").focus();
			GRIT.msg.alert("[사례구분]는 필수 항목입니다."); return;
		}
		
		if ( $(".<%=layerName%> #actTp").val() == "" ) {
			$(".<%=layerName%> #actTp").focus();
			GRIT.msg.alert("[행동유형]은 필수 항목입니다."); return;
		}
		
		if(confirm("저장 하시겠습니까?")){
			<%=layerName%>fn_save();
	    } 
	}
	
	//저장
	function <%=layerName%>fn_save(){
        
		var sendData = $(".<%=layerName%> form[name=spclRecordForm]").serializeObject();
		
         GRIT.tran.send({
			url: "/wfc/saveSpclRecord",
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
				<%=layerName%>fn_newSys();
			},
 			loadingTarget: "<%=layerName%>"
 		}); 
	}
	
	// 장애인 팝업
 	function <%=layerName%>fn_selectDspsn(){
 		
 		var userId = $(".<%=layerName%> #userId").val();
 		$(".<%=layerName%> #spclRecordForm").find("#dspsnPopValue").val("");
 		/* if(userId == "" || userId == null){
 			GRIT.msg.alert("사용자 조회 후 변경이 가능합니다.");
 			return false;
 		} */
 		
		 var layerName = "<%=layerName%>"; 
		 var url = "<c:url value='/pop/searchDspsnPop?layerName="+layerName+"'/>";
		 var width="700";
		 var height="610";
		 var name="searchDspsnPop";
		 popitup(url, height, width, name);
	}
 	
 // 장애인 팝업2
 	function <%=layerName%>fn_selectDspsn2(){
 		
 		var userId = $(".<%=layerName%> #userId").val();
 		$(".<%=layerName%> #spclRecordForm").find("#dspsnPopValue").val("1");
 		/* if(userId == "" || userId == null){
 			GRIT.msg.alert("사용자 조회 후 변경이 가능합니다.");
 			return false;
 		} */
 		
		 var layerName = "<%=layerName%>"; 
		 var url = "<c:url value='/pop/searchDspsnPop?layerName="+layerName+"'/>";
		 var width="700";
		 var height="610";
		 var name="searchDspsnPop";
		 popitup(url, height, width, name);
	}
 	
 	//장애인 Ajax 조건 검색
	function <%=layerName%>fn_searchAjaxDspsn(value){

		   if(event.keyCode != 13 && event.keyCode != 9){
		   	   return false;
		   }
		   
		   if($(".<%=layerName%> #searchDspsnId").val().length == '10' && $(".<%=layerName%> #searchDspsnNm").val() != ""){
			   <%=layerName%>loadData();
			   }
		   
		    var dspsnId  = 	$(".<%=layerName%> #searchDspsnId").val();
			var dspsnNm  = $(".<%=layerName%> #searchDspsnNm").val();
			var sendData ={"dspsnId" : dspsnId};
			
			if(dspsnNm != ""){
				<%=layerName%>loadData();
			}
			
	        GRIT.tran.send({
				url: "/wfc/searchSpclAjaxDspsn",
				async: false,
				sendData: sendData,
				success: function(result){
					if(result.data.length > 1){
						<%=layerName%>fn_selectDspsn();
					}else if(result.data.length == 1){
						$(".<%=layerName%> #searchDspsnId").val(result.data[0].dspsnId);
						$(".<%=layerName%> #searchDspsnNm").val(result.data[0].dspsnNm);
					}else{
						setTimeout(function(){					
							GRIT.msg.alert("해당 장애인은 존재하지 않습니다");
							},50);
						$(".<%=layerName%> #searchDspsnId").focus();
						$(".<%=layerName%> #searchDspsnId").val("");
					}
					
				},
				loadingTarget: "<%=layerName%>"
			}); 
			
		}
	
 	//장애인 Ajax2
	function <%=layerName%>fn_searchAjaxSpcDspsn2(value){

		if(event.keyCode != 13 && event.keyCode != 9){
		   	   return false;
		   }
		   
			var spcDspsnId      = 	$(".<%=layerName%> #dspsnId").val();
			var sendData ={"spcDspsnId" : spcDspsnId};
			
	        GRIT.tran.send({
				url: "/wfc/searchSpcAjaxDspsn2",
				async: false,
				sendData: sendData,
				success: function(result){
					if(result.data[0].useFg == '0'){
						alert("관리 대상이 아닌 장애인이므로 사용할 수 없습니다");
						$(".<%=layerName%> #dspsnId").val("");
						return;
					}
					
					if(result.data.length > 1){
						<%=layerName%>fn_selectDspsn2();
					}else if(result.data.length == 1){
						var Ipath = result.data[0].picturePath;
						var INm   = result.data[0].pictureNm;
						if(typeof Ipath != "undefined" && typeof INm != "undefined"){
							<%=layerName%>setViewImg(Ipath,INm);
						}else{
							$('#<%=layerName%>img-view').attr('src'," ");
						}
						$(".<%=layerName%> #dspsnId").val(result.data[0].dspsnId);
						$(".<%=layerName%> #dspsnNm").val(result.data[0].dspsnNm);
						$(".<%=layerName%> #encBirthDd").val(result.data[0].encBirthDd.replace(/(\d{4})(\d{2})(\d{2})/, "$1-$2-$3"));
						$(".<%=layerName%> #spcGender").val(result.data[0].gender);
						$(".<%=layerName%> #spcDisableTp").val(result.data[0].disableTpNm);
						 $(".<%=layerName%> #spcHealthSts03").val(result.data[0].healthSts03);
						$(".<%=layerName%> #spcDisableDgreeFg").val(result.data[0].disableDgreeFg);
						$(".<%=layerName%> #spcHealthSts01").val(result.data[0].healthSts01);
						$(".<%=layerName%> #spcOutbreakTimeFg").val(result.data[0].outbreakTimeFg);
						$(".<%=layerName%> #spcHealthSts02").val(result.data[0].healthSts02);
						$(".<%=layerName%> #spcHealthSts06").val(result.data[0].healthSts06);
					}else{
						setTimeout(function(){					
							GRIT.msg.alert("해당 장애인은 존재하지 않습니다");
							},50);
						$(".<%=layerName%> #dspsnId").focus();
						$(".<%=layerName%> #dspsnId").val("");
					}
					
				},
				loadingTarget: "<%=layerName%>"
			}); 
			
		}
	
	// 이용장애인 이름 제거
	function <%=layerName%>fn_removeDspsnNm(){
			$(".<%=layerName%> #searchDspsnNm").val("");
	}
	
	function <%=layerName%>fn_removeDspsnInfo(){
		$(".<%=layerName%> #dspsnNm").val("");
		$(".<%=layerName%> #encBirthDd").val("");
		$(".<%=layerName%> #spcGender").val("");
		$(".<%=layerName%> #spcDisableTp").val("");
		$(".<%=layerName%> #spcHealthSts03").val("");
		$(".<%=layerName%> #spcDisableDgreeFg").val("");
		$(".<%=layerName%> #spcHealthSts01").val("");
		$(".<%=layerName%> #spcHealthSts02").val("");
		$(".<%=layerName%> #spcOutbreakTimeFg").val("");
		$(".<%=layerName%> #spcHealthSts06").val("");
		$(".<%=layerName%> #<%=layerName%>img-view").attr('src','');
	}
	
	//장애인 검색 callback
	function <%=layerName%>setSearchDspsnPop(item,  name){
		$(".<%=layerName%> #searchDspsnId").val(item.dspsnId);
		$(".<%=layerName%> #searchDspsnNm").val(item.dspsnNm);
		$(".<%=layerName%> #disableTp").val(item.disableTp);
	}
	
	//장애인 검색 callback2
	function <%=layerName%>setSearchDspsnPop2(item,  name){
		var Ipath = item.picturePath;
		var INm   = item.pictureNm;
		if(typeof Ipath != "undefined" && typeof INm != "undefined"){
			<%=layerName%>setViewImg(Ipath,INm);
		}else{
			$('#<%=layerName%>img-view').attr('src'," ");
		}
		$(".<%=layerName%> #dspsnId").val(item.dspsnId);
		$(".<%=layerName%> #dspsnNm").val(item.dspsnNm);
		$(".<%=layerName%> #encBirthDd").val(item.encBirthDd.replace(/(\d{4})(\d{2})(\d{2})/, "$1-$2-$3"));
		$(".<%=layerName%> #spcGender").val(item.gender);
		$(".<%=layerName%> #spcDisableTp").val(item.disableTpNm);
		$(".<%=layerName%> #spcHealthSts03").val(item.healthSts03);
		$(".<%=layerName%> #spcDisableDgreeFg").val(item.disableDgreeFg);
		$(".<%=layerName%> #spcHealthSts01").val(item.healthSts01);
		$(".<%=layerName%> #spcOutbreakTimeFg").val(item.outbreakTimeFg);
		$(".<%=layerName%> #spcHealthSts02").val(item.healthSts02);
		$(".<%=layerName%> #spcHealthSts06").val(item.healthSts06);
	}
	
	function <%=layerName%>fn_searchLinkCd(value){

	   if(event.keyCode != 13 && event.keyCode != 9){
	   	   return false;
	   } 	  
	   
		var userGroupCd = $(".<%=layerName%> #userGroupCd").val();
		var linkCd = value;

		var sendData ={"linkCd"      : linkCd
				      ,"userGroupCd" : userGroupCd};
	   
        GRIT.tran.send({
			url: "/bas/searchLinkcdList",
			async: false,
			sendData: sendData,
			success: function(result){
				if(result.data.length > 1){
					if($(".<%=layerName%> #linkCd").val() != '' || $(".<%=layerName%> #linkCd").val().length != 4){
        				<%=layerName%>fn_searchPop();        	
        			}
				}else if(result.data.length == 1){
					$(".<%=layerName%> #linkCd").val(result.data[0].linkcd);
					$(".<%=layerName%> #linkNm").val(result.data[0].linknm);
				}else{
					GRIT.msg.alert("조회된 데이터가 없습니다");
					$(".<%=layerName%> #linkCd").focus();
					$(".<%=layerName%> #linkCd").val("");
				}
				
			},
			loadingTarget: "<%=layerName%>"
		}); 
	}

	function <%=layerName%>actTpDetail(){
			if($(".<%=layerName%> #spclRecordForm").find("#actTp").val() == "EE"){
				$(".<%=layerName%> #actTpDetail").show();
			}
			else{
				$(".<%=layerName%> #actTpDetail").val("");
				$(".<%=layerName%> #actTpDetail").hide();
				
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

	// select 박스 ajax 조회
	function <%=layerName%>selectBoxList(val) {
		var unusalFg      = val;
		var sendData = {"unusalFg" : unusalFg};
		
		GRIT.tran.send({
			url: "/wfc/wfcTypeBehavior",
			sendData : sendData,
			success: function(result){
				
				$('#actTp option').remove();
				$('.<%=layerName%> #actTp').append("<option value='' hidden> "+"</option>");
				for(var i=0; i<result.data.length; i++){
					$('.<%=layerName%> #actTp').append("<option value="+result.data[i].typeBehaviorCd+"> "+result.data[i].typeBehaviorNm+ "</option>");
				}
			},
			
			error: function(request, status, error){;
				GRIT.msg.alert("사용자 조회하는데 문제가 발생했습니다.");
			},
			loading : false
		});
	}
	
	function <%=layerName%>juminMasking(str) {
		 str = String(str);
		    return str.replace(/([0-9]{7})$/gi,"-******");
	}
	
	function <%=layerName%>setViewImg(Ipath,INm){
		var ImgPathNm = Ipath+"/"+INm;
		$('#<%=layerName%>img-view').attr('src',ImgPathNm);
	}
	
function <%=layerName%>checksDate(obj){
		
		var yyyymmdd = obj.replace(/\-/g,'');
		
		if(!GRIT.date.isValidDate(yyyymmdd)){
			GRIT.msg.alert("날짜 형식이 잘못되었습니다.");
			$(".<%=layerName%> #<%=layerName%>sDate").val("");
			$(".<%=layerName%> #<%=layerName%>sDate").focus();
			}
		}
		
function <%=layerName%>checkeDate(obj){
	
	var yyyymmdd = obj.replace(/\-/g,'');
	
	if(!GRIT.date.isValidDate(yyyymmdd)){
		GRIT.msg.alert("날짜형식이 잘못되었습니다.");
		$(".<%=layerName%> #<%=layerName%>eDate").val("");
		$(".<%=layerName%> #<%=layerName%>eDate").focus();
		}
	}
	
function <%=layerName%>exportTo() {
	
	var excelList = AUIGrid.getGridData(<%=layerName%>myGridID);
	
	if(excelList.length == 0){
		GRIT.msg.alert("특이사항 리스트에 조회된 내용이 없습니다.");
		return false;
		}
	
		AUIGrid.exportToXlsx(<%=layerName%>myGridID, {
			fileName : "이용장애인_특이사항_기록",
			// 스타일 상태 유지 여부(기본값:true)
		});
	}
</script>

