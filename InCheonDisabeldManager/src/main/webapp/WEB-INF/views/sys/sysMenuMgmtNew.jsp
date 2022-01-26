<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String layerName = request.getParameter("layerName");
%>

<style type="text/css">
#<%=layerName%>tree .lnb ul li.depth1 > a:hover{background-color:#ceebfe;}
</style>

<!-- section-top (스크롤 X) -->
<div class="section-top">
	<!-- btn-group -->
	<jsp:include page="../common/commonBtn.jsp">
		<jsp:param value="<%=layerName %>" name="layerName"/>
	</jsp:include>
	<!-- //btn-group -->
</div>
<!-- //section-top -->

<!-- section : 업무영역(스크롤 되는 부분) -->
<div class="section">
	<div class="horizon-fix full-height fl-l" style="width: 400px;">
		<div class="box-top">
			<span class="sub-tit">메뉴 리스트</span>
		</div>

		<div class="box-wrap vertical-resize">
			<div class="box-con-black">
		
				<div id="<%=layerName%>tree" class="tree">
				</div>
			</div>
		</div>
 	</div>

	<div class="box-wrap horizon-resize full-height fl-r">
		<!-- box-top -->
		<div class="box-top">
			<span class="sub-tit">메뉴정보</span>
		</div>
		<!-- //box-top -->
		<div class="vertical-fix mb10">
			<div class="box-con">
				<table class="tb01 short"summary="메뉴 정보 테이블 입니다.">
					<caption>메뉴 정보</caption>
					<colgroup>
						<col width="65px">
						<col width="*">
					<colgroup>
					<tbody>
						<tr>
							<th scope="row"><span class="necessary">(필수)</span>
								상위메뉴
							</th>
							<td>
								<select id="<%=layerName%>상위메뉴코드" class="sel_type">
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><span class="necessary">(필수)</span>
								메뉴코드
							</th>
							<td>
								<input type="text" id="<%=layerName%>메뉴코드"/>
							</td>
						</tr>
						<tr>
							<th scope="row"><span class="necessary">(필수)</span>
								메뉴명
							</th>
							<td>
								<input type="text" id="<%=layerName%>메뉴명"/>
							</td>
						</tr>
						<tr>
							<th scope="row"><span class="necessary">(필수)</span>
								메뉴순서
							</th>
							<td>
								<input type="text" id="<%=layerName%>정렬순서"/>
							</td>
						</tr>
						<tr>
							<th scope="row"  class="check">
								파일명
							</th>
							<td>
								<input type="text" id="<%=layerName%>경로명" size="40"/>
							</td>
						</tr>
						<tr>
							<th scope="row"  class="check">
								사용유무
							</th>
							<td>
								<select id="<%=layerName%>사용여부" class="sel_type" >
									<option value="1">사용</option>
									<option value="0">미사용</option>
								</select>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

		<div class="box-top">
			<span class="sub-tit">메뉴 권한 리스트</span>
		</div>

		<div class="vertical-resize">
			<!-- 그리드 영역 -->
	        <div id="<%=layerName%>grid_wrap" style="width:1200px;height:586px;"></div>
	        <!-- 그리드 영역 -->
		</div>
	</div>

	<div class="clear"></div>
</div>
<!-- //section : 업무영역 -->

