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
                    <h1>사용자관리</h1>
					<jsp:include page="../common/commonBtn.jsp">
						<jsp:param value="<%=layerName%>" name="layerName" />
					</jsp:include>                    
                </div>
                <!-- titleWrap : end -->

                <!-- conditionTable : start -->
                <form name="<%=layerName%>searchSysInfoForm" onsubmit="return false;" autocomplete='off'>
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
                            <th>사용자명</th>
                            <td>
                            	<input type="text" id="sehUserNm" name="sehUserNm" style="width: 100%" onkeypress="<%=layerName%>fn_pressSys(this.form);" onkeyup="checkByte(this, 40)">
                            </td>
                            <th>사용자그룹</th>
                            <td>
                            	<select id="sehUserGrpCode" name="sehUserGrpCode" style="width: 100%; text-align-last : center" onkeypress="<%=layerName%>fn_pressSys(this.form);">
									<option value="">전체</option>
									<c:if test="${!empty userGroupList}">
										<c:forEach var="list" items="${userGroupList}">
											<option value="${list.userGroupCd}"><c:out
													value="${list.userGroupNm}" /></option>
										</c:forEach>
									</c:if>
								</select>
                            </td>
                            <th>시설명</th>
							<td class="title">
								<input type="text" id="sehSearchWffcltyNm" name="sehSearchWffcltyNm" style="width: 100%;  maxlength="8" onkeyup="checkByte(this, 50);" onkeypress="<%=layerName%>fn_pressSys(this.form);">
							</td>
                        </tr>
                    </tbody>
                </table>
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
                                <div class="subtitle">사용자 리스트</div>
                                <div class="subBtnGroup">
                                </div>
                            </div>
                            <!-- <div class="box-top">
								<h2>사용자 리스트</h2>
							</div> -->
                           <div id="<%=layerName%>grid_wrap" style="height: 658px;"></div>
                        </td>
                        <td></td>
                        <td>
                           <div class="subtitleGroup">
                                <div class="subtitle">사용자 정보</div>
                                <div class="subBtnGroup">
                                </div>
                            </div>
                            <!-- <div class="box-top">
								<h2>사용자 정보</h2>
							</div> -->
							<form name="userInfoForm" id="userInfoForm" method="post" autocomplete="off">
								<table cellpadding="0" cellspacing="0" class="dataTable" id="align_common" border="1">
								 		<input type="hidden" id="saveMode"   name="saveMode"  value=""/>
				                        <input type="hidden" id="rowIndex"   name="rowIndex"  value=""/>
				                        <input type="hidden" id="wffcltyCd"  name="wffcltyCd" value=""/>
				                        <input type="hidden" id="ognztCd"    name="ognztCd" value=""/>
				                        
									<colgroup>
										<col width="140px" />
										<col width="auto" />
									</colgroup>
									<tr>
										<th>사용자코드</th>
										<td>
											<input type="text" id="userId" style="width:40%;" name="userId" title="사용자코드"  readonly>  
										</td>
									</tr>
									<tr>
										<th><span class="essentialItem">사용자그룹</span></th>
										<td>
											<select id="userGroupCd" name="userGroupCd" style="width: 40%;  text-align-last : center" tabindex="1" onchange="<%=layerName%>fn_changeUserGroup(this.value)" onkeydown="<%=layerName%>EnterFilter('userNm');">
												<c:if test="${!empty userGroupList}">	
													<c:forEach var="list" items="${userGroupList}">
														<option value="${list.userGroupCd}">
															<c:out value="${list.userGroupNm}" /></option>
													</c:forEach>
												</c:if>
											</select> 
										</td>
									</tr>
									<tr>
										<th><span class="essentialItem">사용자명</span></th>
										<td>
											<input type="text" id="userNm" name="userNm" style="width:40%;" title="사용자명"  tabindex="1" onkeyup="checkByte(this, 40)" > 
										</td>
									</tr>
									<tr>
										<th><span class="essentialItem">비밀번호</span></th>
										<td>
											<input type="password" id="encPassword" name="encPassword" style="width:40%;" title="비밀번호" tabindex="1" readonly>
											<button type="button" class="normalBtn" onclick="<%=layerName%>fn_ResetPasswrod(); return false;">비밀번호 초기화</button> 
										</td>
									</tr>
									<tr>
										<th id="change-text">복지시설</th>
										<td>
											<input type="text" id="linkCd" name="linkCd" style="width:40%;" title="복지시설" tabindex="1" onkeyup="<%=layerName%>fn_removeLinkNm(); <%=layerName%>fn_copyLinkCdValue(this.value);" onkeydown="<%=layerName%>fn_searchLinkCd(this.value)" readonly>
											<button type="button" class="iconSearchGlassBtn" onclick="<%=layerName%>fn_searchPop(); return false;"><img src="/resources/imagesV2/iconSearchGlass.png" class="iconSearchGlass"></button>
											<input type="text" id="linkNm" name="linkNm" style="width:40%" margin-left: 0px" title="복지시설명"  readonly>  
										</td>	
									</tr>
									<tr>
										<th>사용여부</th>
										<td>
											<select id="useFg" name="useFg" style="width: 40%; text-align-last : center" tabindex="1">
												<c:if test="${!empty useList}">	
													<c:forEach var="list" items="${useList}">
														<option value="${list.useFg}">
															<c:out value="${list.useFgNm}" /></option>
													</c:forEach>
												</c:if>
											</select> 
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
	
	// 닫기
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .close').click(function(){
		mFnc.tabMenuClose('<%=layerName%>');
	});
	
	
	// AUIGrid 생성 후 반환 ID
	var <%=layerName%>myGridID;
	
	// AUIGrid 칼럼 설정
	var <%=layerName%>columnLayout  = [ 
        {dataField : "userId"      ,headerText : "사용자코드"   ,width : "20%", style : "my-column-center"}
       ,{dataField : "userGroupNm" ,headerText : "그룹"       ,width : "35%", style : "my-column-left"}
       ,{dataField : "userNm"      ,headerText : "사용자명"    ,width : "45%", style : "my-column-left"} 
       ];
	
	$(function () {	
		// AUIGrid 그리드를 생성합니다.
		<%=layerName%>createAUIGrid(<%=layerName%>columnLayout);
		
		<%=layerName%>fn_newSys();
		
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
		
		var userGroupCd = item.userGroupCd;

		$(".<%=layerName%> #userId").val(item.userId);
		$(".<%=layerName%> #userNm").val(item.userNm);
		$(".<%=layerName%> #userGroupCd").val(item.userGroupCd);
		$(".<%=layerName%> #encPassword").val(item.encPassword);
		
		if(userGroupCd == "C" ){
			$(".<%=layerName%> #linkCd").val(item.linkCd);
			$(".<%=layerName%> #wffcltyCd").val(item.linkCd);
		}else if(userGroupCd == "D"){
			$(".<%=layerName%> #linkCd").val(item.linkCd);
			$(".<%=layerName%> #ognztCd").val(item.linkCd);
		}else{
			$(".<%=layerName%> #linkCd").val(item.linkCd);
			$(".<%=layerName%> #ognztCd").val("");
			$(".<%=layerName%> #wffcltyCd").val("");
		}
		
		$(".<%=layerName%> #linkNm").val(item.linkNm);
		$(".<%=layerName%> #useFg").val(item.useFg);
		
		if(userGroupCd == "A" || userGroupCd == "B"){
			$(".<%=layerName%> #linkCd").attr('readonly', true);
		}else if(userGroupCd == "C" || userGroupCd == "D"){
			$(".<%=layerName%> #linkCd").attr('readonly', false);
		}
		
		if(userGroupCd == "C"){
			$('#change-text').text('');
			$('#change-text').prepend("<span class='essentialItem'>복지시설</span>");
		}else if(userGroupCd == "D"){
			$('#change-text').text('');
			$('#change-text').prepend("<span class='essentialItem'>운영단체</span>");
		}else{
			$('#change-text').text('복지시설');
			//$('#change-text').removeClass('essentialItem');
		}
		
		
		$(".<%=layerName%> #userInfoForm").find("#userGroupCd").attr("disabled","true"); 
		$(".<%=layerName%> #encPassword").attr('readonly', true); 
		
		// 상태값
		$(".<%=layerName%> #userInfoForm").find("#saveMode").val("U");
	}
	

	
	//엔터키 조회시
	function <%=layerName%>fn_pressSys(e){ 
    	if(event.keyCode == 13){ //javascript에서는 13이 enter키를 의미함 
    		<%=layerName%>loadData ();
		}
	}
	
	//조회
	function <%=layerName%>loadData () {
		<%=layerName%>fn_newSys();
		
		var sendData = {"userNm"      : <%=layerName%>searchSysInfoForm.sehUserNm.value
				       ,"userGroupCd" : <%=layerName%>searchSysInfoForm.sehUserGrpCode.value
				       ,"wffcltyNm" : <%=layerName%>searchSysInfoForm.sehSearchWffcltyNm.value};
		
		// ajax 요청 전 그리드에 로더 표시
		AUIGrid.showAjaxLoader(<%=layerName%>myGridID);
		
		GRIT.tran.send({
			url: "/bas/selectUserList",
			sendData: sendData,
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
	
	// 신규
	function <%=layerName%>fn_newAll() {
		if ( confirm ("신규로 입력 하시겠습니까?") ) {
			<%=layerName%>fn_newSys();
			$(".<%=layerName%> #userGroupCd").focus();
		}
	}
	
	//초기화
	function <%=layerName%>fn_newSys() {
		
		$(".<%=layerName%> #userId").val("");
		$(".<%=layerName%> #userNm").val("");
		$(".<%=layerName%> #userGroupCd").val("A");
		$(".<%=layerName%> #encPassword").val("a1234567@");
		$(".<%=layerName%> #linkCd").val("");
		$(".<%=layerName%> #linkNm").val("");
		$(".<%=layerName%> #useFg").val("1");
		$(".<%=layerName%> #ognztCd").val("");
		$(".<%=layerName%> #wffcltyCd").val("");
		
		$(".<%=layerName%> #userNm").attr('readonly', false);
		//$(".<%=layerName%> #userGroupCd").attr('readonly', false);
		$(".<%=layerName%> #userInfoForm").find("#userGroupCd").removeAttr("disabled");
		$(".<%=layerName%> #userInfoForm").find("#useFg").removeAttr("disabled");
		//$(".<%=layerName%> #useFg").attr('readonly', false); 
		
		$('#change-text').text('복지시설');
		$(".<%=layerName%> #userInfoForm").find("#linkCd").attr('readonly', true);
		
		// 상태값
		$(".<%=layerName%> #userInfoForm").find("#saveMode").val("I");
	}
	
	//저장 체크
	function <%=layerName%>fn_saveSysInfo() {
					
		if ( $(".<%=layerName%> #userGroupCd").val() == "" ) {
			$(".<%=layerName%> #userGroupCd").focus();
			GRIT.msg.alert("[사용자그룹코드]는 필수 항목입니다."); return;
		}
		
		if ( $(".<%=layerName%> #userNm").val() == "" ) {
			$(".<%=layerName%> #userNm").focus();
			GRIT.msg.alert("[사용자명]은 필수 항목입니다."); return;
		}
		
		if ( $(".<%=layerName%> #encPassword").val() == "" ) {
			$(".<%=layerName%> #encPassword").focus();
			GRIT.msg.alert("[비밀번호]는 필수 항목입니다."); return;
		}
		
		if ( $(".<%=layerName%> #useFg").val() == "" ) {
			$(".<%=layerName%> #useFg").focus();
			GRIT.msg.alert("[사용여부]는 필수 항목입니다."); return;
		}
		
		var userGroupCd = $(".<%=layerName%> #userGroupCd").val();
		
		if(userGroupCd == "C"){
			if ( $(".<%=layerName%> #linkCd").val() == "" || $(".<%=layerName%> #linkNm").val() == "") {
				$(".<%=layerName%> #linkCd").focus();
				GRIT.msg.alert("[복지시설]는 필수 항목입니다."); 
				return;
			}
		}else if(userGroupCd == "D"){
			if ( $(".<%=layerName%> #linkCd").val() == "" || $(".<%=layerName%> #linkNm").val() == "") {
				$(".<%=layerName%> #linkCd").focus();
				GRIT.msg.alert("[운영단체]는 필수 항목입니다."); return;
			}
		}
		
		if(confirm("저장 하시겠습니까?")){
			<%=layerName%>fn_save();
	    } 
	}
	
	//저장
	function <%=layerName%>fn_save(){
        
		var sendData = $(".<%=layerName%> form[name=userInfoForm]").serializeObject();
		
         GRIT.tran.send({
			url: "/bas/saveSysInfo",
			async: false,
			sendData: sendData,
			success: function(result){
				if(result.rtnCode == "0"){
					GRIT.msg.alert(result.message);
					<%=layerName%>loadData ();
				}else{
					GRIT.msg.alert(result.message);
					return;
				}
			},
 			loadingTarget: "<%=layerName%>"
 		}); 
	}
	
	
	// 사용자 그룹코드 변경
	function <%=layerName%>fn_changeUserGroup(value){
		var userGroupCd = value;
		
		if(userGroupCd == "C"){
			$('#change-text').text('');
			$('#change-text').prepend("<span class='essentialItem'>복지시설</span>");
			$(".<%=layerName%> #userInfoForm").find("#linkCd").attr('readonly', false);
			
		}else if(userGroupCd == "D"){
			$('#change-text').text('');
			$('#change-text').prepend("<span class='essentialItem'>운영단체</span>");
			$(".<%=layerName%> #userInfoForm").find("#linkCd").attr('readonly', false);
		}else{
			$('#change-text').text('복지시설');
			$(".<%=layerName%> #userInfoForm").find("#linkCd").attr('readonly', true);
		}
		
	}
	
	// 비밀번호 리셋
 	function <%=layerName%>fn_ResetPasswrod(){
 		
		var userId = $(".<%=layerName%> #userId").val();
 		
 		if(userId == "" || userId == null){
 			GRIT.msg.alert("사용자 조회 후 초기화 할 수 있습니다.");
 			return false;
 		}
 		
 		if(confirm("비밀번호를 초기화 하시겠습니까?")){
 			
 			var sendData = {"userId" : userId};
 			
 			GRIT.tran.send({
 				url: "/bas/resetPassword",
 				async: false,
 				sendData: sendData,
 				success: function(result){
 					if(result.rtnCode == "0"){
 						GRIT.msg.alert(result.message);
 						return;
 					}else{
 						GRIT.msg.alert(result.message);
 						return;
 					}
 				},
 				loadingTarget: "<%=layerName%>"
 			}); 
	    } 
 		
	} 
	

	
	function <%=layerName%>fn_searchPop(){
		
		// 사용자 그룹코드
		var userGroupCd = $(".<%=layerName%> #userGroupCd").val();
		
		if(userGroupCd == "A" || userGroupCd == "B"){
			GRIT.msg.alert("복지시설 등록 대상 그룹이 아닙니다.");
			return false;
		}
		
		// 복지시설
		if(userGroupCd == "C"){
			 var layerName = "<%=layerName%>"; 
			 var url = "<c:url value='/pop/searchWffcltyPop?layerName="+layerName+"'/>";
			 var width="700";
			 var height="610";
			 var name="searchWffclty";
			 popitup(url, height, width, name);
			 
		// 운영단체	
		}else if(userGroupCd == "D"){
			 
			 var layerName = "<%=layerName%>"; 
			 var url = "<c:url value='/pop/searchOgnztPop?layerName="+layerName+"'/>";
			 var width="700";
			 var height="610";
			 var name="searchOgnzt";
			 popitup(url, height, width, name);
		}
		
	}
	
	//복지시설 callback
	function <%=layerName%>setSearchWffcltyPop(item,  name){
		if(item.useFg == "미사용"){
			$(".<%=layerName%> #linkCd").val("");
			$(".<%=layerName%> #linkNm").val("");
			
			GRIT.msg.alert("관리 대상이 아닌 복지시설을 선택 할 수 없습니다.");
		}else{
			$(".<%=layerName%> #linkCd").val(item.wffcltyCd);
			$(".<%=layerName%> #linkNm").val(item.wffcltyNm);
		}
	}
	
	//운영단체 callback
	function <%=layerName%>setSearchOgmztPop(item,  name){
		
		if(item.useFg == "미사용"){
			$(".<%=layerName%> #linkCd").val("");
			$(".<%=layerName%> #linkNm").val("");
			
			GRIT.msg.alert("관리 대상이 아닌 운영단체를 선택 할 수 없습니다.");
		}else{
			$(".<%=layerName%> #linkCd").val(item.ognztCd);
			$(".<%=layerName%> #linkNm").val(item.ognztNm);
		}
	}
	
	// 복지시설/운영단체 이름 제거
	function <%=layerName%>fn_removeLinkNm(){
		 if(event.keyCode == 8 || $(".<%=layerName%> #linkCd").val() == ""){
			$(".<%=layerName%> #linkNm").val("");
		 }
	}
	
	function <%=layerName%>fn_copyLinkCdValue(value){
		
		var userGroupCd = $(".<%=layerName%> #userGroupCd").val();
		
		if(userGroupCd == "C"){
			$(".<%=layerName%> #wffcltyCd").val(value);
		}else if(userGroupCd == "D"){
			$(".<%=layerName%> #ognztCd").val(value);
		}
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
					if($(".<%=layerName%> #linkCd").val() != ''){
        				<%=layerName%>fn_searchPop();        	
        			}
				}else if(result.data.length == 1){
					
					if(result.data[0].useFg == "미사용"){
						
						setTimeout(function(){
						$(".<%=layerName%> #linkCd").val("");
						$(".<%=layerName%> #linkNm").val("");
						if(result.data[0].userGroupCd == "C"){
							GRIT.msg.alert("관리 대상이 아닌 복지시설을 선택 할 수 없습니다.");
							return;
						}else if(result.data[0].userGroupCd == "D"){
							GRIT.msg.alert("관리 대상이 아닌 운영단체를 선택 할 수 없습니다.");
							return;
						}
						}, 50);
						
					}else{
						$(".<%=layerName%> #linkCd").val(result.data[0].linkcd);
						$(".<%=layerName%> #linkNm").val(result.data[0].linknm);						
					}
					
				}else{
					setTimeout(function(){					
					GRIT.msg.alert("조회된 데이터가 없습니다");
					$(".<%=layerName%> #linkCd").val("");
					},50);
				}
				
			},
			loadingTarget: "<%=layerName%>"
		}); 
	}
	
</script>

