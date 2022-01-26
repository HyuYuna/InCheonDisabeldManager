package kr.co.grit.wfc.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


@Repository("WfcEnextMgmtDAO")
public class WfcEnextMgmtDAO {
	
	@Resource(name="sqlSessionTemplate")
	private transient SqlSessionTemplate sqlSession;
	
	@SuppressWarnings("rawtypes")
	public List<Map> selectWfcEnextMgmtList(Map param) throws Exception {
		return sqlSession.selectList("WfcEnextMgmtDAO.selectWfcEnextMgmtList", param);
	}
	
	@SuppressWarnings("rawtypes")
	public List<Map> insertWfcEnextMgmt(Map param) throws Exception {
		return sqlSession.selectList("WfcEnextMgmtDAO.insertEnextMgmt", param);
	}
	// update A
	@SuppressWarnings("rawtypes")
	public List<Map> updateWfcEnextMgmtA(Map param) throws Exception {
		return sqlSession.selectList("WfcEnextMgmtDAO.updateEnextMgmtA", param);
	}
	// update B
	@SuppressWarnings("rawtypes")
	public List<Map> updateWfcEnextMgmtB(Map param) throws Exception {
		return sqlSession.selectList("WfcEnextMgmtDAO.updateEnextMgmtB", param);
	}
	// update C
	@SuppressWarnings("rawtypes")
	public List<Map> updateWfcEnextMgmtC(Map param) throws Exception {
		return sqlSession.selectList("WfcEnextMgmtDAO.updateEnextMgmtC", param);
	}
	
	//이용장애인 ajax 검색조회
	@SuppressWarnings("rawtypes")
	public List<Map> selectAjaxDspsnList(Map param) throws Exception {
		return sqlSession.selectList("WfcEnextMgmtDAO.selectAjaxDspsnList", param);
	}
	
	@SuppressWarnings("rawtypes")
	public Map selectFcltyList(String link) throws Exception {
		return sqlSession.selectOne("WfcEnextMgmtDAO.selectFcltyList", link);
	}
	
	@SuppressWarnings("rawtypes")
	public String selectGroupType(String link) throws Exception {
		return sqlSession.selectOne("WfcEnextMgmtDAO.selectGroupType", link);
	}
	@SuppressWarnings("rawtypes")
	public List<Map> selectCheckDspsn(Map param) throws Exception {
		return sqlSession.selectList("WfcEnextMgmtDAO.selectCheckDspsn", param);
	}
	
	@SuppressWarnings("rawtypes")
	public void quickSaveDspsn(Map param) throws Exception {
		sqlSession.insert("WfcEnextMgmtDAO.quickSaveDspsn", param);
	}
	@SuppressWarnings("rawtypes")
	public String saveLvHsCheck(Map param) throws Exception {
		return sqlSession.selectOne("WfcEnextMgmtDAO.saveLvHsCheck", param);
	}
	
	@SuppressWarnings("rawtypes")
	public String insertCnstr(Map param) throws Exception {
		return sqlSession.selectOne("WfcEnextMgmtDAO.insertCnstr", param);
	}
	
	@SuppressWarnings("rawtypes")
	public int insertCmprs(Map param) throws Exception {
		return sqlSession.selectOne("WfcEnextMgmtDAO.insertCmprs", param);
	}
	
	@SuppressWarnings("rawtypes")
	public int admCmp(Map param) throws Exception {
		return sqlSession.selectOne("WfcEnextMgmtDAO.admCmp", param);
	}
	
	@SuppressWarnings("rawtypes")
	public int blindHandling(Map param) throws Exception {
		return sqlSession.selectOne("WfcEnextMgmtDAO.blindHandling", param);
	}
	
}
