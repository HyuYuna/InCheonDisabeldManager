package kr.co.grit.wfc.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import kr.co.grit.wfc.dao.WfcAwaiterViewDAO;

import org.springframework.stereotype.Service;

@Service("WfcAwaiterViewService")
public class WfcAwaiterViewServiceImpl implements WfcAwaiterViewService{

	@Resource(name="WfcAwaiterViewDAO")
	private transient WfcAwaiterViewDAO wfcAwaiterViewDAO;
	
	@Override
	public List<Map> selectAwaiterView(Map param) throws Exception {
		// TODO Auto-generated method stub
		return wfcAwaiterViewDAO.selectAwaiterView(param);
	}
}
