package kr.co.grit.emp.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.annotation.Resource;

import kr.co.grit.common.dao.CommonMainDAO;
import kr.co.grit.emp.dao.EmpWorkerMgmtDAO;

import org.springframework.jdbc.BadSqlGrammarException;
import org.springframework.stereotype.Service;

@Service("EmpWorkerMgmtService")
public class EmpWorkerMgmtServiceImpl implements EmpWorkerMgmtService{ 

	@Resource(name="EmpWorkerMgmtDAO")
	private transient EmpWorkerMgmtDAO empWorkerMgmtDAO;
	
	@Resource(name="commonMainDAO")
	private transient CommonMainDAO commonMainDAO;
	
	@Override
	public List<Map> selectWorkerMgmt(Map param){
		// TODO Auto-generated method stub
		return empWorkerMgmtDAO.selectWorkerMgmt(param);
	}

	@Override
	public Map selectFcltyType(Map param){
		// TODO Auto-generated method stub
		return empWorkerMgmtDAO.selectFcltyType(param);
	}

	@Override
	public List<Map> selectPosition(Map param){
		// TODO Auto-generated method stub
		return empWorkerMgmtDAO.selectPosition(param);
	}

	@Override
	public Map<String, String> saveWorkerMgmt(Map param){
		Map<String, String> returnMap = new ConcurrentHashMap<String, String>();
		
		String saveMode = (String)param.get("saveMode");
		
		try {
			if("I".equals(saveMode)){
				empWorkerMgmtDAO.insertWorkerMgmt(param);
			}else if("U".equals(saveMode)){
				empWorkerMgmtDAO.updateWorkerMgmt(param);
			}
			
			
			returnMap.put("rtnCode", "0");
			returnMap.put("message", "정상적으로 저장 되었습니다");
		} catch (BadSqlGrammarException e) {
			returnMap.put("rtnCode", "-1");
			returnMap.put("message", "저장에 실패하였습니다.");
		}
		 
		 return returnMap;
	}

	@Override
	public Map juminChkCnt(Map param){
		// TODO Auto-generated method stub
		return empWorkerMgmtDAO.juminChkCnt(param);
	}

	@Override
	public Map selectKeyValue(Map param){
		// TODO Auto-generated method stub
		return empWorkerMgmtDAO.selectKeyValue(param);
	}
	
	@Override
	public Map selectJuminUse(Map param){
		// TODO Auto-generated method stub
		return empWorkerMgmtDAO.selectJuminUse(param);
	}

	@Override
	public Map deleteWorker(Map param) {
		Map<String, String> returnMap = new ConcurrentHashMap<String, String>();
		
		try{
			empWorkerMgmtDAO.deleteWorker(param);
			commonMainDAO.deleteLogInsert(param);
			
			returnMap.put("rtnCode", "0");
			returnMap.put("message", "정상적으로 삭제되었습니다.");

		} catch(BadSqlGrammarException e){
			returnMap.put("rtnCode", "-1");
			returnMap.put("message", "삭제에 실패하였습니다.");
		}
		return returnMap;
	}

	
}
