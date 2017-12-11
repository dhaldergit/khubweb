package com.ibm.khub.service;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.ibm.khub.dao.ProposalDAO;
import com.ibm.khub.pojo.ProposalDTO;

public class ProposalService {
	
	public static Map<String, String> competitorMap = new LinkedHashMap<String, String>() {
		{
			put("Accenture", "Accenture");
			put("Capgemini", "Capgemini");
			put("Cognizant (CTS)", "CTS");
			put("HCL", "HCL");
			put("Indra", "Indra");
			put("Infosys", "Infosys");
			put("Infosys", "Infosys");
			put("NCR", "NCR");
			put("TCS", "TCS");
			put("Tech Mahindra", "Tech M");
			put("Wipro", "Wipro");
		}
	};

	public List<ProposalDTO> retrieveProposalContents(String serviceArea) throws Exception {
		return new ProposalDAO().retrieveContents(serviceArea, "PROPOSAL");
	}

	public List<ProposalDTO> retrieveContentsByCategory(String category) throws Exception {
		return new ProposalDAO().retrieveContentsByCategory(category);
	}

	public List<ProposalDTO> retrieveCapabilitiesContents(String serviceArea) throws Exception {
		return new ProposalDAO().retrieveContents(serviceArea, "capabilities");
	}
	
	public List<ProposalDTO> retrieveClientsCornerContents(String serviceArea) throws Exception {
		return new ProposalDAO().retrieveContents(serviceArea, "Clients Corner");
	}


	public List<ProposalDTO> retrieveCompetitorContents(String competitor) throws Exception {
		if (competitor.trim().equalsIgnoreCase("others")) {
			
			Set<String> compititorKeySet = competitorMap.keySet();
			return new ProposalDAO().retrieveOtherContents(compititorKeySet.toArray(new String[compititorKeySet.size()]), "Competitor Insights", "COMPETITORS");
		}
		return new ProposalDAO().retrieveContentsByCompetitor(competitor, "Competitor Insights");
	}
}
