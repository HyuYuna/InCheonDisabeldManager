package kr.co.grit.wfc.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 
 * @author JJS
 */
@Repository("WfcDetailDAO")
public class WfcDetailDAO {
	
	/**
	 * resource 선언
	 */
	@Resource(name="sqlSessionTemplate")
	private transient SqlSessionTemplate sqlSession;
	
	public EgovMap selectWffcltyBaseList(EgovMap param)   {
		return sqlSession.selectOne("WfcDetailDAO.selectWffcltyBaseList", param);
	}
	
	public List<EgovMap> selectWffcltyDetailList(EgovMap param)   {
		return sqlSession.selectList("WfcDetailDAO.selectWffcltyDetailList", param);
	}
	
	public List<EgovMap> selectwffcltyDisableTpList(EgovMap param)   {
		return sqlSession.selectList("WfcDetailDAO.selectwffcltyDisableTpList", param);
	}
	
	public List<EgovMap> selectwffcltyPictureList(EgovMap param)   {
		return sqlSession.selectList("WfcDetailDAO.selectwffcltyPictureList", param);
	}
	
	public List<EgovMap> selectWffcltyList(EgovMap param)   {
		return sqlSession.selectList("WfcDetailDAO.selectWffcltyList", param);
	}
	
	
	public void insertWfcDetail(Map wffDetailList)   {
		sqlSession.insert("WfcDetailDAO.insertWfcDetail", wffDetailList);
	}
	
	public void updateWfcDetail(Map wffDetailList)   {
		sqlSession.update("WfcDetailDAO.updateWfcDetail", wffDetailList);
	}
	
	public void insertWfcDetail2(Map wffDetailList)   {
		sqlSession.insert("WfcDetailDAO.insertWfcDetail2", wffDetailList);
	}
	
	public void updateWfcDetail2(Map wffDetailList)   {
		sqlSession.update("WfcDetailDAO.updateWfcDetail2", wffDetailList);
	}
	
	public void insertWfcDetail3(Map wffDetailList)   {
		sqlSession.insert("WfcDetailDAO.insertWfcDetail3", wffDetailList);
	}
	
	public void updateWfcDetail3(Map wffDetailList)  {
		sqlSession.update("WfcDetailDAO.updateWfcDetail3", wffDetailList);
	}
	
	public void insertWfcDetail4(Map wffDetailList)   {
		sqlSession.insert("WfcDetailDAO.insertWfcDetail4", wffDetailList);
	}
	
	public void updateWfcDetail4(Map wffDetailList)   {
		sqlSession.update("WfcDetailDAO.updateWfcDetail4", wffDetailList);
	}
	
	public void insertWfcDetail5(Map wffDetailList)   {
		sqlSession.insert("WfcDetailDAO.insertWfcDetail5", wffDetailList);
	}
	
	public void updateWfcDetail5(Map wffDetailList)   {
		sqlSession.update("WfcDetailDAO.updateWfcDetail5", wffDetailList);
	}
	
	public void insertWfcDetail6(Map wffDetailList)   {
		sqlSession.insert("WfcDetailDAO.insertWfcDetail6", wffDetailList);
	}
	
	public void updateWfcDetail6(Map wffDetailList)  {
		sqlSession.update("WfcDetailDAO.updateWfcDetail6", wffDetailList);
	}
	
	public void insertWfcDetail7(Map wffDetailList)  {
		sqlSession.insert("WfcDetailDAO.insertWfcDetail7", wffDetailList);
	}
	
	public void updateWfcDetail7(Map wffDetailList)  {
		sqlSession.update("WfcDetailDAO.updateWfcDetail7", wffDetailList);
	}
	
	public void insertWfcDetail8(Map wffDetailList)  {
		sqlSession.insert("WfcDetailDAO.insertWfcDetail8", wffDetailList);
	}
	
	public void updateWfcDetail8(Map wffDetailList) {
		sqlSession.update("WfcDetailDAO.updateWfcDetail8", wffDetailList);
	}
	
	public void insertWfcDetail9(Map wffDetailList)  {
		sqlSession.insert("WfcDetailDAO.insertWfcDetail9", wffDetailList);
	}
	
	public void updateWfcDetail9(Map wffDetailList) {
		sqlSession.update("WfcDetailDAO.updateWfcDetail9", wffDetailList);
	}
	
	public void insertWfcDetail10(Map wffDetailList) {
		sqlSession.insert("WfcDetailDAO.insertWfcDetail10", wffDetailList);
	}
	
	public void updateWfcDetail10(Map wffDetailList)  {
		sqlSession.update("WfcDetailDAO.updateWfcDetail10", wffDetailList);
	}
	
	public void insertWfcDetail11(Map wffDetailList) {
		sqlSession.insert("WfcDetailDAO.insertWfcDetail11", wffDetailList);
	}
	
	public void updateWfcDetail11(Map wffDetailList) {
		sqlSession.update("WfcDetailDAO.updateWfcDetail11", wffDetailList);
	}
	
	public void insertWfcDetail12(Map wffDetailList) {
		sqlSession.insert("WfcDetailDAO.insertWfcDetail12", wffDetailList);
	}
	
	public void updateWfcDetail12(Map wffDetailList) {
		sqlSession.update("WfcDetailDAO.updateWfcDetail12", wffDetailList);
	}
	
	public void insertWfcDetail13(Map wffDetailList) {
		sqlSession.insert("WfcDetailDAO.insertWfcDetail13", wffDetailList);
	}
	
	public void updateWfcDetail13(Map wffDetailList) {
		sqlSession.update("WfcDetailDAO.updateWfcDetail13", wffDetailList);
	}
	
	public void insertDisableTp(Map disableTpList) {
		sqlSession.insert("WfcDetailDAO.insertDisableTp", disableTpList);
	}	
	
	public void updateDisableTp(Map disableTpList) {
		sqlSession.update("WfcDetailDAO.updateDisableTp", disableTpList);
	}
	
	public void deleteDisableTp(Map disableTpList) {
		sqlSession.delete("WfcDetailDAO.deleteDisableTp", disableTpList);
	}	
	
	public void insertImg(Map imgList) {
		sqlSession.insert("WfcDetailDAO.insertImg", imgList);
	}	
	
	public void updateImg(Map imgList)  {
		sqlSession.update("WfcDetailDAO.updateImg", imgList);
	}
	
	public void deleteImg(Map imgList) {
		sqlSession.delete("WfcDetailDAO.deleteImg", imgList);
	}
	
}
