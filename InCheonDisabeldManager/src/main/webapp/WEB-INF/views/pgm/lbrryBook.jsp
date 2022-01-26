<%@ page import="kr.co.grit.common.util.SessionUtil"%>
<%@ page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%
	String layerName = request.getParameter("layerName");
%>

                <!-- titleWrap : start -->
                <div class="titleWrap">
                    <h1>도서 목록 관리</h1>
					<jsp:include page="../common/commonBtn.jsp">
						<jsp:param value="<%=layerName%>" name="layerName" />
					</jsp:include>                    
                </div>
                <!-- titleWrap : end -->

                <!-- conditionTable : start -->
                <form name="<%=layerName%>searchForm1" onsubmit="return false;" autocomplete='off'>
                <table class="dataTable marginT10">
                    <colgroup>
                        <col style="width:10%">
                        <col style="width:23%">
                        <col style="width:10%">
                        <col style="width:23%">
                        <col style="width:10%">
                       <col style="width:auto">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>도서분류</th>
                            <td>
								<input type="text" id="schCatalogNo" name="schCatalogNo" style="width:40%;" title="도서분류명" oninput="<%=layerName%>fn_removeSearchField('schCatalogNm');" onkeydown="<%=layerName%>EnterPop('schCatalogNo','schCatalogNm');" />
				            	<button type="button" class="iconSearchGlassBtn" onclick="<%=layerName%>openSchPop('/pop/searchLbrryBookCatalogPop','searchLbrryBookCatalogPop'); return false;" >
				            	<img src="/resources/imagesV2/iconSearchGlass.png" class="iconSearchGlass">
				            	</button>
				        		<input type="text" id="schCatalogNm" name="schCatalogNm" style="width:48%; margin-left: 0px" title="도서분류코드"  disabled>
                            </td>
                            <th>도서유형</th>
                            <td>
								<input type="text" id="schTypeCd" name="schTypeCd" style="width:40%;" title="도서유형명" 
								oninput="<%=layerName%>fn_removeSearchField('schTypeNm');"
								onkeydown="<%=layerName%>EnterPop('schTypeCd','schTypeNm');"  />
				            	<button type="button" class="iconSearchGlassBtn" onclick="<%=layerName%>openSchPop('/pop/searchLbrryBookTypePop','searchLbrryBookTypePop');  return false;" >
				            	<img src="/resources/imagesV2/iconSearchGlass.png" class="iconSearchGlass">
				            	</button>
				        		<input type="text" id="schTypeNm" name="schTypeNm" style="width:48%; margin-left: 0px" title="도서유형코드"  disabled>
                            </td>
                            <th>도서명</th>
                            <td>
                            	<input type="text" id="schBookNm" name="schBookNm" style="width:100%;" title="도서명" onkeydown="<%=layerName%>fn_pressSys();" >
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
                                <div class="subtitle">도서 리스트</div>
                                <div class="subBtnGroup">
                                </div>
                            </div>
                            <!-- <h2>도서 리스트</h2> -->
                            <div id="<%=layerName%>grid_wrap" style="height: 658px; width: 550px;"></div>
                        </td>
                        <td>&nbsp;</td>
                        <td>
                            <div class="subtitleGroup">
                                <div class="subtitle">도서 정보</div>
                                <div class="subBtnGroup">
                                </div>
                            </div>
                            <!-- <h2>도서 정보</h2> -->
                            
							<form name="bookForm" id="bookForm" method="post" autocomplete="off">
								<table cellpadding="0" cellspacing="0" class="dataTable" id="align_common">
									<input type="hidden" id="rowIndex"   name="rowIndex"  value=""/>
									<colgroup>
										<col width="20%" />
										<col width="auto" />
									</colgroup>
									<tr>
										<th>도서코드</th>
										<td>
											<input type="text" id="bookNo" name="bookNo" style="width:40%; text-align: left;"  title="도서코드" readonly> 
										</td>
									</tr>
									<tr>
										<th><span class="essentialItem">도서분류</th>
										<td>
											<input type="text" id="catalogNo" name="catalogNo" style="width:40%; text-align: left;"  title="도서분류명" 
											oninput="<%=layerName%>fn_removeSearchField('catalogNm');" 
											onkeydown="<%=layerName%>EnterPop('catalogNo','catalogNm');" />
							            	<button type="button" class="iconSearchGlassBtn" onclick="<%=layerName%>openSchPop('/pop/searchLbrryBookCatalogPop','lbrryBookCatalogPop'); return false;" >
							            	<img src="/resources/imagesV2/iconSearchGlass.png" class="iconSearchGlass">
							            	</button>
							        		<input type="text" id="catalogNm" name="catalogNm" style="width:54.9%; margin-left: 0px" title="도서분류코드"  disabled>
										</td>
									</tr>
									<tr>
										<th><span class="essentialItem">도서유형</th>
										<td>
											<input type="text" id="typeCd" name="typeCd" style="width:40%; text-align: left;"  title="도서유형명" 
											oninput="<%=layerName%>fn_removeSearchField('typeNm');"  
											onkeydown="<%=layerName%>EnterPop('typeCd','typeNm');" />
							            	<button type="button" class="iconSearchGlassBtn" onclick="<%=layerName%>openSchPop('/pop/searchLbrryBookTypePop','lbrryBookTypePop'); return false;" >
							            	<img src="/resources/imagesV2/iconSearchGlass.png" class="iconSearchGlass">
							            	</button>
							        		<input type="text" id="typeNm" name="typeNm" style="width:54.9%; margin-left: 0px" title="도서유형코드"  disabled>
										</td>
									</tr>
									<tr>
										<th><span class="essentialItem">도서명</th>
										<td>
											<input type="text" id="bookNm" name="bookNm" style="width:40%; text-align: left;"  title="도서명" 
											onkeyup="checkByte(this, 90)" onkeydown="<%=layerName%>EnterFilter('author');" /> 
										</td>
									</tr>
									<tr>
										<th><span class="essentialItem">저자</th>
										<td>
											<input type="text" id="author" name="author" style="width:40%; text-align: left;"  title="저자" 
											onkeyup="checkByte(this, 45)" onkeydown="<%=layerName%>EnterFilter('publisher');" /> 
										</td>
									</tr>
									<tr>
										<th><span class="essentialItem">발행자</th>
										<td>
											<input type="text" id="publisher" name="publisher" style="width:40%; text-align: left;"  title="발행자" 
											onkeyup="checkByte(this, 45)" onkeydown="<%=layerName%>EnterFilter('pblsYear');" /> 
										</td>
									</tr>
									<tr>
										<th><span class="essentialItem">발행년도</th>
										<td>
											<input type="text" id="pblsYear" name="pblsYear" class="onlynum" style="width:40%; text-align: left;"  title="발행년도" 
											onkeyup="removeChar(event); checkByte(this, 4)" onkeydown="<%=layerName%>EnterFilter('note');" /> 
										</td>
									</tr>
									<tr>
										<th>설명</th>
										<td>
											<input type="text" id="note" name="note" style="width:40%; text-align: left;"  title="설명" 
											onkeyup="checkByte(this, 100)" onkeydown="<%=layerName%>EnterFilter('useFg');" /> 
										</td>
									</tr>
									<tr>
										<th><span class="essentialItem">사용여부</th>
										<td>
											<select id="useFg" name="useFg" style="width:40%; text-align-last : center">
												<option value="1">사용</option>
												<option value="0">미사용</option>
											</select> 
										</td>
									</tr>
								</table>
						    </form>                            
                            
                        </td>
                    </tr>
                </table>
                <!-- layout table : end -->


