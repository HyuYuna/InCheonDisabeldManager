package kr.co.grit.common.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import kr.co.grit.common.constants.GritConstants;
import kr.co.grit.common.util.Crypto;

@Repository("commonLoginDAO")
public class CommonLoginDAO {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

    /**
	 * 사용자 정보를 조회한다.
	 * @param param - 조회할 정보가 담긴 Map
	 * @return 사용자 정보 목록
	 * @exception Exception
	 */
    @SuppressWarnings("rawtypes")
	public Map selectUserInfo(Map param) throws Exception {
    	return sqlSession.selectOne("commonLoginDAO.selectUserInfo", param);
    }
    
    
    /**
	 * 로그인 비밀번호 오류 횟수를 수정한다.
	 * @param param - 조회할 정보가 담긴 Map
	 * @return int
	 * @exception Exception
	 */
	@SuppressWarnings( "rawtypes" )
	public String selectUserPassword(String chkPwd) {
		return sqlSession.selectOne("commonLoginDAO.selectUserPassword", chkPwd);
	}
    
    
	/**
	 * 로그인 비밀번호 오류 횟수를 수정한다.
	 * @param param - 조회할 정보가 담긴 Map
	 * @return int
	 * @exception Exception
	 */
	@SuppressWarnings( "rawtypes" )
	public int updatePwdErrorCount(Map param) {
		return sqlSession.update("commonLoginDAO.updatePwdErrCnt", param);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List<Map> readStoreList(Map param) throws Exception {
	    return sqlSession.selectList("commonLoginDAO.selectStoreList", param);
	}

	/**
	 * 로그인 정보 업데이트 한다.
	 * @param param - 조회할 정보가 담긴 Map
	 * @return int
	 * @exception Exception
	 */
	@SuppressWarnings( "rawtypes" )
	public int updateSysLoginInfo(Map param) {
		return sqlSession.update("commonLoginDAO.updateSysLoginInfo", param);
	}

	/**
	 * 로그인 이력을 등록한다.
	 * @param param - 추가할 정보가 담긴 Map
	 * @return
	 * @exception Exception
	 */
    public void insertSysLoginLog(Map param) throws Exception {
    	sqlSession.insert("commonLoginDAO.insertSysLoginLog", param);
    }

    /**
	 * 유저 최근 접속 IP, 시간 조회
	 * @param param - 조회할 정보가 담긴 Map
	 * @return 유저 최근 접속 IP, 시간
	 * @exception Exception
	 */
    @SuppressWarnings("rawtypes")
	public List<Map> getRecentSysLoginLog(Map param) throws Exception {
        return sqlSession.selectList("commonLoginDAO.selectRecentSysLoginLog", param);
    }

   
    /**
	 * SESSION용 - 사용자 정보
	 * @param
	 * @return  사용자 정보
	 * @exception Exception
	 */
    @SuppressWarnings("rawtypes")
	public Map getUserInfo(Map param) throws Exception {
        return sqlSession.selectOne("commonLoginDAO.getUserInfo", param);
    }

    /**
	 * 장애인 현황 리스트
	 * @param
	 * @return  사용자 공항 권한 리스트
	 * @exception Exception
	 */
    @SuppressWarnings("rawtypes")
	public List<Map> searchDisableStatusList() throws Exception {
        return sqlSession.selectList("commonLoginDAO.searchDisableStatusList");
    }

    /**
   	 * SESSION용 사용자 메뉴 권한 리스트
   	 * @param
   	 * @return  사용자 메뉴 권한 리스트
   	 * @exception Exception
   	 */
    @SuppressWarnings("rawtypes")
   	public List<Map> selectSysGroupMenu(Map param) throws Exception {
    	return sqlSession.selectList("commonLoginDAO.selectSysGroupMenu", param);
    }

    /**
   	 * SESSION용 사용자 메뉴 버튼 권한 리스트
   	 * @param
   	 * @return  사용자 메뉴 버튼 권한 리스트
   	 * @exception Exception
   	 */
    @SuppressWarnings("rawtypes")
   	public List<Map> selectSysGroupMenuBtn(Map param) throws Exception {
    	return sqlSession.selectList("commonLoginDAO.selectSysGroupMenuBtn", param);
    }
    
    
    /**
	 * 새로운 비밀번호
	 * @param param
	 * @return
	 */
	public String getNewPwd(String chgPwd){
		return sqlSession.selectOne("commonLoginDAO.getNewPwd", chgPwd);
	}
	
	
	/**
   	 * 초기 비밀번호 변경
   	 * @param
   	 * @return  초기 비밀번호 변경
   	 * @exception Exception
   	 */
    public void updatePassword(EgovMap param) {
    	sqlSession.update("commonLoginDAO.updatePassword", param);
    }
}
