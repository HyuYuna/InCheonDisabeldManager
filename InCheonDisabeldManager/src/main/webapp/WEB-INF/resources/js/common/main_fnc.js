// event 처리
$(document)    
// LNB 대 메뉴 처리
//.on('click','#lnbWrap .lnb ul.lnb_list li a.first', function(e){
.on('click','#lnbWrap a.first', function(e){
	var $this = $(this).parent('div');
	var _typename = $this.data('typename');
	var _typetitle = $this.data('typetitle');

	var _topname = _typename.substring(0,2) +'_'+ _typename.substring(2);
	//console.log(_topname);
	if ($this.hasClass('active')) {
		$this.removeClass('active');
		$this.next(".menuDepth2").slideUp();
	} else {
		$this.addClass('active');
		$this.next(".menuDepth2").slideDown();
		$('#lnbWrap h2').removeClass().addClass(_topname);
	}
})

// 탭메뉴 및 컨텐프 생성 영역 만들기
//.on('click','#lnbWrap .lnb ul.lnb_list li.depth1 ul.depth2 li a', function(e){
.on('click','#lnbWrap .menuDepth2List li  a', function(e){
	__openMenuTab('menu', this, {});
})

// 탭 메뉴 활성화 처리
//.on('click','#contentWrap .content .content-top .tab-wrap ul li.tabtopmenu span.tabact', function(e){
.on('click','.topMdiWrap .mdi a', function(e){
	var $this = $(this).parents("div");
	//var _layername = $this.parents('li').data('layername');
	var _layername = $this.data('layername');
	mFnc.tabActive(_layername);
	
	gridResize();
})

// 탭 메뉴 활성화 처리
.on('click','#contentWrap .content .content-top .tab-all-close-wrap ul li.tabclosebox', function(e){
	var $this = $(this);
	var _layername = $this.data('layername');
	mFnc.tabActive(_layername);
})

// 탭 메뉴 닫기(X) 처리
//.on('click','#contentWrap .content .content-top .tab-wrap ul li .tab-close', function(e){
.on('click','.topMdiWrap .mdi .tab-close', function(e){
	var $this = $(this);
	//alert("tab-close");
	var _layername = $this.parents("div").data('layername');
	GRIT.debug('_layername : ' + _layername);
	
	mFnc.tabMenuClose(_layername);
	
	gridResize();
})

//   홈화면
.on('click','#headerWrap .appTitle', function(e){
	__openMenuTab('home', this, {});
})

//  로그아웃
//.on('click','#contentWrap #left-top-menu a.btn-logout', function(e){
.on('click','.btn-logout', function(e){
	sessionStorage.clear();
	window.location.href='/common/logout';
})

// 탭 모두 닫기
/*.on('click','#headerWrap .top-menu a.btn-reset', function(e){
	var countTab = mFnc.tabCount();
	if(countTab > 0) {
		//  탭 모두 닫기
		mFnc.alertConfirm('tabAllClose','모든 탭을 닫으시겠습니까?','mFnc.taballclose','');
	}
})*/

