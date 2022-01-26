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
                    <h1>공공데이터 생성</h1>
					<jsp:include page="../common/commonBtn.jsp">
						<jsp:param value="<%=layerName%>" name="layerName" />
					</jsp:include>                    
                </div>
                <!-- titleWrap : end -->

				<!-- layout table : start -->
				<form name="<%=layerName%>linkedOpenDataForm" id="linkedOpenDataForm" method="post" >
					<input type="hidden" id="tabGb" name="tabGb" value="0"/>
                            
                <!-- layout table : start -->
                <table class="layoutTable">
                    <tr>
                        <td>
                           <div class="subtitleGroup">
                                <div class="subtitle">공공데이터 리스트</div>
                           </div>
                           <div id="tabWrapper1" class="tabWrapper">
	                           <div class="tabBtnWrap">
	                              <div class="tabBtnGroup">
	                                  <div id="tab1" class="tabBtn active">운영주체</div>
	                                  <div id="tab2" class="tabBtn">복지시설</div>
	                                  <div id="tab3" class="tabBtn">프로그램</div>
	                                  <div id="tab4" class="tabBtn">종사자</div>
	                                  <div id="tab5" class="tabBtn">장애인</div>
	                              </div>
	                            </div>
                            
                              <div class="tabGroup">
                                    <div class="tabContents">
                             			<div id="<%=layerName%>grid_wrap" style="height: 660px;"></div>
                             			<div id="<%=layerName%>excelGrid_wrap" style="height: 660px;display: none;"></div>  
                                    </div>
                                   
                                   <div class="tabContents">
                             			<div id="<%=layerName%>grid_wrap1" style="height: 660px;"></div>
                             			<div id="<%=layerName%>excelGrid_wrap1" style="height: 660px;display: none;"></div> 
                                    </div>
                                    
                                    <div class="tabContents">
                             			<div id="<%=layerName%>grid_wrap2" style="height: 660px;"></div>
                             			<div id="<%=layerName%>excelGrid_wrap2" style="height: 660px;display: none;"></div> 
                                    </div>
                                    
                                    <div class="tabContents">
                             			<div id="<%=layerName%>grid_wrap3" style="height: 660px;"></div>
                                    </div>
                                    
                                    <div class="tabContents">
                             			<div id="<%=layerName%>grid_wrap4" style="height: 660px;"></div>
                                    </div>
                              </div>
                           </div> 
                        </td>
                    </tr>
                </table>
                <!-- layout table : end -->


<style>
	.tabBtnGroup {border-bottom: none;}
