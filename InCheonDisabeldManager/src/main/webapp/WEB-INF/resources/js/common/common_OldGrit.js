$(document).ready(function(){
	$.fn.serializeObject = function(){
	   var o = {};
	   var a = this.serializeArray();
	   $.each(a, function() {
	       if (o[this.name]) {
	           if (!o[this.name].push) {
	               o[this.name] = [o[this.name]];
	           }
	           o[this.name].push(this.value || '');
	       } else {
	           o[this.name] = this.value || '';
	       }
	   });
	   return o;
	};
	//alert(1);
	// 영문만
	$(".onlyeng").css("ime-mode", "disabled").keyup(function(){
		$(this).val( $(this).val().replace(/[^!-z]/g,"") );
	});
	// 숫자만
	$(".onlynum").css("ime-mode", "disabled").keyup(function(){
		/*if(window.event.keyCode < 48 || window.event.keyCode > 57) {
			$(this).val("");
			 return;
		}*/
		$(this).val( $(this).val().replace(/[^0-9]/g,"") );
	});
	
	// 한글 입력 방지
	$(".onlyengnum").css("ime-mode", "disabled").keyup(function(){
		//fn_lengthChk($(this).val());
		$(this).val( $(this).val().replace(/[^a-z0-9]/gi,"") );
		
	});
	
	//xoq 스타일 2015-11-16
	var $tab_btn = $(".tab_style ul li"),
		$tab_box = $(".tab_cont .tab_box");

	$tab_box.not(":eq(0)").hide();

	$tab_btn.click(function(){
		var i = $(this).index();

		$tab_btn.removeClass("active");
		$(this).addClass("active");

		$tab_box.hide();
		$tab_box.eq(i).show();


		// 클래스 모달 센터 위치
		$('.layer').each(function(){
			var $this = $(this);
			var $height = $(this).height();
			var $width = $(this).width();
			$this.css('margin-left',-$width/2);
			$this.css('margin-top',-$height/2);
		});
	});

	// GNB 사이즈
	var _gnbLength = $(".gnb li").length;
	_gnbLength = parseInt($("#wrap").outerWidth()/_gnbLength);
	$(".gnb li").css("width",_gnbLength);
	$(".gnb li").last().addClass("last");
	

	//LEFT WRAP HEIGHT
	//$(".left_wrap").css("min-height",$("#contentsArea").outerHeight()-$("#lnbArea h2").outerHeight());

	/*input.text addClass*/
	$('input:text').addClass('text');
	$('input:password').addClass('text');
	/*img hover*/
	$('.on img').hover(function(){
		var imgSrc = $(this).attr('src');
		$(this).attr('src',imgSrc.replace('.gif','_on.gif'));
	},function(){
		var imgSrc = $(this).attr('src');
		$(this).attr('src',imgSrc.replace('_on.gif','.gif'));
	});

	// 팝업 드레그 이벤트
	$(".layer").not(".windowPop").draggable({
	    handle:".tit"
	});

	/* 레이어팝업 */
	// 클래스 모달 센터 위치
//	$('.layer').not(".windowPop").each(function(){
//		var $this = $(this);
//		var $height = $(this).height();
//		var $width = $(this).width();
//		$this.css('margin-left',-$width/2)
//		$this.css('margin-top',-$height/2)
//	});
	$(".windowPop").removeAttr("style");
	//.modalLink 클릭시
	$('.modal').click(function(){
		var $thisHref = $(this).attr('href');
		$('#mask').fadeTo("normal",0.7,function(){
			//$($thisHref).fadeIn(400);
			$($thisHref).show();
		});
		return false;
	});
	//.overlay .modal 클릭시 숨김
	$('.closeLayer').click(function(){
		$('#mask, .layer').hide();
		return false;
	});
	/* 달력 설정 */
    fn_datepicker();
    fn_datepickerRange();
    fn_datepickerFromTo();
    fn_datepickerKeyEvent();

	//카테고리 column add
	$(".add_column").change(function(option){
			// option.target.value  : select 된 option value 값
			// option.target.selectedIndex  : select 된 option Index 값

			var str = '<tr class="added">'+
						  '<th>'+
							'<span class="point">&nbsp;</span> 기타'+option.target.selectedIndex+
						  '</th>'+
						  '<td>'+
							'<input type="text" class="inp_txt" style="width:650px;" />'+
						  '</td>'+
					  '</tr>'+
					  '<tr class="added">'+
						  '<th>'+
							'<span class="point">&nbsp;</span> 기타'+option.target.selectedIndex+
						  '</th>'+
						  '<td>'+
							'<input type="text" class="inp_txt" style="width:650px;" />'+
						  '</td>'+
					  '</tr>';
		$(".added").remove();
		$(str).insertAfter(".flag");
		$(".added").addClass("value"+option.target.selectedIndex);
	});

	// location text bold event
	$("#contentsArea .page_title ul li:last-child a").wrap("<strong></strong>");

	//말풍선
	$(".balloon").mouseover(function(){
		$(".tool_tip").hide();
		$(this).parent().css("position","relative");
		$(this).next(".tool_tip").css({
			top : $(this).parent().outerHeight()-2,
			left : "50%",
			marginLeft : -$(this).parent().outerWidth()/2
		});
		$(this).next(".tool_tip").show();  
	});
	$(".cmm_table01.v4 td").mouseleave(function(){
		if ($(".tool_tip").length > 0)
		{
			$(".tool_tip").hide();
		}
	});
	$(".tool_tip").mouseleave(function(){
		$(this).hide();
	});
	
	// 병헌 170704 : 툴팁 스크립트 추가
	$(".balloonArea").hover(function(){
	    $(this).find("div").css("top",-($(this).find("div").outerHeight() + 6));
	    $(this).find("div").css("left",0);
	    $(this).find("div").show();
	},function(){
	    $(this).find("div").hide();
	});
	
	/* 병헌 170830 : 툴팁 클릭버전 */
	$(".balloonArea").click(function(){ /* 병헌 170811 : 웹접근성, 말풍선이 오버말고 클릭 시에 나와야 함 hover -> click */
        $(this).find("div").css("top",-$(this).find("div").outerHeight());
        $(this).find("div").show();
    });
	/* /병헌 170830 : 툴팁 클릭버전 */
	/* 병헌 170811 : 웹접근성, 풍성도움말 닫기 버튼 추가 */
    $(".balloonArea").find("div").append("<a href='javascript:void(0)' class='balloonAreaClos' style=''>X</a>");
    $(".balloonAreaClos").click(function(e){
    	e.stopPropagation();
    	$(".balloonArea").find("div").hide();
    });
    /* /병헌 170811 : 웹접근성, 풍성도움말 닫기 버튼 추가 */
	
});

function fn_ceil_x(num, n){
	// 1234.674, 2 -> 1234.68
    var i = Math.pow(10, n);
    return Math.ceil(num * i) / i;
}

function fn_ceil_x2(num, c, n){
	//alert(num);
	//alert(c);
	//alert(n);
	// 1234.674, 2 -> 1234.68
	var i;
	var k = '0123456789.';
	var flag = false;	
	var num = fn_removeCommaStr(num);
	console.log("[" + num + "]");
	console.log("[" + num.length + "]");
	
	
	for(i=0;i<num.length;i++){
		if(k.indexOf(num.substring(i,i+1)) < 0){
			flag = true;
		}
	}
	
	if (flag){
		alert("숫자만 입력가능합니다.");
		num = 0;
		return num;
		//return;

	}
	
	if (num.indexOf('.') != -1){  //.이 있다면
		var num_all = num.split('.');
		var num_f = num_all[0];
		var num_r = num_all[1];
		
		if (num_f.length > c){
			alert("정수는" + c + "자 이하로 입력해주세요.");
			num = "";
			return num;
		} 
		
		if (num_r.length > n){
			alert("소수점이하는 " + n + "자 이하로 입력해주세요.");
			num = "";
			return num;
		} 
		
		
	    /*var num_length = num.substring(num.indexOf('.')+1);
	    
	    if(num_length > 2) {
	    	alert("소수점 2자리까지만 입력가능합니다.");
	    	num = "";
	    	return;
	    }*/
	}else{
		if (num.length > c){
			alert("정수는" + c + "자 이하로 입력해주세요.");
			num = "";
			return num;
		} 
	}
	
	return commaNum(num);
	//return flag;
	
    /*var i = Math.pow(10, n);
    return Math.ceil(num * i) / i;*/
}

function fn_lengthChk(strData){
	//var stringLength = strData.length;
	var stringByteLength = 0;
	stringByteLength = strData.replace(/[\0-\x7f]|([0-\u07ff]|(.))/g,"$&$1$2").length;
	
	//alert(stringByteLength);
	return;
}


//maxlength 체크
function fn_maxLengthCheck(object){
    if (object.value.length > object.maxLength){
        object.value = object.value.slice(0, object.maxLength);
    }   
}

var today_year = new Date().getFullYear();
//var min_year = today_year - 50;
var min_year = 1950;
var max_year = today_year + 10;
var year_range = min_year+':'+max_year;

