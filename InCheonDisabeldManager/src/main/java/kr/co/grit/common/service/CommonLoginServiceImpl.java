package kr.co.grit.common.service;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.security.MessageDigest;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.BadSqlGrammarException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import kr.co.grit.common.constants.GritConstants;
import kr.co.grit.common.dao.CommonLoginDAO;
import kr.co.grit.common.util.SessionUtil;

/**
 * @Class Name : CommonLoginServiceImpl.java
 * @Description : CommonLoginServiceImpl Business Implement class
 * @Modification Information
 */
@Service("commonLoginService")
@Transactional
public class CommonLoginServiceImpl  implements CommonLoginService {

	private static final Logger LOGGER = LoggerFactory.getLogger(CommonLoginServiceImpl.class);

    @Resource(name="commonLoginDAO")
    private CommonLoginDAO commonLoginDAO;

    @SuppressWarnings({ "rawtypes", "unchecked" })
	private void processLoginLog(String loginId, String jobFgCd, String ip, String succYn){
		Map loginLogMap = new HashMap();	//로그 기록용
		loginLogMap.put("loginId", loginId);
		loginLogMap.put("ip"	 , ip);
		loginLogMap.put("succYn" , succYn);
		loginLogMap.put("jobFgCd", jobFgCd);
		try {
			this.addSysLoginLog(loginLogMap);
		} catch (Exception e) {
			LOGGER.debug("processLoginLog Error");
		}
    }

