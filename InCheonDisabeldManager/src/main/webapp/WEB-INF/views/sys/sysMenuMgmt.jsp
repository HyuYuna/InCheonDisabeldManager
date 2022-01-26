<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
    String layerName = request.getParameter("layerName");
%>

<style type="text/css">
#<%=layerName%>tree .lnb ul li.depth1 > a:hover{background-color:#ceebfe;}
.tree {height: 708px; overflow-y: scroll; overflow-x: hidden; border:2px solid #5c78a7; padding: 8px;}
</style>

				<!-- titleWrap : start -->
                <div class="titleWrap">
                    <h1>프로그램 메뉴 관리</h1>
					<jsp:include page="../common/commonBtn.jsp">
						<jsp:param value="<%=layerName%>" name="layerName" />
					</jsp:include>                    
                </div>
                <!-- titleWrap : end -->


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
                                <div class="subtitle">메뉴 리스트</div>
                                <div class="subBtnGroup">
                                </div>
                            </div>
                             <div id="<%=layerName%>tree" class="tree">
                        </td>
                        <td>&nbsp;</td>
                        <td>
                            <div class="subtitleGroup">
                                <div class="subtitle">메뉴 권한</div>
                                <div class="subBtnGroup">
                                </div>
                            </div>
								<table cellpadding="0" cellspacing="0" class="dataTable" id="align_common" border="1">
									<colgroup>
										<col width="15%" />
										<col width="35%" />
									</colgroup>
									<tr>
							<th><span class="essentialItem">상위메뉴<span></th>
							<td>
								<select id="<%=layerName%>상위메뉴코드" class="sel_type" style="width: 40%; text-align-last : center"">
								</select>
							</td>
						</tr>
						<tr>
							<th><span class="essentialItem">메뉴코드</span></th>
							<td>
								<input type="text" id="<%=layerName%>메뉴코드" style="width: 40%;" onkeyup="checkByte(this, 6)"/>
							</td>
						</tr>
						<tr>
							<th><span class="essentialItem">메뉴명</span></th>
							<td>
								<input type="text" id="<%=layerName%>메뉴명" style="width: 40%;" onkeyup="checkByte(this, 50)"/>
							</td>
						</tr>
						<tr>
							<th><span class="essentialItem">메뉴순서</span></th>
							<td>
								<input type="text" id="<%=layerName%>정렬순서"  style="width: 40%;" maxlength="5" onkeyup="removeChar(event);"/>
							</td>
						</tr>
						<tr>
							<th><span class="essentialItem" class="check">사용유무</span></th>
							<td>
								<select id="<%=layerName%>사용여부" class="sel_type" style="width: 40%; text-align-last : center"">
									<option value="1">사용</option>
									<option value="0">미사용</option>
								</select>
							</td>
						</tr>
							</table>
                       </td>
                   </tr>
               </table>
               <!-- layout table : end -->


<script type="text/javascript">
	// 조회 클릭시
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .search').click(function(){
		<%=layerName%>loadData();
	});
	
	// 신규
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .new').click(function(){
		<%=layerName%>clearDetail();
	});
	
	// 저장
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .save').click(function(){
		<%=layerName%>saveDetail();
	});
	
	// 닫기
	$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .close').click(function(){	
		mFnc.tabMenuClose('<%=layerName%>');
	});
	
	
	$(function () {
		// 콤보박스
		<%=layerName%>initComboBoxCmmTR('#<%=layerName%>상위메뉴코드',{'clsCd':'_MENU_CD','HIGH_MENU_CD':'000000'},'메뉴코드','메뉴명','','3');
		
		<%=layerName%>loadData();
		
		resizeMenuContent();
		
	});
	
	
	
	//조회
	function <%=layerName%>loadData() {			
		var sendData = {"useFg" : "1"}; //1은 사용중인 메뉴,  0 은 삭제, null은 전체
		
		GRIT.tran.send({
			url: "/sys/searchSysMenuMgmt",
			sendData: sendData,
			success: function(result){
				if(result.data == ''){
					GRIT.msg.alert("조회 조건에 맞는 데이터가 없습니다.");
			  	}
				<%=layerName%>setTreeData(result.data);
				<%=layerName%>setTreeView(result.data);
				<%=layerName%>clearDetail();
			},
			loadingTarget : "<%=layerName%>"
		});
		
		
	}
	
	var <%=layerName%>asisItem = {};	// 수정전 값
	var <%=layerName%>treeData = {};
	
	// 트리정보
	function <%=layerName%>setTreeData(data) {

		var m = {};
		for(var i = 0 ; i < data.length ; i++){
			var item = data[i];
			var key = item.메뉴코드 || '';
			m[key] = item;
		}
		<%=layerName%>treeData = m;
	}
	
	// 트리뷰
	function <%=layerName%>setTreeView(data) {

		var tree = $("#<%=layerName%>tree");
		tree.empty();

		var ul1 = $('<ul class="sub_menu_lst"/>');

		// 상위메뉴
		for(var i=0; i<data.length; i++) {
			var item = data[i];
			if(item.레벨 == '1') {
				ul1.append('<li class="deactive" id="<%=layerName%>'+item.메뉴코드+'" data-메뉴코드="'+item.메뉴코드+'"><a href="#"><strong>'+item.메뉴명+'('+item.메뉴코드+')'+'</strong></a></li>');
			}
		}
		tree.append(ul1);

		// 메뉴
		for(var i=0; i<data.length; i++) {
			var item = data[i];
			if(item.레벨 == '2') {
				var li4 = tree.find("#<%=layerName%>"+item.상위메뉴코드);
				if(li4.find("> ul:eq(0)").length == 0) {
					li4.append('<ul class="leaf_menu_lst"/>');
				}
				var ul4 = li4.find("> ul:eq(0)");
				ul4.append('<li id="<%=layerName%>'+item.메뉴코드+'" data-메뉴코드="'+item.메뉴코드+'"><a href="#"><span>'+item.메뉴명+'('+item.메뉴코드+')'+'</span></a></li>');
			}
		}

		// 자식이 없으면 - 표시
		$("#<%=layerName%>tree li").each(function(){

			var key = $(this).data('분류코드');
			var child = $("#<%=layerName%>tree #<%=layerName%>"+key+" li");

			if(child.length == 0) {
				$(this).removeClass("deactive");
			} else {
				$(this).addClass("deactive");
			}
		});

		// 이벤트 추가
		$("#<%=layerName%>tree li").click(function(e){

			var item = this;
			
			<%=layerName%>treeClicked(item);

			return false;
		})
	}
	
	// 트리항목 클릭 이벤트
	function <%=layerName%>treeClicked(elem) {

		var key = $(elem).data('메뉴코드');

		if(<%=layerName%>treeData[key].레벨 == "1") {
			if($(elem).hasClass("active")) {
				$(elem).removeClass("active");
			} else {
				$(elem).addClass("active");
			}
		} else if(<%=layerName%>treeData[key].레벨 == "2") {
			$("#<%=layerName%>tree li").css("background-color","");
			$(elem).css("background-color","#7fceff");
		}

		<%=layerName%>setDetail(<%=layerName%>treeData[key]);
		
	}
	
	// 상세정보를 설정한다.
	function <%=layerName%>setDetail(data) {

		var item = {
				'상위메뉴코드':'',
				'메뉴코드':'',
				'메뉴명':'',
				'정렬순서':'',
				'사용여부':'',
				'등록일시':'',
				'등록자':'',
				'수정일시':'',
				'수정자':''
		};

		// 값 보관
		for(var key in item) {
			<%=layerName%>asisItem[key] = data[key] || '';
		}

		for(var key in item) {
			if(key == '수정일시'
				|| key == '수정자'
				|| key == '등록일시'
				|| key == '등록자'
				) {
				$("#<%=layerName%>"+key).text(data[key] || '');
			} else {
				$("#<%=layerName%>"+key).val(data[key] || '');
			}
		}

		$("#<%=layerName%>상위메뉴코드").prop("disabled", true);
		$("#<%=layerName%>메뉴코드").prop("disabled", true);
	}

	
	// 상세정보를 소거한다.
	function <%=layerName%>clearDetail() {

		$("#<%=layerName%>tree li").css("background-color","");

		// 소거할 key를 지정
		var item = {
				'상위메뉴코드':'',
				'메뉴코드':'',
				'메뉴명':'',
				'정렬순서':'',
				'사용여부':'',
				'등록일시':'',
				'등록자':'',
				'수정일시':'',
				'수정자':''
		};

		for(var key in item) {
			if(key == '상위메뉴코드'
				) {
				$("#<%=layerName%>"+key).val("000000");
			} else if(key == '등록일시'
				|| key == '등록자'
				|| key == '수정일시'
				|| key == '수정자'
					) {
				$("#<%=layerName%>"+key).text("");
			} else if(key == '메뉴순서'
				) {
				$("#<%=layerName%>"+key).val("1");
			} else if(key == '사용여부'
				) {
				$("#<%=layerName%>"+key).val("0");
			} else {
				$("#<%=layerName%>"+key).val("");
			}
		}

		// 값 보관
		for(var key in item) {
			if(key == '상위메뉴코드') {
				<%=layerName%>asisItem[key] = "000000";
			} else if(key == '메뉴순서') {
				<%=layerName%>asisItem[key] = "1";
			} else if(key == '사용여부') {
				<%=layerName%>asisItem[key] = "0";
			} else {
				<%=layerName%>asisItem[key] = "";
			}
		}

		$("#<%=layerName%>상위메뉴코드").prop("disabled", false);
		$("#<%=layerName%>메뉴코드").prop("disabled", false);
	}
	
	
	// 상위메뉴조회를 추가한 콤보박스
	function <%=layerName%>initComboBoxCmmTR(asEl, asParam, asCd, asCdText, asDefaultVal, asProcFg){
		var $tgObj = $(asEl);
		$tgObj.empty();	//$tgObj.find('option').remove();

		if(asProcFg == '0'){
		} else if(asProcFg == '1'){ //전체
			$tgObj.append("<option value=''>전체</option>");
		} else if(asProcFg == '2'){ //선택
			$tgObj.append("<option value=''>선택</option>");
		} else if(asProcFg == '3'){ //ROOT
			$tgObj.append("<option value='000000'>없음</option>");
		}

		if(typeof asParam["clsCd"] == "undefined" || asParam["clsCd"] == "") {
			return;
		}

		var param = {};

		for(var key in asParam) {
			param[key] = asParam[key];
		}

		GRIT.tran.send({
			url: "/sys/searchComboSysMenuMgmt",
			async: asParam["async"] || true,
			sendData: param,
			success: function(result){
				var $select = $(asEl);
				$.each(result.rows, function(i, item){
					var code = item[asCd];
					code = code.substr(3,6);
					if(code == "000"){
						$select.append("<option value='" + item[asCd] + "'>" + item[asCdText] +"</option>");
					}
				});

				if(GRIT.valid.isNull(asDefaultVal)){
					$("option:eq(0)", $select).attr("selected","selected");
				} else {
					$("option[value='" + asDefaultVal + "']", $select).attr("selected","selected");
				}
			},
			loading: false
		});

	}

	
	function <%=layerName%>saveDetail() {

		// 전송정보 조립
		var item = {
				'상위메뉴코드':'',
				'메뉴코드':'',
				'메뉴명':'',
				'정렬순서':'',
				'사용여부':'',
				'레벨':''
		};



		var menuCd = $.trim($("#<%=layerName%>" + "메뉴코드").val());
		var menuNm = $.trim($("#<%=layerName%>" + "메뉴명").val());
		var sortSeq = $.trim($("#<%=layerName%>" + "정렬순서").val());

		if(menuCd == ""){
			GRIT.msg.alert("메뉴코드를 입력하여 주세요.", function(){$("#<%=layerName%>" + "메뉴코드").focus();}());
			return;
		}

		if(menuNm == ""){
			GRIT.msg.alert("메뉴명을 입력하여 주세요.", function(){$("#<%=layerName%>" + "메뉴명").focus();}());
			return;
		}

		if(sortSeq == ""){
			GRIT.msg.alert("메뉴순서를 입력하여 주세요.", function(){$("#<%=layerName%>" + "정렬순서").focus();}());
			return;
		}


		for(var key in item) {
			item[key] = $("#<%=layerName%>"+key).val();
		}
		if($("#<%=layerName%>상위메뉴코드").val() == "000000") {
			item.레벨 = "1";
		} else {
			item.레벨 = "2";
		}
		
		if(!confirm("저장 하시겠습니까?")){
			return false;
	    } 
		
		GRIT.tran.send({
			url: "/sys/saveSysMenuMgmt",
			sendData: item,
			success: function(result){
				if(result.rtnCode == '0'){
					//성공
					GRIT.msg.alert(result.message);
					$('.content .section-wrap .boxcontent.<%=layerName%> .section-top .btn-group a.search').trigger('click');
					$('.section-wrap .boxcontent.<%=layerName%> .titleWrap .btnMainGroup .search').trigger('click');
					<%=layerName%>initComboBoxCmmTR('#<%=layerName%>상위메뉴코드',{'clsCd':'_MENU_CD','P_MENU_CD':'000000'},'메뉴코드','메뉴명','','3');
				}else{
					//실패
					GRIT.msg.alert(result.message);
				}
			},
			loadingTarget : "<%=layerName%>"
		});

		<%=layerName%>clearDetail();
	}
	
</script>