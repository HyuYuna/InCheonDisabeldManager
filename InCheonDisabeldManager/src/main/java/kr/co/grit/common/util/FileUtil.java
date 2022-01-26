package kr.co.grit.common.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

/**
 * 파일처리를 공통으로 하는 JAVA파일이다.
 *
 */
public class FileUtil {

	private static final Logger LOGGER = LoggerFactory.getLogger(FileUtil.class);

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static Map uploadFile(String type,String cCode, CommonsMultipartFile pFile){
		Properties prop = PropertyLoader.loadProperties("/properties/resource.properties");
		String wkPath = "";
		String picturePath = ""; 
		
		if("wfc".equals(type)){
			// 시설코드
			picturePath = prop.getProperty("attach.repository.path")+"facility/";
		}else if("dsp".equals(type)){
			// 장애인코드
			picturePath = prop.getProperty("attach.repository.path")+"dspsn/";
		}
		
		wkPath =picturePath + cCode + File.separator + File.separator;
	
		Map mapFile = new HashMap();

		try {
			if(null != pFile) {

				File tmpFile  = new File(wkPath);
				if(!tmpFile.exists()) {
					tmpFile.mkdirs();
				}

				String oriFileNm = new String(pFile.getOriginalFilename());
				String fileNm = "";
				int pos = oriFileNm.lastIndexOf( "." );
				String extNm = oriFileNm.substring( pos + 1 );

				fileNm= convertUniqFileFileName(oriFileNm ,wkPath);
			    File file = new File(wkPath + File.separator + fileNm);
			    pFile.transferTo(file);

			    mapFile.put("ORI_FILE_NM" ,oriFileNm);
			    mapFile.put("FILE_NM"     ,fileNm);
			    mapFile.put("EXT_NM"	  ,extNm);
			    mapFile.put("WK_PATH"	  ,picturePath+cCode);
			    mapFile.put("FILE_SIZE"	  ,pFile.getSize());
			}
		} catch (Exception e) {
			LOGGER.error(e.toString());
		}

		return mapFile;
	}

	/**
	 * 파일을 삭제한다.
	 * @param deleteFileName
	 */
	public static void fileDelete(String type,String deleteFileName ,String cCode) {
		Properties prop = PropertyLoader.loadProperties("/properties/resource.properties");
		String picturePath = "";
		
		if("wfc".equals(type)){
			picturePath = prop.getProperty("attach.repository.path")+"facility/";
		}else if("dsp".equals(type)){
			picturePath = prop.getProperty("attach.repository.path")+"dspsn/";
		}
		
		String wkPath = picturePath + cCode+ "/" + deleteFileName;
		
        File file = new File(wkPath);
        if(file.exists() == true){
            file.delete();
        }
    }
	
	/**
	 * 프로그램 사진  추가한다.
	 * @param programCd 
	 * @param deleteFileName
	 * @param programCd 
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static Map pmgUploadFile(String cCode, CommonsMultipartFile pFile, String programCd){
		Properties prop = PropertyLoader.loadProperties("/properties/resource.properties");
		String wkPath = "";
		String picturePath = ""; 
		
		picturePath = prop.getProperty("attach.repository.path")+"program/";
		
		wkPath =picturePath + File.separator + cCode + File.separator + programCd + File.separator;
	
		Map mapFile = new HashMap();

		try {
			if(null != pFile) {

				File tmpFile  = new File(wkPath);
				if(!tmpFile.exists()) {
					tmpFile.mkdirs();
				}

				String oriFileNm = new String(pFile.getOriginalFilename());
				String fileNm = "";
				int pos = oriFileNm.lastIndexOf( "." );
				String extNm = oriFileNm.substring( pos + 1 );

				fileNm= convertUniqFileFileName(oriFileNm ,wkPath);
			    File file = new File(wkPath + File.separator + fileNm);
			    pFile.transferTo(file);

			    mapFile.put("ORI_FILE_NM" ,oriFileNm);
			    mapFile.put("FILE_NM"     ,fileNm);
			    mapFile.put("EXT_NM"	  ,extNm);
			    mapFile.put("WK_PATH"	  ,picturePath+cCode+ "/" +programCd);
			    mapFile.put("FILE_SIZE"	  ,pFile.getSize());
			}
		} catch (Exception e) {
			LOGGER.error(e.toString());
		}

		return mapFile;
	}
	
	/**
	 * 프로그램 사진 파일을 삭제한다.
	 * @param deleteFileName
	 * @param programCd 
	 */
	public static void pgmFileDelete(String deleteFileName ,String cCode, String programCd) {
		Properties prop = PropertyLoader.loadProperties("/properties/resource.properties");
		String picturePath = "";
		
		picturePath = prop.getProperty("attach.repository.path")+"program/";
		
		String wkPath = picturePath + cCode+ "/" + programCd + "/"+ deleteFileName;
		
        File file = new File(wkPath);
        if(file.exists() == true){
            file.delete();
        }
    }

	/**
	 * 프로그램 사진 폴더를 삭제한다.
	 * @param deleteFileName
	 * @param programCd 
	 */
	public static void pgmFolderDelete(String cCode, String programCd) {
		Properties prop = PropertyLoader.loadProperties("/properties/resource.properties");
		
		String picturePath = "";
		String wkPath = "";
		
		picturePath = prop.getProperty("attach.repository.path")+"program/";
		wkPath 		= picturePath + cCode+ "/" + programCd;
		
        File folder		   = new File(wkPath);
        File[] folder_list = folder.listFiles();
        
        if(folder.exists() == true){
	        for (int j = 0; j < folder_list.length; j++) {
				folder_list[j].delete(); //파일 삭제 
			}
	        folder.delete(); //대상폴더 삭제
        }
    }
	
	/**
	 * 파일명 변경
	 * @param file
	 * @return
	 * @throws Exception
	 */
	public boolean renameFile(File file) throws Exception{
		boolean b = false;

		if (!file.exists()) throw new FileNotFoundException(file.getAbsolutePath());

		if (file.exists() && file.isFile()){
			File destFile = new File(file.getAbsolutePath() + ".old");

			if (destFile.exists()){
				destFile.delete();
			}
			file.renameTo(destFile);
			b = true;
		}
		return b;
	}


	/**
	 * 파일명과, 경로를 받아서, 유일한 파일이름으로 변경 후 리턴한다. file[1].txt 같은 형식
	 * @param fileName
	 * @param path
	 * @return
	 */
	public static String convertUniqFileFileName(String fileName, String path) {
		String name = "";
		String ext = "";
		String filePath = "";

		//fileName = fileName.replaceAll("/", "");
		//fileName = fileName.replaceAll("\\","");
		//fileName = fileName.replaceAll("&", "");

		int index = fileName.lastIndexOf(".");
		if(index == -1) {
			name = fileName;
		} else {
			name = fileName.substring(0, index);
            ext  = "." + fileName.substring(index + 1);
		}
		if(path.substring(path.length() - 1).equals(File.separator)) {
			filePath = path;
		} else {
			filePath = path + File.separator;
		}

		File file = new File(filePath + name + ext);
		int i = 1;
		while (true) {
			if (file.exists()) {
				file = new File(filePath + name + "_" + i + ext);
				i++;
				continue;
			} else {
				break;
			}
		}
		return file.getName();
	}
}