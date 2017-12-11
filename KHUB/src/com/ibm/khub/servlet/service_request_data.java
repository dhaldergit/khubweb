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
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.ibm.khub.pojo.UserDetails;
import com.ibm.khub.util.DatabaseConnectionUtil;

/**
 * Servlet implementation class service_request_data
 */
public class service_request_data extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Connection con1 = null;

		PreparedStatement ps1 = null;
		PreparedStatement ps2 = null;
		PreparedStatement ps3 = null;
		PreparedStatement ps4 = null;
		PreparedStatement ps5 = null;
		PreparedStatement ps6 = null;
		PreparedStatement ps7 = null;
		PreparedStatement ps8 = null;
		String country = null;
		String industry = null;
		String sector = null;
		String service_area = null;
		String user = null;
		String geoname = null;
		String type_desc = null;
		String camss = null;
		String ccode = null;
		String gcode = null;
		String rcode = null;
		String country_user = null;
		HttpSession session = request.getSession();

		ResultSet rs1 = null;
		ResultSet rs2 = null;
		ResultSet rs3 = null;
		ResultSet rs4 = null;
		ResultSet rs5 = null;
		ResultSet rs6 = null;
		ResultSet rs7 = null;
		ResultSet rs8 = null;
		JSONObject json = new JSONObject();
		JSONObject country_code =  new JSONObject();
		List<String> countrylist = new ArrayList<String>();
		List<String> industrylist = new ArrayList<String>();
		List<String> sectorlist = new ArrayList<String>();
		List<String> yearlist = new ArrayList<String>();
		List<String> srvclist = new ArrayList<String>();
		List<String> geolist = new ArrayList<String>();
		List<String> typlist = new ArrayList<String>();
		List<String> camlist = new ArrayList<String>();
		//List<String> country_code = new ArrayList<String>();
		try {

			
			  UserDetails userdtl =
			  (UserDetails)session.getAttribute("userDetailsObj");
			  String email  = userdtl.getEmail();
			  String fname = userdtl.getFirstName();
			  String lname = userdtl.getLastName();
			  // String user =   fname.concat(lname);
			  String name = fname+" "+lname;
			
			//String name = "Nirmalya Goswami";
			//String email = "nirmalya.goswami@in.ibm.com";
			 

			String a[] = email.split("\\@");
			String[] x = a[1].split("\\.");
		//	System.out.println("the array is ::"+a[1]);
			 country_user = x[0];
			session.setAttribute("user_country", country_user);
			/*String name = "Sudipta Dasgupta";*/

			Class.forName("com.ibm.db2.jcc.DB2Driver").newInstance();
			con1 = DriverManager.getConnection(DatabaseConnectionUtil.databaseCredentials.getJdbcURL(),
					DatabaseConnectionUtil.databaseCredentials.getUserId(),
					DatabaseConnectionUtil.databaseCredentials.getPassword());

			String query1 = "select COUNTRY_NAME from COUNTRY order by COUNTRY_NAME";
			
			String query_code = "select COUNTRY_NAME , IOT, IMT from COUNTRY where UPPER(COUNTRY_CODE)=UPPER(?)";
			String query2 = "select distinct INDUSTRY_NAME from INDUSTRY_LIST";
			String query3 = "select distinct YEAR  from KH_CONTENT WHERE IS_DELETED = 'N'";
			String query4 = "select distinct SERVICE_LINE_NAME from SERVICE_LINE_LIST";
			String query_geo = "select distinct  IOT  from COUNTRY";
			//String query_type = "select distinct TYPE from KH_CONTENT WHERE IS_DELETED = 'N'";
			String query_type = "select distinct CONTENT_TYPE_NAME from CONTENT_TYPE";
			String query_cams = "select distinct  GROWTH_INITIATIVE_NAME from GROWTH_INITIATIVE";
			ps1 = con1.prepareStatement(query1);
			ps2 = con1.prepareStatement(query2);
			ps3 = con1.prepareStatement(query3);
			ps4 = con1.prepareStatement(query4);
			ps5 = con1.prepareStatement(query_geo);
			ps6 = con1.prepareStatement(query_type);
			ps7 = con1.prepareStatement(query_cams);
			ps8 = con1.prepareStatement(query_code);
			ps8.setString(1, country_user);
			rs1 = ps1.executeQuery();
			rs2 = ps2.executeQuery();
			rs3 = ps3.executeQuery();
			rs4 = ps4.executeQuery();
			rs5 = ps5.executeQuery();
			rs6 = ps6.executeQuery();
			rs7 = ps7.executeQuery();
			rs8 = ps8.executeQuery();
			while (rs1.next())

			{
				country = rs1.getString(1);

				countrylist.add(country);

			}

			// System.out.println("the countries are"+countrylist);

			while (rs2.next())

			{
				industry = rs2.getString(1);

				industrylist.add(industry);

			}

			while (rs3.next())

			{
				user = rs3.getString(1);
				if (rs3.wasNull())
					user = " ";
				yearlist.add(user);

			}

			while (rs4.next())

			{
				service_area = rs4.getString(1);

				srvclist.add(service_area);

			}

			while (rs5.next())

			{
				geoname = rs5.getString(1);

				geolist.add(geoname);

			}

			while (rs6.next())

			{
				type_desc = rs6.getString(1);

				typlist.add(type_desc);

			}

			while (rs7.next())

			{
				camss = rs7.getString(1);

				camlist.add(camss);

			}
			
			
			
			
			
			while (rs8.next())

			{
				ccode = rs8.getString(1);
				gcode = rs8.getString(2);
				rcode = rs8.getString(3);

				country_code.put("ccode",ccode);
				country_code.put("gcode",gcode);
				country_code.put("rcode",rcode);

			}
			
			Calendar calendar = Calendar.getInstance();
		    java.sql.Date JDateObject = new java.sql.Date(calendar.getTime().getTime()); 
		    DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
		    String textdate = df.format(JDateObject);
		    
		    SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
		    Calendar c = Calendar.getInstance();
		    c.setTime(new Date()); // Now use today date.
		    c.add(Calendar.DATE, 14); // Adding 5 days
		    String newdate = sdf.format(c.getTime());
			// System.out.println("The year is :"+yearlist);
			response.setContentType("application/json");
			response.setCharacterEncoding("utf-8");
			PrintWriter pw1 = response.getWriter();

			json.put("cntrylist", countrylist);
			json.put("indslist", industrylist);
			json.put("yrlist", yearlist);
			json.put("email", email);
			json.put("srvlist", srvclist);
			json.put("geolist", geolist);
			json.put("typelist", typlist);
			json.put("camlist", camlist);
			json.put("country_code", country_code);
			json.put("name", name);
			json.put("textdate", textdate);
			json.put("newdate", newdate);
			
			pw1.write(json.toString().trim());

		}

		catch (Exception e1) {
			e1.printStackTrace();
		}

		finally {
			try {
				if (ps1 != null) {
					ps1.close();
				}
				if (ps2 != null) {
					ps2.close();
				}

				if (ps3 != null) {
					ps3.close();
				}
				if (ps4 != null) {
					ps4.close();
				}

				if (ps5 != null) {
					ps5.close();
				}
				if (ps6 != null) {
					ps6.close();
				}

				if (ps7 != null) {
					ps7.close();
				}
				
				if (ps8 != null) {
					ps8.close();
				}
				if (con1 != null) {
					con1.close();
				}
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}

	}

}
