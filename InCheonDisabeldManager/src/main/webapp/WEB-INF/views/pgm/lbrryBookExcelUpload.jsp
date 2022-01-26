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
                    <h1>도서 목록 엑셀등록</h1>
					<jsp:include page="../common/commonBtn.jsp">
						<jsp:param value="<%=layerName%>" name="layerName" />
					</jsp:include>                    
                </div>
                <!-- titleWrap : end -->
                
                 <div class="subtitleGroup">
                    <div class="subtitle">도서 목록 엑셀등록 리스트</div>
                 <div class="subBtnGroup">
                      <form id="excelLbrUploadForm" name="excelLbrUploadForm" action="post" enctype="multipart/form-data">
                        <label class="upload-label" for="excelLbrUpload" ><img src="/resources/imagesV2/iconExcelBlue.png" class="subBtnImg">엑셀업로드</label>
						<input type="file" id="excelLbrUpload" name="excelLbrUpload"/>
                        <button type="button" class="subBtn" id="excelPreformDownload" name="excelPreformDownload" onclick="<%=layerName%>excelDownload();"><img src="/resources/imagesV2/iconExcelBlue.png" class="subBtnImg"> 엑셀양식다운로드</button>
                        <button type="button" class="subBtn" id="excelLbrConfirm" name="excelLbrConfirm" onclick="<%=layerName%>excelLbrConfirm();"><img src="/resources/imagesV2/iconCheck.png"     class="subBtnImg">확정</button>
                       </form> 
                    </div>
                </div>
                <div id="<%=layerName%>grid_wrap" style="height: 708px;"></div>
			

<div id="<%=layerName%>grid_Excelwrap" style="height: 675px; width: 100%; display: none;"></div>
<div id="<%=layerName%>grid_ExcelErrorwrap" style="height: 675px; width: 100%; display: none;"></div>


<style>
	/* input type="file" CSS  */
	.subBtnGroup .upload-label { 
		background-color: white;
	    font-size: 14px;
	    color: #334d77;
	    border-radius: 5px;
	    border: 1px solid #ccc;
	    height: 27px;
	    cursor: pointer;
	    display: inline-block;
	    padding: .2em .8em;
	    margin-right: 0px;
    }
    
    /* 파일 필드 숨기기 */
	.subBtnGroup input[type="file"] { 
			position: absolute;
			width: 1px;
			height: 1px;
			padding: 0;
			margin: -1px;
			overflow: hidden;
			clip:rect(0,0,0,0);
			border: 0; 
	}
</style>
<script type="text/javascript">

//닫기
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .close').click(function(){
	mFnc.tabMenuClose('<%=layerName%>');
});

//AUIGrid 생성 후 반환 ID
var <%=layerName%>myGridID;
var <%=layerName%>myGridID2;

// AUIGrid 칼럼 설정
var <%=layerName%>columnLayout = [ 
    {dataField : "bookNo"        ,headerText : "연번"      ,width : "8%"}
    ,{dataField : "bookNm"        ,headerText : "도서명"    ,width : "40%" ,style: "my-column-left"}
    ,{dataField : "author"        ,headerText : "저자"      ,width : "16%" ,style: "my-column-left"}
    ,{dataField : "publisher"     ,headerText : "발행자"    ,width : "16%"  ,style: "my-column-left"}
    ,{dataField : "pblsYear"      ,headerText : "발행년도"   ,width : "5%"}
    ,{dataField : "typeName"      ,headerText : "유형"      ,width : "15%", style: "my-column-left"}
    ,{dataField : "wffcltyCd"     ,headerText : "복지시설코드",width :0 }
    ];

//AUIGrid 칼럼 설정 엑셀 샘플
var <%=layerName%>columnLayout2 = [ 
     {dataField : "bookNo"        ,headerText : "연번"      ,width : 100}
    ,{dataField : "bookNm"        ,headerText : "도서명"    ,width : 100}
    ,{dataField : "author"        ,headerText : "저자"      ,width : 100}
    ,{dataField : "publisher"     ,headerText : "발행자"    ,width : 100}
    ,{dataField : "pblsYear"      ,headerText : "발행년도"   ,width : 100}
    ,{dataField : "typeName"      ,headerText : "유형"      ,width : 100}
    ];

//AUIGrid 칼럼 설정 에러 엑셀
var <%=layerName%>columnLayout3 = [ 
     {dataField : "bookNo"        ,headerText : "연번"      ,width : 100}
    ,{dataField : "bookNm"        ,headerText : "도서명"    ,width : 200}
    ,{dataField : "author"        ,headerText : "저자"      ,width : 120}
    ,{dataField : "publisher"     ,headerText : "발행자"    ,width : 100}
    ,{dataField : "pblsYear"      ,headerText : "발행년도"   ,width : 100}
    ,{dataField : "typeName"      ,headerText : "유형"      ,width : 100}
    ,{dataField : "checkError"    ,headerText : "에러"             ,width : 350 , dataType : "string"}
    ];

