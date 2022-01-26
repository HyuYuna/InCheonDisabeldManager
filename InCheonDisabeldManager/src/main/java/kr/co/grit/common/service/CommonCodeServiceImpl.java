package kr.co.grit.common.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.grit.common.dao.CommonCodeDAO;

/**
 * @Class Name  : CommonCodeServiceImpl.java
 * @Description : CommonCodeServiceImpl Business Implement class
 * @Modification Information
 */
@Service("commonCodeService")
@Transactional
public class CommonCodeServiceImpl  implements CommonCodeService {

    @Resource(name="commonCodeDAO")
    private CommonCodeDAO commonCodeDAO;

   
    /**
	 * @param 
	 * @return 사용자그룹정보 목록을 조회한다.
	 * @exception Exception
	 */
    @Override
	@SuppressWarnings("rawtypes")
    public List<Map> searchUserGroup() throws Exception{
    	return commonCodeDAO.searchUserGroup();
    }
    
    /**
   	 * @param 
   	 * @return 사용여부 목록을 조회한다.
   	 * @exception Exception
   	 */
       @Override
   	@SuppressWarnings("rawtypes")
       public List<Map> searchUse() throws Exception{
       	return commonCodeDAO.searchUse();
       }
       
       
   /**
  	 * @param 
  	 * @return 복지시설 목록을 조회한다.
  	 * @exception Exception
  	 */
      @Override
      @SuppressWarnings("rawtypes")
      public List<Map> searchWffcltyCdList() throws Exception{
      	return commonCodeDAO.searchWffcltyCdList();
      }
      
      /**
       *  복지시설 서브코드 :  시설분류 > 시설유형 PKH
       */
      @Override
      @SuppressWarnings("rawtypes")
      public List<Map> searchWffcltyCdSubList(String code) throws Exception {
    	  return commonCodeDAO.searchWffcltyCdSubList(code);
      }
    
    /**
	 * @param  
	 * @return 복지시설 목록을 조회한다.
	 * @exception Exception
	 */
    @Override
	@SuppressWarnings("rawtypes")
    public List<Map> searchOgnztCdList() throws Exception{
    	return commonCodeDAO.searchOgnztCdList();
    }

    
    /**
  	 * @param 
  	 * @return 시설운영 목록을 조회한다.
  	 * @exception Exception
  	 */
	@Override
	@SuppressWarnings("rawtypes")
	public List<Map> selectFacOp() throws Exception {
		return commonCodeDAO.selectFacOp();
	}
	
	
	/**
	 * @param 
	 * @return 단체구분 목록을 조회한다.
	 * @exception Exception
	 */
	@Override
	@SuppressWarnings("rawtypes")
	public List<Map> selectGroupClsfc() throws Exception {
		return commonCodeDAO.selectGroupClsfc();
	}
	
	
	/**
	 * @param param - 조회할 정보가 담긴 Map
	 * @return 시설분류 목록을 조회한다.
	 * @exception Exception
	 */
	@Override
	@SuppressWarnings("rawtypes")
	public List<Map> selectFcltyClsfc() throws Exception {
		return commonCodeDAO.selectFcltyClsfc();
	}


