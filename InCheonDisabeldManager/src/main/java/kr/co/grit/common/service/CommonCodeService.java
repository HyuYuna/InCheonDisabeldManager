package kr.co.grit.common.service;

import java.util.List;
import java.util.Map;

/**
 * @Class Name  : CommonCodeServiceImpl.java
 * @Description : CommonCodeServiceImpl Business Implement class
 * @Modification Information
 */
public interface CommonCodeService {
      
    
    /**
	 * 사용자그룹정보를 조회한다
	 * @param param - 조회할 정보가 담긴 Map
	 * @return 사용자그룹정보 목록을 조회한다.
	 * @exception Exception
	 */
    @SuppressWarnings("rawtypes")
    public List<Map> searchUserGroup() throws Exception;
    
    
    /**
	 * 사용여부를 조회한다
	 * @param param - 조회할 정보가 담긴 Map
	 * @return 사용여부 목록을 조회한다.
	 * @exception Exception
	 */
    @SuppressWarnings("rawtypes")
    public List<Map> searchUse() throws Exception;   
    
    /**
	 * 복지시설를 조회한다
	 * @param param - 조회할 정보가 담긴 Map
	 * @return 복지시설 목록을 조회한다.
	 * @exception Exception
	 */
    @SuppressWarnings("rawtypes")
    public List<Map> searchWffcltyCdList() throws Exception;   
    
    /**
     * 복지시설 조회 서브코드 PKH
     * @return
     * @throws Exception
     */
    @SuppressWarnings("rawtypes")
    public List<Map> searchWffcltyCdSubList(String code) throws Exception;
    
    /**
	 * 운영단체를 조회한다
	 * @param param - 조회할 정보가 담긴 Map
	 * @return 운영단체 목록을 조회한다.
	 * @exception Exception
	 */
    @SuppressWarnings("rawtypes")
    public List<Map> searchOgnztCdList() throws Exception;   
    
    /**
	 * 시설운영를 조회한다
	 * @param param - 조회할 정보가 담긴 Map
	 * @return 시설운영 목록을 조회한다.
	 * @exception Exception
	 */
    @SuppressWarnings("rawtypes")
    public List<Map> selectFacOp() throws Exception;  
    
    /**
	 * 단체구분를 조회한다
	 * @param param - 조회할 정보가 담긴 Map
	 * @return 단체구분을 조회한다.
	 * @exception Exception
	 */
    @SuppressWarnings("rawtypes")
    public List<Map> selectGroupClsfc() throws Exception; 
    
    /**
	 * 시설분류를 조회한다
	 * @param param - 조회할 정보가 담긴 Map
	 * @return 시설분류 목록을 조회한다.
	 * @exception Exception
	 */
    @SuppressWarnings("rawtypes")
    public List<Map> selectFcltyClsfc() throws Exception;
    

    /**
	 * 시설유형를 조회한다
	 * @param param - 조회할 정보가 담긴 Map
	 * @return 시설유형 목록을 조회한다.
	 * @exception Exception
	 */
    @SuppressWarnings("rawtypes")
    public List<Map> selectTypeFacility(Map param) throws Exception;
    
    
    /**
	 * 수입제원을 조회한다
	 * @param param - 조회할 정보가 담긴 Map
	 * @return 수입제원 목록을 조회한다.
	 * @exception Exception
	 */
    @SuppressWarnings("rawtypes")
    public List<Map> searchRevenueTp() throws Exception;
    
    
    /**
	 * 시설소유를 조회한다
	 * @param param - 조회할 정보가 담긴 Map
	 * @return 시설소유 목록을 조회한다.
	 * @exception Exception
	 */
    @SuppressWarnings("rawtypes")
    public List<Map> searchOwnershipTp() throws Exception;
    
    
    /**
	 * 중식제공을 조회한다
	 * @param param - 조회할 정보가 담긴 Map
	 * @return 중식제공 목록을 조회한다.
	 * @exception Exception
	 */
    @SuppressWarnings("rawtypes")
    public List<Map> searchLunchTp() throws Exception;
    
    
    /**
	 * 장애유형을 조회한다
	 * @param param - 조회할 정보가 담긴 Map
	 * @return 장애유형을 목록을 조회한다.
	 * @exception Exception
	 */
    @SuppressWarnings("rawtypes")
    public List<Map> searchDisableTp() throws Exception;


