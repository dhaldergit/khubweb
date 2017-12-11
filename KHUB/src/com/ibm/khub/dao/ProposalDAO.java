/**
 * 
 */
package com.ibm.khub.dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Types;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.JdbcTemplate;

import com.ibm.khub.pojo.DropDownProp;
import com.ibm.khub.pojo.ProposalDTO;
import com.ibm.khub.rowmappers.CategoryRowMapper;
import com.ibm.khub.rowmappers.IndustryRowMapper;
import com.ibm.khub.rowmappers.ProposalRowMapper;
import com.ibm.khub.rowmappers.ServiceAreaRowMapper;
import com.ibm.khub.service.ProposalService;
import com.ibm.khub.util.DatabaseConnectionUtil;

/**
 * @author ibm
 *
 */
public class ProposalDAO {

	private static final String INSERT_CONTENT_QUERY = "INSERT INTO KH_CONTENT ("
			+ " LINK, CONTENT_NAME, INDUSTRY, SERVICE_LINE, "
			+ "TYPE, DATE_PUBLISHED, IS_RETIRED, CATEGORY, GEO, "
			+ "GROWTHAREA_CAMSS, COMPETITORS, YEAR, TCV, TOP, " + "DESCRIPTION, EXTERNAL_LINK"
			+ ") VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)";
	private static final String UPDATE_CONTENT_QUERY = "UPDATE KH_CONTENT SET "
			+ "LINK = ?, CONTENT_NAME = ?, INDUSTRY = ?, SERVICE_LINE = ?,TYPE = ?,  "
			+ "DATE_PUBLISHED = ?, IS_RETIRED = ?,CATEGORY = ?, GEO = ?, GROWTHAREA_CAMSS = ?,  "
			+ "COMPETITORS = ?, YEAR = ?, TCV = ?,  TOP = ?, DESCRIPTION = ?, EXTERNAL_LINK = ? " + "WHERE "
			+ "KH_CONTENT_STORE_ID = ?";

	public static final String SELECT_CATEGORY = "Select HOME_PAGE_CATEGORY_NAME as CATEGORY from HOME_PAGE_CATEGORY";
	public static final String SELECT_CATEGORY_PROPOSAL_INSERT = "Select PROPOSAL_INSERT_CATEGORY_NAME as CATEGORY from PROPOSAL_INSERT_CATEGORY";
	public static final String SELECT_TYPE = "Select CONTENT_TYPE_NAME as TYPE from CONTENT_TYPE";
	public static final String SELECT_COUNTRY = "Select  COUNTRY_NAME from COUNTRY";

	public List<ProposalDTO> retrieveContents(String serviceArea, String type) throws Exception {
		String query = "select * from KH_CONTENT where IS_DELETED = 'N' and UPPER(IS_RETIRED) = 'N' and UPPER(TYPE) = '" + type.toUpperCase() + "' and UPPER(SERVICE_LINE) = '"
				+ serviceArea.toUpperCase() + "'" +"  order by DATE_PUBLISHED desc ";

		JdbcTemplate jdbcTemplate = DatabaseConnectionUtil.getDB2JdbcTemplate();
		List<ProposalDTO> proposalList = jdbcTemplate.query(query, new ProposalRowMapper());
		//System.out.println("Size:: " + proposalList.size());
		//System.out.println(proposalList);
		return proposalList;
	}

