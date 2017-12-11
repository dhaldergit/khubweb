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

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.util.StringUtils;

import com.ibm.khub.pojo.UserDetails;
import com.ibm.khub.util.DatabaseConnectionUtil;
import com.sendgrid.Content;
import com.sendgrid.Email;
import com.sendgrid.Mail;
import com.sendgrid.Method;
import com.sendgrid.Request;
import com.sendgrid.Response;
import com.sendgrid.SendGrid;

/**
 * Servlet implementation class PatRequest
 */
public class request extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		
		 UserDetails userdtl = (UserDetails)session.getAttribute("userDetailsObj"); 
		 String email = userdtl.getEmail(); 
		 String fname = userdtl.getFirstName(); 
		 String lname = userdtl.getLastName(); 
		 // String user = fname.concat(lname);
		 String name = fname;

		 //String email = "nirmalya.goswami@in.ibm.com";
		 //String name = "Nirmalya"; 

		PrintWriter out = response.getWriter();
		response.setContentType("text/html;charset=UTF-8");

		Connection con = null;
		PreparedStatement ps = null;
		PreparedStatement ps2 = null;
		ResultSet rs = null;
		PreparedStatement ps3 = null;
		ResultSet rs1 = null;
		String final_date = null;
		String final_date1 = null;
		String final_date2 = null;
		String final_date3 = null;
		// Date date = null;
		SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");

		String oppNumber = request.getParameter("oppno");
