package kr.co.grit.common.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

/**
 * @Class Name : CommonMaineDAO.java
 * @Description : CommonMain DAO Class
 * @Modification Information
 */

@Repository("commonMainDAO")
public class CommonMainDAO {
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
    /**
	 *  권한에 따른 메뉴 리스트
	 * @param 조회할 정보가 담긴 Map
	 * @return  메뉴 리스트
	 * @exception Exception
	 */
    @SuppressWarnings("rawtypes")
	public List<Map> selectUserMenuList(Map param) throws Exception {
        return sqlSession.selectList("commonMainDAO.selectUserMenuList", param);
    }
    
	/**
	 * 메뉴 작업 로그 등록
	 * @param param - 등록할 정보가 담긴 Map
	 * @return
	 * @exception Exception
	 */
    public void addUserMenuLog(Map param) throws Exception {
    	sqlSession.insert("commonMainDAO.insertUserMenuLog", param);
    }

	/**
	 * 메뉴 작업 로그 등록
	 * @param param - 등록할 정보가 담긴 Map
	 * @return
	 * @exception Exception
	 */
    public void deleteLogInsert(Map param){
    	sqlSession.insert("commonMainDAO.deleteLogInsert", param);
    }
    
    /**
	 *  데이터 조회
	 * @param 처리할 정보가 담긴 Map
	 * @return  데이터 리스트
	 * @exception Exception
	 */
    @SuppressWarnings("rawtypes")
    public List<Map> getDataList(Map param) throws Exception{
        return sqlSession.selectList("commonProcDAO.select", param);
    }
    
	/**
	 * 데이터 등록
	 * @param param - 처리할 정보가 담긴 Map
	 * @return
	 * @exception Exception
	 */
    public void insertDataInfo(Map param) throws Exception{
    	sqlSession.insert("commonProcDAO.insert", param);
    }
    
	/**
	 * 데이터 수정
	 * @param param - 처리할 정보가 담긴 Map
	 * @return 수정 건수
	 * @exception Exception
	 */
    public int updateDataInfo(Map param) throws Exception{
    	return sqlSession.update("commonProcDAO.update", param);
    }
    
	/**
	 * 데이터 삭제
	 * @param param - 처리할 정보가 담긴 Map
	 * @return 삭제 건수
	 * @exception Exception
	 */
    public int deleteDataInfo(Map param) throws Exception{
    	return sqlSession.delete("commonProcDAO.delete", param);
    }
    
	/**
	 * 데이터 프로시져 실행
	 * @param param - 처리할 정보가 담긴 Map
	 * @return 결과값
	 * @exception Exception
	 */
	public Map<String, String> callDataInfo(Map param) throws Exception{
    	return sqlSession.selectOne("commonProcDAO.procedure", param);
    }
	
}
