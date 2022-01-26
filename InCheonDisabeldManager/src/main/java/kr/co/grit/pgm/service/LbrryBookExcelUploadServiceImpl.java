package kr.co.grit.pgm.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import kr.co.grit.common.util.SessionUtil;
import kr.co.grit.pgm.dao.LbrryBookExcelUploadDAO;
import kr.co.grit.pgm.vo.PgmLbrryBookExcelVO;

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

/**
 * 도서목록 엑셀 업로드
 * @author JJS
 */
@Service("LbrryBookExcelUploadService")
public class LbrryBookExcelUploadServiceImpl implements LbrryBookExcelUploadService{

	/**
	 * DAO 선언
	 */
	@Resource(name="LbrryBookExcelUploadDAO")
	private transient LbrryBookExcelUploadDAO lbrBookExcelUpDAO;
	
	@Override
	public EgovMap pgmLbrryBookExcelFile(MultipartFile file,String linkCd) {
		
		EgovMap returnMap = new EgovMap();
		
		List<EgovMap> errorCheck = new ArrayList<EgovMap>();
		List<PgmLbrryBookExcelVO> list = new ArrayList<PgmLbrryBookExcelVO>();
		
        try {
        	Workbook workbook = null;
        	Sheet sheet = null;
        	Row row = null;
        	Cell cell = null;
        	
        	OPCPackage opcPackage = OPCPackage.open(file.getInputStream());
        	workbook = WorkbookFactory.create(opcPackage);
        	
        	// 첫번째 시트 불러오기
        	sheet  = workbook.getSheetAt(0);
        	
        	
            for(int i=1; i< sheet.getLastRowNum() +1; i++) {
            	PgmLbrryBookExcelVO excelVo = new PgmLbrryBookExcelVO();
                row = sheet.getRow(i);
                
                // 행이 존재하기 않으면 패스
                if(null == row) {
                    continue;
                }else{
                	
                	excelVo.setWffcltyCd(linkCd);
                	
	                cell = row.getCell(0);
	                cell.setCellType(cell.CELL_TYPE_STRING);
	                if(null == cell || "".equals(cell.getStringCellValue())){
	                	//throw new Exception();
	                	continue; 
	                }else{
                		excelVo.setBookNo(cell.getStringCellValue());
	                }
	               
	                cell = row.getCell(1);
	                cell.setCellType(cell.CELL_TYPE_STRING);
	                if(null == cell || "".equals(cell.getStringCellValue())){
	                	//throw new Exception();
	                	continue; 
	                }else{
	                	excelVo.setBookNm(cell.getStringCellValue());
	                }
	                
	                cell = row.getCell(2);
	                cell.setCellType(cell.CELL_TYPE_STRING);
	                if(null == cell || "".equals(cell.getStringCellValue())){
	                	//throw new Exception();
	                	continue; 
	                }else{
	                	excelVo.setAuthor(cell.getStringCellValue());
	                }
	                
	                cell = row.getCell(3);
	                cell.setCellType(cell.CELL_TYPE_STRING);
	                if(null == cell || "".equals(cell.getStringCellValue())){
	                	//throw new Exception();
	                	continue; 
	                }else{
	                	excelVo.setPublisher(cell.getStringCellValue());
	                }
	                
	                cell = row.getCell(4);
	                cell.setCellType(cell.CELL_TYPE_STRING);
	                if(null == cell || "".equals(cell.getStringCellValue())){
	                	//throw new Exception();
	                	continue; 
	                }else{
	                	excelVo.setPblsYear(cell.getStringCellValue());
	                }
	                
	                cell = row.getCell(5);
	                cell.setCellType(cell.CELL_TYPE_STRING);
	                if(null == cell || "".equals(cell.getStringCellValue())){
	                	//throw new Exception();
	                	continue; 
	                }else{
	                	excelVo.setTypeName(cell.getStringCellValue());
	                }
	                
	                list.add(excelVo);
	                
	                }
	            }
            
                // temp테이블 삭제
            	lbrBookExcelUpDAO.deleteLbrryTemp();
            		 
	            // temp테이블에 저장
	            for (PgmLbrryBookExcelVO excelVO : list) {
	            	lbrBookExcelUpDAO.insertLbrryTemp(excelVO);
				}
	            
	            errorCheck =  lbrBookExcelUpDAO.selectLbrErrorList(linkCd);
	            
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
	public List<EgovMap> selectLbrExcelTempList(String linkCd){
		return lbrBookExcelUpDAO.selectLbrExcelTempList(linkCd);
	}
	
	@Override
	public List<EgovMap> selectLbrExcelTempErrorList(String linkCd) {
		return lbrBookExcelUpDAO.selectLbrErrorList(linkCd);
	}
	
	
	
	@Override
	@Transactional
    public EgovMap confirmLbrryBook(List<EgovMap> param){
		
		EgovMap returnMap = new EgovMap();
		
		EgovMap map = new EgovMap();
		
		EgovMap userInfo = (EgovMap) SessionUtil.getRequestAttributes("KSSM.user");
		String userId  = (String)userInfo.get("userId");   // 로그인 사용자 ID
		String linkCd  = (String)userInfo.get("linkCd");   // 로그인 시설LINCCODE
		List<EgovMap> typeList = new ArrayList<EgovMap>();
		
		try {
			
			// 파라미터
			map.put("wffcltyCd", linkCd);
			map.put("register" , userId);
			
			// 도서목록 삭제
			lbrBookExcelUpDAO.deleteLbrry(map);
			// 카테고리 삭제
			lbrBookExcelUpDAO.deleteCatalog(map);
			// 도서타입 삭제
			lbrBookExcelUpDAO.deleteType(map);
			
			
			// 도서 카테고리 저장
			lbrBookExcelUpDAO.insertCatalog(map);
			
			// 도서유형 조회
			typeList = lbrBookExcelUpDAO.selectTypeList();
			
			for (int i = 0; i < typeList.size(); i++) {
				// 도서유형 저장
				typeList.get(i).put("register", userId);
				lbrBookExcelUpDAO.insertType(typeList.get(i));
			}
            
			// 도서목록 저장
			for (int i = 0; i < param.size(); i++) {
				lbrBookExcelUpDAO.confirmLbrry(param.get(i));
			}
			
			
			// temp테이블 삭제
			lbrBookExcelUpDAO.deleteLbrryTemp();
			
			returnMap.put("rtnCode", "0");
			returnMap.put("message", "정상적으로 저장 되었습니다.");
		} catch (BadSqlGrammarException e) {
			returnMap.put("rtnCode", "-1");
			returnMap.put("message", "저장에 실패하였습니다.");
 		    TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		 
		 return returnMap;
	}
	
}
