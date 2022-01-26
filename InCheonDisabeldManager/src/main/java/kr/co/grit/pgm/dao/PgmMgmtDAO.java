package kr.co.grit.pgm.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


@Repository("PgmMgmtDAO")
public class PgmMgmtDAO {
	
	@Resource(name="sqlSessionTemplate")
	private transient SqlSessionTemplate sqlSession;
	
	@SuppressWarnings("rawtypes")
	public List<Map> selectProgramList(Map param) {
		return sqlSession.selectList("PgmMgmtDAO.selectProgramList", param);
	}
	
	@SuppressWarnings("rawtypes")
	public List<Map> searchLclasList(Map param) {
		return sqlSession.selectList("PgmMgmtDAO.searchLclasList", param);
	}
	
	@SuppressWarnings("rawtypes")
	public List<Map> searchMclasList(Map param) {
		return sqlSession.selectList("PgmMgmtDAO.searchMclasList", param);
	}
	
	@SuppressWarnings("rawtypes")
	public List<Map> searchSclasList(Map param) {
		return sqlSession.selectList("PgmMgmtDAO.searchSclasList", param);
	}
	
	@SuppressWarnings("rawtypes")
	public List<Map> insertPgmMgmt(Map param) {
		return sqlSession.selectList("PgmMgmtDAO.insertPgmMgmt", param);
	}
	
	@SuppressWarnings("rawtypes")
	public List<Map> updatePgmMgmt(Map param) {
		return sqlSession.selectList("PgmMgmtDAO.updatePgmMgmt", param);
	}

	@SuppressWarnings("rawtypes")
	public List<Map> selectProgramPictureList(Map param) {
		return sqlSession.selectList("PgmMgmtDAO.selectProgramPictureList", param);
	}
	
	@SuppressWarnings("rawtypes")
	public void insertImg(Map imgList) {
		sqlSession.insert("PgmMgmtDAO.insertImg", imgList);
	}
	
	@SuppressWarnings("rawtypes")
	public void updateImg(Map imgList) {
		sqlSession.update("PgmMgmtDAO.updateImg", imgList);
	}
	
	@SuppressWarnings("rawtypes")
	public void deleteImg(Map imgList) throws Exception {
		sqlSession.delete("PgmMgmtDAO.deleteImg", imgList);
	}
	
	@SuppressWarnings("rawtypes")
	public String selectProgramChaban(String linkCd) {
		return sqlSession.selectOne("PgmMgmtDAO.selectProgramChaban", linkCd);
	}
	
	@SuppressWarnings("rawtypes")
	public int selectProgramUseStatusCnt(Map param) {
		return sqlSession.selectOne("PgmMgmtDAO.selectProgramUseStatusCnt", param);
	}
	
	@SuppressWarnings("rawtypes")
	public void deleteProgramMgmt(Map param) {
		sqlSession.selectOne("PgmMgmtDAO.deleteProgramMgmt", param);
	}
	
	@SuppressWarnings("rawtypes")
	public void deleteProgramPic(Map param) {
		sqlSession.selectOne("PgmMgmtDAO.deleteProgramPic", param);
	}
}
