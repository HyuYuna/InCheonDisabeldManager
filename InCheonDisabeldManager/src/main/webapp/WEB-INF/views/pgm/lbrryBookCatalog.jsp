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
                    <h1>도서 분류 관리</h1>
					<jsp:include page="../common/commonBtn.jsp">
						<jsp:param value="<%=layerName%>" name="layerName" />
					</jsp:include>                    
                </div>
                <!-- titleWrap : end -->

                <!-- conditionTable : start -->
                <form name="<%=layerName%>schFrm" onsubmit="return false;" autocomplete='off'>
                <table class="dataTable marginT10">
                    <colgroup>
                        <col style="width:140px">
                       <col style="width:auto">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>도서분류코드(명)</th>
                            <td>
								<input type="text" id="schCatalogNo" name="schCatalogNo" style="width:100%;" title="도서분류명" 
								onkeyup="checkByte(this, 80)" onkeypress="<%=layerName%>fn_pressSys(this.form);" >
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
                                <div class="subtitle">분류 리스트</div>
                                <div class="subBtnGroup">
                                </div>
                            </div>
                            <!-- <h2>분류 리스트</h2> -->
                            <div id="<%=layerName%>grid_wrap" style="height: 658px; width: 550px;"></div>
                        </td>
                        <td>&nbsp;</td>
                        <td>
                            <div class="subtitleGroup">
                                <div class="subtitle">분류 정보</div>
                                <div class="subBtnGroup">
                                </div>
                            </div>
                            <!-- <h2>분류 정보</h2> -->
							<form name="bookCatalogForm" id="bookCatalogForm" method="post" autocomplete="off">
								<table cellpadding="0" cellspacing="0" class="dataTable" id="align_common">
								<input type="hidden" id="rowIndex"   name="rowIndex"  value=""/>
									<colgroup>
										<col width="20%" />
										<col width="auto" />
									</colgroup>
									<tr>
										<th>분류코드</th>
										<td>
											<input type="text" id="catalogNo" name="catalogNo" style="width:40%; text-align: left;"  title="분류코드" readonly> 
										</td>
									</tr>
									<tr>
										<th><span class="essentialItem">분류명</th>
										<td>
											<input type="text" id="catalogNm" name="catalogNm" style="width:40%; text-align: left;"  title="분류명" onkeyup="checkByte(this, 20)" onkeydown="<%=layerName%>EnterFilter('useFg');" /> 
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
	/*$('.section-wrap .boxcontent.<%=layerName%> .section-top .btn-group a.search').click(function(){*/
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .search').click(function(){
		<%=layerName%>loadData();
	});

	// 신규
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .new').click(function(){
		<%=layerName%>fn_newAll();
	});
	
	// 저장
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .save').click(function(){
		<%=layerName%>fn_saveLbrryBookCatalog();
	});
	
	// 닫기
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .close').click(function(){
		mFnc.tabMenuClose('<%=layerName%>');
	});
	
	//AUIGrid 생성 후 반환 ID
	var <%=layerName%>myGridID;
    
	// AUIGrid 칼럼 설정
	var <%=layerName%>columnLayout = [ 
		 {dataField : "catalogNo", headerText : "분류코드", width : "30%"}
	    ,{dataField : "catalogNm", headerText : "분류명", width : "70%", style:"my-column-left"}
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
				"schCatalogNo" : $("#schCatalogNo").val()
		};
		AUIGrid.showAjaxLoader(<%=layerName%>myGridID);
		GRIT.tran.send({
			url: "/pgm/lbrryBookCatalogList",
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
					$("#bookCatalogForm")[0].reset();
				}
				// 로더 제거
				AUIGrid.removeAjaxLoader(<%=layerName%>myGridID);
			},
			error: function(request, status, error){
				GRIT.msg.alert("도서분류를 조회하는데 문제가 발생했습니다.");
				// 로더 제거
				AUIGrid.removeAjaxLoader(<%=layerName%>myGridID);
			},
			loading : false
			
		});
	}
	
	function <%=layerName%>setGrdToFrm(data) {
		$("#bookCatalogForm")[0].reset();
		
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

	// 신규
	function <%=layerName%>fn_newAll() {
		if ( confirm ("신규로 입력 하시겠습니까?") ) {
			$(".<%=layerName%> #bookCatalogForm")[0].reset();
			$(".<%=layerName%> #catalogNm").focus();
		}
	}
	
	//저장전 검사
	function <%=layerName%>fn_saveLbrryBookCatalog(){
		if ( $(".<%=layerName%> #catalogNm").val() == "" ) {
			$(".<%=layerName%> #catalogNm").focus();
			GRIT.msg.alert("[분류명]은 필수 항목입니다."); return;
		}
		if(confirm("저장 하시겠습니까?")){
			<%=layerName%>fn_save();
	    } 
	}
	//저장
	function <%=layerName%>fn_save(){
		
		var sendData = $(".<%=layerName%> form[name=bookCatalogForm]").serializeObject();

         GRIT.tran.send({
			url: "/pgm/lbrryBookCatalogSave",
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