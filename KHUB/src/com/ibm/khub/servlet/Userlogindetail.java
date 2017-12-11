package com.ibm.khub.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.ibm.khub.pojo.UserDetails;

/**
 * Servlet implementation class Userlogindetail
 */
public class Userlogindetail extends HttpServlet {
	
	
	 HttpSession session = null;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 UserDetails userdtl = (UserDetails)session.getAttribute("userDetailsObj");
        String email  = userdtl.getRole();
	

       request.setAttribute("emaildata", "email"); 
       // request.setAttribute("emaildata", "sudidasg@in.ibm.com");
        request.getRequestDispatcher("index.jsp").forward(request, response);  
		
		
		
	}

}
