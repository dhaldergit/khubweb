package com.ibm.khub.servletListener;

import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.ibm.khub.pojo.DatabaseCredentials;
import com.ibm.khub.util.DatabaseConnectionUtil;
import com.ibm.nosql.json.api.BasicDBList;
import com.ibm.nosql.json.api.BasicDBObject;
import com.ibm.nosql.json.util.JSON;

/**
 * Application Lifecycle Listener implementation class
 * DatabaseInitializationListener
 *
 */
public class DatabaseInitializationListener implements ServletContextListener {

	/**
	 * Default constructor.
	 */
	public DatabaseInitializationListener() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see ServletContextListener#contextDestroyed(ServletContextEvent)
	 */
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
	}

	/**
	 * @see ServletContextListener#contextInitialized(ServletContextEvent)
	 */
	public void contextInitialized(ServletContextEvent event) {
		ServletContext servletContext = event.getServletContext();

		String VCAP_SERVICES = System.getenv("VCAP_SERVICES");
		String userId = "";
		String jdbcUrl = "";
		String password = "";
		DatabaseCredentials databaseCredentials = new DatabaseCredentials();
		/*
		 * if (VCAP_SERVICES != null) { BasicDBObject obj = (BasicDBObject)
		 * JSON.parse(VCAP_SERVICES); String thekey = null; Set<String> keys =
		 * obj.keySet(); for (String eachkey : keys) if
		 * (eachkey.contains("dashDB")) thekey = eachkey; BasicDBList list =
		 * (BasicDBList) obj.get(thekey); BasicDBObject bludb = (BasicDBObject)
		 * list.get("0"); bludb = (BasicDBObject) bludb.get("credentials");
		 * userId = (String) bludb.get("username"); jdbcUrl = (String)
		 * bludb.get("jdbcurl"); password = (String) bludb.get("password");
		 * databaseCredentials.setJdbcURL(jdbcUrl);
		 * databaseCredentials.setUserId(userId);
		 * databaseCredentials.setPassword(password); } else {
		 */
		/*
		 * databaseCredentials.setJdbcURL(
		 * "jdbc:db2://bluemix05.bluforcloud.com:50000/BLUDB");
		 * databaseCredentials.setUserId("dash114023");
		 * databaseCredentials.setPassword("s8UdfL__4NLe");
		 */
		databaseCredentials.setJdbcURL("jdbc:db2://awh-yp-small03.services.dal.bluemix.net:50000/BLUDB");
		databaseCredentials.setUserId("dash102657");
		databaseCredentials.setPassword("pS3CXxOzckH4");
		// }
		servletContext.setAttribute("databaseCredentials", databaseCredentials);
		DatabaseConnectionUtil.databaseCredentials = databaseCredentials;
	}

}
