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
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.ibm.khub.util.DatabaseConnectionUtil;

/**
 * Servlet implementation class getToken
 */
public class getToken extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getToken() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		PreparedStatement ps1 = null;
		ResultSet rs = null;
		Connection con = null;
		HttpSession session = request.getSession();
		// Connection con = null;

		// ConnectionManagerDAO con = new ConnectionManagerDAO();
		try {
			
			
			Class.forName("com.ibm.db2.jcc.DB2Driver").newInstance();
			con = DriverManager.getConnection(DatabaseConnectionUtil.databaseCredentials.getJdbcURL(),DatabaseConnectionUtil.databaseCredentials.getUserId(),DatabaseConnectionUtil.databaseCredentials.getPassword());

			// con.getConnection();
			String query = "select * from \"BOX_TOKEN\"";
			ps1 = con.prepareStatement(query);
			rs = ps1.executeQuery();
			JSONArray jsonArray = new JSONArray();
			while (rs.next())

			{
				int total_col = rs.getMetaData().getColumnCount();
				
				JSONObject obj = new JSONObject();

				for (int i = 0; i < total_col; i++) {

					obj.put(rs.getMetaData().getColumnLabel(i + 1).toLowerCase(), rs.getObject(i + 1));
					

				}
				
				System.out.println("The token value is ::"+obj);
				// jsonArray.add(obj);
				// System.out.println("The token value is ::"+jsonArray); 
				PrintWriter pw = response.getWriter();
				pw.write(obj.toJSONString());
				
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


