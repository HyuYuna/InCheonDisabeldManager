package kr.co.grit.common.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.grit.common.constants.GritConstants;
import kr.co.grit.common.util.Crypto;

@Repository("commonPopupDAO")
public class CommonPopupDAO {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

   
    /**
	 * 사용자정보를 조회한다.
	 * @param param - 조회할 정보가 담긴 Map
	 * @return 사용자 목록
	 * @exception Exception
	 */
    @SuppressWarnings("rawtypes")
	public List<Map> searchUserList(Map param) throws Exception {
//    	return sqlSession.selectList("commonPopupDAO.searchUserList", param);
    	List<Map> returnList = sqlSession.selectList("commonPopupDAO.searchUserList", param);
    	
    	for(int i = 0 ; i < returnList.size() ; i++){
    		Map tempMap = returnList.get(i);
    		returnList.set(i, tempMap);
    	}
    	
        return returnList;
    }
    
    
    /**
	 * 엑셀 다운로드 사유를 등록한다.
	 * @param param - 추가할 정보가 담긴 Map
	 * @return 등록 결과
	 * @exception Exception
	 */
    public void saveExcelDownReasonReg(Map param) throws Exception {
    	sqlSession.insert("commonPopupDAO.saveExcelDownReasonReg", param);
    }
    
    

}
