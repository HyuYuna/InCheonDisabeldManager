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
                    <h1>프로그램 분류 관리</h1>
					<jsp:include page="../common/commonBtn.jsp">
						<jsp:param value="<%=layerName%>" name="layerName" />
					</jsp:include>                    
                </div>
                <!-- titleWrap : end -->
                
				 <!-- conditionTable : start -->
                <form name="<%=layerName%>searchCategorize" onsubmit="return false;" autocomplete='off'>
	                <c:if test="${userGroupCd == 'E'}">
		                <table class="dataTable marginT10">
		                    <colgroup>
		                        <col style="width:3%">
		                        <col style="width:20%">
		                    </colgroup>
		                    <tbody>
		                        <tr>
		                            <th>복지시설</th>
		                            <td>
		                            	<input type="text" id="searchWffcltyCd" name="searchWffcltyCd" style="width:2%;" title="복지시설"  oninput="<%=layerName%>fn_removeLinkNm();" onkeydown="<%=layerName%>fn_searchLinkCd(this.value)">
			           					<button type="button" id="searchButton" class="iconSearchGlassBtn" onclick="<%=layerName%>fn_searchPop(); return false;">
			           						<img src="/resources/imagesV2/iconSearchGlass.png" class="iconSearchGlass">
			           					</button>
			       						<input type="text" id="searchWffcltyNm" name="searchWffcltyNm" style="width:20%; margin-left: 0px" title="복지시설명"  readonly /> 
		                            </td>
		                        </tr>
		                    </tbody>
		                </table>
	                </c:if>
                </form>
                <!-- conditionTable : end -->

                <!-- layout table : start -->
                <table class="layoutTable">
                    <colgroup>
                        <col style="width:450px;">
                        <col style="width:10px;">
                        <col style="width:auto;">
                    </colgroup>
                    <tr>
                        <td>
                            <div class="subtitleGroup">
                                <div class="subtitle">분류 리스트</div>
                                <div class="subBtnGroup">
                                </div>
                            </div>
                             <div id="<%=layerName%>grid_wrap" style="height: 658px;"></div>
                        </td>
                        <td>&nbsp;</td>
                        <td>
                            <div class="subtitleGroup">
                                <div class="subtitle">분류 정보</div>
                                <div class="subBtnGroup">
                                </div>
                            </div>
							<form name="clasForm" id="clasForm" method="post" autocomplete="off">
								<table cellpadding="0" cellspacing="0" class="dataTable" id="align_common" border="1">
								 		<input type="hidden" id="saveMode"    name="saveMode"    value=""/>
				                        <input type="hidden" id="rowIndex"    name="rowIndex"    value=""/>
				                        <input type="hidden" id="wffcltyCd"   name="wffcltyCd"   value="${wffcltyCd}"/>
				                        <input type="hidden" id="userGroupCd" name="userGroupCd" value="${userGroupCd}"/>
				                        <input type="hidden" id="clasFg"      name="clasFg"      value=""/>
				                        <input type="hidden" id="wffcltyPopValue"      name="wffcltyPopValue"      value="1"/>
				                        
									<colgroup>
										<col width="140px" />
										<col width="auto" />
									</colgroup>
									<tr>
			                            <th><span class="essentialItem">구분</span></th>
			                            <td>
			                            	 <input type="radio" id="checkLclasCd" name="checkClasCd" value="1" onchange="<%=layerName%>setClasCd(this.value)" checked /> 대분류
											 <input type="radio" id="checkMclasCd" name="checkClasCd" value="2" onchange="<%=layerName%>setClasCd(this.value)"/> 중분류
											 <input type="radio" id="checkSclasCd" name="checkClasCd" value="3" onchange="<%=layerName%>setClasCd(this.value)"/> 소분류
			                            </td>
				                        </tr>
				                        <tr class="hidden_clas">
					                        <th><span class="essentialItem">상위분류</th>
				                            <td>
				                            	<select id="lclasCd" name="lclasCd" style="width: 40%; text-align-last : center" tabindex="1" onchange="<%=layerName%>setMclasCd(this.value)">
													<c:if test="${!empty wffcltyPgmLclasList}">	
														<c:forEach var="list" items="${wffcltyPgmLclasList}">
															<option value="${list.lclasCd}">
																<c:out value="${list.lclasNm}" /></option>
														</c:forEach>
													</c:if>
												</select>
												
												<select id="mclasCd" name="mclasCd" style="width: 40%; text-align-last : center" tabindex="1" class="hidden_mclas">
													<c:if test="${!empty wffcltyPgmMclasList}">	
														<c:forEach var="list" items="${wffcltyPgmMclasList}">
															<option value="${list.mclasCd}">
																<c:out value="${list.mclasNm}" /></option>
														</c:forEach>
													</c:if>
												</select>
												
				                            </td>
				                        </tr>
				                        <tr>
				                        	<th><span class="essentialItem">분류코드</span></th>
				                            <td>
				                            	<input type="text" id="clasCd" name="clasCd" style="width:40%;" title="분류코드"  tabindex="1" readonly> 
				                            </td>
 				                        </tr>
 				                         <tr>
				                        	<th><span class="essentialItem">분류명</span></th>
				                            <td>
				                            	<input type="text" id="clasNm" name="clasNm" style="width:40%;" title="분류명"  tabindex="1" onkeydown="checkByte(this, 50)" > 
				                            </td>
 				                        </tr>
				                        <tr>
				                    		<th><span class="essentialItem">사용여부</span></th>
				                            <td>
				                            	<select id="useFg" name="useFg" style="width: 40%; text-align-last : center" tabindex="1" >
													<c:if test="${!empty useList}">	
														<c:forEach var="list" items="${useList}">
															<option value="${list.useFg}">
																<c:out value="${list.useFgNm}" /></option>
														</c:forEach>
													</c:if>
												</select>
				                            </td>
				                    	</tr>
				                    
				                    	<tr>
				                    		<th>설명</th>
				                            <td>
				                            	<input type="text" id="clasDetail" name="clasDetail" style="width:40%;" title="설명"  tabindex="1" onkeydown="checkByte(this, 50)" >
				                            </td>
				                    	</tr>
				                    	<tr>
				                    		<th>등록일시</th>
				                            <td>
				                            	<input type="text" id="registDt" name="registDt" style="width:40%;" title="설명"  tabindex="1" disabled >
				                            </td>
				                    	</tr>
				                    	
				                    	<tr>
				                    		<th>등록자</th>
				                            <td>
												<input type="text" id="registerer" name="registerer" style="width:40%;" title="설명"  tabindex="1" disabled >				                            	
				                            </td>
				                    	</tr>
				                    	
				                    	<tr>
				                    		<th>수정일시</th>
				                            <td>
				                            	<input type="text" id="updateDt" name="updateDt" style="width:40%;" title="설명"  tabindex="1" disabled>
				                            </td>
				                    	</tr>
				                    	<tr>
				                    		<th>수정자</th>
				                            <td>
				                            	<input type="text" id="updater" name="updater" style="width:40%;" title="수정자"  tabindex="1" disabled >
				                            </td>
				                    	</tr>
								</table>
						    </form>                            
                        </td>
                    </tr>
                </table>
                <!-- layout table : end -->


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
		<%=layerName%>fn_saveSysInfo();
	});
	
	// 삭제
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .delete').click(function(){
		<%=layerName%>deleteClas();
	});
	
	
	// 닫기
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .close').click(function(){
		mFnc.tabMenuClose('<%=layerName%>');
	});
	
	
	// AUIGrid 생성 후 반환 ID
	var <%=layerName%>myGridID;
	
 	// AUIGrid 칼럼 설정
	 var <%=layerName%>columnLayout  = [ 
	    {dataField : "clas"         ,headerText : "분류"      ,width  : "100%", style : "my-column-left"}
       ]; 

	 
	 
	
	$(function () {
		// AUIGrid 그리드를 생성합니다.
		<%=layerName%>createAUIGrid(<%=layerName%>columnLayout);
		// 분류정보 초기 셋팅
		<%=layerName%>setClas();
				
	});
	
	
	// AUIGrid 를 생성합니다.
	function <%=layerName%>createAUIGrid(columnLayout) {
		
		var <%=layerName%>auiGridProps = {
				displayTreeOpen : true,
				// 일반 데이터를 트리로 표현할지 여부(treeIdField, treeIdRefField 설정 필수)
				flat2tree : true,
				// 행의 고유 필드명
				rowIdField : "clasCd",
				// 트리의 고유 필드명
				treeIdField : "clasCd",
				// 계층 구조에서 내 부모 행의 treeIdField 참고 필드명
				treeIdRefField : "parent",
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
	}
	
	// 분류정보 초기 셋팅
	function <%=layerName%>setClas(){
		$('.hidden_clas').hide();
		$(".<%=layerName%> #clasFg").val("L");
		$(".<%=layerName%> #clasForm").find("#lclasCd").removeAttr("disabled");
		$(".<%=layerName%> #clasForm").find("#mclasCd").removeAttr("disabled");
		
		$(".<%=layerName%> #clasForm").find("#saveMode").val("I");
	}
	
	// 셀 셀렉션 변경 시 아이템의 정보를 Form 필드에 세팅함
	function <%=layerName%>setFieldToFormWindow(primeCell, item) {
		
		$(".<%=layerName%> #clasCd").val(item.clasCd);
		$(".<%=layerName%> #clasNm").val(item.clasNm);
		$(".<%=layerName%> #lclasCd").val(item.lclasCd);
		$(".<%=layerName%> #mclasCd").val(item.mclasCd);
		$(".<%=layerName%> #useFg").val(item.useFg);
		$(".<%=layerName%> #clasDetail").val(item.clasDetail);
		$(".<%=layerName%> #registDt").val(item.registDt);
		$(".<%=layerName%> #registerer").val(item.registerer);
		$(".<%=layerName%> #updateDt").val(item.updateDt);
		$(".<%=layerName%> #updater").val(item.updater);
		$(".<%=layerName%> #clasFg").val(item.clasFg);
	
		var clasFg = item.clasFg;
		
		if(clasFg == "L"){
			$(".<%=layerName%> #checkLclasCd").prop('checked', true);
			$('.hidden_clas').hide();
			$(".<%=layerName%> #clasForm").find("#lclasCd").attr("disabled","true");
			$(".<%=layerName%> #clasForm").find("#mclasCd").attr("disabled","true");
		}else if(clasFg == "M"){
			$(".<%=layerName%> #checkMclasCd").prop('checked', true);
			$('.hidden_clas').show();
			$('.hidden_mclas').hide();
			$(".<%=layerName%> #clasForm").find("#lclasCd").attr("disabled","true");
			$(".<%=layerName%> #clasForm").find("#mclasCd").attr("disabled","true");
		}else if(clasFg == "S"){
			$(".<%=layerName%> #checkSclasCd").prop('checked', true);
			$('.hidden_clas').show();
			$('.hidden_mclas').show();
			$(".<%=layerName%> #clasForm").find("#lclasCd").attr("disabled","true");
			$(".<%=layerName%> #clasForm").find("#mclasCd").attr("disabled","true");
		}
		
		$(".<%=layerName%> #clasForm").find("#checkLclasCd").attr("disabled","true");
		$(".<%=layerName%> #clasForm").find("#checkMclasCd").attr("disabled","true");
		$(".<%=layerName%> #clasForm").find("#checkSclasCd").attr("disabled","true"); 

		
		// 상태값
		$(".<%=layerName%> #clasForm").find("#saveMode").val("U");
	}
	

	
	//엔터키 조회시
	function <%=layerName%>fn_pressSys(e){ 
    	if(event.keyCode == 13){ //javascript에서는 13이 enter키를 의미함 
    		<%=layerName%>loadData ();
		}
	}
	
	//조회
	function <%=layerName%>loadData () {			
		<%=layerName%>fn_newClas();
		
		var userGroupCd = $(".<%=layerName%> #userGroupCd").val();
		var sendData;
		
		if(userGroupCd == "C"){
			sendData = {"wffcltyCd" : $(".<%=layerName%> #wffcltyCd").val()};	
		}else if(userGroupCd == "E"){
			sendData = {"wffcltyCd" : <%=layerName%>searchCategorize.searchWffcltyCd.value};
			
			if(<%=layerName%>searchCategorize.searchWffcltyCd.value == "" || <%=layerName%>searchCategorize.searchWffcltyNm.value ==""){
				GRIT.msg.alert("[조회조건] 복지시설을 입력하세요.");
				return;
			}
		}
		
		
		
		// ajax 요청 전 그리드에 로더 표시
		AUIGrid.showAjaxLoader(<%=layerName%>myGridID);
		
		GRIT.tran.send({
			url: "/pgm/selectClasList",
			sendData: sendData,
			success: function(result){
				// 그리드에 데이터 세팅
				// resData 는 JSON 을 파싱한 Array-Object 입니다.
				<%=layerName%>setClasList(result.data);			
				
				//대분류 중분류 추가시 
				$('#lclasCd option').remove();
				$('#mclasCd option').remove();
				$('#lclasCd').append("<option value='' hidden></option>");
				$('#mclasCd').append("<option value='' hidden></option>");
				for(var i=0; i<result.wffcltyPgmLclasList.length; i++){
					$('#lclasCd').append("<option value="+result.wffcltyPgmLclasList[i].lclasCd+"> "+result.wffcltyPgmLclasList[i].lclasNm+ "</option>");	
				}
				
				for(var i=0; i<result.wffcltyPgmMclasList.length; i++){
					$('#mclasCd').append("<option value="+result.wffcltyPgmMclasList[i].mclasCd+"> "+result.wffcltyPgmMclasList[i].mclasNm+ "</option>");	
				}
				
				// 로더 제거
				AUIGrid.removeAjaxLoader(<%=layerName%>myGridID);
	 			
			},
			error: function(request, status, error){
				GRIT.msg.alert("분류리스트 조회하는데 문제가 발생했습니다.");
				// 로더 제거
				AUIGrid.removeAjaxLoader(<%=layerName%>myGridID);
			},
			loading : false
		});
	}
	
		// 트리 구조 셋팅 후 그리드에 추가
	 	function <%=layerName%>setClasList(data){

		 for (var i = 0; i < data.length; i++) {
			
			if(data[i].lv == "2"){
				data[i].parent = data[i].lclasCd;
			}else if(data[i].lv == "3"){
				data[i].parent = data[i].mclasCd;
			}
		} 
		 
		AUIGrid.setGridData(<%=layerName%>myGridID, data);
		
	} 
	

	// 대분류 중분류 소분류 클릭시 상위분류 hidden
	function <%=layerName%>setClasCd(val){
		
		if(val == 1){
			$('.hidden_clas').hide();
			$(".<%=layerName%> #clasFg").val("L");
		}else if(val == 2){
			$('.hidden_clas').show();
			$('.hidden_mclas').hide();
			$(".<%=layerName%> #clasFg").val("M");
		}else if(val == 3){
			$('.hidden_clas').show();
			$('.hidden_mclas').show();
			$(".<%=layerName%> #clasFg").val("S");
			
			if($(".<%=layerName%> #lclasCd").val() != null){
				<%=layerName%>setMclasCd($(".<%=layerName%> #lclasCd").val());
			}
		}
	}
	
	// 대분류코드로 중분류코드 셋팅
	function <%=layerName%>setMclasCd(val){
		var sendData = {"lclasCd"   : val
				       ,"wffcltyCd" : $(".<%=layerName%> #wffcltyCd").val()};
		 GRIT.tran.send({
			url: "/pgm/searchMclaCdList",
			async: false,
			sendData: sendData,
			success: function(result){
				$('#mclasCd option').remove();
				
				$('#mclasCd').append("<option value='' hidden></option>");
				for(var i=0; i<result.data.length; i++){
					$('#mclasCd').append("<option value="+result.data[i].mclasCd+"> "+result.data[i].mclasNm+ "</option>");	
				}
			},
 			loadingTarget: "<%=layerName%>"
 		});  
	}
	
	
	// 신규
	function <%=layerName%>fn_newAll() {
		
		if($(".<%=layerName%> #searchWffcltyCd").val() == "" || $(".<%=layerName%> #searchWffcltyNm").val() == ""){
			GRIT.msg.alert("복지시설을 조회 후 신규 입력을 할 수 있습니다.")
			return;
		}
		
		if ( confirm ("신규로 입력 하시겠습니까?") ) {
			<%=layerName%>fn_newClas();
		}
	}
	
	//초기화
	function <%=layerName%>fn_newClas() {
		
		$(".<%=layerName%> #clasCd").val("");
		$(".<%=layerName%> #clasNm").val("");
		$(".<%=layerName%> #useFg").val("1");
		$(".<%=layerName%> #clasDetail").val("");
		$(".<%=layerName%> #registDt").val("");
		$(".<%=layerName%> #registerer").val("");
		$(".<%=layerName%> #updateDt").val("");
		$(".<%=layerName%> #updater").val("");
		$(".<%=layerName%> #clasFg").val("L");
		
		
		$(".<%=layerName%> #checkLclasCd").prop('checked', true);
		$('.hidden_clas').hide();
		
		$(".<%=layerName%> #clasForm").find("#lclasCd").removeAttr("disabled");
		$(".<%=layerName%> #clasForm").find("#mclasCd").removeAttr("disabled");
		
		$(".<%=layerName%> #clasForm").find("#checkLclasCd").removeAttr("disabled");
		$(".<%=layerName%> #clasForm").find("#checkMclasCd").removeAttr("disabled");
		$(".<%=layerName%> #clasForm").find("#checkSclasCd").removeAttr("disabled");
		
		// 상태값
		$(".<%=layerName%> #clasForm").find("#saveMode").val("I");
	}
	
	//저장 체크
	function <%=layerName%>fn_saveSysInfo() {
		
		var userGroupCd = $(".<%=layerName%> #userGroupCd").val();
		
		if(userGroupCd == "E"){
			var wffcltyCd = <%=layerName%>searchCategorize.searchWffcltyCd.value;
			var wffcltyNm = <%=layerName%>searchCategorize.searchWffcltyNm.value;
			if((wffcltyCd == "" || wffcltyCd == null) || (wffcltyNm == "" || wffcltyNm == null)){
				GRIT.msg.alert("[조회조건] 복지시설을 선택 해야합니다.");
				return
			}
			
		}
		
		var checkClasCd = $('.<%=layerName%> input[name=checkClasCd]:checked').val();

		if(checkClasCd == "2"){
			if ( $(".<%=layerName%> #lclasCd").val() == "" || $(".<%=layerName%> #lclasCd").val() == null ) {
				$(".<%=layerName%> #lclasCd").focus();
				GRIT.msg.alert("[상위분류 대분류코드]는 필수 항목입니다."); 
				return;
			}
		}
		
		if(checkClasCd == "3"){
			if ( $(".<%=layerName%> #lclasCd").val() == "" || $(".<%=layerName%> #lclasCd").val() == null ) {
				$(".<%=layerName%> #lclasCd").focus();
				GRIT.msg.alert("[상위분류 대분류코드]는 필수 항목입니다."); 
				return;
			}
			
			if ( $(".<%=layerName%> #mclasCd").val() == "" || $(".<%=layerName%> #mclasCd").val() == null ) {
				$(".<%=layerName%> #mclasCd").focus();
				GRIT.msg.alert("[상위분류 중분류코드]은 필수 항목입니다."); 
				return;
			}
		}
		
		
		if ( $(".<%=layerName%> #clasNm").val() == "" ) {
			$(".<%=layerName%> #clasNm").focus();
			GRIT.msg.alert("[분류명]은 필수 항목입니다."); 
			return;
		}
		
		
		if(confirm("저장 하시겠습니까?")){
			<%=layerName%>fn_save();
	    } 
	}
	
	//저장
	function <%=layerName%>fn_save(){
        
		var sendData = $(".<%=layerName%> form[name=clasForm]").serializeObject();
		
         GRIT.tran.send({
			url: "/pgm/saveClas",
			async: false,
			sendData: sendData,
			success: function(result){
				if(result.rtnCode == "0"){
					GRIT.msg.alert(result.message);
					
					<%=layerName%>loadData ();
				}else{
					GRIT.msg.alert(result.message);
				}
			},
 			loadingTarget: "<%=layerName%>"
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
	
	//복지시설 callback
	function <%=layerName%>setSearchWffcltyPop(item,  name){
		$(".<%=layerName%> #searchWffcltyCd").val(item.wffcltyCd);
		$(".<%=layerName%> #searchWffcltyNm").val(item.wffcltyNm);	
		$(".<%=layerName%> #wffcltyCd").val(item.wffcltyCd);
		
		<%=layerName%>setLclaCdList(item.wffcltyCd);
	}
	
	// 복지시설 이름 제거
	function <%=layerName%>fn_removeLinkNm(){
			$(".<%=layerName%> #searchWffcltyNm").val("");
			$("#clasForm")[0].reset();
			AUIGrid.setGridData(<%=layerName%>myGridID, []);
			
	}
	
	
	//복지시설
	function <%=layerName%>fn_searchLinkCd(value){

	   if(event.keyCode != 13 && event.keyCode != 9){
	   	   return false;
	   } 	
	   
	   if($(".<%=layerName%> #searchWffcltyCd").val().length == '4' && $(".<%=layerName%> #searchWffcltyNm").val() != ""){
		   <%=layerName%>loadData();
		   return;
	   }

		var sendData ={"wffcltyCd"      : value};
	   
        GRIT.tran.send({
			url: "/pgm/getWffcltyCd",
			async: false,
			sendData: sendData,
			success: function(result){
				if(result.data.length > 1){
					if($(".<%=layerName%> #searchWffcltyCd").val() != '' || $(".<%=layerName%> #searchWffcltyCd").val().length != 4){
        				<%=layerName%>fn_searchPop();        	
        			}
				}else if(result.data.length == 1){
					$(".<%=layerName%> #searchWffcltyCd").val(result.data[0].wffcltyCd);
					$(".<%=layerName%> #searchWffcltyNm").val(result.data[0].wffcltyNm);
					$(".<%=layerName%> #wffcltyCd").val(result.data[0].wffcltyCd);
					<%=layerName%>setLclaCdList(result.data[0].wffcltyCd);
					
				}else{
					setTimeout(function(){					
					GRIT.msg.alert("조회된 데이터가 없습니다");
					$(".<%=layerName%> #searchWffcltyCd").val("");
					},50);
				}
				
			},
			loadingTarget: "<%=layerName%>"
		});
	}
	
	function <%=layerName%>setLclaCdList(val){
		var sendData ={"wffcltyCd"      : val};
		
		GRIT.tran.send({
			url: "/pgm/selectLclasCd",
			async: false,
			sendData: sendData,
			success: function(result){
				$('#lclasCd option').remove();
				$('#mclasCd option').remove();
				
				$('.<%=layerName%> #lclasCd').append("<option value='' hidden></option>");
				$('.<%=layerName%> #mclasCd').append("<option value='' hidden></option>");
				for(var i=0; i<result.data.length; i++){
					$('#lclasCd').append("<option value="+result.data[i].lclasCd+"> "+result.data[i].lclasNm+ "</option>");	
				}
				
			}
		});
	}
	
	function <%=layerName%>deleteClas(){
		var clasList = AUIGrid.getGridData(<%=layerName%>myGridID);
		
		if(clasList.length == 0){
			GRIT.msg.alert("조회 후 삭제 할 수 있습니다.");
			return false;
		}
		
		var checkClasCd = $('.<%=layerName%> input[name=checkClasCd]:checked').val();
		var items = AUIGrid.getSelectedItems(<%=layerName%>myGridID);
		var row = items[0].rowIndex;
		var clasNm = items[0].item.clasNm;
		
		
		if(!AUIGrid.isRemovedById(<%=layerName%>myGridID,items[0].rowIdValue)){
			 if(confirm("'"+clasNm+"' 을(를) 삭제 하시겠습니까?")){
			 	AUIGrid.removeRow(<%=layerName%>myGridID,row);
			 }else{
				 return false;
			 }
		 }
		
		// 삭제한 데이터정보
		var sendData = {"wffcltyCd" : items[0].item.wffcltyCd
				       ,"clasCd"    : items[0].item.clasCd
				       ,"checkClasCd" : checkClasCd
				       ,"jobDetail" : items[0].item.wffcltyCd + " " + items[0].item.clasCd};
	
		 GRIT.tran.send({
				url: "/pgm/deleteClas",
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