.ready( function() {
	
	
	// 사용자 정보 넣기
	userInfo.userNm		= sessionStorage.getItem('userNm');
	userInfo.userGroupCd = sessionStorage.getItem('userGroupCd');
	userInfo.nowLoginIp	= sessionStorage.getItem('nowLoginIp');
	userInfo.nowLogDtm	= sessionStorage.getItem('nowLogDtm');
	userInfo.lastLoginIp	= sessionStorage.getItem('lastLoginIp') 	|| '127.0.0.1';
	userInfo.lastLogDtm	= sessionStorage.getItem('lastLogDtm') 	 || '1990-12-11 00:01';
	userInfo.wffcltyCd	= sessionStorage.getItem('wffcltyCd') 	 || '';
	
	
    var vUserNm = userInfo.userNm;
    var vUserGroupCd = userInfo.userGroupCd;
    var vNowLoginIp = userInfo.nowLoginIp;
    var vNowLoginDtm = userInfo.nowLogDtm;
    
    if(vUserNm == null || vUserGroupCd == null || vNowLoginIp == null || vNowLoginDtm == null){
    	$.ajax({
    		url: '/common/userInfo',
    		type: 'post',
    		cache: false,
    		contentType: "application/json; charset=utf-8",
    		success: function(json){
    			userInfo.userNm		 = json.userNm;      
    			userInfo.userGroupCd = json.userGroupCd; 
    			userInfo.linkNm	     = json.linkNm;      
    			userInfo.nowLoginIp = json.nowLoginIp;  
    			userInfo.nowLogDtm   = json.nowLogDtm;   
    			userInfo.wffcltyCd	 = json.wffcltyCd;  
    			
    			if(userInfo.userGroupCd == "A"){
    				userInfo.linkNm = "인천시 장애인 복지과";
    			}else if(userInfo.userGroupCd == "B"){
    				userInfo.linkNm = "인천시 군/구청";
    			}else if(userInfo.userGroupCd == "E"){
    				userInfo.linkNm = "관리자";
    			}else{
    				userInfo.linkNm = json.linkNm;
    			}
    			
    			// 사용자 이름 표시
    			//var $userNm = $('#contentWrap #left-top-menu .user-info p');
    			var $userNm = $('.user-info');
    			$userNm.text( userInfo.userNm );
    			
    			// 사용자 시설 표시
    			var $linkNm = $('.userDivision');
    			$linkNm.text( userInfo.linkNm );

    			// 접속 IP 표시
    			//var $nowLoginIp = $('#footerWrap p span.enter-ip span.enterIp');
    			var $nowLoginIp = $('#footerWrap span.enterIp');
    			$nowLoginIp.text( userInfo.nowLoginIp );

    			// 접속 시간 표시
    			//var $nowLogDtm = $('#footerWrap p span.enter-time span.enterTime');
    			var $nowLogDtm = $('#footerWrap span.enterTime');
    			$nowLogDtm.text( userInfo.nowLogDtm );
    		},
    		error: function() {
    			mFnc.layerError();
    			return;
    		}
    	});
    }

	if(userInfo.userGroupCd == "A"){
		userInfo.linkNm = "인천시 장애인 복지과";
	}else if(userInfo.userGroupCd == "B"){
		userInfo.linkNm = "인천시 군/구청";
	}else if(userInfo.userGroupCd == "E"){
		userInfo.linkNm = "관리자";
	}else{
		userInfo.linkNm = sessionStorage.getItem('linkNm');
	}
	
	// 사용자 이름 표시
	//var $userNm = $('#contentWrap #left-top-menu .user-info p');
	var $userNm = $('.user-info');
	$userNm.text( userInfo.userNm );
	
	// 사용자 시설 표시
	var $linkNm = $('.userDivision');
	$linkNm.text( userInfo.linkNm );

	// 접속 IP 표시
	//var $nowLoginIp = $('#footerWrap p span.enter-ip span.enterIp');
	var $nowLoginIp = $('#footerWrap span.enterIp');
	$nowLoginIp.text( userInfo.nowLoginIp );

	// 접속 시간 표시
	//var $nowLogDtm = $('#footerWrap p span.enter-time span.enterTime');
	var $nowLogDtm = $('#footerWrap span.enterTime');
	$nowLogDtm.text( userInfo.nowLogDtm );

	// 현재 시간 표시
	__setCurrentTime();

	// 홈 실행
	$('#headerWrap .appTitle').click();

	// Left 메뉴탭 호출
	fn_getLeftTabMenu();

});

function fn_getLeftTabMenu() {
// 권한에 따른 L메뉴탭 처리
//	var param = {
//		'userId' : ""
//	};

//	param.userId = $.cookie('userId');

	// 서버 통신
	$.ajax({
		url: '/common/getUserMenuList',
		type: 'post',
		cache: false,
		//data: JSON.stringify(param),
		//datatype: 'json',
		contentType: "application/json; charset=utf-8",
		success: function(data){
			if ( Object.keys(data).length > 0 ) {
				$("#wrap #lnbWrap").html(fn_InitLtab(data.data));
			}
		},
		error: function() {
			mFnc.layerError();
			return;
		}
	});
}

