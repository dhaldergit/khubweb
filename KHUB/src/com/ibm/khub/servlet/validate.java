package com.ibm.khub.servlet;

import java.io.IOException;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ibm.ed.util.DirectoryEntry;
import com.ibm.ed.util.iip.IIPCwaException;
import com.ibm.ed.util.iip.IIPUtilities;

/**
 * Servlet implementation class validate
 */
public class validate extends HttpServlet {
	//private static final long serialVersionUID = 1L;

	private static String EYECATCHER = "com.ibm.ed.iip.samples.IIPTest: ";
	String directory = null;
	String ldapHost = null;
	String emailAddr = null;
	String password = null;
	StringBuilder attrIds = new StringBuilder();
	boolean isAuthenticated = false;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// TODO Auto-generated method stub

		String password = request.getParameter("password");

		String userName = request.getParameter("login");
		String ldapHost = "bluepages.ibm.com";


		Properties parms  = new Properties();

		DirectoryEntry de = null;

		try
		{


			de = IIPUtilities.authenticate(ldapHost, userName, password, parms);
			System.out.println("authenticated");
			response.sendRedirect("Box.jsp");
		}


		catch (IIPCwaException e)
		{
			// TODO Auto-generated catch block

			request.setAttribute("errorMessage", "Invalid user or password");
			RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
			rd.forward(request, response);
			e.printStackTrace();

		}


	}

}
