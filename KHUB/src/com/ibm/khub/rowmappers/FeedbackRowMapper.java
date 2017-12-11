package com.ibm.khub.rowmappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.ibm.khub.pojo.Feedback;

public class FeedbackRowMapper implements RowMapper<Feedback> {

	@Override
	public Feedback mapRow(ResultSet rs, int i) throws SQLException {
		Feedback feedback = new Feedback();
		feedback.setContactName(rs.getString("USER_NAME"));
		feedback.setContactEmail(rs.getString("USER_ID"));
		feedback.setImpressionType(rs.getString("USER_IMPRESSION"));
		feedback.setProblemURL("PROBLEM_URL");
		feedback.setComments(rs.getString("COMMENTS"));
		
		return feedback;
	}

}
