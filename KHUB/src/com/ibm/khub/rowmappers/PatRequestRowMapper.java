/**
 * 
 */
package com.ibm.khub.rowmappers;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.ibm.khub.pojo.PatRequest;
import com.ibm.khub.pojo.ProposalDTO;
import com.ibm.khub.util.DatabaseConnectionUtil;

/**
 * @author ibm
 *
 */
public class PatRequestRowMapper implements RowMapper<PatRequest> {

	@Override
	public PatRequest mapRow(ResultSet rs, int i) throws SQLException {
		PatRequest patRequest = new PatRequest();
        patRequest.setId(rs.getLong("ID"));
        if (rs.getString("REQUESTOR") != null) {
			patRequest.setRequester(rs.getString("REQUESTOR"));
		} else {
			patRequest.setRequester("");
		}
		if (rs.getString("GEO") != null) {
			patRequest.setGeo(rs.getString("GEO"));
		} else {
			patRequest.setGeo("");
		}
		if (rs.getString("REGION") != null) {
			patRequest.setRegion(rs.getString("REGION"));
		} else {
			patRequest.setRegion("");
		}
		if (rs.getString("OPP_NO") != null) {
			patRequest.setOppNo(rs.getString("OPP_NO"));
		} else {
			patRequest.setOppNo("");
		}
		if (rs.getString("OPP_NAME") != null) {
			patRequest.setOppName(rs.getString("OPP_NAME"));
		} else {
			patRequest.setOppName("");
		}
		if (rs.getString("INDUSTRY") != null) {
			patRequest.setIndustry(rs.getString("INDUSTRY"));
		} else {
			patRequest.setIndustry("");
		}
		if (rs.getString("SECTOR") != null) {
			patRequest.setSector(rs.getString("SECTOR"));
		} else {
			patRequest.setSector("");
		}
		if (rs.getString("OFFERING_AREA") != null) {
			patRequest.setOfferingArea(rs.getString("OFFERING_AREA"));
		} else {
			patRequest.setOfferingArea("");
		}
		if (rs.getString("TCV") != null) {
			patRequest.setTcv(rs.getString("TCV"));
		} else {
			patRequest.setTcv("");
		}
		if (rs.getString("DESC") != null) {
			patRequest.setDesc(rs.getString("DESC"));
		} else {
			patRequest.setDesc("");
		}
		if (rs.getString("COUNTRY") != null) {
			patRequest.setCountry(rs.getString("COUNTRY"));
		} else {
			patRequest.setCountry("");
		}
		if (rs.getString("SERVICE_LINE") != null) {
			patRequest.setServiceLine(rs.getString("SERVICE_LINE"));
		} else {
			patRequest.setServiceLine("");
		}
		if (rs.getString("OWNER") != null) {
			patRequest.setOwner(rs.getString("OWNER"));
		} else {
			patRequest.setOwner("");
		}
		if (rs.getString("PROPOSAL_TYPE") != null) {
			patRequest.setProposalType(rs.getString("PROPOSAL_TYPE"));
		} else {
			patRequest.setProposalType("");
		}
		if (rs.getString("CONTRACT") != null) {
			patRequest.setContract(rs.getString("CONTRACT"));
		} else {
			patRequest.setContract("");
		}
		if (rs.getString("INCUMBENT") != null) {
			patRequest.setIncumbent(rs.getString("INCUMBENT"));
		} else {
			patRequest.setIncumbent("");
		}
		if (rs.getString("MAIN_COMPETITOR") != null) {
			patRequest.setMainCompetitor(rs.getString("MAIN_COMPETITOR"));
		} else {
			patRequest.setMainCompetitor("");
		}
		if (rs.getString("OTHER_COMPETITOR") != null) {
			patRequest.setOtherCompetitor(rs.getString("OTHER_COMPETITOR"));
		} else {
			patRequest.setOtherCompetitor("");
		}
		if (rs.getString("START_DATE") != null) {
			patRequest.setStartDate(rs.getString("START_DATE"));
		} else {
			patRequest.setStartDate("");
		}
		if (rs.getString("STRATEGY") != null) {
			patRequest.setStrategy(rs.getString("STRATEGY"));
		} else {
			patRequest.setStrategy("");
		}
		if (rs.getString("PROPOSAL_DUE_DATE") != null) {
			patRequest.setProposalDueDate(rs.getString("PROPOSAL_DUE_DATE"));
		} else {
			patRequest.setProposalDueDate("");
		}
		if (rs.getString("PROPOSAL_DUE_DATE_CUSTOMER") != null) {
			patRequest.setProposalDueDateCustomer(rs.getString("PROPOSAL_DUE_DATE_CUSTOMER"));
		} else {
			patRequest.setProposalDueDateCustomer("");
		}
		if (rs.getString("CLIENT_NAME") != null) {
			patRequest.setClientName(rs.getString("CLIENT_NAME"));
		} else {
			patRequest.setClientName("");
		}
		if (rs.getString("REQUEST_DATE") != null) {
			patRequest.setRequestDate(rs.getString("REQUEST_DATE"));
		} else {
			patRequest.setRequestDate("");
		}
		if (rs.getString("IS_COMPLETE") != null) {
			patRequest.setIsComplete(rs.getString("IS_COMPLETE"));
		} else {
			patRequest.setIsComplete("");
		}
		if (rs.getString("COMPLETED_DATE") != null) {
			patRequest.setCompletedDate(rs.getString("COMPLETED_DATE"));
		} else {
			patRequest.setCompletedDate("");
		}
		return patRequest;
	}
	
	
}
