package kr.co.grit.pgm.service;

import java.util.List;

import javax.annotation.Resource;

import kr.co.grit.dsp.service.DspDisabledPersonSaveService;
import kr.co.grit.pgm.dao.PgmAssistDvcRepairMgmtDAO;

import org.springframework.jdbc.BadSqlGrammarException;
import org.springframework.stereotype.Service;

import egovframework.rte.psl.dataaccess.util.EgovMap;


/**
 * 보장구 수리내역 관리
 * @author JJS
 */
@Service("PgmAssistDvcRepairMgmtService")
public class PgmAssistDvcRepairMgmtServiceImpl implements PgmAssistDvcRepairMgmtService{

	/**
	 * DAO 선언
	 */
	@Resource(name="PgmAssistDvcRepairMgmtDAO")
	private transient PgmAssistDvcRepairMgmtDAO pgmAssDvcMgmtDAO;
	
	@Resource(name="DspDisabledPersonSaveService")
	private transient DspDisabledPersonSaveService disPerSaveService;
	
	@Override
	public List<EgovMap> selectAssistDcvRepairList(EgovMap param) {
		return pgmAssDvcMgmtDAO.selectAssistDcvRepairList(param);
	}
	
	@Override
    public EgovMap saveAssistDvcRepair(EgovMap param) {
		EgovMap returnMap = new EgovMap();
		
		String saveMode = (String)param.get("saveMode");
		String saveDspsn = (String)param.get("saveDspsn");
		
		String sequenceDspsnId = disPerSaveService.selectDspsnId();
		String dspsnId = (String)param.get("dspsnId");
		
		if("0".equals(saveDspsn)){
			param.put("dspsnId", dspsnId);
		} else if("1".equals(saveDspsn)){
			param.put("dspsnId", sequenceDspsnId);
		}
		
		try {
			if("I".equals(saveMode)){
				if("0".equals(saveDspsn)){
					pgmAssDvcMgmtDAO.insertAssistDvcRepair(param);
				} else if("1".equals(saveDspsn)){
					pgmAssDvcMgmtDAO.saveQuickDspsn(param);
					pgmAssDvcMgmtDAO.insertAssistDvcRepair(param);
				}
				
			}else if("U".equals(saveMode)){
				if("0".equals(saveDspsn)){
					pgmAssDvcMgmtDAO.upadateAssistDvcRepair(param);
				} else if("1".equals(saveDspsn)){
					pgmAssDvcMgmtDAO.saveQuickDspsn(param);
					pgmAssDvcMgmtDAO.upadateAssistDvcRepair(param);
				}
			}
			
			returnMap.put("rtnCode", "0");
			returnMap.put("message", "정상적으로 저장 되었습니다");
			
		} catch (BadSqlGrammarException e) {
			returnMap.put("rtnCode", "-1");
			returnMap.put("message", "저장에 실패하였습니다.");
		}
		 
		 return returnMap;
	}
	
	@Override
	public List<EgovMap> searchAssDspsn(EgovMap param) {
		return pgmAssDvcMgmtDAO.searchAssDspsn(param);
	
	}
	
	@Override
	public List<EgovMap> searchAssDspsn2(EgovMap param) {
		return pgmAssDvcMgmtDAO.selectDspsnCheck(param);
	
	}

	@Override
	public List<EgovMap> selectDspsnCheck(EgovMap param) {
		// TODO Auto-generated method stub
		return pgmAssDvcMgmtDAO.selectDspsnCheck(param);
	}

	@Override
	public int selectSaveCnt(EgovMap param) {
		return pgmAssDvcMgmtDAO.selectSaveCnt(param);
	}
	
}
