package com.ibm.khub.servlet;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.ibm.khub.util.DatabaseConnectionUtil;

/**
 * Servlet implementation class marketinsight
 */
public class marketinsight extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PreparedStatement ps1 = null;
		Connection con1 = null;

		/*
		 * String user= "dash5335"; String password = "63luaq9PQIrU"; String
		 * schemaName = "DASH5335";
		 */

		String heading = null;
		String url = null;
		String desc = null;
		ResultSet rs = null;

		SimpleDateFormat sdfr = new SimpleDateFormat("dd-MMM-yyyy");
		String datestring = null;

		try {
			Class.forName("com.ibm.db2.jcc.DB2Driver").newInstance();
			con1 = DriverManager.getConnection(DatabaseConnectionUtil.databaseCredentials.getJdbcURL(),
					DatabaseConnectionUtil.databaseCredentials.getUserId(),
					DatabaseConnectionUtil.databaseCredentials.getPassword());

			String query = "select * from KH_CONTENT_STORE where IS_DELETED = 'N' and type='Market Insights' order by DATE_PUBLISHED DESC";
			ps1 = con1.prepareStatement(query);

			rs = ps1.executeQuery();
			JSONArray jsonArray = new JSONArray();

			while (rs.next()) {

				int total_col = rs.getMetaData().getColumnCount();
				// int rows = rs.getMetaData().
				JSONObject obj = new JSONObject();

				for (int i = 0; i < total_col; i++) {
					if (rs.getMetaData().getColumnLabel(i + 1).equalsIgnoreCase("date_published")) {
						Date date = rs.getDate("date_published");
						datestring = sdfr.format(date);
						// System.out.println("The date:"+datestring);
						obj.put(rs.getMetaData().getColumnLabel(i + 1).toLowerCase(), datestring);
					}

					else if (rs.getMetaData().getColumnLabel(i + 1).equalsIgnoreCase("short_desc")
							&& (rs.getString("short_desc") == null)) {
						// String short_description = "";
						// short_description1 =
						// short_description.replace("null", "");

						// System.out.println("The description
						// is:"+short_description1);
						/*
						 * obj.put(rs.getMetaData().getColumnLabel(i + 1)
						 * .toLowerCase(), short_description);
						 */
					} else {

						obj.put(rs.getMetaData().getColumnLabel(i + 1).toLowerCase(), rs.getObject(i + 1));
						// jsonArray.add(obj);
					}

				}
				// System.out.println("The value of the object is"+obj);
				jsonArray.add(obj);

			}

			PrintWriter pw = response.getWriter();
			pw.write(jsonArray.toJSONString());

		}

		catch (Exception e1) {

			e1.printStackTrace();
		} finally {
			try {
				ps1.close();
				// ps2.close();
				con1.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

}
