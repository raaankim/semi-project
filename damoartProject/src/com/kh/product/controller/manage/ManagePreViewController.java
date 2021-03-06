package com.kh.product.controller.manage;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.model.vo.PageInfo;
import com.kh.product.model.service.ManageService;
import com.kh.product.model.vo.Product;

/**
 * Servlet implementation class ManagePreViewController
 */
@WebServlet("/managePre.man")
public class ManagePreViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagePreViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int proCount;
		int currentPage;
		int pageLimit;
		int boardLimit;
		int maxPage;
		int startPage;
		int endPage;
		
		proCount = new ManageService().selectPreCount();
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		pageLimit = 10; 			
		boardLimit = 10;
		
		maxPage = (int)Math.ceil((double)proCount / boardLimit);
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(proCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<Product> preList = new ManageService().selectPreList(pi);
		
		request.setAttribute("pi", pi);	
		request.setAttribute("preList", preList);
		request.getRequestDispatcher("views/product/manage/managePreProduct.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
