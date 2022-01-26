package kr.co.grit.pgm.service;

import java.util.List;

import javax.annotation.Resource;

import kr.co.grit.pgm.dao.PgmAssistDvcRepairListDAO;

import org.springframework.stereotype.Service;

import egovframework.rte.psl.dataaccess.util.EgovMap;


/**
 * 보장구 수리내역 조회
 * @author JJS
 */
@Service("PgmAssistDvcRepairListService")
public class PgmAssistDvcRepairListServiceImpl implements PgmAssistDvcRepairListService{

	/**
	 * DAO 선언
	 */
	@Resource(name="PgmAssistDvcRepairListDAO")
	private transient PgmAssistDvcRepairListDAO pgmAssDvcReListDAO;
	
	@Override
	public List<EgovMap> selectAssDcvRepairList(EgovMap param) {
		return pgmAssDvcReListDAO.selectAssDcvRepairList(param);
	}	
	
	@Override
	public List<EgovMap> searchAssDcvDspsn(EgovMap param) {
		return pgmAssDvcReListDAO.searchAssDcvDspsn(param);
	}
	
	@Override
	public List<EgovMap> searchAssDvcRepWffcltyList() {
		return pgmAssDvcReListDAO.searcAssDvcRepWffcltyList();
	
	}
	
	@Override
	public List<EgovMap> searchAssDvcRepWffcltyList2(EgovMap param) {
		return pgmAssDvcReListDAO.searcAssDvcRepWffcltyList2(param);
	
	}
	
}
