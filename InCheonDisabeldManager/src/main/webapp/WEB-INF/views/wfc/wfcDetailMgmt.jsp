<%@ page import="kr.co.grit.common.util.SessionUtil"%>
<%@ page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
                    <h1>복지시설 상세관리</h1>
					<jsp:include page="../common/commonBtn.jsp">
						<jsp:param value="<%=layerName%>" name="layerName" />
					</jsp:include>                    
                </div>
                <!-- titleWrap : end -->

                <!-- conditionTable : start -->
                <table class="dataTable marginT10">
                    <colgroup>
                        <col style="width:140px">
                        <col style="width:140px">
                        <col style="width:140px">
                        <col style="width:auto">
                        <col style="width:140px">
                        <col style="width:140px">
                        <col style="width:140px">
                        <col style="width:140px">
                    </colgroup>
                    <tbody>
                        <tr>
                        <h2>시설 기본 정보</h2>
                            <th>시설코드</th>
                            <td>
                            	<input type="text" id="wffcltyCd" name="wffcltyCd" value="${wffcltyBaseList.wffcltyCd}"  title="시설코드" disabled>
                            </td>
                            <th>시설명</th>
                            <td>
                            	<input type="text" id="wffcltyNm" name="wffcltyNm" value="${wffcltyBaseList.wffcltyNm}"  style="width: 100%" title="시설명" disabled>
                            </td>
                            <th>시설유형</th>
                            <td>
                            	<input type="text" id="wffcltyTpNm" name="wffcltyTpNm" value="${wffcltyBaseList.wffcltyTpNm}"  title="시설유형" disabled>
                            </td>
                            <th>운영단체</th>
                            <td>
                            	<input type="text" id="ognztNm" name="ognztNm" value="${wffcltyBaseList.ognztNm}" title="운영단체" disabled>
                            </td>
                        </tr>
                        
                        <tr>
                        	<c:choose>   
                            <c:when  test="${wffcltyBaseList.wffcltyTp eq 'B03' or wffcltyBaseList.wffcltyTp eq 'D05'}">
	                            <th>고유번호</th>
	                            <td>
	                            	<input type="text" id="uniqueNo" name="uniqueNo" value="${wffcltyBaseList.uniqueNo}"  title="고유번호" disabled>
	                            </td>
	                            <th>본부/센터</th>
	                            <td>
	                            	<input type="text" id="highWffcltyNm" name="highWffcltyNm" value="${wffcltyBaseList.highWffcltyNm}" style="width: 100%"  title="본부/센터" disabled>
	                            </td>	 
                            </c:when>
                            
                            <c:when test="${wffcltyBaseList.wffcltyTp ne 'B03' or wffcltyBaseList.wffcltyTp ne 'D05'}">
	                            <th>고유번호</th> 
	                            <td colspan="3">
	                            	<input type="text" id="uniqueNo" name="uniqueNo" value="${wffcltyBaseList.uniqueNo}"  title="고유번호" disabled>
	                            </td>
                            </c:when>
                             
                            </c:choose>
                             
                            <th>운영여부</th>
                            <td>
                            	<input type="text" id="operateFg" name="operateFg" value="${wffcltyBaseList.operateFg}" title="운영여부" tabindex="1" disabled>
                            </td>
                            <th>사용여부</th>
                            <td>
                            	<input type="text" id="useFg" name="useFg" value="${wffcltyBaseList.useFg}" title="사용여부" tabindex="1" disabled>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <!-- conditionTable : end -->

                <!-- layout table : start -->
                <table class="layoutTable">
                    <colgroup>
                        <col style="width:auto;">
                        <col style="width:10px;">
                        <col style="width:375px;">
                    </colgroup>
                    <tr>
                        <td>
                           <div class="subtitleGroup">
                                <div class="subtitle">시설 상세 정보</div>
                                <div class="submsg"><font class="font-color">＊ 시설 상세정보가 없습니다. 등록해주세요.</font></div>
                           </div>
                             <form name="detailForm" id="detailForm" method="post" autocomplete="off">
								<table cellpadding="0" cellspacing="0" class="dataTable" id="align_common" border="1">
								 		<input type="hidden" id="saveMode"         name="saveMode"         value="" /> 
										<input type="hidden" id="wffcltyCd"        name="wffcltyCd"        value="${wffcltyBaseList.wffcltyCd }" />
										<input type="hidden" id="wffcltyTp"        name="wffcltyTp"        value="${wffcltyBaseList.wffcltyTp }" />
										<input type="hidden" id="wffcltyListCount" name="wffcltyListCount" value="" />
										<input type="hidden" id="guCd"             name="guCd"             value="" />
										<input type="hidden" id="checkGovsubyFg"   name="checkGovsubyFg"   value="${wffcltyDetailList.govsubyFg}">
										<input type="hidden" id="checkCitsubyFg"   name="checkCitsubyFg"   value="${wffcltyDetailList.citsubyFg}">
										<input type="hidden" id="checkGusubyFg"    name="checkGusubyFg"    value="${wffcltyDetailList.gusubyFg}">
				                        
									<colgroup>
										<col style="width:140px">
                                        <col style="width:auto">
                                        <col style="width:140px">
                                        <col style="width:auto">
									</colgroup>
									<tr>
										<th><span class="essentialItem">우편번호<span></th>
										<td colspan="3">
											<input type="text" id="zipCd" name="zipCd" style="width:30%; text-align: left;"  title="우편번호" readonly> 
											<button type="button" class="normalBtn" onclick="goPopup();">주소검색</button>
										</td>
	
									</tr>
									<tr>
										<th><span class="essentialItem">기본주소<span></th>
										<td colspan="3">
											<input type="text" id="addrBase" name="addrBase" style="width: 100%; text-align: left;"  title="기본주소" readonly>
										</td>
									</tr>
									<tr>
										<th>상세주소</th>
										<td colspan="3">
											<input type="text" id="addrDetail" name="addrDetail" style="width: 100%; text-align: left;" onkeyup="checkByte(this, 100)" tabindex="1" onkeydown="<%=layerName%>EnterFilter('phoneNum');">
										</td>
									</tr>
									<tr>
										<th>연락처</th>
										<td>
											<input type="text" id="phoneNum" name="phoneNum"  style="width: 100%" text-align: left;" title="연락처"  tabindex="1" maxlength="11"  onkeyup="removeChar(event)" onkeydown="<%=layerName%>EnterFilter('faxNum');">
										<th>팩스번호</th>
										<td>
											<input type="text" id="faxNum" name="faxNum"  style="width: 100%" text-align: left;" title="팩스번호"  tabindex="1" maxlength="20" onkeyup="removeChar(event)" onkeydown="<%=layerName%>EnterFilter('intendantNm');">
										</td>
									</tr>
									<tr>
										<th class="intendantNm-change-text">시설장</th>
										<td>
											<input type="text" id="intendantNm" name="intendantNm"  style="width: 100%" text-align: left;" title="시설장"  tabindex="1" onkeyup="checkByte(this, 40)" onkeydown="<%=layerName%>EnterFilter('establishDd');">
										</td>
										<th>설립일자</th>
										<td>
											<input type="text" id="establishDd" name="establishDd" style="width: 91%;" class="datepicker hover_disabled" onKeyup="inputYMDNumber(this);" onblur="<%=layerName%>checkDate(this.value);"  tabindex="1" onkeydown="<%=layerName%>EnterFilter('workerCnt');"></td>
									</tr>
									<tr>
										<th>종사자</th>
										<td style="border-right: none;">
											<input type="text" id="workerCnt" name="workerCnt"  style="width:95.1%; text-align: right;" title="종사자" maxlength="4"  onkeyup="removeChar(event);fn_comma(this);" tabindex="1" onkeydown="<%=layerName%>EnterFilter('workerDetail');"> 명
										</td>
										<td colspan="2" style="border-left: none;"></td>
									</tr>
									<tr>
										<th>종사자내역</th>
										<td colspan="3">
											<input type="text" id="workerDetail" name="workerDetail" style="width: 100%; text-align: left;" title="종사자내역" tabindex="1" onkeyup="checkByte(this, 100)" onkeydown="<%=layerName%>EnterFilter('homepageUrl');">
										</td>
									</tr>
									<tr>
										<th>웹사이트</th>
										<td colspan="3">
											<input type="text" id="homepageUrl" name="homepageUrl" style="width: 100%; text-align: left;" title="웹사이트" tabindex="1" onkeyup="checkByte(this, 80)" onkeydown="<%=layerName%>EnterFilter('govsubyFg');">
										</td>
									</tr>
								</table>
						    </form> 
                        </td>
                        <td>&nbsp;</td>
                        <td>
                             <div class="subtitleGroup">
                                <div class="subtitle">서비스 장애</div>

                                <div class="subBtnGroup">
                                    <button type="button"  class="subBtn" onClick="<%=layerName%>addDisableRow();"><img src="/resources/imagesV2/iconPlusBlue.png"  class="subBtnImg">추가</button>
                                    <button type="button"  class="subBtn" onClick="<%=layerName%>delDisableRow();"><img src="/resources/imagesV2/iconTrashBlue.png" class="subBtnImg">삭제</button>
                                </div>
                            </div>
                            <table class="dataTable">
                            	<div id="<%=layerName%>grid_wrap" style="height: 270px;"></div>
                            </table>
                             
                             <div class="subtitleGroup">
                                <div class="subtitle">시설 사진</div>

                                <div class="subBtnGroup">
                                    <button type="button"  class="subBtn" onClick="<%=layerName%>addPictureRow();" ><img src="/resources/imagesV2/iconPlusBlue.png"  class="subBtnImg">추가</button>
                                    <button type="button"  class="subBtn" onClick="<%=layerName%>delPictureRow();" ><img src="/resources/imagesV2/iconTrashBlue.png" class="subBtnImg">삭제</button>
                                </div>
                                <input type="file" id="file" name="file" accept="image/jpeg" style="visibility:hidden;" multiple></input>
                            </div>
                            
                            <table class="dataTable">
                            	<div id="<%=layerName%>grid_wrap2" style="height: 269px;"></div>
                            </table> 
                        </td>
                            
                    </tr>
                </table>
                <!-- layout table : end -->
