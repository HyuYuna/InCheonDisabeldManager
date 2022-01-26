package kr.co.grit.bas.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.annotation.Resource;

import kr.co.grit.bas.dao.BasGroupMgmtDAO;
import kr.co.grit.common.dao.CommonMainDAO;

import org.springframework.jdbc.BadSqlGrammarException;
import org.springframework.stereotype.Service;

/**
 * 단체관리 
 * @author SYW
 */
@Service("BasGroupMgmtService")
public class BasGroupMgmtServiceImpl implements BasGroupMgmtService{

	/**
	 * DAO 선언
	 */
	@Resource(name="BasGroupMgmtDAO")
	private transient BasGroupMgmtDAO basGroupMgmtDAO;
	
	/**
	 * DAO 선언
	 */
	@Resource(name="commonMainDAO")
	private transient CommonMainDAO commonMainDAO;
	
	@Override
	@SuppressWarnings("rawtypes")
	public List<Map> readGroupList(Map param) throws Exception {
		return basGroupMgmtDAO.selectGroupList(param);
	}

	@Override
	@SuppressWarnings("rawtypes")
	public Map insertGroupInfo(Map param) throws Exception {
		
		Map returnMap = new ConcurrentHashMap();
		
		String saveMode = (String)param.get("saveMode");
		
		try {
			if("I".equals(saveMode)){
				basGroupMgmtDAO.insertGroupInfo(param);
				
			}else if("U".equals(saveMode)){
				basGroupMgmtDAO.updateGroupInfo(param);
			}
			
			returnMap.put("rtnCode", "0");
			returnMap.put("message", "정상적으로 저장 되었습니다");
		} catch(BadSqlGrammarException e) {
			returnMap.put("rtnCode", "-1");
			returnMap.put("message", "저장에 실패하였습니다.");
		}
		 
		 return returnMap;
	}
	
@Override
public int selectEncChk(Map param) throws Exception {
	// TODO Auto-generated method stub
	return basGroupMgmtDAO.encCheck(param);
}

@Override
public Map deleteBasGroupMgmt(Map param) throws Exception {
	
	Map returnMap = new ConcurrentHashMap();
	
	int WffcltyBaseCount = basGroupMgmtDAO.selectWffcltyBaseOgnztCd(param);
	
	try {
		if(WffcltyBaseCount > 0){
			
			
			returnMap.put("rtnCode", "1");
			returnMap.put("message", "등록된 복지시설 정보가 있어 삭제할 수 없습니다.");
		}else{
			basGroupMgmtDAO.deleteBasGroup(param);
			commonMainDAO.deleteLogInsert(param);
			
			returnMap.put("rtnCode", "0");
			returnMap.put("message", "정상적으로 삭제 되었습니다");
		}
		
		
	} catch(BadSqlGrammarException e) {
		returnMap.put("rtnCode", "-1");
		returnMap.put("message", "저장에 실패하였습니다.");
	}
	return returnMap;
}
}