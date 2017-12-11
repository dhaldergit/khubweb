
package com.ibm.khub.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.util.CollectionUtils;

import com.ibm.khub.dao.KhContentDAO;
import com.ibm.khub.pojo.KhContent;
import com.ibm.khub.pojo.KhContentKey;
import com.ibm.khub.rowmappers.ContentStoreRowMapper;
import com.ibm.khub.util.DatabaseConnectionUtil;
import com.ibm.khub.util.ProposalUtil;

/**
 * This class provides methods to populate DB Table of KH_CONTENT
 */
public class KhContentDAOImpl implements KhContentDAO {
	/* SQL to insert data */
	/*private static final String SQL_INSERT = "INSERT INTO KH_CONTENT ("
			+ "KH_CONTENT_STORE_ID, LINK, CONTENT_NAME, INDUSTRY, SERVICE_AREA, SERVICE_LINE, TECH_TOOLS, "
			+ "TYPE, DATE_PUBLISHED, IS_RETIRED, TOP, EXTERNAL_LINK, CATEGORY, GEO, "
			+ "GROWTHAREA_CAMSS, COMPETITORS, YEAR, SOURCE, TCV, TAGS, SCORE, " + "COMMENTS, SERIAL_NO, DESCRIPTION"
			+ ") VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";*/
	
	private static final String KEY_QUERY = "SELECT KH_CONTENT_STORE_ID FROM KH_CONTENT WHERE SERIAL_NO = ?";
	
	private static final String SERIAL_QUERY = "SELECT MAX(SERIAL_NO) FROM KH_CONTENT WHERE SERIAL_NO < ?";
	
	private static final String SQL_INSERT = "INSERT INTO KH_CONTENT ("
			+ "LINK, CONTENT_NAME, INDUSTRY, SERVICE_AREA, SERVICE_LINE, TECH_TOOLS, "
			+ "TYPE, DATE_PUBLISHED, IS_RETIRED, TOP, EXTERNAL_LINK, CATEGORY, GEO, "
			+ "GROWTHAREA_CAMSS, COMPETITORS, YEAR, SOURCE, TCV, TAGS, SCORE, " 
			+ "COMMENTS, SERIAL_NO, DESCRIPTION, CLIENT, IS_DELETED"
			+ ") VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

	private static final String SQL_INSERT_CONTENT = "INSERT INTO KH_CONTENT ("
			+ " LINK, CONTENT_NAME, INDUSTRY, SERVICE_AREA, SERVICE_LINE, TECH_TOOLS, "
			+ "TYPE, DATE_PUBLISHED, IS_RETIRED, TOP, EXTERNAL_LINK, CATEGORY, GEO, "
			+ "GROWTHAREA_CAMSS, COMPETITORS, YEAR, SOURCE, TCV, TAGS, SCORE, " 
			+ "COMMENTS, SERIAL_NO, DESCRIPTION, CLIENT, IS_DELETED"
			+ ") VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

	/* SQL to select data */
	private static final String SQL_SELECT = "SELECT "
			+ "KH_CONTENT_STORE_ID, LINK, CONTENT_NAME, INDUSTRY, SERVICE_AREA, SERVICE_LINE, TECH_TOOLS, "
			+ "TYPE, DATE_PUBLISHED, IS_RETIRED, TOP, EXTERNAL_LINK, CATEGORY, GEO, "
			+ "GROWTHAREA_CAMSS, COMPETITORS, YEAR, SOURCE, TCV, TAGS, SCORE, " 
			+ "COMMENTS, SERIAL_NO, DESCRIPTION, CLIENT" + "FROM KH_CONTENT " 
			+ "WHERE KH_CONTENT_STORE_ID = ? AND IS_DELETED = 'N'";

