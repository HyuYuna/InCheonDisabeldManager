package kr.co.grit.wfc.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


@Repository("WfcSpclRecordListVwDAO")
public class WfcSpclRecordListVwDAO {
	
	@Resource(name="sqlSessionTemplate")
	private transient SqlSessionTemplate sqlSession;
	
	//조회
	@SuppressWarnings("rawtypes")
	public List<Map> selectWfcSpclRecordListVw(Map param) throws Exception {
		return sqlSession.selectList("WfcSpclRecordListVwDAO.selectWfcSpclRecord", param);
	}
	
	@SuppressWarnings("rawtypes")
	public List<Map> selectTypeBehavior(Map param) throws Exception {
		return sqlSession.selectList("WfcSpclRecordListVwDAO.selectTypeBehavior", param);
	}
	
	//이용장애인 조회조건 ajax
	@SuppressWarnings("rawtypes")
	public List<Map> selectAjaxDspsnList(Map param) throws Exception {
		return sqlSession.selectList("WfcSpclRecordListVwDAO.selectAjaxDspsnList", param);
	}
} 
 