</style>
<script type="text/javascript" >
	// 조회 클릭시
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .search').click(function(){
		<%=layerName%>loadData();
	});
	
	//엑셀
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .exel').click(function(){
		<%=layerName%>exportTo();
	});
	
	// 닫기
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .close').click(function(){
		mFnc.tabMenuClose('<%=layerName%>');
	});
	
	
	// AUIGrid 생성 후 반환 ID
	var <%=layerName%>myGridID;
	var <%=layerName%>myGridID1;
	var <%=layerName%>myGridID2;
	var <%=layerName%>myGridID3;
	var <%=layerName%>myGridID4;
	
	// AUIGrid 생성 후 반환 ID(excel)
	var <%=layerName%>myExcelGridID;
	var <%=layerName%>myExcelGridID1;
	var <%=layerName%>myExcelGridID2;
	
	// AUIGrid 칼럼 설정
	var <%=layerName%>columnLayout1  = [ 
        {dataField : "ognztCd"          ,headerText : "단체코드"        ,width : "6%"}
       ,{dataField : "ognztNm"          ,headerText : "단체명"         ,width : "17%",  style : "my-column-left"}
       ,{dataField : "ognztGb"          ,headerText : "운영주체구분"     ,width : "7%",  style : "my-column-left"} 
       ,{dataField : "rprsntvNm"        ,headerText : "대표자명"        ,width : "7%", style : "my-column-left"}
       ,{dataField : "phoneNum1"        ,headerText : "전화번호1"       ,width : "7%",  style : "my-column-left"}
       ,{dataField : "phoneNum2"        ,headerText : "전화번호2"       ,width : "7%", style : "my-column-left"}
       ,{dataField : "faxNum"           ,headerText : "팩스번호"        ,width : "7%", style : "my-column-left"}
       ,{dataField : "zipCd"            ,headerText : "우편번호"        ,width : "5%" }
       ,{dataField : "addr"             ,headerText : "도로명주소"       ,width : "18%",  style : "my-column-left"}
       ,{dataField : "establishDd"      ,headerText : "설립일자"       ,width : "6%"}
       ,{dataField : "executiveDetail"  ,headerText : "임직원내역"       ,width : "7%",  style : "my-column-left"}
       ,{dataField : "wffcltyOperFg"    ,headerText : "운영여부"         ,width : "6%"}
       ];
	
	var <%=layerName%>columnLayout2  = [ 
	    {dataField : "wffcltyCd"     ,headerText : "복지시설코드"       ,width : "8%"}
	   ,{dataField : "wffcltyNm"     ,headerText : "복지시설명"        ,width : "15%", style : "my-column-left"}
	   ,{dataField : "wffcltyClas"   ,headerText : "복지시설 분류코드"   ,width : "9%"} 
	   ,{dataField : "wffcltyClasCd" ,headerText : "복지시설 분류명"     ,width : "10%", style : "my-column-left"}
	   ,{dataField : "wffcltyTp"     ,headerText : "복지시설 유형코드"   ,width : "9%"}
	   ,{dataField : "wffcltyTpNm"   ,headerText : "복지시설 유형명"     ,width : "13%", style : "my-column-left"}
	   ,{dataField : "uniqueNo"      ,headerText : "고유번호"          ,width : "7%"}
	   ,{dataField : "intendantNm"   ,headerText : "시설장명"          ,width : "7%", style : "my-column-left"}
	   ,{dataField : "ognztCd"       ,headerText : "운영주체코드"       ,width : "9%"}
	   ,{dataField : "ognztNm"       ,headerText : "운영주체명"        ,width : "10%", style : "my-column-left"}
	   ,{dataField : "phoneNum"      ,headerText : "전화번호"          ,width : "7%"}
	   ,{dataField : "faxNum"        ,headerText : "팩스번호"          ,width : "7%"}
	   ,{dataField : "addr"          ,headerText : "도로명주소"        ,width : "10%", style : "my-column-left"}
	   ,{dataField : "guCd"          ,headerText : "시군구코드"        ,width : "6%"}
	   ,{dataField : "guNm"          ,headerText : "시군구명"          ,width : "6%", style : "my-column-left"}
	   ,{dataField : "establishDd"   ,headerText : "설립일자"          ,width : "6%"}
	   ,{dataField : "homepageUrl"   ,headerText : "웹사이트URL"       ,width : "15%", style : "my-column-left"}
	   ,{dataField : "worker"        ,headerText : "종사자내역"        ,width : "10%", style : "my-column-left"}
	   ,{dataField : "disableType"   ,headerText : "서비스장애유형"     ,width : "10%", style : "my-column-left"}
	   ,{dataField : "capacity"      ,headerText : "정원"            ,width : "6%", style : "my-column-right" , dataType : "numeric" ,formatString : "#,##0"}
	   ,{dataField : "area"          ,headerText : "면적"            ,width : "6%", style : "my-column-left"}
	   ,{dataField : "servicePlace"  ,headerText : "서비스공간"        ,width : "6%", style : "my-column-left"}
	   
	   ];
	var <%=layerName%>columnLayout3  = [ 
        {dataField : "wffcltyCd"     ,headerText : "복지시설코드"       ,width : "9%"}
  	   ,{dataField : "wffcltyNm"     ,headerText : "복지시설명"         ,width : "15%", style : "my-column-left"}
  	   ,{dataField : "wffcltyClas"   ,headerText : "복지시설 분류코드"    ,width : "9%"} 
  	   ,{dataField : "wffcltyClasCd" ,headerText : "복지시설 분류명"     ,width : "10%", style : "my-column-left"}
  	   ,{dataField : "wffcltyTp"     ,headerText : "복지시설 유형코드"   ,width : "9%"}
  	   ,{dataField : "wffcltyTpNm"   ,headerText : "복지시설 유형명"     ,width : "13%", style : "my-column-left"}
  	   ,{dataField : "programCd"     ,headerText : "프로그램코드"       ,width : "8%"}
  	   ,{dataField : "programNm"     ,headerText : "프로그램명"        ,width : 150, style : "my-column-left"}
       ,{dataField : "programDetail" ,headerText : "프로그램설명"      ,width : 150, style : "my-column-left"}
  	   ,{dataField : "trgterDetail"  ,headerText : "신청자격 내역"      ,width : 150, style : "my-column-left"}
  	   ,{dataField : "timeDetail"    ,headerText : "운영 시간 내역"     ,width : 150, style : "my-column-left"}
  	   ,{dataField : "feeDetail"     ,headerText : "이용료 내역"       ,width : 150, style : "my-column-left"}
       ];
	var <%=layerName%>columnLayout4  = [ 
        {dataField : "wffcltyCd"     ,headerText : "복지시설코드"       ,width : "8%"}
   	   ,{dataField : "wffcltyNm"     ,headerText : "복지시설명"         ,width : "18%", style : "my-column-left"}
   	   ,{dataField : "wffcltyClas"   ,headerText : "복지시설 분류코드"    ,width : "9%"} 
   	   ,{dataField : "wffcltyClasCd" ,headerText : "복지시설 분류명"     ,width : "16%", style : "my-column-left"}
   	   ,{dataField : "wffcltyTp"     ,headerText : "복지시설 유형코드"    ,width : "9%"}
   	   ,{dataField : "wffcltyTpNm"   ,headerText : "복지시설 유형명"     ,width : "14%", style : "my-column-left"}
   	   ,{dataField : "workerId"      ,headerText : "종사자코드"         ,width : "8%"}
   	   ,{dataField : "jobPosition"   ,headerText : "직위명"            ,width : "12%", style : "my-column-left"}
   	   ,{dataField : "disableHaveFg" ,headerText : "장애여부"           ,width : "8%"}
       ];
	var <%=layerName%>columnLayout5  = [ 
        {dataField : "dspsnId"         ,headerText : "장애인코드"      ,width : "9%"}
       ,{dataField : "gender"          ,headerText : "성별"          ,width : "9%"}
       ,{dataField : "guaranteeFg"     ,headerText : "보장자격"       ,width : "13%", style : "my-column-left"} 
       ,{dataField : "disableTp"       ,headerText : "장애유형"       ,width : "11%", style : "my-column-left"}
       ,{dataField : "disableDgreeFg"  ,headerText : "장애정도"       ,width : "10%", style : "my-column-left"}
       ,{dataField : "outbreakTimeFg"  ,headerText : "장애발생시기"    ,width : "10%"}
       ,{dataField : "outbreakRsnFg"   ,headerText : "장애발생사유"    ,width : "10%"}
       ,{dataField : "wffcltyNm"   ,headerText : "복지시설명"    ,width : "28%"}
       ];
	
	$(function () {	
		// AUIGrid 그리드를 생성합니다.
		<%=layerName%>createAUIGrid1(<%=layerName%>columnLayout1);
		<%=layerName%>createAUIGrid2(<%=layerName%>columnLayout2);
		<%=layerName%>createAUIGrid3(<%=layerName%>columnLayout3);
		<%=layerName%>createAUIGrid4(<%=layerName%>columnLayout4);
		<%=layerName%>createAUIGrid5(<%=layerName%>columnLayout5);
		
		
		
		//tab button
	    $(".tabBtn").on("click", function () {
	        var tabIndex = $(this).index();
			$(".<%=layerName%> #tabGb").val(tabIndex);
			
	        $(this).siblings().removeClass("active");
	        $(this).addClass("active");
	        $(this).parents(".tabWrapper").find(".tabContents").hide();
	        $(this).parents(".tabWrapper").find(".tabContents").eq(tabIndex).show();
	        
	        
	        AUIGrid.resize("#<%=layerName%>grid_wrap");
			AUIGrid.resize("#<%=layerName%>grid_wrap1");
			AUIGrid.resize("#<%=layerName%>grid_wrap2");
			AUIGrid.resize("#<%=layerName%>grid_wrap3");
			AUIGrid.resize("#<%=layerName%>grid_wrap4");
			
	    });
	});
	

	// AUIGrid 를 생성합니다.
	function <%=layerName%>createAUIGrid1(columnLayout) {
		
		var <%=layerName%>auiGridProps = {
			showRowCheckColumn : false,
			noDataMessage : "조회된 내용이 없습니다.",
			rowHeight : 38,
			headerHeight : 38
		
			
		};
		
		// 실제로 #grid_wrap 에 그리드 생성
		<%=layerName%>myGridID = AUIGrid.create("#<%=layerName%>grid_wrap", columnLayout, <%=layerName%>auiGridProps);
		<%=layerName%>myExcelGridID = AUIGrid.create("#<%=layerName%>excelGrid_wrap", columnLayout, <%=layerName%>auiGridProps);
	}
	
	function <%=layerName%>createAUIGrid2(columnLayout) {
		
		var <%=layerName%>auiGridProps = {
			showRowCheckColumn : false,
			noDataMessage : "조회된 내용이 없습니다.",
			rowHeight : 38,
			headerHeight : 38
		};
		
		// 실제로 #grid_wrap 에 그리드 생성
		<%=layerName%>myGridID1 = AUIGrid.create("#<%=layerName%>grid_wrap1", columnLayout, <%=layerName%>auiGridProps);
		<%=layerName%>myExcelGridID1 = AUIGrid.create("#<%=layerName%>excelGrid_wrap1", columnLayout, <%=layerName%>auiGridProps);
		
	}

	function <%=layerName%>createAUIGrid3(columnLayout) {
		
		var <%=layerName%>auiGridProps = {
			showRowCheckColumn : false,
			noDataMessage : "조회된 내용이 없습니다.",
			rowHeight : 38,
			headerHeight : 38
		};
		
		// 실제로 #grid_wrap 에 그리드 생성
		<%=layerName%>myGridID2 = AUIGrid.create("#<%=layerName%>grid_wrap2", columnLayout, <%=layerName%>auiGridProps);
		<%=layerName%>myExcelGridID2 = AUIGrid.create("#<%=layerName%>excelGrid_wrap2", columnLayout, <%=layerName%>auiGridProps);
	}

	function <%=layerName%>createAUIGrid4(columnLayout) {
		
		var <%=layerName%>auiGridProps = {
			showRowCheckColumn : false,
			noDataMessage : "조회된 내용이 없습니다.",
			rowHeight : 38,
			headerHeight : 38
		};
		
		// 실제로 #grid_wrap 에 그리드 생성
		<%=layerName%>myGridID3 = AUIGrid.create("#<%=layerName%>grid_wrap3", columnLayout, <%=layerName%>auiGridProps);
	}

	function <%=layerName%>createAUIGrid5(columnLayout) {
		
		var <%=layerName%>auiGridProps = {
			showRowCheckColumn : false,
			noDataMessage : "조회된 내용이 없습니다.",
			rowHeight : 38,
			headerHeight : 38
		};
		
		// 실제로 0#grid_wrap 에 그리드 생성
		<%=layerName%>myGridID4 = AUIGrid.create("#<%=layerName%>grid_wrap4", columnLayout, <%=layerName%>auiGridProps);
	}


	
	//조회
	function <%=layerName%>loadData () {			
		
		var tabGb = <%=layerName%>linkedOpenDataForm.tabGb.value;

		var sendData = {"tabGb"      : tabGb};
		
		// ajax 요청 전 그리드에 로더 표시
		if(tabGb == "0"){
			AUIGrid.showAjaxLoader(<%=layerName%>myGridID);
		}else if (tabGb == "1"){
			AUIGrid.showAjaxLoader(<%=layerName%>myGridID1);
		}else if (tabGb == "2"){
			AUIGrid.showAjaxLoader(<%=layerName%>myGridID2);	
		}else if (tabGb == "3"){
			AUIGrid.showAjaxLoader(<%=layerName%>myGridID3);
		}else{
			AUIGrid.showAjaxLoader(<%=layerName%>myGridID4);
		}
		
		GRIT.tran.send({
			url: "/sys/selectLinkOpenDataList",
			sendData: sendData,
			success: function(result){
				// 그리드에 데이터 세팅
				// resData 는 JSON 을 파싱한 Array-Object 입니다.
				
				if(tabGb == "0"){
					AUIGrid.setGridData(<%=layerName%>myGridID, result.data);
					AUIGrid.removeAjaxLoader(<%=layerName%>myGridID);
					
					// 엑셀
					AUIGrid.setGridData(<%=layerName%>myExcelGridID, result.data);
				    var colSize = AUIGrid.getFitColumnSizeList(<%=layerName%>myGridID,true);
			
					for (var i = 0; i < colSize.length; i++) {
						var count = i;
						if(count == 1 || count == 10){
							colSize[count] += 50;	
						}else if(count == 8){
							colSize[count] += 150;
						}else{
							colSize[count] += 30;
						}
					}
					
					AUIGrid.setColumnSizeList(<%=layerName%>myExcelGridID, colSize);
					
				}else if (tabGb == "1"){
					AUIGrid.setGridData(<%=layerName%>myGridID1, result.data);
					AUIGrid.removeAjaxLoader(<%=layerName%>myGridID1);
					
					// 엑셀
					AUIGrid.setGridData(<%=layerName%>myExcelGridID1, result.data);
					var colSize = AUIGrid.getFitColumnSizeList(<%=layerName%>myGridID1,true);
					
					for (var i = 0; i < colSize.length; i++) {
						var count = i;
						if(count == 1){
							colSize[count] += 50;
						}else if(count == 9 || count == 12 || count == 16  || count == 18 || count == 20 || count == 21){
							colSize[count] += 150;	
						}else if(count == 17){
							colSize[count] += 160;
						}else{
							colSize[count] += 30;
						}
					}
					
					AUIGrid.setColumnSizeList(<%=layerName%>myExcelGridID1, colSize);
					
				}else if (tabGb == "2"){
					
					AUIGrid.setGridData(<%=layerName%>myGridID2, result.data);
					AUIGrid.removeAjaxLoader(<%=layerName%>myGridID2);
					
					// 엑셀
					AUIGrid.setGridData(<%=layerName%>myExcelGridID2, result.data);
					var colSize = AUIGrid.getFitColumnSizeList(<%=layerName%>myGridID2,true);
					
					for (var i = 0; i < colSize.length; i++) {
						var count = i;
						if(count == 8){
							colSize[count] += 200;
						}else if(count == 9 || count == 10 || count == 11){
							colSize[count] += 160;
						}else{
							colSize[count] += 50;
						}
					}
					
					AUIGrid.setColumnSizeList(<%=layerName%>myExcelGridID2, colSize);
				
				}else if (tabGb == "3"){
					AUIGrid.setGridData(<%=layerName%>myGridID3, result.data);
					AUIGrid.removeAjaxLoader(<%=layerName%>myGridID3);
				}else{
					AUIGrid.setGridData(<%=layerName%>myGridID4, result.data);
					AUIGrid.removeAjaxLoader(<%=layerName%>myGridID4);
				}
				
		
	 			
			},
			error: function(request, status, error){
				if(tabGb == "0"){
					GRIT.msg.alert("운영주체 조회하는데 문제가 발생했습니다.");
					AUIGrid.removeAjaxLoader(<%=layerName%>myGridID);
				}else if (tabGb == "1"){
					GRIT.msg.alert("복지시설 조회하는데 문제가 발생했습니다.");
					AUIGrid.removeAjaxLoader(<%=layerName%>myGridID1);
				}else if (tabGb == "2"){
					GRIT.msg.alert("프로그램 조회하는데 문제가 발생했습니다.");
					AUIGrid.removeAjaxLoader(<%=layerName%>myGridID2);
				}else if (tabGb == "3"){
					GRIT.msg.alert("종사자 조회하는데 문제가 발생했습니다.");
					AUIGrid.removeAjaxLoader(<%=layerName%>myGridID3);
				}else{
					GRIT.msg.alert("장애인 조회하는데 문제가 발생했습니다.");
					AUIGrid.removeAjaxLoader(<%=layerName%>myGridID4);
				}
			},
			loading : false
		});
	}
	
	
	function <%=layerName%>exportTo(){
		
		var yyyymmdd = getyyyymmdd();
		
		var tabGb = $(".<%=layerName%> #tabGb").val();
		
		if(tabGb == "0"){

			var grdList = AUIGrid.getGridData(<%=layerName%>myGridID);
			
			if(grdList.length == 0){
				GRIT.msg.alert("운영주체 조회된 내용이 없습니다.");
				return false;
			}
			
			AUIGrid.exportToXlsx(<%=layerName%>myExcelGridID, {
				fileName : "인천광역시_장애인복지운영주체정보_"+yyyymmdd
			});
		}else if (tabGb == "1"){
			
			var grdList = AUIGrid.getGridData(<%=layerName%>myGridID1);
			
			if(grdList.length == 0){
				GRIT.msg.alert("복지시설 조회된 내용이 없습니다.");
				return false;
			}
			
			AUIGrid.exportToXlsx(<%=layerName%>myExcelGridID1, {
				fileName : "인천광역시_장애인복지시설정보_"+yyyymmdd
			});
		}else if (tabGb == "2"){
			
			var grdList = AUIGrid.getGridData(<%=layerName%>myGridID2);
			
			if(grdList.length == 0){
				GRIT.msg.alert("프로그램 조회된 내용이 없습니다.");
				return false;
			}
			
			AUIGrid.exportToXlsx(<%=layerName%>myExcelGridID2, {
				fileName : "인천광역시_운영프로그램정보_"+yyyymmdd
			});
		}else if (tabGb == "3"){
			
			var grdList = AUIGrid.getGridData(<%=layerName%>myGridID3);
				
			if(grdList.length == 0){
				GRIT.msg.alert("종사자 조회된 내용이 없습니다.");
				return false;
			}
			
			AUIGrid.exportToXlsx(<%=layerName%>myGridID3, {
				fileName : "인천광역시_장애인복지시설종사자정보_"+yyyymmdd
			});
		}else{
			
			var grdList = AUIGrid.getGridData(<%=layerName%>myGridID4);
			
			if(grdList.length == 0){
				GRIT.msg.alert("장애인 조회된 내용이 없습니다.");
				return false;
			}
			
			AUIGrid.exportToXlsx(<%=layerName%>myGridID4, {
				fileName : "인천광역시_장애인복지시설이용장애인정보_"+yyyymmdd
			});
		}
	}
</script>

