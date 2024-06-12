package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CboardDAO;
import dto.CboardDTO;

@WebServlet("*.board")
public class CboardController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		CboardDAO bManager = CboardDAO.getInstance();
		String cmd = request.getRequestURI();
		System.out.println("get:" + cmd);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		CboardDAO bManager = CboardDAO.getInstance();
		String cmd = request.getRequestURI();
		System.out.println("post:" + cmd);
		
		try {
			if(cmd.equals("/write.board")) {
				String id = "jkh28";
				int category = 0;
				
				String categoryStr = request.getParameter("category");
				if(categoryStr.equals("option1")){
					category = 1;
				}else {
					category = 2;
				}
				
				String title = request.getParameter("title");
				String content = request.getParameter("content");	
				
				System.out.println(category);
				System.out.println(title);
				System.out.println(content);
				
				CboardDTO ctt = new CboardDTO(0, id, category ,title, content, null, 0, 0);
				
				bManager.insertPost(ctt);
				
				System.out.println("추가완료!");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