	/**
  	 * 로그인 처리
  	 * @param
  	 * @return  로그인 처리
  	 * @exception Exception
  	 */
    @Override
	@SuppressWarnings({ "rawtypes", "unchecked" })
  	public Map processLogin(Map param) throws Exception{
		Map result      = new HashMap();
		Map messageMap  = new HashMap();

		try {
			result.put("success" , "N");	//초기값
			result.put("message" , null);
			result.put("data"    , null);

			String loginId  = (String)param.get("userId");
			String pwd      = (String)param.get("pwd");
			
			String chkPwd = this.getUserPassword(pwd);

			String succYn   = "N"; // 로그인 성공 : Y, 로그인 실패 : N
			String jobFgCd  = "1"; // 1 : 로그인 , 2 : 로그아웃
			String ip       = (String)param.get("clientIp");

	    	Map getUserMap = null; 
	    	getUserMap = this.getUserInfoList(param);
	    	
	    	String getUseYn = ""; 	
	    	
	    	if(null == getUserMap || getUserMap.isEmpty()) {
				messageMap.put("errCode", "9");
				messageMap.put("errMsg", "존재하지 않는 사용자 아이디 입니다.<br>사용자 아이디를 정확하게 입력 하십시오.");
				
				result.put("message", messageMap);
				return result;
	    	} else {
	    		getUseYn = (String)getUserMap.get("useYn");
		    	
		    	if("1".equals(getUseYn)){
	    			messageMap.put("errCode", "9");
	    			messageMap.put("errMsg", "미사용 처리 사용자 아이디 입니다.<br>사용자 아이디를 정확하게 입력 하십시오.");
	    		
		    		this.processLoginLog(loginId, jobFgCd, ip, succYn);
		    		
					result.put("message", messageMap);
					return result;
		    	}
	    	}
	    	
			//사용자 정보가 존재 하면
			String uesrPwd = (String)getUserMap.get("pwd");
			String userGroupCd = (String)getUserMap.get("userGroupCd");
	   		int accessFg = Integer.parseInt(getUserMap.get("accessFg").toString());

	   		// 로그인 아이디가 관리자가 아니면 
	   		if(!"E".equals(userGroupCd)){
	   			if(accessFg >= 5){
					messageMap.put("errCode", "9");
					messageMap.put("errMsg", "로그인정보 오류 제한회수가 초과되어 계정이 정지되었습니다.<br>관리자에게 문의하십시오.");
					this.processLoginLog(loginId, jobFgCd, ip, succYn);

					result.put("message", messageMap);
					return result;
				}
	   		}
	   			
	   		if(!chkPwd.equals(uesrPwd)){
	   			// 로그인 아이디가 관라지가 아니면
	   			if(!"E".equals(userGroupCd)){
	   				Map updateMap = new HashMap();
	    			updateMap.put("userId"   , (String)getUserMap.get("userId"));
					updateMap.put("accessFg", ++accessFg);
					this.modifyPwdErrCount(updateMap);	
					
					messageMap.put("errCode", "9");
					messageMap.put("errMsg", "암호를 잘못 입력 하셨습니다. 5회 이상 암호를 잘못 입력 할 경우, 로그인이 불가능 합니다.(현재 "+accessFg+"회)");
	   			}else{
	   				messageMap.put("errCode", "9");
					messageMap.put("errMsg", "암호를 잘못 입력 하셨습니다.");
	   			}
				
				this.processLoginLog(loginId, jobFgCd, ip, succYn);

				result.put("message", messageMap);
				return result;
	   		}

			//로그인 성공 - 로그인 처리 수행 --------------------------------------------------------------------------------
	  		succYn = "Y";
	  		messageMap.put("errCode", "0");
    		messageMap.put("errMsg" , "");
    		
    		// 로그인 성공시 오류 횟수 초기화
    		Map loginDateMap = new HashMap();
    		loginDateMap.put("userId"   , (String)getUserMap.get("userId"));
    		loginDateMap.put("accessFg", "0");
    		this.modifyPwdErrCount(loginDateMap);
    		
			if((GritConstants.RESET_USER_PASSWORD).equals(chkPwd)) {
				messageMap.put("errCode", "2");
				messageMap.put("errMsg", "비밀번호 초기값으로 로그인하여 암호 변경 페이지로 이동합니다.");
				
				result.put("message", messageMap);
				return result;
			} else {

				//3개월 지났는지 체크 : 안지났다면 true, 지났다면 false
				boolean chkPwdChDtm = checkMonth((String)getUserMap.get("passwordModDd"));

				if(chkPwdChDtm) {
		    		messageMap.put("errCode", "0");
		    		messageMap.put("errMsg" , "");
				}else {
					messageMap.put("errCode", "2");
					messageMap.put("errMsg", "암호 변경한지 3개월이 지나 암호 변경 페이지로 이동합니다.");
					
					result.put("message", messageMap);
					return result;
				}
			}
			
			Map returnMap = new HashMap();

			if(!"".equals(getUserMap.get("lastLoginIp")) || null != getUserMap.get("lastLoginIp")) {
				returnMap.put("lastLoginIp" , (String)getUserMap.get("lastLoginIp"));
			} else {
				returnMap.put("lastLoginIp" , "-");
			}
			
			if(!"".equals(getUserMap.get("lastLogDtm")) || null != getUserMap.get("lastLogDtm")) {
				returnMap.put("lastLogDtm"  , (String)getUserMap.get("lastLogDtm"));
			} else {
				returnMap.put("lastLogDtm"  , "-");	
			}
			
			this.processLoginLog(loginId, jobFgCd, ip, succYn);

			List<Map> useNowLog = this.getRecentSysLoginLog(param);
			Map useNowLogMap = null;
			
			if(useNowLog.size() > 0) {
				useNowLogMap = useNowLog.get(0);
				
				returnMap.put("nowLoginIp" 	, useNowLogMap.get("ip"));
				returnMap.put("nowLogDtm"  	, useNowLogMap.get("jobDtm"));
			} else {
				returnMap.put("nowLoginIp" 	, "-");
				returnMap.put("nowLogDtm"  	, "-");				
			}

			Map userInfo = getUserInfo(param);
			returnMap.put("userNm"  	 , userInfo.get("userNm"));
			returnMap.put("encPassword"  , userInfo.get("hiddenEncPassword"));
			returnMap.put("userGroupCd"  , userInfo.get("userGroupCd"));
			returnMap.put("linkNm"       , userInfo.get("linkNm"));
			returnMap.put("wffcltyCd"    , userInfo.get("wffcltyCd"));

			result.put("message" , messageMap);
			result.put("data"    , returnMap);
			result.put("success" , "Y");
			
		} catch(Exception e) {
			LOGGER.error(e.getMessage());
		} finally{}

    	return result;
    }

