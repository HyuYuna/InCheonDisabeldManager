package kr.co.grit.dsp.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import kr.co.grit.dsp.dao.DspsnInfoDAO;

/**
 * 
 * @author PKH
 */
@Service("DspsnInfoService")
public class DspsnInfoServiceImpl implements DspsnInfoService {
	
	/**
	 * DAO 선언
	 */
	@Resource(name="DspsnInfoDAO")
	private transient DspsnInfoDAO dspsnInfoDAO;
	
	/**
	 * constructor
	 */
	public DspsnInfoServiceImpl() {
		//constructor
		//unnecessaryconstructor : 생성자 없는 경우보다 pmd rule 에 검출 건수가 적음. 제외 권장
	}
	
	/**
	 * 장애인조회 실행
	 */
	@Override
	@SuppressWarnings("rawtypes")
	public List<Map> selectDspsnInfo(final EgovMap param) {
		return dspsnInfoDAO.selectDspsnInfo(param);
	}
	
}
