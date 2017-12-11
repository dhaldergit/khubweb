package com.ibm.khub.dao;

import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;

import com.ibm.khub.pojo.Feedback;
import com.ibm.khub.rowmappers.FeedbackRowMapper;
import com.ibm.khub.util.DatabaseConnectionUtil;

public class FeedbackDAO {

	public static String insertQuery = "INSERT INTO USER_FEEDBACK (USER_NAME, USER_ID, USER_IMPRESSION, PROBLEM_URL, COMMENTS, CREATED_DATE) VALUES ( ?, ?, ?, ?, ?, current_date )";
	
	public static String retrieveFeedbacksQuery = " select  * from USER_FEEDBACK ";

	public void insertContent(Feedback feedback) {

		JdbcTemplate jdbcTemplate = DatabaseConnectionUtil.getDB2JdbcTemplate();
		java.util.Date dt = new java.util.Date();

		int res = jdbcTemplate.update(insertQuery, new Object[] { feedback.getContactName(), feedback.getContactEmail(),
				feedback.getImpressionType(), feedback.getProblemURL(), feedback.getComments() });
		if (res == 1) {
			System.out.println("inserted :: " + feedback);
		}
	}
	
	public List<Feedback> retrieveFeedbacks() {
		JdbcTemplate jdbcTemplate = DatabaseConnectionUtil.getDB2JdbcTemplate();
		List<Feedback> feedbacks = jdbcTemplate.query(retrieveFeedbacksQuery, new FeedbackRowMapper());
		System.out.println("feedbacks:: "+ feedbacks);
		return feedbacks;
	}

}