// 페이지 로딩 되면 실행
$(function () {
	// AUIGrid 그리드를 생성합니다.
	<%=layerName%>createAUIGrid(<%=layerName%>columnLayout);
	<%=layerName%>createAUIGrid2(<%=layerName%>columnLayout2);
	<%=layerName%>createAUIGrid3(<%=layerName%>columnLayout3);
	
	$('#excelLbrUpload').on('change', function(evt) {
		
		var file = evt.target.files[0];
		
		if(!/\.(xlsx|xls)$/i.test(file.name)){
			GRIT.msg.alert("엑셀파일은 xlsx, xls만 업로드 할 수 있습니다.")
			return;
		}

		var f = new FormData(document.getElementById('excelLbrUploadForm'));
		
		// ajax 요청 전 그리드에 로더 표시
		AUIGrid.showAjaxLoader(<%=layerName%>myGridID);
				
		$.ajax({
            url: "/pgm/pgmLbrryBookExcelFile",
            data: f,
            processData: false,
            contentType: false,
            type: "POST",
            success: function(result){
          
               if(result.resultMap.rtnCode == "0"){
            	   GRIT.msg.alert(result.resultMap.message);
            	   AUIGrid.setGridData(<%=layerName%>myGridID, result.data);
            	// 로더 제거
   				AUIGrid.removeAjaxLoader(<%=layerName%>myGridID);
            	   
               }else if(result.resultMap.rtnCode == "-1"){
            	   GRIT.msg.alert(result.resultMap.message);
            	   AUIGrid.setGridData(<%=layerName%>myGridID3, result.data);
            	   
            	   // 에러 엑셀
            	   AUIGrid.exportToXlsx(<%=layerName%>myGridID3, {
            			exportWithStyle : true,
            			fileName  : "장애정도별_ERROR_Excel"
            		});
            		// 로더 제거
      				AUIGrid.removeAjaxLoader(<%=layerName%>myGridID);
            	   
               }else{
            	   GRIT.msg.alert(result.resultMap.message);
            		// 로더 제거
      				AUIGrid.removeAjaxLoader(<%=layerName%>myGridID);
               }
               
            }
        })
        $(".<%=layerName%> #excelLbrUpload").val("");
	});
});

//AUIGrid 를 생성합니다.
function <%=layerName%>createAUIGrid(columnLayout) {
	var <%=layerName%>auiGridProps = {
		// 체크박스
		showRowCheckColumn : false,
		rowHeight : 38,
		headerHeight : 38,
		noDataMessage : "조회된 내용이 없습니다."
		
	};
	
	// 실제로 #grid_wrap 에 그리드 생성
	<%=layerName%>myGridID = AUIGrid.create("#<%=layerName%>grid_wrap", columnLayout, <%=layerName%>auiGridProps);
}


//AUIGrid 를 생성합니다.
function <%=layerName%>createAUIGrid2(columnLayout) {
	var <%=layerName%>auiGridProps = {
		// 체크박스
		showRowCheckColumn : false,
		showRowNumColumn : false
		
	};
	
	// 실제로 #grid_wrap 에 그리드 생성
	<%=layerName%>myGridID2 = AUIGrid.create("#<%=layerName%>grid_Excelwrap", columnLayout, <%=layerName%>auiGridProps);
}

//AUIGrid 를 생성합니다.
function <%=layerName%>createAUIGrid3(columnLayout) {
	var <%=layerName%>auiGridProps = {
		// 체크박스
		showRowCheckColumn : false,
		showRowNumColumn : false
		
	};
	
	// 실제로 #grid_wrap 에 그리드 생성
	<%=layerName%>myGridID3 = AUIGrid.create("#<%=layerName%>grid_ExcelErrorwrap", columnLayout, <%=layerName%>auiGridProps);
}


function <%=layerName%>excelDownload(){
	AUIGrid.exportToXlsx(<%=layerName%>myGridID2, {
		exportWithStyle : true,
		fileName  : "도서목록_양식_Excel"
	});
}

//확정
function <%=layerName%>excelLbrConfirm(){
			
	   var sendData = AUIGrid.getGridData(<%=layerName%>myGridID);
	   
	   if(sendData == null || sendData == ""){
		   GRIT.msg.alert("확정할 데이터가 없습니다.");
		   return;
	   }
	   
	   
	   if(!confirm("확정 하시겠습니까?")){
			return false;
       }
	   
	  // ajax 요청 전 그리드에 로더 표시
	  
	  AUIGrid.showAjaxLoader(<%=layerName%>myGridID);
	  
	  setTimeout(function(){
		  GRIT.tran.send({
				url: "/pgm/confirmLbrryBook",
				async: false,
				sendData: sendData,
				success: function(result){
					if(result.rtnCode == "0"){
						GRIT.msg.alert(result.message);
						AUIGrid.setGridData(<%=layerName%>myGridID, []);
						 $(".<%=layerName%> #excelLbrUpload").val("");
					}else if(result.rtnCode == "-1"){
						GRIT.msg.alert(result.message);
						AUIGrid.setGridData(<%=layerName%>myGridID, []);
						$(".<%=layerName%> #excelLbrUpload").val("");
					}else{
						GRIT.msg.alert(result.message);
					}
					
					// 로더 제거
					AUIGrid.removeAjaxLoader(<%=layerName%>myGridID);
				},
					loadingTarget: "<%=layerName%>"
				});  
	  }, 20);
}



</script>
