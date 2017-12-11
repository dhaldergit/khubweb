package com.ibm.khub.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.ibm.khub.util.DatabaseConnectionUtil;

/**
 * Servlet implementation class Session
 */
public class Session extends HttpServlet {
	Connection con = null;
	String ssnId = null;
	String jsession = null;
	JSONObject json = new JSONObject();
	JSONObject json1 = new JSONObject();
	JSONObject json2 = new JSONObject();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		/*
		 * UserDetails userdtl =
		 * (UserDetails)session.getAttribute("userDetailsObj"); String email =
		 * userdtl.getEmail();
		 */

		String email = request.getParameter("emailid");

		PreparedStatement ps = null;
		PreparedStatement ps1 = null;
		PreparedStatement ps2 = null;
		PreparedStatement ps3 = null;
		ResultSet rs1 = null;
		ResultSet rs = null;
		List<String> sessiionlist = new ArrayList<String>();
		String flag = null;
		// response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		HttpSession session = request.getSession();
		ssnId = session.getId();

		try {

			Class.forName("com.ibm.db2.jcc.DB2Driver").newInstance();
			con = DriverManager.getConnection(DatabaseConnectionUtil.databaseCredentials.getJdbcURL(),
					DatabaseConnectionUtil.databaseCredentials.getUserId(),
					DatabaseConnectionUtil.databaseCredentials.getPassword());

			if (email != null) {
				String query = "select * from SESSION where EMAIL = ?";

				ps2 = con.prepareStatement(query);
				ps2.setString(1, email);
				rs1 = ps2.executeQuery();

				if (rs1.next()) {

					String query_checksession = "select \"SESSION_ID\" from SESSION where EMAIL = ? ";

					ps = con.prepareStatement(query_checksession);
					ps.setString(1, email);
					rs = ps.executeQuery();

					while (rs.next()) {
						jsession = rs.getString(1);
						sessiionlist.add(jsession);
					}

					if (sessiionlist.contains(ssnId)) {

						flag = "N";
					}

					else if (!sessiionlist.contains(ssnId)) {

						String query_insert = "update SESSION  set SESSION_ID  =?  where EMAIL = ?";

						ps1 = con.prepareStatement(query_insert);
						ps1.setString(1, ssnId);
						ps1.setString(2, email);
						ps1.executeUpdate();

						/* json.put("responsesession", "Y") */;
						flag = "Y";

					}
					json.put("responsesession", flag);
					session.setAttribute("jsessionval", flag);

				}

				else {
					String insert_query = "insert  into SESSION (\"SESSION_ID\" , \"EMAIL\") values (?,?)";
					ps3 = con.prepareStatement(insert_query);
					ps3.setString(1, ssnId);
					ps3.setString(2, email);
					// System.out.println("Query" + query);
					ps3.executeUpdate();
					flag = "Y";
					json.put("responsesession", flag);
					session.setAttribute("jsessionval", flag);

				}

			}

			pw.write(json.toJSONString());

		}

		catch (SQLException | InstantiationException | IllegalAccessException | ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();

		}

		finally {

			try {
				if (con != null) {
					con.close();
				}
				if (ps2 != null) {
					ps2.close();
				}

				if (ps1 != null) {
					ps1.close();
				}
				if (ps != null) {
					ps.close();
				}
				if (ps3 != null) {
					ps3.close();
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
	}

}
