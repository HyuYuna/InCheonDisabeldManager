package kr.co.grit.common.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.grit.common.dao.CommonHomeDAO;

/**
 * @Class Name : CommonHomeServiceImpl.java
 * @Description : CommonHome Business Implement class
 * @Modification Information
 *
 */

@Service("commonHomeService")
@Transactional
public class CommonHomeServiceImpl implements CommonHomeService {

    @Resource(name="commonHomeDAO")
    private CommonHomeDAO commonHomeDAO;
    
	/**
	 * 홈 공지사항 목록 조회
	 * @param param - 조회할 정보가 담긴 param
	 * @return 홈 공지사항 목록
	 * @exception Exception
	 */
    @Override
    @SuppressWarnings("rawtypes")
	public List<Map> getHomeNoticeList(Map param) throws Exception {
    	return commonHomeDAO.selectHomeNoticeList(param);
    }
    
	/**
	 * 홈 자료실 목록 조회
	 * @param param - 조회할 정보가 담긴 param
	 * @return 홈 자료실 목록
	 * @exception Exception
	 */
    @Override
    @SuppressWarnings("rawtypes")
	public List<Map> getHomeReferList(Map param) throws Exception {
    	return commonHomeDAO.selectHomeReferList(param);
    }

    
}