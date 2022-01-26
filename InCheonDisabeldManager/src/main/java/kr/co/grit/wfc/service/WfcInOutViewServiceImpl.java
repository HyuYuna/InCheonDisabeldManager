package kr.co.grit.wfc.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import kr.co.grit.wfc.dao.WfcInOutViewDAO;

import org.springframework.stereotype.Service;

@Service("WfcInOutViewService")
public class WfcInOutViewServiceImpl implements WfcInOutViewService{

	@Resource
	private transient WfcInOutViewDAO wfcInOutViewDAO;

	@Override
	public List<Map> selectInOutViewList(Map param) throws Exception {
		// TODO Auto-generated method stub
		return wfcInOutViewDAO.selectWfcEnextMgmtList(param);
	}
	
	@Override
	public List<Map> selectWffcltyCodeAB(Map param) throws Exception {
		// TODO Auto-generated method stub
		return wfcInOutViewDAO.selectWffcltyCodeAB(param);
	}
	
	@Override
	public List<Map> selectWffcltyCodeC(Map param) throws Exception {
		// TODO Auto-generated method stub
		return wfcInOutViewDAO.selectWffcltyCodeC(param);
	}

	@Override
	public List<Map> selectGroupCodeD(Map param) throws Exception {
		// TODO Auto-generated method stub
		return wfcInOutViewDAO.selectGroupCodeD(param);
	}

	
	


	
	
	/*@Override
	public List<Map> selectAjaxDspsn(Map param) throws Exception {
		// TODO Auto-generated method stub
		return wfcEnextMgmtDAO.selectAjaxDspsnList(param);
	}

	@Override
	public Map selectFcltyList(String link) throws Exception {
		// TODO Auto-generated method stub
		return wfcEnextMgmtDAO.selectFcltyList(link);
	}

	*/
	
}
