package com.ibm.khub.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
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
 * sudipta dasgupta
 */
public class Question extends HttpServlet {

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		

		PreparedStatement ps1 = null;
		ResultSet rs = null;
		Connection con = null;
		HttpSession session = request.getSession();
		// Connection con = null;

		// ConnectionManagerDAO con = new ConnectionManagerDAO();
		try {

			
			  UserDetails userdtl =
			  (UserDetails)session.getAttribute("userDetailsObj");
			  String email  = userdtl.getEmail();
			  String fname = userdtl.getFirstName();
			  String lname = userdtl.getLastName();
			  // String user =   fname.concat(lname);
			  String user = fname+" "+lname;
			 

			//String email = "nirmalya.goswami@in.ibm.com";
			//String user = "Nirmalya Goswami";
			Class.forName("com.ibm.db2.jcc.DB2Driver").newInstance();
			con = DriverManager.getConnection(DatabaseConnectionUtil.databaseCredentials.getJdbcURL(),
					DatabaseConnectionUtil.databaseCredentials.getUserId(),
					DatabaseConnectionUtil.databaseCredentials.getPassword());

			// con.getConnection();
			String query = "select * from QUESTIONS where ENABLED = 'Y'";
			ps1 = con.prepareStatement(query);
			rs = ps1.executeQuery();
			JSONArray jsonArray = new JSONArray();
			while (rs.next())

			{
				int total_col = rs.getMetaData().getColumnCount();
				// int rows = rs.getMetaData().
				JSONObject obj = new JSONObject();

				for (int i = 0; i < total_col; i++) {

					obj.put(rs.getMetaData().getColumnLabel(i + 1).toLowerCase(), rs.getObject(i + 1));
					/*
					 * obj.put("emailid", email); obj.put("name", user);
					 */

				}

				obj.put("emailid", email);
				obj.put("name", user);

				jsonArray.add(obj);

			}

			PrintWriter pw1 = response.getWriter();
			pw1.write(jsonArray.toJSONString());
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		finally {
			try {
				ps1.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String q1_feedback = request.getParameter("txtfeedb0");
		String q2_feedback = request.getParameter("txtfeedb1");
		String q3_feedback = request.getParameter("txtfeedb2");
		String q4_feedback = request.getParameter("txtfeedb3");
		String q5_feedback = request.getParameter("txtfeedb4");
		String feedback_stat = request.getParameter("txtfeedb5");

		String ibmer_name = request.getParameter("idvalues");
		Integer uid = Integer.parseInt(ibmer_name);

		String email = request.getParameter("email");
		String group = request.getParameter("txtgroup");
		String comments = request.getParameter("txtcom");

		PreparedStatement ps2 = null;
		PreparedStatement ps3 = null;
		Connection con1 = null;
		HttpSession session = request.getSession();

		try {
			try {
				Class.forName("com.ibm.db2.jcc.DB2Driver").newInstance();
				con1 = DriverManager.getConnection(DatabaseConnectionUtil.databaseCredentials.getJdbcURL(),
						DatabaseConnectionUtil.databaseCredentials.getUserId(),
						DatabaseConnectionUtil.databaseCredentials.getPassword());
			} catch (SQLException | InstantiationException | IllegalAccessException | ClassNotFoundException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			String query = "insert into FEEDBACK (\"QUESTION1_FEEDBACK\",\"QUESTION2_FEEDBACK\",\"QUESTION3_FEEDBACK\",\"QUESTION4_FEEDBACK\",\"QUESTION5_FEEDBACK\",\"QUETION_GROUP\",\"COMMENT\",\"FEEDBACK_DATE\",\"ID\") values(?,?,?,?,?,?,?,?,?)";

			try {

				ps2 = con1.prepareStatement(query);
				System.out.println("Query" + query);
				ps2.setString(1, q1_feedback);
				ps2.setString(2, q2_feedback);
				ps2.setString(3, q3_feedback);
				ps2.setString(4, q4_feedback);
				ps2.setString(5, q5_feedback);
				// ps2.setString(6, ibmer_name);
				ps2.setString(6, group);
				ps2.setString(7, comments);
				java.sql.Timestamp date_create = new java.sql.Timestamp(new java.util.Date().getTime());
				ps2.setTimestamp(8, date_create);
				ps2.setInt(9, uid);
				ps2.executeUpdate();

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			finally {
				try {
					ps2.close();

				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}

		}

		catch (Exception e2) {
			e2.printStackTrace();
		}

		finally {
			try {
				con1.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}
}