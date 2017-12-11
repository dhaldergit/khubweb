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
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.ibm.khub.util.DatabaseConnectionUtil;

/**
 * Sudipta
 */
public class validatesession extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		PreparedStatement ps1 = null;
		PreparedStatement ps2 = null;
		PreparedStatement ps3 = null;
		ResultSet rs = null;
		ResultSet rs1 = null;
		String browsing_stat = null;

		Connection con = null;
		HttpSession session = request.getSession();
		String countrycode = (String) session.getAttribute("user_country");
	//	System.out.println("THE VALUES OF COUNTRY CODE IS ::::"+countrycode);
		String emailid = request.getParameter("emailid");
		String username = request.getParameter("namedtl");

		try {
			Class.forName("com.ibm.db2.jcc.DB2Driver").newInstance();
			con = DriverManager.getConnection(DatabaseConnectionUtil.databaseCredentials.getJdbcURL(),
					DatabaseConnectionUtil.databaseCredentials.getUserId(),
					DatabaseConnectionUtil.databaseCredentials.getPassword());

			String query = "select * from USERS where EMAIL = ?";

			ps1 = con.prepareStatement(query);
			ps1.setString(1, emailid);
			rs = ps1.executeQuery();

			JSONArray jsonArray = new JSONArray();
			if (rs.next())

			{
				try {
					int total_col = rs.getMetaData().getColumnCount();
					JSONObject obj = new JSONObject();

					for (int i = 0; i < total_col; i++) {

						if (rs.getMetaData().getColumnLabel(i + 1).equalsIgnoreCase("email")) {

							if (rs.getString("BROWSING").equalsIgnoreCase("N")) {

								String stat = rs.getString("BROWSING");
								obj.put("browsing_stat", stat);

								String query_update = "update USERS set \"BROWSING\" = ? ,\"LAST_VISIT\" = ?,\"COUNTRY_CODE\"=? where \"EMAIL\" = ? ";

								ps2 = con.prepareStatement(query_update);
								ps2.setString(1, "Y");
								DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
								Calendar cal = Calendar.getInstance();
								java.sql.Timestamp timestamp = new java.sql.Timestamp(cal.getTimeInMillis());

								ps2.setTimestamp(2, timestamp);
								ps2.setString(3,countrycode);
								ps2.setString(4, emailid);
								ps2.executeUpdate();
							}

							else if (rs.getString("BROWSING").equalsIgnoreCase("Y")) {
								String query_update = "update USERS set \"LAST_VISIT\" = ?,\"COUNTRY_CODE\"=? where \"EMAIL\" = ? ";

								ps2 = con.prepareStatement(query_update);
								DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
								Calendar cal = Calendar.getInstance();
								java.sql.Timestamp timestamp = new java.sql.Timestamp(cal.getTimeInMillis());

								ps2.setTimestamp(1, timestamp);
								ps2.setString(2, countrycode);	
								ps2.setString(3, emailid);
								ps2.executeUpdate();
							}

						}

						if (rs.getMetaData().getColumnLabel(i + 1).equalsIgnoreCase("feedback_status")) {

							obj.put(rs.getMetaData().getColumnLabel(8).toLowerCase(), rs.getObject(8));
						}

						if (rs.getMetaData().getColumnLabel(i + 1).equalsIgnoreCase("id")
								&& (rs.getString("id") != null)) {

							obj.put(rs.getMetaData().getColumnLabel(1).toLowerCase(), String.valueOf(rs.getObject(1)));
						}

						if (rs.getMetaData().getColumnLabel(i + 1).equalsIgnoreCase("USER_NAME")) {

							obj.put(rs.getMetaData().getColumnLabel(2).toLowerCase(), String.valueOf(rs.getObject(2)));
						}

					}
					// jsonArray.add(obj);

					PrintWriter pw1 = response.getWriter();
					pw1.write(obj.toJSONString());
					// pw1.write("{ \"feedback_status: \"1\", \"id\": \"10\"
					// }");
				}

				finally {
					// ps0.close();
					ps2.close();

				}
			}

			else {

				try {

					JSONObject obj1 = new JSONObject();
					String query_insert = "insert into USERS "
							+ "( \"EMAIL\" ,\"BROWSING\",\"CREATE_DATE\",\"LAST_VISIT\",\"FEEDBACK_STATUS\",\"ROLE_ID\",\"USER_NAME\",\"COUNTRY_CODE\")"
							+ "values (?,?,?,?,?,?,?,?) ";

					ps3 = con.prepareStatement(query_insert);

					ps3.setString(1, emailid);
					ps3.setString(2, "Y");

					java.sql.Timestamp date_create = new java.sql.Timestamp(new java.util.Date().getTime());
					java.sql.Timestamp date_accessed = new java.sql.Timestamp(new java.util.Date().getTime());
					ps3.setTimestamp(3, date_create);
					ps3.setTimestamp(4, date_accessed);
					// ps3.setString(5, "0");
					ps3.setInt(5, 0);
					ps3.setInt(6, 1);
					ps3.setString(7, username);
					ps3.setString(8, countrycode);
					ps3.executeUpdate();

					obj1.put("feedback_status", String.valueOf(0));
					PrintWriter pw2 = response.getWriter();
					pw2.write(obj1.toJSONString());

				}

				finally {

					ps3.close();
				}

			}

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

}
