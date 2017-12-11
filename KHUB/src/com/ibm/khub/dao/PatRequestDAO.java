package com.ibm.khub.dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.JdbcTemplate;

import com.ibm.khub.pojo.PatRequest;
import com.ibm.khub.pojo.ProposalDTO;
import com.ibm.khub.rowmappers.PatRequestRowMapper;
import com.ibm.khub.rowmappers.ProposalRowMapper;
import com.ibm.khub.util.DatabaseConnectionUtil;

public class PatRequestDAO {

	/* SQL to select data */
	private static String SQL_SELECT = " SELECT " + "ID, CLIENT_NAME, REQUESTOR, GEO, REGION, OPP_NO, OPP_NAME, INDUSTRY, "
			+ " SECTOR, OFFERING_AREA, TCV, DESC, COUNTRY, SERVICE_LINE, OWNER, "
			+ " PROPOSAL_TYPE, CONTRACT, INCUMBENT, MAIN_COMPETITOR, OTHER_COMPETITOR, VARCHAR_FORMAT(START_DATE, 'MM-DD-YYYY') as START_DATE, STRATEGY, "
			+ " VARCHAR_FORMAT(PROPOSAL_DUE_DATE, 'MM-DD-YYYY') as PROPOSAL_DUE_DATE, VARCHAR_FORMAT(PROPOSAL_DUE_DATE_CUSTOMER, 'MM-DD-YYYY') as PROPOSAL_DUE_DATE_CUSTOMER,"
			+ " VARCHAR_FORMAT(REQUEST_DATE, 'MM-DD-YYYY') as REQUEST_DATE, IS_COMPLETE, VARCHAR_FORMAT(COMPLETED_DATE, 'MM-DD-YYYY') as COMPLETED_DATE " + " FROM PAT_REQUEST pr ";

	private static String SQL_UPDATE = "UPDATE PAT_REQUEST SET IS_COMPLETE = ?, COMPLETED_DATE = current_date WHERE ID = ?";
	
	
	/**
	 * @param patRequest
	 * @return
	 */
	public List<PatRequest> searchPatRequestContents(PatRequest patRequest) {
		StringBuilder queryBuilder = new StringBuilder(SQL_SELECT);

		Boolean isParamAdded = false;

		if (StringUtils.isNotBlank(patRequest.getOppNo())) {
			if (isParamAdded) {
				queryBuilder.append(" AND OPP_NO = '").append(patRequest.getOppNo()).append("'");
			} else {

				queryBuilder.append(" WHERE  OPP_NO = '").append(patRequest.getOppNo()).append("'");
				isParamAdded = true;
			}

		}

		if (StringUtils.isNotBlank(patRequest.getOppName())) {
			if (isParamAdded) {
				queryBuilder.append(" AND OPP_NAME = '").append(patRequest.getOppName()).append("'");
			} else {

				queryBuilder.append(" WHERE  OPP_NAME = '").append(patRequest.getOppName()).append("'");
				isParamAdded = true;
			}

		}

		if (StringUtils.isNotBlank(patRequest.getIndustry())) {
			if (isParamAdded) {
				queryBuilder.append(" AND INDUSTRY = '").append(patRequest.getIndustry()).append("'");
			} else {

				queryBuilder.append(" WHERE  INDUSTRY = '").append(patRequest.getIndustry()).append("'");
				isParamAdded = true;
			}

		}

		if (StringUtils.isNotBlank(patRequest.getGeo())) {
			if (isParamAdded) {
				queryBuilder.append(" AND GEO = '").append(patRequest.getGeo()).append("'");
			} else {

				queryBuilder.append(" WHERE  GEO = '").append(patRequest.getGeo()).append("'");
				isParamAdded = true;
			}

		}

		if (StringUtils.isNotBlank(patRequest.getRequester())) {
			if (isParamAdded) {
				queryBuilder.append(" AND REQUESTER = '").append(patRequest.getRequester()).append("'");
			} else {

				queryBuilder.append(" WHERE  REQUESTER = '").append(patRequest.getRequester()).append("'");
				isParamAdded = true;
			}

		}

		
		if (StringUtils.isNotBlank(patRequest.getRequestDate())) {
			if (isParamAdded) {
				queryBuilder.append(" AND pr.REQUEST_DATE <=  DATE('").append(getSqlDateFromString(patRequest.getRequestDate())).append("')");
			} else {

				queryBuilder.append(" WHERE  pr.REQUEST_DATE <=  DATE('").append(getSqlDateFromString(patRequest.getRequestDate())).append("')");
				isParamAdded = true;
			}

		}
		
		System.out.println("patContent Query::  "+queryBuilder.toString());
		
		JdbcTemplate jdbcTemplate = DatabaseConnectionUtil.getDB2JdbcTemplate();
		List<PatRequest> patContentList = jdbcTemplate.query(queryBuilder.toString(), new PatRequestRowMapper());
		System.out.println(" patContentList size:: " + patContentList.size());
		System.out.println("patContentList::  "+patContentList);
		return patContentList;

	}
	
	public Date getSqlDateFromString(String strDate) {
		DateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
		java.util.Date utilDate = null;
		try {
			utilDate = formatter.parse(strDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
		return sqlDate;
	}
	
	
	/**
	 * @param contentList
	 */
	public void patBulkUpdate(final List<Map<String, String>> contentList) {
		JdbcTemplate jdbcTemplate = DatabaseConnectionUtil.getDB2JdbcTemplate();
		
		int res[] = jdbcTemplate.batchUpdate(SQL_UPDATE, new BatchPreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps, int i) throws SQLException {
				Map<String, String> map = contentList.get(i);
				ps.setString(1, map.get("colVal"));
				ps.setString(2, map.get("colId"));
				
			}

			@Override
			public int getBatchSize() {
				// TODO Auto-generated method stub
				return contentList.size();
			}
		});
		System.out.println("status:: "+res);
	}
	
	
	public static void main(String args[]) {
		System.out.println(SQL_SELECT);
		
	}

}
