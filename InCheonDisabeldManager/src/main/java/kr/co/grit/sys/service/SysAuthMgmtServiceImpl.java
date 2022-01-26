package kr.co.grit.sys.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import kr.co.grit.sys.dao.SysAuthMgmtDAO;

import org.springframework.jdbc.BadSqlGrammarException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * @Class Name : SysAuthMgmtServiceImpl.java
 * @Description : SysAuthMgmt Business Implement class
 * @Modification Information
 */

@Service("sysAuthMgmtService")
@Transactional
@SuppressWarnings("rawtypes")
public class SysAuthMgmtServiceImpl implements SysAuthMgmtService {

	
	/**
	 * DAO 선언
	 */
    @Resource(name="sysAuthMgmtDAO")
    private transient SysAuthMgmtDAO sysAuthMgmtDAO;
    
    /**
     * constructor
     */
    public SysAuthMgmtServiceImpl(){
    	// constructor
    }

    @Override
	public List<Map> searchList(final Map param) {
    	return sysAuthMgmtDAO.searchList(param);
    }


	@Override
	public List<Map> searchList2(final Map param) {
		return sysAuthMgmtDAO.searchList2(param);
	}

	@Override
	@Transactional
	public Map<String, String> saveSysAuthMgmt(final List<Map<String, Object>> param) {
		final EgovMap returnMap = new EgovMap();
		
		try {
			for(int i = 0; i < param.size(); i++){
				final String stats = (String)param.get(i).get("stats");
				
				if("D".equals(stats)){
					sysAuthMgmtDAO.deleteSysAuthMgmt(param.get(i));
				}else if("U".equals(stats)){
					sysAuthMgmtDAO.updateSysAuthMgmt(param.get(i));
				}
			}
			
			returnMap.put("rtnCode", "0");
			returnMap.put("message", "정상적으로 저장 되었습니다");
		} catch (BadSqlGrammarException e) {
			returnMap.put("rtnCode", "-1");
			returnMap.put("message", "저장에 실패하였습니다.");
 		    TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}	
		
		return returnMap;
		
	}

	

}
