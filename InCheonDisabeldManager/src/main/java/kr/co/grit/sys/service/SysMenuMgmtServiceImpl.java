package kr.co.grit.sys.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.BadSqlGrammarException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @Class Name : SysMenuMgmtServiceImpl.java
 * @Description : SysMenuMgmtServiceImpl Business Implement class
 * @Modification Information
 *
 */
@Service("sysMenuMgmtService")
@Transactional
public class SysMenuMgmtServiceImpl implements SysMenuMgmtService {
	
	/**
	 * 로그 선언
	 */
	private static final Logger LOGGER = LoggerFactory.getLogger(SysMenuMgmtServiceImpl.class);
	
	/**
	 * sql 선언
	 */
	@Resource(name="sqlSessionTemplate")
	private transient SqlSessionTemplate sqlSession;
	
	/**
     * constructor
     */
    public SysMenuMgmtServiceImpl() {
		//constructor
    }
	
	@Override
    @SuppressWarnings("rawtypes")
	public List<Map> searchList(final Map param){
		List<Map> resultList = null;

    	try {
    		resultList = sqlSession.selectList("sysMenuMgmtDAO.searchList", param);
    	} catch(BadSqlGrammarException e) {
    		LOGGER.error(":메뉴 목록을 조회하지 못하였습니다.");
    		throw e;
    	}

    	return resultList;
    }


	@Override
    @SuppressWarnings("rawtypes")
	public int saveMenu(final Map param){
		int resultCount = 0;

    	try {
    		resultCount = sqlSession.update("sysMenuMgmtDAO.saveMenu", param);
    	} catch(BadSqlGrammarException e) {
    		LOGGER.error(":메뉴 상세를 저장하지 못하였습니다.");
    		throw e;
    	
    	}

    	return resultCount;
    }
}
