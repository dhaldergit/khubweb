package com.ibm.khub.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.jdbc.core.JdbcTemplate;

import com.box.sdk.BoxAPIConnection;
import com.box.sdk.BoxAPIException;
import com.box.sdk.BoxAPIRequest;
import com.box.sdk.BoxFile;
import com.box.sdk.BoxFolder;
import com.box.sdk.BoxJSONResponse;
import com.ibm.khub.pojo.UserDetails;
import com.ibm.khub.util.DatabaseConnectionUtil;

/**
 * Servlet implementation class box
 */
public class box extends HttpServlet {
	// @Override

	Connection con = null;
	PreparedStatement ps = null;
	PreparedStatement ps1 = null;
 String usermail =  null;
	long timediff;
	Date createTime = null;
	Date curTime;
	URL url = null;
	PreparedStatement ps2 =  null;
	ResultSet rs =  null;
    String path_url =  null;
	BoxAPIConnection authapi = null; // This object should be initialized once
										// with the values from the web.xml and
										// reused across all servlet actions
	String accessToken = null; // Not needed but can be used to print the tokens
	String refreshToken = null;
	String accessToken1 = null;
	String refreshToken1 = null;
	boolean lastTokenRefresh; // Do not use session. Store the time of the last
								// token refresh in this variable and use this
								// to
								// determine if a refresh is needed. Initialize
								// this
								// value at the same time as the auth api
								// object.
								// new Date()

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		ServletContext context = req.getSession().getServletContext();

		/*
		 * accessToken = (String) context.getAttribute("accessToken");
		 * refreshToken = (String) context.getAttribute("refreshToken");
		 */

		JdbcTemplate jdbcTemplate = DatabaseConnectionUtil.getDB2JdbcTemplate();
		Map<String, Object> resultMap = jdbcTemplate.queryForMap("SELECT ACCESSTOKEN, REFRESHTOKEN FROM \"BOX_TOKEN\"");
		if (resultMap.get("ACCESSTOKEN") != null) {
			accessToken = (String) resultMap.get("ACCESSTOKEN");
		}
		if (resultMap.get("REFRESHTOKEN") != null) {
			refreshToken = (String) resultMap.get("REFRESHTOKEN");
		}

		authapi = new BoxAPIConnection("873jlyl0g66qbtx6qho4ec5t2q3f2q5h", "7w9l7zep9BMWwKvMLKO6j3rM2fjtWZc6",
				accessToken, refreshToken);
		authapi.setExpires(3600000L);
		authapi.setLastRefresh(System.currentTimeMillis());
		
		PrintWriter pw = resp.getWriter();
		String urlString = "";

		String fileid = req.getParameter("fileids");

		if (req.getParameter("download") != null) {
			String[] fid = fileid.split(",");
			for (String id : fid) {

				if (req.getParameter("download").equals("true")) {

					BoxFile file = new BoxFile(authapi, id);
				//	BoxFile.Info info = file.getInfo();

					url = file.getDownloadURL();

				}
				urlString = urlString + url + "|";

			}
			pw.print(urlString);
			pw.flush();
			pw.close();
		} else {

/*			resultMap = jdbcTemplate.queryForMap("SELECT ACCESSTOKEN, REFRESHTOKEN FROM \"BOX_TOKEN\"");
			if (resultMap.get("ACCESSTOKEN") != null) {
				accessToken = (String) resultMap.get("ACCESSTOKEN");
			}
			if (resultMap.get("REFRESHTOKEN") != null) {
				refreshToken = (String) resultMap.get("REFRESHTOKEN");
			}

			authapi = new BoxAPIConnection("873jlyl0g66qbtx6qho4ec5t2q3f2q5h", "7w9l7zep9BMWwKvMLKO6j3rM2fjtWZc6",
					accessToken, refreshToken);*/

			BoxFile file = new BoxFile(authapi, fileid);
//			BoxFile.Info info = file.getInfo();
			url = file.getDownloadURL();

			resp.sendRedirect(url.toString());

		}

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

/*		HttpSession session = request.getSession();
		UserDetails userdtl = (UserDetails) session.getAttribute("userDetailsObj");
		String usermail = userdtl.getEmail();*/
		
		String txtsrch = request.getParameter("txtsrch");
		// path_url = request.getParameter(url);
		 System.out.println("the path url is :::"+txtsrch);
		//HttpSession session = request.getSession();
		ServletContext context = request.getSession().getServletContext();

		/*
		 * accessToken = (String) context.getAttribute("accessToken");
		 * refreshToken = (String) context.getAttribute("refreshToken");
		 */

		JdbcTemplate jdbcTemplate = DatabaseConnectionUtil.getDB2JdbcTemplate();
		Map<String, Object> resultMap = jdbcTemplate
				.queryForMap("SELECT ACCESSTOKEN, REFRESHTOKEN  FROM \"BOX_TOKEN\"");
		if (resultMap.get("ACCESSTOKEN") != null) {
			accessToken = (String) resultMap.get("ACCESSTOKEN");
		}
		if (resultMap.get("REFRESHTOKEN") != null) {
			refreshToken = (String) resultMap.get("REFRESHTOKEN");
		}

		
/*
		try {
			String link_query = "insert into BOX_KEY(USER , LAST_SEARCH , KEYWORD) values(?,?,?)";
			con = DriverManager.getConnection(DatabaseConnectionUtil.databaseCredentials.getJdbcURL(),
					DatabaseConnectionUtil.databaseCredentials.getUserId(),
					DatabaseConnectionUtil.databaseCredentials.getPassword());
			ps2 = con.prepareStatement(link_query);
			ps2.setString(1, usermail);
			java.sql.Timestamp date_accessed = new java.sql.Timestamp(new java.util.Date().getTime());
			ps2.setTimestamp(2, date_accessed);
			ps2.setString(3, txtsrch);
			ps2.executeUpdate();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}*/
		
		
		authapi = new BoxAPIConnection("873jlyl0g66qbtx6qho4ec5t2q3f2q5h", "7w9l7zep9BMWwKvMLKO6j3rM2fjtWZc6",
				accessToken, refreshToken);

		/*
		 * System.out.println("create time is " +
		 * session.getAttribute("createTime")); System.out.println(
		 * "cur time is " + curTime);
		 */

		try {

			BoxFolder rootFolder = BoxFolder.getRootFolder(authapi);

			URL url1 = new URL("https://api.box.com/2.0/search?query=" + txtsrch);

			authapi.setAutoRefresh(lastTokenRefresh);
			BoxAPIRequest request1 = new BoxAPIRequest(authapi, url1, "GET");

			BoxJSONResponse response1 = (BoxJSONResponse) request1.send();

			System.out.println("response is" + response1);

			String json = response1.getJSON();

			PrintWriter pw = response.getWriter();

			pw.print(json.toString());

		} catch (BoxAPIException e) {

			System.err.format("The API returned the error code: %d\n\n%s", e.getResponseCode(), e.getResponse());

		}

	}

}
