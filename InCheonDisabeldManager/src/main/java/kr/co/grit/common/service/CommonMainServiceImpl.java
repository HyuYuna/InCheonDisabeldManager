package kr.co.grit.common.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.grit.common.dao.CommonLoginDAO;
import kr.co.grit.common.dao.CommonMainDAO;

/**
 * @Class Name : CommonMainServiceImpl.java
 * @Description : CommonMain Business Implement class
 * @Modification Information
 *
 * @author name
 * @since 2016.11.01
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Service("commonMainService")
@Transactional
public class CommonMainServiceImpl implements CommonMainService {

	
    @Resource(name="commonMainDAO")
    private CommonMainDAO commonMainDAO;
    
    @Resource(name="commonLoginDAO")
    private CommonLoginDAO commonLoginDAO;
    
    /**
	 *  권한에 따른 메뉴 리스트
	 * @param 조회할 정보가 담긴 Map
	 * @return  메뉴 리스트
	 * @exception Exception
	 */
    @Override
    @SuppressWarnings("rawtypes")
	public List<Map> getUserMenuList(Map param) throws Exception {
    	return commonMainDAO.selectUserMenuList(param);
    }
    
	/**
	 * 메뉴 작업 로그 등록
	 * @param param - 등록할 정보가 담긴 Map
	 * @return
	 * @exception Exception
	 */
    @Override
    public void addUserMenuLog(Map param) throws Exception {
    	commonMainDAO.addUserMenuLog(param);
    }

    /**
	 *  데이터 조회
	 * @param 처리할 정보가 담긴 Map
	 * @return  데이터 리스트
	 * @exception Exception
	 */
    @Override
	@SuppressWarnings("rawtypes")
    public List<Map> getDataList(Map param) throws Exception{
    	return commonMainDAO.getDataList(param);
    }
    
	/**
	 * 데이터 등록
	 * @param param - 처리할 정보가 담긴 Map
	 * @return
	 * @exception Exception
	 */
    @Override
	public void addDataInfo(Map param) throws Exception{
    	commonMainDAO.insertDataInfo(param);
    }
    
	/**
	 * 데이터 수정
	 * @param param - 처리할 정보가 담긴 Map
	 * @return 수정 건수
	 * @exception Exception
	 */
    @Override
	public int modifyDataInfo(Map param) throws Exception{
    	return commonMainDAO.updateDataInfo(param);
    }
    
	/**
	 * 데이터 삭제
	 * @param param - 처리할 정보가 담긴 Map
	 * @return 삭제 건수
	 * @exception Exception
	 */
    @Override
	public int deleteDataInfo(Map param) throws Exception{
    	return commonMainDAO.deleteDataInfo(param);
    }
    
	/**
	 * 데이터 프로시져 실행
	 * @param param - 처리할 정보가 담긴 Map
	 * @return 결과값
	 * @exception Exception
	 */
	@Override
	public Map<String, String> callDataInfo(Map param) throws Exception{
    	return commonMainDAO.callDataInfo(param);
    }
	
	/**
	 * 메인화면 유저정보
	 * @param param - 처리할 정보가 담긴 Map
	 * @return 결과값
	 * @exception Exception
	 */
	 @Override
	 @SuppressWarnings({ "rawtypes", "unchecked" })
	public Map mainUserInfo(Map param) throws Exception{
		
		Map returnMap = new HashMap();
		
		List<Map> useNowLog = commonLoginDAO.getRecentSysLoginLog(param);
		Map useNowLogMap = null;
		
		if(useNowLog.size() > 0) {
			useNowLogMap = useNowLog.get(0);
			
			returnMap.put("nowLoginIp" 	, useNowLogMap.get("ip"));
			returnMap.put("nowLogDtm"  	, useNowLogMap.get("jobDtm"));
		} else {
			returnMap.put("nowLoginIp" 	, "-");
			returnMap.put("nowLogDtm"  	, "-");				
		}
		   
		returnMap.put("userNm"  	 , param.get("userNm"));
		returnMap.put("encPassword"  , param.get("hiddenEncPassword"));
		returnMap.put("userGroupCd"  , param.get("userGroupCd"));
		returnMap.put("linkNm"       , param.get("linkNm"));
		returnMap.put("wffcltyCd"    , param.get("wffcltyCd"));
		
		return returnMap;
		
    }

}