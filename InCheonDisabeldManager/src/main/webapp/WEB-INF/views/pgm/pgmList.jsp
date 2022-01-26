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
                    <h1>프로그램 조회</h1>
					<jsp:include page="../common/commonBtn.jsp">
						<jsp:param value="<%=layerName%>" name="layerName" />
					</jsp:include>                    
                </div>
                <!-- titleWrap : end -->
                
				<form name="<%=layerName%>searchForm1" onsubmit="return false;" autocomplete='off'>
					<table class="dataTable marginT10">
	                    <colgroup>
	                        <col style="width:140px">
	                        <col style="width:200px">
	                        <col style="width:140px">
	                        <col style="width:200px">
	                        <col style="width:140px">
	                        <col style="width:200px">
	                        <col style="width:140px">
	                        <col style="width:300px">
	                    </colgroup>
                    	<tbody>
                    		
                    		
	                    			<c:if test="${userGroupCd == 'A' || userGroupCd == 'B' || userGroupCd == 'E'}">
	                    			<tr>
										<th>복지시설</th> 
										<td colspan="3" style="border-right: none;">
											<input type="text" id="wffcltyCd" name="wffcltyCd" style="width:34.5%;" title="복지시설" oninput="<%=layerName%>fn_removeLinkNm();" onchange="<%=layerName%>setLclasCd(this.value);" onkeydown="<%=layerName%>fn_searchLinkCd(this.value);">
						            			<button type="button" class="iconSearchGlassBtn" onclick="<%=layerName%>fn_searchPop(); return false;">
						            				<img src="/resources/imagesV2/iconSearchGlass.png" class="iconSearchGlass">
						            			</button>
						        				<input type="text" id="linkNm" name="linkNm" style="width:58.5%; margin-left: 0px" title="복지시설명"  readonly /> 
										</td>
										<td colspan="5" style="border-left: none;"/>
									</tr>
									</c:if>
									
									<c:if test="${userGroupCd == 'D'}">
									<tr>	
										<th>복지시설</th> 
											<td style="border-right: none;">
											<select id="wffcltyCd" name="wffcltyCd" style="width: 100%; text-align-last : center;" tabindex="1" >
												<c:forEach var="list" items="${orgnzCodeList}">
													<option value="${list.groupCd}">
													<c:out value="${list.groupNm}" /></option>
												</c:forEach>
											</select>
											</td>
											<td colspan="6" style="border-left: none;"/>
									</tr>
										</c:if>
									<c:if test="${userGroupCd == 'C'}">
										<input type="hidden" id ="wffcltyCd" name = "wffcltyCd" value="${linkCd}" />
									</c:if>
										
							
                        	<tr>
                        	
								<th>대분류</th> 
								<td>
									<select id="searchLclasCd" name="searchLclasCd" style="width: 100%; text-align-last : center" tabindex="1" onchange="<%=layerName%>setMclasCd(this.value)">
										<option value ="">전체</option>
									</select>
								</td>
								
								<th>중분류</th> 
								<td>
									<select id="searchMclasCd" name="searchMclasCd" style="width: 100%; text-align-last : center" tabindex="1" onchange="<%=layerName%>setSclasCd(this.value)">
													<option value ="">전체</option>
									</select>
								</td>
								
								<th>소분류</th> 
								<td>
									<select id="searchSclasCd" name="searchSclasCd" style="width: 100%; text-align-last : center" tabindex="1">
													<option value ="">전체</option>
									</select>
								</td>
								
								<th>프로그램명</th>
								<td>
									<input type="text" id="searchProgramNm" name="searchProgramNm" style="width: 100%;" onkeypress="<%=layerName%>fn_pressPgm(this.form);" onkeyup="checkByte(this, 100)" >
								</td>
								
							</tr>
						</tbody>
						</table>
					</form>
				
					<div class="box-top">
						<h2>프로그램 리스트</h2>
					</div>

					<div class="box-wrap mb10">
						<div id="<%=layerName%>grid_wrap" style="height:271px;"></div>
					</div>
					
					<table class="dataTable">
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
					<tr style="width:10px;"></tr>
					<tr>
						<table class="layoutTable">
						    <tr>
							    <td valign="top">
							    <h2>프로그램 정보</h2>
							        <form name="pgmListForm" id="pgmListForm" method="post" autocomplete='off'>
				                    <table cellpadding="0" cellspacing="0"  class="dataTable" id="align_common" border="1" >
				                        <colgroup>
				                            <col width="14%" />
				                            <col width="20%" />
				                            <col width="14%" />
				                            <col width="20%" />
				                            <col width="14%" />
				                            <col width="20%" />
				                        </colgroup>                                               
				                            <th><span class="essentialItem">프로그램 코드</span></th>
				                            <td colspan="5"><input type="text" id="programCd" name="programCd" style="width:100%;text-align:left;" title="프로그램 코드" tabindex="1" onkeydown="<%=layerName%>EnterFilter('programNm');" readonly>
				                            </td>
				                        </tr>
				                        <tr>
				                        <th><span class="essentialItem">프로그램명</span></th>
				                            <td colspan="5">
				                            <input type="text" id="programNm" name="programNm" style="width:100%; text-align:left;" title="프로그램명" tabindex="1" onkeydown="<%=layerName%>EnterFilter('lclasCd');" onkeyup="checkByte(this, 100);" readonly>
				                            </td>
				                        </tr>
				                        <tr>
				                        	<th>대분류</th>
				                            <td>
												<input type="text" id="lclasNm" name="lclasNm" style="width:100%;text-align:left;" title="대분류" tabindex="1" onkeydown="<%=layerName%>EnterFilter('programNm');" readonly>
											</td>
											
				                            <th>중분류</th>
				                            <td>
												<input type="text" id="mclasNm" name="mclasNm" style="width:100%;text-align:left;" title="중분류" tabindex="1" onkeydown="<%=layerName%>EnterFilter('programNm');" readonly>
				                            </td>
				                            
				                            <th><span class="essentialItem">소분류</span></th>
				                            <td>
				                            	<input type="text" id="sclasNm" name="mclasNm" style="width:100%;text-align:left;" title="소분류" tabindex="1" onkeydown="<%=layerName%>EnterFilter('programNm');" readonly>
				                            </td>
				                        </tr>
				                        <tr>
					                        <th>프로그램 내역</th>
											<td colspan="5">
												<input type="text" id="programDetail" name="programDetail" style="width:100%;text-align:left;" title="프로그램 내역" tabindex="1" onkeydown="<%=layerName%>EnterFilter('timeDetail');" onkeyup="checkByte(this, 500);" readonly>
											</td>
				                         </tr>	
				                         <tr>
					                         <th><span class="essentialItem">운영시간</span></th>
											 <td colspan="5">
					                            <input type="text" id="timeDetail" name="timeDetail" style="width:100%;text-align:left;" title="운영시간" tabindex="1" onkeydown="<%=layerName%>EnterFilter('trgterDetail');" onkeyup="checkByte(this, 50);" readonly> 
											 </td>
				                         </tr>
				                         <tr>
				                    		<th><span class="essentialItem">대상자</span></th>
				                    		<td colspan="5">
				                    			<input type="text" id="trgterDetail" name="trgterDetail" style="width:100%;text-align:left;" title="대상자" tabindex="1" onkeydown="<%=layerName%>EnterFilter('feeDetail');" onkeyup="checkByte(this, 500);" readonly>
				                    		</td>
				                    	</tr>
				                    	 <tr>
				                    		<th>이용료</th>
					                        <td colspan="5">
					                            	<input type="text" id="feeDetail" name="feeDetail" style="width:100%;text-align:left;" title="이용료" tabindex="1" onkeydown="<%=layerName%>EnterFilter('operateFg');" onkeyup="checkByte(this, 50);" readonly>
					                        </td>
				                    	</tr>
				                    	<tr>
				                    		<th><span class="essentialItem">운영여부</span></th>
				                    		<td colspan="5">
				                    			<input type="text" id="operateNm" name="operateFg" style="width:100%;text-align:left;" title="운영여부" tabindex="1" onkeydown="<%=layerName%>EnterFilter('operateFg');" onkeyup="checkByte(this, 50);" readonly>
											</td>
				                    	</tr>
				                    </table>
				                    </form>
							    </td>
							    <td style="width: 10px; "></td>
							    <td style="width: 350px; ">
								    <div class="subtitleGroup">
		                                <div class="subtitle">프로그램 사진</div>
		                            </div>
		                             <!-- <div style ="height: 305px;">
		                                <div style="float:left;width:50%;height:50%;">
											<img id = "pmgListpic0" border="1">
										</div>
										
										<div style="clear:right;float:right;width:50%;height:50%;">
											<img id = "pmgListpic1" border="1">
										</div>
										
										<div style="float:left;width:50%;height:50%;">
											<img id = "pmgListpic2" border="1">
										</div>
										
										<div style="clear:right;float:right;width:50%;height:50%;">
											<img id = "pmgListpic3" border="1">
										</div>
									</div> -->
									<table cellpadding="0" cellspacing="0"  class="dataTable"  height="305px;">
				                        <colgroup>
				                            <col width="50%" />
				                            <col width="50%" />
				                        </colgroup>  
				                        <tr>
				                          <td height="149px;"><img id = "pmgListpic0" ></td>
				                          <td><img id = "pmgListpic1" ></td>
				                        </tr>  
				                        <tr>
				                          <td height="149px;"><img id = "pmgListpic2" ></td>
				                          <td><img id = "pmgListpic3" ></td>
				                        </tr>
				                    </table>    
							    </td>
						    </tr> 
						</table>
				    </tr>
				</tbody>
				</table>
