package kr.co.grit.emp.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import kr.co.grit.emp.dao.EmpWorkerListVwDAO;

import org.springframework.stereotype.Service;

@Service("EmpWorkerListVwService")
public class EmpWorkerListVwServiceImpl implements EmpWorkerListVwService{

	@Resource(name="EmpWorkerListVwDAO")
	private transient EmpWorkerListVwDAO empWorkerVwDAO;

	@Override
	public List<Map> selectWorkerList(Map param){
		// TODO Auto-generated method stub
		return empWorkerVwDAO.selectWorkerMgmt(param);
	}

	@Override
	public List<Map> selectWorkerHistory(Map param){
		// TODO Auto-generated method stub
		return empWorkerVwDAO.selectWorkerHistory(param);
	}

	@Override
	public List<Map> selectOrgnzCodeD(Map param) {
		// TODO Auto-generated method stub
		return empWorkerVwDAO.selectOrgnzCodeD(param);
	}
	
}
