package com.booking.common.file;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.web.multipart.MultipartFile;

public class FileUploadUtil {
	static Logger logger = Logger.getLogger(FileUploadUtil.class);

	/* 파일 업로드 메서드 */
	public static String fileUpload(MultipartFile file, HttpServletRequest request) throws IOException {
		logger.info("fileUpload 호출 성공");
		
		String real_name = null;
		
		//MultipartFile 클래스의 getFile() 메서드로 클라이언트가 업로드한 파일명
		String org_name = file.getOriginalFilename();
		logger.info("org_name : " +org_name);
		
		//파일명 변경(중복되지않게,시간을줘서)
		if(org_name != null &&(!org_name.equals(""))){
			real_name = "board_"+System.currentTimeMillis()+"_"+org_name;	//저장될 파일 이름
			
			String docRoot = request.getSession().getServletContext().getRealPath("/uploadStorage");
			
			File fileDir = new File(docRoot);
			if(!fileDir.exists()){
				fileDir.mkdirs();
			}
			
			//logger.info("업로드할 파일 경로(docRoot) : " + docRoot);
			File fileAdd = new File(docRoot+"/"+real_name);		//파일 생성후
			
			logger.info("업로드할 파일 경로(fileAdd) :" +fileAdd);
			
			file.transferTo(fileAdd);
			
		}
		
		
		return real_name;
	}

	
	/* 첨부파일 삭제 메서드 */
	public static void fileDelete(String fileName, HttpServletRequest request) throws IOException{
		logger.info("fileDelete 호출 성공");
		boolean result = false;
		String docRoot = request.getSession().getServletContext().getRealPath("/uploadStorage");
		
		File fileDelete = new File(docRoot+"/"+fileName);			//파일 생성후
		logger.info("삭제할 파일의 경로 (fileDelete) : " + fileDelete);
		
		if(fileDelete.exists() && fileDelete.isFile()){
			result = fileDelete.delete();
			
		}
		
		logger.info("삭제 여부(true/false) : "+result);
	}
	
	
	
}

