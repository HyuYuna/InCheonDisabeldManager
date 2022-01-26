package kr.co.grit.pgm.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import kr.co.grit.pgm.dao.PgmListDAO;

import org.springframework.stereotype.Service;

@Service("PgmListService")
public class PgmListServiceImpl implements PgmListService{

	@Resource(name="PgmListDAO")
	private transient PgmListDAO pgmListDAO;
	
	@Override
    @SuppressWarnings("rawtypes")
	public List<Map> selectProgramView(Map param) throws Exception {
		return pgmListDAO.selectProgramView(param);
	}
	
	@Override
    @SuppressWarnings("rawtypes")
	public List<Map> searchLclasView(Map param) throws Exception {
		return pgmListDAO.searchLclasView(param);
	}
	
	@Override
    @SuppressWarnings("rawtypes")
	public List<Map> searchMclasView(Map param) throws Exception {
		return pgmListDAO.searchMclasView(param);
	}

	@Override
	@SuppressWarnings("rawtypes")
	public List<Map> searchSclasView(Map param) throws Exception {
		// TODO Auto-generated method stub
		return pgmListDAO.searchSclasView(param);
	}

	@Override
	public List<Map> selectOrgnzCodeD(Map param) throws Exception {
		// TODO Auto-generated method stub
		return pgmListDAO.selectOrgnzCodeD(param);
	}

	@Override
	public List<Map> selectPmgPic(Map param) throws Exception {
		// TODO Auto-generated method stub
		return pgmListDAO.selectPmgPic(param);
	}

}
