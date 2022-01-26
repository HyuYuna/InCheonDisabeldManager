package kr.co.grit.wfc.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import kr.co.grit.wfc.dao.WlfpyListVwDAO;

import org.springframework.stereotype.Service;

@Service("WlfpyListVwService")
public class WlfpyListVwServiceImpl implements WlfpyListVwService{

	@Resource(name = "WlfpyListVwDAO")
	private transient WlfpyListVwDAO wlfpyListVwDAO;
	
	
	@Override
	public List<Map> selectWlfpyListVw(Map param) throws Exception {
		// TODO Auto-generated method stub
		return wlfpyListVwDAO.selectWlfpyListVw(param);
	}

}
