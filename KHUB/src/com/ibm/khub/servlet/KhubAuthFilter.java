package com.ibm.khub.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import java.security.Principal;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.security.auth.Subject;

import com.ibm.khub.pojo.Role;
import com.ibm.khub.pojo.UserDetails;
import com.ibm.khub.service.AuthService;
import com.ibm.khub.service.MetricsService;
import com.ibm.websphere.security.WSSecurityException;
import com.ibm.websphere.security.auth.WSSubject;
import com.ibm.websphere.security.cred.WSCredential;

/**
 * Servlet Filter implementation class KhubAuthFilter
 */
public class KhubAuthFilter implements Filter {

	AuthService authService = new AuthService();
	MetricsService metricsService = new MetricsService();

	public static Map<String, String> pageNameJSPMap = new HashMap<String, String>() {
		{
			put("index.jsp", "Home");
			put("proposalbank.jsp", "Proposal Bank");
			put("proposalinserts.jsp", "Proposal Insert");
			put("capabilities.jsp", "Capabilities");
			put("clientsCorner.jsp", "Clients Corner");
			put("competitorinsight.jsp", "Competitor Insight");
			put("marketinsight.jsp", "Market Insight");
			put("search.jsp", "Search results");
			put("PATPage.jsp", "PAT Page");
			put("contentlist.jsp", "Content List");
			put("service_request.jsp", "KH Request");
		}

	};

	/**
	 * Default constructor.
	 */
	public KhubAuthFilter() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub

		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		HttpServletResponse httpServletResponse = (HttpServletResponse) response;
		HttpSession session = httpServletRequest.getSession();
		// pass the request along the filter chain

		StringBuffer url0 = httpServletRequest.getRequestURL();
		String queryString = httpServletRequest.getQueryString();
		if (queryString != null) {
			url0.append('?');
			url0.append(queryString);
		}
		String requestURL = url0.toString();

		System.out.println("Request URL in KhubAuthFilter :: " + requestURL);
	
		Subject s;
		UserDetails userDetails = new UserDetails();
		try {
			s = WSSubject.getCallerSubject();

			String email = "";
			if (s != null) {
				Map<String, String> map = new HashMap<String, String>();
				Set<Principal> principals = s.getPrincipals();
				Set<Object> privCreds = s.getPrivateCredentials();

				Iterator<Object> privItr = privCreds.iterator();

				while (privItr.hasNext()) {
					String val = privItr.next().toString();
					 System.out.println("val:: "+val);
					populateCredMap(map, val.split(","));

				}
				 System.out.println("map:: "+map);
				userDetails.setFirstName(map.get("firstName"));
				userDetails.setLastName(map.get("lastName"));
				if (principals != null && principals.size() > 0) {

					// in production this should be html encoded for safety
					email = principals.iterator().next().getName();
					email = email.substring(email.lastIndexOf("/") + 1);
					// System.out.println("Email:: "+email);
					userDetails.setEmail(email);
					if (session.getAttribute("userDetailsObj") == null
							|| !(((UserDetails) session.getAttribute("userDetailsObj")).getEmail()
									.equalsIgnoreCase(email))) {
						try {
							String url = "http://dpev390.innovate.ibm.com/fastlist/resources/bplookup/";
							URL url1 = new URL(url + email);
							HttpURLConnection con = (HttpURLConnection) url1.openConnection();
							int responseCode = con.getResponseCode();
							System.out.println("\nSending 'GET' request to URL : " + url1);
							System.out.println("Response Code : " + responseCode);
							BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
							String inputLine = in.readLine();
							// while ((inputLine = in.readLine()) != null) {
							System.out.println("The reponse  is (1):" + inputLine);
							ObjectMapper mapper = new ObjectMapper();
							userDetails = mapper.readValue(inputLine, UserDetails.class);
						} catch (Exception e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						Role role = authService.retrieveUserRole(email);
						if (role != null) {
							userDetails.setRole(role.getRoleName());
						} else {
							userDetails.setRole("UNKNOWN");
						}
						userDetails.setRoleDetails(role);
						// System.out.println("userDetails:: " + userDetails);
						session.setAttribute("userDetailsObj", userDetails);
						
						//metricsService.insertMetricsRecord(pageNameJSPMap.get("index.jsp"), userDetails.getEmail(),"/index.jsp");
						//httpServletResponse.sendRedirect("/index.jsp");
						
						httpServletResponse.sendRedirect(requestURL);
						
						
					} else {
						String page = null;
						int indexQ = requestURL.indexOf("?");
						if(indexQ > 0) {
							page = requestURL.substring(requestURL.lastIndexOf("/") + 1,requestURL.indexOf("?"));
						} else {
							page = requestURL.substring(requestURL.lastIndexOf("/") + 1);
						}
						System.out.println("Page name from KhubAuthFilter : "+ page);
						if (pageNameJSPMap.containsKey(page)) {
							metricsService.insertMetricsRecord(pageNameJSPMap.get(page), email, requestURL);
						}
						chain.doFilter(request, response);

					}

				}

			}
		} catch (WSSecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} /*
			 * catch (ParseException e) { // TODO Auto-generated catch block
			 * e.printStackTrace(); }
			 */

	}

	public UserDetails retrieveUserDetails() throws IOException {

		Subject s;
		UserDetails userDetails = null;
		try {
			s = WSSubject.getCallerSubject();

			String email = "";
			if (s != null) {
				Set<Principal> principals = s.getPrincipals();
				Map<String, String> map = new HashMap<String, String>();
				if (principals != null && principals.size() > 0) {

					Set<Object> privCreds = s.getPrivateCredentials();

					Iterator<Object> privItr = privCreds.iterator();

					while (privItr.hasNext()) {
						populateCredMap(map, privItr.next().toString().split(","));

					}

					// in production this should be html encoded for safety
					email = principals.iterator().next().getName();
					email = email.substring(email.lastIndexOf("/") + 1);
					//System.out.println("Email:: " + email);
					String url = "http://dpev390.innovate.ibm.com/fastlist/resources/bplookup/";

					URL url1 = new URL(url + email);
					HttpURLConnection con = (HttpURLConnection) url1.openConnection();

					int responseCode = con.getResponseCode();
					//System.out.println("\nSending 'GET' request to URL : " + url1);
					//System.out.println("Response Code : " + responseCode);

					BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
					String inputLine = in.readLine();

					// while ((inputLine = in.readLine()) != null) {
					//System.out.println("The reponse  is (1):" + inputLine);
					ObjectMapper mapper = new ObjectMapper();
					userDetails = mapper.readValue(inputLine, UserDetails.class);

					Role role = authService.retrieveUserRole(email);
					userDetails.setRole(role.getRoleName());
					userDetails.setRoleDetails(role);
					userDetails.setFirstName(map.get("firstName"));
					userDetails.setLastName(map.get("lastName"));
					//System.out.println("userDetails:: " + userDetails);

				}
			}
		} catch (WSSecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} /*
			 * catch (ParseException e) { // TODO Auto-generated catch block
			 * e.printStackTrace(); }
			 */
		return userDetails;
	}

	public void populateCredMap(Map<String, String> argMap, String[] argArr) {
		for (String arg : argArr) {
			String[] arr = arg.split("=");
			if (arr.length > 1) {
				argMap.put(arr[0].trim(), arr[1].trim());
			}
		}

	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
