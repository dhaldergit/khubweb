package com.ibm.khub.servletListener;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.ibm.swat.password.ReturnCode;
import com.ibm.swat.password.cwa2;

/**
 * Servlet Filter implementation class KhubLoginFilter
 */
public class KhubLoginFilter implements Filter {

	/**
	 * Default constructor.
	 */
	public KhubLoginFilter() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here

		HttpSession session = ((HttpServletRequest) request).getSession();
		/*
		 * Security.setProperty("ssl.SocketFactory.provider",
		 * "com.ibm.jsse2.SSLSocketFactoryImpl");
		 * Security.setProperty("ssl.ServerSocketFactory.provider",
		 * "com.ibm.jsse2.SSLServerSocketFactoryImpl");
		 */
		String userNameInSession = (String) session.getAttribute("username");
		String userId = request.getParameter("username");
		String pwd = request.getParameter("password");
		
		System.out.println("userNameInSession =" + userNameInSession );
		System.out.println("userId in parameter =" + userId );
		 
		if (userNameInSession == null) {
			
			
			if (userId!=null && pwd !=null) {
				cwa2 group = new cwa2();
				ReturnCode rc = group.authenticate(userId, pwd);
				int code = rc.getCode();
				if ((userId == null) || (userId.length() == 0) || (pwd == null) || (pwd.length() == 0) || code != 0) {

					String message = "User Id/Password invalid. Please, try again.";

					RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
					rd.forward(request, response);

				} else {
					System.out.println("Login Successfull. Thanks.");
					session.setAttribute("username", userId);

				} 
			}else{
				System.out.println("User Session timed out . Please, relogin.");
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				rd.forward(request, response);
			}
		}
		// pass the request along the filter chain
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