	 /**
   	 * @param param - 조회할 정보가 담긴 Map
   	 * @return 시설유형 목록을 조회한다.
   	 * @exception Exception
   	 */
	@Override
	@SuppressWarnings("rawtypes")
	public List<Map> selectTypeFacility(Map param) throws Exception {
		return commonCodeDAO.selectTypeFacility(param);
	}
	
	
	/**
	 * @param 
	 * @return 수입제원 목록을 조회한다.
	 * @exception Exception
	 */
	@Override
	@SuppressWarnings("rawtypes")
	public List<Map> searchRevenueTp() throws Exception {
		return commonCodeDAO.searchRevenueTp();
	}
	
	
	/**
	 * @param 
	 * @return 시설소유 목록을 조회한다.
	 * @exception Exception
	 */
	@Override
	@SuppressWarnings("rawtypes")
	public List<Map> searchOwnershipTp() throws Exception {
		return commonCodeDAO.searchOwnershipTp();
	}
	
	
	/**
	 * @param
	 * @return 중식제공 목록을 조회한다.
	 * @exception Exception
	 */
	@Override
	@SuppressWarnings("rawtypes")
	public List<Map> searchLunchTp() throws Exception {
		return commonCodeDAO.searchLunchTp();
	}
	
	
	/**
	 * @param 
	 * @return 장애유형 목록을 조회한다.
	 * @exception Exception
	 */
	@Override
	@SuppressWarnings("rawtypes")
	public List<Map> searchDisableTp() throws Exception {
		return commonCodeDAO.searchDisableTp();
	}

	
	/**
	 * @param 
	 * @return 퇴소사유 목록을 조회한다.
	 * @exception Exception
	 */
	@Override
	@SuppressWarnings("rawtypes")
	public List<Map> selectRsnLvng() throws Exception {
		return commonCodeDAO.selectRsnLvng();
	}
	
	
	/**
	 * @param 
	 * @return 장애유형 목록을 조회한다.
	 * @exception Exception
	 */
	@Override
	@SuppressWarnings("rawtypes")
	public List<Map> selectDspsnTp() throws Exception {
		return commonCodeDAO.selectDspsnTp();
	}

	
	/**
	 * @param 
	 * @return 진행상태를 조회한다.
	 * @exception Exception
	 */
	@Override
	@SuppressWarnings("rawtypes")
	public List<Map> selectProgress() throws Exception {
		return commonCodeDAO.searchProgress();
	}
	
	/**
	 * 시군구 조회 PKH
	 */
	@SuppressWarnings("rawtypes")
	public List<Map> selectSigungu()  throws Exception {
		return commonCodeDAO.selectSigungu();
	}

	@Override
	@SuppressWarnings("rawtypes")
	public List<Map> searchTypeExtFcltyList() throws Exception {
		return commonCodeDAO.searchTypeExtFcltyList();
	}

	@Override
	@SuppressWarnings("rawtypes")
	public List<Map> searchSbspyClsfcList() throws Exception {
		return commonCodeDAO.searchSbspyClsfcList();
	}

	@Override
	@SuppressWarnings("rawtypes")
	public List<Map> searchTypeGrantList() throws Exception {
		return commonCodeDAO.searchTypeGrantList();
	}
	
	
	
	/**
	 * @param 
	 * @return 성별을 조회한다.
	 * @exception Exception
	 */
	@Override
	@SuppressWarnings("rawtypes")
	public List<Map> searchGenderList() throws Exception {
		return commonCodeDAO.searchGenderList();
	}
	
	/**
	 * @param 
	 * @return 혈액형을 조회한다.
	 * @exception Exception
	 */
	@Override
	@SuppressWarnings("rawtypes")
	public List<Map> searchBloodTypeList() throws Exception {
		return commonCodeDAO.searchBloodTypeList();
	}
	
	/**
	 * @param 
	 * @return 혼인여부를 조회한다.
	 * @exception Exception
	 */
	@Override
	@SuppressWarnings("rawtypes")
	public List<Map> searchMaritalStatusList() throws Exception {
		return commonCodeDAO.searchMaritalStatusList();
	}
	
	/**
	 * @param 
	 * @return 보장자격을 조회한다.
	 * @exception Exception
	 */
	@Override
	@SuppressWarnings("rawtypes")
	public List<Map> searchGuaranteedList() throws Exception {
		return commonCodeDAO.searchGuaranteedList();
	}
	
	/**
	 * @param 
	 * @return 장애여부를 조회한다.
	 * @exception Exception
	 */
	@Override
	public List<Map> searchDisabilityList() throws Exception {
		// TODO Auto-generated method stub
		return commonCodeDAO.searchDisabilityList();
	}
	
