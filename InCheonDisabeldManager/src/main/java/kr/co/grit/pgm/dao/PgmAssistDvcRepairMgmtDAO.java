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
@Repository("PgmAssistDvcRepairMgmtDAO")
public class PgmAssistDvcRepairMgmtDAO {
	
	/**
	 * resource 선언
	 */
	@Resource(name="sqlSessionTemplate")
	private transient SqlSessionTemplate sqlSession;
	
	public List<EgovMap> selectAssistDcvRepairList(EgovMap param) {
		return sqlSession.selectList("PgmAssistDvcRepairMgmtDAO.selectAssistDcvRepairList", param);
	}
	
	public void insertAssistDvcRepair(EgovMap param) {
		sqlSession.insert("PgmAssistDvcRepairMgmtDAO.insertAssistDvcRepair", param);
	}
	
	public void upadateAssistDvcRepair(EgovMap param) {
		sqlSession.update("PgmAssistDvcRepairMgmtDAO.upadateAssistDvcRepair", param);
	}
	
	public List<EgovMap> searchAssDspsn(EgovMap param) {
		return sqlSession.selectList("PgmAssistDvcRepairMgmtDAO.searchAssDspsn", param);
	}
	
	public List<EgovMap> searchAssDspsn2(EgovMap param) {
		return sqlSession.selectList("PgmAssistDvcRepairMgmtDAO.searchAssDspsn2", param);
	}
	
	public List<EgovMap> selectDspsnCheck(EgovMap param) {
		return sqlSession.selectList("PgmAssistDvcRepairMgmtDAO.selectCheckDspsn", param);
	}
	
	public void saveQuickDspsn(EgovMap param) {
		sqlSession.insert("PgmAssistDvcRepairMgmtDAO.quickSaveDspsn", param);
	}
	
	public int selectSaveCnt(EgovMap param) {
		return sqlSession.selectOne("PgmAssistDvcRepairMgmtDAO.selectSaveCnt", param);
	}
}
