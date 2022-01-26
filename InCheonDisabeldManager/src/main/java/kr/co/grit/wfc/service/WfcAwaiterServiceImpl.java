package kr.co.grit.wfc.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.annotation.Resource;

import kr.co.grit.wfc.dao.WfcAwaiterDAO;

import org.springframework.jdbc.BadSqlGrammarException;
import org.springframework.stereotype.Service;

@Service("WfcAwaiterService")
public class WfcAwaiterServiceImpl implements WfcAwaiterService{

	@Resource(name="WfcAwaiterDAO")
	private transient WfcAwaiterDAO wfcAwaiterDAO;
	
	@Override
	public List<Map> selectAwaiter(Map param) throws Exception {
		// TODO Auto-generated method stub
		return wfcAwaiterDAO.selectAwaiterList(param);
	}

	@Override
	public Map<String, String> updateReceipt(Map param) throws Exception {
		Map<String, String> returnMap = new ConcurrentHashMap<String, String>();
		
		try {
			wfcAwaiterDAO.updateReceipt(param);
			
			returnMap.put("rtnCode", "0");
			returnMap.put("message", "정상적으로 저장 되었습니다");
		} catch (BadSqlGrammarException e) {
			e.printStackTrace();
			
			returnMap.put("rtnCode", "-1");
			returnMap.put("message", "저장에 실패하였습니다.");
		}
		return returnMap;
	}

	@Override
	public Map<String, String> updateWating(Map param) throws Exception {
		
		Map<String, String> returnMap = new ConcurrentHashMap<String, String>();
		
		try {
			wfcAwaiterDAO.updateWating(param);
			
			returnMap.put("rtnCode", "0");
			returnMap.put("message", "정상적으로 저장 되었습니다");
		} catch (BadSqlGrammarException e) {
			e.printStackTrace();
			returnMap.put("rtnCode", "-1");
			returnMap.put("message", "저장에 실패하였습니다.");
		}
		return returnMap;
	}
	

}