//ltab 태그 생성
/*
function fn_InitLtab(data) {
	var resultMenuTag =  "<ul class='lnb_list'>\n";

	for (var i = 0 ; i < data.length ; i++) {
		if (data[i].lv == "1") {
			if (i > 0) {
				resultMenuTag += "</ul>";
				resultMenuTag += "</li>";
			}
			resultMenuTag += "<li class='depth1' data-typename='bgtype" + fn_getButtonType(data[i].menuNm) + "' data-typetitle='" + data[i].menuNm + "'><a href='javascript:;' class='first'>" + data[i].menuNm + "</a>\n";
			resultMenuTag += "<ul class='depth2'>";
		} else if (data[i].lv == "2") {
			resultMenuTag += "<li class='" + data[i].menuCd + "' data-title='" + data[i].menuNm + "' data-layername='" + data[i].menuCd + "' data-pageinfo='" + data[i].pathNm + "'><a href='javascript:;''><span>" + data[i].menuNm + "</span></a></li>";
		}
	}

	resultMenuTag += "</ul>";
	resultMenuTag += "</li>";
	resultMenuTag += "</ul>";

	return resultMenuTag;
}*/

function fn_InitLtab(data) {
	var resultMenuTag =  "";

	for (var i = 0 ; i < data.length ; i++) {
		if (data[i].lv == "1") {
			if (i > 0) {
				resultMenuTag += "</ul>";
				resultMenuTag += "</div>";
			}
			resultMenuTag += "<div class='menuDepth1 depth1' data-typename='bgtype' data-typetitle='" + data[i].menuNm + "'><a href='javascript:;' class='first'>" + data[i].menuNm + "</a>\n</div>";
			resultMenuTag += "<div class='menuDepth2'>";
			resultMenuTag += "<ul class='menuDepth2List depth2'>";
		} else if (data[i].lv == "2") {
			
			// 2021.01.05 원본
			/*
				resultMenuTag += "<li class='" + data[i].menuCd + "' data-title='" + data[i].menuNm + "' data-layername='" + data[i].menuCd + "' data-pageinfo='" + data[i].pathNm + "'><a href='javascript:;''>" + data[i].menuNm + "</a></li>";
			*/
			
			// 2021.01.05 시설유형에 따른 메뉴 보이기
			if(data[i].userGroupCd != "C"){
				resultMenuTag += "<li class='" + data[i].menuCd + "' data-title='" + data[i].menuNm + "' data-layername='" + data[i].menuCd + "' data-pageinfo='" + data[i].pathNm + "'><a href='javascript:;''>" + data[i].menuNm + "</a></li>";
			}else{
				
				
				if((data[i].wffcltyTp == "C01" || data[i].wffcltyTp == "C02" || 
					data[i].wffcltyTp == "B01" || data[i].wffcltyTp == "B02" ||
					data[i].wffcltyTp == "B04" || data[i].wffcltyTp == "D04")){
					
					
					// 장애인 근로사업장(C01), 장애인보호작업장(C02)
					if(data[i].wffcltyTp == "C01" || data[i].wffcltyTp == "C02"){
						if((data[i].menuCd == "PGM020" || data[i].menuCd == "PGM021" || 
							data[i].menuCd == "PGM022" || data[i].menuCd == "PGM032" || 
							data[i].menuCd == "PGM030" || data[i].menuCd == "PGM031" )){
								continue;
							}else{
								resultMenuTag += "<li class='" + data[i].menuCd + "' data-title='" + data[i].menuNm + "' data-layername='" + data[i].menuCd + "' data-pageinfo='" + data[i].pathNm + "'><a href='javascript:;''>" + data[i].menuNm + "</a></li>";
							}
					}
					
					// 장애인복지관(B01)
					if(data[i].wffcltyTp == "B01"){
						if((data[i].menuCd == "WFC203" || data[i].menuCd == "WFC205" || 
							data[i].menuCd == "PGM020" || data[i].menuCd == "PGM021" || 
							data[i].menuCd == "PGM022" || data[i].menuCd == "PGM032" || 
							data[i].menuCd == "PGM030" || data[i].menuCd == "PGM031" )){
								continue;
							}else{
								resultMenuTag += "<li class='" + data[i].menuCd + "' data-title='" + data[i].menuNm + "' data-layername='" + data[i].menuCd + "' data-pageinfo='" + data[i].pathNm + "'><a href='javascript:;''>" + data[i].menuNm + "</a></li>";
							}
					}
					
					// 장애인 주간보호시설복지관(B02)
					if(data[i].wffcltyTp == "B02"){
						if((data[i].menuCd == "WFC400" || data[i].menuCd == "WFC401" || 
							data[i].menuCd == "PGM020" || data[i].menuCd == "PGM021" || 
							data[i].menuCd == "PGM022" || data[i].menuCd == "PGM032" || 
							data[i].menuCd == "PGM030" || data[i].menuCd == "PGM031" )){
								continue;
							}else{
								resultMenuTag += "<li class='" + data[i].menuCd + "' data-title='" + data[i].menuNm + "' data-layername='" + data[i].menuCd + "' data-pageinfo='" + data[i].pathNm + "'><a href='javascript:;''>" + data[i].menuNm + "</a></li>";
							}
					}
					
					// 장애인 점자도서관(B04)
					if(data[i].wffcltyTp == "B04"){
						if((data[i].menuCd == "WFC203" || data[i].menuCd == "WFC205" || 
							data[i].menuCd == "WFC400" || data[i].menuCd == "WFC401" || 
							data[i].menuCd == "PGM030" || data[i].menuCd == "PGM031" )){
								continue;
							}else{
								resultMenuTag += "<li class='" + data[i].menuCd + "' data-title='" + data[i].menuNm + "' data-layername='" + data[i].menuCd + "' data-pageinfo='" + data[i].pathNm + "'><a href='javascript:;''>" + data[i].menuNm + "</a></li>";
							}
					}
					
					// 장애인 보조기구AS센터(D04)
					if(data[i].wffcltyTp == "D04"){
						if((data[i].menuCd == "WFC203" || data[i].menuCd == "WFC205" || 
							data[i].menuCd == "WFC400" || data[i].menuCd == "WFC401" || 
							data[i].menuCd == "PGM020" || data[i].menuCd == "PGM021" || 
							data[i].menuCd == "PGM022" || data[i].menuCd == "PGM032" || 
							data[i].menuCd == "WFC200" || data[i].menuCd == "WFC204")){
								continue;
							}else{
								resultMenuTag += "<li class='" + data[i].menuCd + "' data-title='" + data[i].menuNm + "' data-layername='" + data[i].menuCd + "' data-pageinfo='" + data[i].pathNm + "'><a href='javascript:;''>" + data[i].menuNm + "</a></li>";
							}
					}
					
				}else{
					if((data[i].menuCd == "WFC203" || data[i].menuCd == "WFC205" || 
						data[i].menuCd == "WFC400" || data[i].menuCd == "WFC401" || 
						data[i].menuCd == "PGM020" || data[i].menuCd == "PGM021" || 
						data[i].menuCd == "PGM022" || data[i].menuCd == "PGM032" || 
						data[i].menuCd == "PGM030" || data[i].menuCd == "PGM031" )){
							continue;
						}else{
							resultMenuTag += "<li class='" + data[i].menuCd + "' data-title='" + data[i].menuNm + "' data-layername='" + data[i].menuCd + "' data-pageinfo='" + data[i].pathNm + "'><a href='javascript:;''>" + data[i].menuNm + "</a></li>";
						}
				}
				
			} //end
			
			
			
		}
	}

	resultMenuTag += "</ul>";
	resultMenuTag += "</div>";

	return resultMenuTag;
}