<!-- E:section-top -->

<style type="text/css" >
	/** 헤더 툴팁 아이콘 스타일 */
	.aui-vscrollbar .aui-scroll-thumb, .aui-hscrollbar .aui-scroll-thumb {
	border: 1px solid #aaa;
	border-radius : 8px;
}
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
	
	#pmgListpic0 {
	    width: 100%;
	    height: 135px;
	}

	#pmgListpic1 {
	    width: 100%;
	    height: 135px;
	}
	
	#pmgListpic2 {
	    width: 100%;
	    height: 135px;
	}
	
	#pmgListpic3 {
	    width: 100%;
	    height: 135px;
	}
	
</style>

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
		<%=layerName%>fn_savePgmMgmt();
	});
	
	// 엑셀 다운로드
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .exel').click(function(){
		<%=layerName%>exportTo();
	});
	
	// 닫기
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .close').click(function(){
		mFnc.tabMenuClose('<%=layerName%>');
	});
	
	//파일 저장 캐시
	var <%=layerName%>myFileCaches = {};
	var <%=layerName%><%=layerName%>recentGridItem = null;
	
	//엔터키 조회시
	function <%=layerName%>fn_pressPgm(e){ 
    	if(event.keyCode == 13){ //javascript에서는 13이 enter키를 의미함 
    		<%=layerName%>loadData ();
		}
	}
	
	// AUIGrid 생성 후 반환 ID
	var <%=layerName%>myGridID;
	
	// AUIGrid 칼럼 설정
	var <%=layerName%>columnLayout  = [
		{dataField : "wffcltyNm"      ,headerText : "복지시설"   ,width : "15%", style : "my-column-left"}
       ,{dataField : "programCd"      ,headerText : "코드"   ,width : "5%", style : "my-column-center"}
       ,{dataField : "programNm" ,headerText : "프로그램명"       ,width : "15%", style : "my-column-left"}
       ,{dataField : "lclasNm"      ,headerText : "대분류"    ,width : "15%", style : "my-column-left"}
       ,{dataField : "mclasNm"      ,headerText : "중분류"    ,width : "15%", style : "my-column-left" } 
       ,{dataField : "sclasNm"      ,headerText : "소분류"    ,width : "15%", style : "my-column-left"} 
       ,{dataField : "programDetail"      ,headerText : "프로그램 내역"    ,width : "15%", style : "my-column-left"} 
       ,{dataField : "timeDetail"      ,headerText : "운영시간"    ,width : "15%", style : "my-column-left"}
       ,{dataField : "trgterDetail"      ,headerText : "대상자"    ,width : "15%", style : "my-column-left"}
       ,{dataField : "feeDetail"      ,headerText : "이용료"    ,width : "15%", style : "my-column-left"}
       ,{dataField : "operateNm"      ,headerText : "운영여부"    ,width : "15%", style : "my-column-center"}
       ];
	
	
	$(function () {
		// AUIGrid 그리드를 생성합니다.
		<%=layerName%>createAUIGrid(<%=layerName%>columnLayout);
		<%=layerName%>setLclasCd($(".<%=layerName%> #wffcltyCd").val());
	});
	
	

	// AUIGrid 를 생성합니다.
	function <%=layerName%>createAUIGrid(columnLayout) {
		
		var <%=layerName%>auiGridProps = {
			showRowCheckColumn : false,
			rowHeight : 38,
			headerHeight : 38,
			fixedColumnCount : 3,
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
			<%=layerName%>setPictureDiv(primeCell, item);
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
		$(".<%=layerName%> #programCd").val(item.programCd);
		$(".<%=layerName%> #programNm").val(item.programNm);
		$(".<%=layerName%> #lclasNm").val(item.lclasNm);
		$(".<%=layerName%> #mclasNm").val(item.mclasNm);
		$(".<%=layerName%> #sclasNm").val(item.sclasNm);
		$(".<%=layerName%> #programDetail").val(item.programDetail);
		$(".<%=layerName%> #timeDetail").val(item.timeDetail);
		$(".<%=layerName%> #trgterDetail").val(item.trgterDetail);
		$(".<%=layerName%> #feeDetail").val(item.feeDetail);
		$(".<%=layerName%> #operateNm").val(item.operateNm);
	}
	
	//엔터키 조회시
	function <%=layerName%>fn_pressPgm(e){ 
    	if(event.keyCode == 13){ //javascript에서는 13이 enter키를 의미함 
    		<%=layerName%>loadData ();
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
	
	//조회
	function <%=layerName%>loadData () {
		
		
		if ( $(".<%=layerName%> #wffcltyCd").val() == "" || $(".<%=layerName%> #wffcltyCd").val() == null ) {
			$(".<%=layerName%> #wffcltyCd").focus();
			GRIT.msg.alert("[복지시설]은 필수 항목입니다."); 
			return;
		}
		
		if($(".<%=layerName%> #wffcltyCd").val().length != "4"){
			$(".<%=layerName%> #wffcltyCd").focus();
			GRIT.msg.alert("[복지시설] 코드는 4자리로 입력하셔야 합니다."); 
		}
				
		var wffcltyCd      	= $(".<%=layerName%> #wffcltyCd").val();
		var searchLclasCd      	= $(".<%=layerName%> #searchLclasCd").val();
		var searchMclasCd = $(".<%=layerName%> #searchMclasCd").val();
		var searchSclasCd = $(".<%=layerName%> #searchSclasCd").val();
		var searchProgramNm = $(".<%=layerName%> #searchProgramNm").val();
		
		var sendData = {"wffcltyCd"			  : wffcltyCd
						,"searchLclasCd"      : searchLclasCd
						,"searchMclasCd"      : searchMclasCd
						,"searchSclasCd"      : searchSclasCd
						,"searchProgramNm" 	  : searchProgramNm};
		
		// ajax 요청 전 그리드에 로더 표시
		AUIGrid.showAjaxLoader(<%=layerName%>myGridID);
		
		GRIT.tran.send({
			url: "/pgm/pgmViewGrid1",
			sendData : sendData,
			success: function(result){
				
				// 그리드에 데이터 세팅
				// resData 는 JSON 을 파싱한 Array-Object 입니다.
				AUIGrid.setGridData(<%=layerName%>myGridID, result.data);
				//초기화
				<%=layerName%>fn_newPgmList();
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
	
	// 초기화
	function <%=layerName%>fn_newPgmList() {
		$(".<%=layerName%> #programCd").val("");
		$(".<%=layerName%> #programNm").val("");
		$(".<%=layerName%> #useFg").val("1");
		$(".<%=layerName%> #clasDetail").val("");
		$(".<%=layerName%> #registDt").val("");
		$(".<%=layerName%> #programDetail").val("");
		$(".<%=layerName%> #timeDetail").val("");
		$(".<%=layerName%> #trgterDetail").val("");
		$(".<%=layerName%> #feeDetail").val("");
		$(".<%=layerName%> #operateNm").val("");
		$(".<%=layerName%> #lclasNm").val("");
		$(".<%=layerName%> #mclasNm").val("");
		$(".<%=layerName%> #sclasNm").val("");
		$(".<%=layerName%> #pmgListpic0").attr('src', " ");
		$(".<%=layerName%> #pmgListpic1").attr('src', " ");
		$(".<%=layerName%> #pmgListpic2").attr('src', " ");
		$(".<%=layerName%> #pmgListpic3").attr('src', " ");
	}
	
	// 조회조건 복지시설 코드로 대분류코드 셋팅
	function <%=layerName%>setLclasCd(val){
		var sendData = {"wffcltyCd"   : val};
		 GRIT.tran.send({
			url: "/pgm/selectLclaCdView",
			async: false,
			sendData: sendData,
			success: function(result){
				//중분류 코드 셀렉트 박스 초기화
				$('.<%=layerName%> #searchLclasCd option').remove();
				$('.<%=layerName%> #searchLclasCd').append("<option value=''>전체</option>");
				//소분류코드 셀렉트 박스 초기화
				$('.<%=layerName%> #searchMclasCd option').remove();
				$('.<%=layerName%> #searchMclasCd').append("<option value=''>전체</option>");
				
				$('.<%=layerName%> #searchSclasCd option').remove();
				$('.<%=layerName%> #searchSclasCd').append("<option value=''>전체</option>");
				if(val != ""){
					for(var i=0; i<result.data.length; i++){
						$('.<%=layerName%> #searchLclasCd').append("<option value="+result.data[i].lclasCd+"> "+result.data[i].lclasNm+ "</option>");	
					}
				}
			},
 			loadingTarget: "<%=layerName%>"
 		});  
	}
	
	// 조회조건 대분류코드로 중분류코드 셋팅
	function <%=layerName%>setMclasCd(val){
		var wffcltyCd      	= $(".<%=layerName%> #wffcltyCd").val();
		var sendData = {"wffcltyCd" : wffcltyCd
						,"lclasCd"   : val};
		 GRIT.tran.send({
			url: "/pgm/selectMclaCdView",
			async: false,
			sendData: sendData,
			success: function(result){
				//중분류 코드 셀렉트 박스 초기화
				$('.<%=layerName%> #searchMclasCd option').remove();
				$('.<%=layerName%> #searchMclasCd').append("<option value=''>전체</option>");
				//소분류코드 셀렉트 박스 초기화
				$('.<%=layerName%> #searchSclasCd option').remove();
				$('.<%=layerName%> #searchSclasCd').append("<option value=''>전체</option>");
				if(val != ""){
					for(var i=0; i<result.data.length; i++){
						$('.<%=layerName%> #searchMclasCd').append("<option value="+result.data[i].mclasCd+"> "+result.data[i].mclasNm+ "</option>");	
					}
				}
			},
 			loadingTarget: "<%=layerName%>"
 		});  
	}
	
	// 조회조건 중분류코드로 소분류코드 셋팅
	function <%=layerName%>setSclasCd(val){
		var wffcltyCd      	= $(".<%=layerName%> #wffcltyCd").val();
		var sendData = {"wffcltyCd"  : wffcltyCd
						,"mclasCd"   : val};
		 GRIT.tran.send({
			url: "/pgm/selectSclaCdView",
			async: false,
			sendData: sendData,
			success: function(result){
				$('.<%=layerName%> #searchSclasCd option').remove();
				$('.<%=layerName%> #searchSclasCd').append("<option value=''>전체</option>");
				
				if(val != ""){
					for(var i=0; i<result.data.length; i++){
						$('.<%=layerName%> #searchSclasCd').append("<option value="+result.data[i].sclasCd+"> "+result.data[i].sclasNm+ "</option>");	
					}
				}
			},
 			loadingTarget: "<%=layerName%>"
 		});  
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
	
	//프로그램 사진 조회 
	function <%=layerName%>setPictureDiv(primeCell, item){
		
		var sendData = { wffcltyCd : item.wffcltyCd
						,programCd : item.programCd};

			
			GRIT.tran.send({
			url: "/pgm/selectPmgPic",
			sendData: sendData,
			success: function(result){
				 $(".<%=layerName%> #pmgListpic0").attr('src', " ");
				 $(".<%=layerName%> #pmgListpic1").attr('src', " ");
				 $(".<%=layerName%> #pmgListpic2").attr('src', " ");
				 $(".<%=layerName%> #pmgListpic3").attr('src', " ");
			for(var i=0; i<result.data.length; i++){
				$("#pmgListpic"+i+"").attr('src', result.data[i].allPicturePath+' ');
			}
			 <%-- if(typeof result.data[3].allPicturePath != "undefined"){
				 $(".<%=layerName%> #pmgListpic0").attr('src', result.data[0].allPicturePath); 
			 } else {
				 $(".<%=layerName%> #pmgListpic0").attr('src',' '); 
			 }
			 if(typeof result.data[1].allPicturePath != "undefined"){
				 $(".<%=layerName%> #pmgListpic1").attr('src', result.data[1].allPicturePath); 
			 } else {
				 $(".<%=layerName%> #pmgListpic1").attr('src',' '); 
			 }
			 if(typeof result.data[2].allPicturePath != "undefined"){
				 $(".<%=layerName%> #pmgListpic2").attr('src', result.data[2].allPicturePath); 
			 } else {
				 $(".<%=layerName%> #pmgListpic2").attr('src',' '); 
			 }
			 if(typeof result.data[3].allPicturePath != "undefined"){
				 $(".<%=layerName%> #pmgListpic3").attr('src', result.data[3].allPicturePath); 
			 } else {
				 $(".<%=layerName%> #pmgListpic3").attr('src',' '); 
			 } --%>
			<%-- $(".<%=layerName%> #pmgListpic0").attr('src', result.data[0].allPicturePath);
			$(".<%=layerName%> #pmgListpic1").attr('src', result.data[1].allPicturePath); --%>
				<%-- $(".<%=layerName%> #pmgListpic1").attr('src', result.data[0].allPicturePath);
				$(".<%=layerName%> #pmgListpic2").attr('src', result.data[1].allPicturePath); --%>
				<%-- $(".<%=layerName%> #pmgListpic4").attr('src', result.data[3].allPicturePath); --%>
			},
			error: function(request, status, error){
				GRIT.msg.alert("공통코드를 조회하는데 문제가 발생했습니다.");
			},
			loading : false
		});

	}
	
	// 복지시설 이름 제거
	function <%=layerName%>fn_removeLinkNm(){
			$(".<%=layerName%> #linkNm").val("");
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
		$(".<%=layerName%> #linkNm").val(item.wffcltyNm);
		<%=layerName%>setLclasCd(item.wffcltyCd);
	}
	
	function <%=layerName%>exportTo() {
		
		var excelList = AUIGrid.getGridData(<%=layerName%>myGridID);
		
		
		if(excelList.length == 0){
			GRIT.msg.alert("프로그램 리스트에 조회된 내용이 없습니다.");
			return false;
			}
		
		AUIGrid.exportToXlsx(<%=layerName%>myGridID, {
			fileName : "프로그램_조회",
			// 스타일 상태 유지 여부(기본값:true)
		});
	}
	
	//그리드 사이즈변경
	gridResize();
</script>

