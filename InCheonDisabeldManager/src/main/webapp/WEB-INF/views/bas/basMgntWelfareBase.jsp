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
                    <h1>복지시설 기초관리</h1>
					<jsp:include page="../common/commonBtn.jsp">
						<jsp:param value="<%=layerName%>" name="layerName" />
					</jsp:include>                    
                </div>
                <!-- titleWrap : end -->
                
				<!-- conditionTable : start -->
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
								<th>시설분류</th>
								<td class="title">
									<select id="searchWffcltyClas" name="searchWffcltyClas" style="width: 100%; text-align-last : center;" tabindex="1">
													<option value = "">전체</option>
													<c:if test="${!empty fcltyClsfcList}">	
														<c:forEach var="list" items="${fcltyClsfcList}">
															<option value="${list.fcltyClsfcCode}">
																<c:out value="${list.fcltyClsfcNm}" /></option>
														</c:forEach>
													</c:if>
												</select>
								</td>
								<th>시설명</th>
								<td class="title">
									<input type="text" id="searchWffcltyNm" name="searchWffcltyNm" style="width: 100%;  maxlength="8" onkeyup="checkByte(this, 50);" onkeypress="<%=layerName%>fn_pressSys(this.form);">
								</td>
								
								<th>운영주체</th>
								<td class="title">
									<input type="text" id="searchOgnztCd" name="searchOgnztCd" style="width:10%;" title="운영주체" oninput="<%=layerName%>fn_removeSearchOgnztNm();" onkeydown="<%=layerName%>fn_searchOgnztCd2(this.value)" >
					            	<button type="button" class="iconSearchGlassBtn" onclick="<%=layerName%>fn_searchPop2(); return false;">
					            		<img src="/resources/imagesV2/iconSearchGlass.png" class="iconSearchGlass">
					            	</button>
					        		<input type="text" id="searchOgnztNm" name="searchOgnztNm" style="width:50%; margin-left: 0px" title="복지시설명"  disabled>
								</td>
								</tr>
						</tbody>
					</table>
				</form>
				
				<!-- dataTable : start -->
			    <table class="layoutTable">
				    
					<tbody>
					<tr>
						<table class="layoutTable">
						    <tr>
							    <td style="width:550px;" valign="top">
							        <!-- 그리드 영역 -->
							        <h2>시설 리스트</h2>
							        <div id="<%=layerName%>grid_wrap" style="height: 659px;"></div>
							    </td>                               
							    <td style="width:10px;">  </td>                            
							    <td valign="top" style="width:*">
							    <h2>시설 기초정보</h2>
							        <form name="mgntWelForm" id="mgntWelForm" method="post" autocomplete='off'>
				                    <table cellpadding="0" cellspacing="0"  class="dataTable" id="align_common" border="1" >
				                        <input type="hidden" id="saveMode"   name="saveMode" value=""/>
				                        <input type="hidden" id="chkUnq"   name="chkUnq" value=""/>
				                        <input type="hidden" id="userId"     name="userId" value=""/>
				                        <input type="hidden" id="hiddenPwd"  name="hiddenPwd" value=""/>
				                        <input type="hidden" id="ognztPopValue"  name="ognztPopValue" value=""/>
				                        <input type="hidden" id="fcltyClsfcFg"   name="fcltyClsfcFg" value=""/>
				                        <input type="hidden" id="wffcltyTpFg"    name="wffcltyTpFg" value=""/>
				                        <input type="hidden" id="wffcltyTpVal"   name="wffcltyTpVal" value=""/>
				                        <input type="hidden" id="fcltyClsfVal"   name="fcltyClsfVal" value=""/>
				                        
				                        <colgroup>
				                            <col width="20%" />
				                            <col width="80%" />
				                      
				                        </colgroup>                                               
				                        <tr>
				                            <th>시설코드</th>
				                            <td><input type="text" id="fcltyCode" name="fcltyCode" style="width: 100%;" itle="시설코드"  readonly> </td>
				                        </tr>
				                        <tr>
					                        <th><span class="essentialItem">시설분류</span></th>
				                            <td>
				                            	<select id="fcltyClsfc" name="fcltyClsfc" style="width: 100%; text-align-last : center" tabindex="1" onchange="<%=layerName%>selectBoxList();" >
													<option value="" hidden></option>
													<c:if test="${!empty fcltyClsfcList}">	
														<c:forEach var="list" items="${fcltyClsfcList}">
															<option value="${list.fcltyClsfcCode}">
																<c:out value="${list.fcltyClsfcNm}" /></option>
														</c:forEach>
													</c:if>
												</select>
				                            </td>
				                        </tr>
				                        
				                        <tr>
					                        <th><span class="essentialItem">시설유형</span></th>
				                            <td>
				                            	<select id="wffcltyTp" name="wffcltyTp" style="width: 100%; text-align-last : center" tabindex="1">
													<option value="" hidden></option>
													<c:if test="${!empty fcltyClsfcList}">	
														<c:forEach var="list" items="${fcltyClsfcList}">
															<option value="${list.fcltyClsfcCode}">
																<c:out value="${list.fcltyClsfcNm}" /></option>
														</c:forEach>
													</c:if>
												</select>
				                            </td>
				                        </tr>
				                        
				                        <tr>
				                        	<th><span class="essentialItem">시설명</span></th>
				                            <td><input type="text" id="wffcltyNm" name="wffcltyNm" style="width:100%;" title="시설명" tabindex="2" onkeyup="checkByte(this, 50);" onkeydown="<%=layerName%>EnterFilter('uniqueNo');"> </td>
 				                        </tr>
 				                        
				                        <tr>
				                    		<th><span class="essentialItem">고유번호</span></th>
				                            <td>
				                            <input type="text" id="uniqueNo" name="uniqueNo" style="width:85%;" title="고유번호" tabindex="2" onkeyup="<%=layerName%>chkKeyUp(); GRIT.event.removeChar(event);" maxlength="20" onkeydown="<%=layerName%>EnterFilter('ognztCd');checkByte(this, 20);">
				                            <button type="button" class="normalBtn" id ="encChk" tabindex="1" onclick="<%=layerName%>chkData();" style ="width: 85px;">중복확인</button>
				                             </td>
				                    	</tr>
				                    	
				                    	<tr>
				                    		<th><span class="essentialItem">운영주체</span></th>
				                            <td>
				                            	<input type="text" id="ognztCd" name="ognztCd" style="width:7%;" title="운영주체" tabindex="4" oninput="<%=layerName%>fn_removeOgnztNm()" onkeydown="<%=layerName%>fn_searchOgnztCd(this.value)" >
				                            	<span class="btn_left">
					            					<button type="button" class="iconSearchGlassBtn" onclick="<%=layerName%>fn_searchPop1(); return false;" >
					            						<img src="/resources/imagesV2/iconSearchGlass.png" class="iconSearchGlass">
					            					</button>
					        					</span>
					        					<input type="text" id="ognztNm" name="ognztNm" style="width:78%; margin-left: 0px" title="운영주체명"  disabled> 
				                            </td>
				                    	
				                    	</tr>
				                    	
				                    	<tr>
				                        	<th>본부 복지시설</th>
				                            <td>
				                            	<input type="text" id="wffcltyCd" name="wffcltyCd" style="width:7%;" title="복지시설" tabindex="4" oninput="<%=layerName%>fn_removeLinkNm()" onkeydown="<%=layerName%>fn_searchLinkCd(this.value)" >
				                            	<span class="btn_left">
					            				<button type="button" class="iconSearchGlassBtn" onclick="<%=layerName%>fn_searchPop(); return false;">
					        						<img src="/resources/imagesV2/iconSearchGlass.png" class="iconSearchGlass">
					        					</button>
					        					</span>
					        					<input type="text" id="highWffcltyNm" name="highWffcltyNm" style="width:78%;" title="복지시설명"  disabled> 
				                            </td>
 				                        </tr>
 				                        
 				                         <tr>
					                        <th><span class="essentialItem">운영여부</span></th>
				                            <td>
				                            	<select id="operateFg" name="operateFg" style="width:100%; text-align-last : center;" title="시설운영" mandatory=true tabindex="1">
													<c:if test="${!empty facOpList}">
														<c:forEach var="list" items="${facOpList}">
														<option value="${list.facCode}"><c:out value="${list.facNm}"/></option>
														</c:forEach>
													</c:if>
												</select>
				                            </td>
				                        </tr>
				                        
				                         <tr>
					                        <th><span class="essentialItem">사용여부</span></th>
				                            <td>
				                            	<select id="useFg" name="useFg" style="width:100%; text-align-last : center;" title="사용여부" mandatory=true tabindex="1">
													<c:if test="${!empty useFgList}">
														<c:forEach var="list" items="${useFgList}">
														<option value="${list.useFg}"><c:out value="${list.useFgNm}"/></option>
														</c:forEach>
													</c:if>
												</select>
				                            </td>
				                        </tr>
				                    </table>
							    </td>
						    </tr> 
						</table>
				    </tr>
				</tbody>
				</table>
				<!-- dataTable : end -->

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
		text-align: left;
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
			GRIT.msg.alert("고유번호를 중복확인 후 저장하시길 바랍니다.");
			return;
		}
		if(<%=layerName%>chkUnq == 0){
			GRIT.msg.alert("고유번호를 중복확인 후 저장하시길 바랍니다.");
			return;
		}
		if(<%=layerName%>chkUnq == 1){
		<%=layerName%>fn_saveMgntWelfareBase();
		}
	});
	
	// 삭제
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .delete').click(function(){
		<%=layerName%>deleteWffclty();
	});
	
	// 닫기
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .close').click(function(){
		mFnc.tabMenuClose('<%=layerName%>');
	});
	
	
	// AUIGrid 생성 후 반환 ID
	var <%=layerName%>myGridID;
	// 셀렉트박스 ajax 시설유형 담아주기
	var <%=layerName%>wffcltyTp;
	
	// AUIGrid 칼럼 설정
	var <%=layerName%>columnLayout  = [ 
        {dataField : "wffcltyCd" ,headerText : "시설코드"   ,width : "20%", style : "test"}
       ,{dataField : "wffcltyNm" ,headerText : "시설명"       ,width : "80%", style : "my-column-left"}
       ];
	
	$(function () {	
		// AUIGrid 그리드를 생성합니다.
		<%=layerName%>createAUIGrid(<%=layerName%>columnLayout);
		$(".<%=layerName%> #operateFg").val("1");
		$(".<%=layerName%> #useFg").val("1");
		// 데이터 요청, 요청 성공 시 AUIGrid 에 데이터 삽입합니다.
		$(".<%=layerName%> #mgntWelForm").find("#saveMode").val("I");
		
		$(".<%=layerName%> #sehUserNm").focus();
		<%=layerName%>selectBoxList ();
		$('.<%=layerName%> #wffcltyNm').focus();	
		
		
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
				softRemoveRowMode : true,
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
		
		$(".<%=layerName%> #fcltyCode").val(item.wffcltyCd);
		//<%=layerName%>fn_detailCount();
		$(".<%=layerName%> #wffcltyNm").val(item.wffcltyNm);
		$(".<%=layerName%> #fcltyClsfc").val(item.fcltyClsfc);
		<%=layerName%>selectBoxList ();
		<%=layerName%>wffcltyTp = item.wffcltyTp
		$(".<%=layerName%> #wffcltyTp").val(item.wffcltyTp);
		$(".<%=layerName%> #uniqueNo").val(item.uniqueNo);
		$(".<%=layerName%> #operateFg").val(item.operateFg);
		$(".<%=layerName%> #wffcltyCd").val(item.linkCd);
		$(".<%=layerName%> #highWffcltyNm").val(item.linkNm);
		$(".<%=layerName%> #useFg").val(item.useFg);
		$(".<%=layerName%> #ognztCd").val(item.ognztCd);
		$(".<%=layerName%> #ognztNm").val(item.ognztNm);
		$(".<%=layerName%> #chkUnq").val("1");
		
		
		// 시설분류/시설유형 변경시 값
		$(".<%=layerName%> #fcltyClsfVal").val(item.fcltyClsfc);
		$(".<%=layerName%> #wffcltyTpVal").val(item.wffcltyTp);
		
		
		// 상태값
		$(".<%=layerName%> #mgntWelForm").find("#saveMode").val("U");
	}
	

	
	//엔터키 조회시
	function <%=layerName%>fn_pressSys(e){ 
    	if(event.keyCode == 13){ //javascript에서는 13이 enter키를 의미함 
    		<%=layerName%>loadData ();
		}
	}
	
	//조회
	function <%=layerName%>loadData () {
		
		var searchWffcltyClas      = 	$(".<%=layerName%> #searchWffcltyClas").val();
		var searchWffcltyNm 	   = 	$(".<%=layerName%> #searchWffcltyNm").val();
		var searchOgnztCd          = 	$(".<%=layerName%> #searchOgnztCd").val();
		
		var sendData = {"searchWffcltyClas" : searchWffcltyClas
						,"searchWffcltyNm" : searchWffcltyNm
						,"searchOgnztCd" : searchOgnztCd};
		
		
		// ajax 요청 전 그리드에 로더 표시
		AUIGrid.showAjaxLoader(<%=layerName%>myGridID);
		
		GRIT.tran.send({
			url: "/bas/basMgntWelfareBaseGrid1",
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
	
	//저장
	function <%=layerName%>fn_save(){
        
		var sendData = $(".<%=layerName%> form[name=mgntWelForm]").serializeObject();
		
         GRIT.tran.send({
			url: "/bas/saveMgntWelfareBase",
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
				<%=layerName%>fn_newSys();
			},
 			loadingTarget: "<%=layerName%>"
 		}); 
	}
	
	// 신규
	function <%=layerName%>fn_newAll() {
		if ( confirm ("신규로 입력 하시겠습니까?") ) {
			<%=layerName%>fn_newSys();
			$(".<%=layerName%> #fcltyClsfc").focus();
		}
	}
	
	//초기화
	function <%=layerName%>fn_newSys() {
		$(".<%=layerName%> #fcltyCode").val("");
		$(".<%=layerName%> #fcltyClsfc").val("");
		<%=layerName%>selectBoxList();
		$(".<%=layerName%> #wffcltyTp").val("");
		$(".<%=layerName%> #fcltyClsfc").attr('disabled', false);
		$(".<%=layerName%> #wffcltyTp").attr('disabled', false);
		$(".<%=layerName%> #wffcltyNm").val("");
		$(".<%=layerName%> #uniqueNo").val("");
		$(".<%=layerName%> #ognztCd").val("");
		$(".<%=layerName%> #ognztNm").val("");
		$(".<%=layerName%> #wffcltyCd").val("");
		$(".<%=layerName%> #highWffcltyNm").val("");
		$(".<%=layerName%> #operateFg").val("1");
		$(".<%=layerName%> #useFg").val("1");
		
		// 상태값
		$(".<%=layerName%> #mgntWelForm").find("#saveMode").val("I");
		$(".<%=layerName%> #fcltyClsfVal").val("");
		$(".<%=layerName%> #wffcltyTpVal").val("");
		$('.<%=layerName%> #wffcltyNm').focus();
		
		<%=layerName%>wffcltyTp = "";
	}
	
	//저장 체크
	function <%=layerName%>fn_saveMgntWelfareBase() {
		
		if ( $(".<%=layerName%> #fcltyClsfc").val() == "" ) {	
			$(".<%=layerName%> #fcltyClsfc").focus();
			GRIT.msg.alert("[시설분류]는 필수 항목입니다."); return;
		}
		
		if ( $(".<%=layerName%> #wffcltyTp").val() == "" ) {
			$(".<%=layerName%> #wffcltyTp").focus();
			GRIT.msg.alert("[시설유형]은 필수 항목입니다."); return;
		}
		
		if ( $(".<%=layerName%> #wffcltyNm").val() == "" ) {
			$(".<%=layerName%> #wffcltyNm").focus();
			GRIT.msg.alert("[시설명]은 필수 항목입니다."); return;
		}
		
		if ( $(".<%=layerName%> #uniqueNo").val() == "" ) {
			$(".<%=layerName%> #uniqueNo").focus();
			GRIT.msg.alert("[고유번호]는 필수 항목입니다."); return;
		}
		
		if ( $(".<%=layerName%> #ognztCd").val() == "" || $(".<%=layerName%> #ognztNm").val() == "" ) {
			$(".<%=layerName%> #ognztCd").focus();
			GRIT.msg.alert("[운영주체]는 필수 항목입니다."); return;
		}
		
		if ( $(".<%=layerName%> #wffcltyCd").val() != "" && $(".<%=layerName%> #wffcltyCd").val() != null ) {
			
			if( $(".<%=layerName%> #highWffcltyNm").val() == ""|| $(".<%=layerName%> #highWffcltyNm").val() == null ){
			$(".<%=layerName%> #wffcltyCd").focus();
			GRIT.msg.alert("[본부 복지시설]을 조회 후 다시 입력해주세요."); return;
			}
		}
		
		if ( $(".<%=layerName%> #operateFg").val() == "" ) {
			$(".<%=layerName%> #operateFg").focus();
			GRIT.msg.alert("[운영여부]는 필수 항목입니다."); return;
		}
		
		if ( $(".<%=layerName%> #useFg").val() == "" ) {
			$(".<%=layerName%> #useFg").focus();
			GRIT.msg.alert("[사용여부]는 필수 항목입니다."); return;
		}
		
		
		if($(".<%=layerName%> #saveMode").val() == "U"){
			if($(".<%=layerName%> #wffcltyTp").val() == $(".<%=layerName%> #wffcltyTpVal").val()){
				$(".<%=layerName%> #wffcltyTpFg").val("0");
			}else{
				$(".<%=layerName%> #wffcltyTpFg").val("1");
			}
			
			if($(".<%=layerName%> #fcltyClsfc").val() == $(".<%=layerName%> #fcltyClsfVal").val()){
				$(".<%=layerName%> #fcltyClsfcFg").val("0");
			}else{
				$(".<%=layerName%> #fcltyClsfcFg").val("1");
			}
		}
	
		if($(".<%=layerName%> #fcltyClsfcFg").val() == '1' || $(".<%=layerName%> #wffcltyTpFg").val() == '1'){
			if(confirm("시설분류/시설유형 변경시 복지시설 기타 상세정보가 초기화 됩니다. \n저장 하시겠습니까?")){
				<%=layerName%>fn_save();
		    }	
		}else{
			if(confirm("저장 하시겠습니까?")){
				<%=layerName%>fn_save();
		    }				
		}
		
		 
	}
	
	//고유번호 체크
	function <%=layerName%>chkData() {
		
		if($(".<%=layerName%> #uniqueNo").val() == "" || $(".<%=layerName%> #uniqueNo").val() == null){
			GRIT.msg.alert("중복 확인 전 입력은 필수 항목입니다."); return;
		}
		
		var wffcltyTp      = $(".<%=layerName%> #wffcltyTp").val();
		var uniqueNo 	   = $(".<%=layerName%> #uniqueNo").val();
		var sendData = {"wffcltyTp" : wffcltyTp
						,"uniqueNo" : uniqueNo};
		
		/* if(encPrmisnNo == ""  || encPrmisnNo == null ){
			GRIT.msg.alert ("값 입력 후 중복확인을 해주세요");   
		return;
		} */
		GRIT.tran.send({
			url: "/bas/basUnqChk",
			sendData : sendData,
			success: function(result){
				if(result.data == 0){
					GRIT.msg.alert("사용가능한 번호입니다");
					$(".<%=layerName%> #mgntWelForm").find( "#chkUnq").val("1");
				}
				else{
					$(".<%=layerName%> #mgntWelForm").find( "#chkUnq").val("0");
					GRIT.msg.alert("이미 존재하고 있는번호입니다");
				}
			},
			error: function(request, status, error){
				GRIT.msg.alert("중복검사 문제가 발생했습니다.");
				// 로더 제거
			},
			loading : false
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
	
	//운영주체 팝업
	function <%=layerName%>fn_searchPop1(name){
		$(".<%=layerName%> #mgntWelForm").find("#ognztPopValue").val("");
		var layerName = "<%=layerName%>";
		 var url = "<c:url value='/pop/searchOgnztPop?layerName="+layerName+"'/>";
		 var width="700";
		 var height="610";
		 var name="searchOgnzt";
		 popitup(url, height, width, name);
	}
	
	//검색조건 운영주체 팝업
	function <%=layerName%>fn_searchPop2(name){
		$(".<%=layerName%> #mgntWelForm").find("#ognztPopValue").val("1");
		var layerName = "<%=layerName%>"; 
		 var url = "<c:url value='/pop/searchOgnztPop?layerName="+layerName+"'/>";
		 var width="700";
		 var height="610";
		 var name="searchOgnzt";
		 popitup(url, height, width, name);
	}
	
	//복지시설 callback
	function <%=layerName%>setSearchWffcltyPop(item,  name){
		$(".<%=layerName%> #wffcltyCd").val(item.wffcltyCd);
		$(".<%=layerName%> #highWffcltyNm").val(item.wffcltyNm);			
	}
	
	//운영주체 callback
	function <%=layerName%>setSearchOgmztPop(item,  name){
		$(".<%=layerName%> #ognztCd").val(item.ognztCd);
		$(".<%=layerName%> #ognztNm").val(item.ognztNm);
	}
	
	//검색 운영주체 callback
	function <%=layerName%>setSearchOgmztPop2(item,  name){
		$(".<%=layerName%> #searchOgnztCd").val(item.ognztCd);
		$(".<%=layerName%> #searchOgnztNm").val(item.ognztNm); 
	}
	
	
	// select 박스 ajax 조회
	function <%=layerName%>selectBoxList() {
		var fcltyClsfc      = $(".<%=layerName%> #fcltyClsfc").val();
		var sendData = {"fcltyClsfc" : fcltyClsfc};
		
		GRIT.tran.send({
			url: "/bas/basTypeFacility",
			sendData : sendData,
			success: function(result){
				$('.<%=layerName%> #wffcltyTp option').remove();
				
				$('.<%=layerName%> #wffcltyTp').append("<option value='' hidden></option>");
				for(var i=0; i<result.data.length; i++){
					$('.<%=layerName%> #wffcltyTp').append("<option value="+result.data[i].typeFacilityCode+"> "+result.data[i].typeFacilityNm+ "</option>");
						if(<%=layerName%>wffcltyTp == result.data[i].typeFacilityCode){
							$('.<%=layerName%> #wffcltyTp').val(<%=layerName%>wffcltyTp).prop('selected', true);
						}
				}
			},
			
			error: function(request, status, error){;
				GRIT.msg.alert("사용자 조회하는데 문제가 발생했습니다.");
			},
			loading : false
		});
	}
	
	//복지시설
	function <%=layerName%>fn_searchLinkCd(value){

		   if(event.keyCode != 13 && event.keyCode != 9){
		   	   return false;
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
						$(".<%=layerName%> #highWffcltyNm").val(result.data[0].linknm);
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
	
	//운영주체
	function <%=layerName%>fn_searchOgnztCd(value){
		
		   if(event.keyCode != 13 && event.keyCode != 9){
		   	   return false;
		   }
		   
			var ognztCd      = 	$(".<%=layerName%> #ognztCd").val();
			var sendData ={"ognztCd"      : ognztCd};

	        GRIT.tran.send({
				url: "/bas/ognztCdList",
				async: false,
				sendData: sendData,
				success: function(result){
					if(result.data.length > 1){
						if($(".<%=layerName%> #ognztCd").val() != '' || $(".<%=layerName%> #ognztCd").val().length != 4){
	        				<%=layerName%>fn_searchPop1();        	
	        			}
					}else if(result.data.length == 1){
						$(".<%=layerName%> #ognztCd").val(result.data[0].linkcd);
						$(".<%=layerName%> #ognztNm").val(result.data[0].linknm);
					}else{
						setTimeout(function(){					
							GRIT.msg.alert("해당 운영주체가	존재하지 않습니다");
							},50);
						$(".<%=layerName%> #ognztCd").focus();
						$(".<%=layerName%> #ognztCd").val("");
					}
					
				},
				loadingTarget: "<%=layerName%>"
			}); 
			
		}
	
	//검색 운영주체
	function <%=layerName%>fn_searchOgnztCd2(value){
		   
		   
		
		   if(event.keyCode != 13 && event.keyCode != 9){
		   	   return false;
		   }
		   
		   if($(".<%=layerName%> #searchOgnztCd").val().length == '4' && $(".<%=layerName%> #searchOgnztNm").val() != ""){
			   <%=layerName%>loadData();
			   return;
			   }
		   
			var ognztCd      = 	$(".<%=layerName%> #searchOgnztCd").val();
			var sendData ={"ognztCd"      : ognztCd};

	        GRIT.tran.send({
				url: "/bas/ognztCdList",
				async: false,
				sendData: sendData,
				success: function(result){
					if(result.data.length > 1){
						if($(".<%=layerName%> #searchOgnztCd").val() != ''){
	        				<%=layerName%>fn_searchPop2();        	
	        			}
					}else if(result.data.length == 1){
						$(".<%=layerName%> #searchOgnztCd").val(result.data[0].linkcd);
						$(".<%=layerName%> #searchOgnztNm").val(result.data[0].linknm);
					}else{
						GRIT.msg.alert("조회된 데이터가 없습니다");
						$(".<%=layerName%> #searchOgnztCd").focus();
						$(".<%=layerName%> #searchOgnztNm").val("");
					}
					
				},
				loadingTarget: "<%=layerName%>"
			}); 
	}
	
	//Detail Count
	function <%=layerName%>fn_detailCount(){

	
			var fcltyCode      = 	$(".<%=layerName%> #fcltyCode").val();
			var sendData ={"fcltyCode"      : fcltyCode};

	        GRIT.tran.send({
				url: "/bas/detailCount",
				async: false,
				sendData: sendData,
				success: function(result){
					
					if(result.data == 0){
						$(".<%=layerName%> #fcltyClsfc").attr('disabled', false); 
						$(".<%=layerName%> #wffcltyTp").attr('disabled', false);
					}
					else{
						$(".<%=layerName%> #fcltyClsfc").attr('disabled', true); 
						$(".<%=layerName%> #wffcltyTp").attr('disabled', true);
					}
				},
				loadingTarget: "<%=layerName%>"
			}); 
	}
	
	// 운영주체 이름 제거
	function <%=layerName%>fn_removeOgnztNm(){
			$(".<%=layerName%> #ognztNm").val("");
	}
	
	// 운영주체 이름 제거
	function <%=layerName%>fn_removeSearchOgnztNm(){
			$(".<%=layerName%> #searchOgnztNm").val("");
	}
	
	// 복지시설 이름 제거
	function <%=layerName%>fn_removeLinkNm(){
			$(".<%=layerName%> #highWffcltyNm").val("");
	}
	
	function <%=layerName%>chkKeyUp(){
		$(".<%=layerName%> #chkUnq").val("0");
	}
	
	
	function <%=layerName%>deleteWffclty(){
		var wffcltyList = AUIGrid.getGridData(<%=layerName%>myGridID);
		
		if(wffcltyList.length == 0){
			GRIT.msg.alert("조회 후 삭제 할 수 있습니다.");
			return false;
		}
		
		var items = AUIGrid.getSelectedItems(<%=layerName%>myGridID);
		 // 그리드 선택 row
		 var row = items[0].rowIndex;
		 var wffcltyNm = items[0].item.wffcltyNm;
		 
		 if(!AUIGrid.isRemovedById(<%=layerName%>myGridID,items[0].rowIdValue)){
			 if(confirm("'"+wffcltyNm+"' 을(를) 삭제 하시겠습니까?")){
			 	AUIGrid.removeRow(<%=layerName%>myGridID,row);
			 }else{
				 return false;
			 }
				 
		 }
		 
		// 삭제한 데이터
		var sendData = {"wffcltyCd" : items[0].item.wffcltyCd
						,"jobDetail" : items[0].item.wffcltyCd};

        GRIT.tran.send({
			url: "/bas/deleteWffclty",
			async: false,
			sendData: sendData,
			success: function(result){
				if(result.rtnCode == "0"){
					GRIT.msg.alert(result.message);
					<%=layerName%>loadData();
				}else if(result.rtnCode == "1"){
					GRIT.msg.alert(result.message);
					AUIGrid.restoreSoftRows(<%=layerName%>myGridID,row);
				}else{
					GRIT.msg.alert(result.message);
				}
			},
			loadingTarget: "<%=layerName%>"
		}); 
		 
	}
	
	
</script>

