package com.ibm.khub.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ibm.khub.util.DatabaseConnectionUtil;

/**
 * sudipta
 */
public class sessionunload extends HttpServlet {

	
	PreparedStatement ps1 = null;
	PreparedStatement ps2 = null;
	ResultSet rs1 = null;
	ResultSet rs2 = null;
	Connection con = null;
	Connection con1 =  null;
	PreparedStatement ps3 = null;
	PreparedStatement ps = null;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	//	System.out.println("######inside session unload");
	//	HttpSession session = request.getSession();
		String email = request.getParameter("emailid");
		//String f_status = null;
		int f_status = 0;
		List<String> sessionvalidatelist = new ArrayList<String>();
		String session_id = null;
		HttpSession session = request.getSession();
		String getsessionid = (String) session.getAttribute("jsessionval");
		//System.out.println("the session id   in the sessionunload::"+getsessionid);
		try {
			Class.forName("com.ibm.db2.jcc.DB2Driver").newInstance();
			 con = DriverManager.getConnection(DatabaseConnectionUtil.databaseCredentials.getJdbcURL(),DatabaseConnectionUtil.databaseCredentials.getUserId(),DatabaseConnectionUtil.databaseCredentials.getPassword());
			String query_feedback_stat_check = "select FEEDBACK_STATUS  from USERS where \"EMAIL\"= ?";
			String session_validate = "select \"SESSION_ID\" from SESSION where EMAIL = ? ";
			
			
			try{
			ps1 = con.prepareStatement(query_feedback_stat_check);
			ps1.setString(1, email);
			rs1 = ps1.executeQuery();

			while(rs1.next())
			{
				f_status = rs1.getInt(1);
				//fstat = rs.getInt(1);
				//System.out.println("the value of fsat is ::"+f_status);
			}
			
			}
			catch(SQLException e1)
			{
				e1.printStackTrace();
			}
			finally
			{
				ps1.close();
			}
			
			
			try
			{
				

			
			
				if(getsessionid.equalsIgnoreCase("Y"))
			{
	//	if(f_status.equalsIgnoreCase("0") || f_status.equalsIgnoreCase("1")|| f_status.equalsIgnoreCase("2") || f_status.equalsIgnoreCase("3")||f_status.equalsIgnoreCase("4"))
					if(f_status>=0)		
			{
			try{
			String query_status_update = "update USERS set \"BROWSING\" = ? ,\"FEEDBACK_STATUS\" = \"FEEDBACK_STATUS\"+1  where \"EMAIL\" = ?";	
			ps2 = con.prepareStatement(query_status_update);

			ps2.setString(1, "Y");
			
			ps2.setString(2, email);
			
			
			ps2.executeUpdate();
			
			
			
			
			}
			
			
			catch(SQLException e)
			{
				e.printStackTrace();
			}
			
			finally
			{
				ps2.close();
			}
		
			}
			
			
			else
			{
		//		System.out.println("it is an existing session...");
			}
			
		}
			
			}
			
			catch(Exception e1)
			{
				e1.printStackTrace();
			}
		
			
			

			
			
			
		}

		catch (Exception e) {

		}

		finally {
     
     
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			
			String email = request.getParameter("emailid");
			
			
				Class.forName("com.ibm.db2.jcc.DB2Driver").newInstance();
				con1 = DriverManager.getConnection(DatabaseConnectionUtil.databaseCredentials.getJdbcURL(),DatabaseConnectionUtil.databaseCredentials.getUserId(),DatabaseConnectionUtil.databaseCredentials.getPassword());
			 
			String update_status_insert = "update USERS set \"BROWSING\" = ? where \"EMAIL\" = ? ";
				                
				ps3 = con1.prepareStatement(update_status_insert);
				
				ps3.setString(1, "N");
				
				ps3.setString(2, email);
				ps3.executeUpdate();
				
			   
	

		}

		catch (SQLException | InstantiationException | IllegalAccessException | ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		finally
		{
			try {
				ps3.close();
				con1.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

}
