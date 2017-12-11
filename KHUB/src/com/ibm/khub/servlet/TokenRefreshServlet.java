package com.ibm.khub.servlet;

import java.io.IOException;
import java.util.Date;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;

import com.box.sdk.BoxAPIConnection;
import com.ibm.khub.util.DatabaseConnectionUtil;

/**
 * Servlet implementation class TokenRefreshServlet
 */
public class TokenRefreshServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TokenRefreshServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		final ServletContext servletContext = config.getServletContext();
		int initialDelay = 5000; // start after 5 seconds
		int period = 50 * 60 * 1000; // repeat every 30 minutes

		Timer timer = new Timer();
		TimerTask task = new TimerTask() {
			public void run() {
				try {
					String accessToken = "";
					String refreshToken = "";
					JdbcTemplate jdbcTemplate = DatabaseConnectionUtil.getDB2JdbcTemplate();
					Map<String, Object> resultMap = jdbcTemplate
							.queryForMap("SELECT ACCESSTOKEN, REFRESHTOKEN FROM \"BOX_TOKEN\"");
					if (resultMap.get("ACCESSTOKEN") != null) {
						accessToken = (String) resultMap.get("ACCESSTOKEN");
					}
					if (resultMap.get("REFRESHTOKEN") != null) {
						refreshToken = (String) resultMap.get("REFRESHTOKEN");
					}

					BoxAPIConnection authapi = new BoxAPIConnection("873jlyl0g66qbtx6qho4ec5t2q3f2q5h",
							"7w9l7zep9BMWwKvMLKO6j3rM2fjtWZc6", accessToken, refreshToken);
					authapi.refresh();
					refreshToken = authapi.getRefreshToken();
					accessToken = authapi.getAccessToken();
					System.out.println("here in init accessToken = " + accessToken);
					System.out.println("here in init refreshToken = " + refreshToken);
					jdbcTemplate.update("update \"BOX_TOKEN\" set ACCESSTOKEN = ?  , REFRESHTOKEN = ?", accessToken,
							refreshToken);
					servletContext.setAttribute("accessToken", accessToken);
					servletContext.setAttribute("refreshToken", refreshToken);
					System.out.println("Box Token refreshed at:: " + new Date().getTime());
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		};

		timer.scheduleAtFixedRate(task, initialDelay, period);
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	/*
	 * protected void service(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException { // TODO Auto-generated
	 * method stub }
	 */

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