//메뉴 로그 등록
function regMenuLog(laynerName, code) { // code 메뉴 열때 9, 탭 닫을 때 8
	var param = {
		'menuCd':'', 	//메뉴 코드
		'jobFgCd':''	// 메뉴 열 때 : 9, 탭 닫을 때 : 8 셋팅
	};

	param.menuCd = laynerName;
	param.jobFgCd = code;

	$.ajax({
		url: '/common/addUserMenuLog',
		type: 'post',
		data: JSON.stringify(param),
		datatype: 'json',
		contentType: "application/json; charset=utf-8",
		success: function(data){
		},
		error: function() {
			mFnc.layerError();
			return;
		}
	});
}

function __openMenuTab(menuFgCd, obj, params) {
	//console.log(menuFgCd, obj, params);
	if(menuFgCd == 'menu') {
		var $this = $(obj).parent('li');
		$(".menuDepth2List li").removeClass("active");
		$($this).addClass("active");
	} else {
		var $this = $(obj);
	}

	//var $tablist = $('#contentWrap .content .content-top .tab-wrap ul');
	var $tablist = $('.topMdiWrap');
	//var $sectionBox = $('#contentWrap .content .section-wrap');
	var $sectionBox = $('#contentWrap .section-wrap');
	var $tabCloseBoxList = $('#contentWrap .content .tab-all-close-wrap ul');

	var _title = $this.data('title');
	var _layername = $this.data('layername');
	var _pageInfo = $this.data('pageinfo');

	var countTab = mFnc.tabCount();
	if (countTab < mFnc.tabSize) {

		// 같은 메뉴는 다시 열지않는다.
		//if($('.content .content-top .tab-wrap .'+ _layername).length == 0) {
		if($('.topMdiWrap .'+ _layername).length == 0) {
			var addTab = mFnc.addTabMake(_title, _layername);
			$tablist.append(addTab);

			//var addSectionBox = '<div class="tabtopmenu boxcontent '+ _layername +'" data-params=\''+ JSON.stringify(params) + '\'></div>';
			var addSectionBox = '<div class="boxcontent '+ _layername +'" data-params=\''+ JSON.stringify(params) + '\'></div>';
			$sectionBox.append(addSectionBox);

			//var addTabCloseList = '<li class="tabclosebox '+ _layername +'" data-layername="'+ _layername +'"><a href="javascript:;" class="tab_tit">'+ _title +'</a></li>';
			//$tabCloseBoxList.append(addTabCloseList);

			if (_pageInfo != undefined && _pageInfo != '') {
				var param = {
					'layerName': _layername
				}

				$.ajax({
					url: _pageInfo,
					type: 'get',
					cache: false,
					data: param,
					datatype: 'html',
					success: function(data) {
						//$sectionBox.find('.boxcontent.'+ _layername).html(data);
						$sectionBox.find('.'+ _layername).html(data);
					},
					error: function() {
						mFnc.layerError();
						return;
					}
				});

				if(menuFgCd == 'menu') {
					regMenuLog(_layername, "9");
				}
			}
		}

		mFnc.proNameChg( _layername );
	} else {
		//if($('.content .content-top .tab-wrap .'+ _layername).length == 0) {
		if($('.topMdiWrap .'+ _layername).length == 0) {
			mFnc.alert('alert','탭은 '+ mFnc.tabSize +'개 까지 가능 합니다.');
			return;
		}
	}

	mFnc.tabActive(_layername);
}

