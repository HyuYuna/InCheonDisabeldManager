package kr.co.grit.pgm.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("PgmOpStsDAO")
public class PgmOpStsDAO {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	public List<EgovMap> selectPgmOpStsReg(EgovMap param) throws Exception {
		return sqlSession.selectList("selectPgmOpStsReg",param);
	}
	
	public int selectPgmOpStsDuplCnt(String whereStr) throws Exception {
		return sqlSession.selectOne("selectPgmOpStsDuplCnt",whereStr);
	}
	
	public int insertPgmOpSts(HashMap<String, Object> map) throws Exception {
		return sqlSession.update("insertPgmOpSts",map);
	}
	
	public int updatePgmOpSts(HashMap<String, Object> map) throws Exception {
		return sqlSession.update("updatePgmOpSts",map);
	}
	
	public int deletePgmOpSts(HashMap<String, Object> map) throws Exception {
		return sqlSession.update("deletePgmOpSts",map);
	}

	public List<EgovMap> selectWffcltyListD(EgovMap param) throws Exception {
		return sqlSession.selectList("selectWffcltyListD",param);
	}
	
	public List<EgovMap> selectPgmOpStsSch(EgovMap param) throws Exception {
		return sqlSession.selectList("selectPgmOpStsSch",param);
	}
	
	public List<EgovMap> selectPgmOpStsChart(EgovMap param) throws Exception {
		return sqlSession.selectList("selectPgmOpStsChart",param);
	}
}
