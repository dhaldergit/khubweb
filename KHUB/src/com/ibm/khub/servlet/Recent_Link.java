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
 * Servlet implementation class Recent_Link
 */
public class Recent_Link extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Connection con = null;

		PreparedStatement psPage = null;
		// PreparedStatement psSearch = null;
		HttpSession session = request.getSession();
		ResultSet rsPage = null;
		// ResultSet rsSearch = null;
		SimpleDateFormat sdfr = new SimpleDateFormat("dd-MM-yyyy");
		String page_name = null;
		String link = null;
		String key = null;

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

			String recent_link_query = "select PAGE_NAME, URL from 	METRICS met where met.USER = ? "
					+ "and met.PAGE_NAME  <> 'Home' AND met.ACCESSED_TIME is not null "
					+ "and met.URL is not null  and met.URL!='null' " + "order by ACCESSED_TIME desc";

			psPage = con.prepareStatement(recent_link_query);
			psPage.setString(1, email);
			rsPage = psPage.executeQuery();

			JSONArray jsonArrayPage = new JSONArray();
			JSONArray jsonArraySearch = new JSONArray();
			JSONArray jsonArrayCombi = new JSONArray();
			JSONObject objlink = new JSONObject();
			JSONObject objkey = new JSONObject();
			int numLinks = 0;
			int numKeys = 0;
			while (rsPage.next()) {

				page_name = rsPage.getString(1);
				link = rsPage.getString(2);

				if (page_name.equals("Search results") && numKeys < 5) {
					objkey = new JSONObject();
					objkey.put("keydetail", link.substring(link.lastIndexOf("=") + 1).replaceAll("%20", " "));
					objkey.put("key_url", link);
					if (!jsonArraySearch.contains(objkey)) {
						jsonArraySearch.add(objkey);
						numKeys++;
					}
				} else if (!page_name.equals("Search results") && numLinks < 5) {
					objlink = new JSONObject();
					int indexQ = link.lastIndexOf("=");
					if(indexQ > 0) {
						objlink.put("pagedetail", page_name + ": </br>&emsp;&emsp;" + link.substring(indexQ + 1).replaceAll("%20", " "));
					} else {
						objlink.put("pagedetail", page_name);
					}
					objlink.put("link_url", link);
					if (!jsonArrayPage.contains(objlink)) {
						jsonArrayPage.add(objlink);
						numLinks++;
					}
				} else if ((numKeys == 5) && (numLinks == 5)) {
					break;
				}				
				
			}
			jsonArrayCombi.add(jsonArrayPage);
			jsonArrayCombi.add(jsonArraySearch);
			
			PrintWriter pw = response.getWriter();
			pw.write(jsonArrayCombi.toString());
			
			System.out.println("Personal links : " + jsonArrayCombi.toJSONString());
		} catch (Exception e) {
			e.printStackTrace();
		}

		finally {
			try {
				psPage.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

}
