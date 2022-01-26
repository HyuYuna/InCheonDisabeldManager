package kr.co.grit.bas.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 
 * @author JJS
 */
@Repository("BasSysInfoMgmtDAO")
public class BasSysInfoMgmtDAO {
	
	/**
	 * resource 선언
	 */
	@Resource(name="sqlSessionTemplate")
	private transient SqlSessionTemplate sqlSession;
	
	/**
	 * 사용자 조회
	 * @param param
	 * @return
	 */
	public List<EgovMap> selectUserList(EgovMap param){
		return sqlSession.selectList("BasSysInfoMgmtDAO.selectUserList", param);
	}
	
	/**
	 * 사용자 신규
	 * @param param
	 * @return
	 */
	public void insertSysInfo(EgovMap param){
		sqlSession.insert("BasSysInfoMgmtDAO.insertSysInfo", param);
	}
	
	/**
	 * 사용자 수정
	 * @param param
	 * @return
	 */
	public void updateSysInfo(EgovMap param){
		sqlSession.update("BasSysInfoMgmtDAO.updateSysInfo", param);
	}
	
	/**
	 * 기존비밀번호
	 * @param param
	 * @return
	 */
	public String getOldPwd(String oldPwd){
		return sqlSession.selectOne("BasSysInfoMgmtDAO.getOldPwd", oldPwd);
	}
	
	/**
	 * 새로운 비밀번호
	 * @param param
	 * @return
	 */
	public String getNewPwd(String chgPwd){
		return sqlSession.selectOne("BasSysInfoMgmtDAO.getNewPwd", chgPwd);
	}
	
	/**
	 * 비밀번호변경
	 * @param param
	 * @return
	 */
	public void updateSysPassword(EgovMap param){
		sqlSession.update("BasSysInfoMgmtDAO.updateSysPassword", param);
	}
	
	/**
	 * 비밀번호 초기화
	 * @param param
	 * @return
	 */
	public void resetPassword(EgovMap param){
		sqlSession.update("BasSysInfoMgmtDAO.resetPassword",param);
	}

	/**
	 * 복지시설코드 조회
	 * @param param
	 * @return
	 */
	public List<EgovMap> searchWffcltyList(EgovMap param){
		return sqlSession.selectList("BasSysInfoMgmtDAO.selectWffcltyList", param);
	}
	
	/**
	 * 운영단체코드 조회
	 * @param param
	 * @return
	 */
	public List<EgovMap> searchOgnztList(EgovMap param){
		return sqlSession.selectList("BasSysInfoMgmtDAO.selectOgnztList", param);
	}
}
