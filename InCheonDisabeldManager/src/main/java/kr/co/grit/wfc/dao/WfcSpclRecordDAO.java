package kr.co.grit.wfc.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


@Repository("WfcSpclRecordDAO")
public class WfcSpclRecordDAO {
	
	@Resource(name="sqlSessionTemplate")
	private transient SqlSessionTemplate sqlSession;
	
	//조회
	@SuppressWarnings("rawtypes")
	public List<Map> selectWfcSpclRecord(Map param) throws Exception {
		return sqlSession.selectList("WfcSpclRecordDAO.selectWfcSpclRecord", param);
	}
	
	@SuppressWarnings("rawtypes")
	public List<Map> selectTypeBehavior(Map param) throws Exception {
		return sqlSession.selectList("WfcSpclRecordDAO.selectTypeBehavior", param);
	}
	
	//입력
	@SuppressWarnings("rawtypes")
	public void insertWfcSpclRecord(Map param) throws Exception {
		sqlSession.insert("WfcSpclRecordDAO.insertWfcSpclRecord", param);
	}
	//수정
	@SuppressWarnings("rawtypes")
	public void updateWfcSpclRecord(Map param) throws Exception {
		sqlSession.insert("WfcSpclRecordDAO.updateWfcSpclRecord", param);
	}
	
	//이용장애인 조회조건 ajax
	@SuppressWarnings("rawtypes")
	public List<Map> selectAjaxDspsnList(Map param) throws Exception {
		return sqlSession.selectList("WfcEnextMgmtDAO.selectAjaxDspsnList", param);
	}
	
	//장애인 입력란 Ajax
	@SuppressWarnings("rawtypes")
	public List<Map> selectSpcDspsnId(Map param) throws Exception {
		return sqlSession.selectList("WfcSpclRecordDAO.selectSpcDspsnId", param);
	}
} 
 