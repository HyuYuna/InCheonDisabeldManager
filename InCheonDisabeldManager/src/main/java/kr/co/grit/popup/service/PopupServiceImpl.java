package kr.co.grit.popup.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import kr.co.grit.popup.dao.PopupDAO;

import org.springframework.stereotype.Service;

@Service("PopupService")
public class PopupServiceImpl implements PopupService{

	@Resource(name="PopupDAO")
	private PopupDAO popupDAO;
	
	@Override
    @SuppressWarnings("rawtypes")
	public List<Map> searchOgnztList(Map param) throws Exception {
		return popupDAO.searchOgnztList(param);
	}
	
	@Override
    @SuppressWarnings("rawtypes")
	public List<Map> searchWffcltyList(Map param) throws Exception {
		return popupDAO.searchWffcltyList(param);
	}

	@Override
	public List<Map> searchDspsnList(Map param) throws Exception {
		// TODO Auto-generated method stub
		return popupDAO.searchDspsnList(param);
	}
	
	@Override
	public List<Map> searchDspsnList2(Map param) throws Exception {
		// TODO Auto-generated method stub
		return popupDAO.searchDspsnList2(param);
	}
	
}
