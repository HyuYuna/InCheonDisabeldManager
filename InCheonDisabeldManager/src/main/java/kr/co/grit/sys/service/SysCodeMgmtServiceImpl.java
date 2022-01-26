package kr.co.grit.sys.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import kr.co.grit.common.util.SessionUtil;
import kr.co.grit.sys.dao.SysCodeMgmtDAO;

/**
 * @Class Name : SysCodeMgmtServiceImpl.java
 * @Description : SysCodeMgmtServiceImpl Business Implement class
 * @Modification Information
 *
 */
@Service("sysCodeMgmtService")
@Transactional
public class SysCodeMgmtServiceImpl  implements SysCodeMgmtService {

	/**
	 * DAO 선언
	 */
    @Resource(name="sysCodeMgmtDAO")
    private transient SysCodeMgmtDAO sysCodeMgmtDAO;

    /**
     * constructor
     */
    public SysCodeMgmtServiceImpl() {
		//constructor
		//unnecessaryconstructor : 생성자 없는 경우보다 pmd rule 에 검출 건수가 적음. 제외 권장
    }
    
    @Override
    public List<EgovMap> selectSysCodeMgmt(final EgovMap param) {
    	return sysCodeMgmtDAO.selectSysCodeMgmt(param);
    }

    @Override
    public int saveSysCodeMgmt(final EgovMap param) {
    	final EgovMap userInfo = (EgovMap) SessionUtil.getRequestAttributes("KSSM.user");
    	final String sessUserId = (String)userInfo.get("userId");   	
    	//lawofdemeter : map 으로 넘겨주는 parameter 처리를 현시점에 수정하기에는 무리가 많으므로, 제외권장
    	param.put("sessUserId", sessUserId);		
    	return sysCodeMgmtDAO.saveSysCodeMgmt(param);
    }
    
}