package com.ibm.khub.dao;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import com.ibm.khub.pojo.Metrics;
import com.ibm.khub.rowmappers.MetricsRowMappers;
import com.ibm.khub.servlet.request;
import com.ibm.khub.util.DatabaseConnectionUtil;

public class MetricsDAO {


	String metricHitCountQuery = "select count(*) HITS , trim(PAGE_NAME) as PAGE_NAME, MONTH, YEAR from METRICS where TIME_STAMP > ? group by trim(PAGE_NAME), MONTH, YEAR order by trim(PAGE_NAME), MONTH";
	String initialMonthYearQuery = "select MONTH(current_date - 12 months) as MONTH , YEAR(current_date - 12 months) as YEAR from sysibm.sysdummy1";


	String insertQuery = null;

	public static String serviceRequestKhubMetricsQuery = "Select COUNT(*) as REQ_COUNT, DATE_YEAR_STR as KEY from ( select   CONCAT(Case MONTH(COMPLETED_DATE)  when 1 then 'JAN'"
			+ " 	 when 2 then 'FEB'  when 3 then 'MAR'  when 4 then 'APR'  when 5 then 'MAY' 	"
			+ "		 when 6 then 'JUN'  when 7 then 'JUL'  when 8 then 'AUG'  when 9 then 'SEP' "
			+ "		 when 10 then 'OCT'  when 11 then 'NOV'  when 12 then 'DEC'  END  , YEAR(COMPLETED_DATE)) as DATE_YEAR_STR from SERVICE_REQUEST_KHUB where YEAR(COMPLETED_DATE) = YEAR(current_date))"
			+ "      group by DATE_YEAR_STR";

	public static String servReqMetricsBySectorQuery = "select count(*) as REQ_COUNT, Sector as KEY from SERVICE_REQUEST_KHUB where YEAR(COMPLETED_DATE) = YEAR(current_date)  group by Sector";
	public static String servReqMetricsByGroupQuery = "select count(*) as REQ_COUNT, GROUP as  KEY from SERVICE_REQUEST_KHUB where YEAR(COMPLETED_DATE) = YEAR(current_date)   group by GROUP";
	public static String servPatTCVMetricsBySectorQuery = "select SUM(TCV) as REQ_COUNT, Sector as KEY from PAT_REQUEST  where YEAR(COMPLETED_DATE) = YEAR(current_date) group by Sector";
	public static String servPatReqMetricsBySectorQuery = "select count(*) as REQ_COUNT, Sector as KEY from PAT_REQUEST  where YEAR(COMPLETED_DATE) = YEAR(current_date) group by Sector";

	/**
	 * @param patRequest
	 * @return
	 */
	public Map<String, Object> retrieveHitCountRecords() {

		Map<String, Object> map = new HashMap<String, Object>();
		JdbcTemplate jdbcTemplate = DatabaseConnectionUtil.getDB2JdbcTemplate();

		Metrics intialMonthYear = jdbcTemplate.queryForObject(initialMonthYearQuery, new RowMapper<Metrics>() {

			@Override
			public Metrics mapRow(ResultSet rs, int i) throws SQLException {
				Metrics metrics = new Metrics();

				metrics.setMonth(String.valueOf(rs.getInt("MONTH")));
				metrics.setYear(String.valueOf(rs.getInt("YEAR")));
				return metrics;
			}

		});
		String mnth = "";
		if (Integer.parseInt(intialMonthYear.getMonth()) < 10) {
			mnth = "0" + intialMonthYear.getMonth();
		} else {
			mnth = intialMonthYear.getMonth();
		}
		String strDate = "01-" + mnth + "-" + intialMonthYear.getYear();
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
		java.util.Date date = null;
		try {
			date = sdf.parse(strDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Date dt = new Date(date.getTime());
		List<Metrics> metricsCountRecords = jdbcTemplate.query(metricHitCountQuery, new Object[] { dt },
				new int[] { Types.DATE }, new MetricsRowMappers());
		map.put("intialMonthYear", intialMonthYear);
		map.put("metricsCountRecords", metricsCountRecords);
		System.out.println(" metricsCountRecords size:: " + metricsCountRecords.size());
		System.out.println("metricsCountRecords::  " + metricsCountRecords);
		return map;

	}

	public void insertMetricsRecord(String pageName, String userName, String uri) {

		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");

		Calendar cal = Calendar.getInstance();
		java.sql.Timestamp accessDate = new java.sql.Timestamp(cal.getTimeInMillis());
		
		String pathDetails = uri;
		System.out.println(
				"PATH recieved from KhubAuthFilter in MetricsDAO --------------->>>>>>>>>>>>>>>>>>>>>>> ::" + pathDetails);
		//System.out.println("Request context path: "+ request.getContextPath());
		insertQuery = "INSERT INTO METRICS (PAGE_NAME,HIT_COUNT,USER,DAY,MONTH,YEAR,TIME_STAMP,URL,ACCESSED_TIME) VALUES "
				+ " ( ?, 1, ?, DAY(current_date), " + " Case MONTH(current_date) " + " when 1 then 'JAN' "
				+ " when 2 then 'FEB' " + " when 3 then 'MAR' " + " when 4 then 'APR' " + " when 5 then 'MAY' "
				+ " when 6 then 'JUN' " + " when 7 then 'JUL' " + " when 8 then 'AUG' " + " when 9 then 'SEP' "
				+ " when 10 then 'OCT' " + " when 11 then 'NOV' " + " when 12 then 'DEC' " + " END "
				+ " ,YEAR(current_date),current_date, ?, ?) ";
		try {
			JdbcTemplate jdbcTemplate = DatabaseConnectionUtil.getDB2JdbcTemplate();
			jdbcTemplate.update(insertQuery, new Object[] { pageName, userName, pathDetails, accessDate },
					new int[] { Types.VARCHAR, Types.VARCHAR, Types.VARCHAR, Types.TIMESTAMP });
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}

	}

	public Map<String, String> retrieveGeneralMetricRecords(String query, final String type) {
		JdbcTemplate jdbcTemplate = DatabaseConnectionUtil.getDB2JdbcTemplate();
		final Map<String, String> map = new HashMap<String, String>();
		jdbcTemplate.query(query, new RowMapper<Map<String, String>>() {

			@Override
			public Map<String, String> mapRow(ResultSet rs, int i) throws SQLException {
				if ((type != null) && type.equalsIgnoreCase("DOUBLE")) {
					map.put(rs.getString("KEY"), String.valueOf(rs.getBigDecimal("REQ_COUNT")));
				} else {
					map.put(rs.getString("KEY"), String.valueOf(rs.getInt("REQ_COUNT")));
				}
				return null;
			}
		});
		return map;
	}

	public static void main(String[] args) {

		MetricsDAO metDao = new MetricsDAO();

		System.out.println("metDao.retrieveGeneralMetricRecords():: "
				+ metDao.retrieveGeneralMetricRecords(metDao.serviceRequestKhubMetricsQuery, null));
	}

}
