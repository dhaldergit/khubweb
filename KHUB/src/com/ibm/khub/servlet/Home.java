package com.ibm.khub.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.ibm.khub.util.DatabaseConnectionUtil;

/**
 * Servlet implementation class Home
 */
public class Home extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// TODO Auto-generated method stub

		Connection con = null;
		PreparedStatement ps1 = null;
		PreparedStatement ps2 = null;

		String heading = null;
		String url = null;
		String desc = null;
		ResultSet rs = null;
		ResultSet rs1 = null;
		SimpleDateFormat sdfr = new SimpleDateFormat("dd-MM-yyyy");
		String datestring = null;
		// String short_description1 = null;

		try {
			Class.forName("com.ibm.db2.jcc.DB2Driver").newInstance();

			con = DriverManager.getConnection(DatabaseConnectionUtil.databaseCredentials.getJdbcURL(),
					DatabaseConnectionUtil.databaseCredentials.getUserId(),
					DatabaseConnectionUtil.databaseCredentials.getPassword());

			String query = "select LINK as URL, CONTENT_NAME, IS_RETIRED, DESCRIPTION as SHORT_DESC, gr.CATEGORY_NAME as CATEGORY, DATE_PUBLISHED "
					+ " from KH_CONTENT kh, CATEGORY gr, CATEGORY_TYPE_MAPPINGS ctm "
					+ " where IS_DELETED = 'N' and  kh.TYPE  = ctm.TYPE_NAME and  gr.CATEGORY_NAME = ctm.CATEGORY_NAME and UPPER(IS_RETIRED) = 'N' and UPPER(gr.CATEGORY_TYPE) = 'HOME_PAGE' "
					+ " order by DATE_PUBLISHED DESC ";

			ps1 = con.prepareStatement(query);

			rs = ps1.executeQuery();

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

				jsonArray.add(obj);

			}

			PrintWriter pw = response.getWriter();
			pw.write(jsonArray.toJSONString());

		}

		catch (Exception e) {
			e.printStackTrace();
		}

		finally {
			try {
				ps1.close();
				// ps2.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

}