	/**
  	 * 로그아웃 처리
  	 * @param
  	 * @exception Exception
  	 */
    @Override
	@SuppressWarnings({ "rawtypes" })
  	public void processLogOut(String clientIp) throws Exception{

		Map userInfo = (Map) SessionUtil.getRequestAttributes("KSSM.user");

		String loginId  = (String)userInfo.get("userId");
		String jobFgCd  = "2"; // 1 : 로그인 , 2 : 로그아웃
		String succYn   = "Y"; // 성공 : Y, 실패 : N

		this.processLoginLog(loginId, jobFgCd, clientIp, succYn);
    }
    
    
    /**
  	 * 패스워드 변경
  	 * @param
  	 * @exception Exception
  	 */
    @Override
    public EgovMap chageMemberPwd(EgovMap param){
    	
    	EgovMap returnMap = new EgovMap();

    	try {
			String chgPwd  = (String)param.get("pwd");
			String newPwd  = commonLoginDAO.getNewPwd(chgPwd);
			param.put("pwd", newPwd);
			commonLoginDAO.updatePassword(param);
				
			returnMap.put("rtnCode", "0");
			returnMap.put("message", "정상적으로 저장 되었습니다");
				
			
		} catch (BadSqlGrammarException e) {
			returnMap.put("rtnCode", "-1");
			returnMap.put("message", "저장에 실패하였습니다.");
		}
		 
		 return returnMap;
    }
    

	/**
  	 * Sha256Encoder
  	 * @param
  	 * @return  Sha256Encoder 값
  	 * @exception Exception
  	 */
    @Override
	public String getSha256Encrypt(String base) throws RuntimeException{

    	String rtnVal = "";
    	try{
        	MessageDigest digest = MessageDigest.getInstance("SHA-256");
        	String salt = GritConstants.USER_ENC_SALT;
        	digest.reset();		

        	/**
        	 * todo : 적용후 db 데이터 변경 필요함
        	 */
        	//digest.update(salt.getBytes()); 
        	  
        	byte[] hash = digest.digest(base.getBytes("UTF-8"));
        	StringBuffer hexString = new StringBuffer();
        	for(int i=0; i<hash.length; i++){
        		String hex = Integer.toHexString(0xff & hash[i]);
        		if(hex.length() == 1) hexString.append('0');
        		hexString.append(hex);
        	}
        	rtnVal = hexString.toString();
    	}catch(Exception e){
    		LOGGER.error(e.getMessage());
    	}finally{

    	}
		return rtnVal;
    }

	/**
  	 * 사용자 IP를 리턴한다.
  	 * @param
  	 * @return  사용자 IP를 리턴한다.
  	 * @exception Exception
  	 */
    @Override
	public String getClientIp(HttpServletRequest request){
    	String ip = request.getHeader("X-FORWARDED-FOR");

    	if (ip == null || ip.length() == 0) {
            ip = request.getHeader("Proxy-Client-IP");
        }

        if (ip == null || ip.length() == 0) {
            ip = request.getHeader("WL-Proxy-Client-IP");  // 웹로직
        }

        if (ip == null || ip.length() == 0) {
            ip = request.getRemoteAddr() ;
        }

        return ip;
    }

    /**
	 * 현재 날짜와 특정 날짜 비교하여 3개월이 지났는지 확인
	 * @param param - 조회할 정보가 담긴 param
	 * @return
	 * @exception Exception
	 */
	private boolean checkMonth(String passwordModDd) {
		boolean chkVal = false;

		if(!"".equals(passwordModDd) && null != passwordModDd) {
			Calendar pDate = Calendar.getInstance();
			Calendar tDate = Calendar.getInstance();

			int aDateYear = Integer.parseInt(passwordModDd.substring(0, 4));
			int aDateMonth = Integer.parseInt(passwordModDd.substring(4, 6)) - 1;
			int aDateDay = Integer.parseInt(passwordModDd.substring(6, 8));

			pDate.set(aDateYear, aDateMonth, aDateDay);
		
			pDate.set( Calendar.HOUR_OF_DAY, 0 );
			pDate.set( Calendar.MINUTE, 0 );
			pDate.set( Calendar.SECOND, 0 );
			pDate.set( Calendar.MILLISECOND, 0 );
	
			tDate.set( Calendar.HOUR_OF_DAY, 0 );
			tDate.set( Calendar.MINUTE, 0 );
			tDate.set( Calendar.SECOND, 0 );
			tDate.set( Calendar.MILLISECOND, 0 );
	
			tDate.add(Calendar.MONTH,-3);
			
			if (pDate.after(tDate)) {
				chkVal = true; //3개월이 아직 지나지 않았음
			}
		}		

		return chkVal;
	}


