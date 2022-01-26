package kr.co.grit.common.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.co.grit.common.dao.CommonPopupDAO;

@Service("commonPopupService")
public class CommonPopupServiceImpl implements CommonPopupService{

	private static final Logger LOGGER = LoggerFactory.getLogger(CommonPopupServiceImpl.class);
	
    @Resource(name="commonPopupDAO")
    private CommonPopupDAO commonPopupDAO;

    /**
	 * 사용자정보를 조회한다.
	 * @param param - 조회할 정보가 담긴 Map
	 * @return 사용자 목록
	 * @exception Exception
	 */
    @Override
	@SuppressWarnings("rawtypes")
	public List<Map> searchUserList(Map param) throws Exception {
    	return commonPopupDAO.searchUserList(param);
    }
    
    
    /**
	 * 엑셀 다운로드 사유를 등록한다.
	 * @param param - 추가할 정보가 담긴 Map
	 * @return 등록 결과
	 * @exception Exception
	 */
    @Override
    public void saveExcelDownReasonReg(Map param) throws Exception {
    	commonPopupDAO.saveExcelDownReasonReg(param);
    }

}