function __setCurrentTime() {
	$('#footerWrap .current-time').text(__parseDate(GRIT.getCurTime()));


    setTimeout(function(){
    	__setCurrentTime();
    }, 1000);
}

function __parseDate(inputDate) {
	var lpad = function(num) {
		if(num < 10) {
			return "0" + num.toString();
		} else {
			return num.toString();
		}
	};

	var year = inputDate.getFullYear();
	var month = lpad(inputDate.getMonth()+1);
	var date = lpad(inputDate.getDate());
	var hour = lpad(inputDate.getHours());
	var min = lpad(inputDate.getMinutes());
	var secound = lpad(inputDate.getSeconds());

	return year + '-' + month + '-' + date + ' ' + hour + ':' + min + ':' + secound;
}

function gridResize() {
	var pgmId = $('#footerWrap .program_name').text();
	var menuId = $('#footerWrap .program_name').text();
	menuId = "#"+menuId;
	var fullWidth = $(window).innerWidth() - 55;
	//alert($(".leftFrame").is(":visible"));
	//alert(fullWidth);
	if ($(".leftFrame").is(":visible") == true)
	{
	    //grid width 조절
		if (fullWidth == $(menuId+"grid_wrap").width()){
			contentWH(menuId,fullWidth-270,$(menuId).height());
		}
		
		if (pgmId == 'WFC200'){
			contentWH(menuId,fullWidth-270,$(menuId).height());
		}
		
		if (pgmId == 'SYS003'){
			contentWH2(menuId,fullWidth-270-470,$(menuId).height());
		}
		
		if (pgmId == 'PGM014'){
			//contentWH(menuId,fullWidth-270,271);
		}
		
		if (pgmId == 'PGM015'){
			//contentWH(menuId,fullWidth-270,309);
		}
	} else {
	    //grid width 조절
	    if (fullWidth == $(menuId+"grid_wrap").width()){
	    	contentWH(menuId,fullWidth,$(menuId).height());
	    }
	    
	    if (pgmId == 'WFC200'){
	    	contentWH(menuId,fullWidth,$(menuId).height());
		}
	    
	    if (pgmId == 'SYS003'){
	    	contentWH2(menuId,fullWidth-470,$(menuId).height());
		}
	    
	    if (pgmId == 'PGM014'){
			//contentWH(menuId,fullWidth,271);
		}
	    
	    if (pgmId == 'PGM015'){
			//contentWH(menuId,fullWidth,309);
		}
	}
}	