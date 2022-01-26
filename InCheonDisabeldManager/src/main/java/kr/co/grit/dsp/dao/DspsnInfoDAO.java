package kr.co.grit.dsp.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 
 * @author PKH
 */
@Repository("DspsnInfoDAO")
public class DspsnInfoDAO {
	
	/**
	 * resource 선언
	 */
	@Resource(name="sqlSessionTemplate")
	private transient SqlSessionTemplate sqlSession;
	
	/**
	 * constructor
	 */
	public DspsnInfoDAO() {
		//constructor
		//unnecessaryconstructor : 생성자 없는 경우보다 pmd rule 에 검출 건수가 적음. 제외 권장
	}
	
	/**
	 * 장애인 조회 실행
	 * @param param
	 * @return
	 */
	public List<Map> selectDspsnInfo(final EgovMap param) {
		return sqlSession.selectList("selectDspsnInfo",param);
	}

}
