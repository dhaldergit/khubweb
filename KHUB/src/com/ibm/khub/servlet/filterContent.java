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

import org.apache.commons.lang3.StringUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.ibm.khub.util.DatabaseConnectionUtil;

/**
 * Servlet implementation class filterContent
 */
public class filterContent extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		/* response.setContentType("text/html;charset=UTF-8"); */

		Connection con = null;

		PreparedStatement ps1 = null;

		String url = null;

		ResultSet rs = null;

		String year1 = request.getParameter("txtyear");

		String type = request.getParameter("txttyp");
		String cntry = request.getParameter("txtcntry");
		String indus = request.getParameter("indus");

		String sarea = request.getParameter("servic");
		String geo_name = request.getParameter("txtgeo");
		String cam_details = request.getParameter("txtcam");

		String content_name = null;
		String countr = null;
		String yr = null;
		String types = null;
		String indstry = null;
		String service_area = null;
		String geo_detail = null;
		String camss = null;
		String key = null;
		// String cam = null;

		JSONObject json;
		JSONArray jsonArray = new JSONArray();

		try {
			Class.forName("com.ibm.db2.jcc.DB2Driver").newInstance();

			con = DriverManager.getConnection(DatabaseConnectionUtil.databaseCredentials.getJdbcURL(),
					DatabaseConnectionUtil.databaseCredentials.getUserId(),
					DatabaseConnectionUtil.databaseCredentials.getPassword());

			String query = "select CONTENT_NAME,LINK , YEAR ,   TYPE,SERVICE_LINE , INDUSTRY,GEO, GROWTHAREA_CAMSS from KH_CONTENT"
					+ " where  ";

			Boolean isParameterPresent = false;

			if (StringUtils.isNotBlank(year1) && StringUtils.isNotEmpty(year1)) {

				if (isParameterPresent) {
					query = query + " AND YEAR= '" + year1 + "'";

				} else {
					query = query + " YEAR= '" + year1 + "'";
					isParameterPresent = true;
				}
			}

			if (StringUtils.isNotBlank(type)) {

				if (isParameterPresent) {
					query = query + " AND TYPE= '" + type + "'";

				} else {
					query = query + " TYPE= '" + type + "'";
					isParameterPresent = true;
				}
			}
			if (StringUtils.isNotBlank(cntry)) {

				if (isParameterPresent) {
					query = query + " AND COUNTRY= '" + cntry + "'";

				} else {
					query = query + " COUNTRY= '" + cntry + "'";
					isParameterPresent = true;
				}
			}
			if (StringUtils.isNotBlank(indus)) {

				if (isParameterPresent) {
					query = query + " AND INDUSTRY= '" + indus + "'";

				} else {
					query = query + " INDUSTRY= '" + indus + "'";
					isParameterPresent = true;
				}
			}

			if (StringUtils.isNotBlank(sarea)) {

				if (isParameterPresent) {
					query = query + " AND SERVICE_LINE= '" + sarea + "'";

				} else {
					query = query + " SERVICE_LINE= '" + sarea + "'";
					isParameterPresent = true;
				}
			}

			if (StringUtils.isNotBlank(geo_name)) {

				if (isParameterPresent) {
					query = query + " AND GEO= '" + geo_name + "'";

				} else {
					query = query + " GEO= '" + geo_name + "'";
					isParameterPresent = true;
				}
			}

			if (StringUtils.isNotBlank(cam_details)) {

				if (isParameterPresent) {
					query = query + " AND GROWTHAREA_CAMSS= '" + cam_details + "'";

				} else {
					query = query + " GROWTHAREA_CAMSS= '" + cam_details + "'";
					isParameterPresent = true;
				}
			}

			ps1 = con.prepareStatement(query);

			rs = ps1.executeQuery();

			// System.out.println("The query is :" +query);
			while (rs.next()) {

				content_name = rs.getString(1);
				if (rs.wasNull())
					content_name = " ";
				url = rs.getString(2);
				yr = rs.getString(3);
				if (rs.wasNull())
					yr = " ";

				types = rs.getString(4);
				if (rs.wasNull())
					types = " ";
				service_area = rs.getString(5);
				if (rs.wasNull())
					service_area = " ";
				indstry = rs.getString(6);
				if (rs.wasNull())
					indstry = " ";

				geo_detail = rs.getString(7);

				if (rs.wasNull())
					geo_detail = " ";

				camss = rs.getString(8);

				if (rs.wasNull())
					camss = " ";

				// strt_dt = rs.getString(5);

				json = new JSONObject();
				json.put("content_name", content_name);
				json.put("url", url);
				json.put("year", yr);
				/* json.put("country", countr); */
				json.put("type", types);
				json.put("service_area", service_area);
				json.put("industry", indstry);
				json.put("geo_detail", geo_detail);
				json.put("camss", camss);

				// System.out.println("the json values are :" +json);

				jsonArray.add(json);

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
