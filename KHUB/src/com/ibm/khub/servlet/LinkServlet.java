package com.ibm.khub.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

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
 * Servlet implementation class LinkServlet
 */
public class LinkServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Connection con = null;

		PreparedStatement ps2 = null;
		PreparedStatement ps3 = null;
		// String user= "dash5335";
		HttpSession session = request.getSession();
		ResultSet rs1 = null;
		ResultSet rs2 = null;
		SimpleDateFormat sdfr = new SimpleDateFormat("dd-MM-yyyy");
		String page_name = null;
		String key =null;
		// String short_description1 = null;

		try {

			UserDetails userdtl = (UserDetails) session.getAttribute("userDetailsObj");
			String email = userdtl.getEmail();
			String fname = userdtl.getFirstName();
			String lname = userdtl.getLastName();
			// String user = fname.concat(lname);
			String name = fname + " " + lname;

			//String email = "nirmalya.goswami@in.ibm.com";
			//String name = "Nirmalya Goswami";  
			
			Class.forName("com.ibm.db2.jcc.DB2Driver").newInstance();

			con = DriverManager.getConnection(DatabaseConnectionUtil.databaseCredentials.getJdbcURL(),
					DatabaseConnectionUtil.databaseCredentials.getUserId(),
					DatabaseConnectionUtil.databaseCredentials.getPassword());

			String recent_link_query = "select distinct P.PAGE_NAME from (select PAGE_NAME  from METRICS  met   where met.USER = ? order by TIME_STAMP desc   fetch first 5 rows only) P";
            String  recent_key = "select distinct R.KEYWORD from (select KEYWORD  from BOX_KEY  key   where key.USER = ? order by LAST_SEARCH  DESC   fetch first 5 rows only) R";
			ps2 = con.prepareStatement(recent_link_query);
			ps3 = con.prepareStatement(recent_key);
			ps2.setString(1, email);
			rs1 = ps2.executeQuery();
			
			ps3.setString(1, email);
			rs2 = ps3.executeQuery();
			JSONArray jsonArray = new JSONArray();
			JSONArray jsonArray1 = new JSONArray();
			JSONArray jsonArray2 = new JSONArray();
			JSONObject objlink = new JSONObject();
			JSONObject objkey = new JSONObject();
			while (rs1.next()) {

				page_name = rs1.getString(1);
				objlink = new JSONObject();
				objlink.put("pagedetail", page_name);

				jsonArray.add(objlink);
				System.out.println("the values are::" + jsonArray);

			}
			
			while (rs2.next()) {

				key = rs2.getString(1);
				objkey = new JSONObject();
				objkey.put("keydetail", key);

				jsonArray1.add(objkey);
				System.out.println("the values are::" + jsonArray1);

			}
			
			jsonArray2.add(jsonArray);
			jsonArray2.add(jsonArray1);

			System.out.println("the json array ::::" + jsonArray1);
			System.out.println("the json array ::::" + jsonArray);
			PrintWriter pw = response.getWriter();
			
			pw.write(jsonArray2.toJSONString());
		}

		catch (Exception e) {
			e.printStackTrace();
		}

		finally {
			try {
				// ps1.close();
				ps2.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

}
