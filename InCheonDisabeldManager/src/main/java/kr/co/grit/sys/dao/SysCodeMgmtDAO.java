package kr.co.grit.sys.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 
 * @author PKH
 *
 */

@Repository("sysCodeMgmtDAO")
public class SysCodeMgmtDAO {

	/**
	 * resource 선언
	 */
	@Resource(name="sqlSessionTemplate")
	private transient SqlSessionTemplate sqlSession;

	/**
	 * constructor
	 */
	public SysCodeMgmtDAO() {
		//constructor
		//unnecessaryconstructor : 생성자 없는 경우보다 pmd rule 에 검출 건수가 적음. 제외 권장
	}
	
	/**
	 * 공통코드 조회
	 * @param param
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List<EgovMap> selectSysCodeMgmt(final EgovMap param) {
		return sqlSession.selectList("sysCodeMgmtDAO.selectSysCodeMgmt",param);
	}
	
	/**
	 * 공통코드 저장
	 * @param param
	 * @return
	 */
	public int saveSysCodeMgmt(final EgovMap param) {
		return sqlSession.update("sysCodeMgmtDAO.saveSysCodeMgmt",param);
	}
	
 
}