	/**
	 * @param 
	 * @return 장애정도를 조회한다.
	 * @exception Exception
	 */
	@Override
	@SuppressWarnings("rawtypes")
	public List<Map> searchDisableDreeFgList() throws Exception {
		return commonCodeDAO.searchDisableDreeFgList();
	}
	
	/**
	 * @param 
	 * @return 장애등급을 조회한다.
	 * @exception Exception
	 */
	@Override
	@SuppressWarnings("rawtypes")
	public List<Map> searchDisableGrade(String grade) throws Exception {
		return commonCodeDAO.searchDisableGrade(grade);
	}
	
	/**
	 * @param 
	 * @return 장애등급을 조회한다.
	 * @exception Exception
	 */
	@Override
	@SuppressWarnings("rawtypes")
	public List<Map> searchOutbreakTimeFg() throws Exception {
		return commonCodeDAO.searchOutbreakTimeFg();
	}
	
	/**
	 * @param 
	 * @return 발생사유 조회한다.
	 * @exception Exception
	 */
	@Override
	@SuppressWarnings("rawtypes")
	public List<Map> searchOutbreakRsnFg() throws Exception {
		return commonCodeDAO.searchOutbreakRsnFg();
	}
	
	/**
	 * @param 
	 * @return 사례관리대상여부를 조회한다.
	 * @exception Exception
	 */
	@Override
	@SuppressWarnings("rawtypes")
	public List<Map> searchCaseManageFgList() throws Exception {
		return commonCodeDAO.searchCaseManageFgList();
	}
	
	/**
	 * @param 
	 * @return 사례관리종료사유 조회한다.
	 * @exception Exception
	 */
	@Override
	@SuppressWarnings("rawtypes")
	public List<Map> searchCaseManageEndRsnList() throws Exception {
		return commonCodeDAO.searchCaseManageEndRsnList();
	}

	@Override
	public List<Map> searchCsmnDvsnFg() throws Exception {
		// TODO Auto-generated method stub
		return commonCodeDAO.searchCsmnDvsnFg();
	}
	
	/**
	 * @param 
	 * @return 보정구 조회한다.
	 * @exception Exception
	 */
	@SuppressWarnings("rawtypes")
	public List<Map> searchAssistDvcRepair() throws Exception{
		return commonCodeDAO.searchAssistDvcRepair();
	}

	/**
	 * @param 
	 * @return 개인정보 보호책임자를 조회한다.
	 * @exception Exception
	 */
	@Override
	public Map searchPrsnInfD() throws Exception {
		// TODO Auto-generated method stub
		return commonCodeDAO.searchPrsnInfD();
	}
	
	/**
	 * @param 
	 * @return 개인정보 보호책임자를 조회한다.
	 * @exception Exception
	 */
	@Override
	public Map searchPrsnInfE() throws Exception {
		// TODO Auto-generated method stub
		return commonCodeDAO.searchPrsnInfE();
	}
	
	/**
	 * @param 
	 * @return 개인정보 보호책임자를 조회한다.
	 * @exception Exception
	 */
	@Override
	public Map searchPrsnInfF() throws Exception {
		// TODO Auto-generated method stub
		return commonCodeDAO.searchPrsnInfF();
	}
	
	/**
	 * @param 
	 * @return 개인정보 보호책임자를 조회한다.
	 * @exception Exception
	 */
	@Override
	public Map searchPrsnInfN() throws Exception {
		// TODO Auto-generated method stub
		return commonCodeDAO.searchPrsnInfN();
	}
	
	/**
	 * @param 
	 * @return 개인정보 보호책임자를 조회한다.
	 * @exception Exception
	 */
	@Override
	public Map searchPrsnInfP() throws Exception {
		// TODO Auto-generated method stub
		return commonCodeDAO.searchPrsnInfP();
	}
	
	/**
	 * @param 
	 * @return 개인정보 보호책임자를 조회한다.
	 * @exception Exception
	 */
	@Override
	public Map searchPrsnInfT() throws Exception {
		// TODO Auto-generated method stub
		return commonCodeDAO.searchPrsnInfT();
	}
}


