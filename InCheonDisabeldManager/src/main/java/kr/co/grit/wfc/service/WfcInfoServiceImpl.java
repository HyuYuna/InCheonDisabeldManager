package kr.co.grit.wfc.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.BadSqlGrammarException;
import org.springframework.stereotype.Service;

import kr.co.grit.wfc.dao.WfcInfoDAO;

/**
 * 복지시설 조회
 * @author PKH
 */
@Service("WfcInfoService")
public class WfcInfoServiceImpl implements WfcInfoService {

	/**
	 * 로그 선언
	 */
	private static final Logger LOGGER = LoggerFactory.getLogger(WfcInfoServiceImpl.class);
	
	/**
	 * DAO 선언
	 */
	@Resource(name="WfcInfoDAO")
	private transient WfcInfoDAO wfcInfoDAO;
	
	/**
	 * constructor
	 */
	public WfcInfoServiceImpl() {
		//constructor
		//unnecessaryconstructor : 생성자 없는 경우보다 pmd rule 에 검출 건수가 적음. 제외 권장
	}
	
	@Override
	@SuppressWarnings("rawtypes")
	public List<Map> selectWfcInfo(final Map param) {
		
		try {
			final String schGovsubyFg = String.valueOf(param.get("schGovsubyFg"));
			final String schCitsubyFg = String.valueOf(param.get("schCitsubyFg"));
			final String schGusubyFg = String.valueOf(param.get("schGusubyFg"));
	
			final List<String> fgArr = new ArrayList<String>();
			
			if("1".equals(schGovsubyFg)) {
				fgArr.add( "B.GOVSUBY_FG=1");
			}
			if("1".equals(schCitsubyFg)) {
				fgArr.add("B.CITSUBY_FG=1");
			}
			if("1".equals(schGusubyFg)) {
				fgArr.add("B.GUSUBY_FG=1");
			}

			param.put("fgArr", fgArr);

		} catch(BadSqlGrammarException e) {
			LOGGER.info(e.getMessage());
		}
		
		return wfcInfoDAO.selectWfcInfo(param);
	}
	
	@Override
	@SuppressWarnings("rawtypes")
	public List<Map> selectWfcInfoDis(final Map param) {
		return wfcInfoDAO.selectWfcInfoDis(param);
	}
	
	
}
