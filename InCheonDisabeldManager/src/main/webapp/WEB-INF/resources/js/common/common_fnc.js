// 사용자 정보
var userInfo = {
	userId: '',
	userName: '',
	userLastIP: '',
	userLastTime: '',
}

// 기본 사용 변수 묶음
var mFnc = {
	// 탭 메뉴 갯수 제한
	tabSize: 10,
	tabActiveId: '',
	//레이어팝업베이스
	layerPopup: function(n,w,h) {
		var n = (n===undefined) ? 'popup' : n;
		var w = (w===undefined) ? 400 : w;
		var h = (h===undefined) ? 200 : h;

		var t = Math.max(0, (($(window).height() - h) / 2) + $(window).scrollTop()) + 'px';
		var l = Math.max(0, (($(window).width() - w) / 2) + $(window).scrollLeft()) + 'px';
		
		layerPopupBG = '<div id="'+ n +'_bg" class="popup_bg"></div>\
						<div id="'+ n +'_wrap" class="popup_wrap" style="top:'+ t +';left:'+ l +';width:'+ w +'px;height:'+ h +'px">\
						<div id="popup_container">\
						</div>\
						<div class="btn_close2">\
						<input name="" type="image" src="/resources/images/btn_close.png" class="popupclose" data-pname="'+ n +'" alt="닫기">\
						</div>\
						</div>';

		$('body').append(layerPopupBG);
	},
	//홈 버튼 클릭
	callHome: function() {
		$('#headerWrap .appTitle').click();
	},
	//레이어 팝업 내용 넣기 n 팝업 이름, v 내용
	layerPopupADD: function( n,v ) {
		var $content = $('#'+ n +'_wrap').find('#popup_container');
		if ($content != undefined || $content != '') {
			$content.html( v );
		}
	},
	// 팝업 탭 리스트 관리
	 tabCloseMenu: function() {
		var $tabCloseBox = $('#contentWrap .content .tab-all-close-wrap');
		var countTab = this.tabCount();
		if (countTab > 0){
			$tabCloseBox.show();
		} else {
			$tabCloseBox.hide();
		}
	},
	// 레이어 팝업 닫기
	layerClose: function( n ) {
		$('#'+ n +'_wrap').remove();
		$('#'+ n +'_bg').remove();
	},
	// LNB 활성화 닫기
	lnbActiceClose: function() {
		//$('#lnbWrap .lnb ul.lnb_list li.depth1 ul.depth2 li').removeClass('selectmenubar');
		$('#lnbWrap .menuDepth2 .depth2 li').removeClass('selectmenubar');
	},
	//탭 활성화
	tabActive: function( n ) {
		/*$('#contentWrap .content .content-top .tab-wrap ul li').removeClass('active');
		$('#contentWrap .content .content-top .tab-wrap ul').find('.'+ n).addClass('active');
		$('#contentWrap .content .section-wrap .boxcontent').hide();
		$('#contentWrap .content .section-wrap').find('.'+ n).show();*/
		$('.topMdiWrap div').removeClass('active');
		$('.topMdiWrap').find('.'+ n).addClass('active');
		$('#contentWrap .section-wrap .boxcontent').hide();
		$('#contentWrap .section-wrap').find('.'+ n).show();

		this.tabActiveId = n;
		resizeMenuContent();
		this.proNameChg( n );
	},
	//템메뉴 갯수 채크
	tabCount: function() {
		//var _tabCount = $('#contentWrap .content .content-top .tab-wrap ul li').length;
		var _tabCount = $('.topMdiWrap div').length;
		return _tabCount;
	},
	//탬메뉴 TEXT 만들기
	addTabMake: function(t, n) {
		//var _addTxT  = '<li class="tabtopmenu ellipsis '+ n +'" data-layername="'+ n +'"><span class="tabact">'+ t +'</span><a href="javascript:;" class="tab-close"><span>탭 닫기</span></a></li>';
		var _addTxT  = '<div class="mdi active ellipsis '+ n +'" data-layername="'+ n +'"><a href="javascript:;">'+t+'</a><button type="button" class="mdiCloseBtn tab-close"><img src="/resources/imagesV2/mdiClose.png"></button></div>';
		return _addTxT;
	},
	//탭 메뉴 닫기
	tabMenuClose:  function(n) {

		//var _layerName = $('#contentWrap .content .content-top .tab-wrap ul li').last().data('layername');
		var _layerName = $('.topMdiWrap div').last().data('layername');
		//console.log(_layerName);
		//$('#contentWrap .content .'+ n).remove();
		$('.topMdiWrap .'+ n+', .section-wrap .'+n).remove();
		//alert(n);
		for(key in window) {
			if(key.indexOf(n) >= 0) {
				delete window[key];
			}
		}
		if (n == _layerName) {
			//_layerName = $('#contentWrap .content .content-top .tab-wrap ul li').last().data('layername');
			_layerName = $('.topMdiWrap div').last().data('layername');
			this.tabActive( _layerName );
			this.proNameChg( _layerName );
		} else {
			//_layerName = $('#contentWrap .content .content-top .tab-wrap ul li').last().data('layername');
			_layerName = $('.topMdiWrap div').last().data('layername');
			this.tabActive( _layerName );
			this.proNameChg( _layerName );
		}
		var _cnt = this.tabCount();
		if(_cnt < 1) {
			this.callHome();
		}

		// 그리드를 제거합니다.
		var grid_wrap = "#"+n+"grid_wrap";
		var grid_wrap1 = "#"+n+"grid_wrap1";
		var grid_wrap2 = "#"+n+"grid_wrap2";
		var grid_wrap3 = "#"+n+"grid_wrap3";
		var grid_wrap4 = "#"+n+"grid_wrap4";
		//AUIGrid.destroy("#grid_wrap");
		AUIGrid.destroy(grid_wrap);
		AUIGrid.destroy(grid_wrap1);
		AUIGrid.destroy(grid_wrap2);
		AUIGrid.destroy(grid_wrap3);
		AUIGrid.destroy(grid_wrap4);
		//myGridID = null;
		var myGridID = n+"myGridID";
		var myGridID1 = n+"myGridID1";
		var myGridID2 = n+"myGridID2";
		var myGridID3 = n+"myGridID3";
		var myGridID4 = n+"myGridID4";
		myGridID = null;
		myGridID1 = null;
		myGridID2 = null;
		myGridID3 = null;
		myGridID4 = null;
		
		GRIT.debug("close tab " + n);
		regMenuLog(n, "8");
	},
	//탭 모두 닫기
	/* 신규 디자인에 모두 닫기 없음 20201117 pkh
	taballclose:  function(n) {
		var layerTabs = $("#contentWrap .content .content-top .tab-wrap ul").find("li").each(function(index) {
			var _layerName = $(this).data("layername");
			GRIT.debug("all close tab : " + _layerName);
			regMenuLog(_layerName, "8");
		});

		$('.tabtopmenu').remove();
		$('.tabclosebox').remove();
		this.layerClose(n);
		this.callHome();
	},*/
	// 프로그램명 바꾸기
	 proNameChg:  function(n) {
		 $('#footerWrap .program_name').text(n);
		 this.tabCloseMenu();
	},
	// 에러 표시 레이어팝업
	layerError: function() {
		$.ajax({
			url: '/templates/layerError',
			type: 'post',
			datatype: 'html',
			success: function(data){
				mFnc.layerPopup('layerError',400,250);
				mFnc.layerPopupADD('layerError', data );
			},
			error: function() {
			}
		});
	},
	//그리드 그리기
	rMCreate : function(n,v,w,h) {
		var n = (n===undefined) ? '' : n;
		var v = (v===undefined) ? '' : v;
		var w = (w===undefined) ? '100%' : w;
		var h = (h===undefined) ? '100%' : h;

		// debugger;
		if( (n != undefined && n != '') && (v != undefined && v != '') ) {
			for (var i = 1 ; i <= v ; i++) {
				var j = '';

				if( i > 1) j = i + '';

				var rMGrid = n +'Grid'+ j;
				var rMDIV = n +'DIV'+ j;
				var rMjsVars = eval(n +'Js.jsVars'+ j);
			}
		}
	},
	//alert 그리기 n: 이름, m: 메세지, w:넓이, h:높이
	alert : function(n,m,w,h) {
		var n = (n===undefined) ? 'alert' : n;
		var m = (m===undefined) ? '' : m;
		var w = (w===undefined) ? '400' : w;
		var h = (h===undefined) ? '200' : h;
		var param = {'n': n,'msg': m}
		$.ajax({
			url: '/templates/layerAlert',
			data: param,
			type: 'post',
			datatype: 'html',
			success: function(data){
				mFnc.layerPopup(n,w,h);
				mFnc.layerPopupADD(n,data);
			  },
			  error: function() {
				  mFnc.layerError();
			  }
		});
	},
	//Confirm 그리기 n: 이름, m: 메세지, fy: 확인 function, fc : 취소 function(생략가능), w:넓이, h:높이
	alertConfirm : function(n,m,fy,fc,w,h) {
		var n = (n===undefined) ? 'alert' : n;
		var m = (m===undefined) ? '' : m;
		var w = (w===undefined) ? '400' : w;
		var h = (h===undefined) ? '200' : h;
		var param = {'n': n, 'msg': m, 'yes': fy,'no': fc}
		$.ajax({
			url: '/templates/layerConfirm',
			data: param,
			type: 'post',
			datatype: 'html',
			success: function(data){
				mFnc.layerPopup(n,w,h);
				mFnc.layerPopupADD(n,data);
			  },
			  error: function() {
				  mFnc.layerError();
			  }
		});
	},
	// datepicker 화면적용
	datepicker : function() {
		// jQurey UI 한글화 적용
		$('input.datepicker').datepicker({
		    showOn: "button",
		    buttonImage: "/resources/images/btn_cal.png",
		    buttonImageOnly: true,
			closeText: '닫기',
			prevText: '이전',
			nextText: '다음',
			currentText: '오늘',
			monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
			dayNames: ['일','월','화','수','목','금','토'],
			dayNamesShort: ['일','월','화','수','목','금','토'],
			dayNamesMin: ['일','월','화','수','목','금','토'],
			weekHeader: 'Wk',
			dateFormat: 'yy-mm-dd',
			firstDay: 0,
			isRTL: false,
			showMonthAfterYear: true,
			yearSuffix: ''
		});
	},
	// birthdatepicker 화면적용
	birthdatepicker : function() {
		// jQurey UI 한글화 적용
		$('input.datepicker').datepicker({
		    showOn: "button",
		    buttonImage: "/resources/images/btn_cal.png",
		    buttonImageOnly: true,
			closeText: '닫기',
			prevText: '이전',
			nextText: '다음',
			currentText: '오늘',
			monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
			dayNames: ['일','월','화','수','목','금','토'],
			dayNamesShort: ['일','월','화','수','목','금','토'],
			dayNamesMin: ['일','월','화','수','목','금','토'],
			weekHeader: 'Wk',
			dateFormat: 'yy-mm-dd',
			firstDay: 0,
			isRTL: false,
			showMonthAfterYear: true,
			yearSuffix: ''
		});
	},
}

//팝업닫기, alert 팝업 닫기
$(document).on('click','body .popup_wrap .btn_close2 .popupclose, body .popup_wrap .btn_cent .popupclose, .popupConfirmBtnWrap .popupclose', function(e){
	var $this = $(this);
	var _pName = $this.data('pname');
	mFnc.layerClose(_pName);
})
.ready( function() {
});

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
	    	GRIT.debug('param : '+ JSON.stringify(param));
	    	GRIT.debug('data : '+ JSON.stringify(data));
		  },
		  error: function() {
			  mFnc.layerError();
			  return;
		  }
	  });
}

function checkNum(e) {
    var keyVal = event.keyCode;

    if(((keyVal >= 48) && (keyVal <= 57))){
        return true;
    }
    else{
        alert("숫자만 입력가능합니다");
        return false;
    }
}