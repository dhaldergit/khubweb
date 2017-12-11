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

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.ibm.khub.util.DatabaseConnectionUtil;

/**
 * Servlet implementation class getContent
 */
public class getContent extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public getContent() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html;charset=UTF-8");

		Connection con = null;
		PreparedStatement ps = null;
		PreparedStatement ps1 = null;

		String heading = null;
		String url = null;
		String desc = null;
		ResultSet rs = null;
		ResultSet rs1 = null;
		SimpleDateFormat sdfr = new SimpleDateFormat("dd-MMM-yyyy");
		String datestring = null;
		String cntry1 = null;
		String year2 = null;
		String sr1 = null;
		String indus1 = null;
		String geo1 = null;
		String technology1 = null;
		String cam = null;
		String key = null;
		try {
			Class.forName("com.ibm.db2.jcc.DB2Driver").newInstance();
			con = DriverManager.getConnection(DatabaseConnectionUtil.databaseCredentials.getJdbcURL(),
					DatabaseConnectionUtil.databaseCredentials.getUserId(),
					DatabaseConnectionUtil.databaseCredentials.getPassword());

			String query = "select CONTENT_NAME, LINK, YEAR , TYPE, SERVICE_LINE, INDUSTRY, GEO, GROWTHAREA_CAMSS from KH_CONTENT WHERE IS_DELETED = 'N' ORDER BY DATE_PUBLISHED DESC";

			ps1 = con.prepareStatement(query);

			rs = ps1.executeQuery();

			JSONArray jsonArray = new JSONArray();

			while (rs.next())

			{
				int total_col = rs.getMetaData().getColumnCount();
				// int rows = rs.getMetaData().
				JSONObject obj = new JSONObject();

				for (int i = 0; i < total_col; i++) {

					if (rs.getMetaData().getColumnLabel(i + 1).equalsIgnoreCase("year")
							&& (rs.getString("year") == null)) {

						String year1 = " ";
						year2 = year1.replace("null", " ");

						obj.put(rs.getMetaData().getColumnLabel(i + 1).toLowerCase(), year2);

					}

					else if (rs.getMetaData().getColumnLabel(i + 1).equalsIgnoreCase("service_line")
							&& (rs.getString("service_line") == null)) {

						String sr = " ";
						sr1 = sr.replace("null", " ");

						obj.put(rs.getMetaData().getColumnLabel(i + 1).toLowerCase(), sr1);

					}

					else if (rs.getMetaData().getColumnLabel(i + 1).equalsIgnoreCase("industry")
							&& (rs.getString("industry") == null)) {

						String indus = " ";
						indus1 = indus.replace("null", " ");

						obj.put(rs.getMetaData().getColumnLabel(i + 1).toLowerCase(), indus1);

					}

					else if (rs.getMetaData().getColumnLabel(i + 1).equalsIgnoreCase("geo")
							&& (rs.getString("geo") == null)) {

						String geog = " ";
						geo1 = geog.replace("null", " ");

						obj.put(rs.getMetaData().getColumnLabel(i + 1).toLowerCase(), geo1);

					}

					else if (rs.getMetaData().getColumnLabel(i + 1).equalsIgnoreCase("GROWTHAREA_CAMSS")
							&& (rs.getString("GROWTHAREA_CAMSS") == null)) {

						String cam1 = " ";
						cam = cam1.replace("null", " ");

						obj.put(rs.getMetaData().getColumnLabel(i + 1).toLowerCase(), cam);

					}

					else {

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
