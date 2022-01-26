package kr.co.grit.pgm.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.annotation.Resource;

import kr.co.grit.common.dao.CommonMainDAO;
import kr.co.grit.common.util.FileUtil;
import kr.co.grit.pgm.dao.PgmMgmtDAO;

import org.junit.experimental.max.CouldNotReadCoreException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.BadSqlGrammarException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("PgmMgmtService")
public class PgmMgmtServiceImpl implements PgmMgmtService{

	@Resource(name="PgmMgmtDAO")
	private transient PgmMgmtDAO pgmMgmtDAO;
	
	@Resource(name="commonMainDAO")
	private transient CommonMainDAO commonMainDAO;
	
	@Override
    @SuppressWarnings("rawtypes")
	public List<Map> selectProgramList(Map param) throws Exception {
		return pgmMgmtDAO.selectProgramList(param);
	}
	
	@Override
    @SuppressWarnings("rawtypes")
	public List<Map> searchLclasList(Map param) throws Exception {
		return pgmMgmtDAO.searchLclasList(param);
	}
	
	@Override
    @SuppressWarnings("rawtypes")
	public List<Map> searchMclasList(Map param) throws Exception {
		return pgmMgmtDAO.searchMclasList(param);
	}

	@Override
	public List<Map> searchSclasList(Map param) throws Exception {
		// TODO Auto-generated method stub
		return pgmMgmtDAO.searchSclasList(param);
	}

	@Override
	public Map<String, String> savePgmMgmt(Map param) throws Exception {
		// TODO Auto-generated method stub
		Map<String, String> returnMap = new ConcurrentHashMap<String, String>();
				
		String saveMode = (String)param.get("saveMode");
				
		try {
			if("I".equals(saveMode)){
				pgmMgmtDAO.insertPgmMgmt(param);
						
			}else if("U".equals(saveMode)){
				pgmMgmtDAO.updatePgmMgmt(param);
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
	public List<Map> selectProgramPictureList(Map param) throws Exception {
		// TODO Auto-generated method stub
		return pgmMgmtDAO.selectProgramPictureList(param);
	}
	
	@Override
	@Transactional
    public Map<String, String> saveImg(List<Map<String, Object>> list) throws Exception {
		Map<String, String> returnMap = new ConcurrentHashMap<String, String>();
		
		try {
			for (int i = 0; i < list.size(); i++) {
				String stats = (String) list.get(i).get("stats");
				if("I".equals(stats)){
					pgmMgmtDAO.insertImg(list.get(i));
				}else if("U".equals(stats)){ 
					pgmMgmtDAO.updateImg(list.get(i));
				}else if("D".equals(stats)){
					pgmMgmtDAO.deleteImg(list.get(i));
				}
			}
			
			returnMap.put("rtnCode", "0");
			returnMap.put("message", "정상적으로 저장 되었습니다");
		}catch (BadSqlGrammarException e) {
			e.printStackTrace();
		}
		
		return returnMap;
	}

	@Override
	public String selectProgramChaban(String linkCd) throws Exception {
		// TODO Auto-generated method stub
		return pgmMgmtDAO.selectProgramChaban(linkCd);
	}
	
	@Transactional
	@Override
	public Map deleteProgramMgmt(Map param) throws Exception {
		
		Map returnMap = new ConcurrentHashMap();
		// TODO Auto-generated method stub
		try{
			int countNm = pgmMgmtDAO.selectProgramUseStatusCnt(param);
			
			if(countNm > 0){
				returnMap.put("rtnCode", 1);
				returnMap.put("message", "등록된 프로그램 운영형황이 있어 삭제 할수 없습니다.");
			}
			else{
				pgmMgmtDAO.deleteProgramMgmt(param);
				pgmMgmtDAO.deleteProgramPic(param);
				commonMainDAO.deleteLogInsert(param);
				
				String linkCd 	 = (String) param.get("linkCd");
				String programCd = (String) param.get("programCd");
				
				FileUtil.pgmFolderDelete(linkCd, programCd);
				
				returnMap.put("rtnCode", 0);
				returnMap.put("message", "정상적으로 삭제되었습니다.");
			}
		} catch(BadSqlGrammarException e){
			e.printStackTrace();
			returnMap.put("rtnCode", 1);
			returnMap.put("message", "등록된 프로그램 운영형황이 있어 삭제 할수 없습니다.");
		}
		return returnMap;
	}
}
