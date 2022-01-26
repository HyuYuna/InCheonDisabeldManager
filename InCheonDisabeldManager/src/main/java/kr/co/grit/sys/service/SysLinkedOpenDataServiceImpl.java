package kr.co.grit.sys.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import kr.co.grit.sys.dao.SysLinkedOpenDataDAO;

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

@Service("SysLinkedOpenDataService")
public class SysLinkedOpenDataServiceImpl implements SysLinkedOpenDataService {

	
	/**
	 * DAO 선언
	 */
    @Resource(name="SysLinkedOpenDataDAO")
    private transient SysLinkedOpenDataDAO sysLinOpDataDAO;
    

    @Override
	public List<EgovMap> selectLinkOpenDataList(EgovMap param) {
    	
    	List<EgovMap> result = new ArrayList<EgovMap>();
    	
    	String tabGb = (String)param.get("tabGb");
    	
    	if("0".equals(tabGb)){
    		result =  sysLinOpDataDAO.selectLinkOpenDataOgnztList();
    	}else if("1".equals(tabGb)){
    		result =  sysLinOpDataDAO.selectLinkOpenDataWffcltyList();
    	}else if("2".equals(tabGb)){
    		result =  sysLinOpDataDAO.selectLinkOpenDataProgramList();
    	}else if("3".equals(tabGb)){
    		result =  sysLinOpDataDAO.selectLinkOpenDataWokerList();
    	}else if("4".equals(tabGb)){
    		result =  sysLinOpDataDAO.selectLinkOpenDataDspsnList();
    	}
    	
    	return result;
    }



	

}
