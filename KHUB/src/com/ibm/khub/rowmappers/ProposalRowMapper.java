/**
 * 
 */
package com.ibm.khub.rowmappers;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.ibm.khub.pojo.ProposalDTO;

/**
 * @author ibm
 *
 */
public class ProposalRowMapper implements RowMapper<ProposalDTO> {

	@Override
	public ProposalDTO mapRow(ResultSet rs, int paramInt) throws SQLException {
		ProposalDTO proposal = null; 
		try {
			proposal = new ProposalDTO();
			if(rs.getInt("KH_CONTENT_STORE_ID") != 0) {
				proposal.setContentId(String.valueOf(rs.getInt("KH_CONTENT_STORE_ID")));
			} else {
				proposal.setContentId("");
			}
			if(rs.getString("LINK") != null) {
				proposal.setUrl(rs.getString("LINK"));
			} else {
				proposal.setUrl("");
			}
			if (rs.getString("INDUSTRY") != null) {
				proposal.setIndustry(rs.getString("INDUSTRY"));
			} else {
				proposal.setIndustry("");
			}
			if (rs.getString("CONTENT_NAME") != null) {
				proposal.setContentName(rs.getString("CONTENT_NAME"));
			} else {
				proposal.setContentName("");
			}
			if (rs.getString("SERVICE_LINE") != null) {
				proposal.setServiceArea(rs.getString("SERVICE_LINE"));
			} else {
				proposal.setServiceArea("");
			}
			if (rs.getString("TYPE") != null) {
				proposal.setType(rs.getString("TYPE"));
			} else {
				proposal.setType("");
			}
			Date dt = rs.getDate("DATE_PUBLISHED");
			String date = "";
			if (dt != null) {
				date = dt.toString();
			}
			proposal.setDate_published(date);
			proposal.setDayDiff(proposal.getDayDiff());
			if (rs.getString("IS_RETIRED") != null) {
				proposal.setIsRetired(rs.getString("IS_RETIRED"));
			} else {
				proposal.setIsRetired("");
			}
			if (rs.getString("COMPETITORS") != null) {
				proposal.setCompetitors(rs.getString("COMPETITORS"));
			} else {
				proposal.setCompetitors("");
			}
			if (rs.getString("GEO") != null) {
				proposal.setCountry(rs.getString("GEO"));
			} else {
				proposal.setCountry("");
			}
			if (rs.getString("GROWTHAREA_CAMSS") != null) {
				proposal.setGrowthareaCamss(rs.getString("GROWTHAREA_CAMSS"));
			} else {
				proposal.setGrowthareaCamss("");
			}
			if (rs.getString("YEAR") != null) {
				proposal.setYear(rs.getString("YEAR"));
			} else {
				proposal.setYear("");
			}

			if (rs.getString("DESCRIPTION") != null) {
				proposal.setShortName(rs.getString("DESCRIPTION"));
			} else {
				proposal.setShortName("");
			}
			if (rs.getString("TOP") != null) {
				proposal.setHomepageLinks(rs.getString("TOP"));
			} else {
				proposal.setHomepageLinks("");
			}
			if (rs.getString("EXTERNAL_LINK") != null) {
				proposal.setIsBox(rs.getString("EXTERNAL_LINK"));
			} else {
				proposal.setIsBox("");
			}
		} catch (Exception e) {
			System.out.println("Failed for:" + proposal);
		}
		return proposal;
	}

}
