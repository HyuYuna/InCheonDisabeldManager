package kr.co.grit.wfc.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import kr.co.grit.wfc.dao.WfcSpclRecordListVwDAO;

import org.springframework.stereotype.Service;

@Service("WfcSpclRecordListVwService")
public class WfcSpclRecordListVwServiceImpl implements WfcSpclRecordListVwService{

	@Resource(name="WfcSpclRecordListVwDAO")
	private transient WfcSpclRecordListVwDAO wfcSpclRrdVwDAO;
	
	@Override
	public List<Map> selectWfcSpclRecordListVw(Map param) throws Exception {
		// TODO Auto-generated method stub
		return wfcSpclRrdVwDAO.selectWfcSpclRecordListVw(param);
	}

	@Override
	public List<Map> selectTypeBehavior(Map param) throws Exception {
		// TODO Auto-generated method stub
		return wfcSpclRrdVwDAO.selectTypeBehavior(param);
	}

	@Override
	public List<Map> selectAjaxDspsnList(Map param) throws Exception {
		// TODO Auto-generated method stub
		return wfcSpclRrdVwDAO.selectAjaxDspsnList(param);
	}
}
