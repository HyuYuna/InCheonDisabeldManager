package kr.co.grit.common.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

/**
 * @Class Name : CommonHomeDAO.java
 * @Description : CommonHome DAO Class
 * @Modification Information
 *
 */

@Repository("commonHomeDAO")
public class CommonHomeDAO {
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	/**
	 * 홈 공지사항 목록 조회
	 * @param param - 조회할 정보가 담긴 param
	 * @return 홈 공지사항 목록
	 * @exception Exception
	 */
    @SuppressWarnings("rawtypes")
	public List<Map> selectHomeNoticeList(Map param) throws Exception {
        return sqlSession.selectList("commonHomeDAO.selectHomeNoticeList", param);
    }
    
	/**
	 * 홈 자료실 목록 조회
	 * @param param - 조회할 정보가 담긴 param
	 * @return 홈 자료실 목록
	 * @exception Exception
	 */
    @SuppressWarnings("rawtypes")
	public List<Map> selectHomeReferList(Map param) throws Exception {
        return sqlSession.selectList("commonHomeDAO.selectHomeReferList", param);
    }
    
   
}
