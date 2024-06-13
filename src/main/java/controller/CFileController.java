package controller;

import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CFileDAO;

@WebServlet("*.cfile")
public class CFileController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String cmd = request.getRequestURI();
		System.out.println(cmd);
		CFileDAO manager = CFileDAO.getInstance();
		
		try {
			//파일 다운로드
			if(cmd.equals("/download.cfile")) {
				String filePath = request.getServletContext().getRealPath("files");
				String sysname = request.getParameter("sysname");
				String oriname = request.getParameter("oriname");
				
				oriname = new String(oriname.getBytes("UTF8"), "ISO-8859-1");
				response.reset();
				response.setHeader("Content-Disposition", "attachment;filename=\""+ oriname + "\"");
				
				File target = new File(filePath + "/" + sysname);
				
				byte[] fileContents = new byte[(int) target.length()];
				try (FileInputStream fis = new FileInputStream(target);
					DataInputStream dis = new DataInputStream(fis);
					ServletOutputStream sos = response.getOutputStream();) {
					dis.readFully(fileContents);
					sos.write(fileContents);
					sos.flush();
				}
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