    /**
   	 * 퇴소사유를 조회한다
   	 * @param param - 조회할 정보가 담긴 Map
   	 * @return 퇴소사유을 조회한다.
   	 * @exception Exception
   	 */
    @SuppressWarnings("rawtypes")
    public List<Map> selectRsnLvng() throws Exception;
       
    
   /**
	* 장애유형을 조회한다
	* @param param - 조회할 정보가 담긴 Map
	* @return 장애유형을 조회한다.
	* @exception Exception
	*/
	@SuppressWarnings("rawtypes")
	public List<Map> selectDspsnTp() throws Exception;
	
	
  /**
	* 진행상태을 조회한다
	* @param param - 조회할 정보가 담긴 Map
	* @return 진행상태을 조회한다.
	* @exception Exception
	*/
	@SuppressWarnings("rawtypes")
	public List<Map> selectProgress() throws Exception;
	
	/*
	 * 시군구 조회
	 */
	@SuppressWarnings("rawtypes")
	public List<Map> selectSigungu()  throws Exception;
	
	/**
	* 입 퇴소 시설유형을 조회한다
	* @param param - 조회할 정보가 담긴 Map
	* @return 입 퇴소 시설유형을 조회한다.
	* @exception Exception
	*/
	@SuppressWarnings("rawtypes")
	public List<Map> searchTypeExtFcltyList() throws Exception;
	
	/**
	* 보조금 지급구분을 조회한다
	* @param param - 조회할 정보가 담긴 Map
	* @return 입 퇴소 시설유형을 조회한다.
	* @exception Exception
	*/
	@SuppressWarnings("rawtypes")
	public List<Map> searchSbspyClsfcList() throws Exception;
	
	/**
	* 보조금 유형을 조회한다
	* @param param - 조회할 정보가 담긴 Map
	* @return 입 퇴소 시설유형을 조회한다.
	* @exception Exception
	*/
	@SuppressWarnings("rawtypes")
	public List<Map> searchTypeGrantList() throws Exception;
	
	
	
	
	/**
	* 성별을 조회한다
	* @param param - 조회할 정보가 담긴 Map
	* @return 성별을 조회한다.
	* @exception Exception
	*/
	@SuppressWarnings("rawtypes")
	public List<Map> searchGenderList() throws Exception;
	
	/**
	* 혈액형을 조회한다
	* @param param - 조회할 정보가 담긴 Map
	* @return 혈액형을 조회한다.
	* @exception Exception
	*/
	@SuppressWarnings("rawtypes")
	public List<Map> searchBloodTypeList() throws Exception;
	
	/**
	* 혼인여부를 조회한다
	* @param param - 조회할 정보가 담긴 Map
	* @return 혼인여부를 조회한다.
	* @exception Exception
	*/
	@SuppressWarnings("rawtypes")
	public List<Map> searchMaritalStatusList() throws Exception;
	
	/**
	* 보장자격를 조회한다
	* @param param - 조회할 정보가 담긴 Map
	* @return 보장자격을 조회한다.
	* @exception Exception
	*/
	@SuppressWarnings("rawtypes")
	public List<Map> searchGuaranteedList() throws Exception;
	
	/**
	* 장애여부를 조회한다
	* @param param - 조회할 정보가 담긴 Map
	* @return 장애여부을 조회한다.
	* @exception Exception
	*/
	@SuppressWarnings("rawtypes")
	public List<Map> searchDisabilityList() throws Exception;

