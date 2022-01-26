package kr.co.grit.common.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.grit.common.constants.GritConstants;
import kr.co.grit.common.util.Crypto;

@Repository("commonCodeDAO")
public class CommonCodeDAO {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

    /**
	 * @param 
	 * @return 사용자그룹정보 목록을 조회한다.
	 * @exception Exception
	 */
    @SuppressWarnings("rawtypes")
	public List<Map> searchUserGroup() throws Exception {
        return sqlSession.selectList("commonCodeDAO.searchUserGroup");
    }
    
    
    /**
	 * @param 
	 * @return 사용여부 목록을 조회한다.
	 * @exception Exception
	 */
    @SuppressWarnings("rawtypes")
	public List<Map> searchUse() throws Exception {
        return sqlSession.selectList("commonCodeDAO.searchUse");
    }    
    
    /**
     * @param 
	 * @return 복지시설 목록을 조회한다.
	 * @exception Exception
	 */
    @SuppressWarnings("rawtypes")
	public List<Map> searchWffcltyCdList() throws Exception {
        return sqlSession.selectList("commonCodeDAO.searchWffcltyCdList");
    }
    
    /**
     * 복지시설 서브코드 :  시설분류 > 시설유형 PKH
     * @param code
     * @return
     * @throws Exception
     */
    @SuppressWarnings("rawtypes")
	public List<Map>searchWffcltyCdSubList(String code) throws Exception {
        return sqlSession.selectList("commonCodeDAO.searchWffcltyCdSubList",code);
    }
    
    /**
	 * @param
	 * @return 운영단체 조회을 조회한다.
	 * @exception Exception
	 */
    @SuppressWarnings("rawtypes")
	public List<Map> searchOgnztCdList() throws Exception {
        return sqlSession.selectList("commonCodeDAO.searchOgnztCdList");
    }

    /**
     * @param
	 * @return 시설운영 목록을 조회한다.
	 * @exception Exception
	 */
    @SuppressWarnings("rawtypes")
	public List<Map> selectFacOp() throws Exception {
        return sqlSession.selectList("commonCodeDAO.selectFacOp");
    }
    
    
    /**
     * @param
	 * @return 단체구분 목록을 조회한다.
	 * @exception Exception
	 */
    @SuppressWarnings("rawtypes")
	public List<Map> selectGroupClsfc() throws Exception {
        return sqlSession.selectList("commonCodeDAO.selectGroupClsfc");
    }
    
    /**
     * @param
   	 * @return 시설분류 목록을 조회한다.
   	 * @exception Exception
   	 */
    @SuppressWarnings("rawtypes")
	public List<Map> selectFcltyClsfc() throws Exception {
        return sqlSession.selectList("commonCodeDAO.selectFcltyClsfc");
    }
    /**
   	 * @param param - 조회할 정보가 담긴 Map
   	 * @return 퇴소사유를 조회힌다.
   	 * @exception Exception
   	 */
    @SuppressWarnings("rawtypes")
	public List<Map> selectRsnLvng() throws Exception {
        return sqlSession.selectList("commonCodeDAO.selectRsnLvng");
    }
    /**
   	 * @param param - 조회할 정보가 담긴 Map
   	 * @return 장애유형를 조회힌다
   	 * @exception Exception
   	 */
    @SuppressWarnings("rawtypes")
	public List<Map> selectDspsnTp() throws Exception {
        return sqlSession.selectList("commonCodeDAO.selectDspsnTP");
    }
    
    /**
     * @param
   	 * @return 시설유형 목록을 조회한다.
   	 * @exception Exception
   	 */
    @SuppressWarnings("rawtypes")
	public List<Map> selectTypeFacility(Map param) throws Exception {
        return sqlSession.selectList("commonCodeDAO.selectTypeFacility");
    }
    
    
    
    /**
     * @param
   	 * @return 수입제원 목록을 조회한다.
   	 * @exception Exception
   	 */
    @SuppressWarnings("rawtypes")
	public List<Map> searchRevenueTp() throws Exception {
        return sqlSession.selectList("commonCodeDAO.searchRevenueTp");
    }
    
    /**
     * @param
   	 * @return 시설소유 목록을 조회한다.
   	 * @exception Exception
   	 */
    @SuppressWarnings("rawtypes")
	public List<Map> searchOwnershipTp() throws Exception {
        return sqlSession.selectList("commonCodeDAO.searchOwnershipTp");
    }
    