	public List<ProposalDTO> retrieveContentsByCategory(String category) throws Exception {
		String query = "select * from KH_CONTENT where IS_DELETED = 'N' and  UPPER(IS_RETIRED) = 'N' and UPPER(TYPE) = 'PROPOSAL INSERT' and UPPER(CATEGORY) = '"
				+ category.toUpperCase() + "'" +"  order by DATE_PUBLISHED desc ";

		JdbcTemplate jdbcTemplate = DatabaseConnectionUtil.getDB2JdbcTemplate();
		List<ProposalDTO> proposalList = jdbcTemplate.query(query, new ProposalRowMapper());
		//System.out.println("Size:: " + proposalList.size());
		//System.out.println(proposalList);
		return proposalList;
	}
	
	
	public List<ProposalDTO> retrieveContentsByCategoryAndServiceLine(String category, String serviceArea) throws Exception {
		String query = "select * from KH_CONTENT where IS_DELETED = 'N' and  UPPER(IS_RETIRED) = 'N' and UPPER(TYPE) = 'PROPOSAL INSERT' and UPPER(CATEGORY) = '"
				+ category.toUpperCase() + "'" + " and UPPER(SERVICE_LINE) = '"
						+ serviceArea.toUpperCase() + "'" +"  order by DATE_PUBLISHED desc ";

		JdbcTemplate jdbcTemplate = DatabaseConnectionUtil.getDB2JdbcTemplate();
		List<ProposalDTO> proposalList = jdbcTemplate.query(query, new ProposalRowMapper());
		//System.out.println("Size:: " + proposalList.size());
		//System.out.println(proposalList);
		return proposalList;
	}
	/**
	 * @param competitor
	 * @param type
	 * @return
	 * @throws Exception
	 */
	public List<ProposalDTO> retrieveContentsByCompetitor(String competitor, String type) throws Exception {
		String query = "select * from KH_CONTENT where IS_DELETED = 'N' and  UPPER(IS_RETIRED) = 'N' and UPPER(TYPE) = '" + type.toUpperCase() + "' and UPPER(COMPETITORS) = '"
				+ competitor.toUpperCase() + "'" +"  order by DATE_PUBLISHED desc ";
		
		JdbcTemplate jdbcTemplate = DatabaseConnectionUtil.getDB2JdbcTemplate();
		List<ProposalDTO> proposalList = jdbcTemplate.query(query, new ProposalRowMapper());
		//System.out.println("Size:: " + proposalList.size());
		//System.out.println(proposalList);
		return proposalList;
	}
	

	
	public List<ProposalDTO> retrieveOtherContents(String[] qParams, String type, String contentParam) throws Exception {
		String query = "";
		StringBuilder paramBuilder = new StringBuilder();
		for (int i = 0; i < qParams.length; i++) {
			if( i == 0) {
			paramBuilder.append("?");
			} else {
				paramBuilder.append(",?");
			}
		}
			query = "select * from KH_CONTENT where IS_DELETED = 'N' and  UPPER(IS_RETIRED) = 'N' and UPPER(TYPE) = '" + type.toUpperCase() + "' and UPPER("+contentParam.toUpperCase()+") not in ("
					+ paramBuilder.toString() + ")" +"  order by DATE_PUBLISHED desc ";

		JdbcTemplate jdbcTemplate = DatabaseConnectionUtil.getDB2JdbcTemplate();
		List<ProposalDTO> proposalList = jdbcTemplate.query(query, qParams, new ProposalRowMapper());
		//System.out.println("Size:: " + proposalList.size());
		//System.out.println(proposalList);
		return proposalList;
	}
	
	public void insertContent(ProposalDTO proposal) {

		JdbcTemplate jdbcTemplate = DatabaseConnectionUtil.getDB2JdbcTemplate();
		java.util.Date dt = new java.util.Date();

		int res = jdbcTemplate.update(INSERT_CONTENT_QUERY,
				new Object[] { proposal.getUrl(), proposal.getContentName(), proposal.getIndustry(),
						proposal.getServiceArea(), proposal.getType(), dt, proposal.getIsRetired(),
						proposal.getHomePageType(), proposal.getCountry(), proposal.getGrowthareaCamss(),
						proposal.getCompetitors(), proposal.getYear(), proposal.getTcv(), proposal.getHomepageLinks(),
						proposal.getShortName(), proposal.getIsBox() });
		if (res == 1) {
			System.out.println("inserted :: " + proposal);
		}
	}

