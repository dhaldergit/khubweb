package com.ibm.khub.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.eclipsesource.json.Json;
import com.eclipsesource.json.JsonObject;
import com.google.gson.Gson;
import com.ibm.khub.util.DatabaseConnectionUtil;
import com.sendgrid.Content;
import com.sendgrid.Email;
import com.sendgrid.Mail;
import com.sendgrid.Method;
import com.sendgrid.Request;
import com.sendgrid.Response;
import com.sendgrid.SendGrid;

/**
 * Servlet implementation class updateRequest
 */
public class updateRequest extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("inside servlet");

		PrintWriter out = response.getWriter();

		response.setContentType("text/json");

		Connection con = null;
		PreparedStatement ps = null;
		PreparedStatement ps1 = null;
		String id = null;
		String val = null;

		String jsvalue = request.getParameter("tableData");
		System.out.println("table data:" + jsvalue);

		try {
			Class.forName("com.ibm.db2.jcc.DB2Driver").newInstance();
			con = DriverManager.getConnection(DatabaseConnectionUtil.databaseCredentials.getJdbcURL(),
					DatabaseConnectionUtil.databaseCredentials.getUserId(),
					DatabaseConnectionUtil.databaseCredentials.getPassword());

			JSONParser jParser = new JSONParser();
			System.out.println("the values are :" + jsvalue);
			JSONObject jsonObj = null;
			try {
				jsonObj = (JSONObject) jParser.parse(jsvalue);

			} catch (org.json.simple.parser.ParseException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}

			JSONArray jarray = new JSONArray();
			jarray = (JSONArray) jsonObj.get("khReqData");
			Iterator itr = jarray.iterator();
			while (itr.hasNext()) {
				JSONObject jObj = (JSONObject) itr.next();
				val = (String) jObj.get("yesNo");
				
				id = (String) jObj.get("colId");

				String query = "update SERVICE_REQUEST_KHUB set IS_COMPLETE = ? , COMPLETED_DATE = Current_Date where ID = ? ";

				ps = con.prepareStatement(query);

				ps.setString(1, val);
				ps.setString(2, id);
				ps.executeUpdate();

			}

			PrintWriter pw = response.getWriter();
			pw.write("".toString());

		}

		catch (Exception e) {
			e.printStackTrace();
		}

		finally {
			try {
				ps.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}
}
