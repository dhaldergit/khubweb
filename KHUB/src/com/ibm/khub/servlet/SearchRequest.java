package com.ibm.khub.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.ibm.khub.pojo.DropDownProp;
import com.ibm.khub.util.DatabaseConnectionUtil;
import com.ibm.khub.util.ProposalUtil;

/**
 * Sudipta Dasgupta
 */
public class SearchRequest extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		PreparedStatement ps1 =  null;
		Connection con1 = null;

	
		String heading=null;
		String url=null;
		String desc =  null;
		ResultSet rs =  null;
		String group = null ; 
		String country = null;
		String indus =null;
		String req_desc = null;
		Date strt_dt = null;
		String sctr = null;
		String comp = null ; 
		String opname = null;
		String oppnumbr =null;
		String won = null;
		String clnt_nm = null;
		String typ = null;
		String rqstor = null;
		String end_dt = null;
		String is_complete = null;
		Integer id = null;
		String date_to_string = null;
		SimpleDateFormat sdfr = new SimpleDateFormat("dd-MMM-yyyy");
		String datestring =  null;
		PrintWriter pw = null;
		
		String oppnumb =  request.getParameter("txtoppno");
		String industry = request.getParameter("inds");
		
		String  clnt = request.getParameter("clntnm");
		String oppname = request.getParameter("oppname");
		String grp = request.getParameter("txtrfp");
		String rqstr = request.getParameter("rqstr");
		String stdate = request.getParameter("date");
		String dt_mod = null;
		
		
		JSONObject json;
		JSONArray jsonArray = new JSONArray();

		try
		{
			Class.forName("com.ibm.db2.jcc.DB2Driver").newInstance();
			 con1 = DriverManager.getConnection(DatabaseConnectionUtil.databaseCredentials.getJdbcURL(),DatabaseConnectionUtil.databaseCredentials.getUserId(),DatabaseConnectionUtil.databaseCredentials.getPassword());
			String query = "select  GROUP , COUNTRY , INDUSTRY , REQUEST_DESCRIPTION , START_DATE , "
					+ "SECTOR,COMPETITOR , OPP_NAME , OPP_NO , WON , CLIENT_NAME ,"
					+ " TYPE , REQUESTOR ,IS_COMPLETE,ID from SERVICE_REQUEST_KHUB "
					+ " where ";


			Boolean isParameterPresent = false;

			if (StringUtils.isNotBlank(oppnumb)) {
				
				if (isParameterPresent) {
					query = query + " AND OPP_NO= '" + oppnumb + "'";

				} else {
					query = query + " OPP_NO= '" + oppnumb + "'";
					isParameterPresent = true;
				}
			}


			if (StringUtils.isNotBlank(industry)) {

				if (isParameterPresent) {
					query = query + " AND INDUSTRY= '" + industry+"'";

				} else {
					query = query + " INDUSTRY= '" + industry+"'";
					isParameterPresent = true;
				}
			}
			if (StringUtils.isNotBlank(clnt)) {

				if (isParameterPresent) {
					query = query + " AND CLIENT_NAME= '" + clnt+"'";

				} else {
					query = query + " CLIENT_NAME= '" + clnt+"'";
					isParameterPresent = true;
				}
			}
			if (StringUtils.isNotBlank(oppname)) {

				if (isParameterPresent) {
					query = query + " AND OPP_NAME= '" + oppname+"'";

				} else {
					query = query + " OPP_NAME= '" + oppname+"'";
					isParameterPresent = true;
				}
			}

			if (StringUtils.isNotBlank(grp)) {

				if (isParameterPresent) {
					query = query + " AND GROUP= '" + grp+"'";

				} else {
					query = query + " GROUP= '" + grp+"'";
					isParameterPresent = true;
				}
			}

			if (StringUtils.isNotBlank(rqstr)) {

				if (isParameterPresent) {
					query = query + " AND REQUESTOR= '" + rqstr+"'";

				} else {
					query = query + " REQUESTOR= '" + rqstr+"'";
					isParameterPresent = true;
				}
			}


			
			if(!stdate.isEmpty())
			{
				String start_dt[]  =  stdate.split("-");
				for(int i=0; i < start_dt.length; i++){
				//	System.out.println(start_dt[i]);
				}
			String dt = start_dt[0];
			String mon = start_dt[1];
			String year = start_dt[2];

			if(Integer.parseInt(dt)<10)
			{
				//dt = "0"+ dt ;
				dt = "0".concat(dt);
			}
			if(Integer.parseInt(mon)<10)
			{
				//mon = "0"+ mon ;
				mon = "0".concat(mon);
			}


			dt_mod  = dt.concat("-").concat(mon).concat("-").concat(year);

			//System.out.println("the dt_mod is "+dt_mod);
			 SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
	         java.util.Date uDt = null;
	         try {
	 			uDt = sdf.parse(dt_mod);
	 			
	 		//	System.out.println("The date is udt:"+uDt);
	 		} catch (ParseException e) {
	 			// TODO Auto-generated catch block
	 			e.printStackTrace();
	 		}
	         
	          java.sql.Date dt_req = new Date(uDt.getTime());
	          
	          if (isParameterPresent) {
					query = query + " AND START_DATE <= '" + dt_req+"'";

				} else {
					query = query + " START_DATE <= '" + dt_req+"'";
					isParameterPresent = true;
				}

			}
			

				
			




			//System.out.println("The query is :" +query);

			ps1 = con1.prepareStatement(query);

			rs = ps1.executeQuery();


			while(rs.next())
			{
				 
				group  = rs.getString(1);
				country = rs.getString(2);
				indus =rs.getString(3);
				req_desc = rs.getString(4);
				// strt_dt = rs.getString(5);
				strt_dt = rs.getDate(5);
			//	System.out.println("The date is :"+strt_dt);


				datestring = sdfr.format(strt_dt);	

				/*SimpleDateFormat dateformatJava = new SimpleDateFormat("dd-MM-yyyy");
				date_to_string = dateformatJava.format(strt_dt);*/
			//	System.out.println("The value is:"+datestring);

				sctr =rs.getString(6);
				comp = rs.getString(7); 
				opname = rs.getString(8);
				oppnumbr =rs.getString(9);
				won = rs.getString(10);
				clnt_nm = rs.getString(11);
				typ = rs.getString(12);
				rqstor = rs.getString(13);
				is_complete = rs.getString(14);
				id = rs.getInt(15);


				json = new JSONObject();
				json.put("group",group);
				json.put("country", country);
				json.put("indus",indus);
				json.put("req_desc", req_desc);
				json.put("strt_dt",datestring);
				json.put("sctr", sctr);
				json.put("comp",comp);
				json.put("opname", opname);
				json.put("oppnumbr", oppnumbr);
				json.put("won",won);
				json.put("clnt_nm", clnt_nm);
				json.put("typ",typ);
				json.put("rqstor", rqstor);
				
			List<DropDownProp> contentlist = new ArrayList<DropDownProp>();
			
			DropDownProp dnew = new DropDownProp();
			dnew.setId("Y");
			dnew.setData("Y");
			contentlist.add(dnew);
			
			 dnew = new DropDownProp();
				dnew.setId("N");
				dnew.setData("N");
				contentlist.add(dnew);
				String htmlstr = "";
			htmlstr = ProposalUtil.createDropDownHTML(contentlist, is_complete, true, null);
			
				json.put("is_complete", htmlstr);
				json.put("id", id);
				/*json.put("end_dt", end_dt);*/
			//	System.out.println("the json values are :" +json);

				jsonArray.add(json);

			}
			response.setContentType("application/json");
			response.setCharacterEncoding("utf-8");
			pw = response.getWriter();


			pw.write(jsonArray.toJSONString());
			// pw.write(json.toString());



		}
		catch(Exception e1)
		{
			e1.printStackTrace();
		}



		finally
		{
			try {
				if(ps1!=null)
				{		
					ps1.close();
				}
				if(con1!=null)
				{	
					con1.close();
				}

				/*if(json.toString()!=null)
				{
					pw.close();
				}*/
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
	}

}