	public void insertBulkContent(final List<ProposalDTO> proposalList) {
		JdbcTemplate jdbcTemplate = DatabaseConnectionUtil.getDB2JdbcTemplate();
		java.util.Date utilDate = new java.util.Date();
		final java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
		//System.out.println("proposalList:: " + proposalList);
		int res[] = jdbcTemplate.batchUpdate(INSERT_CONTENT_QUERY, new BatchPreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps, int i) throws SQLException {
				ProposalDTO proposal = proposalList.get(i);
				ps.setString(1, proposal.getUrl());
				ps.setString(2, proposal.getContentName());
				ps.setString(3, proposal.getIndustry());
				ps.setString(4, proposal.getServiceArea());
				ps.setString(5, proposal.getType());
				ps.setDate(6, proposal.getSqlDate());
				ps.setString(7, proposal.getIsRetired().substring(0, 1));
				ps.setString(8, proposal.getCategory());
				ps.setString(9, proposal.getCountry());
				ps.setString(10, proposal.getGrowthareaCamss());
				ps.setString(11, proposal.getCompetitors());
				ps.setString(12, proposal.getYear());
				ps.setString(13, proposal.getTcv());
				ps.setString(14, proposal.getHomepageLinks());
				ps.setString(15, proposal.getShortName());
				ps.setString(16, proposal.getIsRetired());

			}

			@Override
			public int getBatchSize() {
				// TODO Auto-generated method stub
				return proposalList.size();
			}
		});
	}

	public void updateBulkContent(final List<ProposalDTO> proposalList) throws SQLException {
		JdbcTemplate jdbcTemplate = DatabaseConnectionUtil.getDB2JdbcTemplate();
		java.util.Date utilDate = new java.util.Date();
		final java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
		//System.out.println("proposalList:: " + proposalList);
		int res[] = jdbcTemplate.batchUpdate(UPDATE_CONTENT_QUERY, new BatchPreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps, int i) throws SQLException {
				ProposalDTO proposal = proposalList.get(i);
				ps.setString(1, proposal.getUrl());
				ps.setString(2, proposal.getContentName());
				ps.setString(3, proposal.getIndustry());
				ps.setString(4, proposal.getServiceArea());
				ps.setString(5, proposal.getType());
				ps.setDate(6, proposal.getSqlDateFromString());
				ps.setString(7, proposal.getIsRetired().substring(0, 1));
				ps.setString(8, proposal.getCategory());
				ps.setString(9, proposal.getCountry());
				ps.setString(10, proposal.getGrowthareaCamss());
				ps.setString(11, proposal.getCompetitors());
				ps.setString(12, proposal.getYear());
				ps.setString(13, proposal.getTcv());
				ps.setString(14, proposal.getHomepageLinks());
				ps.setString(15, proposal.getShortName());
				ps.setString(16, proposal.getIsBox().substring(0, 1));
				ps.setString(17, proposal.getContentId());
				

			}

			@Override
			public int getBatchSize() {
				// TODO Auto-generated method stub
				return proposalList.size();
			}
		});
	}

	public List<ProposalDTO> searchContent(ProposalDTO proposal) {

		StringBuilder queryBuilder = new StringBuilder();
		queryBuilder.append("select * from KH_CONTENT WHERE IS_DELETED = 'N' and  UPPER(IS_RETIRED) = '")
				.append(proposal.getIsRetired().toUpperCase()).append("' and UPPER(TYPE) = '").append(proposal.getType().toUpperCase()).append("'");
		if (!proposal.getType().equalsIgnoreCase("HomePage")) {
			if (StringUtils.isNotEmpty(proposal.getServiceArea())) {
				queryBuilder.append(" and UPPER(SERVICE_LINE) = '").append(proposal.getServiceArea().toUpperCase())
						.append("'");
			}
			if (StringUtils.isNotEmpty(proposal.getIndustry())) {
				queryBuilder.append(" and UPPER(INDUSTRY) = '").append(proposal.getIndustry().toUpperCase())
						.append("'");
			} 
		}
		if (StringUtils.isNotEmpty(proposal.getCategory())) {
			queryBuilder.append(" and UPPER(CATEGORY) = '").append(proposal.getCategory().toUpperCase()).append("'");
		}
		if (StringUtils.isNotBlank(proposal.getShortName())) {
			queryBuilder.append(" and UPPER(CONTENT_NAME) = '").append(proposal.getContentName().toUpperCase()).append("'");
		}
		
		if (StringUtils.isNotBlank(proposal.getIsBox())) {
			queryBuilder.append(" and UPPER(EXTERNAL_LINK) = '").append(proposal.getIsBox().toUpperCase()).append("'");
		}
		queryBuilder.append("  order by DATE_PUBLISHED desc ");
		System.out.println("queryBuilder:: " + queryBuilder.toString());
		JdbcTemplate jdbcTemplate = DatabaseConnectionUtil.getDB2JdbcTemplate();
		List<ProposalDTO> proposalList = jdbcTemplate.query(queryBuilder.toString(), new ProposalRowMapper());
		//System.out.println("Content Size:: " + proposalList.size());
		//System.out.println(proposalList);
		return proposalList;
	}

	public static List<DropDownProp> getGenericDDList(String query, String property) {

		JdbcTemplate jdbcTemplate = DatabaseConnectionUtil.getDB2JdbcTemplate();
		List<DropDownProp> proposalList = jdbcTemplate.query(query, new CategoryRowMapper(property));
		//System.out.println("Size:: " + proposalList.size());
		//System.out.println(proposalList);
		return proposalList;

	}

	public List<DropDownProp> getServiceAreaDDList() {
		String query = "select distinct SERVICE_LINE from KH_CONTENT WHERE IS_DELETED = 'N'";

		JdbcTemplate jdbcTemplate = DatabaseConnectionUtil.getDB2JdbcTemplate();
		List<DropDownProp> proposalList = jdbcTemplate.query(query, new ServiceAreaRowMapper());
		//System.out.println("Size:: " + proposalList.size());
		//System.out.println(proposalList);
		return proposalList;

	}

	public List<DropDownProp> getIndustryDDList() {
		String query = "select distinct INDUSTRY from KH_CONTENT WHERE  IS_DELETED = 'N'";

		JdbcTemplate jdbcTemplate = DatabaseConnectionUtil.getDB2JdbcTemplate();
		List<DropDownProp> proposalList = jdbcTemplate.query(query, new IndustryRowMapper());
		//System.out.println("Size:: " + proposalList.size());
		//System.out.println(proposalList);
		return proposalList;

	}
}