    /**
     * @param
   	 * @return 시설유형 목록을 조회한다.
   	 * @exception Exception
   	 */
    @SuppressWarnings("rawtypes")
	public List<Map> searchLunchTp() throws Exception {
        return sqlSession.selectList("commonCodeDAO.searchLunchTp");
    }
    
    
    /**
     * @param
   	 * @return 장애유형 목록을 조회한다.
   	 * @exception Exception
   	 */
    @SuppressWarnings("rawtypes")
	public List<Map> searchDisableTp() throws Exception {
        return sqlSession.selectList("commonCodeDAO.searchDisableTp");
    }
  
    /**
     * @param
   	 * @return 진행상태 목록을 조회한다.
   	 * @exception Exception
   	 */
    @SuppressWarnings("rawtypes")
	public List<Map> searchProgress() throws Exception {
        return sqlSession.selectList("commonCodeDAO.selectProgress");
    }
    
    /**
     * 시군구 조회 PKH
     * @return
     * @throws Exception
     */
    @SuppressWarnings("rawtypes")
	public List<Map> selectSigungu() throws Exception {
        return sqlSession.selectList("commonCodeDAO.selectSigungu");
    }
    
    /**
     * @param
   	 * @return 입퇴소 시설유형 목록을 조회한다.
   	 * @exception Exception
   	 */
    @SuppressWarnings("rawtypes")
    public List<Map> searchTypeExtFcltyList() throws Exception {
    	return sqlSession.selectList("commonCodeDAO.searchTypeExtFcltyList");
    }
    
    /**
     * @param
   	 * @return 보조금 지급 구분을 조회한다.
   	 * @exception Exception
   	 */
    @SuppressWarnings("rawtypes")
    public List<Map> searchSbspyClsfcList() throws Exception {
    	return sqlSession.selectList("commonCodeDAO.searchSbspyClsfcList");
    }
    
    /**
     * @param
   	 * @return 보조금 유형 목록을 조회한다.
   	 * @exception Exception
   	 */
    @SuppressWarnings("rawtypes")
    public List<Map> searchTypeGrantList() throws Exception {
    	return sqlSession.selectList("commonCodeDAO.searchTypeGrantList");
    }
    
    
    /**
     * @param
   	 * @return 성별을 목록을 조회한다.
   	 * @exception Exception
   	 */
    @SuppressWarnings("rawtypes")
    public List<Map> searchGenderList() throws Exception {
    	return sqlSession.selectList("commonCodeDAO.searchGenderList");
    }
    
    /**
     * @param
   	 * @return 혈액형을 목록을 조회한다.
   	 * @exception Exception
   	 */
    @SuppressWarnings("rawtypes")
    public List<Map> searchBloodTypeList() throws Exception {
    	return sqlSession.selectList("commonCodeDAO.searchBloodTypeList");
    }
    
    /**
     * @param
   	 * @return 혼인여부를 목록을 조회한다.
   	 * @exception Exception
   	 */
    @SuppressWarnings("rawtypes")
    public List<Map> searchMaritalStatusList() throws Exception {
    	return sqlSession.selectList("commonCodeDAO.searchMaritalStatusList");
    }
    
    /**
     * @param
   	 * @return 보장자격을 목록을 조회한다.
   	 * @exception Exception
   	 */
    @SuppressWarnings("rawtypes")
    public List<Map> searchGuaranteedList() throws Exception {
    	return sqlSession.selectList("commonCodeDAO.searchGuaranteedList");
    }
    
    /**
     * @param
   	 * @return 장애여부 목록을 조회한다.
   	 * @exception Exception
   	 */
    @SuppressWarnings("rawtypes")
    public List<Map> searchDisabilityList() throws Exception {
    	return sqlSession.selectList("commonCodeDAO.searchDisabilityList");
    }
    
    
    /**
     * @param
   	 * @return 장애정도를 목록을 조회한다.
   	 * @exception Exception
   	 */
    @SuppressWarnings("rawtypes")
    public List<Map> searchDisableDreeFgList() throws Exception {
    	return sqlSession.selectList("commonCodeDAO.searchDisableDreeFgList");
    }
    