<style>
	.submsg {float: right; margin-top: 10px; display: none; }
	.submsg .font-color{color: #FF0000;}
</style>
<script type="text/javascript">
	
	// 저장
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .save').click(function(){
		<%=layerName%>fn_saveWffDetail();
	});
	
	
	// 닫기
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .close').click(function(){
		mFnc.tabMenuClose('<%=layerName%>');
	});
	
	
	//AUIGrid 생성 후 반환 ID
	var <%=layerName%>myGridID;
	var <%=layerName%>myGridID2;
	
	//파일 저장 캐시
	var <%=layerName%>myFileCaches = {};
	var <%=layerName%>recentGridItem = null;
	
    // 장애유형 배열 선언
	var disableArr = new Array();
    
	// 장애유형 배열 선언
	var setDisableArr = new Array();

	// AUIGrid 칼럼 설정
	var <%=layerName%>columnLayout = [ 
	    {dataField : "disableTp"         ,headerText : "장애유형"     ,width : "30%", style : "my-column-center"
		    	,labelFunction : function(  rowIndex, columnIndex, value, headerText, item ) {
		    		  var retStr = (typeof value == "undefined") ? "" : value;
		    		  for(var i=0,len=disableArr.length; i<len; i++) {
		    		   	if(disableArr[i]["disableTp"] == value) {
		    		    	retStr = disableArr[i]["disableTpNm"];
		    		    	break;
		    		   	}
		    		  }
		    		  return retStr;
		    	 	}
	    		 ,editRenderer : {
	    		  type : "DropDownListRenderer",
	    		  showEditorBtnOver : true,
	    		  list : disableArr, 
	    		  keyField : "disableTp", 
	    		  valueField : "disableTpNm"
	    		 }
	     }
	    ,{dataField : "disableDetail"  ,headerText : "상세"     ,width : "70%", style : "my-column-left",
	    	editRenderer : {
	    		type : "InputEditRenderer",
	    		validator : function(oldValue, newValue, item) {
	    			var isValid = false;
	    			var valueSize = getByteB(newValue);
	    			
	    			if(valueSize < 50){
	    				isValid = true;
	    			}
	    			return { "validate" : isValid, "message"  : "한글은 최대 13글자/영문,숫자는 최대 50글자 입니다." };
	    		}
	    	}
	    }
	    ,{dataField : "wffcltyCd"      ,headerText : "복지시설코드"  ,width : 0 , visible : false}
	    ,{dataField : "status"         ,headerText : "상태값"    ,width : 0, visible : false}
	    ];
	
	// AUIGrid 칼럼 설정
	var <%=layerName%>columnLayout2 = [ 
		{dataField : "pictureNm"      ,headerText : "선택파일명"    ,width : "65%", style : "my-column-center"
			,labelFunction : function( rowIndex, columnIndex, value, headerText, item ) {
				if(typeof value == "undefined" || value == "") {
					return "선택 파일 없음";
				}
				return value;
			}	
		 } 
	    ,{dataField : "null"           ,headerText : "파일" ,width : "35%"
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
		,{dataField : "picturePath"    ,headerText : "파일저장위치"  ,width : 0 , visible : false}
		,{dataField : "pictureRealNm"  ,headerText : "실제파일명"    ,width : 50 , visible : false}
	    ,{dataField : "status"         ,headerText : "상태값"       ,width : 0, visible : false}
	    ];

	
	// 페이지 로딩 되면 실행
	$(function () {
		$(".<%=layerName%> .datepicker").datepicker({
	        changeMonth: true,
	        changeYear: true,
	        yearRange: year_range,
	        showOn: "both",
	        buttonImage: "/resources/images/btn_cal.png",
	        buttonImageOnly: true,
	        buttonText: "선택하세요",
	        inline: true,
	        duration: 300,
	        showAnim: "slideDown"
	    });
		
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
				pictureRealNm : <%=layerName%>recentGridItem.pictureRealNm,
				stats         : stats,
				file          : file
			};

			$(this).val("");
			
		});
		
		
	// AUIGrid 서비스 장애그리드를 생성합니다.
	<%=layerName%>createAUIGrid(<%=layerName%>columnLayout);
	
	// AUIGrid 시설사진 그리드를 생성합니다.
	<%=layerName%>createAUIGrid2(<%=layerName%>columnLayout2);
	
	// 장애유형 배열
	<%=layerName%>serviceDisableArr();
	
	// 시설 유형에 따른 상세정보
	<%=layerName%>setDetail();
	
	<%=layerName%>loadData();

	});
	

	
	//AUIGrid 서비스장애를 생성합니다.
	function <%=layerName%>createAUIGrid(columnLayout) {
		var <%=layerName%>auiGridProps = {
			editable : true,
			blankToNullOnEditing : true,
			softRemoveRowMode : false,
			wordWrap : false,
			rowHeight : 38,
			headerHeight : 38,
			noDataMessage : "조회된 내용이 없습니다."
			
		};
		
		// 실제로 #grid_wrap 에 그리드 생성
		<%=layerName%>myGridID = AUIGrid.create("#<%=layerName%>grid_wrap", columnLayout, <%=layerName%>auiGridProps);
	}
	
	//AUIGrid 시설사진을 생성합니다.
	function <%=layerName%>createAUIGrid2(columnLayout) {
		var <%=layerName%>auiGridProps = {
				rowIdField : "id",
				blankToNullOnEditing : true,
				softRemoveRowMode : false,
				wordWrap : false,
				rowHeight : 38,
				headerHeight : 38,
				noDataMessage : "조회된 내용이 없습니다."
		};
		
		// 실제로 #grid_wrap 에 그리드 생성
		<%=layerName%>myGridID2 = AUIGrid.create("#<%=layerName%>grid_wrap2", columnLayout, <%=layerName%>auiGridProps);
	}
	
	
	function <%=layerName%>subsidyCheckBox(){
		
		var govsubyFg = $(".<%=layerName%> #govsubyFg").val();
 		var citsubyFg = $(".<%=layerName%> #citsubyFg").val();
 		var gusubyFg  = $(".<%=layerName%> #gusubyFg").val();
 		
 		if(govsubyFg == "1"){
 			$(".<%=layerName%> #govsubyFg").prop('checked', true);
 		}else{
 			$(".<%=layerName%> #govsubyFg").prop('checked', false);
 			$(".<%=layerName%> #checkGovsubyFg").val('0');
 		}
 		
 		if(citsubyFg == "1"){
 			$(".<%=layerName%> #citsubyFg").prop('checked', true);
 		}else{
 			$(".<%=layerName%> #citsubyFg").prop('checked', false);
 			$(".<%=layerName%> #checkCitsubyFg").val('0');
 		}
 		
 		if(gusubyFg == "1"){
 			$(".<%=layerName%> #gusubyFg").prop('checked', true);
 		}else{
 			$(".<%=layerName%> #gusubyFg").prop('checked', false);
 			$(".<%=layerName%> #checkGusubyFg").val('0');
 		}
 		
	}
	
	// 날짜체크
 	function <%=layerName%>checkDate(obj){
 		
 		var yyyymmdd = obj.replace(/\-/g,'');
 		
 		//if(yyyymmdd.length)
 		
 		
		if(!GRIT.date.isValidDate(yyyymmdd)){
			GRIT.msg.alert("날짜형식이 잘못되었습니다.");
			$(".<%=layerName%> #establishDd").val("");
		}
 	}
 	
 	function goPopup(){
		// IE에서 opener관련 오류가 발생하는 경우, window에 이름을 명시해줍니다.
		window.name="jusoPopup";
		
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("/pop/jusoPop","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	}


	function jusoCallBack(addrBase, zipCd, rtAddrPart1, rtAddrDetail, 
			rtAddrPart2, rtEngAddr, rtJibunAddr, rtAdmCd, rtRnMgtSn, rtBdMgtSn, 
			rtDetBdNmList, rtBdNm, rtBdKdcd, rtSiNm, guCd){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		
		$(".<%=layerName%> #zipCd").val(zipCd);
		$(".<%=layerName%> #addrBase").val(addrBase);
		$(".<%=layerName%> #guCd").val(guCd);
	}
	
	// 시설소유 selectBox
	function <%=layerName%>fn_ownershipTp(value){
		var ownershipTp = value;
		
		if(ownershipTp == "E"){
			$(".<%=layerName%> #ownershipEtcDetail").attr('readonly', false);
		}else{
			$(".<%=layerName%> #ownershipEtcDetail").attr('readonly', true);
			$(".<%=layerName%> #ownershipEtcDetail").val("");
		}
	}

	// 수입제원 selectBox
	function <%=layerName%>fn_revenueSourceTp(value){
		var revenueSourceTp = value;
		
		if(revenueSourceTp == "E"){
			$(".<%=layerName%> #revenueEtcDetail").attr('readonly', false);
		}else{
			$(".<%=layerName%> #revenueEtcDetail").attr('readonly', true);
			$(".<%=layerName%> #revenueEtcDetail").val("");
		}
	}
	
	// 중식제공 selectBox
	function <%=layerName%>fn_lunchTp(value){
		var lunchTp = value;
		
		if(lunchTp == "E"){
			$(".<%=layerName%> #lunchEtcDetail").attr('readonly', false);
		}else{
			$(".<%=layerName%> #lunchEtcDetail").attr('readonly', true);
			$(".<%=layerName%> #lunchEtcDetail").val("");
		}
	}
	
	// 보조금 체크(국비)
	function <%=layerName%>govsubyFgCheckBox(){
		
 		if($(".<%=layerName%> input:checkbox[id='govsubyFg']").is(':checked') == true){
 			$(".<%=layerName%> #checkGovsubyFg").val('1');
 		}else{
 			$(".<%=layerName%> #checkGovsubyFg").val('0');
 		}
	}
	
	// 보조금 체크(시비)
	function <%=layerName%>citsubyFgCheckBox(){
		
 		if($(".<%=layerName%> input:checkbox[id='citsubyFg']").is(':checked') == true){
 			$(".<%=layerName%> #checkCitsubyFg").val('1');
 		}else{
 			$(".<%=layerName%> #checkCitsubyFg").val('0');
 		}
	}
	
	// 보조금 체크(군구비)
	function <%=layerName%>gusubyFgCheckBox(){
		
 		if($(".<%=layerName%> input:checkbox[id='gusubyFg']").is(':checked') == true){
 			$(".<%=layerName%> #checkGusubyFg").val('1');
 		}else{
 			$(".<%=layerName%> #checkGusubyFg").val('0');
 		}
	}
	
	function <%=layerName%>loadData() {
		
		//parameter
		var sendData = {"wffcltyCd" : $(".<%=layerName%> #detailForm").find( "#wffcltyCd").val()};
	
		// ajax 요청 전 그리드에 로더 표시
		AUIGrid.showAjaxLoader(<%=layerName%>myGridID);
		AUIGrid.showAjaxLoader(<%=layerName%>myGridID2);
		
		GRIT.tran.send({
			url: "/wfc/selectList",
			sendData: sendData,
			success: function(result){
				
				$(".<%=layerName%> #detailForm").find( "#wffcltyListCount").val(result.wffcltyDetailList.length);
				if(result.wffcltyDetailList.length > 0){
					
					// 시설상세정보가 있을경우 (＊ 시설 상세정보가 없습니다. 등록해주세요.) 숨김 
					$(".submsg").hide();
					$(".<%=layerName%> #detailForm").find( "#saveMode").val("U");
					$(".<%=layerName%> #detailForm").find( "#wffcltyCd").val(result.wffcltyDetailList[0].wffcltyCd);
					
					
					/* 공통 start */
					// 우편번호,기본주소,상세주소,군구코드
					$(".<%=layerName%> #detailForm").find( "#zipCd").val(result.wffcltyDetailList[0].zipCd);
					$(".<%=layerName%> #detailForm").find( "#addrBase").val(result.wffcltyDetailList[0].addrBase);
					$(".<%=layerName%> #detailForm").find( "#addrDetail").val(result.wffcltyDetailList[0].addrDetail);
					$(".<%=layerName%> #detailForm").find( "#guCd").val(result.wffcltyDetailList[0].guCd);
					
					
					//연락처 대쉬(-) 추가
					var phoneNum = result.wffcltyDetailList[0].phoneNum;
					if(typeof phoneNum != "undefined"){
						$(".<%=layerName%> #detailForm").find( "#phoneNum").val(chk_tel(phoneNum));
					}else{
						$(".<%=layerName%> #detailForm").find( "#phoneNum").val("");
					} 
					
					//팩스번호 대쉬(-) 추가
					var faxNum = result.wffcltyDetailList[0].faxNum;
					if(typeof faxNum != "undefined"){
						$(".<%=layerName%> #detailForm").find( "#faxNum").val(chk_tel(faxNum));
					}else{
						$(".<%=layerName%> #detailForm").find( "#faxNum").val("");
					} 
					
					// 시설장/관장/센터장/도서관장
					$(".<%=layerName%> #detailForm").find( "#intendantNm").val(result.wffcltyDetailList[0].intendantNm);
					$(".<%=layerName%> #detailForm").find( "#establishDd").val(result.wffcltyDetailList[0].establishDd);
					
					// 종사자 콤마 추가
					var workerCnt = result.wffcltyDetailList[0].workerCnt;
					if(typeof workerCnt != "undefined"){
						$(".<%=layerName%> #detailForm").find( "#workerCnt").val(numberComma(workerCnt));
					}else{
						$(".<%=layerName%> #detailForm").find( "#workerCnt").val("");
					} 
					
					// 종사자내역
					$(".<%=layerName%> #detailForm").find( "#workerDetail").val(result.wffcltyDetailList[0].workerDetail);
					// 웹사이트
					$(".<%=layerName%> #detailForm").find( "#homepageUrl").val(result.wffcltyDetailList[0].homepageUrl);
					
					// 보조금(국비,시비,군구비) hide
					$(".<%=layerName%> #detailForm").find( "#checkGovsubyFg").val(result.wffcltyDetailList[0].govsubyFg);
					$(".<%=layerName%> #detailForm").find( "#checkCitsubyFg").val(result.wffcltyDetailList[0].citsubyFg);
					$(".<%=layerName%> #detailForm").find( "#checkGusubyFg").val(result.wffcltyDetailList[0].gusubyFg);
					
					// 보조금(국비,시비,군구비)
					$(".<%=layerName%> #detailForm").find( "#govsubyFg").val(result.wffcltyDetailList[0].govsubyFg);
					$(".<%=layerName%> #detailForm").find( "#citsubyFg").val(result.wffcltyDetailList[0].citsubyFg);
					$(".<%=layerName%> #detailForm").find( "#gusubyFg").val(result.wffcltyDetailList[0].gusubyFg);
					/* 공통 end */
					
					
					//공통변수 선언
					var capacity;
					var nowCapacity;
					var etcDetail1;
					var etcDetail2;
					var etcDetail3;
					var etcDetail4;
					var ownershipTp;
					var lunchTp; 
					var revenueSourceTp; 
					
					
					// 시설유형(시설유형에 따른 항목보여주기)
					var wffcltyTp = $(".<%=layerName%> #wffcltyTp").val();
					
					if(wffcltyTp == "A01" || wffcltyTp == "A02" || wffcltyTp == "A03" || wffcltyTp == "A04"){
						
						// 시설소유
						$(".<%=layerName%> #detailForm").find( "#ownershipTp").val(result.wffcltyDetailList[0].ownershipTp);
						$(".<%=layerName%> #detailForm").find( "#ownershipEtcDetail").val(result.wffcltyDetailList[0].ownershipEtcDetail);
						
						// 중식제공
						$(".<%=layerName%> #detailForm").find( "#lunchTp").val(result.wffcltyDetailList[0].lunchTp);
						$(".<%=layerName%> #detailForm").find( "#lunchEtcDetail").val(result.wffcltyDetailList[0].lunchEtcDetail);
						
						// 수입제원
						$(".<%=layerName%> #detailForm").find( "#revenueSourceTp").val(result.wffcltyDetailList[0].revenueSourceTp);
						$(".<%=layerName%> #detailForm").find( "#revenueEtcDetail").val(result.wffcltyDetailList[0].revenueEtcDetail);
						
						// 시설소유 
						ownershipTp = result.wffcltyDetailList[0].ownershipTp;
						// 중식제공						
						lunchTp = result.wffcltyDetailList[0].lunchTp;
						// 수입제원
						revenueSourceTp = result.wffcltyDetailList[0].revenueSourceTp;
						
						if(ownershipTp == "E"){
							$(".<%=layerName%> #detailForm").find( "#ownershipEtcDetail").attr('readonly', false);
						}else{
							$(".<%=layerName%> #detailForm").find( "#ownershipEtcDetail").attr('readonly', true);
							$(".<%=layerName%> #detailForm").find( "#ownershipEtcDetail").val("");
						}
						
						if(lunchTp == "E"){
							$(".<%=layerName%> #detailForm").find( "#lunchEtcDetail").attr('readonly', false);
						}else{
							$(".<%=layerName%> #detailForm").find( "#lunchEtcDetail").attr('readonly', true);
							$(".<%=layerName%> #detailForm").find( "#lunchEtcDetail").val("");
						}
						
						if(revenueSourceTp == "E"){
							$(".<%=layerName%> #detailForm").find( "#revenueEtcDetail").attr('readonly', false);
						}else{
							$(".<%=layerName%> #detailForm").find( "#revenueEtcDetail").attr('readonly', true);
							$(".<%=layerName%> #detailForm").find( "#revenueEtcDetail").val("");
						}
						
						
						// 입소자정원
						capacity = result.wffcltyDetailList[0].capacity;
						if(typeof capacity != "undefined"){
							$(".<%=layerName%> #detailForm").find( "#capacity").val(numberComma(capacity));
						}else{
							$(".<%=layerName%> #detailForm").find( "#capacity").val("");
						}
						
						// 면적
						$(".<%=layerName%> #detailForm").find( "#area").val(result.wffcltyDetailList[0].area);
						
						// 입소자정원
						nowCapacity = result.wffcltyDetailList[0].nowCapacity;
						if(typeof nowCapacity != "undefined"){
							$(".<%=layerName%> #detailForm").find( "#nowCapacity").val(numberComma(nowCapacity));
						}else{
							$(".<%=layerName%> #detailForm").find( "#nowCapacity").val("");
						} 
						
					}else if(wffcltyTp == "C01" || wffcltyTp == "C02" || wffcltyTp == "C03"){
						
						// 시설소유
						$(".<%=layerName%> #detailForm").find( "#ownershipTp").val(result.wffcltyDetailList[0].ownershipTp);
						$(".<%=layerName%> #detailForm").find( "#ownershipEtcDetail").val(result.wffcltyDetailList[0].ownershipEtcDetail);
						
						// 중식제공
						$(".<%=layerName%> #detailForm").find( "#lunchTp").val(result.wffcltyDetailList[0].lunchTp);
						$(".<%=layerName%> #detailForm").find( "#lunchEtcDetail").val(result.wffcltyDetailList[0].lunchEtcDetail);
						
						// 수입제원
						$(".<%=layerName%> #detailForm").find( "#revenueSourceTp").val(result.wffcltyDetailList[0].revenueSourceTp);
						$(".<%=layerName%> #detailForm").find( "#revenueEtcDetail").val(result.wffcltyDetailList[0].revenueEtcDetail);
						
						// 시설소유 
						ownershipTp = result.wffcltyDetailList[0].ownershipTp;
						// 중식제공						
						lunchTp = result.wffcltyDetailList[0].lunchTp;
						// 수입제원
						revenueSourceTp = result.wffcltyDetailList[0].revenueSourceTp;
						
						if(ownershipTp == "E"){
							$(".<%=layerName%> #detailForm").find( "#ownershipEtcDetail").attr('readonly', false);
						}else{
							$(".<%=layerName%> #detailForm").find( "#ownershipEtcDetail").attr('readonly', true);
							$(".<%=layerName%> #detailForm").find( "#ownershipEtcDetail").val("");
						}
						
						if(lunchTp == "E"){
							$(".<%=layerName%> #detailForm").find( "#lunchEtcDetail").attr('readonly', false);
						}else{
							$(".<%=layerName%> #detailForm").find( "#lunchEtcDetail").attr('readonly', true);
							$(".<%=layerName%> #detailForm").find( "#lunchEtcDetail").val("");
						}
						
						if(revenueSourceTp == "E"){
							$(".<%=layerName%> #detailForm").find( "#revenueEtcDetail").attr('readonly', false);
						}else{
							$(".<%=layerName%> #detailForm").find( "#revenueEtcDetail").attr('readonly', true);
							$(".<%=layerName%> #detailForm").find( "#revenueEtcDetail").val("");
						}
						
						// 입소자정원
						capacity = result.wffcltyDetailList[0].capacity;
						if(typeof capacity != "undefined"){
							$(".<%=layerName%> #detailForm").find( "#capacity").val(numberComma(capacity));
						}else{
							$(".<%=layerName%> #detailForm").find( "#capacity").val("");
						}
						
						// 면적
						$(".<%=layerName%> #detailForm").find( "#area").val(result.wffcltyDetailList[0].area);
						
						// 입소자정원
						nowCapacity = result.wffcltyDetailList[0].nowCapacity;
						if(typeof nowCapacity != "undefined"){
							$(".<%=layerName%> #detailForm").find( "#nowCapacity").val(numberComma(nowCapacity));
						}else{
							$(".<%=layerName%> #detailForm").find( "#nowCapacity").val("");
						} 
						
						// 고용장려금
						etcDetail1 = result.wffcltyDetailList[0].etcDetail1;
						if(typeof etcDetail1 != "undefined"){
							$(".<%=layerName%> #detailForm").find( "#etcDetail1").val(numberComma(etcDetail1));
						}else{
							$(".<%=layerName%> #detailForm").find( "#etcDetail1").val("");
						} 
						
					}else if(wffcltyTp == "B01"){
						
						// 시설소유
						$(".<%=layerName%> #detailForm").find( "#ownershipTp").val(result.wffcltyDetailList[0].ownershipTp);
						$(".<%=layerName%> #detailForm").find( "#ownershipEtcDetail").val(result.wffcltyDetailList[0].ownershipEtcDetail);
						
						// 중식제공
						$(".<%=layerName%> #detailForm").find( "#lunchTp").val(result.wffcltyDetailList[0].lunchTp);
						$(".<%=layerName%> #detailForm").find( "#lunchEtcDetail").val(result.wffcltyDetailList[0].lunchEtcDetail);
						
						// 수입제원
						$(".<%=layerName%> #detailForm").find( "#revenueSourceTp").val(result.wffcltyDetailList[0].revenueSourceTp);
						$(".<%=layerName%> #detailForm").find( "#revenueEtcDetail").val(result.wffcltyDetailList[0].revenueEtcDetail);
						
						// 시설소유 
						ownershipTp = result.wffcltyDetailList[0].ownershipTp;
						// 중식제공						
						lunchTp = result.wffcltyDetailList[0].lunchTp;
						// 수입제원
						revenueSourceTp = result.wffcltyDetailList[0].revenueSourceTp;
						
						if(ownershipTp == "E"){
							$(".<%=layerName%> #detailForm").find( "#ownershipEtcDetail").attr('readonly', false);
						}else{
							$(".<%=layerName%> #detailForm").find( "#ownershipEtcDetail").attr('readonly', true);
							$(".<%=layerName%> #detailForm").find( "#ownershipEtcDetail").val("");
						}
						
						if(lunchTp == "E"){
							$(".<%=layerName%> #detailForm").find( "#lunchEtcDetail").attr('readonly', false);
						}else{
							$(".<%=layerName%> #detailForm").find( "#lunchEtcDetail").attr('readonly', true);
							$(".<%=layerName%> #detailForm").find( "#lunchEtcDetail").val("");
						}
						
						if(revenueSourceTp == "E"){
							$(".<%=layerName%> #detailForm").find( "#revenueEtcDetail").attr('readonly', false);
						}else{
							$(".<%=layerName%> #detailForm").find( "#revenueEtcDetail").attr('readonly', true);
							$(".<%=layerName%> #detailForm").find( "#revenueEtcDetail").val("");
						}
						
						// 일평균 인원
						etcDetail1 = result.wffcltyDetailList[0].etcDetail1;
						if(typeof etcDetail1 != "undefined"){
							$(".<%=layerName%> #detailForm").find( "#etcDetail1").val(numberComma(etcDetail1));
						}else{
							$(".<%=layerName%> #detailForm").find( "#etcDetail1").val("");
						} 
						
						// 주평균 인원
						etcDetail2 = result.wffcltyDetailList[0].etcDetail2;
						if(typeof etcDetail2 != "undefined"){
							$(".<%=layerName%> #detailForm").find( "#etcDetail2").val(numberComma(etcDetail2));
						}else{
							$(".<%=layerName%> #detailForm").find( "#etcDetail2").val("");
						} 
						
					}else if(wffcltyTp == "B02"){
						
						// 시설소유
						$(".<%=layerName%> #detailForm").find( "#ownershipTp").val(result.wffcltyDetailList[0].ownershipTp);
						$(".<%=layerName%> #detailForm").find( "#ownershipEtcDetail").val(result.wffcltyDetailList[0].ownershipEtcDetail);
						
						// 중식제공
						$(".<%=layerName%> #detailForm").find( "#lunchTp").val(result.wffcltyDetailList[0].lunchTp);
						$(".<%=layerName%> #detailForm").find( "#lunchEtcDetail").val(result.wffcltyDetailList[0].lunchEtcDetail);
						
						// 수입제원
						$(".<%=layerName%> #detailForm").find( "#revenueSourceTp").val(result.wffcltyDetailList[0].revenueSourceTp);
						$(".<%=layerName%> #detailForm").find( "#revenueEtcDetail").val(result.wffcltyDetailList[0].revenueEtcDetail);
						
						// 시설소유 
						ownershipTp = result.wffcltyDetailList[0].ownershipTp;
						// 중식제공						
						lunchTp = result.wffcltyDetailList[0].lunchTp;
						// 수입제원
						revenueSourceTp = result.wffcltyDetailList[0].revenueSourceTp;
						
						if(ownershipTp == "E"){
							$(".<%=layerName%> #detailForm").find( "#ownershipEtcDetail").attr('readonly', false);
						}else{
							$(".<%=layerName%> #detailForm").find( "#ownershipEtcDetail").attr('readonly', true);
							$(".<%=layerName%> #detailForm").find( "#ownershipEtcDetail").val("");
						}
						
						if(lunchTp == "E"){
							$(".<%=layerName%> #detailForm").find( "#lunchEtcDetail").attr('readonly', false);
						}else{
							$(".<%=layerName%> #detailForm").find( "#lunchEtcDetail").attr('readonly', true);
							$(".<%=layerName%> #detailForm").find( "#lunchEtcDetail").val("");
						}
						
						if(revenueSourceTp == "E"){
							$(".<%=layerName%> #detailForm").find( "#revenueEtcDetail").attr('readonly', false);
						}else{
							$(".<%=layerName%> #detailForm").find( "#revenueEtcDetail").attr('readonly', true);
							$(".<%=layerName%> #detailForm").find( "#revenueEtcDetail").val("");
						}
						
						
						// 입소자정원
						capacity = result.wffcltyDetailList[0].capacity;
						if(typeof capacity != "undefined"){
							$(".<%=layerName%> #detailForm").find( "#capacity").val(numberComma(capacity));
						}else{
							$(".<%=layerName%> #detailForm").find( "#capacity").val("");
						}
						
						// 면적
						$(".<%=layerName%> #detailForm").find( "#area").val(result.wffcltyDetailList[0].area);
						
						// 입소자정원
						nowCapacity = result.wffcltyDetailList[0].nowCapacity;
						if(typeof nowCapacity != "undefined"){
							$(".<%=layerName%> #detailForm").find( "#nowCapacity").val(numberComma(nowCapacity));
						}else{
							$(".<%=layerName%> #detailForm").find( "#nowCapacity").val("");
						} 
						
						// 서비스공간
						$(".<%=layerName%> #detailForm").find( "#etcDetail1").val(result.wffcltyDetailList[0].etcDetail1);
						
						// 이용료
						etcDetail2 = result.wffcltyDetailList[0].etcDetail2;
						if(typeof etcDetail2 != "undefined"){
							$(".<%=layerName%> #detailForm").find( "#etcDetail2").val(numberComma(etcDetail2));
						}else{
							$(".<%=layerName%> #detailForm").find( "#etcDetail2").val("");
						} 
						
						
					}else if(wffcltyTp == "D03"){
						
						// 시설소유
						$(".<%=layerName%> #detailForm").find( "#ownershipTp").val(result.wffcltyDetailList[0].ownershipTp);
						$(".<%=layerName%> #detailForm").find( "#ownershipEtcDetail").val(result.wffcltyDetailList[0].ownershipEtcDetail);
						
						// 중식제공
						$(".<%=layerName%> #detailForm").find( "#lunchTp").val(result.wffcltyDetailList[0].lunchTp);
						$(".<%=layerName%> #detailForm").find( "#lunchEtcDetail").val(result.wffcltyDetailList[0].lunchEtcDetail);
						
						// 수입제원
						$(".<%=layerName%> #detailForm").find( "#revenueSourceTp").val(result.wffcltyDetailList[0].revenueSourceTp);
						$(".<%=layerName%> #detailForm").find( "#revenueEtcDetail").val(result.wffcltyDetailList[0].revenueEtcDetail);
						
						// 시설소유 
						ownershipTp = result.wffcltyDetailList[0].ownershipTp;
						// 중식제공						
						lunchTp = result.wffcltyDetailList[0].lunchTp;
						// 수입제원
						revenueSourceTp = result.wffcltyDetailList[0].revenueSourceTp;
						
						if(ownershipTp == "E"){
							$(".<%=layerName%> #detailForm").find( "#ownershipEtcDetail").attr('readonly', false);
						}else{
							$(".<%=layerName%> #detailForm").find( "#ownershipEtcDetail").attr('readonly', true);
							$(".<%=layerName%> #detailForm").find( "#ownershipEtcDetail").val("");
						}
						
						if(lunchTp == "E"){
							$(".<%=layerName%> #detailForm").find( "#lunchEtcDetail").attr('readonly', false);
						}else{
							$(".<%=layerName%> #detailForm").find( "#lunchEtcDetail").attr('readonly', true);
							$(".<%=layerName%> #detailForm").find( "#lunchEtcDetail").val("");
						}
						
						if(revenueSourceTp == "E"){
							$(".<%=layerName%> #detailForm").find( "#revenueEtcDetail").attr('readonly', false);
						}else{
							$(".<%=layerName%> #detailForm").find( "#revenueEtcDetail").attr('readonly', true);
							$(".<%=layerName%> #detailForm").find( "#revenueEtcDetail").val("");
						}
						
						// 입소자정원
						capacity = result.wffcltyDetailList[0].capacity;
						if(typeof capacity != "undefined"){
							$(".<%=layerName%> #detailForm").find( "#capacity").val(numberComma(capacity));
						}else{
							$(".<%=layerName%> #detailForm").find( "#capacity").val("");
						}
						
						// 서비스공간
						$(".<%=layerName%> #detailForm").find( "#etcDetail1").val(result.wffcltyDetailList[0].etcDetail1);
						
					}else if(wffcltyTp == "B05"){
						
						// 시설소유
						$(".<%=layerName%> #detailForm").find( "#ownershipTp").val(result.wffcltyDetailList[0].ownershipTp);
						$(".<%=layerName%> #detailForm").find( "#ownershipEtcDetail").val(result.wffcltyDetailList[0].ownershipEtcDetail);
						
						// 수입제원
						$(".<%=layerName%> #detailForm").find( "#revenueSourceTp").val(result.wffcltyDetailList[0].revenueSourceTp);
						$(".<%=layerName%> #detailForm").find( "#revenueEtcDetail").val(result.wffcltyDetailList[0].revenueEtcDetail);
						
						// 시설소유 
						ownershipTp = result.wffcltyDetailList[0].ownershipTp;
						// 수입제원
						revenueSourceTp = result.wffcltyDetailList[0].revenueSourceTp;
						
						if(ownershipTp == "E"){
							$(".<%=layerName%> #detailForm").find( "#ownershipEtcDetail").attr('readonly', false);
						}else{
							$(".<%=layerName%> #detailForm").find( "#ownershipEtcDetail").attr('readonly', true);
							$(".<%=layerName%> #detailForm").find( "#ownershipEtcDetail").val("");
						}
						
						if(revenueSourceTp == "E"){
							$(".<%=layerName%> #detailForm").find( "#revenueEtcDetail").attr('readonly', false);
						}else{
							$(".<%=layerName%> #detailForm").find( "#revenueEtcDetail").attr('readonly', true);
							$(".<%=layerName%> #detailForm").find( "#revenueEtcDetail").val("");
						}
						
						
						// 이용자 정원
						capacity = result.wffcltyDetailList[0].capacity;
						if(typeof capacity != "undefined"){
							$(".<%=layerName%> #detailForm").find( "#capacity").val(numberComma(capacity));
						}else{
							$(".<%=layerName%> #detailForm").find( "#capacity").val("");
						}
						
						// 서비스공간
						$(".<%=layerName%> #detailForm").find( "#etcDetail1").val(result.wffcltyDetailList[0].etcDetail1);
						
					}else if(wffcltyTp == "B07" || wffcltyTp == "B08"){
						
						// 시설소유
						$(".<%=layerName%> #detailForm").find( "#ownershipTp").val(result.wffcltyDetailList[0].ownershipTp);
						$(".<%=layerName%> #detailForm").find( "#ownershipEtcDetail").val(result.wffcltyDetailList[0].ownershipEtcDetail);
						
						// 중식제공
						$(".<%=layerName%> #detailForm").find( "#lunchTp").val(result.wffcltyDetailList[0].lunchTp);
						$(".<%=layerName%> #detailForm").find( "#lunchEtcDetail").val(result.wffcltyDetailList[0].lunchEtcDetail);
						
						// 수입제원
						$(".<%=layerName%> #detailForm").find( "#revenueSourceTp").val(result.wffcltyDetailList[0].revenueSourceTp);
						$(".<%=layerName%> #detailForm").find( "#revenueEtcDetail").val(result.wffcltyDetailList[0].revenueEtcDetail);
						
						// 시설소유 
						ownershipTp = result.wffcltyDetailList[0].ownershipTp;
						// 중식제공						
						lunchTp = result.wffcltyDetailList[0].lunchTp;
						// 수입제원
						revenueSourceTp = result.wffcltyDetailList[0].revenueSourceTp;
						
						if(ownershipTp == "E"){
							$(".<%=layerName%> #detailForm").find( "#ownershipEtcDetail").attr('readonly', false);
						}else{
							$(".<%=layerName%> #detailForm").find( "#ownershipEtcDetail").attr('readonly', true);
							$(".<%=layerName%> #detailForm").find( "#ownershipEtcDetail").val("");
						}
						
						if(lunchTp == "E"){
							$(".<%=layerName%> #detailForm").find( "#lunchEtcDetail").attr('readonly', false);
						}else{
							$(".<%=layerName%> #detailForm").find( "#lunchEtcDetail").attr('readonly', true);
							$(".<%=layerName%> #detailForm").find( "#lunchEtcDetail").val("");
						}
						
						if(revenueSourceTp == "E"){
							$(".<%=layerName%> #detailForm").find( "#revenueEtcDetail").attr('readonly', false);
						}else{
							$(".<%=layerName%> #detailForm").find( "#revenueEtcDetail").attr('readonly', true);
							$(".<%=layerName%> #detailForm").find( "#revenueEtcDetail").val("");
						}
						
						// 이용자 정원
						capacity = result.wffcltyDetailList[0].capacity;
						if(typeof capacity != "undefined"){
							$(".<%=layerName%> #detailForm").find( "#capacity").val(numberComma(capacity));
						}else{
							$(".<%=layerName%> #detailForm").find( "#capacity").val("");
						}
						
						// 서비스공간
						$(".<%=layerName%> #detailForm").find( "#etcDetail1").val(result.wffcltyDetailList[0].etcDetail1);
						
					}else if(wffcltyTp == "B04"){
						
						// 시설소유
						$(".<%=layerName%> #detailForm").find( "#ownershipTp").val(result.wffcltyDetailList[0].ownershipTp);
						$(".<%=layerName%> #detailForm").find( "#ownershipEtcDetail").val(result.wffcltyDetailList[0].ownershipEtcDetail);
						
						// 수입제원
						$(".<%=layerName%> #detailForm").find( "#revenueSourceTp").val(result.wffcltyDetailList[0].revenueSourceTp);
						$(".<%=layerName%> #detailForm").find( "#revenueEtcDetail").val(result.wffcltyDetailList[0].revenueEtcDetail);
						
						// 시설소유 
						ownershipTp = result.wffcltyDetailList[0].ownershipTp;
						// 수입제원
						revenueSourceTp = result.wffcltyDetailList[0].revenueSourceTp;
						
						if(ownershipTp == "E"){
							$(".<%=layerName%> #detailForm").find( "#ownershipEtcDetail").attr('readonly', false);
						}else{
							$(".<%=layerName%> #detailForm").find( "#ownershipEtcDetail").attr('readonly', true);
							$(".<%=layerName%> #detailForm").find( "#ownershipEtcDetail").val("");
						}
						
						if(revenueSourceTp == "E"){
							$(".<%=layerName%> #detailForm").find( "#revenueEtcDetail").attr('readonly', false);
						}else{
							$(".<%=layerName%> #detailForm").find( "#revenueEtcDetail").attr('readonly', true);
							$(".<%=layerName%> #detailForm").find( "#revenueEtcDetail").val("");
						}
						
						// 이용자
						capacity = result.wffcltyDetailList[0].capacity;
						if(typeof capacity != "undefined"){
							$(".<%=layerName%> #detailForm").find( "#capacity").val(numberComma(capacity));
						}else{
							$(".<%=layerName%> #detailForm").find( "#capacity").val("");
						}
						
					}else if(wffcltyTp == "B03"){
						
						// 시설소유
						$(".<%=layerName%> #detailForm").find( "#ownershipTp").val(result.wffcltyDetailList[0].ownershipTp);
						$(".<%=layerName%> #detailForm").find( "#ownershipEtcDetail").val(result.wffcltyDetailList[0].ownershipEtcDetail);
						
						// 수입제원
						$(".<%=layerName%> #detailForm").find( "#revenueSourceTp").val(result.wffcltyDetailList[0].revenueSourceTp);
						$(".<%=layerName%> #detailForm").find( "#revenueEtcDetail").val(result.wffcltyDetailList[0].revenueEtcDetail);
						
						// 시설소유 
						ownershipTp = result.wffcltyDetailList[0].ownershipTp;
						// 수입제원
						revenueSourceTp = result.wffcltyDetailList[0].revenueSourceTp;
						
						if(ownershipTp == "E"){
							$(".<%=layerName%> #detailForm").find( "#ownershipEtcDetail").attr('readonly', false);
						}else{
							$(".<%=layerName%> #detailForm").find( "#ownershipEtcDetail").attr('readonly', true);
							$(".<%=layerName%> #detailForm").find( "#ownershipEtcDetail").val("");
						}
						
						if(revenueSourceTp == "E"){
							$(".<%=layerName%> #detailForm").find( "#revenueEtcDetail").attr('readonly', false);
						}else{
							$(".<%=layerName%> #detailForm").find( "#revenueEtcDetail").attr('readonly', true);
							$(".<%=layerName%> #detailForm").find( "#revenueEtcDetail").val("");
						}
						
						// 일평균 인원
						etcDetail1 = result.wffcltyDetailList[0].etcDetail1;
						if(typeof etcDetail1 != "undefined"){
							$(".<%=layerName%> #detailForm").find( "#etcDetail1").val(numberComma(etcDetail1));
						}else{
							$(".<%=layerName%> #detailForm").find( "#etcDetail1").val("");
						} 
						
						// 주평균 인원
						etcDetail2 = result.wffcltyDetailList[0].etcDetail2;
						if(typeof etcDetail2 != "undefined"){
							$(".<%=layerName%> #detailForm").find( "#etcDetail2").val(numberComma(etcDetail2));
						}else{
							$(".<%=layerName%> #detailForm").find( "#etcDetail2").val("");
						} 
						
					}else if(wffcltyTp == "D04"){
						
						$(".<%=layerName%> #detailForm").find( "#etcDetail1").val(result.wffcltyDetailList[0].etcDetail1);
						$(".<%=layerName%> #detailForm").find( "#etcDetail2").val(result.wffcltyDetailList[0].etcDetail2);
						$(".<%=layerName%> #detailForm").find( "#etcDetail3").val(result.wffcltyDetailList[0].etcDetail3);
						$(".<%=layerName%> #detailForm").find( "#etcDetail4").val(result.wffcltyDetailList[0].etcDetail4);
						
					}else if(wffcltyTp == "D05" || wffcltyTp == "D06" || wffcltyTp == "E01" || wffcltyTp == "E02" || wffcltyTp == "B06" || wffcltyTp == "D01" || wffcltyTp == "D02" ){
						
						// 시설소유
						$(".<%=layerName%> #detailForm").find( "#ownershipTp").val(result.wffcltyDetailList[0].ownershipTp);
						$(".<%=layerName%> #detailForm").find( "#ownershipEtcDetail").val(result.wffcltyDetailList[0].ownershipEtcDetail);
						
						// 수입제원
						$(".<%=layerName%> #detailForm").find( "#revenueSourceTp").val(result.wffcltyDetailList[0].revenueSourceTp);
						$(".<%=layerName%> #detailForm").find( "#revenueEtcDetail").val(result.wffcltyDetailList[0].revenueEtcDetail);
						
						// 시설소유 
						ownershipTp = result.wffcltyDetailList[0].ownershipTp;
						// 수입제원
						revenueSourceTp = result.wffcltyDetailList[0].revenueSourceTp;
						
						if(ownershipTp == "E"){
							$(".<%=layerName%> #detailForm").find( "#ownershipEtcDetail").attr('readonly', false);
						}else{
							$(".<%=layerName%> #detailForm").find( "#ownershipEtcDetail").attr('readonly', true);
							$(".<%=layerName%> #detailForm").find( "#ownershipEtcDetail").val("");
						}
						
						if(revenueSourceTp == "E"){
							$(".<%=layerName%> #detailForm").find( "#revenueEtcDetail").attr('readonly', false);
						}else{
							$(".<%=layerName%> #detailForm").find( "#revenueEtcDetail").attr('readonly', true);
							$(".<%=layerName%> #detailForm").find( "#revenueEtcDetail").val("");
						}
						
					}
					
					
					// 체크박스 체크여부
					<%=layerName%>subsidyCheckBox();
					
					// 그리드에 데이터 세팅
					AUIGrid.setGridData(<%=layerName%>myGridID, result.wffcltyDisableTpList);
					
					// 그리드에 데이터 세팅
					AUIGrid.setGridData(<%=layerName%>myGridID2, result.wffcltyPictureList);
					
				}else{
					$(".<%=layerName%> #detailForm").find( "#saveMode").val("I");
					
					$(".<%=layerName%> #detailForm").find( "#checkGovsubyFg").val("0");
					$(".<%=layerName%> #detailForm").find( "#checkCitsubyFg").val("0");
					$(".<%=layerName%> #detailForm").find( "#checkGusubyFg").val("0");
					
					// 시설상세정보가 없을경우 (＊ 시설 상세정보가 없습니다. 등록해주세요.) 숨김
					$(".submsg").show();
				}
				
				
				
				// 로더 제거
				AUIGrid.removeAjaxLoader(<%=layerName%>myGridID);
				AUIGrid.removeAjaxLoader(<%=layerName%>myGridID2);
				
			},
			error: function(request, status, error){
				GRIT.msg.alert("복지시설 상세를 조회하는데 문제가 발생했습니다.");
				// 로더 제거
				AUIGrid.removeAjaxLoader(<%=layerName%>myGridID);
				AUIGrid.removeAjaxLoader(<%=layerName%>myGridID2);
			},
			loading : false
			
		});
	}
	
	
	// 저장체크
	function <%=layerName%>validationCheck(){
		//시설상세정보
	    if ( $(".<%=layerName%> #zipCd").val() == "" ) {
			$(".<%=layerName%> #zipCd").focus();
			GRIT.msg.alert("[우편번호]은(는) 필수 항목입니다."); 
			return false;
		}
		
		if ( $(".<%=layerName%> #addrBase").val() == "" ) {
			$(".<%=layerName%> #addrBase").focus();
			GRIT.msg.alert("[기본주소]은(는) 필수 항목입니다."); 
			return false;
		}
		
		
		if($(".<%=layerName%> #phoneNum").val() != "" ){
			if ( $(".<%=layerName%> #phoneNum").val().length < 8 ) {
				$(".<%=layerName%> #phoneNum").focus();
				GRIT.msg.alert("[연락처]는  최소 8자리를 입력해야 합니다."); return;
			}
			
			 if(!checkPhoneNum($(".<%=layerName%> #phoneNum").val())){
				$(".<%=layerName%> #phoneNum").focus();
				GRIT.msg.alert("[연락처] 형식이 잘못 되었습니다."); return;
			} 
		}
		
		if($(".<%=layerName%> #faxNum").val() != "" ){
			if ( $(".<%=layerName%> #faxNum").val().length < 8 ) {
				$(".<%=layerName%> #faxNum").focus();
				GRIT.msg.alert("[팩스번호]는  최소 8자리를 입력해야 합니다."); return;
			}
			
			 if(!checkPhoneNum($(".<%=layerName%> #faxNum").val())){
				$(".<%=layerName%> #faxNum").focus();
				GRIT.msg.alert("[팩스번호] 형식이 잘못 되었습니다."); return;
			} 
		}
		
		if($(".<%=layerName%> #establishDd").val() != "" ){
			var yyyymmdd = $(".<%=layerName%> #establishDd").val().replace(/\-/g,'');
			if(yyyymmdd.length != 8){
				GRIT.msg.alert("[설립일자] 날짜형식이 잘못되었습니다."); 
				return false;
			}
		}
			
				
		if ($(".<%=layerName%> #ownershipTp").val() == "E" ) {
			if($(".<%=layerName%> #ownershipEtcDetail").val() == ""){
				$(".<%=layerName%> #ownershipEtcDetail").focus();
				GRIT.msg.alert("[시설소유 사유]은(는) 필수 항목입니다."); 
				return false;
			}
		}
		
		if ($(".<%=layerName%> #revenueSourceTp").val() == "E" ) {
			if($(".<%=layerName%> #revenueEtcDetail").val() == ""){
				$(".<%=layerName%> #revenueEtcDetail").focus();
				GRIT.msg.alert("[수입제원 사유]은(는) 필수 항목입니다."); 
				return false;
			}
		}
		
		if ($(".<%=layerName%> #lunchTp").val() == "E" ) {
			if($(".<%=layerName%> #lunchEtcDetail").val() == ""){
				$(".<%=layerName%> #lunchEtcDetail").focus();
				GRIT.msg.alert("[중식제공 사유]은(는) 필수 항목입니다."); 
				return false;
			}
		}

		
		// 서비스 장애
		
		// 필수 체크
		var isValid = AUIGrid.validateGridData(<%=layerName%>myGridID, ["disableTp"]);
		
		if(!isValid){
			GRIT.msg.alert("[장애유형]을 선택해주세요.");
			return false;
		}
		
		//중복체크
		var disableTpGirdList = AUIGrid.getGridData(<%=layerName%>myGridID);
		var temp1;
		var temp2;
		
		// 중복체크
		for (var i = 0; i < disableTpGirdList.length; i++) {
			for (var j = 0; j < i; j++) {
				temp1 = disableTpGirdList[i].disableTp;
				temp2 = disableTpGirdList[j].disableTp;
			
				if(temp1 == temp2){
					GRIT.msg.alert("[장애유형] 중복된 데이터가 있습니다.");
					return false;
				}
			}
		}
		
		// 필수 체크
		var isValid = AUIGrid.validateGridData(<%=layerName%>myGridID2, ["pictureNm"]);
		
		if(!isValid){
			GRIT.msg.alert("[파일]을 선택해주세요.");
			return false;
		}
		
		// 시설사진 데이터
		var pictureGirdList = AUIGrid.getGridData(<%=layerName%>myGridID2);
		var temp3;
		var temp4;
		// 시설사진중복체크
		for (var i = 0; i < pictureGirdList.length; i++) {
			for (var j = 0; j < i; j++) {
				temp3 = pictureGirdList[i].pictureNm;
				temp4 = pictureGirdList[j].pictureNm;
			
				if(temp3 == temp4){
					GRIT.msg.alert("[선택파일명] 중복된 데이터가 있습니다.");
					return false;
				}
			}
		}
		
		return true;
	}
	
	function <%=layerName%>fn_saveWffDetail() {
		if(!<%=layerName%>validationCheck()) return false;		
		
		 if(confirm("저장 하시겠습니까?")){
			<%=layerName%>fn_save();
	    } 
	}
	
	//저장
	function <%=layerName%>fn_save(){
        
		
		// 시설상세정보 FORM
		var detailArr = $(".<%=layerName%> form[name=detailForm]").serializeObject();
		
		// 신규입력, 저장 , 삭제된 데이터를 담는 배열
		var disableTpArr = new Array();
		// 행추가한 데이터
		var addDisableTp = AUIGrid.getAddedRowItems(<%=layerName%>myGridID);
		// 수정한 데이터
		var upDisableTp = AUIGrid.getEditedRowItems(<%=layerName%>myGridID);
		// 삭제한 데이터
		var delDisableTp = AUIGrid.getRemovedItems(<%=layerName%>myGridID);
		
		// 삭제된 데이터 JSON형식으로 담기
		if(delDisableTp.length != 0){
			for (var i = 0; i < delDisableTp.length; i++) {
				var json = new Object();
				json.wffcltyCd     = delDisableTp[i].wffcltyCd;
				json.disableTp     = delDisableTp[i].disableTp;
				json.disableDetail = delDisableTp[i].disableDetail;
				json.stats         = "D";
				disableTpArr.push(json);
			}
		}
		
		// 수정된 데이터 JSON형식으로 담기
		if(upDisableTp.length != 0){
			for (var i = 0; i < upDisableTp.length; i++) {
				var json = new Object();
				json.wffcltyCd     = upDisableTp[i].wffcltyCd;
				json.disableTp     = upDisableTp[i].disableTp;
				json.disableDetail = upDisableTp[i].disableDetail;
				json.stats         = "U";
				disableTpArr.push(json);
			}
		}
		
		// 신규입력된 데이터 JSON형식으로 담기
		if(addDisableTp.length != 0){
			for (var i = 0; i < addDisableTp.length; i++) {
				var json = new Object();
				json.wffcltyCd     = addDisableTp[i].wffcltyCd;
				json.disableTp     = addDisableTp[i].disableTp;
				json.disableDetail = addDisableTp[i].disableDetail;
				json.stats         = "I";
				disableTpArr.push(json);
			}
		}
		
		
		
		// 시설상세정보와 서비스장애 데이터를 담을 배열 
		var sendData = new Array();
		sendData.push(detailArr);
		sendData.push(disableTpArr);

		 GRIT.tran.send({
			url: "/wfc/saveWfcDetail",
			async: true,
			sendData: sendData,
			success: function(result){
				if(result.rtnCode == "0"){
					// 저장 성공
					GRIT.msg.alert(result.message);
					<%=layerName%>submitFiles();
					 
				}else{
					// 저장 실패
					GRIT.msg.alert(result.message);
				}
				
			},
 			loadingTarget: "<%=layerName%>"
 		}); 
	}
	
	 // 서비스 장애유형 그리드  유형
	 function <%=layerName%>serviceDisableArr(){
		  
		  <c:forEach items="${disableTpList}" var="item">
		    var json = new Object();
		    json.disableTp = "${item.disableTp}";
		    json.disableTpNm = "${item.disableTpNm}";
		    disableArr.push(json);
		   </c:forEach>
	 }
	  
	 // 서비스 장애 행추가
	 function <%=layerName%>addDisableRow(){
		var item = new Object();
		
		item.wffcltyCd = $(".<%=layerName%> #wffcltyCd").val();
		var count =  AUIGrid.getRowCount(<%=layerName%>myGridID);
		if(count == 15){
			GRIT.msg.alert("[장애유형]은 최대 15개 까지 입력할 수 있습니다."); 
			return;
		}else{
			AUIGrid.addRow(<%=layerName%>myGridID, item, "last");	
		}
	}
	 
	 // 서비스 장애 행삭제
	 function <%=layerName%>delDisableRow(){
		
		 var items = AUIGrid.getSelectedItems(<%=layerName%>myGridID);
		 var row = items[0].rowIndex;
		 
		 AUIGrid.removeRow(<%=layerName%>myGridID,row);
	 }
	 
	 // 시설사진 행추가
	 function <%=layerName%>addPictureRow(){
		 
		var item = new Object();
		item.wffcltyCd = $(".<%=layerName%> #wffcltyCd").val();
		var count =  AUIGrid.getRowCount(<%=layerName%>myGridID2);
		
		if(count == 4){
			GRIT.msg.alert("[시설사진]은 최대 4개 까지 입력할 수 있습니다."); 
			return;
		}else{
			AUIGrid.addRow(<%=layerName%>myGridID2, item, "last");	
		}
	
	}
	 
	 // 시설사진 행삭제
	 function <%=layerName%>delPictureRow(){
		 
		 var items = AUIGrid.getSelectedItems(<%=layerName%>myGridID2);
		 
		 var row = items[0].rowIndex;
		 var id = items[0].item.id;
		 
		 if(<%=layerName%>recentGridItem != null){
		 	delete <%=layerName%>myFileCaches[id];
		 }
		
		 AUIGrid.removeRow(<%=layerName%>myGridID2,row);		 
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
	
	//그리드의 셀 버턴 클릭 처리
	function <%=layerName%>myButtonClick(item){
		<%=layerName%>recentGridItem = item; // 그리드의 클릭한 행 아이템 보관
		var input = $(".<%=layerName%> #file");
		input.trigger('click'); // 파일 브라우저 열기
	};
	
	
	// 파일 저장
	function <%=layerName%>submitFiles(){
			
		// jQuery Ajax Form 사용
		var formData = new FormData();
		
		 $.each(<%=layerName%>myFileCaches, function(n, v) {
				formData.append("wffcltyCd", v.wffcltyCd); // 추가 정보들
				formData.append("stats", v.stats);
				formData.append("pictureRealNm", v.pictureRealNm);
				formData.append("uploadfiles[]", v.file);
				
		});
		 
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
				url: "/wfc/imgUpload",
				data: formData,
				processData: false,
		        contentType: false,
		        async: true,
				success: function(result){
					if(result.rtnCode == "0"){
						// 저장 성공
						<%=layerName%>myFileCaches = {};
						<%=layerName%>loadData();
					}else{
						// 저장 실패
						GRIT.msg.alert(result.message);
					}
				},
				loadingTarget: "<%=layerName%>"
			});
	}
	
	
	// 시설유형에 따른 화면
	function <%=layerName%>setDetail(){
		var wffcltyTp = $(".<%=layerName%> #wffcltyTp").val();
		
		if(wffcltyTp == "A01" || wffcltyTp == "A02" || wffcltyTp == "A03" || wffcltyTp == "A04"){
			$('.intendantNm-change-text').text('시설장');
			$html =  "<tr class='append'><th>보조금<span></th><td><input type='checkbox' id='govsubyFg' name='govsubyFg'  onclick='<%=layerName%>govsubyFgCheckBox()' tabindex='1' '/>국비 <input type='checkbox' id='citsubyFg' name='citsubyFg'  onclick='<%=layerName%>citsubyFgCheckBox()' tabindex='1' />시비 <input type='checkbox' id='gusubyFg'  name='gusubyFg'   onclick='<%=layerName%>gusubyFgCheckBox()' tabindex='1' />군구비 </td><th>시설소유</th><td><select id='ownershipTp' name='ownershipTp' style='width: 33%; text-align-last : center' onchange='<%=layerName%>fn_ownershipTp(this.value)'  tabindex='1' ><option value=''>없음</option><c:if test='${!empty ownershipTpList}'><c:forEach var='list' items='${ownershipTpList}'><option value='${list.ownershipTp}'><c:out value='${list.ownershipTpNm}' /></option></c:forEach></c:if></select><input type='text' id='ownershipEtcDetail' name='ownershipEtcDetail'  style='width: 66.1%;text-align: left; margin-left:3px;' title='시설소유' onkeyup='checkByte(this, 50)' tabindex='1'  readonly></td></tr>";
			$html += "<tr class='append'><th>수입제원</th><td><select id='revenueSourceTp' name='revenueSourceTp' style='width: 33%; text-align-last : center' onchange='<%=layerName%>fn_revenueSourceTp(this.value)'  tabindex='1' ><option value=''>없음</option><c:if test='${!empty revenueTpList}'><c:forEach var='list' items='${revenueTpList}'><option value='${list.revenueSourceTp}'><c:out value='${list.revenueSourceTpNm}' /></option></c:forEach></c:if></select><input type='text' id='revenueEtcDetail' name='revenueEtcDetail'  style='width: 66.1%;text-align: left;margin-left:3px;' title='수입제원' onkeyup='checkByte(this, 50)' tabindex='1'  readonly><th>중식제공</th><td><select id='lunchTp' name='lunchTp' style='width: 33%; text-align-last : center' onchange='<%=layerName%>fn_lunchTp(this.value)'  tabindex='1' ><option value=''>없음</option><c:if test='${!empty lunchTpList}'><c:forEach var='list' items='${lunchTpList}'><option value='${list.lunchTp}'><c:out value='${list.lunchTpNm}' /></option></c:forEach></c:if></select><input type='text' id='lunchEtcDetail' name='lunchEtcDetail'  style='width: 66.1%;text-align: left;margin-left:3px;' title='중식제공' onkeyup='checkByte(this, 50)' tabindex='1'  readonly></td></tr>";
			$html += "<tr class='append'><th>입소자 정원</th><td><input type='text' id='capacity' name='capacity'  style='width:94.9%; text-align: right;' title='입소자정원' maxlength='4'  onkeyup='removeChar(event);fn_comma(this);'  tabindex='1' > 명 </td><th>면적</th><td><input type='text' id='area' name='area' style='width:100%; text-align:left' title='면적' onkeyup='checkByte(this, 100)'/></td></tr>";
			$html += "<tr class='append'><th>입소자 현원</th><td style='border-right:none !important'><input type='text' id='nowCapacity' name='nowCapacity' style='width:94.9%; text-align:right' title='입소자현원' readonly />명 </td><td colspan='2'  style='border-left:none;'></td></tr>";
		}else if(wffcltyTp == "C01" || wffcltyTp == "C02" || wffcltyTp == "C03"){
			$('.intendantNm-change-text').text('시설장');
			$html =  "<tr class='append'><th>보조금<span></th><td><input type='checkbox' id='govsubyFg' name='govsubyFg'  onclick='<%=layerName%>govsubyFgCheckBox()' tabindex='1' />국비 <input type='checkbox' id='citsubyFg' name='citsubyFg'  onclick='<%=layerName%>citsubyFgCheckBox()' tabindex='1' />시비 <input type='checkbox' id='gusubyFg'  name='gusubyFg'   onclick='<%=layerName%>gusubyFgCheckBox()' tabindex='1' />군구비 </td><th>시설소유</th><td><select id='ownershipTp' name='ownershipTp' style='width: 33%; text-align-last : center' onchange='<%=layerName%>fn_ownershipTp(this.value)'  tabindex='1' ><option value=''>없음</option><c:if test='${!empty ownershipTpList}'><c:forEach var='list' items='${ownershipTpList}'><option value='${list.ownershipTp}'><c:out value='${list.ownershipTpNm}' /></option></c:forEach></c:if></select><input type='text' id='ownershipEtcDetail' name='ownershipEtcDetail'  style='width: 66.1%;text-align: left; margin-left:3px;' title='시설소유' onkeyup='checkByte(this, 50)' tabindex='1'  readonly></td></tr>";
			$html += "<tr class='append'><th>수입제원</th><td><select id='revenueSourceTp' name='revenueSourceTp' style='width: 33%; text-align-last : center' onchange='<%=layerName%>fn_revenueSourceTp(this.value)'  tabindex='1' ><option value=''>없음</option><c:if test='${!empty revenueTpList}'><c:forEach var='list' items='${revenueTpList}'><option value='${list.revenueSourceTp}'><c:out value='${list.revenueSourceTpNm}' /></option></c:forEach></c:if></select><input type='text' id='revenueEtcDetail' name='revenueEtcDetail'  style='width: 66.1%;text-align: left;margin-left:3px;' title='수입제원' onkeyup='checkByte(this, 50)' tabindex='1'  readonly><th>중식제공</th><td><select id='lunchTp' name='lunchTp' style='width: 33%; text-align-last : center' onchange='<%=layerName%>fn_lunchTp(this.value)'  tabindex='1' ><option value=''>없음</option><c:if test='${!empty lunchTpList}'><c:forEach var='list' items='${lunchTpList}'><option value='${list.lunchTp}'><c:out value='${list.lunchTpNm}' /></option></c:forEach></c:if></select><input type='text' id='lunchEtcDetail' name='lunchEtcDetail'  style='width: 66.1%;text-align: left;margin-left:3px;' title='중식제공' onkeyup='checkByte(this, 50)' tabindex='1'  readonly></td></tr>";
			$html += "<tr class='append'><th>입소자 정원</th><td><input type='text' id='capacity' name='capacity'  style='width:94.9%; text-align: right;' title='입소자정원' maxlength='4'  onkeyup='removeChar(event);fn_comma(this);'  tabindex='1' > 명 </td><th>면적</th><td><input type='text' id='area' name='area' style='width:100%; text-align:left' title='면적' onkeyup='checkByte(this, 100)'/></td></tr>";
			$html += "<tr class='append'><th>입소자 현원</th><td><input type='text' id='nowCapacity' name='nowCapacity' style='width:94.9%; text-align:right' title='입소자현원' readonly />명 </td><th>고용장려금</th><td><input type='text' id='etcDetail1' name='etcDetail1' style='width:95.1%; text-align: right;' title='고용 장려금' onkeyup='removeChar(event);fn_comma(this);checkByte(this, 200);'> 원</td></tr>";
		}else if(wffcltyTp == "B01"){
			$('.intendantNm-change-text').text('관장');
			$html =  "<tr class='append'><th>보조금<span></th><td><input type='checkbox' id='govsubyFg' name='govsubyFg'  onclick='<%=layerName%>govsubyFgCheckBox()' tabindex='1' />국비 <input type='checkbox' id='citsubyFg' name='citsubyFg'  onclick='<%=layerName%>citsubyFgCheckBox()' tabindex='1' />시비 <input type='checkbox' id='gusubyFg'  name='gusubyFg'   onclick='<%=layerName%>gusubyFgCheckBox()' tabindex='1' />군구비 </td><th>시설소유</th><td><select id='ownershipTp' name='ownershipTp' style='width: 33%; text-align-last : center' onchange='<%=layerName%>fn_ownershipTp(this.value)'  tabindex='1' ><option value=''>없음</option><c:if test='${!empty ownershipTpList}'><c:forEach var='list' items='${ownershipTpList}'><option value='${list.ownershipTp}'><c:out value='${list.ownershipTpNm}' /></option></c:forEach></c:if></select><input type='text' id='ownershipEtcDetail' name='ownershipEtcDetail'  style='width: 66.1%;text-align: left; margin-left:3px;' title='시설소유' onkeyup='checkByte(this, 50)' tabindex='1'  readonly></td></tr>";
			$html += "<tr class='append'><th>수입제원</th><td><select id='revenueSourceTp' name='revenueSourceTp' style='width: 33%; text-align-last : center' onchange='<%=layerName%>fn_revenueSourceTp(this.value)'  tabindex='1' ><option value=''>없음</option><c:if test='${!empty revenueTpList}'><c:forEach var='list' items='${revenueTpList}'><option value='${list.revenueSourceTp}'><c:out value='${list.revenueSourceTpNm}' /></option></c:forEach></c:if></select><input type='text' id='revenueEtcDetail' name='revenueEtcDetail'  style='width: 66.1%;text-align: left;margin-left:3px;' title='수입제원' onkeyup='checkByte(this, 50)' tabindex='1'  readonly><th>중식제공</th><td><select id='lunchTp' name='lunchTp' style='width: 33%; text-align-last : center' onchange='<%=layerName%>fn_lunchTp(this.value)'  tabindex='1' ><option value=''>없음</option><c:if test='${!empty lunchTpList}'><c:forEach var='list' items='${lunchTpList}'><option value='${list.lunchTp}'><c:out value='${list.lunchTpNm}' /></option></c:forEach></c:if></select><input type='text' id='lunchEtcDetail' name='lunchEtcDetail'  style='width: 66.1%;text-align: left;margin-left:3px;' title='중식제공' onkeyup='checkByte(this, 50)' tabindex='1'  readonly></td></tr>";
			$html += "<tr class='append'><th>일평균 인원</th><td><input type='text' id='etcDetail1' name='etcDetail1' style='width:95.1%; text-align: right;' title='일평균인원' maxlength='4'  onkeyup='removeChar(event);fn_comma(this);'  tabindex='1' > 명</td><th>주평균 인원</th><td><input type='text' id='etcDetail2' name='etcDetail2' style='width:95.1%; text-align: right;' title='주평균인원'  maxlength='4'  onkeyup='removeChar(event);fn_comma(this);' tabindex='1' > 명</td></tr>";
		}else if(wffcltyTp == "B02"){
			$('.intendantNm-change-text').text('시설장');
			$html =  "<tr class='append'><th>보조금<span></th><td><input type='checkbox' id='govsubyFg' name='govsubyFg'  onclick='<%=layerName%>govsubyFgCheckBox()' tabindex='1' />국비 <input type='checkbox' id='citsubyFg' name='citsubyFg'  onclick='<%=layerName%>citsubyFgCheckBox()' tabindex='1' />시비 <input type='checkbox' id='gusubyFg'  name='gusubyFg'   onclick='<%=layerName%>gusubyFgCheckBox()' tabindex='1' />군구비 </td><th>시설소유</th><td><select id='ownershipTp' name='ownershipTp' style='width: 33%; text-align-last : center' onchange='<%=layerName%>fn_ownershipTp(this.value)'  tabindex='1' ><option value=''>없음</option><c:if test='${!empty ownershipTpList}'><c:forEach var='list' items='${ownershipTpList}'><option value='${list.ownershipTp}'><c:out value='${list.ownershipTpNm}' /></option></c:forEach></c:if></select><input type='text' id='ownershipEtcDetail' name='ownershipEtcDetail'  style='width: 66.1%;text-align: left; margin-left:3px;' title='시설소유' onkeyup='checkByte(this, 50)' tabindex='1'  readonly></td></tr>";
			$html += "<tr class='append'><th>수입제원</th><td><select id='revenueSourceTp' name='revenueSourceTp' style='width: 33%; text-align-last : center' onchange='<%=layerName%>fn_revenueSourceTp(this.value)'  tabindex='1' ><option value=''>없음</option><c:if test='${!empty revenueTpList}'><c:forEach var='list' items='${revenueTpList}'><option value='${list.revenueSourceTp}'><c:out value='${list.revenueSourceTpNm}' /></option></c:forEach></c:if></select><input type='text' id='revenueEtcDetail' name='revenueEtcDetail'  style='width: 66.1%;text-align: left;margin-left:3px;' title='수입제원' onkeyup='checkByte(this, 50)' tabindex='1'  readonly><th>중식제공</th><td><select id='lunchTp' name='lunchTp' style='width: 33%; text-align-last : center' onchange='<%=layerName%>fn_lunchTp(this.value)'  tabindex='1' ><option value=''>없음</option><c:if test='${!empty lunchTpList}'><c:forEach var='list' items='${lunchTpList}'><option value='${list.lunchTp}'><c:out value='${list.lunchTpNm}' /></option></c:forEach></c:if></select><input type='text' id='lunchEtcDetail' name='lunchEtcDetail'  style='width: 66.1%;text-align: left;margin-left:3px;' title='중식제공' onkeyup='checkByte(this, 50)' tabindex='1'  readonly></td></tr>";
			$html += "<tr class='append'><th>입소자 정원</th><td><input type='text' id='capacity' name='capacity'  style='width:94.9%; text-align: right;' title='입소자정원' maxlength='4'  onkeyup='removeChar(event);fn_comma(this);'  tabindex='1' > 명 </td><th>면적</th><td><input type='text' id='area' name='area' style='width:100%; text-align:left' title='면적' onkeyup='checkByte(this, 100)'/></td></tr>";
			$html += "<tr class='append'><th>입소자 현원</th><td><input type='text' id='nowCapacity' name='nowCapacity' style='width:94.9%; text-align:right' title='입소자현원' readonly />명 </td><th>서비스공간</th><td><input type='text' id='etcDetail1' name='etcDetail1' style='width:100%; text-align: left;' title='서비스공간' onkeyup='checkByte(this, 200);'></td></tr>";
			$html += "<tr class='append'><th>이용료</th><td style='border-right:none !important'><input type='text' id='etcDetail2' name='etcDetail2' style='width:95.1%; text-align: right;' title='이용료' onkeyup='removeChar(event);fn_comma(this);'  tabindex='1' > 원</td><td colspan='2'  style='border-left:none;'></td></tr>";
		}else if(wffcltyTp == "D03"){
			$('.intendantNm-change-text').text('센터장');
			$html =  "<tr class='append'><th>보조금<span></th><td><input type='checkbox' id='govsubyFg' name='govsubyFg'  onclick='<%=layerName%>govsubyFgCheckBox()' tabindex='1' '/>국비 <input type='checkbox' id='citsubyFg' name='citsubyFg'  onclick='<%=layerName%>citsubyFgCheckBox()' tabindex='1' />시비 <input type='checkbox' id='gusubyFg'  name='gusubyFg'   onclick='<%=layerName%>gusubyFgCheckBox()' tabindex='1' />군구비 </td><th>시설소유</th><td><select id='ownershipTp' name='ownershipTp' style='width: 33%; text-align-last : center' onchange='<%=layerName%>fn_ownershipTp(this.value)'  tabindex='1' ><option value=''>없음</option><c:if test='${!empty ownershipTpList}'><c:forEach var='list' items='${ownershipTpList}'><option value='${list.ownershipTp}'><c:out value='${list.ownershipTpNm}' /></option></c:forEach></c:if></select><input type='text' id='ownershipEtcDetail' name='ownershipEtcDetail'  style='width: 66.1%;text-align: left; margin-left:3px;' title='시설소유' onkeyup='checkByte(this, 50)' tabindex='1'  readonly></td></tr>";
			$html += "<tr class='append'><th>수입제원</th><td><select id='revenueSourceTp' name='revenueSourceTp' style='width: 33%; text-align-last : center' onchange='<%=layerName%>fn_revenueSourceTp(this.value)'  tabindex='1' ><option value=''>없음</option><c:if test='${!empty revenueTpList}'><c:forEach var='list' items='${revenueTpList}'><option value='${list.revenueSourceTp}'><c:out value='${list.revenueSourceTpNm}' /></option></c:forEach></c:if></select><input type='text' id='revenueEtcDetail' name='revenueEtcDetail'  style='width: 66.1%;text-align: left;margin-left:3px;' title='수입제원' onkeyup='checkByte(this, 50)' tabindex='1'  readonly><th>중식제공</th><td><select id='lunchTp' name='lunchTp' style='width: 33%; text-align-last : center' onchange='<%=layerName%>fn_lunchTp(this.value)'  tabindex='1' ><option value=''>없음</option><c:if test='${!empty lunchTpList}'><c:forEach var='list' items='${lunchTpList}'><option value='${list.lunchTp}'><c:out value='${list.lunchTpNm}' /></option></c:forEach></c:if></select><input type='text' id='lunchEtcDetail' name='lunchEtcDetail'  style='width: 66.1%;text-align: left;margin-left:3px;' title='중식제공' onkeyup='checkByte(this, 50)' tabindex='1'  readonly></td></tr>";
			$html += "<tr class='append'><th>이용자 정원</th><td><input type='text' id='capacity' name='capacity'  style='width:94.9%; text-align: right;' title='이용자정원' maxlength='4'  onkeyup='removeChar(event);fn_comma(this);'  tabindex='1' > 명 </td><th>서비스공간</th><td><input type='text' id='etcDetail1' name='etcDetail1' style='width:100%; text-align:left' title='서비스공간'/></td></tr>";
		}else if(wffcltyTp == "B05"){
			$('.intendantNm-change-text').text('센터장');
			$html =  "<tr class='append'><th>보조금<span></th><td><input type='checkbox' id='govsubyFg' name='govsubyFg'  onclick='<%=layerName%>govsubyFgCheckBox()' tabindex='1' '/>국비 <input type='checkbox' id='citsubyFg' name='citsubyFg'  onclick='<%=layerName%>citsubyFgCheckBox()' tabindex='1' />시비 <input type='checkbox' id='gusubyFg'  name='gusubyFg'   onclick='<%=layerName%>gusubyFgCheckBox()' tabindex='1' />군구비 </td><th>시설소유</th><td><select id='ownershipTp' name='ownershipTp' style='width: 33%; text-align-last : center' onchange='<%=layerName%>fn_ownershipTp(this.value)'  tabindex='1' ><option value=''>없음</option><c:if test='${!empty ownershipTpList}'><c:forEach var='list' items='${ownershipTpList}'><option value='${list.ownershipTp}'><c:out value='${list.ownershipTpNm}' /></option></c:forEach></c:if></select><input type='text' id='ownershipEtcDetail' name='ownershipEtcDetail'  style='width: 66.1%;text-align: left; margin-left:3px;' title='시설소유' onkeyup='checkByte(this, 50)' tabindex='1'  readonly></td></tr>";
			$html += "<tr class='append'><th>수입제원</th><td style='border-right:none !important'><select id='revenueSourceTp' name='revenueSourceTp' style='width: 33%; text-align-last : center' onchange='<%=layerName%>fn_revenueSourceTp(this.value)'  tabindex='1' ><option value=''>없음</option><c:if test='${!empty revenueTpList}'><c:forEach var='list' items='${revenueTpList}'><option value='${list.revenueSourceTp}'><c:out value='${list.revenueSourceTpNm}' /></option></c:forEach></c:if></select><input type='text' id='revenueEtcDetail' name='revenueEtcDetail'  style='width: 66.1%;text-align: left;margin-left:3px;' title='수입제원' onkeyup='checkByte(this, 50)' tabindex='1'  readonly></td><td colspan='2'  style='border-left:none;'></td></tr>";
			$html += "<tr class='append'><th>이용자 정원</th><td><input type='text' id='capacity' name='capacity'  style='width:94.9%; text-align: right;' title='이용자정원' maxlength='4'  onkeyup='removeChar(event);fn_comma(this);'  tabindex='1' > 명 </td><th>차량보유</th><td><input type='text' id='etcDetail1' name='etcDetail1' style='width:100%; text-align:left' title='차량보유'/></td></tr>";
		}else if(wffcltyTp == "B07" || wffcltyTp == "B08"){
			$('.intendantNm-change-text').text('센터장');
			$html =  "<tr class='append'><th>보조금<span></th><td><input type='checkbox' id='govsubyFg' name='govsubyFg'  onclick='<%=layerName%>govsubyFgCheckBox()' tabindex='1' '/>국비 <input type='checkbox' id='citsubyFg' name='citsubyFg'  onclick='<%=layerName%>citsubyFgCheckBox()' tabindex='1' />시비 <input type='checkbox' id='gusubyFg'  name='gusubyFg'   onclick='<%=layerName%>gusubyFgCheckBox()' tabindex='1' />군구비 </td><th>시설소유</th><td><select id='ownershipTp' name='ownershipTp' style='width: 33%; text-align-last : center' onchange='<%=layerName%>fn_ownershipTp(this.value)'  tabindex='1' ><option value=''>없음</option><c:if test='${!empty ownershipTpList}'><c:forEach var='list' items='${ownershipTpList}'><option value='${list.ownershipTp}'><c:out value='${list.ownershipTpNm}' /></option></c:forEach></c:if></select><input type='text' id='ownershipEtcDetail' name='ownershipEtcDetail'  style='width: 66.1%;text-align: left; margin-left:3px;' title='시설소유' onkeyup='checkByte(this, 50)' tabindex='1'  readonly></td></tr>";
			$html += "<tr class='append'><th>수입제원</th><td><select id='revenueSourceTp' name='revenueSourceTp' style='width: 33%; text-align-last : center' onchange='<%=layerName%>fn_revenueSourceTp(this.value)'  tabindex='1' ><option value=''>없음</option><c:if test='${!empty revenueTpList}'><c:forEach var='list' items='${revenueTpList}'><option value='${list.revenueSourceTp}'><c:out value='${list.revenueSourceTpNm}' /></option></c:forEach></c:if></select><input type='text' id='revenueEtcDetail' name='revenueEtcDetail'  style='width: 66.1%;text-align: left;margin-left:3px;' title='수입제원' onkeyup='checkByte(this, 50)' tabindex='1'  readonly><th>중식제공</th><td><select id='lunchTp' name='lunchTp' style='width: 33%; text-align-last : center' onchange='<%=layerName%>fn_lunchTp(this.value)'  tabindex='1' ><option value=''>없음</option><c:if test='${!empty lunchTpList}'><c:forEach var='list' items='${lunchTpList}'><option value='${list.lunchTp}'><c:out value='${list.lunchTpNm}' /></option></c:forEach></c:if></select><input type='text' id='lunchEtcDetail' name='lunchEtcDetail'  style='width: 66.1%;text-align: left;margin-left:3px;' title='중식제공' onkeyup='checkByte(this, 50)' tabindex='1'  readonly></td></tr>";
			$html += "<tr class='append'><th>이용자 정원</th><td><input type='text' id='capacity' name='capacity'  style='width:94.9%; text-align: right;' title='이용자정원' maxlength='4'  onkeyup='removeChar(event);fn_comma(this);'  tabindex='1' > 명 </td><th>서비스공간</th><td><input type='text' id='etcDetail1' name='etcDetail1' style='width:100%; text-align:left' title='서비스공간'/></td></tr>";
		}else if(wffcltyTp == "B04"){
			$('.intendantNm-change-text').text('도서관장');
			$html =  "<tr class='append'><th>보조금<span></th><td><input type='checkbox' id='govsubyFg' name='govsubyFg'  onclick='<%=layerName%>govsubyFgCheckBox()' tabindex='1' '/>국비 <input type='checkbox' id='citsubyFg' name='citsubyFg'  onclick='<%=layerName%>citsubyFgCheckBox()' tabindex='1' />시비 <input type='checkbox' id='gusubyFg'  name='gusubyFg'   onclick='<%=layerName%>gusubyFgCheckBox()' tabindex='1' />군구비 </td><th>시설소유</th><td><select id='ownershipTp' name='ownershipTp' style='width: 33%; text-align-last : center' onchange='<%=layerName%>fn_ownershipTp(this.value)'  tabindex='1' ><option value=''>없음</option><c:if test='${!empty ownershipTpList}'><c:forEach var='list' items='${ownershipTpList}'><option value='${list.ownershipTp}'><c:out value='${list.ownershipTpNm}' /></option></c:forEach></c:if></select><input type='text' id='ownershipEtcDetail' name='ownershipEtcDetail'  style='width: 66.1%;text-align: left; margin-left:3px;' title='시설소유' onkeyup='checkByte(this, 50)' tabindex='1'  readonly></td></tr>";
			$html += "<tr class='append'><th>수입제원</th><td style='border-right:none !important'><select id='revenueSourceTp' name='revenueSourceTp' style='width: 33%; text-align-last : center' onchange='<%=layerName%>fn_revenueSourceTp(this.value)'  tabindex='1' ><option value=''>없음</option><c:if test='${!empty revenueTpList}'><c:forEach var='list' items='${revenueTpList}'><option value='${list.revenueSourceTp}'><c:out value='${list.revenueSourceTpNm}' /></option></c:forEach></c:if></select><input type='text' id='revenueEtcDetail' name='revenueEtcDetail'  style='width: 66.1%;text-align: left;margin-left:3px;' title='수입제원' onkeyup='checkByte(this, 50)' tabindex='1'  readonly></td><td colspan='2'  style='border-left:none;'></td></tr>";
			$html += "<tr class='append'><th>이용자</th><td style='border-right:none !important'><input type='text' id='capacity' name='capacity'  style='width:94.9%; text-align: right;' title='이용자' maxlength='4'  onkeyup='removeChar(event);fn_comma(this);'  tabindex='1' > 명 </td><td colspan='2' style='border-left:none !important'></td></tr>";
		}else if(wffcltyTp == "B03"){
			$('.intendantNm-change-text').text('센터장');
			$html =  "<tr class='append'><th>보조금<span></th><td><input type='checkbox' id='govsubyFg' name='govsubyFg'  onclick='<%=layerName%>govsubyFgCheckBox()' tabindex='1' '/>국비 <input type='checkbox' id='citsubyFg' name='citsubyFg'  onclick='<%=layerName%>citsubyFgCheckBox()' tabindex='1' />시비 <input type='checkbox' id='gusubyFg'  name='gusubyFg'   onclick='<%=layerName%>gusubyFgCheckBox()' tabindex='1' />군구비 </td><th>시설소유</th><td><select id='ownershipTp' name='ownershipTp' style='width: 33%; text-align-last : center' onchange='<%=layerName%>fn_ownershipTp(this.value)'  tabindex='1' ><option value=''>없음</option><c:if test='${!empty ownershipTpList}'><c:forEach var='list' items='${ownershipTpList}'><option value='${list.ownershipTp}'><c:out value='${list.ownershipTpNm}' /></option></c:forEach></c:if></select><input type='text' id='ownershipEtcDetail' name='ownershipEtcDetail'  style='width: 66.1%;text-align: left; margin-left:3px;' title='시설소유' onkeyup='checkByte(this, 50)' tabindex='1'  readonly></td></tr>";
			$html += "<tr class='append'><th>수입제원</th><td style='border-right:none !important'><select id='revenueSourceTp' name='revenueSourceTp' style='width: 33%; text-align-last : center' onchange='<%=layerName%>fn_revenueSourceTp(this.value)'  tabindex='1' ><option value=''>없음</option><c:if test='${!empty revenueTpList}'><c:forEach var='list' items='${revenueTpList}'><option value='${list.revenueSourceTp}'><c:out value='${list.revenueSourceTpNm}' /></option></c:forEach></c:if></select><input type='text' id='revenueEtcDetail' name='revenueEtcDetail'  style='width: 66.1%;text-align: left;margin-left:3px;' title='수입제원' onkeyup='checkByte(this, 50)' tabindex='1'  readonly></td><td colspan='2'  style='border-left:none;'></td></tr>";
			$html += "<tr class='append'><th>일평균 인원</th><td><input type='text' id='etcDetail1' name='etcDetail1' style='width:95.1%; text-align: right;' title='일평균인원' maxlength='4'  onkeyup='removeChar(event);fn_comma(this);'  tabindex='1' > 명</td><th>주평균 인원</th><td><input type='text' id='etcDetail2' name='etcDetail2' style='width:95.1%; text-align: right;' title='주평균인원'  maxlength='4'  onkeyup='removeChar(event);fn_comma(this);' tabindex='1' > 명</td></tr>";
		}else if(wffcltyTp == "D04"){
			$('.intendantNm-change-text').text('센터장');
			$html =  "<tr class='append'><th>보조금<span></th><td><input type='checkbox' id='govsubyFg' name='govsubyFg'  onclick='<%=layerName%>govsubyFgCheckBox()' tabindex='1' '/>국비 <input type='checkbox' id='citsubyFg' name='citsubyFg'  onclick='<%=layerName%>citsubyFgCheckBox()' tabindex='1' />시비 <input type='checkbox' id='gusubyFg'  name='gusubyFg'   onclick='<%=layerName%>gusubyFgCheckBox()' tabindex='1' />군구비 </td><th>이용대상</th><td><input type='text' id='etcDetail1' name='etcDetail1' style='width: 100%; text-align: left;' title='이용대상' onkeyup='checkByte(this, 200);' tabindex='1' ></td></tr>";
			$html += "<tr class='append'><th>지원금액</th><td><input type='text' id='etcDetail2' name='etcDetail2' style='width: 95.1%; text-align: right;' title='지원금액' onkeyup='removeChar(event);fn_comma(this);checkByte(this, 200);'  tabindex='1' >원</td><th>수리품목</th><td><input type='text' id='etcDetail3' name='etcDetail3' style='width: 100%; text-align: left;' title='수리품목' onkeyup='checkByte(this, 200)'  tabindex='1' ></td></tr>";
			$html += "<tr class='append'><th>일평균 인원</th><td colspan='3'><input type='text' id='etcDetail4' name='etcDetail4' style='width: 100%; text-align: left;' title='제출서류' onkeyup='checkByte(this, 200)' tabindex='1' ></td></tr>";
		}else if(wffcltyTp == "D05"){
			$('.intendantNm-change-text').text('센터장');
			$html =  "<tr class='append'><th>보조금<span></th><td style='border-right:none !important'><input type='checkbox' id='govsubyFg' name='govsubyFg'  onclick='<%=layerName%>govsubyFgCheckBox()' tabindex='1' '/>국비 <input type='checkbox' id='citsubyFg' name='citsubyFg'  onclick='<%=layerName%>citsubyFgCheckBox()' tabindex='1' />시비 <input type='checkbox' id='gusubyFg'  name='gusubyFg'   onclick='<%=layerName%>gusubyFgCheckBox()' tabindex='1' />군구비 </td><td colspan='2'  style='border-left:none;'></td></tr>";
		}else if(wffcltyTp == "D06"){
			$('.intendantNm-change-text').text('센터장');
			$html =  "<tr class='append'><th>보조금<span></th><td style='border-right:none !important'><input type='checkbox' id='govsubyFg' name='govsubyFg'  onclick='<%=layerName%>govsubyFgCheckBox()' tabindex='1' '/>국비 <input type='checkbox' id='citsubyFg' name='citsubyFg'  onclick='<%=layerName%>citsubyFgCheckBox()' tabindex='1' />시비 <input type='checkbox' id='gusubyFg'  name='gusubyFg'   onclick='<%=layerName%>gusubyFgCheckBox()' tabindex='1' />군구비 </td><td colspan='2'  style='border-left:none;'></td></tr>";
		}else if(wffcltyTp == "D05" || wffcltyTp == "D06" || wffcltyTp == "E01" || wffcltyTp == "E02" || wffcltyTp == "B06" || wffcltyTp == "D01" || wffcltyTp == "D02" ){
			$('.intendantNm-change-text').text('센터장');
			$html =  "<tr class='append'><th>보조금<span></th><td><input type='checkbox' id='govsubyFg' name='govsubyFg'  onclick='<%=layerName%>govsubyFgCheckBox()' tabindex='1' '/>국비 <input type='checkbox' id='citsubyFg' name='citsubyFg'  onclick='<%=layerName%>citsubyFgCheckBox()' tabindex='1' />시비 <input type='checkbox' id='gusubyFg'  name='gusubyFg'   onclick='<%=layerName%>gusubyFgCheckBox()' tabindex='1' />군구비 </td><th>시설소유</th><td><select id='ownershipTp' name='ownershipTp' style='width: 33%; text-align-last : center' onchange='<%=layerName%>fn_ownershipTp(this.value)'  tabindex='1' ><option value=''>없음</option><c:if test='${!empty ownershipTpList}'><c:forEach var='list' items='${ownershipTpList}'><option value='${list.ownershipTp}'><c:out value='${list.ownershipTpNm}' /></option></c:forEach></c:if></select><input type='text' id='ownershipEtcDetail' name='ownershipEtcDetail'  style='width: 66.1%;text-align: left; margin-left:3px;' title='시설소유' onkeyup='checkByte(this, 50)' tabindex='1'  readonly></td></tr>";
			$html += "<tr class='append'><th>수입제원</th><td style='border-right:none !important'><select id='revenueSourceTp' name='revenueSourceTp' style='width: 33%; text-align-last : center' onchange='<%=layerName%>fn_revenueSourceTp(this.value)'  tabindex='1' ><option value=''>없음</option><c:if test='${!empty revenueTpList}'><c:forEach var='list' items='${revenueTpList}'><option value='${list.revenueSourceTp}'><c:out value='${list.revenueSourceTpNm}' /></option></c:forEach></c:if></select><input type='text' id='revenueEtcDetail' name='revenueEtcDetail'  style='width: 66.1%;text-align: left;margin-left:3px;' title='수입제원' onkeyup='checkByte(this, 50)' tabindex='1'  readonly></td><td colspan='2'  style='border-left:none;'></td></tr>";
		}
		
		$(".<%=layerName%> .append").remove();
		$(".<%=layerName%> #align_common:last-child").append($html);
	}

</script>

