/**
 * 
 */
package com.ibm.khub.util;

import java.sql.Driver;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.SimpleDriverDataSource;

import com.ibm.db2.jcc.DB2Driver;
import com.ibm.khub.pojo.DatabaseCredentials;
import com.ibm.nosql.json.api.BasicDBList;
import com.ibm.nosql.json.api.BasicDBObject;
import com.ibm.nosql.json.util.JSON;

/**
 * @author ibm
 *
 */
public class DatabaseConnectionUtil {
	private static JdbcTemplate db2JdbcTemplate;
	
	public static DatabaseCredentials databaseCredentials;

	/**
	 * @return
	 */
	public static JdbcTemplate getDB2JdbcTemplate() {
		SimpleDriverDataSource ds = null;
		if (db2JdbcTemplate == null) {

			try {
				Driver driver = new DB2Driver();
				
				ds = new SimpleDriverDataSource(driver, databaseCredentials.getJdbcURL(), databaseCredentials.getUserId(), databaseCredentials.getPassword());
				db2JdbcTemplate = new JdbcTemplate(ds);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}

		return db2JdbcTemplate;
	}

	

	
}