<script type="text/javascript">
	//조회 클릭시
	$('.content .section-wrap .boxcontent.<%=layerName%> .section-top .btn-group a.search').click(function(){
		<%=layerName%>loadData();
	});
	
	// 신규
	$('.content .section-wrap .boxcontent.<%=layerName%> .section-top .btn-group a.new').click(function(){
		<%=layerName%>clearDetail();
	});
	
	// 저장
	$('.content .section-wrap .boxcontent.<%=layerName%> .section-top .btn-group a.save').click(function(){
		<%=layerName%>saveDetail();
	});
	
	// 닫기
	$('.content .section-wrap .boxcontent.<%=layerName%> .section-top .btn-group a.close').click(function(){
		mFnc.tabMenuClose('<%=layerName%>');
	});
	
	// AUIGrid 생성 후 반환 ID
	var <%=layerName%>myGridID;
	// AUIGrid 칼럼 설정
	/* var columnLayout = [ {dataField : "grpCd",headerText : "그룹코드",width : 130} 
	                    ,{dataField : "grpNm",headerText : "그룹명",width : 214 ,style : "aui-grid-user-custom-left"} 
	]; */
	var <%=layerName%>columnLayout = [ {dataField : "그룹코드",headerText : "그룹코드",width : 500} 
	                    ,{dataField : "그룹명",headerText : "그룹명",width : 600 ,style : "aui-grid-user-custom-left"} 
	];
	
	$(function () {
		// 콤보박스
		<%=layerName%>initComboBoxCmmTR('#<%=layerName%>상위메뉴코드',{'clsCd':'_MENU_CD','P_MENU_CD':'000000'},'메뉴코드','메뉴명','','3');
		<%=layerName%>initComboBoxCmmTR('#<%=layerName%>사용여부',{'clsCd':'USE000'},'cd','cdNm','0','0');
		
		// AUIGrid 그리드를 생성합니다.
		<%=layerName%>createAUIGrid(<%=layerName%>columnLayout);
		
		$("#searchBtn").on("click", function(){
			<%=layerName%>loadData();
		});
		
		resizeMenuContent();
		
	});
	
	// AUIGrid 를 생성합니다.
	function <%=layerName%>createAUIGrid(columnLayout) {
		var <%=layerName%>auiGridProps = {
			showRowCheckColumn : false
		};
		
		// 실제로 #grid_wrap 에 그리드 생성
		<%=layerName%>myGridID = AUIGrid.create("#<%=layerName%>grid_wrap", columnLayout, <%=layerName%>auiGridProps);
		
		// 선택 체인지 이벤트 바인딩
		/* AUIGrid.bind(myGridID, "selectionChange", function(event) {
			var primeCell = event.primeCell; // 선택 대표 셀
			var item = primeCell.item; // 행 정보
			setFieldToFormWindow(primeCell, item);
			$("#rowIndex").val(primeCell.rowIndex);
		});
		 */
		// 그리드 ready 이벤트 바인딩
		//AUIGrid.bind(myGridID, "ready", auiGridCompleteHandler);
	}

	// 그리드 ready 이벤트 핸들러
	/* function auiGridCompleteHandler(event) {
		var rowIndex = $("#rowIndex").val();
		
		if (rowIndex != ""){
			AUIGrid.setSelectionByIndex(myGridID, rowIndex); // 선택한 셀 선택되도록 지정
		}else{
			AUIGrid.setSelectionByIndex(myGridID, 0, 0); // 첫번째 셀 선택되도록 지정
		}
	}; */
	
	// 셀 셀렉션 변경 시 아이템의 정보를 Form 필드에 세팅함
	/* function setFieldToFormWindow(primeCell, item) {
		$("#linkCode").val(item.linkCode);
		$("#itmCode").val(item.itmCode);
		$("#itmName").val(item.itmName);
		$("#itmType").val(item.itmType);
		
		$("#wprc1").val(commaNum(item.wprc1));
		$("#sprc1").val(commaNum(item.sprc1));
		
	} */
	
	//조회
	function <%=layerName%>loadData () {			
		var sendData = {"useYn" : "1", "aspCode" : "0001"}; //1은 사용중인 메뉴,  0 은 삭제, null은 전체
		
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
		<%=layerName%>searchGroup(<%=layerName%>treeData[key]);
	}
	
	// 상세정보를 설정한다.
	function <%=layerName%>setDetail(data) {

		var item = {
				'상위메뉴코드':'',
				'메뉴코드':'',
				'메뉴명':'',
				'정렬순서':'',
				'경로명':'',
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
	
	// 권한그룹 목록조회
	function <%=layerName%>searchGroup(item) {

		var sendData = {	// 상세정보 요청시 보낼 전송정보
			"MENU_CD" : item.메뉴코드
		};

		GRIT.tran.send({
			url: "/sys/searchGroupSysMenuMgmt",
			sendData: sendData,
			success: function(result){
				//gridApp2.setData(result.data);
				AUIGrid.setGridData(<%=layerName%>myGridID, result.data);
			},
			loadingTarget : "<%=layerName%>"
		});

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
				'경로명':'',
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
					$select.append("<option value='" + item[asCd] + "'>" + item[asCdText] +"</option>");
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
				'경로명':'',
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

		GRIT.tran.send({
			url: "/sys/saveSysMenuMgmt",
			sendData: item,
			success: function(result){
				if(result.rtnCode == '0'){
					//성공
					GRIT.msg.alert(result.message);
					$('.content .section-wrap .boxcontent.<%=layerName%> .section-top .btn-group a.search').trigger('click');
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