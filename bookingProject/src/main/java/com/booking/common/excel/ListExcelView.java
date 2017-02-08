package com.booking.common.excel;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import net.sf.jxls.transformer.XLSTransformer;

public class ListExcelView extends AbstractExcelView{
	static Logger logger = Logger.getLogger(ListExcelView.class);

	/******************************************
	 * 참고 : "content-disposition : attachment"은 브라우저 인식 파일 
	 * 확장자를 포함하여 모든 확장자의 파일들에 대해,
	 * 다운로드시 무조건 "파일 다운로드" 대화 상자를 보여주도록
	 * 헤드속성이라 할 수 있다.
	 *************************************/
	@Override
	protected void buildExcelDocument(Map<String, Object> model, HSSFWorkbook arg1, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		response.setHeader("Content-Disposition", "attachment;fileName=\""
							+model.get("file_name")+"_"+new SimpleDateFormat("yyyyMMdd")
							.format(Calendar.getInstance().getTime())+".xlsx"+"\"");
		response.setContentType("application/x-msexcel; charset=UTF-8");

		
		/********************************
		 * 테이블을 템플릿을 이용해 Excel로 전환한다
		 ******************************/
		
		XLSTransformer trans = new XLSTransformer();
		String docRoot = request.getSession().getServletContext().getRealPath("/WEB-INF/excel/");
		
		logger.info("경로 체크(docRoot) : " + docRoot);
		
		InputStream is = new BufferedInputStream(new FileInputStream(docRoot + model.get("template")));
		Workbook workbook = trans.transformXLS(is, model);
		is.close();
		workbook.write(response.getOutputStream());
	}
	


	
	
}
