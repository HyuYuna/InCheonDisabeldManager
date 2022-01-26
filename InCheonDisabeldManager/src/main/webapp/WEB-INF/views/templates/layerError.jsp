<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <div class="popupWrapper minWidth300">
        <div class="errorMessageWrap">
            <img src="/resources/imagesV2/iconCaution.png"><br/><br/>
            <p>시스템에 문제가 발생했습니다.</p>
            <p>계속 에러가 발생하면 관리자에게 문의하세요.</p>
        </div>
        <div class="popupConfirmBtnWrap"><button type="button" class="popupConfirmBtn popupclose" data-pname="layerError">확인</button></div>
    </div>
    
  
<script type="text/javascript">

$(document).ready(function(){
	
	// 에러DIV 포커스
	$(".popupWrapper").attr("tabindex", -1).focus();
	
    $(window).keypress(function (e) {
		if(e.keyCode == 13){//키가 13이면 실행 (엔터는 13)
			mFnc.layerClose("layerError");
        }
 
    });
    
});
 
</script>