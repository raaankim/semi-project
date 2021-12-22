package com.kh.mainPage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.mainPage.model.service.MainPageProductService;
import com.kh.mainPage.model.vo.MainPageProduct;

/**
 * Servlet implementation class MainPageProductController
 */
@WebServlet("/mainProduct.ma")
public class MainPageProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainPageProductController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<MainPageProduct> newList = new MainPageProductService().selectNewList();
		
		//MainPageProduct newList = new MainPageProductService().selectNewList();
		
		if(newList == null) {
			
		}else {
			HttpSession session = request.getSession();
			session.setAttribute("newList", newList);
			
			response.sendRedirect("views/common/mainPage.jsp");
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
