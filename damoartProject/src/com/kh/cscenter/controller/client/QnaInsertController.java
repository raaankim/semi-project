package com.kh.cscenter.controller.client;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.common.controller.MyFileRenamePolicy;
import com.kh.common.model.vo.Attachment;
import com.kh.cscenter.model.service.QnaService;
import com.kh.cscenter.model.vo.QnA;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class QnaInsertController
 */
@WebServlet("/insert.qa")
public class QnaInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10*1024*1024;
			String savePath = request.getSession().getServletContext().getRealPath("/resources/board_upfiles/qna/");
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			String title = multiRequest.getParameter("title");
			String pNo = multiRequest.getParameter("pno");
			String category = multiRequest.getParameter("category");
			String content = multiRequest.getParameter("content");
			String secret = multiRequest.getParameter("secret");
			int memNo = Integer.parseInt(multiRequest.getParameter("memNo"));
			String qWriter = multiRequest.getParameter("memNick");
			
			QnA q = new QnA(pNo, memNo, qWriter, secret, title, content, category);
			
			if(secret == null) {
				q.setSecret("N");
			}
			
			System.out.println(q);
			Attachment at = null;
			if(multiRequest.getOriginalFileName("upfile") != null) {
				at = new Attachment();
				at.setOriginName(multiRequest.getOriginalFileName("upfile"));
				at.setChangeName(multiRequest.getFilesystemName("upfile"));
				at.setFilePath("resources/board_upfiles/qna/");
			}
			
			int result = new QnaService().insertQuestion(q, at);
			
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "???????????? ??????????????? ?????????????????????.");
				response.sendRedirect(request.getContextPath() + "/list.qa?cpage=1");
			}else { // ???????????????
				
			}

			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
