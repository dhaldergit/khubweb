package com.ibm.khub.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.ibm.khub.util.DatabaseConnectionUtil;

/**
 * Servlet implementation class filtergeo
 */
public class filtergeo extends HttpServlet {
		
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		Connection con = null;

		PreparedStatement ps1 = null;
		PreparedStatement ps2 = null;
		String url = null;

		ResultSet rs = null;
		ResultSet rs1 = null;
		String country_name = request.getParameter("txtcntry");
	//	System.out.println("The country"+country_name);
		String industry_det = request.getParameter("txtind");
	//	System.out.println("The industry::"+industry_det);
		String geography = null;
		String region = null;
		String sector_details = null;
		
		JSONObject json = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		
		try
		{
		Class.forName("com.ibm.db2.jcc.DB2Driver").newInstance();

		con = DriverManager.getConnection(DatabaseConnectionUtil.databaseCredentials.getJdbcURL(),
				DatabaseConnectionUtil.databaseCredentials.getUserId(),
				DatabaseConnectionUtil.databaseCredentials.getPassword());

		String query = "select IOT,IMT  from COUNTRY"
				+ " where  ";

		String query_sector = "select  SECTOR  from INDUSTRY_LIST"
				+ " where  ";
		Boolean isParameterPresent = false;
		if (StringUtils.isNotBlank(country_name) && StringUtils.isNotEmpty(country_name)) {

			if (isParameterPresent) {
				query = query + " AND COUNTRY_NAME= '" + country_name + "'";

			} else {
				query = query + " COUNTRY_NAME= '" + country_name + "'";
				isParameterPresent = true;
			}
		}
		
		
		
	Boolean isParameterinds = false;
		
		if (StringUtils.isNotBlank(industry_det) && StringUtils.isNotEmpty(industry_det)) {

			if (isParameterinds) {
				query_sector = query_sector + " AND INDUSTRY_NAME = '" + industry_det + "'";

			} else {
				query_sector = query_sector + " INDUSTRY_NAME= '" + industry_det + "'";
				isParameterinds = true;
			}
		}
		
		
		
		ps1 = con.prepareStatement(query);
		ps2 = con.prepareStatement(query_sector);

		rs = ps1.executeQuery();
		rs1 = ps2.executeQuery();
		
		
		
		while(rs.next())
		{

			
			geography = rs.getString(1);
			region = rs.getString(2);
			if (rs.wasNull()){
				geography = " ";
				region = "";
			}
		}	
		

	
		
		
		while(rs1.next())
		{
			sector_details = rs1.getString(1);
			if (rs1.wasNull())
				sector_details = " ";

			
		}
		
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		PrintWriter pw1 = response.getWriter();
		json.put("geoname", geography);
		json.put("sctrname", sector_details);
		json.put("regname", region);
		pw1.write(json.toString().trim());
		
		
		
		}
		
		catch (Exception e) {
			e.printStackTrace();
		}

		finally {
			try {
				if(ps1!=null)
				{
				ps1.close();
				}
				
				if(ps2!=null)
				{
					ps2.close();
				}
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		}

}