/*		String geo = request.getParameter("geo");
		String reg = request.getParameter("reg");*/
		String cntry = request.getParameter("cntry");
		/*String sctr = request.getParameter("sctr");*/
		String inds = request.getParameter("inds");
		String clntnm = request.getParameter("clntnm");
		String oppname = request.getParameter("oppname");
		String comment = request.getParameter("comment");
		String psl = request.getParameter("psl");
		String ofa = request.getParameter("ofa");
		String tcv = request.getParameter("gbs");

		String oppown = request.getParameter("oppown");
		String reqdate = request.getParameter("reqstdate");

		String requester = request.getParameter("rqstr");
		String proposal = request.getParameter("typpro");
		String contract = request.getParameter("cntrtyp");
		String incumb = request.getParameter("inc");
		String mcomp = request.getParameter("mncomp");
		String ocomp = request.getParameter("othcomp");
		//String sdate = request.getParameter("stdate");
		String sdate = reqdate;
		String summary = request.getParameter("summ");
		String proDue = request.getParameter("pdp");
		String proCus = request.getParameter("pdc");
		String addCom = request.getParameter("add");
		String geo = null;
		String reg = null;
		String sctr = null;

		try {
			Class.forName("com.ibm.db2.jcc.DB2Driver").newInstance();
			con = DriverManager.getConnection(DatabaseConnectionUtil.databaseCredentials.getJdbcURL(),
					DatabaseConnectionUtil.databaseCredentials.getUserId(),
					DatabaseConnectionUtil.databaseCredentials.getPassword());

			String geo_query = "select  IOT, IMT from COUNTRY where  COUNTRY_NAME=?";
			String sector_query = "select SECTOR from INDUSTRY_LIST  where INDUSTRY_NAME = ?";
			ps2 = con.prepareStatement(geo_query);
			ps3 = con.prepareStatement(sector_query);
			ps2.setString(1, cntry);
			ps3.setString(1, inds);
			rs = ps2.executeQuery();
			rs1 = ps3.executeQuery();
			while (rs.next()) {
				geo = rs.getString(1);
				reg = rs.getString(2);
				//System.out.println("the geo/reg value is :" + geo + " / "+reg);
			}

			while (rs1.next()) {
				sctr = rs1.getString(1);
				//System.out.println("the geo value is :" + sctr);
			}

			String query = "insert into PAT_REQUEST(REQUESTOR,GEO,REGION,OPP_NO,OPP_NAME,INDUSTRY,SECTOR,OFFERING_AREA,TCV,DESC,COUNTRY,SERVICE_LINE"
					+ ",OWNER,PROPOSAL_TYPE,CONTRACT,INCUMBENT,MAIN_COMPETITOR,OTHER_COMPETITOR,START_DATE,STRATEGY"
					+ ",PROPOSAL_DUE_DATE,PROPOSAL_DUE_DATE_CUSTOMER,REQUEST_DATE,IS_COMPLETE,CLIENT_NAME) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

			String query_insert = "insert into PAT_REQUEST(REQUESTOR,GEO,REGION,OPP_NO,OPP_NAME,INDUSTRY,SECTOR,OFFERING_AREA,TCV,DESC,COUNTRY,SERVICE_LINE"
					+ ",OWNER,PROPOSAL_TYPE,CONTRACT,INCUMBENT,MAIN_COMPETITOR,OTHER_COMPETITOR,STRATEGY"
					+ ",PROPOSAL_DUE_DATE,PROPOSAL_DUE_DATE_CUSTOMER,REQUEST_DATE,IS_COMPLETE,CLIENT_NAME) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

			if (sdate.trim().equalsIgnoreCase("") || sdate.isEmpty() || sdate.length() == 0)

			{
				ps = con.prepareStatement(query_insert);

				ps.setString(1, requester);
				ps.setString(2, geo);
				ps.setString(3, reg);
				ps.setString(4, oppNumber);

				ps.setString(5, oppname);
				ps.setString(6, inds);
				ps.setString(7, sctr);
				ps.setString(8, ofa);
				//ps.setString(9, gbs);

				if (!tcv.isEmpty()) {

					double gbs1 = Double.parseDouble(tcv);
					ps.setDouble(9, gbs1);
				}

				else {
					ps.setNull(9, java.sql.Types.DOUBLE);

				}

				ps.setString(10, comment);
				ps.setString(11, cntry);
				ps.setString(12, psl);
				ps.setString(13, oppown);
				ps.setString(14, proposal);
				ps.setString(15, contract);
				ps.setString(16, incumb);
				ps.setString(17, mcomp);

				ps.setString(18, ocomp);

				ps.setString(19, summary);

				/* if (proDue != "" && proDue != null) */
				if (StringUtils.hasText(proDue) && proDue.trim().length() > 0)

				{
					String pro_due[] = proDue.split("-");
					for (int i = 0; i < pro_due.length; i++) {

					}
					String dt3 = pro_due[0];
					String mon3 = pro_due[1];
					String year3 = pro_due[2];

					if (Integer.parseInt(dt3) < 10) {
						// dt = "0"+ dt ;
						dt3 = "0".concat(dt3);
					}
					if (Integer.parseInt(mon3) < 10) {
						// mon = "0"+ mon ;
						mon3 = "0".concat(mon3);
					}

					final_date2 = dt3.concat("-").concat(mon3).concat("-").concat(year3);

					SimpleDateFormat sdf2 = new SimpleDateFormat("dd-MM-yyyy");
					java.util.Date uDt2 = null;
					try {
						uDt2 = sdf2.parse(final_date2);

					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

					java.sql.Date sqlDate2 = new Date(uDt2.getTime());
					// System.out.println("the due date is ::"+sqlDate2);

					ps.setDate(20, sqlDate2);

				}

				/* if (proCus != "" && proCus != null) */
				if (StringUtils.hasText(proCus) && proCus.trim().length() > 0) {

					String pro_Cus[] = proCus.split("-");
					for (int i = 0; i < pro_Cus.length; i++) {
						// System.out.println(pro_due[i]);
					}
					String dt4 = pro_Cus[0];
					String mon4 = pro_Cus[1];
					String year4 = pro_Cus[2];

					if (Integer.parseInt(dt4) < 10) {
						// dt = "0"+ dt ;
						dt4 = "0".concat(dt4);
					}
					if (Integer.parseInt(mon4) < 10) {
						// mon = "0"+ mon ;
						mon4 = "0".concat(mon4);
					}

					final_date3 = dt4.concat("-").concat(mon4).concat("-").concat(year4);

					SimpleDateFormat sdf3 = new SimpleDateFormat("dd-MM-yyyy");
					java.util.Date uDt3 = null;
					try {
						uDt3 = sdf3.parse(final_date3);

					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

					java.sql.Date sqlDate3 = new Date(uDt3.getTime());

					ps.setDate(21, sqlDate3);
				}

				/* if (reqdate != null && reqdate != "") */

				if (StringUtils.hasText(reqdate) && reqdate.trim().length() > 0) {

					String req_dt[] = reqdate.split("-");
					for (int i = 0; i < req_dt.length; i++) {

					}
					String dt2 = req_dt[0];
					String mon2 = req_dt[1];
					String year2 = req_dt[2];

					if (Integer.parseInt(dt2) < 10) {
						// dt = "0"+ dt ;
						dt2 = "0".concat(dt2);
					}
					if (Integer.parseInt(mon2) < 10) {
						// mon = "0"+ mon ;
						mon2 = "0".concat(mon2);
					}

					final_date1 = dt2.concat("-").concat(mon2).concat("-").concat(year2);

					SimpleDateFormat sdf1 = new SimpleDateFormat("dd-MM-yyyy");
					java.util.Date uDt1 = null;
					try {
						uDt1 = sdf1.parse(final_date1);

					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

					java.sql.Date sqlDate1 = new Date(uDt1.getTime());

					ps.setDate(22, sqlDate1);

				}

				ps.setString(23, "N");
				ps.setString(24, clntnm);

				java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());

			}

			else if (sdate.trim().length() > 0)

			{
				ps = con.prepareStatement(query);

				ps.setString(1, requester);
				 ps.setString(2, geo);
				ps.setString(3, reg);
				ps.setString(4, oppNumber);

				ps.setString(5, oppname);
				ps.setString(6, inds);
				 ps.setString(7, sctr);
				ps.setString(8, ofa);
				// ps.setString(9, gbs);

				if (!tcv.isEmpty()) {

					double gbs1 = Double.parseDouble(tcv);
					ps.setDouble(9, gbs1);
				}

				else {
					ps.setNull(9, java.sql.Types.DOUBLE);

				}

				ps.setString(10, comment);
				ps.setString(11, cntry);
				ps.setString(12, psl);
				ps.setString(13, oppown);
				ps.setString(14, proposal);
				ps.setString(15, contract);
				ps.setString(16, incumb);
				ps.setString(17, mcomp);

				ps.setString(18, ocomp);

				/*
				 * if (StringUtils.hasText(sdate) && sdate.trim().length() > 0)
				 * if (sdate != "" && sdate != null) {
				 */
				String start_dt[] = sdate.split("-");
				for (int i = 0; i < start_dt.length; i++) {

				}
				String dt1 = start_dt[0];
				String mon1 = start_dt[1];
				String year1 = start_dt[2];

				if (Integer.parseInt(dt1) < 10) {
					// dt = "0"+ dt ;
					dt1 = "0".concat(dt1);
				}
				if (Integer.parseInt(mon1) < 10) {
					// mon = "0"+ mon ;
					mon1 = "0".concat(mon1);
				}

				final_date = dt1.concat("-").concat(mon1).concat("-").concat(year1);
				SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
				java.util.Date uDt = null;
				try {
					uDt = sdf.parse(final_date);

				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				java.sql.Date sqlDate = new Date(uDt.getTime());

				// System.out.println("the sqldate details::"+sqlDate);

				ps.setDate(19, sqlDate);
				// }

				ps.setString(20, summary);

				/* if (proDue != "" && proDue != null) */
				if (StringUtils.hasText(proDue) && proDue.trim().length() > 0)

				{
					String pro_due[] = proDue.split("-");
					for (int i = 0; i < pro_due.length; i++) {

					}
					String dt3 = pro_due[0];
					String mon3 = pro_due[1];
					String year3 = pro_due[2];

					if (Integer.parseInt(dt3) < 10) {
						// dt = "0"+ dt ;
						dt3 = "0".concat(dt3);
					}
					if (Integer.parseInt(mon3) < 10) {
						// mon = "0"+ mon ;
						mon3 = "0".concat(mon3);
					}

					final_date2 = dt3.concat("-").concat(mon3).concat("-").concat(year3);

					SimpleDateFormat sdf2 = new SimpleDateFormat("dd-MM-yyyy");
					java.util.Date uDt2 = null;
					try {
						uDt2 = sdf2.parse(final_date2);

					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

					java.sql.Date sqlDate2 = new Date(uDt2.getTime());

					ps.setDate(21, sqlDate2);

				}

				else {
					ps.setNull(21, java.sql.Types.DATE);
				}
				/* if (proCus != "" && proCus != null) */
				if (StringUtils.hasText(proCus) && proCus.trim().length() > 0) {

					String pro_Cus[] = proCus.split("-");
					for (int i = 0; i < pro_Cus.length; i++) {
						// System.out.println(pro_due[i]);
					}
					String dt4 = pro_Cus[0];
					String mon4 = pro_Cus[1];
					String year4 = pro_Cus[2];

					if (Integer.parseInt(dt4) < 10) {
						// dt = "0"+ dt ;
						dt4 = "0".concat(dt4);
					}
					if (Integer.parseInt(mon4) < 10) {
						// mon = "0"+ mon ;
						mon4 = "0".concat(mon4);
					}

					final_date3 = dt4.concat("-").concat(mon4).concat("-").concat(year4);

					SimpleDateFormat sdf3 = new SimpleDateFormat("dd-MM-yyyy");
					java.util.Date uDt3 = null;
					try {
						uDt3 = sdf3.parse(final_date3);

					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

					java.sql.Date sqlDate3 = new Date(uDt3.getTime());

					ps.setDate(22, sqlDate3);
				}

				else {
					ps.setNull(22, java.sql.Types.DATE);
				}

				/* if (reqdate != null && reqdate != "") */

				if (StringUtils.hasText(reqdate) && reqdate.trim().length() > 0) {

					String req_dt[] = reqdate.split("-");
					for (int i = 0; i < req_dt.length; i++) {

					}
					String dt2 = req_dt[0];
					String mon2 = req_dt[1];
					String year2 = req_dt[2];

					if (Integer.parseInt(dt2) < 10) {
						// dt = "0"+ dt ;
						dt2 = "0".concat(dt2);
					}
					if (Integer.parseInt(mon2) < 10) {
						// mon = "0"+ mon ;
						mon2 = "0".concat(mon2);
					}

					final_date1 = dt2.concat("-").concat(mon2).concat("-").concat(year2);

					SimpleDateFormat sdf1 = new SimpleDateFormat("dd-MM-yyyy");
					java.util.Date uDt1 = null;
					try {
						uDt1 = sdf1.parse(final_date1);

					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

					java.sql.Date sqlDate1 = new Date(uDt1.getTime());

					ps.setDate(23, sqlDate1);

				}

				else {
					ps.setNull(23, java.sql.Types.DATE);
				}
				ps.setString(24, "N");
				ps.setString(25, clntnm);

				java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());

			}

			int p = ps.executeUpdate();

			if (p > 0) {

				Email from = new Email("kgbseuro@in.ibm.com");
				String subject = "Your service request for client : "+ clntnm +" ( Opportunity no. "+oppNumber+" ) has been registered";
				Email mail_to = new Email(requester);
				Email mail_cc1 = new Email("kgbseuro@in.ibm.com");
				Content content = new Content("text/html",
						"<b><font-size:10px>Hello " + name + ",</font></b><br/><br/>"
								+"<font-size:9px>Thank you for raising this request. We will get in touch with you as soon as possible.<br/></br>"
								+"Please send any further communications and relevant materials (docs, ppt etc) to the "
								+"<a href=\"mailto:pgbseuro@in.ibm.com?Subject=Additional%20information%20for%20client%20:%20"
								+ clntnm +" ( Opportunity no. "+oppNumber+" )\" target=\"_top\">GBS Proposal Assistance Team.</a><br/> "
								+ " <br/>  Opportunity Number: "+ oppNumber
								+ " <br/>  Client Name: " + clntnm 
								+ " <br/>  Sector: " + sctr
								+ " <br/>  Opportunity Description : " + comment 								
								+ " <br/>  Request date: " + sdate 
								+ " <br/><br/>Regards, <br/> GBS Proposal Assistance Team");

				Mail mail = new Mail(from, subject, mail_to, content);
				
				mail.getPersonalization().get(0).addCc(mail_cc1);
				
				SendGrid sg = new SendGrid("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");
				// SendGrid sg = new
				// SendGrid("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");
				Request request1 = new Request();
				try {
					request1.method = Method.POST;
					request1.endpoint = "mail/send";
					request1.body = mail.build();
					Response response1 = sg.api(request1);

				} catch (IOException ex) {
					throw ex;
				}

			}

			RequestDispatcher rd = getServletContext().getRequestDispatcher("/success.jsp");
			rd.forward(request, response);
		}

		catch (Exception e) {
			e.printStackTrace();
		}

		finally {
			try {

				if (ps != null) {
					ps.close();
				}

				if (ps2 != null) {
					ps2.close();
				}

				if (rs != null) {
					rs.close();
				}
				if (rs1 != null) {
					rs1.close();
				}

				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

}
