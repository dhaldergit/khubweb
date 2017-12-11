package com.ibm.khub.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.ibm.khub.dao.FeedbackDAO;
import com.ibm.khub.pojo.Feedback;
import com.ibm.khub.pojo.ProposalDTO;
import com.ibm.khub.util.ProposalUtil;

public final class FeedBackService {
	
	private FeedbackDAO feedbackDAO = new FeedbackDAO();
	
	public void insertFeedBackRecord (HttpServletRequest request) {
		Feedback feedback = new Feedback();
		
		ProposalUtil.loadContent(request, feedback);
		System.out.println("feedback::: " + feedback);

		feedbackDAO.insertContent(feedback);

	}
	
	public List<Feedback> retrieveFeedbacks() {
		return feedbackDAO.retrieveFeedbacks();
	}

}