<!-- ------------------------------------------------------------------------------------------------------------------------------ -->

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

<script type="text/javascript">

	// 조회 클릭시
	/*$('.content .section-wrap .boxcontent.<%=layerName%> .section-top .btn-group a.search').click(function(){*/
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .search').click(function(){
		<%=layerName%>loadData();
	});
	
	// 신규
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .new').click(function(){
		<%=layerName%>fn_newAll();
	});
	
	// 저장
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .save').click(function(){
		<%=layerName%>fn_saveLbrryBook();
	});
	
	// 닫기
	/*$('.content .section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .close').click(function(){*/
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .close').click(function(){
		mFnc.tabMenuClose('<%=layerName%>');
	});
	
	//AUIGrid 생성 후 반환 ID
	var <%=layerName%>myGridID;
    
	// AUIGrid 칼럼 설정
	var <%=layerName%>columnLayout = [ 
		{dataField : "catalogNm", headerText : "도서분류", width : "25%", style:"my-column-left"},
	    {dataField : "typeNm", headerText : "도서유형", width : "25%", style:"my-column-left"},
	    {dataField : "bookNm", headerText : "도서명", width : "50%", style:"my-column-left"}
	    ];
	
	//AUIGrid 서비스장애를 생성합니다.
	function <%=layerName%>createAUIGrid(columnLayout) {
		var <%=layerName%>auiGridProps = {
			softRemoveRowMode : false,
			rowHeight : 38,
			headerHeight : 38,
			noDataMessage : "조회된 내용이 없습니다."
		};
		// 실제로 #grid_wrap 에 그리드 생성
		<%=layerName%>myGridID = AUIGrid.create("#<%=layerName%>grid_wrap", <%=layerName%>columnLayout, <%=layerName%>auiGridProps);
		// 선택 체인지 이벤트 바인딩
		AUIGrid.bind(<%=layerName%>myGridID, "selectionChange", function(event) {
			var primeCell = event.primeCell; // 선택 대표 셀
			var item = primeCell.item; // 행 정보
			<%=layerName%>setGrdToFrm(item);
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
	
	//AUIGrid 서비스장애를 생성합니다.
	function <%=layerName%>loadData() {
		var sendData = {
				"schCatalogNo" : $("#schCatalogNo").val(),
				"schTypeCd" : $("#schTypeCd").val(),
				"schBookNm" : $("#schBookNm").val()
		};
		AUIGrid.showAjaxLoader(<%=layerName%>myGridID);
		GRIT.tran.send({
			url: "/pgm/lbrryBookList",
			sendData: sendData,
			success: function(data){
				// 그리드에 데이터 세팅
				AUIGrid.setGridData(<%=layerName%>myGridID, data.list);
				// 선택 체인지 이벤트 바인딩
				AUIGrid.bind(<%=layerName%>myGridID, "ready", <%=layerName%>auiGridCompleteHandler);
				// 폼에 셋팅
				if(data.list[0]) {
					<%=layerName%>setGrdToFrm(data.list[0]);
				} else { //데이터가 없는 경우
					$("#bookForm")[0].reset();
				}
				// 로더 제거
				AUIGrid.removeAjaxLoader(<%=layerName%>myGridID);
			},
			error: function(request, status, error){
				GRIT.msg.alert("도서목록을 조회하는데 문제가 발생했습니다.");
				// 로더 제거
				AUIGrid.removeAjaxLoader(<%=layerName%>myGridID);
			},
			loading : false
			
		});
	}
	
	function <%=layerName%>setGrdToFrm(data) {
		$("#bookForm")[0].reset();
		
		$.each(data, function(key, value){ 
			//console.log(key);
			if(key != "_$uid") $(".<%=layerName%> #"+key).val(value);
		});
	}
	
	//엔터키 조회시
	function <%=layerName%>fn_pressSys(e){ 
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
	
	//엔터 팝업창
	function <%=layerName%>EnterPop(fid,fid2) {
		if (event.keyCode == 13) {
			<%=layerName%>fn_schLbbryBook(fid,fid2);
		}
	}

	//조회 필드 이름 제거
	function <%=layerName%>fn_removeSearchField(fid) {
		$(".<%=layerName%> #"+fid).val("");
	}
	
	//도서 분류,유형 팝업 조회 필드명을 인자로 원펑션 처리
 	function <%=layerName%>fn_schLbbryBook(fid,fid2){
 		var popUrl = "";
 		var namePop = "";
 		var schUrl = "";
 		var sendData;
 		switch(fid){
 			case "schCatalogNo" : 
 				popUrl = "/pop/searchLbrryBookCatalogPop";
 				popName = "searchLbrryBookCatalogPop";
 				schUrl = "/pgm/lbrryBookCatalogList";
				sendData = { schCatalogNo : $(".<%=layerName%> #"+fid).val() };
 				break;
 			case "schTypeCd" : 
 				popUrl = "/pop/searchLbrryBookTypePop";
 				popName = "searchLbrryBookTypePop";
 				schUrl = "/pgm/lbrryBookTypeList";
 				sendData = { schTypeCd : $(".<%=layerName%> #"+fid).val() };
 				break;
 			case "catalogNo" : 
 				popUrl = "/pop/searchLbrryBookCatalogPop";
 				popName = "lbrryBookCatalogPop";
 				schUrl = "/pgm/lbrryBookCatalogList";
 				sendData = { schCatalogNo : $(".<%=layerName%> #"+fid).val() };
 				break;
 			case "typeCd" : 
 				popUrl = "/pop/searchLbrryBookTypePop";
 				popName = "lbrryBookTypePop";
 				schUrl = "/pgm/lbrryBookTypeList";
 				sendData = { schTypeCd : $(".<%=layerName%> #"+fid).val() };
 				break;
 		}
 		
		if(event.keyCode != 13 && event.keyCode != 9){
			return false;
		} 	

		<%-- if($(".<%=layerName%> #"+fid).val().length == '3' && $(".<%=layerName%> #"+fid2).val() != ""){
			<%=layerName%>loadData();
			return;
		} --%>
		
 		//console.log(sendData);
		//console.log($(".<%=layerName%> #"+fid).val().length);
		
        GRIT.tran.send({
			url: schUrl,
			async: false,
			sendData: sendData,
			success: function(result){
				if(result.list.length > 1){
					if($(".<%=layerName%> #"+fid).val() != '' || $(".<%=layerName%> #"+fid).val().length != 3){
						<%=layerName%>openSchPop(popUrl,popName);
        			}
				}else if(result.list.length == 1){
					if(fid=="schCatalogNo") {
						if($(".<%=layerName%> #schCatalogNo").val().length == "3" && $(".<%=layerName%> #schCatalogNm").val() != ""){
							   <%=layerName%>loadData();
							   return;
						   }
						$(".<%=layerName%> #"+fid).val(result.list[0].catalogNo);
						$(".<%=layerName%> #"+fid2).val(result.list[0].catalogNm);
					} else if(fid=="catalogNo") {
						
						setTimeout(function(){
						if(result.list[0].useFg == "0"){
							$(".<%=layerName%> #"+fid).val("");
							$(".<%=layerName%> #"+fid2).val("");
							GRIT.msg.alert("관리 대상이 아닌 도서분류를 선택 할 수 없습니다.");
							return;
						}else{
							$(".<%=layerName%> #"+fid).val(result.list[0].catalogNo);
							$(".<%=layerName%> #"+fid2).val(result.list[0].catalogNm);
						}
						},50);
					} else if(fid=="schTypeCd") {
						if($(".<%=layerName%> #schTypeCd").val().length == "3" && $(".<%=layerName%> #schTypeNm").val() != ""){
							   <%=layerName%>loadData();
					}
						$(".<%=layerName%> #"+fid).val(result.list[0].typeCd);
						$(".<%=layerName%> #"+fid2).val(result.list[0].typeNm);
					} else if(fid=="typeCd") {
						setTimeout(function(){
						if(result.list[0].useFg == "0"){
							$(".<%=layerName%> #"+fid).val("");
							$(".<%=layerName%> #"+fid2).val("");
							GRIT.msg.alert("관리 대상이 아닌 도서유형를 선택 할 수 없습니다.");
							return;
						}else{
							$(".<%=layerName%> #"+fid).val(result.list[0].typeCd);
							$(".<%=layerName%> #"+fid2).val(result.list[0].typeNm);
						}
						},50);
					}
				}else{
					setTimeout(function(){					
					GRIT.msg.alert("조회된 데이터가 없습니다");
					$(".<%=layerName%> #"+fid).val("");
					},50);
				}
				
			},
			loadingTarget: "<%=layerName%>"
		}); 
	}
 	
 	function <%=layerName%>openSchPop(popUrl,popName) {
		 var layerName = "<%=layerName%>"; 
		 var url = popUrl+"?layerName="+layerName;
		 var width="700";
		 var height="610";
		 popitup(url, height, width, popName);  
 	}
 	
 	//팝업창콜백 분류
 	function <%=layerName%>setSchPop(item,name) {
 		if(name=="lbrryBookCatalogPop") {
 			if(item.useFg == "0"){
 				$(".<%=layerName%> #catalogNm").val("");
 	 	 		$(".<%=layerName%> #catalogNo").val("");
 	 	 		
 	 	 		GRIT.msg.alert("관리 대상이 아닌 도서분류을 선택 할 수 없습니다.");
 	 	 		return;
 			}else{
 				$(".<%=layerName%> #catalogNm").val(item.catalogNm);
 	 	 		$(".<%=layerName%> #catalogNo").val(item.catalogNo);
 			}
 			
 		} else if(name=="lbrryBookTypePop") {
 			if(item.useFg == "0"){
 				$(".<%=layerName%> #typeNm").val("");
 	 	 		$(".<%=layerName%> #typeCd").val("");
 	 	 		
 	 	 		GRIT.msg.alert("관리 대상이 아닌 도서유형을 선택 할 수 없습니다.");
 	 	 		return;
 			}else{
 				$(".<%=layerName%> #typeNm").val(item.typeNm);
 	 	 		$(".<%=layerName%> #typeCd").val(item.typeCd);
 			}
 	 		
 		} else if(name=="searchLbrryBookCatalogPop") {
 			$(".<%=layerName%> #schCatalogNm").val(item.catalogNm);
 	 		$(".<%=layerName%> #schCatalogNo").val(item.catalogNo);
 		} else if(name=="searchLbrryBookTypePop") {
 	 		$(".<%=layerName%> #schTypeNm").val(item.typeNm);
 	 		$(".<%=layerName%> #schTypeCd").val(item.typeCd);
 		}
 	}
 	
	// 신규
	function <%=layerName%>fn_newAll() {
		if ( confirm ("신규로 입력 하시겠습니까?") ) {
			$(".<%=layerName%> #bookForm")[0].reset();
			$(".<%=layerName%> #catalogNo").focus();
		}
	}
	
	function <%=layerName%>fn_removeCatalog() {
		$(".<%=layerName%> #catalogNo").val("");
	}
	
	//저장전 검사
	function <%=layerName%>fn_saveLbrryBook(){
		if ( $(".<%=layerName%> #catalogNo").val() == "" ) {
			$(".<%=layerName%> #catalogNm").focus();
			GRIT.msg.alert("[도서분류]는 필수 항목입니다."); return;
		}
		if ( $(".<%=layerName%> #typeCd").val() == "" ) {
			$(".<%=layerName%> #typeNm").focus();
			GRIT.msg.alert("[도서유형]은 필수 항목입니다."); return;
		}
		if ( $(".<%=layerName%> #bookNm").val() == "" ) {
			$(".<%=layerName%> #bookNm").focus();
			GRIT.msg.alert("[도서명]은 필수 항목입니다."); return;
		}
		if ( $(".<%=layerName%> #author").val() == "" ) {
			$(".<%=layerName%> #author").focus();
			GRIT.msg.alert("[저자]는 필수 항목입니다."); return;
		}
		if ( $(".<%=layerName%> #publisher").val() == "" ) {
			$(".<%=layerName%> #publisher").focus();
			GRIT.msg.alert("[발행자]는 필수 항목입니다."); return;
		}		
		if ( $(".<%=layerName%> #pblsYear").val() == "" ) {
			$(".<%=layerName%> #pblsYear").focus();
			GRIT.msg.alert("[발행년도]는 필수 항목입니다."); return;
		}
		
		if(confirm("저장 하시겠습니까?")){
			<%=layerName%>fn_save();
	    } 
	}
	//저장
	function <%=layerName%>fn_save(){
		
		$("#catalogNo, #typeCd").removeAttr("disabled",false);
		var sendData = $(".<%=layerName%> form[name=bookForm]").serializeObject();
		$("#catalogNo, #typeCd").attr("disabled",true);
		
         GRIT.tran.send({
			url: "/pgm/lbrryBookSave",
			async: false,
			sendData: sendData,
			success: function(result){
				if(result.result=="success") {
					alert("저장 되었습니다");
					<%=layerName%>loadData ();
				} else {
					alert("처리중 오류가 발생하였습니다");
				}
			},
 			loadingTarget: "<%=layerName%>"
 		}); 
	}

	// 페이지 로딩 되면 실행
	$(function () {
		// AUIGrid 서비스 장애그리드를 생성합니다.
		<%=layerName%>createAUIGrid(<%=layerName%>columnLayout);
	});

</script>