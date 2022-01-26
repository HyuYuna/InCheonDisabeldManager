package kr.co.grit.common.service;

import java.util.List;
import java.util.Map;

public interface CommonPopupService {

    /**
	 * 사용자정보를 조회한다.
	 * @param param - 조회할 정보가 담긴 Map
	 * @return 사용자 목록
	 * @exception Exception
	 */
    @SuppressWarnings("rawtypes")
	List<Map> searchUserList(Map param) throws Exception;

    
    /**
	 * 엑셀 다운로드 사유를 등록한다.
	 * @param param - 추가할 정보가 담긴 Map
	 * @return 등록 결과
	 * @exception Exception
	 */
    void saveExcelDownReasonReg(Map param) throws Exception;
    
}