	/* SQL to update data */
	private static final String SQL_UPDATE = "UPDATE KH_CONTENT SET "
			+ "LINK = ?, CONTENT_NAME = ?, INDUSTRY = ?, SERVICE_AREA = ?, SERVICE_LINE = ?, TECH_TOOLS = ?, "
			+"TYPE = ?, DATE_PUBLISHED = ?, IS_RETIRED = ?, TOP = ?, EXTERNAL_LINK = ?, CATEGORY = ?, GEO = ?, "
			+"GROWTHAREA_CAMSS = ?, COMPETITORS = ?, YEAR = ?, SOURCE = ?, TCV = ?, TAGS = ?, SCORE = ?, "
			+"COMMENTS = ?, SERIAL_NO = ?, DESCRIPTION = ?, CLIENT = ? " 
			+ "WHERE KH_CONTENT_STORE_ID = ? AND IS_DELETED = 'N'";

	/* SQL to delete data */
	/*private static final String SQL_DELETE = "DELETE FROM KH_CONTENT WHERE " + "KH_CONTENT_STORE_ID = ?";*/
	
	private static final String SQL_DELETE = "UPDATE KH_CONTENT SET IS_DELETED = 'Y' "
			+ "WHERE KH_CONTENT_STORE_ID = ?";

	private static String sqlSelectContent = "SELECT "
			+ "KH_CONTENT_STORE_ID, LINK, CONTENT_NAME, INDUSTRY, SERVICE_AREA, SERVICE_LINE, TECH_TOOLS, "
			+ "TYPE, DATE_PUBLISHED, IS_RETIRED, TOP, EXTERNAL_LINK, CATEGORY, GEO, "
			+ "GROWTHAREA_CAMSS, COMPETITORS, YEAR, SOURCE, TCV, TAGS, SCORE, "
			+ "COMMENTS, SERIAL_NO, DESCRIPTION, CLIENT, IS_DELETED " 
			+ "FROM KH_CONTENT WHERE IS_DELETED = 'N'";

	/**
	 * Create a new record in Database.
	 * 
	 * @param bean
	 *            The Object to be inserted.
	 * @param conn
	 *            JDBC Connection.
	 * @exception SQLException
	 *                if something is wrong.
	 */
	public void create(KhContent bean, JdbcTemplate jdbcTemplate) throws SQLException {
		
		bean.setSerialNo(generateSerial(bean.getType(),jdbcTemplate));
		
		Object[] params = new Object[] { bean.getLink(), bean.getContentName(), bean.getIndustry(), bean.getServiceArea(),
				bean.getServiceLine(), bean.getTechTools(), bean.getType(), new java.sql.Date(bean.getDatePublished().getTime()),
				bean.getIsRetired(), bean.getTop(), bean.getExternalLink(), bean.getCategory(), bean.getGeo(),
				bean.getGrowthareaCamss(), bean.getCompetitors(), bean.getYear(), bean.getSource(), bean.getTcv(),
				bean.getTags(), bean.getScore(), bean.getComments(), bean.getSerialNo(), bean.getDescription(),
				bean.getClient(), bean.getIsDeleted()};
		
		int[] types = new int[] { Types.VARCHAR, Types.VARCHAR, Types.VARCHAR, Types.VARCHAR, 
				Types.VARCHAR, Types.VARCHAR, Types.VARCHAR, Types.DATE,
				Types.CHAR, Types.CHAR, Types.CHAR, Types.VARCHAR, Types.VARCHAR,
				Types.VARCHAR, Types.VARCHAR, Types.INTEGER, Types.VARCHAR, Types.VARCHAR,
				Types.VARCHAR, Types.INTEGER, Types.VARCHAR, Types.BIGINT, Types.VARCHAR,
				Types.VARCHAR, Types.CHAR};
		
		int row = jdbcTemplate.update(SQL_INSERT, params, types);
		
		System.out.println(row + " Rows inserted.");
	}

