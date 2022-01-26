package kr.co.grit.bas.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.jdbc.BadSqlGrammarException;

import kr.co.grit.bas.dao.BasSysInfoMgmtDAO;

import org.springframework.stereotype.Service;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 사용자 관리
 * @author JJS
 */
@Service("BasSysInfoMgmtService")
public class BasSysInfoMgmtServiceImpl implements BasSysInfoMgmtService{	
	
	/**
	 * DAO 선언
	 */
	@Resource(name="BasSysInfoMgmtDAO")
	private transient BasSysInfoMgmtDAO basSysInfoMgmtDAO;
	
	@Override
	public List<EgovMap> selectUserList(EgovMap param){
		return basSysInfoMgmtDAO.selectUserList(param);
	}
	
	@Override
    public EgovMap saveSysInfo(EgovMap param){
		EgovMap returnMap = new EgovMap();
		String saveMode = (String)param.get("saveMode");
		
		try {
			if("I".equals(saveMode)){

				basSysInfoMgmtDAO.insertSysInfo(param);
				
			}else if("U".equals(saveMode)){
				basSysInfoMgmtDAO.updateSysInfo(param);
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
    public EgovMap changeSysPassword(EgovMap param){
		EgovMap returnMap = new EgovMap();
		try {
			String prePwd  = (String)param.get("prePwd");
			String oldPwd2 = (String)param.get("hiddenPwd");
			String chgPwd  = (String)param.get("pwd");
			
			String oldPwd  = basSysInfoMgmtDAO.getOldPwd(prePwd);
			
			
			if(oldPwd.equals(oldPwd2)){
				String pwd  = basSysInfoMgmtDAO.getNewPwd(chgPwd);
				param.put("pwd", pwd);
				
				basSysInfoMgmtDAO.updateSysPassword(param);
				
				returnMap.put("rtnCode", "0");
				returnMap.put("pwd", pwd);
				returnMap.put("message", "정상적으로 저장 되었습니다");
				
			}else{
				returnMap.put("rtnCode", "9");
				returnMap.put("message", "비밀번호를 다시 확인해주세요");
			}
			
		} catch (BadSqlGrammarException e) {
			returnMap.put("rtnCode", "-1");
			returnMap.put("message", "저장에 실패하였습니다.");
		}
		 
		 return returnMap;
	}
	
	@Override
    public EgovMap resetPassword(EgovMap param){
		EgovMap returnMap = new EgovMap();
		
		try {
				
			basSysInfoMgmtDAO.resetPassword(param);
			
			returnMap.put("rtnCode", "0");
			returnMap.put("message", "정상적으로 저장 되었습니다");
	
		} catch (BadSqlGrammarException e) {
			returnMap.put("rtnCode", "-1");
			returnMap.put("message", "저장에 실패하였습니다.");
		}
		 
		 return returnMap;
	}
	
	@Override
	public List<EgovMap> searchLinkcdList(EgovMap param){
		
		String userGroupCd = (String)param.get("userGroupCd");
		List<EgovMap> data = null;
		
		if("C".equals(userGroupCd)){
			data = basSysInfoMgmtDAO.searchWffcltyList(param);
		}else if("D".equals(userGroupCd)){
			data = basSysInfoMgmtDAO.searchOgnztList(param);
		}
		
		return data;
	}
	
	
}
