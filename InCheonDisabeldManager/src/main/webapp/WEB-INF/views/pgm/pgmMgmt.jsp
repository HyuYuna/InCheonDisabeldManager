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
                    <h1>프로그램 관리</h1>
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
						<c:if test="${userGroupCd == 'E'}">
	                    			<tr>
										<th>복지시설</th> 
										<td colspan="3" style="border-right: none;">
											<input type="text" id="wffcltyCd" name="wffcltyCd" style="width:34.5%;" title="복지시설" maxlength="4" oninput="<%=layerName%>fn_removeLinkNm();" onkeydown="<%=layerName%>fn_searchLinkCd(this.value);">
						            			<button type="button" class="iconSearchGlassBtn" onclick="<%=layerName%>fn_searchPop(); return false;">
						            				<img src="/resources/imagesV2/iconSearchGlass.png" class="iconSearchGlass">
						            			</button>
						        				<input type="text" id="linkNm" name="linkNm" style="width:58.5%; margin-left: 0px" title="복지시설명"  readonly /> 
										</td>
										<td colspan="5" style="border-left: none;"/>
									</tr>
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
						<div id="<%=layerName%>grid_wrap" style="height: 309px;"></div>
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
					<tr>
						<table class="layoutTable">
						    <tr>
							    <td valign="top">
							    <h2>프로그램 정보</h2>
							        <form name="pgmMgmtForm" id="pgmMgmtForm" method="post" autocomplete='off'>
							        <input type="hidden" id="linkCd" name="linkCd" value="${linkCd}"/>
							        <input type="hidden" id="saveMode" name="saveMode" value=""/>
							        <input type="hidden" id="wffcltyListCount" name="wffcltyListCount" value="" />
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
				                            <input type="text" id="programNm" name="programNm" style="width:100%; text-align:left;" title="프로그램명" tabindex="1" onkeydown="<%=layerName%>EnterFilter('lCd');" onkeyup="checkByte(this, 100);">
				                            </td>
				                        </tr>
				                        <tr>
				                        	<th>대분류</th>
				                            <td>
				                            <select id="lCd" name="lclasCd" style="width: 100%; text-align-last : center" tabindex="1" onchange="<%=layerName%>setPgmMgmtMclasCd(this.value);">
													<option value =""></option>
											</select>
											</td>
											
				                            <th>중분류</th>
				                            <td>
				                            <select id="mCd" name="mclasCd" style="width: 100%; text-align-last : center" tabindex="1" onchange="<%=layerName%>setPgmMgmtSclasCd(this.value);">
											</select>
				                            </td>
				                            
				                            <th><span class="essentialItem">소분류</span></th>
				                            <td>
				                            <select id="sCd" name="sclasCd" style="width: 100%; text-align-last : center" tabindex="1">
											</select>
				                            </td>
				                        </tr>
				                        <tr>
					                        <th>프로그램 내역</th>
											<td colspan="5">
												<input type="text" id="programDetail" name="programDetail" style="width:100%;text-align:left;" title="프로그램 내역" tabindex="1" onkeydown="<%=layerName%>EnterFilter('timeDetail');" onkeyup="checkByte(this, 500);">
											</td>
				                         </tr>	
				                         <tr>
					                         <th><span class="essentialItem">운영시간</span></th>
											 <td colspan="5">
					                            <input type="text" id="timeDetail" name="timeDetail" style="width:100%;text-align:left;" title="운영시간" tabindex="1" onkeydown="<%=layerName%>EnterFilter('trgterDetail');" onkeyup="checkByte(this, 50);"> 
											 </td>
				                         </tr>
				                         <tr>
				                    		<th><span class="essentialItem">대상자</span></th>
				                    		<td colspan="5">
				                    			<input type="text" id="trgterDetail" name="trgterDetail" style="width:100%;text-align:left;" title="대상자" tabindex="1" onkeydown="<%=layerName%>EnterFilter('feeDetail');" onkeyup="checkByte(this, 500);">
				                    		</td>
				                    	</tr>
				                    	 <tr>
				                    		<th>이용료</th>
					                        <td colspan="5">
					                            	<input type="text" id="feeDetail" name="feeDetail" style="width:100%;text-align:left;" title="이용료" tabindex="1" onkeydown="<%=layerName%>EnterFilter('operateFg');" onkeyup="checkByte(this, 50);">
					                        </td>
				                    	</tr>
				                    	<tr>
				                    		<th><span class="essentialItem">운영여부</span></th>
				                    		<td colspan="5">
						                    	<select id="operateFg" name="operateFg" style="width: 100%; text-align-last : center" tabindex="1" >
													<c:if test="${!empty selectFacOp}">	
													<c:forEach var="list" items="${selectFacOp}">
														<option value="${list.facCode}">
													<c:out value="${list.facNm}" /></option>
													</c:forEach>
													</c:if>
												</select>
											</td>
				                    	</tr>
				                    </table>
				                    </form>
							    </td>
							    <td style="width:10px;"></td>
							    <td style="width: 390px; ">
								    <div class="subtitleGroup" style="margin-top: 8px;">
		                                <div class="subtitle">프로그램 사진</div>
		
		                                <div class="subBtnGroup">
		                                    <button type="button"  class="subBtn" onClick="<%=layerName%>addPictureRow();" ><img src="/resources/imagesV2/iconPlusBlue.png"  class="subBtnImg">추가</button>
		                                    <button type="button"  class="subBtn" onClick="<%=layerName%>delPictureRow();" ><img src="/resources/imagesV2/iconTrashBlue.png" class="subBtnImg">삭제</button>
		                                </div>
		                                <input type="file" id="file" name="file" accept="image/jpeg" style="visibility:hidden;" multiple></input>
	                            	</div>
								   	<div id="<%=layerName%>grid_wrap2" style="height: 307px;">
								    </div>
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
	
	// 삭제
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .delete').click(function(){
		var items = AUIGrid.getSelectedItems(<%=layerName%>myGridID);
		 // 그리드 선택 row
		 var row = items[0].rowIndex;
		 var programNm = items[0].item.programNm;
		 
		if(programNm != ''){
			if(confirm('"'+programNm+'"'+' 삭제하시겠습니까?')){
				 <%=layerName%>deletePgmMgmt();
			}
		}
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
	var <%=layerName%>recentGridItem = null;
	
	//엔터키 조회시
	function <%=layerName%>fn_pressPgm(e){ 
    	if(event.keyCode == 13){ //javascript에서는 13이 enter키를 의미함 
    		<%=layerName%>loadData ();
		}
	}
	
	// AUIGrid 생성 후 반환 ID
	var <%=layerName%>myGridID;
	var <%=layerName%>myGridID2;
	
	
	var searchClickFg = true;
	var pgmClickFg = true;
	
	// AUIGrid 칼럼 설정
	var <%=layerName%>columnLayout  = [ 
        {dataField : "programCd"      ,headerText : "코드"   ,width : "5%", style : "my-column-center"}
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
	
	// AUIGrid 칼럼 설정
	var <%=layerName%>columnLayout2  = [
        {dataField : "pictureNm"      ,headerText : "선택파일명"    ,width : "65%", style : "my-column-left"
			,labelFunction : function( rowIndex, columnIndex, value, headerText, item ) {
				if(typeof value == "undefined" || value == "") {
					return "선택 파일 없음";
				}
				return value;
			}	
		 }
	    ,{dataField : "null"           ,headerText : "파일", width : "35%"
	    	,renderer : {
				type : "ButtonRenderer",
				labelText : "파일 선택",
				
				onclick : function(rowIndex, columnIndex, value, item) {
					<%=layerName%>myButtonClick(item);
				}
			}
	    }
	    ,{dataField : "id"             ,headerText : "ID"         ,width : 0, visible : false}
		,{dataField : "wffcltyCd"      ,headerText : "복지시설코드"  ,width : 0, visible : false}
		,{dataField : "programCd"      ,headerText : "프로그램코드"  ,width : 0, visible : false}
		,{dataField : "picturePath"    ,headerText : "파일저장위치"  ,width : 0 , visible : false}
		,{dataField : "pictureRealNm"  ,headerText : "실제파일명"    ,width : 50 , visible : false}
	    ,{dataField : "status"         ,headerText : "상태값"       ,width : 0, visible : false}
       ];
	
	$(function () {
		// AUIGrid 그리드를 생성합니다.
		<%=layerName%>createAUIGrid(<%=layerName%>columnLayout);
		<%=layerName%>createAUIGrid2(<%=layerName%>columnLayout2);
		
		// 데이터 요청, 요청 성공 시 AUIGrid 에 데이터 삽입합니다.
		
		$(".<%=layerName%> #pgmMgmtForm").find("#saveMode").val("I");
		
		// 파일 선택하기
		$('.<%=layerName%> #file').on('change', function(evt) {
			var data = null;
			var file = evt.target.files[0];
			
			if(!/\.(jpg|jpeg)$/i.test(file.name)){
				GRIT.msg.alert("이미지파일은 jpg, jpeg만 업로드 할 수 있습니다.")
				return;
			}
			
			
			if(file.size > 2048000) {
				GRIT.msg.alert("이미지파일은 2MB 를 초과해선 안됩니다.");
				return;
			}
			
			// 선택 파일명 그리드에 출력 시킴
			AUIGrid.updateRowsById(<%=layerName%>myGridID2, {
				id        : <%=layerName%>recentGridItem.id,
				pictureNm :  file.name
			});
			
			var stats = "";
			
		    if(AUIGrid.isAddedById(<%=layerName%>myGridID2,<%=layerName%>recentGridItem.id)){
				stats = "I";
			}else if(AUIGrid.isEditedById(<%=layerName%>myGridID2,<%=layerName%>recentGridItem.id)){
				stats = "U";
			}
			
			// 서버로 보낼 파일 캐시에 보관
			<%=layerName%>myFileCaches[<%=layerName%>recentGridItem.id] = {
				wffcltyCd     : <%=layerName%>recentGridItem.wffcltyCd,
				programCd 	  : <%=layerName%>recentGridItem.programCd,
				pictureRealNm : <%=layerName%>recentGridItem.pictureRealNm,
				stats         : stats,
				file          : file
			};
			
			$(this).val("");
			
		});
		<%=layerName%>setPgmMgmtLclasCd($(".<%=layerName%> #linkCd").val());
		<%=layerName%>selectLcals();
		
		
		
		$(".<%=layerName%> #programNm").focus();
	});
	
	function <%=layerName%>selectLcals(){
		
		$(".<%=layerName%> #linkCd").val();
		
		$(".<%=layerName%> #searchLclasCd").mousedown(function() {
			var searchFg = searchClickFg;
			if(searchFg){
			
			var linkCd = $(".<%=layerName%> #linkCd").val();
			var sendData = {"linkCd" : linkCd};
				GRIT.tran.send({
					url: "/pgm/getLclasCd",
					sendData: sendData,
					success: function(result){
						
					$('.<%=layerName%> #searchLclasCd').empty();
					//$('#searchLclasCd option').remove();
						$('.<%=layerName%> #searchLclasCd').append("<option value=''>전체</option>");
						$.each(result.data, function(i, item){
						
						$('.<%=layerName%> #searchLclasCd').append("<option value='" + item.lclasCd + "'>" + item.lclasNm +"</option>");
						});
						
						searchClickFg = false;
						
					},
					error: function(request, status, error){
						GRIT.msg.alert("대분류를 조회하는데 문제가 발생했습니다.");
					},
					loading : false
				});
			}else{
				searchClickFg = true;
			}
		});
	 
		$(".<%=layerName%> #lCd").mousedown(function() {
			var pgmFg = pgmClickFg;
			if(pgmFg){
			var linkCd = $('.<%=layerName%> #linkCd').val();
			var sendData;
			GRIT.tran.send({
				url: "/pgm/getLclasCd", 
				sendData: {"linkCd" : linkCd},
				success: function(result){
					
				$('.<%=layerName%> #lCd').empty();
				
				$('.<%=layerName%> #lCd').append("<option value='' hidden></option>");
					$.each(result.data, function(i, item){
					
					$('.<%=layerName%> #lCd').append("<option value='" + item.lclasCd + "'>" + item.lclasNm +"</option>");
					});
					
					pgmClickFg = false;
					
				},
				error: function(request, status, error){
					GRIT.msg.alert("대분류를 조회하는데 문제가 발생했습니다.");
				},
				loading : false
			});
		}else{
			pgmClickFg = true;
		}	
		
	});
		
	}
	

	// AUIGrid 를 생성합니다.
	function <%=layerName%>createAUIGrid(columnLayout) {
		
		var <%=layerName%>auiGridProps = {
			showRowCheckColumn : false,
			rowHeight : 38,
			headerHeight : 38,
			fixedColumnCount : 2,
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
			<%=layerName%>setHistoryGrid(primeCell, item);
		});
		
		// 그리드 ready 이벤트 바인딩
		AUIGrid.bind(<%=layerName%>myGridID, "ready", <%=layerName%>auiGridCompleteHandler);
	}
	
	// AUIGrid 를 생성합니다.
	function <%=layerName%>createAUIGrid2(columnLayout) {
		
		var <%=layerName%>auiGridProps = {
			rowIdField : "id",
			blankToNullOnEditing : true,
			softRemoveRowMode : false,
			wordWrap : false, 
			rowHeight : 38,
			headerHeight : 38,
			noDataMessage : "사진이 존재하지 않습니다."
		};
		
		// 실제로 #grid_wrap 에 그리드 생성
		<%=layerName%>myGridID2 = AUIGrid.create("#<%=layerName%>grid_wrap2", columnLayout, <%=layerName%>auiGridProps);
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
		$(".<%=layerName%> #lCd").val(item.lclasCd);
		<%=layerName%>setPgmMgmtMclasCd(item.lclasCd);
		$(".<%=layerName%> #mCd").val(item.mclasCd);
		<%=layerName%>setPgmMgmtSclasCd(item.mclasCd);
		$(".<%=layerName%> #sCd").val(item.sclasCd);
		$(".<%=layerName%> #programDetail").val(item.programDetail);
		$(".<%=layerName%> #timeDetail").val(item.timeDetail);
		$(".<%=layerName%> #trgterDetail").val(item.trgterDetail);
		$(".<%=layerName%> #feeDetail").val(item.feeDetail);
		$(".<%=layerName%> #operateFg").val(item.operateFg);
		//saveMode 상태값
		$(".<%=layerName%> #pgmMgmtForm").find("#saveMode").val("U");
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
		
		if ( $(".<%=layerName%> #linkCd").val().length != "4") {
			$(".<%=layerName%> #wffcltyCd").focus();
			GRIT.msg.alert("[복지시설]을 입력 후 조회해주세요"); return;
		}
		
		var linkCd		  = $(".<%=layerName%> #linkCd").val();
		var searchLclasCd = $(".<%=layerName%> #searchLclasCd").val();
		var searchMclasCd = $(".<%=layerName%> #searchMclasCd").val();
		var searchSclasCd = $(".<%=layerName%> #searchSclasCd").val();
		var searchProgramNm = $(".<%=layerName%> #searchProgramNm").val();
		
		var sendData = {"linkCd"			  : linkCd
						,"searchLclasCd"      : searchLclasCd
						,"searchMclasCd"      : searchMclasCd
						,"searchSclasCd"      : searchSclasCd
						,"searchProgramNm" 	  : searchProgramNm};
		
		// ajax 요청 전 그리드에 로더 표시
		AUIGrid.showAjaxLoader(<%=layerName%>myGridID);
		
		GRIT.tran.send({
			url: "/pgm/pgmMgmtGrid1",
			sendData : sendData,
			success: function(result){
				
				// 그리드에 데이터 세팅
				// resData 는 JSON 을 파싱한 Array-Object 입니다.
				AUIGrid.setGridData(<%=layerName%>myGridID, result.data);
				//초기화
				<%=layerName%>fn_newPgmMgmt();
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
		if($(".<%=layerName%> #linkCd").val() == ""){
			GRIT.msg.alert("복지시설을 조회 후 신규 입력을 할 수 있습니다.")
			return;
		}
		
		if ( confirm ("신규로 입력 하시겠습니까?") ) {
			$(".<%=layerName%> #programNm").focus();
			<%=layerName%>fn_newPgmMgmt();
			
		}
	}
	
	// 초기화
	function <%=layerName%>fn_newPgmMgmt() {
		$(".<%=layerName%> #programCd").val("");
		$(".<%=layerName%> #programNm").val("");
		$(".<%=layerName%> #useFg").val("1");
		$(".<%=layerName%> #clasDetail").val("");
		$(".<%=layerName%> #registDt").val("");
		$(".<%=layerName%> #programDetail").val("");
		$(".<%=layerName%> #timeDetail").val("");
		$(".<%=layerName%> #trgterDetail").val("");
		$(".<%=layerName%> #feeDetail").val("");
		$(".<%=layerName%> #operateFg").val("1");
		$(".<%=layerName%> #lCd option:eq(0)").prop("selected",true);
		<%=layerName%>setPgmMgmtMclasCd($(".<%=layerName%> #lCd").val());
		<%=layerName%>setPgmMgmtSclasCd($(".<%=layerName%> #mCd").val());
		// 상태값
		$(".<%=layerName%> #pgmMgmtForm").find("#saveMode").val("I");
		AUIGrid.setGridData(<%=layerName%>myGridID2, []);
	}
	
	//저장 체크
	function <%=layerName%>fn_savePgmMgmt() {
		
		if ( $(".<%=layerName%> #programNm").val() == "" || $(".<%=layerName%> #programNm").val() == "" ) {
			$(".<%=layerName%> #programNm").focus();
			GRIT.msg.alert("[프로그램명]은 필수 항목입니다."); return;
		} 
		if ( $(".<%=layerName%> #sCd").val() == "" || $(".<%=layerName%> #sCd").val() == "" ) {
			$(".<%=layerName%> #sCd").focus();
			GRIT.msg.alert("[소분류]는 필수 항목입니다."); return;
		} 
		if ( $(".<%=layerName%> #timeDetail").val() == "" || $(".<%=layerName%> #timeDetail").val() == "" ) {
			$(".<%=layerName%> #timeDetail").focus();
			GRIT.msg.alert("[운영시간]은 필수 항목입니다."); return;
		} 
		if ( $(".<%=layerName%> #trgterDetail").val() == "" || $(".<%=layerName%> #trgterDetail").val() == "" ) {
			$(".<%=layerName%> #trgterDetail").focus();
			GRIT.msg.alert("[대상자]은 필수 항목입니다."); return;
		} 
		if ( $(".<%=layerName%> #operateFg").val() == "" || $(".<%=layerName%> #operateFg").val() == "" ) {
			$(".<%=layerName%> #operateFg").focus();
			GRIT.msg.alert("[운영여부]는 필수 항목입니다."); return;
		} 
		
		// 필수 체크
		var isValid = AUIGrid.validateGridData(<%=layerName%>myGridID2, ["pictureNm"]);
		
		if(!isValid){
			GRIT.msg.alert("[파일]을 선택해주세요.");
			return false;
		}
		
		if(confirm("저장 하시겠습니까?")){
			<%=layerName%>fn_save();
	    } 
	}
	
	//저장
	function <%=layerName%>fn_save(){
		
		// 시설사진 데이터
		var pictureGirdList = AUIGrid.getGridData(<%=layerName%>myGridID2);
		var temp1;
		var temp2;
		// 시설사진중복체크
		for (var i = 0; i < pictureGirdList.length; i++) {
			for (var j = 0; j < i; j++) {
				temp1 = pictureGirdList[i].pictureNm;
				temp2 = pictureGirdList[j].pictureNm;
				
				if(temp1 == temp2){
					GRIT.msg.alert("[선택파일명] 중복된 데이터가 있습니다.");
					return false;
				}
			}
		}
        
		var sendData = $(".<%=layerName%> form[name=pgmMgmtForm]").serializeObject();
		
         GRIT.tran.send({
			url: "/pgm/savePgmMgmt",
			async: false,
			sendData: sendData,
			success: function(result){
				if(result.rtnCode == "0"){
					<%=layerName%>submitFiles();
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
			},
 			loadingTarget: "<%=layerName%>"
 		}); 
	}
	
	//삭제
	function <%=layerName%>deletePgmMgmt(){
		var pgmList = AUIGrid.getGridData(<%=layerName%>myGridID);
		
		if(pgmList.length == 0){
			GRIT.msg.alert("조회 후 삭제 할 수 있습니다.");
			return false;
		}
		
		var linkCd = $(".<%=layerName%> #linkCd").val();
		var programCd = $(".<%=layerName%> #programCd").val();
		var sendData = {"linkCd" : linkCd
						,"programCd" : programCd
						,"jobDetail"  : linkCd +" "+programCd};
		
        GRIT.tran.send({
			url: "/pgm/deleteProgram",
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
	
	// 조회조건 복지시설 코드로 대분류코드 셋팅
	function <%=layerName%>setPgmMgmtLclasCd(val){
		var sendData = {"linkCd"   : val};
		 GRIT.tran.send({
			url: "/pgm/getLclasCd",
			async: false,
			sendData: sendData,
			success: function(result){
				//대분류 코드 셀렉트 박스 초기화
				$('.<%=layerName%> #searchLclasCd option').remove();
				$('.<%=layerName%> #searchLclasCd').append("<option value=''>전체</option>");
				//중분류코드 셀렉트 박스 초기화
				$('.<%=layerName%> #searchMclasCd option').remove();
				$('.<%=layerName%> #searchMclasCd').append("<option value=''>전체</option>");
				//소분류코드 셀렉트 박스 초기화
				$('.<%=layerName%> #searchSclasCd option').remove();
				$('.<%=layerName%> #searchSclasCd').append("<option value=''>전체</option>");
				
				//대분류 코드 셀렉트 박스 초기화
				$('.<%=layerName%> #lCd option').remove();
				$('.<%=layerName%> #lCd').append("<option value='' hidden></option>");
				//중분류코드 셀렉트 박스 초기화
				$('.<%=layerName%> #mCd option').remove();
				$('.<%=layerName%> #mCd').append("<option value='' hidden></option>");
				//소분류코드 셀렉트 박스 초기화
				$('.<%=layerName%> #sCd option').remove();
				$('.<%=layerName%> #sCd').append("<option value='' hidden></option>");
				if(val != ""){
					for(var i=0; i<result.data.length; i++){
						$('.<%=layerName%> #searchLclasCd').append("<option value="+result.data[i].lclasCd+"> "+result.data[i].lclasNm+ "</option>");
						$('.<%=layerName%> #lCd').append("<option value="+result.data[i].lclasCd+"> "+result.data[i].lclasNm+ "</option>");	
					}
				}
			},
 			loadingTarget: "<%=layerName%>"
 		});  
	}
	
	// 조회조건 대분류코드로 중분류코드 셋팅
	function <%=layerName%>setMclasCd(val){
		//중분류 코드 셀렉트 박스 초기화
		$('.<%=layerName%> #searchMclasCd option').remove();
		$('.<%=layerName%> #searchMclasCd').append("<option value=''>전체</option>");
		//소분류코드 셀렉트 박스 초기화
		$('.<%=layerName%> #searchSclasCd option').remove();
		$('.<%=layerName%> #searchSclasCd').append("<option value=''>전체</option>");
		
		var linkCd   = $('.<%=layerName%> #linkCd').val();
		var sendData = {"linkCd"	: linkCd
						,"lclasCd"   : val};
		 GRIT.tran.send({
			url: "/pgm/selectMclaCdList",
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
		
		//소분류 코드 셀렉트 박스 초기화
		$('.<%=layerName%> #searchSclasCd option').remove();
		$('.<%=layerName%> #searchSclasCd').append("<option value=''>전체</option>");
		
		var linkCd   = $('.<%=layerName%> #linkCd').val();
		var sendData = {"mclasCd"   : val
						,"linkCd"   : linkCd};
		 GRIT.tran.send({
			url: "/pgm/selectSclaCdList",
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
	
	// 프로그램정보 대분류코드로 중분류코드 셋팅
	function <%=layerName%>setPgmMgmtMclasCd(val){
		
		//중분류 코드 셀렉트 박스 초기화
		$('.<%=layerName%> #mCd option').remove();
		$('.<%=layerName%> #mCd').append("<option value='' hidden></option>");
		
		//소분류 코드 셀렉트 박스 초기화
		$('.<%=layerName%> #sCd option').remove();
		$('.<%=layerName%> #sCd').append("<option value='' hidden></option>");
		
		var linkCd   = $('.<%=layerName%> #linkCd').val();
		var sendData = {"linkCd"     : linkCd
						,"lclasCd"   : val};
		 GRIT.tran.send({
			url: "/pgm/selectMclaCdList",
			async: false,
			sendData: sendData,
			success: function(result){
				$('.<%=layerName%> #mCd option').remove();
				$('.<%=layerName%> #mCd').append("<option value='' hidden></option>");
				//소분류코드 초기화
				if(val != ""){
					for(var i=0; i<result.data.length; i++){
						$('.<%=layerName%> #mCd').append("<option value="+result.data[i].mclasCd+"> "+result.data[i].mclasNm+ "</option>");	
					}
				}
				
			},
 			loadingTarget: "<%=layerName%>"
 		});  
	}
	
	// 프로그램정보 중분류코드로 소분류코드 셋팅
	function <%=layerName%>setPgmMgmtSclasCd(val){
		
		//소분류 코드 셀렉트 박스 초기화
		$('.<%=layerName%> #sCd option').remove();
		$('.<%=layerName%> #sCd').append("<option value='' hidden></option>");
		
		var linkCd   = $('.<%=layerName%> #linkCd').val();
		var sendData = {"mclasCd"   : val
						,"linkCd"   : linkCd};
		 GRIT.tran.send({
			url: "/pgm/selectSclaCdList",
			async: false,
			sendData: sendData,
			success: function(result){
				$('.<%=layerName%> #sCd option').remove();
				$('.<%=layerName%> #sCd').append("<option value='' hidden></option>");
				if(val != ""){
					for(var i=0; i<result.data.length; i++){
						$('.<%=layerName%> #sCd').append("<option value="+result.data[i].sclasCd+"> "+result.data[i].sclasNm+ "</option>");	
					}
				}
			},
 			loadingTarget: "<%=layerName%>"
 		});  
	}
	
	//프로그램사진 Grid
	function <%=layerName%>setHistoryGrid(primeCell, item){
		
		var linkCd   = $('.<%=layerName%> #linkCd').val();
		var sendData = {"linkCd"    : linkCd
						,programCd : item.programCd};

			// ajax 요청 전 그리드에 로더 표시
			AUIGrid.showAjaxLoader(<%=layerName%>myGridID2);
			
			GRIT.tran.send({
			url: "/pgm/pgmMgmtGrid2",
			sendData: sendData,
			success: function(result){
				// 그리드에 데이터 세팅
				// resData 는 JSON 을 파싱한 Array-Object 입니다.
				AUIGrid.setGridData(<%=layerName%>myGridID2, result.data);
				
				// 로더 제거
				AUIGrid.removeAjaxLoader(<%=layerName%>myGridID2);
				
			},
			error: function(request, status, error){
				GRIT.msg.alert("공통코드를 조회하는데 문제가 발생했습니다.");
				// 로더 제거
				AUIGrid.removeAjaxLoader(<%=layerName%>myGridID2);
			},
			loading : false
		});

	}
	
	 // 프로그램 사진 행추가
	 function <%=layerName%>addPictureRow(){
		<%-- if($(".<%=layerName%> #programCd").val() == "" || $(".<%=layerName%> #programCd").val() == null){
			GRIT.msg.alert("프로그램 코드를  조회 후 프로그램 사진을 추가해주시길 바랍니다.");
			return;
		} --%>
		var item = new Object();
		item.wffcltyCd = $(".<%=layerName%> #linkCd").val();
		item.programCd = $(".<%=layerName%> #programCd").val();
		var count =  AUIGrid.getRowCount(<%=layerName%>myGridID2);
		
		if(count == 4){
			GRIT.msg.alert("[프로그램 사진]은 최대 4개 까지 입력할 수 있습니다."); 
			return;
		}else{
			AUIGrid.addRow(<%=layerName%>myGridID2, item, "last");	
		}
	
	}
	 
	// 시설사진 행삭제
	function <%=layerName%>delPictureRow(){
		
		var programPic = AUIGrid.getGridData(<%=layerName%>myGridID2);
		
		if(programPic.length == 0){
			GRIT.msg.alert("삭제할 프로그램 사진이 없습니다.");
			return false;
			}
		
		// 프로그램 사진이 없을시 
		
		var pgmPicList = AUIGrid.getGridData(<%=layerName%>myGridID2);
		
		if(pgmPicList.length == 0){
			GRIT.msg.alert("프로그램 사진이 존재하지 않습니다.");
			return false;
			
			}
		 
		 var items = AUIGrid.getSelectedItems(<%=layerName%>myGridID2);
		 var id = items[0].item.id;
		 var row = items[0].rowIndex;
		 
		 if(<%=layerName%>recentGridItem != null){
		 	delete <%=layerName%>myFileCaches[id];
		 }
		 AUIGrid.removeRow(<%=layerName%>myGridID2,row);
	 }
	 
	//그리드의 셀 버턴 클릭 처리
	function <%=layerName%>myButtonClick(item){
		
		<%=layerName%>recentGridItem = item; // 그리드의 클릭한 행 아이템 보관
		
		var input = $(".<%=layerName%> #file");
		
		input.trigger('click'); // 파일 브라우저 열기
		
	};
	
	// 파일 저장
	function <%=layerName%>submitFiles(){
		
		<%-- if($(".<%=layerName%> #programCd").val() == "" || $(".<%=layerName%> #programCd").val() == null){
			GRIT.msg.alert("프로그램 코드를  조회 후 프로그램 사진을 저장해주세요.");
			return;
		} --%>
		
		// jQuery Ajax Form 사용
		var formData = new FormData();
		
		 $.each(<%=layerName%>myFileCaches, function(n, v) {
				formData.append("linkCd", $(".<%=layerName%> #linkCd").val());
				formData.append("wffcltyCd", v.wffcltyCd); // 추가 정보들
				formData.append("programCd", v.programCd);
				formData.append("stats", v.stats);
				formData.append("pictureRealNm", v.pictureRealNm);
				formData.append("uploadfiles[]", v.file);
		});
		 
		 formData.append("saveMode", $(".<%=layerName%> #pgmMgmtForm").find("#saveMode").val());
		
		
		var delPictureList = new Array();
		// 삭제한 데이터
		var pictureList = AUIGrid.getRemovedItems(<%=layerName%>myGridID2);
		for (var i = 0; i < pictureList.length; i++) {
			pictureList[i].stats = "D";
			delPictureList.push(pictureList[i]);
		}
		
		if(pictureList.length != 0){
			formData.append("delPictureList" , JSON.stringify(delPictureList));		
		}
		 
		 $.ajax({
				type: "POST",
				url: "/pgm/imgUpload",
				data: formData,
				processData: false,
		        contentType: false,
				success: function(result){
					if(result.rtnCode == "0"){
						// 저장 성공
						<%=layerName%>myFileCaches = {};
					}else{
						// 저장 실패
						alert(result.message);
					}
				},
				loadingTarget: "<%=layerName%>"
			});
	}
	
		// 복지시설 이름 제거
	function <%=layerName%>fn_removeLinkNm(){
			$(".<%=layerName%> #linkCd").val("");
			$(".<%=layerName%> #linkNm").val("");
			AUIGrid.setGridData(<%=layerName%>myGridID, []);
			
			$('.<%=layerName%> #searchLclasCd').empty();
			$('.<%=layerName%> #searchLclasCd').append("<option value=''>전체</option>");
			
			$('.<%=layerName%> #searchMclasCd').empty();
			$('.<%=layerName%> #searchMclasCd').append("<option value=''>전체</option>");
			
			$('.<%=layerName%> #searchSclasCd').empty();
			$('.<%=layerName%> #searchSclasCd').append("<option value=''>전체</option>");
			
			$('.<%=layerName%> #lCd').empty();
			$('.<%=layerName%> #lCd').append("<option value='' hidden></option>");
			
			$('.<%=layerName%> #mCd').empty();
			$('.<%=layerName%> #mCd').append("<option value='' hidden></option>");
			
			$('.<%=layerName%> #sCd').empty();
			$('.<%=layerName%> #sCd').append("<option value='' hidden></option>");
			
			<%=layerName%>fn_newPgmMgmt();
			
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
		$(".<%=layerName%> #linkCd").val(item.wffcltyCd);
		$(".<%=layerName%> #wffcltyCd").val(item.wffcltyCd);
		$(".<%=layerName%> #linkNm").val(item.wffcltyNm);
		<%=layerName%>setPgmMgmtLclasCd(item.wffcltyCd);
		<%-- <%=layerName%>setLclasCd(item.wffcltyCd); --%>
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
					var wffcltyCd = $(".<%=layerName%> #wffcltyCd").val();
					
					<%=layerName%>setPgmMgmtLclasCd(wffcltyCd);
					
					if(result.data.length > 1){
						if($(".<%=layerName%> #wffcltyCd").val() != '' || $(".<%=layerName%> #wffcltyCd").val().length != 4){
	        				<%=layerName%>fn_searchPop();        	
	        			}
					}else if(result.data.length == 1){
						$(".<%=layerName%> #linkCd").val(result.data[0].linkcd);
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
	
	function <%=layerName%>exportTo() {
		
		var excelList = AUIGrid.getGridData(<%=layerName%>myGridID);
		
		
		if(excelList.length == 0){
			GRIT.msg.alert("프로그램 리스트에 조회된 내용이 없습니다.");
			return false;
			}
		
		AUIGrid.exportToXlsx(<%=layerName%>myGridID, {
			fileName : "프로그램_관리",
			// 스타일 상태 유지 여부(기본값:true)
		});
	}
</script>