	/**
	 * Retrive a record from Database.
	 * 
	 * @param beanKey
	 *            The PK Object to be retrived.
	 * @param conn
	 *            JDBC Connection.
	 * @exception SQLException
	 *                if something is wrong.
	 */
	public KhContent load(KhContentKey key, Connection conn) throws SQLException {
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = conn.prepareStatement(SQL_SELECT);
			ps.setLong(1, key.getKhContentStoreId());
			rs = ps.executeQuery();
			List results = getResults(rs);
			if (results.size() > 0)
				return (KhContent) results.get(0);
			else
				return null;
		} finally {
			close(rs);
			close(ps);
		}
	}

	/**
	 * Update a record in Database.
	 * 
	 * @param bean
	 *            The Object to be saved.
	 * @param conn
	 *            JDBC Connection.
	 * @exception SQLException
	 *                if something is wrong.
	 */
	public void update(KhContent bean, JdbcTemplate jdbcTemplate) throws SQLException {
		
		bean.setKhContentStoreId(getKeyFromSerial(bean.getSerialNo(),jdbcTemplate));
		
		Object[] params = new Object[] { bean.getLink(), bean.getContentName(), bean.getIndustry(), bean.getServiceArea(),
				bean.getServiceLine(), bean.getTechTools(), bean.getType(), new java.sql.Date(bean.getDatePublished().getTime()),
				bean.getIsRetired(), bean.getTop(), bean.getExternalLink(), bean.getCategory(), bean.getGeo(),
				bean.getGrowthareaCamss(), bean.getCompetitors(), bean.getYear(), bean.getSource(), bean.getTcv(),
				bean.getTags(), bean.getScore(), bean.getComments(), bean.getSerialNo(), bean.getDescription(),
				bean.getClient(), bean.getKhContentStoreId()};
		
		int[] types = new int[] { Types.VARCHAR, Types.VARCHAR, Types.VARCHAR, Types.VARCHAR, 
				Types.VARCHAR, Types.VARCHAR, Types.VARCHAR, Types.DATE,
				Types.CHAR, Types.CHAR, Types.CHAR, Types.VARCHAR, Types.VARCHAR,
				Types.VARCHAR, Types.VARCHAR, Types.INTEGER, Types.VARCHAR, Types.VARCHAR,
				Types.VARCHAR, Types.INTEGER, Types.VARCHAR, Types.BIGINT, Types.VARCHAR,
				Types.VARCHAR, Types.INTEGER};
		
		int row = jdbcTemplate.update(SQL_UPDATE, params, types);
		
		System.out.println(row + " Rows updated.");

	}

	/**
	 * Create a new record in Database.
	 * 
	 * @param bean
	 *            The PK Object to be deleted.
	 * @param conn
	 *            JDBC Connection.
	 * @exception SQLException
	 *                if something is wrong.
	 */
	public void delete(KhContentKey key, JdbcTemplate jdbcTemplate) throws SQLException {
		
		Object[] params = new Object[] { key.getKhContentStoreId()};
		
		int[] types = new int[] { Types.INTEGER};
		
		int row = jdbcTemplate.update(SQL_DELETE, params, types);
		
		System.out.println(row + " Rows deleted.");

	}

	/**
	 * Populate the ResultSet.
	 * 
	 * @param rs
	 *            The ResultSet.
	 * @return The Object to retrieve from DB.
	 * @exception SQLException
	 *                if something is wrong.
	 */
	protected List<KhContent> getResults(ResultSet rs) throws SQLException {
		List<KhContent> results = new ArrayList<KhContent>();
		while (rs.next()) {
			KhContent bean = new KhContent();
			bean.setKhContentStoreId(rs.getLong("KH_CONTENT_STORE_ID"));
			if (rs.getString("LINK") != null) {
				bean.setLink(rs.getString("LINK"));
			} else {
				bean.setLink("");
			}
			if (rs.getString("CONTENT_NAME") != null) {
				bean.setContentName(rs.getString("CONTENT_NAME"));
			} else {
				bean.setContentName("");
			}
			if (rs.getString("INDUSTRY") != null) {
				bean.setIndustry(rs.getString("INDUSTRY"));
			} else {
				bean.setIndustry("");
			}
			if (rs.getString("SERVICE_AREA") != null) {
				bean.setServiceArea(rs.getString("SERVICE_AREA"));
			} else {
				bean.setServiceArea("");
			}
			if (rs.getString("SERVICE_LINE") != null) {
				bean.setServiceLine(rs.getString("SERVICE_LINE"));
			} else {
				bean.setServiceLine("");
			}
			if (rs.getString("TECH_TOOLS") != null) {
				bean.setTechTools(rs.getString("TECH_TOOLS"));
			} else {
				bean.setTechTools("");
			}
			if (rs.getString("TYPE") != null) {
				bean.setType(rs.getString("TYPE"));
			} else {
				bean.setType("");
			}
			if (rs.getDate("DATE_PUBLISHED") != null) {
				bean.setDatePublished(rs.getDate("DATE_PUBLISHED"));
			} else {
				bean.setDatePublished(new Date());
			}
			if (rs.getString("IS_RETIRED") != null) {
				bean.setIsRetired(rs.getString("IS_RETIRED"));
			} else {
				bean.setIsRetired("");
			}
			if (rs.getString("TOP") != null) {
				bean.setTop(rs.getString("TOP"));
			} else {
				bean.setTop("");
			}
			if (rs.getString("EXTERNAL_LINK") != null) {
				bean.setExternalLink(rs.getString("EXTERNAL_LINK"));
			} else {
				bean.setExternalLink("");
			}
			if (rs.getString("CATEGORY") != null) {
				bean.setCategory(rs.getString("CATEGORY"));
			} else {
				bean.setCategory("");
			}
			if (rs.getString("GEO") != null) {
				bean.setGeo(rs.getString("GEO"));
			} else {
				bean.setGeo("");
			}
			if (rs.getString("GROWTHAREA_CAMSS") != null) {
				bean.setGrowthareaCamss(rs.getString("GROWTHAREA_CAMSS"));
			} else {
				bean.setGrowthareaCamss("");
			}
			if (rs.getString("COMPETITORS") != null) {
				bean.setCompetitors(rs.getString("COMPETITORS"));
			} else {
				bean.setCompetitors("");
			}
			bean.setYear(rs.getLong("YEAR"));
			if (rs.getString("SOURCE") != null) {
				bean.setSource(rs.getString("SOURCE"));
			} else {
				bean.setSource("");
			}
			if (rs.getString("TCV") != null) {
				bean.setTcv(rs.getString("TCV"));
			} else {
				bean.setTcv("");
			}
			if (rs.getString("TAGS") != null) {
				bean.setTags(rs.getString("TAGS"));
			} else {
				bean.setTags("");
			}
			bean.setScore(rs.getLong("SCORE"));
			if (rs.getString("COMMENTS") != null) {
				bean.setComments(rs.getString("COMMENTS"));
			} else {
				bean.setComments("");
			}
			if (rs.getLong("SERIAL_NO") != 0l) {
				bean.setSerialNo(rs.getLong("SERIAL_NO"));
			} else {
				bean.setSerialNo(0l);
			}
			if (rs.getString("DESCRIPTION") != null) {
				bean.setDescription(rs.getString("DESCRIPTION"));
			} else {
				bean.setDescription("");
			}
			if (rs.getString("CLIENT") != null) {
				bean.setDescription(rs.getString("CLIENT"));
			} else {
				bean.setDescription("");
			}
			results.add(bean);
		}
		return results;
	}

	@Override
	public long getKeyFromSerial(long serial, JdbcTemplate jdbcTemplate) throws SQLException{
				
		Object[] params = new Object[] { serial };
		
		int[] types = new int[] { Types.INTEGER};		
		
		//long key = (long)jdbcTemplate.queryForLong(KEY_QUERY);
		long key = (long)jdbcTemplate.queryForLong(KEY_QUERY, params, types);
		
		return key;
	}
	
	@Override
	public long generateSerial(String type, JdbcTemplate jdbcTemplate) throws SQLException{
				
		int cutoff;
		if(type.equals("Case Study") || type.equals("Client Reference")){
			cutoff=50000;
		} else if(type.equals("Proposal Insert")){
			cutoff=40000;
		} else if(type.equals("Price Case")){
			cutoff=30000;
		} else if(type.equals("KH Response")){
			cutoff=20000;
		} else {
			cutoff=10000;
		}
				
		Object[] params = new Object[] { cutoff };
		
		int[] types = new int[] { Types.BIGINT};		
		
		long serial = (long)jdbcTemplate.queryForLong(SERIAL_QUERY, params, types);
		serial++;
		
		return serial;
	}
	
	
	
	@Override
	public void insertBulkContent(final List<KhContent> proposalList) {
		JdbcTemplate jdbcTemplate = DatabaseConnectionUtil.getDB2JdbcTemplate();
		//java.util.Date utilDate = new java.util.Date();
		// System.out.println("proposalList:: " + proposalList);

		ListIterator<KhContent> itr = proposalList.listIterator();  
		try{
		while(itr.hasNext()){  
			
			KhContent proposal = itr.next();
			if(proposal.getIsDeleted().equals("Y")){
				proposal.setKhContentStoreId(getKeyFromSerial(proposal.getSerialNo(),jdbcTemplate));				
				delete(proposal.getKeyObject(),jdbcTemplate);
			} else if(proposal.getSerialNo() > 0){
				update(proposal,jdbcTemplate);
			} else {
				create(proposal,jdbcTemplate);
			}
			
			} 
		} catch(Exception e){
			e.printStackTrace();
		}
/*		int count = 0;
		int successCount = 0;
		int failCount = 0;
		int notAavailable = 0;
		int res[] = null;
		try {
			res = jdbcTemplate.batchUpdate(SQL_INSERT_CONTENT, new BatchPreparedStatementSetter() {

				@Override
				public void setValues(PreparedStatement ps, int i) throws SQLException {
					KhContent bean = proposalList.get(i);
					ps.setString(1, bean.getLink());
					ps.setString(2, bean.getContentName());
					ps.setString(3, bean.getIndustry());
					ps.setString(4, bean.getServiceArea());
					ps.setString(5, bean.getServiceLine());
					ps.setString(6, bean.getTechTools());
					ps.setString(7, bean.getType());
					if (bean.getDatePublished() != null)
						ps.setDate(8, new java.sql.Date(bean.getDatePublished().getTime()));
					else
						ps.setNull(8, Types.DATE);
					if (bean.getIsRetired() != null) {
						ps.setString(9, bean.getIsRetired());
					} else {
						ps.setString(9, "N");
					}
					ps.setString(10, bean.getTop());
					ps.setString(11, bean.getExternalLink());
					ps.setString(12, bean.getCategory());
					ps.setString(13, bean.getGeo());
					ps.setString(14, bean.getGrowthareaCamss());
					ps.setString(15, bean.getCompetitors());
					if (bean.getYear() == 0l) {
						ps.setNull(16, Types.INTEGER);
					} else {
						ps.setLong(16, bean.getYear());
					}
					ps.setString(17, bean.getSource());
					ps.setString(18, bean.getTcv());
					ps.setString(19, bean.getTags());
					ps.setLong(20, bean.getScore());
					ps.setString(21, bean.getComments());
					ps.setLong(22, bean.getSerialNo());
					ps.setString(23, bean.getDescription());
					ps.setString(24, bean.getClient());
					if (bean.getIsDeleted() != null) {
						ps.setString(25, bean.getIsRetired());
					} else {
						ps.setString(25, "N");
					}
				}

				@Override
				public int getBatchSize() {
					// TODO Auto-generated method stub
					return proposalList.size();
				}
			});
		} catch (DataAccessException ex) {
			ex.printStackTrace();

			if (ex.getMostSpecificCause() instanceof BatchUpdateException) {

				int[] updateCounts = ((BatchUpdateException) ex.getMostSpecificCause()).getUpdateCounts();
				for (int i = 0; i < updateCounts.length; i++) {
					if (updateCounts[i] >= 0) {
						successCount++;

					} else if (updateCounts[i] == Statement.SUCCESS_NO_INFO) {
						notAavailable++;

					} else if (updateCounts[i] == Statement.EXECUTE_FAILED) {
						failCount++;
						System.out.println("\nFailed for:: " + proposalList.get(i));

					}
				}
			}
			System.out.println("Batch Result:: " + Arrays.toString(res));
		}
		if (res != null) {
			System.out.println("Batch Result Count:: " + res.length);
		}
		System.out.println("\nBatch Result:: " + Arrays.toString(res));*/
	}

	@Override
	public List<KhContent> retrieveContents(String selectedServiceLine, String selectedGeo,
			List<String> selectedIndustryList, List<String> selectedGrowthList, String type, String maxDate,
			String minDate, String competitor) {

		StringBuilder queryBuilder = new StringBuilder(sqlSelectContent);

		Boolean isParamAdded = true;

		if (StringUtils.isNotBlank(type)) {
			if (isParamAdded) {
				queryBuilder.append(" AND UPPER(TYPE) in ( select UPPER(TYPE_NAME) from CATEGORY_TYPE_MAPPINGS where UPPER(CATEGORY_NAME) = '").append(type.toUpperCase()).append("')");
			} else {

				queryBuilder.append(" WHERE  UPPER(TYPE) in ( select UPPER(TYPE_NAME) from CATEGORY_TYPE_MAPPINGS where UPPER(CATEGORY_NAME) =  '").append(type.toUpperCase()).append("')");
				isParamAdded = true;
			}

		}

		if (StringUtils.isNotBlank(selectedServiceLine)) {
			if (isParamAdded) {
				queryBuilder.append(" AND UPPER(SERVICE_LINE) = '").append(selectedServiceLine.toUpperCase())
						.append("'");
			} else {

				queryBuilder.append(" WHERE  UPPER(SERVICE_LINE) = '").append(selectedServiceLine.toUpperCase())
						.append("'");
				isParamAdded = true;
			}

		}

		if (StringUtils.isNotBlank(selectedGeo)) {
			if (isParamAdded) {
				queryBuilder.append(" AND UPPER(GEO) = '").append(selectedGeo.toUpperCase()).append("'");
			} else {

				queryBuilder.append(" WHERE  UPPER(GEO) = '").append(selectedGeo.toUpperCase()).append("'");
				isParamAdded = true;
			}

		}

		if (!CollectionUtils.isEmpty(selectedIndustryList)) {
			if (isParamAdded) {
				queryBuilder.append(" AND UPPER(INDUSTRY) IN ");
				queryBuilder.append(ProposalUtil.createQueryString(selectedIndustryList));

			} else {
				queryBuilder.append(" WHERE UPPER(INDUSTRY) IN ");
				queryBuilder.append(ProposalUtil.createQueryString(selectedIndustryList));
				isParamAdded = true;
			}

		}

		if (!CollectionUtils.isEmpty(selectedGrowthList)) {
			if (isParamAdded) {
				queryBuilder.append(" AND GROWTHAREA_CAMSS IN ");
				queryBuilder.append(ProposalUtil.createQueryString(selectedGrowthList));

			} else {
				queryBuilder.append(" WHERE GROWTHAREA_CAMSS IN ");
				queryBuilder.append(ProposalUtil.createQueryString(selectedGrowthList));
				isParamAdded = true;
			}

		}

		if (StringUtils.isNotBlank(competitor)) {
			if (isParamAdded) {
				queryBuilder.append(" AND UPPER(COMPETITORS) = '").append(competitor.toUpperCase()).append("'");
			} else {

				queryBuilder.append(" WHERE  UPPER(COMPETITORS) = '").append(competitor.toUpperCase()).append("'");
				isParamAdded = true;
			}

		}

		if (StringUtils.isNotBlank(maxDate) && StringUtils.isNotBlank(minDate)) {
			if (isParamAdded) {
				queryBuilder.append(" AND DATE_PUBLISHED <=  DATE('")
						.append(ProposalUtil.getSqlDateFromStringFormatII(maxDate)).append("')");
				queryBuilder.append(" AND DATE_PUBLISHED >=  DATE('")
						.append(ProposalUtil.getSqlDateFromStringFormatII(minDate)).append("')");
			} else {

				queryBuilder.append(" WHERE  DATE_PUBLISHED <=  DATE('")
						.append(ProposalUtil.getSqlDateFromStringFormatII(maxDate)).append("')");
				queryBuilder.append(" AND DATE_PUBLISHED >=  DATE('")
						.append(ProposalUtil.getSqlDateFromStringFormatII(minDate)).append("')");
				isParamAdded = true;
			}

		}

		queryBuilder.append("order by DATE_PUBLISHED desc ");
		//System.out.println("queryBuilder:: " + queryBuilder.toString());
		JdbcTemplate jdbcTemplate = DatabaseConnectionUtil.getDB2JdbcTemplate();
		List<KhContent> contentList = jdbcTemplate.query(queryBuilder.toString(), new ContentStoreRowMapper());
		// System.out.println("Content Size:: " + contentList.size());
		// System.out.println(contentList);
		return contentList;
	}

	/**
	 * Close JDBC Statement.
	 * 
	 * @param stmt
	 *            Statement to be closed.
	 */
	protected void close(Statement stmt) {
		if (stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
			}
		}
	}

	/**
	 * Close JDBC ResultSet.
	 * 
	 * @param rs
	 *            ResultSet to be closed.
	 */
	protected void close(ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
			}
		}
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.ibm.khub.dao.KhContentDAO#retrieveDateRange(java.lang.String)
	 */
	@Override
	public Map<String, String> retrieveDateRange(String type) {
		String query = "select MAX(DATE_PUBLISHED) maxdate , MIN(DATE_PUBLISHED) mindate from KH_CONTENT where ";
		StringBuilder queryBuilder = new StringBuilder(query);
		queryBuilder.append(" UPPER(TYPE) in ( select UPPER(TYPE_NAME) from CATEGORY_TYPE_MAPPINGS where UPPER(CATEGORY_NAME) = '").append(type.toUpperCase()).append("')");
		//System.out.println("queryBuilder:: " + queryBuilder.toString());
		JdbcTemplate jdbcTemplate = DatabaseConnectionUtil.getDB2JdbcTemplate();

		Map<String, String> dateMap = jdbcTemplate.queryForObject(queryBuilder.toString(),
				new RowMapper<Map<String, String>>() {

					@Override
					public Map<String, String> mapRow(ResultSet rs, int i) throws SQLException {
						Map<String, String> map = new HashMap<String, String>();
						DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
						String strMaxDate = "";
						if (rs.getDate("maxdate") != null) {
							strMaxDate = dateFormat.format(rs.getDate("maxdate"));
							String[] sp = strMaxDate.split("/");
							Integer mon = Integer.parseInt(sp[1]);
							Integer yr = Integer.parseInt(sp[0]);

							if (mon == 12) {
								mon = 1;
								yr++;
							} else {
								mon++;
							}
							strMaxDate = yr + "/" + mon + "/" + "01";
						}
						map.put("maxDate", strMaxDate);
						String strMinDate = "";

						if (rs.getDate("mindate") != null) {
							strMinDate = dateFormat.format(rs.getDate("mindate"));
							String[] sp = strMinDate.split("/");
							Integer mon = Integer.parseInt(sp[1]);
							Integer yr = Integer.parseInt(sp[0]);
							strMinDate = yr + "/" + mon + "/" + "01";
						}
						map.put("minDate", strMinDate);
						return map;
					}
				});
		return dateMap;
	}
}