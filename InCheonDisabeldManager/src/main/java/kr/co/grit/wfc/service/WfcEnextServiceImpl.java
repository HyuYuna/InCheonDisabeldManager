package kr.co.grit.wfc.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.annotation.Resource;

import kr.co.grit.dsp.service.DspDisabledPersonSaveService;
import kr.co.grit.wfc.dao.WfcEnextMgmtDAO;

import org.springframework.jdbc.BadSqlGrammarException;
import org.springframework.stereotype.Service;

@Service("WfcEnextMgmtService")
public class WfcEnextServiceImpl implements WfcEnextMgmtService{

	@Resource(name="WfcEnextMgmtDAO")
	private transient WfcEnextMgmtDAO wfcEnextMgmtDAO;
	
	@Resource(name="DspDisabledPersonSaveService")
	private transient DspDisabledPersonSaveService disPerSaveService;
	
	@Override
	public List<Map> selectEnextMgmtList(Map param) throws Exception {
		// TODO Auto-generated method stub
		return wfcEnextMgmtDAO.selectWfcEnextMgmtList(param);
	}
	
	@Override
	public Map<String, String> saveEnextMgmtA(Map param) throws Exception {
		
		Map<String, String> returnMap = new ConcurrentHashMap<String, String>();
		
		String saveMode = (String)param.get("saveMode");
		String saveDspsn = (String)param.get("saveDspsn");
		
		String sequenceDspsnId = disPerSaveService.selectDspsnId();
		String dspsnId = (String)param.get("dspsnId");
		String insertCnstr = wfcEnextMgmtDAO.insertCnstr(param);
		if("0".equals(saveDspsn)){
			param.put("dspsnId", dspsnId);
		} else if("1".equals(saveDspsn)){
			param.put("dspsnId", sequenceDspsnId);
		}
		
		try {
				if("I".equals(saveMode)){
					// saveDspsn 1일경우 인서트
					if("0".equals(saveDspsn)){
						wfcEnextMgmtDAO.insertWfcEnextMgmt(param);
					} else if("1".equals(saveDspsn)){
						wfcEnextMgmtDAO.quickSaveDspsn(param);
						wfcEnextMgmtDAO.insertWfcEnextMgmt(param);
					}
				}else if("U".equals(saveMode)){
					// saveDspsn 1일경우 인서트
					if("0".equals(saveDspsn)){
						wfcEnextMgmtDAO.updateWfcEnextMgmtA(param);
					} else if("1".equals(saveDspsn)){
						wfcEnextMgmtDAO.quickSaveDspsn(param);
						wfcEnextMgmtDAO.updateWfcEnextMgmtA(param);
					}
				}
			
			returnMap.put("rtnCode", "0");
			returnMap.put("message", "정상적으로 저장 되었습니다");
		} catch (BadSqlGrammarException e) {
			e.printStackTrace();
			
			returnMap.put("rtnCode", "-1");
			returnMap.put("message", "저장에 실패하였습니다.");
		}
		 
		 return returnMap;
	}
	
	@Override
	public List<Map> selectAjaxDspsn(Map param) throws Exception {
		// TODO Auto-generated method stub
		return wfcEnextMgmtDAO.selectAjaxDspsnList(param);
	}

	@Override
	public Map selectFcltyList(String link) throws Exception {
		// TODO Auto-generated method stub
		return wfcEnextMgmtDAO.selectFcltyList(link);
	}

	@Override
	public String selectGroupType(String link) throws Exception {
		// TODO Auto-generated method stub
		return wfcEnextMgmtDAO.selectGroupType(link);
	}

	@Override
	public List<Map> selectCheckDspsn(Map param) throws Exception {
		// TODO Auto-generated method stub
		return wfcEnextMgmtDAO.selectCheckDspsn(param);
	}

	@Override
	public int insertCmprs(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return wfcEnextMgmtDAO.insertCmprs(param);
	}

	@Override
	public int admCmp(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return wfcEnextMgmtDAO.admCmp(param);
	}

	@Override
	public int blindHandling(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return wfcEnextMgmtDAO.blindHandling(param);
	}
	
}
