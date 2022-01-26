// 아이디/암호 처리
//$(document).on('click','#login_container .btn_login img',function(){

$(document).on('click','.loginFrame .btn_login button',function(){
  //fn_loginChk();
	
  var $loginId 		= $('#loginId');
  var $loginPw 		= $('#loginPw');
  var $lastLoginIp	= $('#lastLoginIp');
  
  if($loginId.val() == '') {
    // alert('아이디를 입력해주세요.');
	mFnc.alert('alert','아이디를 입력해주세요.');
    return false;
  }

  if($loginPw.val() == '') {
    // alert('암호를 입력해주세요.');
	mFnc.alert('alert','암호를 입력해주세요.');
    return false;
  }
  

  var param = {
     'userId' 		: $loginId.val(),
     'pwd' 	  		: $loginPw.val(),
     'lastLoginIp'	: $lastLoginIp.val(),
  };

  $.ajax({
    url: '/common/processLogin',
    type: 'post',
    data: JSON.stringify(param),
    datatype: 'json',
    contentType: "application/json; charset=utf-8",
    success: function(json){
    	//GRIT.debug('json : '+ JSON.stringify(json));
    	//GRIT.debug('로그인 완료!');
      var _errCode = json.message.errCode;
	  var _msg = json.message.errMsg;
	  
//	  alert(_errCode);
//	  _errCode = '0';
      switch (_errCode){
	      case '0' :
	    	  //sessionStorage 추가
	    	  sessionStorage.setItem('userNm', 		json.data.userNm);
	    	  sessionStorage.setItem('userGroupCd', json.data.userGroupCd);
	    	  sessionStorage.setItem('linkNm'     , json.data.linkNm);
	    	  sessionStorage.setItem('nowLoginIp' , json.data.nowLoginIp);
	    	  sessionStorage.setItem('nowLogDtm', 	json.data.nowLogDtm);
	    	  sessionStorage.setItem('lastLoginIp', json.data.lastLoginIp);
	    	  sessionStorage.setItem('lastLogDtm', 	json.data.lastLogDtm);

	          window.location = '/common/main';
	    	  break;
	      case '1' :
	      case '2' :
	    	  param = {
	      	  }
	    	  $.ajax({
	    		    url: '/common/loginMemberPwd?userId=' + $loginId.val() + '&fromPage=init' ,
	    		    type: 'post',
	    		    data: JSON.stringify(param),
	    		    datatype: 'html',
	    		    contentType: "application/html; charset=utf-8",
	    		    success: function(data){
	    		    	mFnc.layerPopup('loginMemberPwd',700,320);
	    		    	mFnc.layerPopupADD('loginMemberPwd', data );
	    		    	return;
	    			},
	    			error: function() {
	    				mFnc.layerError();
	    				return;
	    			}
	    	  });
	    	  break;

	      case '9' :
	    	  mFnc.alert('alert',_msg,440,220);
	    	  break;
	      default :
      }
      return;
	},
	  error: function() {
		  mFnc.layerError();
		  return;
	}
  });
})

.on('click','#login_container .login_footer a',function(){
	$.ajax({
		url: '/common/psnlInfoAgree2',
		type: 'get',
		datatype: 'html',
		success: function(data){
        	mFnc.layerPopup('signup',650,510);
        	mFnc.layerPopupADD('signup', data );
		},
		error: function() {
			mFnc.layerError();
			return;
		}
	});
});