function fn_datepicker(){
    $(".datepicker").datepicker({
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
    $.datepicker.regional['ko'] = {
        closeText: '닫기',
        prevText: '이전달',
        nextText: '다음달',
        currentText: '오늘',
        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
        dayNamesShort: ['일','월','화','수','목','금','토'],
        dayNamesMin: ['일','월','화','수','목','금','토'],
        dateFormat: 'yy-mm-dd',
        firstDay: 0,
        isRTL: false,
        showMonthAfterYear: true,
        yearSuffix: '년'};
    $.datepicker.setDefaults($.datepicker.regional['ko']);
}

function fn_datepickerRange(){

    $(".datepickerRange").datepicker({
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
    $.datepicker.regional['ko'] = {
        closeText: '닫기',
        prevText: '이전달',
        nextText: '다음달',
        currentText: '오늘',
        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
        dayNamesShort: ['일','월','화','수','목','금','토'],
        dayNamesMin: ['일','월','화','수','목','금','토'],
        dateFormat: 'yy-mm-dd',
        firstDay: 0,
        isRTL: false,
        showMonthAfterYear: true,
        yearSuffix: '년'};
    $.datepicker.setDefaults($.datepicker.regional['ko']);
}

function fn_datepickerFromTo(){
    $(".datepickerFrom").datepicker({
        changeMonth: true,
        changeYear: true,
        yearRange: year_range,
        showOn: "both",
        buttonImage: "/resources/images/btn_cal.png",
        buttonImageOnly: true,
         buttonText: "선택하세요",
        inline: true,
        duration: 300,
        showAnim: "slideDown",
        onClose: function( selectedDate ) {
            $(".datepickerTo").datepicker( "option", "minDate", selectedDate );
          }
    });
    $(".datepickerTo").datepicker({
        changeMonth: true,
        changeYear: true,
        yearRange: year_range,
        showOn: "both",
        buttonImage: "/resources/images/btn_cal.png",
        buttonImageOnly: true,
         buttonText: "선택하세요",
        inline: true,
        duration: 300,
        showAnim: "slideDown",
        onClose: function( selectedDate ) {
            $(".datepickerFrom").datepicker( "option", "maxDate", selectedDate );
          }
    });
    $.datepicker.regional['ko'] = {
        closeText: '닫기',
        prevText: '이전달',
        nextText: '다음달',
        currentText: '오늘',
        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
        dayNamesShort: ['일','월','화','수','목','금','토'],
        dayNamesMin: ['일','월','화','수','목','금','토'],
        dateFormat: 'yy-mm-dd',
        firstDay: 0,
        isRTL: false,
        showMonthAfterYear: true,
        yearSuffix: '년'};
    $.datepicker.setDefaults($.datepicker.regional['ko']);
}

function fn_datepickerBlockFromTo(blockJson){
    $(".datepickerBlockFrom").datepicker({
        changeMonth: true,
        changeYear: true,
        yearRange: year_range,
        showOn: "both",
        buttonImage: "/resources/images/btn_cal.png",
        buttonImageOnly: true,
        buttonText: "선택하세요",
        inline: true,
        duration: 300,
        showAnim: "slideDown",
        beforeShowDay: function(date){
            var string = jQuery.datepicker.formatDate('yymmdd', date);
            return [ blockJson.indexOf(string) == -1 ];
        },
        onClose: function( selectedDate ) {
            $(".datepickerBlockTo").datepicker( "option", "minDate", selectedDate );
          }
    });
    $(".datepickerBlockTo").datepicker({
        changeMonth: true,
        changeYear: true,
        yearRange: year_range,
        showOn: "both",
        buttonImage: "/resources/images/btn_cal.png",
        buttonImageOnly: true,
        buttonText: "선택하세요",
        inline: true,
        duration: 300,
        showAnim: "slideDown",
        beforeShowDay: function(date){
            var string = jQuery.datepicker.formatDate('yymmdd', date);
            return [ blockJson.indexOf(string) == -1 ];
        },
        onClose: function( selectedDate ) {
            $(".datepickerBlockFrom").datepicker( "option", "maxDate", selectedDate );
          }
    });
    $.datepicker.regional['ko'] = {
        closeText: '닫기',
        prevText: '이전달',
        nextText: '다음달',
        currentText: '오늘',
        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
        dayNamesShort: ['일','월','화','수','목','금','토'],
        dayNamesMin: ['일','월','화','수','목','금','토'],
        dateFormat: 'yy-mm-dd',
        firstDay: 0,
        isRTL: false,
        showMonthAfterYear: true,
        yearSuffix: '년'};
    $.datepicker.setDefaults($.datepicker.regional['ko']);
}
/*
function popitup(url, height, width, name) {
    if(!height) height = 500;
    if(!width) width = 700;
    if(!name) name="name";

    var option = 'scrollbars=yes, height='+height+',width='+width;
    newwindow=window.open(url, name, option);
    if (window.focus) {newwindow.focus();}
    return false;
}*/

/*
- 특수문자/영문대문자/영문소문자/숫자체크/ID사용여부체크/동일문자체크(영문대소문자 구분함)
@author 윤태훈, 2015.08.09
- uid : user ID
- pwd : 비밀번호
*/
function Check_AlphaNumericSpecialUpperLower(uid, upw){
    var chk_num     = upw.search(/[0-9]/g);
    var chk_low_eng = upw.search(/[a-z]/g);
    var chk_upp_eng = upw.search(/[A-Z]/g);
    var strSpecial  = upw.search(/[`~!@#$%^&*|\\\'\";:\/?]/gi);

    var returnValue = 0;
    if(chk_num < 0 || (chk_low_eng < 0 && chk_upp_eng < 0) || strSpecial < 0 ){  //|| chk_upp_eng < 0 || strSpecial < 0
        returnValue = 1;
    }
    if(/(\w)\1\1\1/.test(upw)){
        returnValue = 2;
    }
    if(upw.indexOf(uid)>-1){
         returnValue = 3;
    }
    if(upw.search(/[.,+]/) > -1){
    	returnValue = 4;
    }
    return returnValue;
}

/*
- 영문대문자/영문소문자/숫자체크(영문대소문자 구분함)
@author 윤태훈, 2015.08.09
- uid : user ID
*/
function Check_AlphaNumericUpperLower(uid){
    var chk_num     = uid.search(/[0-9]/g);
    var chk_low_eng = uid.search(/[a-z]/g);
    var chk_upp_eng = uid.search(/[A-Z]/g);
    
    var returnValue = 0;

    if(chk_num < 0 || (chk_low_eng < 0 && chk_upp_eng < 0) ){
    	returnValue = 1;
    	return returnValue;
    }
    for(var i=0; i < uid.length; i++)
    { 
       var c=uid.charCodeAt(i);
       
       if( ( ( 0xAC00 <= c && c <= 0xD7A3 ) || ( 0x3131 <= c && c <= 0x318E ) ) ){  
    	   returnValue = 1;
    	   return returnValue;
       }
    }
    
	return returnValue;
}

//new 레이어팝업
function fn_layer(o,wid,val,flag){
	var top,left;
	if ($(window).outerHeight() < $("."+o).outerHeight())
	{
		top = 0;
	}else{
		top = "25%";
	}
	left = (($(window).width() - wid) / 2) + $(window).scrollLeft();
	
	$("body").append("<div id='mask'></div>");
	if (flag == 'in')
	{
		$("#mask").remove();
		$("."+o).closest(".layer").prev().css("z-index","7");
		$(".closeLayer").off("click");
		$("."+o).find(".closeLayer").attr("onclick","$(this).closest('.layer').prev().css('z-index','9999');$(this).closest('.layer').hide();");
	}else{
		$(".layer").hide();
		$("."+o).find(".closeLayer").attr("onclick","$(this).parent().parent().hide();$('#mask').remove()");
	}
	$("."+o).attr("style","width:"+wid+"px; top:"+top+"; left:"+left+"px; z-index:9999;").show();

	if(o == "layer_goodsSel"){
		// 뉴스레터 상품홍보(기획전1,2 구분하기위함)
		$("."+o).find(".goodsGb").attr("href","javascript:fn_saveTrget('"+ val +"');");
	}

	if(o == "layer_ns_notice"){
		// 뉴스레터  새소식 게시판구분(공지사항,상품홍보동영상) 구분하기위함
		$("."+o).find(".selNtt").attr("onclick","sel_ntt('"+ val +"'); return false;");
	}
}

function checkEmail(strEmail) {
	  var arrMatch = strEmail.match(/^(\".*\"|[A-Za-z0-9_-]([A-Za-z0-9_-]|[\+\.])*)@(\[\d{1,3}(\.\d{1,3}){3}]|[A-Za-z0-9][A-Za-z0-9_-]*(\.[A-Za-z0-9][A-Za-z0-9_-]*)+)$/);
	  if(arrMatch == null) return false;
	 
	  return true;
}

//로딩 함수
function fn_loading(display,type){
	if(display == 'show'){
		var top,left,str,text;
		 
		
		if(type == "1"){
			text = "<span class=>작업이 진행 중입니다.<br /> 작업이 완료 될 때까지 기다려주세요.";
			str = '<div class="load_text" style="border:1px solid #ccc;background-color:#fff;padding:20px 30px 20px;line-height:23px;text-align:center;font-size:13px;position:absolute;top:50%;left:50%;z-index:9999">'+
				'<p style="margin-bottom:15px"><img src="/dext5upload/images/loading.gif" /></p>'+
				text+
			'</div>';
		}
		$("body").append(str);
		$("body").append("<div class='opacityBlack'></div>");
		top = -$(".load_text").outerWidth()/2;
		left = -$(".load_text").outerHeight()/2;
		$(".load_text").css({
			margin : top+'px 0 0 '+left+'px'
		});
	}else{
		$(".load_text, .opacityBlack").remove();
	}
	
	
	/*if(top == null) top = -24;
	if(display == 'show'){
		var str,left;
		if(type == '1'){
			str = '<span class="lod"><img src="/portal/images/Loading_n.gif" alt=""></span>';
			left = "-55px";
		}else if(type == '2'){
			str = '<span class="lod"><img src="/portal/images/Loading_n2.gif" alt=""></span>';
			left = "0";
		}else{
			str = '<span class="lod"><img src="/portal/images/Loading_n2.gif" alt=""></span>';
			left = "-107px";
		}
		if(left2 != null) left = left2;
		$("."+elm).css("position","relative");
		$("."+elm).append(str);
		$("."+elm+" .lod").attr("style","position:absolute;top:50%;left:50%;margin:"+top+"px 0 0 "+left+";display:inline-block;z-index:9999");
	}else if(display == 'hide'){
		$("."+elm).removeAttr("style");
		$("."+elm+" .lod").remove();
	}*/
}

function setCopyOptions(grid){
	grid.setCopyOptions({
		  datetimeFormat: "yyyy-MM-dd",
	});
}

// 도메인 체크
function validUrl($this) {
	
	
	str = $this.val();
	
	if(str.indexOf(",") != -1){
		return true;
	}
	
	if(str.indexOf("http://") != -1){
		str = str.replace("http://", "");
	}
	
	if(str != ""){
		var pattern = /^(https?:\/\/)?((([a-z\d](([a-z\d-]*[a-z\d]))|([ㄱ-힣])*)\.)+(([a-zㄱ-힣]{2,}))|((\d{1,3}\.){3}\d{1,3}))(\:\d+)?(\/[-a-z\d%_.~+]*)*(\?[;&a-z\d%_.~+=-]*)?(\#[-a-z\d_]*)?./;
		
		if(!pattern.test(str)) {
			return true;
		} else {
			return false;
		}
	}else{
		return false;
	}
}

//한글+숫자 체크
function fn_KorCheck(value){
	$(".check").focusout(function() {
		if (!(value.keyCode >=37 && value.keyCode<=40)){
	    $(this).val( $(this).val().replace(/[^a-z0-9]/gi,"") );
		}
	});	
} 


function popitup(url, height, width, name) {
	/*
	    if(!height) height = 500;
	    if(!width) width = 700;
	    if(!name) name="name";

	    var option = 'scrollbars=yes, height='+height+',width='+width+',location=no,resizable=0';
	    newwindow=window.open(url, name, option);
	    if (window.focus) {newwindow.focus();}
	    return false;
	    var option = 'left='+(screen.availWidth-700)/2+',top='+(screen.availHeight-500)/2+', scrollbars=yes, height='+height+',width='+width;
	    */
		
	    if(!height) height = 500;
	    if(!width) width = 700;
	    if(!name) name="name";
		
		//newwindow=window.open(url, name, option);	
	    var left = ($(window).width() - width) / 2;
	    var top = ($(window).height() - height) / 2;
	    var scroll ="yes";
	    var win = window.open(url, name, "width="+width+", height="+height+", left="+left+", top="+top+", location=no, scrollbars=no");
	    
	    win.focus();
	    return false;
	}

	function popupForm(url, height, width, name, formName) {
	    if(!height) height = 500;
	    if(!width) width = 950;
	    if(!name) name="name";
		
		var left = ($(window).width() - width) / 2;
	    var top = ($(window).height() - height) / 2;
	    var scroll ="yes";
	    var win = window.open("", name, "width="+width+", height="+height+", left="+left+", top="+top+", location=no, scrollbars=no");
	    
	    formName.target = name ;
	    formName.action = url ;
	    
	    formName.submit() ;
	}

	/**
	 * 배열 정보를 담아서 팝업
	 */
	function popitupArr(url, height, width, name, arr) {

	    if(!height) height = 500;
	    if(!width) width = 700;
	    if(!name) name="name";

	    var option = 'scrollbars=yes, height='+height+',width='+width;
	    newwindow=window.open(url, name, option);
	    if (window.focus) {newwindow.focus();}
	    return false;
	}

	/* alert사용자설정 */
	function CustomAlert(){
	    this.render = function(dialog){
	        var winW = window.innerWidth;
	        var winH = window.innerHeight;
	        var dialogoverlay = document.getElementById('dialogoverlay');
	        var dialogbox = document.getElementById('dialogbox');
	        dialogoverlay.style.display = "block";
	        dialogoverlay.style.height = winH+"px";
	        dialogbox.style.left = (winW/2) - (550 * .5)+"px";
	        dialogbox.style.top = "250px";
	        dialogbox.style.display = "block";
	        document.getElementById('dialogboxhead').innerHTML = "웹 페이지 메세지";
	        document.getElementById('dialogboxbody').innerHTML = dialog;
	        document.getElementById('dialogboxfoot').innerHTML = '<button onclick="Alert.ok()">OK</button>';
	    }
		this.ok = function(){
			document.getElementById('dialogbox').style.display = "none";
			document.getElementById('dialogoverlay').style.display = "none";
		}
	}
	var Alert = new CustomAlert();

	/**
	 * random 값
	 */
	function random(){

	    do{
	        var result = Math.floor(Math.random() * 10000) + 1;
	    }while(result < 1000);

	    return result;
	}

	/**
	 * post ajax
	 */
	function postAjax(url, data, callback){

	    jQuery.ajax({
	        type:"POST",
	        data: data,
	        url:url,
	        async:false,
	        success:function(result){
	            callback(result);
	        }
	    });
	}

	/**
	 * post grid ajax
	 */
	function postGridAjax(url, data, callback){

	    jQuery.ajax({
	        type:"POST",
	        data: data,
	        url:url,
	        success:function(result){
	            callback(result);
	        },
	        beforeSend:function(){
	            $('.wrap-loading').removeClass('display-none');
	        },
	        complete:function(){
	            $('.wrap-loading').addClass('display-none');
	        }
	    });
	}

	/**
	 * commaNum
	 */
	function commaNum(num) {
		/*var len, point, str;
	    if(num == null) return num;
	    
		num = num + "";
		point = num.length % 3;
		len = num.length;
		
		str = num.substring(0, point);
		while (point < len) {
			if (str != "") str += ",";
			str += num.substring(point, point + 3);
			point += 3;
		}
	    
		return str;*/
		
		var string = "" + num;  // 문자로 바꾸기. 

		 string = string.replace( /[^-+\.\d]/g, "" )  // ±기호와 소수점, 숫자들만 남기고 전부 지우기. 

		 var regExp = /^([-+]?\d+)(\d{3})(\.\d+)?/;  // 필요한 정규식. 

		 while ( regExp.test( string ) ) string = string.replace( regExp, "$1" + "," + "$2" + "$3" );  // 쉼표 삽입. 

		 return string; 
	}

	//콤마 찍기
	/*function commaNum(obj) {
	    var regx = new RegExp(/(-?\d+)(\d{3})/);
	    var bExists = obj.indexOf(".", 0);//0번째부터 .을 찾는다.
	    var strArr = obj.split('.');
	    while (regx.test(strArr[0])) {//문자열에 정규식 특수문자가 포함되어 있는지 체크
	        //정수 부분에만 콤마 달기 
	        strArr[0] = strArr[0].replace(regx, "$1,$2");//콤마추가하기
	    }
	    if (bExists > -1) {
	        //. 소수점 문자열이 발견되지 않을 경우 -1 반환
	        obj = strArr[0] + "." + strArr[1];
	    } else { //정수만 있을경우 //소수점 문자열 존재하면 양수 반환 
	        obj = strArr[0];
	    }
	    return obj;//문자열 반환
	}*/

	/**
	 * 컴마 제거
	 * 숫자 전용
	 */
	function removeComma(n){ //제거
	     //return parseInt(n.replace(/,/g,""));
	     
	     n = "" + n.replace(/,/gi, ''); // 콤마 제거 
	     n = n.replace(/(^\s*)|(\s*$)/g, ""); // trim()공백,문자열 제거 
	     return (new Number(n));//문자열을 숫자로 반환
	}

	/**
	 * 컴마 제거
	 * 문자전용
	 */
	function fn_removeCommaStr(str){ //제거
	     return str.toString().replace(/,/gi,"");
	}

	function fn_commaChk(e){
		if(e.value.search(/,/gi) != -1){
			e.value = fn_removeCommaStr(e.value);	
			alert("콤마는 사용할 수 없습니다.");
		}
	}

	function MM_findObj(n, d) { //v4.0
	    var p,i,x; if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
	    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
	    if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
	    for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
	    if(!x && document.getElementById) x=document.getElementById(n); return x;
	}

	function MM_showHideLayers() { //v3.0
	    var i,v,obj,args=MM_showHideLayers.arguments;
	    for (i=0; i<(args.length-2); i+=3) if ((obj=MM_findObj(args[i]))!=null) { v=args[i+2];
	    if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v='hide')?'hidden':v; }
	    obj.visibility=v; }
	}

	/**
	 * 날짜 형태 yyyymmdd
	 * @returns {String}
	 */
	Date.prototype.yyyymmdd = function() {

	    var yyyy = this.getFullYear().toString();
	    var mm = (this.getMonth()+1).toString(); // getMonth() is zero-based
	    var dd  = this.getDate().toString();

	    return yyyy + '-' + (mm[1]?mm:"0"+mm[0]) + '-' + (dd[1]?dd:"0"+dd[0]);
	};

	/**
	 * 날짜 형태 yyyy
	 * @returns
	 */
	Date.prototype.yyyy = function(add) {

	    var yyyy = "";
	    if(add){
	        yyyy = (this.getFullYear()+add).toString();
	    }else{
	        yyyy = this.getFullYear().toString();
	    }
	    return yyyy;
	};


	/**
	 * 숫자만 입력
	 * @param obj
	 * @returns {Boolean}
	 */
	function onlyNumber(obj) {

	    var re = /^[0-9]+$/;
	    if(!re.test(obj.val())) {
	       alert("숫자만 넣으셔야 합니다.");
	       obj.focus();
	       return false;
	    }

	    return true;
	}

	/**
	 * 이메일 주소 검사
	 * @param obj
	 * @returns {Boolean}
	 */
	function onlyEmail(obj){
	    var re=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
	    
	     if(!re.test(obj.val())) {
	           alert("이메일주소만 넣으셔야 합니다.");
	           obj.focus();
	           return false;
	        }
	        return true;
	}
	
	/**
	 * url 검사
	 * @param str
	 * @returns {Boolean}
	 */
	function regUrlType(data) {

		var regex = /^([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/

		return regex.test(data);

	}






	/*
	countPerPage : 한페이지 출력할 게시물수
	pageSize : 페이지수를 표시할 갯수
	totalRecordCount : 전체 게시물수
	currentPageNo : 현재 페이지
	*/
	function getPaging(countPerPage,pageSize,totalRecordCount,currentPageNo,mode) {
	    // 페이징 문자열
	    var fReturn = "";
	    //
	    var fPage;
	    // 처음 버튼 페이지
	    var fPP;
	    // 이전 버튼 페이지
	    var fPreStart;
	    //
	    var fLn;
	    // 뿌려질 페이지
	    var fVk;
	    // 다음 버튼 페이지
	    var fNstart;
	    // 마지막 버튼 페이지
	    var fLast = (Math.ceil(totalRecordCount/countPerPage));

	    if(totalRecordCount > countPerPage) {
	        if(currentPageNo % 10 == 0){
	            fPage =  Math.floor(currentPageNo/pageSize) - 1;
	        }else{
	            fPage =  Math.floor(currentPageNo/pageSize);
	        }

	        fPP=currentPageNo-countPerPage;
	        // 처음으로 이동
	        if(fPP>=0 && currentPageNo!=10) {
	            fReturn = fReturn + " <a href='javascript:goSearch(" + 1 + ",\"" + mode + "\");' class='direction first'>처음</a> ";
	        }

	        // 이전
	        if( currentPageNo+1 >  countPerPage && currentPageNo!=10) {
	            fPreStart = fPage*pageSize - 9;
	            if(fPreStart<0)
	             fPreStart=-fPreStart;
	            fReturn  = fReturn + "<a href='javascript:goSearch(" + fPreStart + ",\"" + mode + "\");' class='direction prev'>이전</a> ";

	        }

	        // pageSize 만큼 출력
	        for(var i=0; i < pageSize ; i++) {
	            fLn = (fPage * pageSize + i)*countPerPage;
	            fVk= fPage * pageSize + i+1;

	            if(fLn<totalRecordCount) {
	                if(fVk!=currentPageNo) {
	                    fReturn  = fReturn + " <a href='javascript:goSearch(" + fVk + ",\"" + mode + "\");'>" + fVk + "</a> "; }
	                else {
	                    fReturn  = fReturn + " <strong>" + fVk + "</strong> ";
	                    }
	            }
	        }

	        // 다음
	        if(totalRecordCount > (fPage * pageSize + 11) && currentPageNo!=fLast && fLast > pageSize) {
	            fNstart=fPage * pageSize + 11;
	            fReturn  = fReturn + " <a href='javascript:goSearch(" + fNstart + ",\"" + mode + "\");' class='direction next'>다음</a> ";
	        }

	        // 마지막 페이지
	        if(currentPageNo!=fLast && fLast > pageSize) {
	            fReturn  = fReturn + "<a href='javascript:goSearch(" + fLast + ",\"" + mode + "\");' class='direction end'>마지막</a> ";
	        }
	    }
	    return fReturn;
	}

	/*
	 * 숫자만  입력
	 */
	function removeChar(event) {
	    event = event || window.event;
	    var keyID = (event.which) ? event.which : event.keyCode;
	    if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
	        return;
	    else
	        event.target.value = event.target.value.replace(/[^0-9]/g, "");
	}
	
	/*
	 * 주민번호 마스킹(숫자+*)만
	 */
	function removeJunminChar(event) {
	    event = event || window.event;
	    var keyID = (event.which) ? event.which : event.keyCode;
	    if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
	        return;
	    else
	        event.target.value = event.target.value.replace(/[^0-9,^*]/g, "");
	}

	/*
	 * 숫자만 입력
	 */
	function fn_numberFilter(value){
	    return value.replace(/[^0-9]/gi, '');
	}

	/**
	 * 숫자 입력중 세자리마다 콤마로 구분
	 *
	 * obj : 해당 input[type=text]
	 * vl : 최대자리수
	 *
	 * 작성자     작성일
	 * ------------------
	 * 윤태훈      2015.08.01
	 */
	function fn_commaNum(num) {
	    return fn_numberFilter(num).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");
	}

	function fn_imageViewPopup(url, windowName){
	    var windowFeatures = 'width=300, height=300, menubar=no, status=no, toolbar=no';
	    return fn_popup(url, windowName, windowFeatures, null);
	}

	function fn_popup(url, windowName, windowFeatures){
	    return fn_popup(url, windowName, windowFeatures, null);
	}

	function fn_popup(url, windowName, windowFeatures, optionalArg4){
	    return window.open(url, windowName, windowFeatures, optionalArg4);
	}
	/*
	$.browser = {};
	(function () {
	    $.browser.msie = false;
	    $.browser.version = 0;
	    if(navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
	        $.browser.msie = true;
	        $.browser.version = RegExp.$1;
	    }
	})();
	*/

	/**
	 * 비밀번호 안전성 검사
	 * @param txtpass
	 * @returns {Number}
	 */
	function chkPasswordStrength(txtpass/*,strenghtMsg,errorMsg*/)
	{

	    var desc = new Array();
	    desc[0] = "Very Weak";
	    desc[1] = "Weak";
	    desc[2] = "Better";
	    desc[3] = "Medium";
	    desc[4] = "Strong";
	    desc[5] = "Strongest";

	    //errorMsg.innerHTML = ''
	    var score   = 0;

	    //if txtpass bigger than 6 give 1 point
	    if (txtpass.length > 6) score++;

	    //if txtpass has both lower and uppercase characters give 1 point
	    if ( ( txtpass.match(/[a-z]/) ) && ( txtpass.match(/[A-Z]/) ) ) score++;

	    //if txtpass has at least one number give 1 point
	    if (txtpass.match(/\d+/)) score++;

	    //if txtpass has at least one special caracther give 1 point
	    if ( txtpass.match(/.[!,@,#,$,%,^,&,*,?,_,~,-,(,)]/) ) score++;

	    //if txtpass bigger than 12 give another 1 point
	    if (txtpass.length > 12) score++;

	    //return desc[score];

	    /*strenghtMsg.innerHTML = desc[score];
	    strenghtMsg.className = "strength" + score;
	    */
	    if (txtpass.length < 8)
	    {
	       //errorMsg.innerHTML = "Password Should be Minimum 8 Characters";
	       //errorMsg.className = "errorclass";
	       score = 0;
	    }


	    return score;

	}

	/**
	 * 비밀번호 체크
	 */
	function chkPwd(str){
	     var pw = str;
	     var num = pw.search(/[0-9]/g);
	     var eng = pw.search(/[a-z]/ig);
	     var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

	     if(pw.length < 8 || pw.length > 16){
	      alert("8자리 ~ 16자리 이내로 입력해주세요.");
	      return false;
	     }
	     if(pw.search(/₩s/) != -1){
	      alert("비밀번호는 공백없이 입력해주세요.");
	      return false;
	     } if(num < 0 || eng < 0 || spe < 0 ){
	      alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
	      return false;
	     }

	     return true;
	}

	/**
	 * 자동으로 input[type=text] 전환
	 *
	 * obj : 해당 input[type=text]
	 * vl : 최대자리수
	 *
	 * 작성자      작성일
	 * ------------------
	 * 윤태훈      2015.08.07
	 */
	function nextTab(obj, vl){
	    var next, i;

	    for(i=0; i < document.listForm.elements.length; i++) {
	        if(document.listForm.elements[i].name == obj.name) next = i;
	    }

	    next=next+1;

	    if (obj.value.length == vl)
	    {
	        document.listForm.elements[next].focus();
	        return false;
	    }
	}

	/**
	 * 아이디에 한글 입력 방지
	 * @param obj
	 *
	 * 수정자		수정일			수정내용
	 * ------		----------		---------------------
	 * 윤태훈		2015.08.07		최초작성
	 * 윤태훈		2016.04.19		띄어쓰기 한글 특수문자 금지
	 */
	function onlyEngNumId(obj){
		
		if(obj.val().length < 6){
	    	alert("아이디는 6자 이상 입력해 주세요.");
	        obj.focus();
	        return false;
	    }
		
		var chk_num     = obj.val().search(/[0-9]/g);
	    var chk_low_eng = obj.val().search(/[a-z]/g);
	    var chk_upp_eng = obj.val().search(/[A-Z]/g);

	    if(chk_num < 0 || (chk_low_eng < 0 && chk_upp_eng < 0) ){
	    	alert("아이디는 영문/숫자를 섞어 6자리 이상 입력해 주세요.");
	        obj.focus();
	        return false;
	    }
		
		
		/*
		var re = /[a-z|A-Z|0-9]$/g;
	    if(!re.test(obj.val())) {
	        alert("아이디는 영문/숫자만 가능합니다.");
	        obj.focus();
	        return false;
	    }
	    */
	    
	    
	    return true;
	}


	function onlyEngNum(obj){
	    var re=/^([\w-]+(?:\.[\w-]+)*)$/;

	    if(!re.test(obj.val())) {
	        alert("영문/숫자만 넣으셔야 합니다.");
	        obj.focus();
	        return true;
	    }
	    
	    return false;
	}


	/**
	 * 숫자, 영문, 특수문자만
	 * @param text
	 * @returns {Boolean}
	 */
	function fn_validateText(text){
	     var regexp = /[0-9a-zA-Z.;\-/_]/; // 숫자,영문,특수문자
	     var blank_pattern = /^\s+|\s+$/g;

	     // var regexp = /[0-9]/; // 숫자만
	     // var regexp = /[a-zA-Z]/; // 영문만
	     for( var i=0; i<text.length; i++){
	         if(regexp.test(text.charAt(i)) == false ){
	            alert("영문,숫자, 특수문자(. ; / - _) 만 가능합니다.");
	            return true;
	         }
	     }

	     return false;
	}

	/**
	 * byte를 용량 계산해서 반환
	 * @param bytes
	 * @returns {String}
	 */
	function byteCalculation(bytes) {
	        var bytes = parseInt(bytes);
	        var s = ['bytes', 'KB', 'MB', 'GB', 'TB', 'PB'];
	        var e = Math.floor(Math.log(bytes)/Math.log(1024));

	        if(e == "-Infinity") return "0 "+s[0];
	        else
	        return (bytes/Math.pow(1024, Math.floor(e))).toFixed(2)+" "+s[e];
	}


	/**
	 * ie 8 버전 trim 가능
	 */
	if(typeof String.prototype.trim !== 'function') {
	     String.prototype.trim = function() {
	     //Your implementation here. Might be worth looking at perf comparison at
	     //http://blog.stevenlevithan.com/archives/faster-trim-javascript
	     //
	     //The most common one is perhaps this:
	     return this.replace(/^\s+|\s+$/g, '');
	     }
	}

	/**
	 * 전화번호 대쉬 추가 기능
	 * @param str
	 * @returns
	 */
	function chk_tel(str){
	      var str;
	      str = checkDigit(str);
	      len = str.length;
	      if(len==7){
	    	  var num = str.substring(0,3) + '-' + str.substring(3,len)
		        return num;
		      }
	      else if(len==8){
	       if(str.substring(0,2)==02){
	         return str;
	       }else{
	        return phone_format(1,str);
	       }
	      }else if(len==9){
	       if(str.substring(0,2)==02){
	        return phone_format(2,str);
	       }else{
	           return str;
	       }
	      }else if(len==10){
	       if(str.substring(0,2)==02){
	        return phone_format(2,str);
	       }else{
	        return phone_format(3,str);
	       }
	      }else if(len==11){
	       if(str.substring(0,2)==02){
	           return str;
	       }else{
	        return phone_format(3,str);
	       }
	      }else{
	          return str;
	      }
	     }

	     function checkDigit(num){
	      var Digit = "1234567890";
	      var string = num;
	      var len = string.length;
	      var retVal = "";
	      for (i = 0; i < len; i++){
	       if (Digit.indexOf(string.substring(i, i+1)) >= 0){
	        retVal = retVal + string.substring(i, i+1);
	       }
	      }
	      return retVal;
	     }

	     function phone_format(type, num){
	      if(type==1){
	       return num.replace(/([0-9]{4})([0-9]{4})/,"$1-$2");
	      }else if(type==2){
	       return num.replace(/([0-9]{2})([0-9]+)([0-9]{4})/,"$1-$2-$3");
	      }else{
	       return num.replace(/(^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
	      }
	     }


	     /**
	      * 컴마 추가
	      * @param obj
	      * @returns {Boolean}
	      */
	     function cmaComma(obj) {
	         var firstNum = obj.value.substring(0,1); // 첫글자 확인 변수
	         var strNum = /^[/,/,0,1,2,3,4,5,6,7,8,9,/]/; // 숫자와 , 만 가능
	         var str = "" + obj.value.replace(/,/gi,''); // 콤마 제거
	         var regx = new RegExp(/(-?\d+)(\d{3})/);
	         var bExists = str.indexOf(".",0);
	         var strArr = str.split('.');

	         if (!strNum.test(obj.value)) {
	             alert("숫자만 입력하십시오.\n\n특수문자와 한글/영문은 사용할수 없습니다.");
	             obj.value = 0;
	             obj.focus();
	             return false;
	         }

	         if ((firstNum < "0" || "9" < firstNum)){
	             alert("숫자만 입력하십시오.");
	             obj.value = 0;
	             obj.focus();
	             return false;
	         }

	         while(regx.test(strArr[0])){
	             strArr[0] = strArr[0].replace(regx,"$1,$2");
	         }
	         if (bExists > -1)  {
	             obj.value = strArr[0] + "." + strArr[1];
	         } else  {
	             obj.value = strArr[0];
	         }
	     }

	     /**
	      * 콤마 나누는 부분
	      * @param n
	      * @returns
	      */
	     function commaSplit(n) {// 콤마 나누는 부분
	         var txtNumber = '' + n;
	         var rxSplit = new RegExp('([0-9])([0-9][0-9][0-9][,.])');
	         var arrNumber = txtNumber.split('.');
	         arrNumber[0] += '.';
	         do {
	             arrNumber[0] = arrNumber[0].replace(rxSplit, '$1,$2');
	         }
	         while (rxSplit.test(arrNumber[0]));
	         if(arrNumber.length > 1) {
	             return arrNumber.join('');
	         } else {
	             return arrNumber[0].split('.')[0];
	         }
	     }

	     /**
	      * 반올림
	      * @param num
	      * @returns {String}
	      */
	     function roundToTwo(num) {
	         return +(Math.round(num + "e+3")  + "e-3");
	     }
	     
	     /**
	      * 공유주소 축소 하기
	      * @param url
	      * @param callback
	      */
	     function getShortURL(url, callback){
	         var longURL = url;

	         var defaults = {
	             login: 'o_3u5ghn90dn', // 아이디
	             apiKey: 'R_31d6ad6d61ff4336bd812187a02ebdb5', //apikey
	             longUrl: encodeURIComponent(longURL)
	         };
	         var ret = '';
	         
	         var daurl = "http://api.bit.ly/v3/shorten?" +
	         "longUrl=" +
	         defaults.longUrl +
	         "&login=" +
	         defaults.login +
	         "&apiKey=" +
	         defaults.apiKey +
	         "&format=json";
	         
	         jQuery.getJSON(daurl, function(data){
	             
	             alert(JSON.stringify(data));
	             
	             if(data && data.status_code=="200"){
	                 callback(data.data.url);
	             }else{
	                 callback(""); 
	             }
	         });
	     } 
	     
	     
	     /**
	      * SNS 공유하기
	      * @param site
	      * @param url
	      * @param msg
	      * @param tag
	      */
	     function goSns(site, url, msg, tag) { 
	    	 snsProc(site, url, msg, tag);
	         /*
	     	//url = url.replace('https://', 'http://');
	     	var goUrl = url; 
	         getShortURL(goUrl, function(data){
	             if(data){
	                 snsProc(site, data, msg, tag);
	             }else{
	                 snsProc(site, url, msg, tag);
	             }
	         
	         });
	         */
	    }
	    
	    /**
	     * SNS 공유하기 처리
	     * @param site
	     * @param url
	     * @param msg
	     * @param tag
	     */
	    function snsProc(site, url, msg, tag) {
	    	var baseUrl = location.href;
	    	var protocol = "http://";
	    	
	    	if(baseUrl.indexOf("https://") != -1){
	    		protocol = "https://";
	        }
	         if (site == "facebook"){
	            //페이스북 
	             goUrl = protocol + "www.facebook.com/sharer.php?u=" + encodeURIComponent(url)+ "&title=" + msg;
	         }else if(site == "twitter"){ 
	       
	            // 트위터 
	            goUrl = protocol + "twitter.com/intent/tweet?text=" + encodeURIComponent(msg) + "&url=" + encodeURIComponent(url); 
	         }else if(site == "me2day"){ 
	       
	            // me2day 
	            goUrl = protocol + "me2day.net/posts/new?new_post[body]=" + encodeURIComponent(msg) + " " + encodeURIComponent(url) + "&new_post[tags]=" + encodeURIComponent(tag); 
	         }else if(site == "yozm"){ 
	      
	            // 요즘 
	            goUrl = protocol + "yozm.daum.net/api/popup/prePost?link=" + encodeURIComponent(url)+ "&prefix=" + encodeURIComponent(msg) + "&parameter=" + encodeURIComponent(msg); 
	         } 
	         //top.location.href = goUrl;
	         //alert(goUrl);
	         
	         var url = goUrl;
	         var height="";
	         var width="";
	         var name="sns";
	         //popitup(url, height, width, name);
	         window.open(url, "_blank");
	     
	     }
	    
	    function encodeHtml(text){
	        return text.replace('&lt;', '<').replace('&gt;', '>');
	    }
	    
	     
	    var isMobile = {

	            Android: function () {

	                return /Android/i.test(navigator.userAgent);

	            },

	            BlackBerry: function () {

	                return /BlackBerry/i.test(navigator.userAgent);

	            },

	            iOS: function () {

	                return /iPhone|iPad|iPod/i.test(navigator.userAgent);

	            },

	            iOS_iPad: function () {

	                return /iPad/i.test(navigator.userAgent);

	            },

	            Windows: function () {

	                return /IEMobile/i.test(navigator.userAgent);

	            },

	            any: function () {

	                return (isMobile.Android() || isMobile.BlackBerry() || isMobile.iOS() || isMobile.Windows());

	            }

	        };
	    
	// 사업자 등록 번호
	function fn_biz_code_check() {
		if (!fn_check_yn()) {
			return false;
		} else {
			return true;
		}
	}

	function fn_check_yn() {
		/** 사업자 번호 적합성 체크*/
		if (!chk()) {
			return false;
		}

		return true;
	}

	function chk() {
		number = $("#bsnmRegistNo_1").val() + $("#bsnmRegistNo_2").val() + $("#bsnmRegistNo_3").val();

		if (reg_no_vald(number)) {
			if ($("#bsnmRegistNo_1").val() != ""
					&& $("#bsnmRegistNo_2").val() != ""
					&& $("#bsnmRegistNo_3").val() != "") {
				return true;
			}
		}
	}

	function reg_no_vald(id) {
		var str = "-1234567890";
		var biz_reg_no = id.replace("-", "");

		while (biz_reg_no.indexOf("-") > 0) {
			biz_reg_no = biz_reg_no.replace("-", "");
		}

		var biz_reg_no_len = biz_reg_no.length;

		if (!check_regid(biz_reg_no)) {
			return false;
		}

		if (biz_reg_no_len == 10) {
			for (i = 0; i < biz_reg_no_len; i++) {
				if (str.indexOf(biz_reg_no.substring(i, i + 1)) < 0) {
					alert("사업자 등록번호는 숫자만 가능합니다.");
					document.getElementById("bsnmRegistNo_1").focus();
					return false;
				}
			}

			return true;
		} else {
			alert("사업자 등록번호는 10자리입니다.");
			return false;
		}
	}

	//------------------------------------------------------------------------
//			사업자등록번호 체크
	//------------------------------------------------------------------------
	function check_regid(regid) {

		var reg1 = new RegExp("([0-9]{10})");
		var isin = reg1.test(regid);

		if (!isin) {
			alert('비정상적인 사업자등록번호입니다.');
			return false;
		}

		if (!bussnoCheck(regid)) {
			return false;
		}
		return true;

	}
	//end of check_regid
	//------------------------------------------------------------------------

	//------------------------------------------------------------------------
//		사업자등록번호 적합성 확인
	//------------------------------------------------------------------------
	function bussnoCheck(bussNo) {
		li_value = new Array(10);

		if (bussNo.length == 10) {
			li_value[0] = (parseFloat(bussNo.substring(0, 1)) * 1) % 10;
			li_value[1] = (parseFloat(bussNo.substring(1, 2)) * 3) % 10;
			li_value[2] = (parseFloat(bussNo.substring(2, 3)) * 7) % 10;
			li_value[3] = (parseFloat(bussNo.substring(3, 4)) * 1) % 10;
			li_value[4] = (parseFloat(bussNo.substring(4, 5)) * 3) % 10;
			li_value[5] = (parseFloat(bussNo.substring(5, 6)) * 7) % 10;
			li_value[6] = (parseFloat(bussNo.substring(6, 7)) * 1) % 10;
			li_value[7] = (parseFloat(bussNo.substring(7, 8)) * 3) % 10;
			li_temp = parseFloat(bussNo.substring(8, 9)) * 5 + "0";
			li_value[8] = parseFloat(li_temp.substring(0, 1))
					+ parseFloat(li_temp.substring(1, 2));
			li_value[9] = parseFloat(bussNo.substring(9, 10));

			li_lastid = (10 - ((li_value[0] + li_value[1] + li_value[2]
					+ li_value[3] + li_value[4] + li_value[5] + li_value[6]
					+ li_value[7] + li_value[8]) % 10)) % 10;

			if (li_value[9] != li_lastid && bussNo != '1234567899') {
				alert("사업자등록번호가 잘못 입력되었습니다.");
				document.getElementById("bsnmRegistNo_1").focus();
				return false;
			} else {
				$("#bsnmRegistNo").val(bussNo);
				return true;
			}
		} else {
			alert("사업자등록번호는 10자리 숫자입니다.");
			return false;
		}
	}
	// end of bussnoCheck
	//------------------------------------------------------------------------

	function getIEVersion() {
	    var rv = -1; // Return value assumes failure.
	    var ua = navigator.userAgent;
	    
	    //IE 7~10일
	    if (navigator.appName == 'Microsoft Internet Explorer') {
	        var re  = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");
	      	if (re.exec(ua) != null) {
	            rv = parseFloat( RegExp.$1 );
	        }

	        //XP 혹은 VISTA의 경우
	        if(ua.toLowerCase().match(/win/)) {
	            if(ua.replace(/ /g,'').indexOf("WindowsNT5.1") != -1 || ua.replace(/ /g,'').indexOf("WindowsNT6.0") != -1) {
	                return -90;
	            }
	        }
	    } else if(!ua.match(/Trident/)) {
	        //IE 이외의 다른 브라우저
	        return -99;
	    }

	    return rv;
	}

	//탭 공통
	$.fn.tab = function(options){
	    var defaults = {
	        contsClass : '',
	        defaultIdx : null
	    };
	    var options = $.extend({}, defaults, options);
	    var $this = $(this),
	          $element = $this.find("a"),
	          $content = $(options.contsClass);

	    //default
	    $content.hide();
	    if (options.defaultIdx != null && options.defaultIdx < $this.children("li").length)
	    {
	        $content.eq(options.defaultIdx-1).show();
	        $element.eq(options.defaultIdx-1).parent().addClass("current");
	    }else{
	        $content.eq(0).show();
	        $element.eq(0).parent().addClass("current");
	    }
		
		$element.click(function(e){
			e.preventDefault();
			if (!$(this).parent().is(".dirLink"))/* new */
			{
				$this.children("li").removeClass("current");
				$(this).parent().addClass("current");
				$content.hide();
				$content.eq($(this).parent().index()).show();
			}
		});
		
	};

	function gfn_pageIndex(val){
		var frm = document.searchForm;
		frm.pageIndex.value = val;
		frm.submit();
	}

	/**
	 * form validation 체크
	 * @author 이진석
	 * @since 2014-10-13
	 * @param f form 폼이름
	 * @returns {Boolean} 오류면 false 정상이면 true
	 */
	function fn_checkForm(f){
		var result = true;
		jQuery(f).find('input:enabled, select:enabled, textarea:enabled, password:enabled').each(function(i){
			if(jQuery(this).attr('required') == 'true'|| jQuery(this).attr('required') == 'required' || jQuery(this).attr('required') == true){
				if(jQuery.trim(jQuery(this).val()) == ''){
					return result = emptyVal(this, "는(은) 필수 입력 항목입니다.");
				}
				
				if(jQuery(this).attr("type") == "radio"){
					var rName = jQuery(this).attr("name");   
					var rName_chk = jQuery(":radio[name="+rName+"]:checked").length;
					if(rName_chk < 1){
						return result = emptyVal(this, "는(은) 필수 입력 항목입니다.");
					}
					
				} 
			}
			if(jQuery(this).attr('emailis') == 'true' || jQuery(this).attr('emailis') == true){
				// true 형식 맞음, false 형식 틀림
				var isEmail = /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i.test(jQuery(this).val());
				if(isEmail == false){
					return result = altMsg(this, "은 이메일이 형식이 아닙니다.");
				}
			}
			if(jQuery(this).attr('dateis') == 'true' || jQuery(this).attr('dateis') == true){
				// 19xx~ 20xx 년만 가능
				var isDate = /^(19|20)\d{2}(0[1-9]|1[012])(0[1-9]|[12][0-9]|3[0-1])$/.test(jQuery(this).val());
				// 2월
				var twoMonth = /^\d{4}(02)\d{1,2}$/.test(jQuery(this).val());
				// 말일
				var twoMLastday = /^\d{4}(02)(0[1-9]|[12][0-9])$/.test(jQuery(this).val());  
				if(jQuery(this).val() != '' && !isDate){
					jQuery(this).focus();
					jQuery(this).select();
					result = false;
					alert(jQuery(this).attr('title')+"가(이) 날짜 형식이 아닙니다.");
					
					return false;
				}
				if(jQuery(this).val() != '' && isDate){ // idDate True
					if(twoMonth){ // 그 중 2월이면
						if(!twoMLastday){ // 말일만 한번 더 점검
							jQuery(this).focus();
							jQuery(this).select();
							result = false;
							alert(jQuery(this).attr('title')+"가(이) 날짜 형식이 아닙니다.");
							return false;
						}
					}
				}
			}
			if(jQuery(this).attr('isnumber') == 'true' || jQuery(this).attr('isnumber') == true){
				var isNumber=/^[0-9]*$/.test(jQuery(this).val());
				if(jQuery(this).val() != '' && !isNumber){
					result = false;
					return altMsg(jQuery(this), "는 숫자만 입력 할 수 있습니다.");
				}
				if(jQuery(this).attr("min") != ""){
					if(eval(jQuery(this).attr("min")) > jQuery(this).val()){
						jQuery(this).val(jQuery(this).attr("min"));
					}else if(eval(jQuery(this).attr("max")) < jQuery(this).val()){
						jQuery(this).val(jQuery(this).attr("max"));
					}
				}
			}
			if(jQuery(this).attr('juminidis') == 'true' || jQuery(this).attr('juminidis') == true){
				var isJuminid = /^\d{6}[\/-]\d{7}$/.test(jQuery(this).val());
				if(jQuery(this).val() != '' && !isJuminid){
					result = false;
					alert(jQuery(this).attr('title')+"를 확인하세요.");
					return false;
				}
			}
			if(jQuery(this).attr('telis') == 'true' || jQuery(this).attr('telis') == true){
				var isJuminid = /^\d{2,3}[\/-]\d{3,4}[\/-]\d{4}$/.test(jQuery(this).val());
				if(jQuery(this).val() == ''){
				}else if(!isJuminid){
					jQuery(this).focus();
					jQuery(this).select();
					result = false;
					alert(jQuery(this).attr('msg_telis'));
					return false;
				}
			}
			if(jQuery(this).attr('lengthis') != undefined){	//lengthis="10" msg_lengthis="10자리를 입력해주세요."
				var isLength = false;
				if(jQuery(this).val().length == parseInt(jQuery(this).attr('lengthis'))){
					isLength = true;
				}
				if(!isLength){
					jQuery(this).focus();
					jQuery(this).select();
					result = false;
					alert(jQuery(this).attr('msg_lengthis'));
					return false;
				}
			}
		});
		return result;
	}

	// value가 비였을때 메시지 처리
	function emptyVal(el, msg){
		return altMsg(el, msg);
	}

	// 메시지 처리
	function altMsg(el, msg){
		if(jQuery(el).attr("title") == undefined){alert("name="+jQuery(el).prop("name")+"의 title 속성이 없습니다. title을 넣어주세요.");
		}else{alert(jQuery(el).attr("title")+msg);}
		jQuery(el).focus();
		jQuery(el).select();
		return false;
	}

	/* 
	 * 
	 * 같은 값이 있는 열을 병합함
	 * 
	 * 사용법 : $('#테이블 ID').rowspan(0);
	 * 
	 */     
	$.fn.rowspan = function(colIdx, isStats) {       
		return this.each(function(){      
			var that;     
			$('tr', this).each(function(row) {      
				$('td:eq('+colIdx+')', this).filter(':visible').each(function(col) {
					
					if ($(this).html() == $(that).html()
						&& (!isStats 
								|| isStats && $(this).prev().html() == $(that).prev().html()
								)
						) {            
						rowspan = $(that).attr("rowspan") || 1;
						rowspan = Number(rowspan)+1;

						$(that).attr("rowspan",rowspan);
						
						// do your action for the colspan cell here            
						$(this).hide();
						
						//$(this).remove(); 
						// do your action for the old cell here
						
					} else {            
						that = this;         
					}          
					
					// set the that if not already set
					that = (that == null) ? this : that;      
				});     
			});    
		});  
	}; 

	$.fn.thRowspan = function(colIdx, isStats) {       
		return this.each(function(){      
			var that;     
			$('tr', this).each(function(row) {      
				$('th:eq('+colIdx+')', this).filter(':visible').each(function(col) {
					
					if ($(this).html() == $(that).html()
						&& (!isStats 
								|| isStats && $(this).prev().html() == $(that).prev().html()
								)
						) {            
						rowspan = $(that).attr("rowspan") || 1;
						rowspan = Number(rowspan)+1;

						$(that).attr("rowspan",rowspan);
						
						// do your action for the colspan cell here            
						$(this).hide();
						
						//$(this).remove(); 
						// do your action for the old cell here
						
					} else {            
						that = this;         
					}          
					
					// set the that if not already set
					that = (that == null) ? this : that;      
				});     
			});    
		});  
	};

	/* 
	 * 
	 * 같은 값이 있는 행을 병합함
	 * 
	 * 사용법 : $('#테이블 ID').colspan (0);
	 * 
	 */   
	$.fn.colspan = function(rowIdx) {
		return this.each(function(){
			
			var that;
			$('tr', this).filter(":eq("+rowIdx+")").each(function(row) {
				$(this).find('th').filter(':visible').each(function(col) {
					if ($(this).html() == $(that).html()) {
						colspan = $(that).attr("colSpan") || 1;
						colspan = Number(colspan)+1;
						
						$(that).attr("colSpan",colspan);
						$(this).hide(); // .remove();
					} else {
						that = this;
					}
					
					// set the that if not already set
					that = (that == null) ? this : that;
					
				});
			});
		});
	}

	function fn_datepickerKeyEvent(){
		$(".datepicker").on("keypress keydown", function(e){
			//var $readonly = $(this).prop("readonly");
			
			$(this).attr("maxlength", "10");
			// if($readonly && (e.keyCode == 46 || e.keyCode == 8)){
			/*
			if(e.keyCode == 46 || e.keyCode == 8){
				$(this).val('');
				$(this).datepicker("hide");
				$(this).blur();
			}
			
			e.preventDefault();*/
		});
		$(".datepicker").on("blur", function(e){

			var replaceObj = $(this).val().replace(/-/gi,"");
			var isDate = true;
			
			if(replaceObj.length > 0){
				if(replaceObj.length < 8){
					alert($(this).attr('title')+"가(이) 날짜 형식이 아닙니다.");
					$(this).val('');
					$(this).focus();
					$(this).select();
					//$(this).datepicker("hide");
					isDate = false;
				}else{
					if(!fn_isDate($(this), replaceObj)){
						$(this).val('');
						$(this).focus();
						$(this).select();
						isDate = false;
					}
				}
				
				var isDateFomat = /[0-9]{4}-[0-9]{2}-[0-9]{2}$/.test(jQuery(this).val());
				
				if(!isDateFomat && isDate){
					alert($(this).attr('title')+"가(이) 날짜 형식이 아닙니다. 예) 2017-03-31");
					$(this).val('');
					$(this).focus();
					$(this).select();
				}
			}
			
		});
		$(".datepickerFrom").on("keypress keydown", function(e){
			//var $readonly = $(this).prop("readonly");
			$(this).attr("maxlength", "10");
	/*
			var replaceObj = $(this).val().replace(/-/gi,"");
			if(replaceObj.length >= 8){
				if(!fn_isDate($(this), replaceObj)){
					$(this).val('');
					$(this).focus();
					$(this).select();
					$(this).datepicker("hide");
					//return;
				}
			}
			
			// if($readonly && (e.keyCode == 46 || e.keyCode == 8)){
			
			if(e.keyCode == 46 || e.keyCode == 8){
				$(this).val('');
				$(this).datepicker("hide");
				$(this).blur();
			}
			
			e.preventDefault();*/
		});
		$(".datepickerFrom").on("blur", function(e){

			var replaceObj = $(this).val().replace(/-/gi,"");
			var isDate = true;
			
			if(replaceObj.length > 0){
				if(replaceObj.length < 8){
					alert($(this).attr('title')+"가(이) 날짜 형식이 아닙니다.");
					$(this).val('');
					$(this).focus();
					$(this).select();
					//$(this).datepicker("hide");
					isDate = false;
				}else{
					if(!fn_isDate($(this), replaceObj)){
						$(this).val('');
						$(this).focus();
						$(this).select();
						isDate = false;
					}
				}
				
				var isDateFomat = /[0-9]{4}-[0-9]{2}-[0-9]{2}$/.test(jQuery(this).val());
				
				if(!isDateFomat && isDate){
					alert($(this).attr('title')+"가(이) 날짜 형식이 아닙니다. 예) 2017-03-31");
					$(this).val('');
					$(this).focus();
					$(this).select();
				}
			}
			
		});

		$(".datepickerTo").on("keypress keydown", function(e){
			//var $readonly = $(this).prop("readonly");
			//if($readonly && (e.keyCode == 46 || e.keyCode == 8)){
			$(this).attr("maxlength", "10");
			/*
			var replaceObj = $(this).val().replace(/-/gi,"");
			
			if(replaceObj.length >= 8){
				if(!fn_isDate($(this), replaceObj)){
					$(this).val('');
					$(this).focus();
					$(this).select();
					$(this).datepicker("hide");
					//return;
				}
			}
			
			
			if(e.keyCode == 46 || e.keyCode == 8){
				$(this).val('');
				$(this).datepicker("hide");
				$(this).blur();
			}
			
			e.preventDefault();*/
		});
		$(".datepickerTo").on("blur", function(e){

			var replaceObj = $(this).val().replace(/-/gi,"");
			var isDate = true;
			
			if(replaceObj.length > 0){
				if(replaceObj.length < 8){
					alert($(this).attr('title')+"가(이) 날짜 형식이 아닙니다.");
					$(this).val('');
					$(this).focus();
					$(this).select();
					//$(this).datepicker("hide");
					isDate = false;
				}else{
					if(!fn_isDate($(this), replaceObj)){
						$(this).val('');
						$(this).focus();
						$(this).select();
						isDate = false;
					}
				}
				
				var isDateFomat = /[0-9]{4}-[0-9]{2}-[0-9]{2}$/.test(jQuery(this).val());
				
				if(!isDateFomat && isDate){
					alert($(this).attr('title')+"가(이) 날짜 형식이 아닙니다. 예) 2017-03-31");
					$(this).val('');
					$(this).focus();
					$(this).select();
				}
			}
			
		});
	}

	var maxLength = 1000;
	$("#goodsIntrcn").on("keyup keydown keypress", function(e){
		var totalByte = 0;
		for (var i = 0; i < $(this).val().length; i++) {
			totalByte++;
		}
	    if(totalByte > maxLength){
	    	var msg_len = $(this).val().length;
	    	while(totalByte > maxLength){
	    		msg_len--;
	    		totalByte--;
	    	}
	        $(this).val($(this).val().substring(0, msg_len));
	        $("#goodsIntrcnSize").text(maxLength-maxLength);
	    }else{
	    	$("#goodsIntrcnSize").text(totalByte);
	    }
	});


	/**
	 * Byte 체크 2017.04.27 
	 * 한글을 3byte로 인식하여 length 체크(keyEvent) 
	 **/
	function getByteLengthKeyEvent(data, limitLength){
		var totLen = 0;
		var tempData = "";
		var overFlag = false;
		
		var str = data.val().trim();
		//alert(data.val());
		for (var i = 0; i < str.length; i++) {
			var ch = escape(str.charAt(i));

			if( ch.length == 1 ){
				totLen++;
			}else if( ch.indexOf("%u") != -1 ){
				totLen += 3;//Db가 한글을 3byte로 인식하여 2->3
			}
			
			if(totLen > limitLength){
				overFlag = true;
			}
			
			// 기준바이트보다 작을경우에만 tempData에 담음
			if(totLen <= limitLength){
				tempData = tempData + str.charAt(i);
			}
		}
		// 기준바이트보다 클경우에만 tempData로 입력값 변경
		if(overFlag){
			data.val(tempData);
		}

		return true;
	}


	/**
	 * Byte 체크 2017.04.04 
	 * 한글을 3byte로 인식하여 length 체크 
	 **/
	function getByteLength(data, englength, korlength, title){
		var len = 0;
		var str = data.val();

		for(var i=0; i < str.length; i++) {
			var ch = escape(str.charAt(i));

			if( ch.length == 1 ) len++;
			else if( ch.indexOf("%u") != -1 )  len += 3;//Db가 한글을 3byte로 인식하여 2->3
			//else if( ch.indexOf("%") != -1 ) len += ch.length/3;
		}
		
		if(len > englength){
			alert(title+"(은)는 한글은 최대 "+korlength+"자 / 숫자 및 특수기호는 "+englength+"자까지 입력가능합니다.");
			data.focus();
			return false;
		}
		
		return true;
	}
	/**
	 *공백제거 함수(양쪽끝, 중간) 2017.04.04
	 **/
	function trim(stringToTrim) {
	    return stringToTrim.replace(/^\s+|\s+$/g,"");
	}

	//var attchfileExt = "hwp,doc,ppt,pptx,pdf,xlsx,xls,gif,jpg,png";
	/**
	 * 파일 유효성 체크 2017.04.17
	 */

	var imgfileExt = "jpg,jpeg,gif,png";
	//var attchfileExt = "hwp,doc,docx,ppt,pptx,pdf,xlsx,xls,jpg,jpeg,gif,png,txt";
	var attchfileExt = "ai,alz,avi,bmp,doc,docx,egg,eml,eps,gif,htm,html,hwp,indd,jpeg,jpg,key,lnk,m2ts,m4v,mht,mov,mp4,mpeg,mpg,npf,numbers,pages,partial,pdf,png,ppsx,ppt,pptm,pptx,psd,rar,rtf,show,tgz,tif,tiff,txt,url,wlmp,wmv,xls,xlsb,xlsm,xlsx,xml,xps,zip";
	function fn_fileUpload_chk($obj){
		var value = $obj.val();
		var id = $obj.attr("id");
		
		if(id == "photoFile" || id == "hffcProofFile" || id == "lastAcdmcrFile" || id == "bannerFile" || id == '10000202'){
			upload_type = imgfileExt;	
		}else if(id == "uploadFile"){
			upload_type = "xlsx";
		}else{
			upload_type = attchfileExt;			
		}

		var chk_num = 0;
		type = upload_type.split(",");	// 파일유형들을 스크립트로 나눠서 배열로 저장
		name = value;

		f_name = name.substring(name.lastIndexOf("\\")+1);
		f_type = name.substring(name.lastIndexOf(".")+1).toLowerCase();
		for(var i=0;i<type.length;i++){
			if(f_type==type[i]||f_type=="") chk_num++;
		}

		if(chk_num==0) {
			return false;
		} else {
			return true;
		}
	}


	//1 ~ 9 한글 표시
	var arrNumberWord = new Array("","일","이","삼","사","오","육","칠","팔","구");
	// 10, 100, 100 자리수 한글 표시
	var arrDigitWord = new  Array("","십 ","백 ","천 ");
	// 만단위 한글 표시
	var arrManWord = new  Array("","만 ","억 ", "조 ");

	function numToHan(obj, target, unit){
		
	    var num_value = $("#"+obj).val();
	    num_value = num_value.replace(/,/g,"");
	    var num_length = num_value.length;
	    
	    if(isNaN(num_value) == true){
	    	return;
	    }

	    var han_value = "";
	    var man_count = 0;      // 만단위 0이 아닌 금액 카운트.

	    for(var i=0; i < num_value.length; i++){
		    // 1단위의 문자로 표시.. (0은 제외)
		    var strTextWord = arrNumberWord[num_value.charAt(i)];
		
		    // 0이 아닌경우만, 십/백/천 표시
		    if(strTextWord != ""){
			    man_count++;
			    strTextWord += arrDigitWord[(num_length - (i+1)) % 4];
		    }
		
		    // 만단위마다 표시 (0인경우에도 만단위는 표시한다)
		    if(man_count != 0 && (num_length - (i+1)) % 4 == 0){
			    man_count = 0;
			    strTextWord = strTextWord + arrManWord[(num_length - (i+1)) / 4];
		    }
		
		    han_value += strTextWord;
	    }

	    //if(num_value != 0){
	    	document.getElementById(target).innerHTML = han_value + " " + unit;
	    //}
	}

	// 공백사용못하게
	// onkeyup="fn_noSpace(this);" onchange="fn_noSpace(this);"
	function fn_noSpace(obj) {
	   var str_space = /\s/;  // 공백체크
	   if(str_space.exec(obj.value)) { //공백 체크
	       alert("해당 항목에는 공백을 사용할수 없습니다.");
	       obj.focus();
	       obj.value = obj.value.replace(' ',''); // 공백제거
	       return false;
	   }
	}

	function fn_isDate(obj, replaceObj) {
		
		//19xx~ 20xx 년만 가능
		var isDate = /^(19|20)\d{2}(0[1-9]|1[012])(0[1-9]|[12][0-9]|3[0-1])$/.test(replaceObj);
		// 2월
		var twoMonth = /^\d{4}(02)\d{1,2}$/.test(replaceObj);
		// 말일
		var twoMLastday = /^\d{4}(02)(0[1-9]|[12][0-9])$/.test(replaceObj);  
		if(jQuery(obj).val() != '' && !isDate){
			alert(jQuery(obj).attr('title')+"가(이) 날짜 형식이 아닙니다.");
			return false;
		}
		if(jQuery(obj).val() != '' && isDate){ // idDate True
			if(twoMonth){ // 그 중 2월이면
				if(!twoMLastday){ // 말일만 한번 더 점검
					alert(jQuery(obj).attr('title')+"가(이) 날짜 형식이 아닙니다.");
					return false;
				}
			}
		}
		return true;
	}


	function caldate(day){
		var caledmonth, caledday, caledYear;
		var loadDt = new Date();
		var v = new Date(Date.parse(loadDt) - day*1000*60*60*24);
		
		caledYear = v.getFullYear();
		
		if( v.getMonth().toString().length == 1 ){
			caledmonth = '0'+(v.getMonth()+1);
		}else{
			caledmonth = v.getMonth()+1;
		}
		
		if( v.getDate().toString().length == 1 ){
			caledday = '0'+v.getDate();
		}else{
			caledday = v.getDate();
		}
		return caledYear+'-'+caledmonth+'-'+caledday;
	}



	function checkByte(comp,maxByte) {
		var value = comp.value;
		
		 for(b=i=0;c=value.charCodeAt(i);) {
	    	b+=c>>7?3:1;
	    	if (b > maxByte)
	    		break;
	    	i++;
		 }

	   return $("#"+comp.id).val(value.substring(0,i)); 
	}
	
	
	function getByteB(str) {

		var byte = 0;

		for (var i=0; i<str.length; ++i) {
			// 기본 한글 2바이트 처리
			(str.charCodeAt(i) > 127) ? byte += 3 : byte++ ;
		}

		return byte;

	}
	
	//날짜 자동 하이픈(-) 함수
	function inputYMDNumber(obj) {
        if(event.keyCode != 8) {
            if(obj.value.replace(/[0-9 \-]/g, "").length == 0) {
                var number = obj.value.replace(/[^0-9]/g,"");
                var ymd = "";
                if(number.length < 4) {
                    return number;
                } else if(number.length < 6){
                    ymd += number.substr(0, 4);
                    ymd += "-";
                    ymd += number.substr(4);
                } else {
                    ymd += number.substr(0, 4);
                    ymd += "-";
                    ymd += number.substr(4, 2);
                    ymd += "-";
                    ymd += number.substr(6);
                }
                obj.value = ymd;
            } else {
                alert("숫자 이외의 값은 입력하실 수 없습니다.");
                obj.value = obj.value.replace(/[^0-9 ^\-]/g,"");
                return false;
            }
        } else {
            return false;
        }
    }
	
	
	// 입력시 콤마
	function fn_comma(val) {
		var id = val.id;
		var num = val.value;

		num = num.replace(/[^0-9]/g,'');   // 입력값이 숫자가 아니면 공백
		num = num.replace(/,/g,'');
		$("#"+id).val(num.replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	}
	
	// 조회 후 콤마
	function numberComma(val){
		var regexp = /\B(?=(\d{3})+(?!\d))/g; 
		return val.toString().replace( regexp, ',' );

	}
	
	// 조회후 날짜 - 추가
	function fn_yyymmdd(obj){
		 var number = obj;
         var ymd = "";
         
         if(number.length < 4) {
             return number;
         } else if(number.length < 6){
             ymd += number.substr(0, 4);
             ymd += "-";
             ymd += number.substr(4);
         } else {
             ymd += number.substr(0, 4);
             ymd += "-";
             ymd += number.substr(4, 2);
             ymd += "-";
             ymd += number.substr(6);
         }
        return ymd;
	}
	
	
	// 주민번호 마스킹
	function fn_juminMasking(str) {
		 str = String(str);
		 return str.replace(/([0-9]{7})$/gi,"-*******");
	}
	
	// 달에 첫일,마지막일 구하기
	function dayFormatChk(_today, type){
		var day;
		var lastDay;
		if(type==1){//현재 첫일
			day = _today.getFullYear()+"-"+("0"+(_today.getMonth()+1)).slice(-2)+"-" +("01");  
		}else if(type==2){ //현재 말일 구하기
			day = _today.getFullYear()+"-"+("0"+(_today.getMonth()+1)).slice(-2)+"-" +(_today.getDate()); 
			lastDay = GRIT.date.getLastDay(day);
			day = _today.getFullYear()+"-"+("0"+(_today.getMonth()+1)).slice(-2)+"-" +(lastDay);
		}
			return day;

	}
	
	// 전화번호 국번 체크
	function checkPhoneNum(asPhoneNum){
		var val = asPhoneNum;
		var phoneNum = val.substr(0,3);
		if(phoneNum.substr(0,2) == "02"){
			return true;
		}else if(phoneNum != "031" && phoneNum != "032" && phoneNum != "033" && phoneNum != "041" &&
				   phoneNum != "042" && phoneNum != "043" && phoneNum != "051" && phoneNum != "052" && phoneNum != "053" &&
				   phoneNum != "054" && phoneNum != "055" && phoneNum != "061" && phoneNum != "062" && phoneNum != "063" &&
				   phoneNum != "064" && phoneNum != "011" && phoneNum != "016" && phoneNum != "017" && phoneNum != "018" &&
				   phoneNum != "019" && phoneNum != "010" && phoneNum != "070"){
			return false;		
			
		}
		return true;
				
	}
	
	// 현재날짜 yyyymmdd
	function getyyyymmdd(){
		var toDay = new Date();
		
		var yyyy = toDay.getFullYear();
		var mm = ("0" + (1 + toDay.getMonth())).slice(-2);
		var dd = ("0" + toDay.getDate()).slice(-2);
		
		return yyyy+mm+dd;
	}
	
	
	
