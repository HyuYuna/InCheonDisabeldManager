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
                    <h1>운영주체조회</h1>
					<jsp:include page="../common/commonBtn.jsp">
						<jsp:param value="<%=layerName%>" name="layerName" />
					</jsp:include>                    
                </div>
                <!-- titleWrap : end -->

                <!-- conditionTable : start -->
                <form name="<%=layerName%>searchGroupListForm" onsubmit="return false;" autocomplete='off'>
                <table class="dataTable marginT10">
                    <colgroup>
                        <col style="width:10%">
                        <col style="width:20%">
                        <col style="width:10%">
                        <col style="width:20%">
                        <col style="width:10%">
                        <col style="width:auto">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>운영주체명</th>
                            <td>
                            	<input type="text" id="ognztNm" name="ognztNm" style="width: 100%;" onkeypress="<%=layerName%>fn_pressSys(this.form);" onkeyup="checkByte(this, 80)">
                            </td>
                            <th>대표자</th>
                            <td>
                            	<input type="text" id="rprsntvNm" name="rprsntvNm" style="width: 100%;" onkeypress="<%=layerName%>fn_pressSys(this.form);" onkeyup="checkByte(this, 40)">
                            </td>
                             <th>자산</th>
                            <td>
                            	<input type="text" id="assets"  name="assets"  maxlength="10" style="width: 37.5%; text-align: right;" onkeypress="<%=layerName%>fn_pressSys(this.form);" onkeyup="removeChar(event);fn_comma(this);"> ~
								<input type="text" id="assets2" name="assets2" maxlength="10" style="width: 37.5%; text-align: right;" onkeypress="<%=layerName%>fn_pressSys(this.form);" onkeyup="removeChar(event);fn_comma(this);"> (단위 : 백만원)
                            </td> 
                         </tr>
                         <tr>
                         	 <th>운영주체구분</th>
                            <td>
                            	<select id="ognztFg" name="ognztFg" style="width: 100%; text-align-last : center;" >
									<option value="">전체</option>
									<c:if test="${!empty ognztList}">
										<c:forEach var="list" items="${ognztList}">
											<option value="${list.ognztFg}">
												<c:out value="${list.ognztNm}" /></option>
										</c:forEach>
									</c:if>
								</select>
                            </td>
                            <th>시설운영</th>
                            <td colspan="3">
                            	<select id="facCode" name="facCode" style="width: 31.4%; text-align-last : center;">
									<option value="">전체</option>
									<c:if test="${!empty facOpList}">
										<c:forEach var="list" items="${facOpList}">
											<option value="${list.facCode}">
												<c:out value="${list.facNm}" /></option>
										</c:forEach>
									</c:if>
								</select>
                            </td>
                         </tr>
                    </tbody>
                </table>
                </form>
                
                <!-- conditionTable : end -->

                <!-- layout table : start -->
                <table class="layoutTable">
                	<input type="hidden" id="rowIndex"   name="rowIndex"  value=""/>
                    <tr>
                        <td>
                           <div class="subtitleGroup">
                                <div class="subtitle">운영주체 리스트</div>
                           </div>
                             <div id="<%=layerName%>grid_wrap" style="height: 620px;"></div>
                        </td>
                    </tr>
                </table>
                <!-- layout table : end -->


<script type="text/javascript">
	//조회 클릭시
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .search').click(function(){
		<%=layerName%>loadData();
	});
	
	//엑셀
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .exel').click(function(){
		<%=layerName%>exportTo();
	});
	
	//닫기
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .close').click(function(){	
		mFnc.tabMenuClose('<%=layerName%>');
	});

//AUIGrid 생성 후 반환 ID
var <%=layerName%>myGridID;

