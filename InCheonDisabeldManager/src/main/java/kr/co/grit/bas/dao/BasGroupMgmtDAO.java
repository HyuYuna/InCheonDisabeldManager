package kr.co.grit.bas.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

/**
 * 
 * @author SYW
 */
@SuppressWarnings("rawtypes")
@Repository("BasGroupMgmtDAO")
public class BasGroupMgmtDAO {

	/**
	 * @sqlSession
	 */
	@Resource(name="sqlSessionTemplate")
	private transient SqlSessionTemplate sqlSession;
	
	/**
	 * 단체관리 리스트 조회
	 * @param param
	 * @return
	 */
	
	public List<Map> selectGroupList(Map param) {
		return sqlSession.selectList("BasGroupMgmtDAO.selectGroupList", param);
	}
	
	
	/**
	 * 단체관리 신규 입력
	 * @param param
	 * @return
	 */
	public void insertGroupInfo(Map param) {
		sqlSession.insert("BasGroupMgmtDAO.insertGroupInfo", param);
	}
	
	/**
	 * 단체관리 수정 입력
	 * @param param
	 * @return
	 */
	public void updateGroupInfo(Map param) {
		sqlSession.insert("BasGroupMgmtDAO.updateGroupInfo", param);
	}
	
	/**
	 * 허가번호 체크
	 * @param param
	 * @return
	 */
	public int encCheck(Map param) {
		return sqlSession.selectOne("BasGroupMgmtDAO.encChk", param);
	}
	
	/**
	 * 단체관리 삭제
	 * @param param
	 * @return 
	 * @return 
	 * @return
	 */
	public void deleteBasGroup(Map param) {
		sqlSession.delete("BasGroupMgmtDAO.deleteBasGroup", param);
	}
	
	/**
	 * 복지시설 기초관리 카운트
	 * @param param
	 * @return 
	 * @return 
	 * @return
	 */
	public int selectWffcltyBaseOgnztCd(Map param) {
		return sqlSession.selectOne("BasGroupMgmtDAO.selectWffcltyBaseOgnztCd", param);
	}
}
