package com.example.sample_shop.login;

import com.example.sample_shop.model.LoginBean;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"*.do"})

public class LoginController extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/*
		1. requset 받은 값을 처리
		2. 모델 클래스에 값을 저장 후 로그인 인증 여부 확인
		3. 인증 여부에 따라 다른 페이지로 이동
		 */
		
		resp.setContentType("text/html; charset=utf-8"); // 리스폰스
		
		String id = req.getParameter("id");	// 리퀘스트 겟파라미터
		String password = req.getParameter("passwd");	// 리퀘스트 겟파라미터
		
		LoginBean bean = new LoginBean();
		bean.setId(id);
		bean.setPassword(password);
		req.setAttribute("bean", bean);
		
		boolean status = bean.validate();
		
		if(status) {	// 로그인이 성공한 경우 페이지 이동
			RequestDispatcher dispatcher = req.getRequestDispatcher("mvc_success.jsp");
			dispatcher.forward(req, resp);
		}
		
		else {	// 로그인이 실패한 경우 페이지 이동
			RequestDispatcher dispatcher = req.getRequestDispatcher("mvc_error.jsp");
			dispatcher.forward(req, resp);
		}
		
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.doGet(req, resp);
	}
}
