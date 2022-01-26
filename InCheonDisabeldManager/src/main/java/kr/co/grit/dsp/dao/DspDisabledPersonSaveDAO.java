package kr.co.grit.dsp.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 
 * @author JJS
 */
@Repository("DspDisabledPersonSaveDAO")
public class DspDisabledPersonSaveDAO {
	
	/**
	 * resource 선언
	 */
	@Resource(name="sqlSessionTemplate")
	private transient SqlSessionTemplate sqlSession;
	
	
	/**
	 * 이용장애인 조회
	 * @param param
	 * @return
	 */
	public List<EgovMap> selectDisablePersonList(EgovMap param) {
		return sqlSession.selectList("DspDisabledPersonSaveDAO.selectDisablePersonList", param);
	}
	
	/**
	 * 이용장애인 저장
	 * @param param
	 * @return
	 */
	public void insertDisablePersonInfo(Map param){
		sqlSession.insert("DspDisabledPersonSaveDAO.insertDisablePersonInfo", param);
	}
	
	/**
	 * 이용장애인 장애정보 저장
	 * @param param
	 * @return
	 */
	public void insertDspsnDisablity(Map param){
		sqlSession.insert("DspDisabledPersonSaveDAO.insertDspsnDisablity", param);
	}
	
	/**
	 * 이용장애인 건강상태 저장
	 * @param param
	 * @return
	 */
	public void insertDspsnHealth(Map param){
		sqlSession.insert("DspDisabledPersonSaveDAO.insertDspsnHealth", param);
	}
	
	/**
	 * 이용장애인 수정
	 * @param param
	 * @return
	 */
	public void updateDisablePersonInfo(Map param) {
		sqlSession.update("DspDisabledPersonSaveDAO.updateDisablePersonInfo", param);
	}
	
	/**
	 * 이용장애인 장애정보 수정
	 * @param param
	 * @return
	 */
	public void updateDspsnDisablity(Map param) {
		sqlSession.update("DspDisabledPersonSaveDAO.updateDspsnDisablity", param);
	}
	
	/**
	 * 이용장애인 건강상태 수정
	 * @param param
	 * @return
	 */
	public void updateDspsnHealth(Map param) {
		sqlSession.update("DspDisabledPersonSaveDAO.updateDspsnHealth", param);
	}
	
	/**
	 * 이용장애인코드 채번
	 * @param param
	 * @return
	 */
	public String selectDspsnId(){
		return sqlSession.selectOne("DspDisabledPersonSaveDAO.selectDspsnId");
	}
	
	
	/**
	 * 생년월일 중복체크
	 * @param param
	 * @return
	 */
	public List<EgovMap> selectencBirthDd(EgovMap param){
		return sqlSession.selectList("DspDisabledPersonSaveDAO.selectencBirthDd", param);
	}
	
	
}
