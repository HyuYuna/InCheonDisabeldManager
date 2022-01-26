package kr.co.grit.bas.service;

import java.util.List;

import javax.annotation.Resource;

import kr.co.grit.bas.dao.BasGroupListDAO;

import org.springframework.stereotype.Service;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 단쳊호ㅚ
 * @author JJS
 */
@Service("BasGroupListService")
public class BasGroupListServiceImpl implements BasGroupListService{
	
	/**
	 * DAO 선언
	 */
	@Resource(name="BasGroupListDAO")
	private transient BasGroupListDAO groupListDAO;
	
	@Override
    @SuppressWarnings("rawtypes")
	public List<EgovMap> selectGroupList(EgovMap param){
		return groupListDAO.selectGroupList(param);
	}
	
}
