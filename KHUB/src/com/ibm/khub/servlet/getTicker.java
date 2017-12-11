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
 * Sudipta Dasgupta
 */
public class getTicker extends HttpServlet {

    public getTicker() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection con =  null;
		PreparedStatement pst = null;
		ResultSet rs =  null;
		SimpleDateFormat sdfr = new SimpleDateFormat("dd-MM-yyyy");
		String datestring =  null;
		
		try
		{
			Class.forName("com.ibm.db2.jcc.DB2Driver").newInstance();
			
			con = DriverManager.getConnection(DatabaseConnectionUtil.databaseCredentials.getJdbcURL(),DatabaseConnectionUtil.databaseCredentials.getUserId(),DatabaseConnectionUtil.databaseCredentials.getPassword());
			
			String query_ticker = "select * from  TICKERS";
			pst = con.prepareStatement(query_ticker);

			rs = pst.executeQuery();
			JSONArray jsonArray = new JSONArray();
			
			
			while(rs.next())
			{
				int total_col = rs.getMetaData().getColumnCount();
				//int rows = rs.getMetaData().
				JSONObject objticker = new JSONObject();
				
				
				for(int j=0;j<total_col ; j++)
				{
					
					
					if(rs.getMetaData().getColumnLabel(j + 1).equalsIgnoreCase("date_published"))
					{
						Date date = rs.getDate("date_published");
						datestring  = sdfr.format(date);
					//System.out.println("The date:"+datestring);
						/*obj.put(rs.getMetaData().getColumnLabel(i + 1)
								.toLowerCase(), datestring);*/
					objticker.put(rs.getMetaData().getColumnLabel(j + 1)
							.toLowerCase(), datestring);
					
					}

					
					
					
					else
					{
					
					objticker.put(rs.getMetaData().getColumnLabel(j + 1)
							.toLowerCase(), rs.getObject(j + 1));
					}
				}
				
				jsonArray.add(objticker);
			}
			
			PrintWriter pw =  response.getWriter();
			pw.write(jsonArray.toJSONString());
		}
		
		
		catch(Exception e)
		{
			
			e.printStackTrace();
		}
		
		

		finally
		{
			try {
				pst.close();
				//	ps2.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		
	}

}