	/**
	* 장애정보를 조회한다
	* @param param - 조회할 정보가 담긴 Map
	* @return 장애정도를 조회한다.
	* @exception Exception
	*/
	@SuppressWarnings("rawtypes")
	public List<Map> searchDisableDreeFgList() throws Exception;
	
	
	/**
	* 장애등급을  조회한다
	* @param param - 조회할 정보가 담긴 Map
	* @return 장애등급을 조회한다.
	* @exception Exception
	*/
	@SuppressWarnings("rawtypes")
	public List<Map> searchDisableGrade(String grade) throws Exception;
	
	
	/**
	* 발생시기를 조회한다
	* @param param - 조회할 정보가 담긴 Map
	* @return 발생시기을 조회한다.
	* @exception Exception
	*/
	@SuppressWarnings("rawtypes")
	public List<Map> searchOutbreakTimeFg() throws Exception;
	
	
	/**
	* 발생사유를 조회한다
	* @param param - 조회할 정보가 담긴 Map
	* @return 발생사유를 조회한다.
	* @exception Exception
	*/
	@SuppressWarnings("rawtypes")
	public List<Map> searchOutbreakRsnFg() throws Exception;
	
	
	/**
	* 사례관리대상을 조회한다
	* @param param - 조회할 정보가 담긴 Map
	* @return 사례관리대상을 조회한다.
	* @exception Exception
	*/
	@SuppressWarnings("rawtypes")
	public List<Map> searchCaseManageFgList() throws Exception;
	
	/**
	* 사례종료사유를 조회한다
	* @param param - 조회할 정보가 담긴 Map
	* @return 사례종료사유를 조회한다.
	* @exception Exception
	*/
	@SuppressWarnings("rawtypes")
	public List<Map> searchCaseManageEndRsnList() throws Exception;
	
	/**
	* 사례관리구분을 조회한다
	* @param param - 조회할 정보가 담긴 Map
	* @return 사례종료사유를 조회한다.
	* @exception Exception
	*/
	@SuppressWarnings("rawtypes")
	public List<Map> searchCsmnDvsnFg() throws Exception;
	
	/**
	* 보정구를 조회한다
	* @param param - 조회할 정보가 담긴 Map
	* @return 보정구를 조회한다.
	* @exception Exception
	*/
	@SuppressWarnings("rawtypes")
	public List<Map> searchAssistDvcRepair() throws Exception;
	
	/**
	* 개인정보 보호책임자 복지과을 조회한다
	* @param param - 조회할 정보가 담긴 Map
	* @return 개인정보 보호책임자를 조회한다.
	* @exception Exception
	*/
	@SuppressWarnings("rawtypes")
	public Map searchPrsnInfD() throws Exception;
	
	/**
	* 개인정보 보호책임자 전자우편을 조회한다
	* @param param - 조회할 정보가 담긴 Map
	* @return 개인정보 보호책임자를 조회한다.
	* @exception Exception
	*/
	@SuppressWarnings("rawtypes")
	public Map searchPrsnInfE() throws Exception;
	
	/**
	* 개인정보 보호책임자 팩스번호를 조회한다
	* @param param - 조회할 정보가 담긴 Map
	* @return 개인정보 보호책임자를 조회한다.
	* @exception Exception
	*/
	@SuppressWarnings("rawtypes")
	public Map searchPrsnInfF() throws Exception;
	
	/**
	* 개인정보 보호책임자 성명을 조회한다
	* @param param - 조회할 정보가 담긴 Map
	* @return 개인정보 보호책임자를 조회한다.
	* @exception Exception
	*/
	@SuppressWarnings("rawtypes")
	public Map searchPrsnInfN() throws Exception;
	
	/**
	* 개인정보 보호책임자 직책을 조회한다
	* @param param - 조회할 정보가 담긴 Map
	* @return 개인정보 보호책임자를 조회한다.
	* @exception Exception
	*/
	@SuppressWarnings("rawtypes")
	public Map searchPrsnInfP() throws Exception;
	
	/**
	* 개인정보 보호책임자 전화번호를 조회한다
	* @param param - 조회할 정보가 담긴 Map
	* @return 개인정보 보호책임자를 조회한다.
	* @exception Exception
	*/
	@SuppressWarnings("rawtypes")
	public Map searchPrsnInfT() throws Exception;
}