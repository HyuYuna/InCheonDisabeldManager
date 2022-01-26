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
import kr.co.grit.bas.dao.BasDisabiltyAgeSaveDAO;
import kr.co.grit.bas.vo.BasDisabiltyAgeSaveVO;

/**
 * 장애인연령별 현황 등록
 * @author JJS
 */
@Service("BasDisabiltyAgeSaveService")
public class BasDisabiltyAgeSaveServiceImpl implements BasDisabiltyAgeSaveService{
	
	/**
	 * DAO 선언
	 */
	@Resource(name="BasDisabiltyAgeSaveDAO")
	private transient BasDisabiltyAgeSaveDAO disAgeSaveDAO;

	@Override
	public EgovMap disableAgeExcelUpload(MultipartFile file) {
		
		EgovMap returnMap = new EgovMap();
		List<EgovMap> errorCheck = new ArrayList<EgovMap>();
		
		List<BasDisabiltyAgeSaveVO> list = new ArrayList<BasDisabiltyAgeSaveVO>();
		
        try {
        	Workbook workbook = null;
        	Sheet sheet = null;
        	Row row = null;
        	Cell cell = null;
        	
        	OPCPackage opcPackage = OPCPackage.open(file.getInputStream());
        	workbook = WorkbookFactory.create(opcPackage);
        	
        	// 첫번째 시트 불러오기
        	sheet  = workbook.getSheetAt(0);
        	
        	for(int i=2; i< sheet.getLastRowNum()+1; i++) {
            	BasDisabiltyAgeSaveVO excelVo = new BasDisabiltyAgeSaveVO();
                row = sheet.getRow(i);
                
                // 행이 존재하기 않으면 패스
                if(null == row) {
                    continue;
                }else{
	                
                	// 년월
	                cell = row.getCell(0);
	                cell.setCellType(cell.CELL_TYPE_STRING);
	                if(null == cell || "".equals(cell.getStringCellValue())){
	                	continue;
	                }else{
                		excelVo.setYyyymm(cell.getStringCellValue());
	                }
	               
	                // 군구
	                cell = row.getCell(1);
	                cell.setCellType(cell.CELL_TYPE_STRING);
	                if(null == cell || "".equals(cell.getStringCellValue())){
	               	    returnMap.put("rtnCode", "-2");
	    			    returnMap.put("message", (i+1) + "번째 줄에 군구는 필수 입력입니다.");
	    			    return returnMap; 
	                }else{
	                	excelVo.setGuNm(cell.getStringCellValue());
	                }
	                
	                // 나이
	                cell = row.getCell(2);
	                cell.setCellType(cell.CELL_TYPE_STRING);
	                if(null == cell || "".equals(cell.getStringCellValue())){
	               	    returnMap.put("rtnCode", "-2");
	    			    returnMap.put("message", (i+1) + "번째 줄에 나이는 필수 입력입니다.");
	    			    return returnMap; 
	                }else{
	                	excelVo.setAge(cell.getStringCellValue());
	                }
	              
	                // 지체
	                excelVo.setDisableTp01("지체");
	                cell = row.getCell(7);
	                cell.setCellType(cell.CELL_TYPE_STRING);
	                if(null == cell || "".equals(cell.getStringCellValue())){
	                	continue; 
	                }else{
	                	excelVo.setMale01Cnt(cell.getStringCellValue());
	                }
	                cell = row.getCell(8);
	                cell.setCellType(cell.CELL_TYPE_STRING);
	                if(null == cell || "".equals(cell.getStringCellValue())){
	                	continue; 
	                }else{
	                	excelVo.setFemale01Cnt(cell.getStringCellValue());
	                }
	                
	                // 시각
	                excelVo.setDisableTp02("시각");
	                cell = row.getCell(10);
	                cell.setCellType(cell.CELL_TYPE_STRING);
	                if(null == cell || "".equals(cell.getStringCellValue())){
	                	continue; 
	                }else{
	                	excelVo.setMale02Cnt(cell.getStringCellValue());
	                }
	                cell = row.getCell(11);
	                cell.setCellType(cell.CELL_TYPE_STRING);
	                if(null == cell || "".equals(cell.getStringCellValue())){
	                	continue; 
	                }else{
	                	excelVo.setFemale02Cnt(cell.getStringCellValue());
	                }
	                
	                // 청각
	                excelVo.setDisableTp03("청각");
	                cell = row.getCell(13);
	                cell.setCellType(cell.CELL_TYPE_STRING);
	                if(null == cell || "".equals(cell.getStringCellValue())){
	                	continue; 
	                }else{
	                	excelVo.setMale03Cnt(cell.getStringCellValue());
	                }
	                cell = row.getCell(14);
	                cell.setCellType(cell.CELL_TYPE_STRING);
	                if(null == cell || "".equals(cell.getStringCellValue())){
	                	continue; 
	                }else{
	                	excelVo.setFemale03Cnt(cell.getStringCellValue());
	                }
	                
	                // 언어
	                excelVo.setDisableTp04("언어");
	                cell = row.getCell(16);
	                cell.setCellType(cell.CELL_TYPE_STRING);
	                if(null == cell || "".equals(cell.getStringCellValue())){
	                	continue; 
	                }else{
	                	excelVo.setMale04Cnt(cell.getStringCellValue());
	                }
	                cell = row.getCell(17);
	                cell.setCellType(cell.CELL_TYPE_STRING);
	                if(null == cell || "".equals(cell.getStringCellValue())){
	                	continue; 
	                }else{
	                	excelVo.setFemale04Cnt(cell.getStringCellValue());
	                }
	              
	                // 지적
	                excelVo.setDisableTp05("지적");
	                cell = row.getCell(19);
	                cell.setCellType(cell.CELL_TYPE_STRING);
	                if(null == cell || "".equals(cell.getStringCellValue())){
	                	continue; 
	                }else{
	                	excelVo.setMale05Cnt(cell.getStringCellValue());
	                }
	                cell = row.getCell(20);
	                cell.setCellType(cell.CELL_TYPE_STRING);
	                if(null == cell || "".equals(cell.getStringCellValue())){
	                	continue; 
	                }else{
	                	excelVo.setFemale05Cnt(cell.getStringCellValue());
	                }
	                
	                // 뇌병변
	                excelVo.setDisableTp06("뇌병변");
	                cell = row.getCell(22);
	                cell.setCellType(cell.CELL_TYPE_STRING);
	                if(null == cell || "".equals(cell.getStringCellValue())){
	                	continue; 
	                }else{
	                	excelVo.setMale06Cnt(cell.getStringCellValue());
	                }
	                cell = row.getCell(23);
	                cell.setCellType(cell.CELL_TYPE_STRING);
	                if(null == cell || "".equals(cell.getStringCellValue())){
	                	continue; 
	                }else{
	                	excelVo.setFemale06Cnt(cell.getStringCellValue());
	                }
	                
	                // 자폐
	                excelVo.setDisableTp07("자폐성");
	                cell = row.getCell(25);
	                cell.setCellType(cell.CELL_TYPE_STRING);
	                if(null == cell || "".equals(cell.getStringCellValue())){
	                	continue; 
	                }else{
	                	excelVo.setMale07Cnt(cell.getStringCellValue());
	                }
	                cell = row.getCell(26);
	                cell.setCellType(cell.CELL_TYPE_STRING);
	                if(null == cell || "".equals(cell.getStringCellValue())){
	                	continue; 
	                }else{
	                	excelVo.setFemale07Cnt(cell.getStringCellValue());
	                }
	                
	                // 정신
	                excelVo.setDisableTp08("정신");
	                cell = row.getCell(28);
	                cell.setCellType(cell.CELL_TYPE_STRING);
	                if(null == cell || "".equals(cell.getStringCellValue())){
	                	continue; 
	                }else{
	                	excelVo.setMale08Cnt(cell.getStringCellValue());
	                }
	                cell = row.getCell(29);
	                cell.setCellType(cell.CELL_TYPE_STRING);
	                if(null == cell || "".equals(cell.getStringCellValue())){
	                	continue; 
	                }else{
	                	excelVo.setFemale08Cnt(cell.getStringCellValue());
	                }
	                
	                // 신장
	                excelVo.setDisableTp09("신장");
	                cell = row.getCell(31);
	                cell.setCellType(cell.CELL_TYPE_STRING);
	                if(null == cell || "".equals(cell.getStringCellValue())){
	                	continue; 
	                }else{
	                	excelVo.setMale09Cnt(cell.getStringCellValue());
	                }
	                cell = row.getCell(32);
	                cell.setCellType(cell.CELL_TYPE_STRING);
	                if(null == cell || "".equals(cell.getStringCellValue())){
	                	continue; 
	                }else{
	                	excelVo.setFemale09Cnt(cell.getStringCellValue());
	                }
	                
	                // 심장
	                excelVo.setDisableTp10("심장");
	                cell = row.getCell(34);
	                cell.setCellType(cell.CELL_TYPE_STRING);
	                if(null == cell || "".equals(cell.getStringCellValue())){
	                	continue; 
	                }else{
	                	excelVo.setMale10Cnt(cell.getStringCellValue());
	                }
	                cell = row.getCell(35);
	                cell.setCellType(cell.CELL_TYPE_STRING);
	                if(null == cell || "".equals(cell.getStringCellValue())){
	                	continue; 
	                }else{
	                	excelVo.setFemale10Cnt(cell.getStringCellValue());
	                }
	                
	                // 호흡기
	                excelVo.setDisableTp11("호흡기");
	                cell = row.getCell(37);
	                cell.setCellType(cell.CELL_TYPE_STRING);
	                if(null == cell || "".equals(cell.getStringCellValue())){
	                	continue; 
	                }else{
	                	excelVo.setMale11Cnt(cell.getStringCellValue());
	                }
	                cell = row.getCell(38);
	                cell.setCellType(cell.CELL_TYPE_STRING);
	                if(null == cell || "".equals(cell.getStringCellValue())){
	                	continue; 
	                }else{
	                	excelVo.setFemale11Cnt(cell.getStringCellValue());
	                }
	                
	                // 간
	                excelVo.setDisableTp12("간");
	                cell = row.getCell(40);
	                cell.setCellType(cell.CELL_TYPE_STRING);
	                if(null == cell || "".equals(cell.getStringCellValue())){
	                	continue; 
	                }else{
	                	excelVo.setMale12Cnt(cell.getStringCellValue());
	                }
	                cell = row.getCell(41);
	                cell.setCellType(cell.CELL_TYPE_STRING);
	                if(null == cell || "".equals(cell.getStringCellValue())){
	                	continue; 
	                }else{
	                	excelVo.setFemale12Cnt(cell.getStringCellValue());
	                }
	                
	                // 안면
	                excelVo.setDisableTp13("안면");
	                cell = row.getCell(43);
	                cell.setCellType(cell.CELL_TYPE_STRING);
	                if(null == cell || "".equals(cell.getStringCellValue())){
	                	continue; 
	                }else{
	                	excelVo.setMale13Cnt(cell.getStringCellValue());
	                }
	                cell = row.getCell(44);
	                cell.setCellType(cell.CELL_TYPE_STRING);
	                if(null == cell || "".equals(cell.getStringCellValue())){
	                	continue; 
	                }else{
	                	excelVo.setFemale13Cnt(cell.getStringCellValue());
	                }
	                
	                // 장루.요루
	                excelVo.setDisableTp14("장루.요루");
	                cell = row.getCell(46);
	                cell.setCellType(cell.CELL_TYPE_STRING);
	                if(null == cell || "".equals(cell.getStringCellValue())){
	                	continue; 
	                }else{
	                	excelVo.setMale14Cnt(cell.getStringCellValue());
	                }
	                cell = row.getCell(47);
	                cell.setCellType(cell.CELL_TYPE_STRING);
	                if(null == cell || "".equals(cell.getStringCellValue())){
	                	continue; 
	                }else{
	                	excelVo.setFemale14Cnt(cell.getStringCellValue());
	                }
	                
	                // 뇌전증
	                excelVo.setDisableTp15("뇌전증");
	                cell = row.getCell(49);
	                cell.setCellType(cell.CELL_TYPE_STRING);
	                if(null == cell || "".equals(cell.getStringCellValue())){
	                	continue; 
	                }else{
	                	excelVo.setMale15Cnt(cell.getStringCellValue());
	                }
	                cell = row.getCell(50);
	                cell.setCellType(cell.CELL_TYPE_STRING);
	                if(null == cell || "".equals(cell.getStringCellValue())){
	                	continue; 
	                }else{
	                	excelVo.setFemale15Cnt(cell.getStringCellValue());
	                }
	                
	                
	                list.add(excelVo);
	                
	                }
	            }
            	
                // temp테이블 삭제
        		disAgeSaveDAO.deleteTempDisableAge();
            		 
	            // temp테이블에 저장
	           for (BasDisabiltyAgeSaveVO excelVO : list) {
	        	   disAgeSaveDAO.insertDisalbleAge(excelVO);
				}
	            
	            errorCheck =  disAgeSaveDAO.selectErrorAgeList();
	            if(errorCheck.isEmpty()){
	            	returnMap.put("rtnCode", "0");
		            returnMap.put("message", "정상적으로 저장 되었습니다.");
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
	public List<EgovMap> selectErrorAgeList() {
		return disAgeSaveDAO.selectErrorAgeList();
	}
	
	@Override
	public List<EgovMap> selectExcelTempAgeList(){
		return disAgeSaveDAO.selectExcelTempAgeList();
	}
	
	
	
	@Override
	@Transactional
    public EgovMap confirmDisableAge(List<EgovMap> param){
		EgovMap returnMap = new EgovMap();
		
		EgovMap list = new EgovMap();
		
		String yyyymm = null;
		String gucd   = null;
		String age    = null;
		String register = null;
		String vDisableTp = null;
		String vMaleCnt  = null;
		String vFemaleCnt = null;
		
		StringBuffer disableTp = new StringBuffer("disableTp");
		StringBuffer maleCnt   = new StringBuffer("maleCnt");
		StringBuffer femaleCnt = new StringBuffer("femaleCnt");
		
		String delyyyymm = (String) param.get(0).get("yyyymm");
		
		try {
			
			// 기존데이터 삭제
			disAgeSaveDAO.deleteDisableAge(delyyyymm);
			
			for (int i = 0; i < param.size(); i++) {
				
				yyyymm = (String) param.get(i).get("yyyymm");
				gucd   = (String) param.get(i).get("guCd");
				age    = (String) param.get(i).get("age");
				register = (String) param.get(i).get("register");
				
				
				for (int j = 1; j <= 15; j++) {
					
					vDisableTp = (String) param.get(i).get(disableTp.append(j).toString()).toString();
					vMaleCnt   = (String) param.get(i).get(maleCnt.append(j).toString()).toString();
					vFemaleCnt = (String) param.get(i).get(femaleCnt.append(j).toString()).toString();
					
					list.put("yyyymm"    , yyyymm);
					list.put("guCd"      , gucd);
					list.put("age"       , age);
					list.put("disableTp" , vDisableTp);
					list.put("maleCnt"   , vMaleCnt);
					list.put("femaleCnt" , vFemaleCnt);
					list.put("register"  , register);
					
					// 저장
					disAgeSaveDAO.confirmDisableAge(list);
					
					disableTp.delete(9, 11);
					maleCnt.delete(7, 9);
					femaleCnt.delete(9, 11);
				}
			}
			
			disAgeSaveDAO.deleteTempDisableAge();
			
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
