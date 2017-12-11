package com.ibm.khub.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.ibm.khub.pojo.UserDetails;
import com.ibm.khub.util.DatabaseConnectionUtil;

/**
 * Servlet implementation class Content_Search
 */
public class Content_Search extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	 /**
     * @see HttpServlet#HttpServlet()
     */
    public Content_Search() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*PrintWriter out = response.getWriter();*/
		
		//System.out.println("Inside the servlet....");
				HttpSession session = request.getSession();
		UserDetails userdtl = (UserDetails) session.getAttribute("userDetailsObj");
		String usermail = userdtl.getEmail();
//		String usermail="nirmalya.goswami@in.ibm.com";
		String txtsrch = request.getParameter("txtsrch");
		//String txtscrchkey = "'"+"%"+txtsrch+"%"+"'";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs =  null;
		SimpleDateFormat sdfr = new SimpleDateFormat("dd-MM-yyyy");
		String datestring = null;
		
		try {
			Class.forName("com.ibm.db2.jcc.DB2Driver").newInstance();
			con = DriverManager.getConnection(DatabaseConnectionUtil.databaseCredentials.getJdbcURL(),
					DatabaseConnectionUtil.databaseCredentials.getUserId(),
					DatabaseConnectionUtil.databaseCredentials.getPassword());

			String key_retrieve = "select LINK , CONTENT_NAME , DATE_PUBLISHED ,DESCRIPTION , EXTERNAL_LINK,TYPE from  KH_CONTENT  where is_deleted = 'N' and UPPER(CONTENT_NAME) LIKE UPPER(?) or  UPPER(TAGS) LIKE UPPER(?) or UPPER(DESCRIPTION) LIKE UPPER(?)";
			ps = con.prepareStatement(key_retrieve);
			ps.setString(1, "%" + txtsrch + "%");
			ps.setString(2, "%" + txtsrch + "%");
			ps.setString(3, "%" + txtsrch + "%");


			java.sql.Timestamp date_accessed = new java.sql.Timestamp(new java.util.Date().getTime());
			rs = ps.executeQuery();
			
			JSONArray jsonArray = new JSONArray();
			while (rs.next())

			{
				int total_col = rs.getMetaData().getColumnCount();
				// int rows = rs.getMetaData().
				JSONObject obj = new JSONObject();

				for (int i = 0; i < total_col; i++) {
					if (rs.getMetaData().getColumnLabel(i + 1).equalsIgnoreCase("date_published")) {
						Date date = rs.getDate("date_published");
						datestring = sdfr.format(date);

						obj.put(rs.getMetaData().getColumnLabel(i + 1).toLowerCase(), datestring);

					}

					 else {

						obj.put(rs.getMetaData().getColumnLabel(i + 1).toLowerCase(), rs.getObject(i + 1));
						// jsonArray.add(obj);
					}

				}

				jsonArray.add(obj);

			}
			
			//System.out.println("The jsonArray is ::::"+jsonArray);
			PrintWriter pw = response.getWriter();
			pw.write(jsonArray.toJSONString());
		
		}
		
		catch(Exception e)
		
		{
			e.printStackTrace();
		}
		
		
		finally
		{
			
			if(ps!=null)
			{
				try {
					ps.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}			
	
			if(rs!=null)
			{
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			
			if(con!=null)
			{
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}			
			
		}
		
	}

}