// AUIGrid 칼럼 설정
var <%=layerName%>columnLayout = [ 
     {dataField : "ognztCd"         ,headerText : "운영주체코드"   ,width : 100, cellMerge : true, style: "my-column-center"}
    ,{dataField : "ognztNm"         ,headerText : "운영주체명"    ,width : 180, style: "my-column-left", cellMerge : true}
    ,{dataField : "ognztFg"         ,headerText : "운영주체구분"   ,width : 130, cellMerge : true,  style: "my-column-left"}
    ,{dataField : "encPrmisnNo"     ,headerText : "허가번호"   ,width : 120 ,  style: "my-column-left"}
    ,{dataField : "rprsntvNm"       ,headerText : "대표자"    ,width : 130 ,  style: "my-column-left"}
    ,{dataField : "phoneNum1"       ,headerText : "연락처1"   ,width : 100, 
    	labelFunction : function( rowIndex, columnIndex, value, headerText, item ) {
    		if(String(value) != "undefined") {
            // 전화번호에 대시 붙이는 정규식으로 표현
  			if(value.length == 7){
               		return value.replace(/(\d{3})(\d{4})/, '$1-$2');
               }else if(value.length == 8){
              	 	return value.replace(/(\d{4})(\d{4})/, '$1-$2');
               }else{
               		return value.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");            	
            }
        }
        return value; 
   	  }
    }
    ,{dataField : "phoneNum2"       ,headerText : "연락처2"   ,width : 100,
    	labelFunction : function( rowIndex, columnIndex, value, headerText, item ) {
    	if(String(value) != "undefined") {
   	         // 전화번호에 대시 붙이는 정규식으로 표현
    		 if(value.length == 7){
             		return value.replace(/(\d{3})(\d{4})/, '$1-$2');
             }else if(value.length == 8){
            	 	return value.replace(/(\d{4})(\d{4})/, '$1-$2');
             }else{
             		return value.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");            	
             }
   	     }
    	 return value;
      }
    }
    ,{dataField : "faxNum"          ,headerText : "팩스번호"   ,width : 100, 
    	labelFunction : function( rowIndex, columnIndex, value, headerText, item ) {
   		if(String(value) != "undefined") {
   			// 전화번호에 대시 붙이는 정규식으로 표현
   			if(value.length == 7){
                	 return value.replace(/(\d{3})(\d{4})/, '$1-$2');
                }else if(value.length == 8){
               		 return value.replace(/(\d{4})(\d{4})/, '$1-$2');
                }else{
                	 return value.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");            	
                }
     	     }
       	 return value;
       }
    }
    ,{dataField : "zipCd"           ,headerText : "우편번호"   ,width : 100 ,  style: "my-column-center"}
    ,{dataField : "addrBase"        ,headerText : "주소"      ,width : 400 ,  style: "my-column-left"}
    ,{dataField : "establishDD"     ,headerText : "설립일자"   ,width : 100, dataType : "date", formatString : "yyyy-mm-dd", style: "my-column-center"}
    ,{dataField : "executiveDetail" ,headerText : "임직원내역"  ,width : 100 ,  style: "my-column-left"}
    ,{dataField : "chargerNm"       ,headerText : "담당자"     ,width : 100 ,  style: "my-column-left"}
    ,{dataField : "assets"          ,headerText : "자산"      ,width : 100 ,   style: "my-column-right" , dataType : "numeric" ,formatString : "#,##0"}
    ,{dataField : "memberCnt"       ,headerText : "회원수"     ,width : 100,   style: "my-column-right" , dataType : "numeric" ,formatString : "#,##0"}
    ,{dataField : "useFg"           ,headerText : "사용여부"   ,width : 100}
    ];

   
	// 페이지 로딩 되면 실행
	$(function () {
		// AUIGrid 그리드를 생성합니다.
		<%=layerName%>createAUIGrid(<%=layerName%>columnLayout);
		
	});

	//AUIGrid 를 생성합니다.
	function <%=layerName%>createAUIGrid(columnLayout) {
		var <%=layerName%>auiGridProps = {
			// 체크박스
			showRowCheckColumn : false,
			// No.
			// singleRow 선택모드
			//selectionMode : "singleCell",
			// 고정칼럼 카운트 지정
			fixedColumnCount : 3,
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
			//$(".<%=layerName%> #rowIndex").val(primeCell.rowIndex);
		});
	
		// 그리드 ready 이벤트 바인딩  
		AUIGrid.bind(<%=layerName%>myGridID, "ready", <%=layerName%>setChangeItemGrid);
	}

	//그리드 ready 이벤트 핸들러
	function <%=layerName%>setChangeItemGrid(event) {
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
	var sendData = { "ognztNm"   : <%=layerName%>searchGroupListForm.ognztNm.value
					,"rprsntvNm" : <%=layerName%>searchGroupListForm.rprsntvNm.value
					,"ognztFg"   : <%=layerName%>searchGroupListForm.ognztFg.value
					,"useFg"     : <%=layerName%>searchGroupListForm.facCode.value
					,"assets"    : <%=layerName%>searchGroupListForm.assets.value.replace(/\,/g,'')
					,"assets2"   : <%=layerName%>searchGroupListForm.assets2.value.replace(/\,/g,'')};

		// ajax 요청 전 그리드에 로더 표시
		AUIGrid.showAjaxLoader(<%=layerName%>myGridID);
	
		GRIT.tran.send({
			url: "/bas/basGroupSearchList",
			sendData: sendData,
			success: function(result){
				// 그리드에 데이터 세팅
				// resData 는 JSON 을 파싱한 Array-Object 입니다.
				AUIGrid.setGridData(<%=layerName%>myGridID, result.data);
				
				// 로더 제거
				AUIGrid.removeAjaxLoader(<%=layerName%>myGridID);
				
			},
			error: function(request, status, error){
				GRIT.msg.alert("운영주체조회 조회하는데 문제가 발생했습니다.");
				// 로더 제거
				AUIGrid.removeAjaxLoader(<%=layerName%>myGridID1);
			},
			loading : false
		});
	
	}

	//엑셀 다운로드
	function <%=layerName%>exportTo() {
		
		var groupList = AUIGrid.getGridData(<%=layerName%>myGridID);
		
		if(groupList.length == 0){
			setTimeout(function(){					
				GRIT.msg.alert("운영주체 리스트에 조회된 데이터가 없습니다");
				$(".<%=layerName%> #searchWffcltyCd").val("");
				},50);
			return false;
		}
		
		AUIGrid.exportToXlsx(<%=layerName%>myGridID, {
			fileName : "운영주체 리스트_조회"
		});
	}


</script>