    /**
     * @param
   	 * @return 장애등급를 목록을 조회한다.
   	 * @exception Exception
   	 */
    @SuppressWarnings("rawtypes")
    public List<Map> searchDisableGrade(String grade) throws Exception {
    	return sqlSession.selectList("commonCodeDAO.searchDisableGrade", grade);
    }
    

    /**
     * @param
   	 * @return 발생시기를 목록을 조회한다.
   	 * @exception Exception
   	 */
    @SuppressWarnings("rawtypes")
    public List<Map> searchOutbreakTimeFg() throws Exception {
    	return sqlSession.selectList("commonCodeDAO.searchOutbreakTimeFg");
    }
    
    /**
     * @param
   	 * @return 발생사유 목록을 조회한다.
   	 * @exception Exception
   	 */
    @SuppressWarnings("rawtypes")
    public List<Map> searchOutbreakRsnFg() throws Exception {
    	return sqlSession.selectList("commonCodeDAO.searchOutbreakRsnFg");
    }
    
    /**
     * @param
   	 * @return 사례관리대상여부를 목록을 조회한다.
   	 * @exception Exception
   	 */
    @SuppressWarnings("rawtypes")
    public List<Map> searchCaseManageFgList() throws Exception {
    	return sqlSession.selectList("commonCodeDAO.searchCaseManageFgList");
    }
    
    /**
     * @param
   	 * @return 사례관리종료사유를 목록을 조회한다.
   	 * @exception Exception
   	 */
    @SuppressWarnings("rawtypes")
    public List<Map> searchCaseManageEndRsnList() throws Exception {
    	return sqlSession.selectList("commonCodeDAO.searchCaseManageEndRsnList");
    }
    
    /**
     * @param
   	 * @return 사례관리구분 목록을 조회한다.
   	 * @exception Exception
   	 */
    @SuppressWarnings("rawtypes")
    public List<Map> searchCsmnDvsnFg() throws Exception {
    	return sqlSession.selectList("commonCodeDAO.searchCsmnDvsnFg");
    }
    
    /**
     * @param
   	 * @return 보정구 목록을 조회한다.
   	 * @exception Exception
   	 */
    @SuppressWarnings("rawtypes")
    public List<Map> searchAssistDvcRepair() throws Exception {
    	return sqlSession.selectList("commonCodeDAO.searchAssistDvcRepair");
    }
    
    /**
     * @param
   	 * @return 개인정보처리방침 성명을 조회한다.
   	 * @exception ExceptionsearchPrsnInf
   	 */
    @SuppressWarnings("rawtypes")
    public Map searchPrsnInfN() throws Exception {
    	return sqlSession.selectOne("commonCodeDAO.searchPrsnInfN");
    }
    
    /**
     * @param
   	 * @return 개인정보처리방침 직책을 조회한다.
   	 * @exception ExceptionsearchPrsnInf
   	 */
    @SuppressWarnings("rawtypes")
    public Map searchPrsnInfP() throws Exception {
    	return sqlSession.selectOne("commonCodeDAO.searchPrsnInfP");
    }
    
    /**
     * @param
   	 * @return 개인정보처리방침 소속부서를 조회한다.
   	 * @exception ExceptionsearchPrsnInf
   	 */
    @SuppressWarnings("rawtypes")
    public Map searchPrsnInfD() throws Exception {
    	return sqlSession.selectOne("commonCodeDAO.searchPrsnInfD");
    }
    
    /**
     * @param
   	 * @return 개인정보처리방침 전화번호를 조회한다.
   	 * @exception ExceptionsearchPrsnInf
   	 */
    @SuppressWarnings("rawtypes")
    public Map searchPrsnInfT() throws Exception {
    	return sqlSession.selectOne("commonCodeDAO.searchPrsnInfT");
    }
    
    /**
     * @param
   	 * @return 개인정보처리방침 팩스번호을 조회한다.
   	 * @exception ExceptionsearchPrsnInf
   	 */
    @SuppressWarnings("rawtypes")
    public Map searchPrsnInfF() throws Exception {
    	return sqlSession.selectOne("commonCodeDAO.searchPrsnInfF");
    }
    
    /**
     * @param
   	 * @return 개인정보처리방침 전자우편을 조회한다.
   	 * @exception ExceptionsearchPrsnInf
   	 */
    @SuppressWarnings("rawtypes")
    public Map searchPrsnInfE() throws Exception {
    	return sqlSession.selectOne("commonCodeDAO.searchPrsnInfE");
    }
}
