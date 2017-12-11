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
 * Servlet implementation class regi
 */
public class regi extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public regi() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@SuppressWarnings("null")
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		HttpSession session = request.getSession();
		UserDetails userdtl =
				  (UserDetails)session.getAttribute("userDetailsObj");
				  String email  = userdtl.getEmail();
				  String fname = userdtl.getFirstName();
				  String lname = userdtl.getLastName();
				  // String user =   fname.concat(lname);
				  String name = fname;
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html;charset=UTF-8");

		Connection con = null;
		PreparedStatement ps = null;
		PreparedStatement ps1 = null;

		String final_date = null;

		String txtOppNo = request.getParameter("txtOppNo");
		String txtmncomp = request.getParameter("txtmncomp");
		String desc = request.getParameter("txtrltion");
		String txtindus = request.getParameter("inds");
		String cntry = request.getParameter("txtloc");
		String txtOppName = request.getParameter("txtOppName");
		String won = request.getParameter("txtslvl");
		String startdat = request.getParameter("txtreqdate");
		String grp = request.getParameter("txtrfp");
		String txtkh = request.getParameter("txtkh");
		String reqstr = request.getParameter("txtrequestby");
		String txtrqsttype = request.getParameter("txtrqsttype");
		String txtrqstdfor = request.getParameter("txtrqstdfor");
		String sctr = request.getParameter("txtfcsarea");
		String txtClient = request.getParameter("txtClient");

		try {
			Class.forName("com.ibm.db2.jcc.DB2Driver").newInstance();

			String query = "insert into SERVICE_REQUEST_KHUB(REQUESTOR,TYPE,CLIENT_NAME,WON,OPP_NO,COMPETITOR,SECTOR,START_DATE,REQUEST_DESCRIPTION,COUNTRY ,INDUSTRY,IS_COMPLETE,GROUP,OPP_NAME) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			con = DriverManager.getConnection(DatabaseConnectionUtil.databaseCredentials.getJdbcURL(),
					DatabaseConnectionUtil.databaseCredentials.getUserId(),
					DatabaseConnectionUtil.databaseCredentials.getPassword());
			ps = con.prepareStatement(query);

			ps.setString(1, reqstr);
			ps.setString(2, txtrqsttype);
			ps.setString(3, txtClient);
			ps.setString(4, won);
			ps.setString(5, txtOppNo);
			ps.setString(6, txtmncomp);
			ps.setString(7, sctr);

		//	if (startdat != " " || startdat != null || !startdat.trim().isEmpty()) {

		if(StringUtils.hasText(startdat) && startdat.trim().length()>0)
		{
				System.out.println("startdate is here printed ..");
				
				
					String start_dt[] = startdat.split("-");
					for (int i = 0; i < start_dt.length; i++) {

					}
					String dt = start_dt[0];
					String mon = start_dt[1];
					String year = start_dt[2];

					if (Integer.parseInt(dt) < 10) {
						// dt = "0"+ dt ;
						dt = "0".concat(dt);
					}
					if (Integer.parseInt(mon) < 10) {
						// mon = "0"+ mon ;
						mon = "0".concat(mon);
					}

					final_date = dt.concat("-").concat(mon).concat("-").concat(year);

					SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
					java.util.Date uDt = null;
					try {
						uDt = sdf.parse(final_date);

					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

					java.sql.Date sqlDate = new Date(uDt.getTime());

					ps.setDate(8, sqlDate);
				
			}

			else if(startdat.trim().isEmpty()) {
				ps.setNull(8, java.sql.Types.DATE);
			}

			// ps.setString(9, enddat);
			ps.setString(9, desc);
			ps.setString(10, cntry);
			ps.setString(11, txtindus);
			ps.setString(12, "N");
			ps.setString(13, grp);
			ps.setString(14, txtOppName);

			int i = ps.executeUpdate();

			if (i > 0)
			{

				Email from = new Email("nirmalya.goswami@in.ibm.com");
				String subject = "Your KH Service Request is registered for: " + txtOppName;
				Email to = new Email(reqstr);
				Email to1 = new Email("nirmalya.goswami@in.ibm.com");
				Content content = new Content("text/html",
						"<b><font-size:10px>Hi " + name
								+ ",</font></b> <br/> <font-size:9px>This is to acknowledge your request  for KH Service..We will revert back with our feedback ASAP..<br/>"
								+ "Please send any further communications and relevant materials (docs, ppt etc) to GBS Knowledge Hub/India/Contr/IBM. "
								+ "<br/> Opportunity Description : " + desc + " <br/>  Opportunity Number : " + txtOppNo
								+ " <br/> Client Name: " + txtClient + " <br/> Sector: " + sctr + "<br/> Start date: "
								+ startdat + " <br/><br/>Thanking you <br/> Knowledge Hub Team </font>");

				Mail mail = new Mail(from, subject, to, content);
				mail.getPersonalization().get(0).addCc(to1);
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

			System.out.println("the value of row is  is " + i);

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
