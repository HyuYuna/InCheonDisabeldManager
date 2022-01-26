$(document).ready(function(){
    setting();

    var _isLnbOpen = false;
    $('.lnb-close').on('click',function(e){
        e.preventDefault();
        if (!_isLnbOpen){
            $('#lnbWrap').animate({'width':'13px'},100,function(){
                $('.lnb-close').addClass('hide');
                $(this).find('#left-top-menu').hide();
                $(this).find('.lnb').hide();
                $('#lnbWrap h2').hide();
                contentW();
            });
            _isLnbOpen = true;
        }else{
            $('#lnbWrap #left-top-menu, #lnbWrap .lnb, #lnbWrap h2').show();
            $('#lnbWrap').animate({'width':'200px'},100,function(){
                $('.lnb-close').removeClass('hide');
                contentW();
            });
            _isLnbOpen = false;
        }
    });
    var _isTabOpen = false;
    $('.tab-all-close').on('click',function(e){
        e.preventDefault();
        if (!_isTabOpen){
            $(this).siblings('ul').show();
            _isTabOpen = true;
        }else{
            $(this).siblings('ul').hide();
            _isTabOpen = false;
        }
    });
});
$(window).resize(function(){
    setTimeout(function(){
    	setting();
    },200);
})


function _init() {
	'use strict';
	GRIT.debug('=====================START==========================');

	$('.content').width($('#contentWrap').width() - $('#lnbWrap').width() - 10);
    // $('.section-half.percent').width($('.sub-section').width() - $('.section-half.fixed').width() - 10);
    $('.section-half.percent').width($('.section').width() - $('.section-half.fixed').width() - 10);

    GRIT.debug($('.section').height());
    GRIT.debug($('.sub-section').height());

    var boxHeight = $('.section').height() - $('.sub-section').height() -25;
    $('.section-vertical-persent').height(boxHeight);


    GRIT.debug('===================== END ==========================');
}

function setting() {
	if(screen.height == window.outerHeight && screen.width == window.outerWidth) {
		var menuId = $('.tabtopmenu.ellipsis.active').data('layername');
		if(menuId == 'MNT100' || menuId == 'MNT120') {
			$('#lnbWrap').width(0);
			$('#headerWrap').height(0);
		} else {
			//$('#headerWrap').height(103);
			$('#lnbWrap').width(235);
		}
	} else {
		//$('#headerWrap').height(103);
		$('#lnbWrap').width(235);
	}
	
    //$('#contentWrap').height($(window).innerHeight()-($('#headerWrap').height()+$('#footerWrap').height() - 26));
	var scrollConH = $(window).innerHeight()-($('#footerWrap').height()+30);
	//console.log(scrollConH);
	//alert(scrollConH);
	$('#contentWrap').height(scrollConH);
    contentW();
    //$('.lnb').height($('#contentWrap').height()-$('#lnbWrap > h2').height() - $('#left-top-menu').height() - 10);
    $('#lnbWrap').height($('#headerWrap').height()-170-40);
    //$('.section-wrap').height($('.content').height() - 47);
    //$('.home-wrap').height($('.content').height() - 47);
    /*
    if($('.scrollH').length > 0){
        var scrollConH ;
        if($('.section-wrap .section-top').length > 0){
            scrollConH = $('.section-wrap').height() - $('.section-top').height();
        }else{
            scrollConH = $('.section-wrap').height();
        }
        $('.scrollH').css({'height':scrollConH});
    }*/
    resizeMenuContent();
    
    
}

function contentW(){
    $('.content').width($('#contentWrap').width() - $('#lnbWrap').width() - 12);
    
    resizeMenuContent();
}

function contentWH(menuId,w,h){
	
	AUIGrid.resize(menuId+"grid_wrap", w, h);
    
}

function contentWH2(menuId,w,h){
	
	AUIGrid.resize(menuId+"grid_wrap2", w, h);
    
}

function getMenuBoxContent() {
    var id = $('.tabtopmenu.ellipsis.active').data('layername');
	return $('.tabtopmenu.boxcontent.' + id);
}

function setSectionHeight(menuBox) {
	var wrapHeight = $(menuBox).height();
	var topHeight = $(menuBox).children('.section-top').height();
	var secComp = $(menuBox).children('.section');
	$(secComp).css({'height': wrapHeight - topHeight});

	setSubSectionWidth(secComp);
	setSubSectionHeight(secComp);
	
	$(secComp).find('.sub-section').each(function(idx, comp, arr) {
		setSubSectionWidth(comp);
		setSubSectionHeight(comp);
	});
	
}

function setSubSectionWidth(comp) {
    var boxFullList = $(comp).children('.full-width');
    var boxFullLen = boxFullList.length;
    
    var boxPersentList = $(comp).children('.horizon-resize');
    var boxPersentLen = boxPersentList.length;

    var remainWidth = $(comp).width();
    
    if(boxFullLen > 0) {
        for(var i = 0 ; i < boxFullLen ; i++) {
                $(boxFullList[i]).width(remainWidth);
                setSubSectionWidth($(boxFullList[i]));
        }
    } else if(boxPersentLen > 0) {
        var boxFixList = $(comp).children('.horizon-fix');
        var boxFixLen = boxFixList.length;
        var margin_bottom = 10;
        
        remainWidth -= (boxFixLen + boxPersentLen - 1) * margin_bottom;
        
        for(var i = 0 ; i < boxFixLen ; i++) {
            remainWidth -= $(boxFixList[i]).width() + 2;
        }
        
        var perWidth = Math.floor(remainWidth / boxPersentLen);
        
        for(var i = 0 ; i < boxPersentLen ; i++) {
                $(boxPersentList[i]).width(perWidth);
                setSubSectionWidth($(boxPersentList[i]));
        }
    }
}

function setSubSectionHeight(comp) {
    var boxFullList = $(comp).children('.full-height');
    var boxFullLen = boxFullList.length;
    
    var boxPersentList = $(comp).children('.vertical-resize');
    var boxPersentLen = boxPersentList.length;

    var parentWidth = $(comp).height();        
    var tabWrapList = $(comp).children('.tab-wrap2');
    var tabWrapLen = tabWrapList.length;
    var boxTopList = $(comp).children('.box-top');
    var boxTopLen = boxTopList.length;
    var remainHight = parentWidth;
    
    for(var i = 0 ; i < tabWrapLen ; i++) {
        remainHight -= $(tabWrapList[i]).height() + 5;
    }
    
    for(var i = 0 ; i < boxTopLen ; i++) {
        remainHight -= $(boxTopList[i]).height();
    }
    
    if(boxFullLen > 0) {
        for(var i = 0 ; i < boxFullLen ; i++) {
                $(boxFullList[i]).height(remainHight);
                setSubSectionHeight($(boxFullList[i]));
        }
    } else if(boxPersentLen > 0) {
        var boxFixList = $(comp).children('.vertical-fix');
        var boxFixLen = boxFixList.length;
        var margin_bottom = 10;
        
        remainHight -= (boxFixLen + boxPersentLen - 1) * margin_bottom;
        
        for(var i = 0 ; i < boxFixLen ; i++) {
            remainHight -= $(boxFixList[i]).height();
        }
        
        var perHeight = Math.floor(remainHight / boxPersentLen);
        
        for(var i = 0 ; i < boxPersentLen ; i++) {
                $(boxPersentList[i]).height(perHeight);
                setSubSectionHeight($(boxPersentList[i]));
        }
    }
}

function resizeMenuContent() {
	setSectionHeight($(getMenuBoxContent()).find(".section").parent());
}