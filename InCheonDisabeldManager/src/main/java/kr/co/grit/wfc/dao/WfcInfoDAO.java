package kr.co.grit.wfc.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

/**
 * 
 * @author PKH
 *
 */
@Repository("WfcInfoDAO")
public class WfcInfoDAO {

	/**
	 * resource 선언
	 */
	@Resource(name="sqlSessionTemplate")
	private transient SqlSessionTemplate sqlSession;
	
	/**
	 * constructor
	 */
	public WfcInfoDAO() {
		//constructor
		//unnecessaryconstructor : 생성자 없는 경우보다 pmd rule 에 검출 건수가 적음. 제외 권장
	}
	
	/**
	 * 복지시설 조회
	 * @param param
	 * @return
	 */
	public List<Map> selectWfcInfo(final Map param) {
		return sqlSession.selectList("WfcInfoDAO.selectWfcInfo", param);
	}
	
	/**
	 * 서비스 장애 조회
	 * @param param
	 * @return
	 */
	public List<Map> selectWfcInfoDis(final Map param) {
		return sqlSession.selectList("WfcInfoDAO.selectWfcInfoDis", param);
	}
}
