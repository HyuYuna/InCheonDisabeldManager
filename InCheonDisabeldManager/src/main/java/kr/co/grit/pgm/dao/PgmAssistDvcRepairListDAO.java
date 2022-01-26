package kr.co.grit.pgm.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 
 * @author JJS
 */
@Repository("PgmAssistDvcRepairListDAO")
public class PgmAssistDvcRepairListDAO {
	
	
	/**
	 * resource 선언
	 */
	@Resource(name="sqlSessionTemplate")
	private transient SqlSessionTemplate sqlSession;
	
	public List<EgovMap> selectAssDcvRepairList(EgovMap param) {
		return sqlSession.selectList("PgmAssistDvcRepairListDAO.selectAssDcvRepairList", param);
	}
	
	public List<EgovMap> searchAssDcvDspsn(EgovMap param) {
		return sqlSession.selectList("PgmAssistDvcRepairListDAO.searchAssDcvDspsn", param);
	}
	
	public List<EgovMap> searcAssDvcRepWffcltyList() {
		return sqlSession.selectList("PgmAssistDvcRepairListDAO.searcAssDvcRepWffcltyList");
	}
	
	@SuppressWarnings("rawtypes")
	public List<EgovMap> searcAssDvcRepWffcltyList2(EgovMap param) {
		return sqlSession.selectList("PgmAssistDvcRepairListDAO.searcAssDvcRepWffcltyList2", param);
	}
	
}
