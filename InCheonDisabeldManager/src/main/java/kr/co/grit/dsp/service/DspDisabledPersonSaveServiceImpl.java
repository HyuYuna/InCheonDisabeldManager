package kr.co.grit.dsp.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import kr.co.grit.common.util.FileUtil;
import kr.co.grit.dsp.dao.DspDisabledPersonSaveDAO;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;



import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 이용장애인 등록
 * @author JJS
 */
@Service("DspDisabledPersonSaveService")
public class DspDisabledPersonSaveServiceImpl implements DspDisabledPersonSaveService{
	
	
	/**
	 * DAO 선언
	 */
	@Resource(name="DspDisabledPersonSaveDAO")
	private transient DspDisabledPersonSaveDAO disPerSaveDAO;
	
	
	@Override
	public List<EgovMap> selectDisablePersonList(EgovMap param) {
		return disPerSaveDAO.selectDisablePersonList(param);
	}
	
	@Override
	public String selectDspsnId(){
		return disPerSaveDAO.selectDspsnId();
	}
	
	@Override
	public List<EgovMap> selectencBirthDd(EgovMap param) {
		return disPerSaveDAO.selectencBirthDd(param);
	}
		
	
	@Override
	@Transactional
    public EgovMap saveDisablePersonInfo(Map param) throws Exception {
		EgovMap returnMap = new EgovMap();
		
		String saveMode = (String)param.get("saveMode");
		String dspsnId = (String)param.get("dspsnId");
		String pictureRealNm = (String)param.get("pictureRealNm");
		
		try {
			if("I".equals(saveMode)){
				
				disPerSaveDAO.insertDisablePersonInfo(param);
				disPerSaveDAO.insertDspsnDisablity(param);
				disPerSaveDAO.insertDspsnHealth(param);
			}else if("U".equals(saveMode)){
				
				disPerSaveDAO.updateDisablePersonInfo(param);
				disPerSaveDAO.updateDspsnDisablity(param);
				disPerSaveDAO.updateDspsnHealth(param);
			}
			
			returnMap.put("rtnCode", "0");
			returnMap.put("message", "정상적으로 저장 되었습니다");
		} catch (Exception e) {
			FileUtil.fileDelete("dsp",pictureRealNm,dspsnId);
			returnMap.put("rtnCode", "-1");
			returnMap.put("message", "저장에 실패하였습니다.");
 		    TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
 		  
		}
		 
		 return returnMap;
	}

}