    /**
	 * 사용자 목록을 조회한다.
	 * @param param - 조회할 정보가 담긴 Map
	 * @return 사용자 목록
	 * @exception Exception
	 */
    @SuppressWarnings("rawtypes")
	public Map getUserInfoList(Map param) throws Exception {
    	return commonLoginDAO.selectUserInfo(param);
    }
    
    /**
	 * 사용자 비밀번호 
	 * @param param - Stirng
	 * @return 사용자 비밀번호
	 * @exception Exception
	 */
    @SuppressWarnings("rawtypes")
	public String getUserPassword(String chkPwd) throws Exception {
    	return commonLoginDAO.selectUserPassword(chkPwd);
    }
    
    

    /**
	 * 사용자 암호 오류를 업데이트 한다.
	 * @param param - 조회할 정보가 담긴 Map
	 * @return 사용자 목록
	 * @exception Exception
	 */
    @Override
    @SuppressWarnings("rawtypes")
	public int modifyPwdErrCount(Map param) throws Exception{
    	return commonLoginDAO.updatePwdErrorCount(param);
    }

    /**
	 * 로그인 정보 업데이트 한다.
	 * @param param - 조회할 정보가 담긴 Map
	 * @return int
	 * @exception Exception
	 */
    @Override
    @SuppressWarnings("rawtypes")
	public int modifySysLoginInfo(Map param) throws Exception{
    	return commonLoginDAO.updateSysLoginInfo(param);
    }

	/**
	 * 로그인 이력을 등록한다.
	 * @param param - 추가할 정보가 담긴 Map
	 * @return
	 * @exception Exception
	 */
    @Override
    public void addSysLoginLog(Map param) throws Exception {
    	commonLoginDAO.insertSysLoginLog(param);
    }

    /**
	 * 유저 최근 접속 IP, 시간 조회
	 * @param param - 조회할 정보가 담긴 Map
	 * @return 유저 최근 접속 IP, 시간
	 * @exception Exception
	 */
    @Override
    public List<Map> getRecentSysLoginLog(Map param) throws Exception {
    	return commonLoginDAO.getRecentSysLoginLog(param);
    }

	
    /**
  	 * SESSION용 - 사용자 정보
  	 * @param
  	 * @return  사용자 정보
  	 * @exception Exception
  	 */
    @Override
	@SuppressWarnings("rawtypes")
  	public Map getUserInfo(Map param) throws Exception{
    	return commonLoginDAO.getUserInfo(param);
    }

   
    /**
   	 * SESSION용 사용자 메뉴 권한 리스트
   	 * @param
   	 * @return  사용자 메뉴 권한 리스트
   	 * @exception Exception
   	 */
    @Override
	@SuppressWarnings("rawtypes")
   	public List<Map> selectSysGroupMenu(Map param) throws Exception{
    	return commonLoginDAO.selectSysGroupMenu(param);
    }

    /**
   	 * SESSION용 사용자 메뉴 권한 리스트
   	 * @param
   	 * @return  사용자 메뉴 권한 리스트
   	 * @exception Exception
   	 */
    @Override
	@SuppressWarnings("rawtypes")
	public List<Map> selectSysGroupMenuBtn(Map param) throws Exception {
		return commonLoginDAO.selectSysGroupMenuBtn(param);
	}
    
    /**
   	 * 장애인 현황 리스트
   	 * @param
   	 * @return  장애인 현황 리스트
   	 * @exception Exception
   	 */
    @Override
	@SuppressWarnings("rawtypes")
   	public List<Map> searchDisableStatusList() throws Exception{
    	return commonLoginDAO.searchDisableStatusList();
    }
}
