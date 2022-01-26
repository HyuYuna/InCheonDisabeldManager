package kr.co.grit.bas.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.springframework.jdbc.BadSqlGrammarException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.multipart.MultipartFile;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import kr.co.grit.bas.dao.BasDisabiltyPreSaveDAO;
import kr.co.grit.bas.vo.BasDisabiltyPreSaveVO;

/**
 * 장애정도별 현황 등록
 * @author JJS
 */
@Service("BasDisabiltyPreSaveService")
public class BasDisabiltyPreSaveServiceImpl implements BasDisabiltyPreSaveService{
	
	/**
	 * DAO 선언
	 */
	@Resource(name="BasDisabiltyPreSaveDAO")
	private transient BasDisabiltyPreSaveDAO disPreSaveDAO;
	

	@Override
	public EgovMap disablePreExcelUpload(MultipartFile file) {
		
		EgovMap returnMap = new EgovMap();
		List<EgovMap> errorCheck = new ArrayList<EgovMap>();
		
		List<BasDisabiltyPreSaveVO> list = new ArrayList<BasDisabiltyPreSaveVO>();
		
        try {
        	Workbook workbook = null;
        	Sheet sheet = null;
        	Row row = null;
        	Cell cell = null;
        	
        	OPCPackage opcPackage = OPCPackage.open(file.getInputStream());
        	workbook = WorkbookFactory.create(opcPackage);
        	
        	// 첫번째 시트 불러오기
        	sheet  = workbook.getSheetAt(0);
        	
        	
            for(int i=2; i< sheet.getLastRowNum() +1; i++) {
            	BasDisabiltyPreSaveVO excelVo = new BasDisabiltyPreSaveVO();
                row = sheet.getRow(i);
                
                // 행이 존재하기 않으면 패스
                if(null == row) {
                    continue;
                }else{
                	
	                
	                cell = row.getCell(0);
	                cell.setCellType(cell.CELL_TYPE_STRING);
	                if(null == cell || "".equals(cell.getStringCellValue())){
	                	//throw new Exception();
	                	continue; 
	                }else{
                		excelVo.setYyyymm(cell.getStringCellValue());
	                }
	               
	                cell = row.getCell(1);
	                cell.setCellType(cell.CELL_TYPE_STRING);
	                if(null == cell || "".equals(cell.getStringCellValue())){
	                	//throw new Exception();
	                	continue; 
	                }else{
	                	excelVo.setGuNm(cell.getStringCellValue());
	                }
	                
	                cell = row.getCell(2);
	                cell.setCellType(cell.CELL_TYPE_STRING);
	                if(null == cell || "".equals(cell.getStringCellValue())){
	                	//throw new Exception();
	                	continue; 
	                }else{
	                	excelVo.setDisableTp(cell.getStringCellValue());
	                }
	                
	                cell = row.getCell(7);
	                cell.setCellType(cell.CELL_TYPE_STRING);
	                if(null == cell || "".equals(cell.getStringCellValue())){
	                	//throw new Exception();
	                	continue; 
	                }else{
	                	excelVo.setMaleSeriousCnt(cell.getStringCellValue());
	                }
	                
	                cell = row.getCell(8);
	                cell.setCellType(cell.CELL_TYPE_STRING);
	                if(null == cell || "".equals(cell.getStringCellValue())){
	                	//throw new Exception();
	                	continue; 
	                }else{
	                	excelVo.setFemaleSeriousCnt(cell.getStringCellValue());
	                }
	                
	                cell = row.getCell(10);
	                cell.setCellType(cell.CELL_TYPE_STRING);
	                if(null == cell || "".equals(cell.getStringCellValue())){
	                	//throw new Exception();
	                	continue; 
	                }else{
	                	excelVo.setMaleModerateCnt(cell.getStringCellValue());
	                }
	                
	                cell = row.getCell(11);
	                cell.setCellType(cell.CELL_TYPE_STRING);
	                if(null == cell || "".equals(cell.getStringCellValue())){
	                	//throw new Exception();
	                	continue; 
	                }else{
	                	excelVo.setFemaleModerateCnt(cell.getStringCellValue());
	                }
	                
	                list.add(excelVo);
	                
	                }
	            }
            	
                // temp테이블 삭제
            	disPreSaveDAO.deleteTempDisablePre();
            		 
	            // temp테이블에 저장
	           for (BasDisabiltyPreSaveVO excelVO : list) {
	        	   disPreSaveDAO.insertDisalblePre(excelVO);
				}
	            
	            errorCheck =  disPreSaveDAO.selectErrorList();
	            if(errorCheck.isEmpty()){
	            	returnMap.put("rtnCode", "0");
		            returnMap.put("message", "정상적으로 저장 되었습니다");
            	}else{
            		returnMap.put("rtnCode", "-1");
       			    returnMap.put("message", "저장에 실패하였습니다.");	
            	}
            	  
            	 
        } catch (Exception e) {
        	 returnMap.put("rtnCode", "-2");
			 returnMap.put("message", "엑셀업로드에 실패하였습니다.");
        }
       
        
        return returnMap;
	}
	
	
	@Override
	public List<EgovMap> selectExcelTempList() {
		return disPreSaveDAO.selectExcelTempList();
	}
	
	@Override
	public List<EgovMap> selectExcelTempErrorList() {
		return disPreSaveDAO.selectErrorList();
	}
	
	
	@Override
	@Transactional
    public EgovMap confirmDisablePre(List<EgovMap> param){
		EgovMap returnMap = new EgovMap();
		
		String delyyyymm = (String) param.get(0).get("yyyymm");
		
		try {
			
			// 기존 데이터 삭제
			disPreSaveDAO.deleteDisablePre(delyyyymm);
			
			
			// 저장
			for (int i = 0; i < param.size(); i++) {
				disPreSaveDAO.confirmDisablePre(param.get(i));
			}
			
			disPreSaveDAO.deleteTempDisablePre();
			
			returnMap.put("rtnCode", "0");
			returnMap.put("message", "정상적으로 저장 되었습니다");
		} catch (BadSqlGrammarException e) {
			returnMap.put("rtnCode", "-1");
			returnMap.put("message", "저장에 실패하였습니다.");
 		    TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		 
		 return returnMap;
	}
}
