package com.ibm.khub.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ibm.khub.dao.KhContentDAO;
import com.ibm.khub.dao.MasterDataDAO;
import com.ibm.khub.dao.ProposalDAO;
import com.ibm.khub.dao.impl.KhContentDAOImpl;
import com.ibm.khub.util.ProposalUtil;

public class KHContentService {
	KhContentDAO khContentDAO = new KhContentDAOImpl();
	ProposalDAO proposalDAO = new ProposalDAO();

	/**
	 * @param selectedServiceLine
	 * @param selectedGeo
	 * @param competitor TODO
	 * @return
	 */
	public Map<String, String> retrieveDropDownHTMLMap(String selectedServiceLine, String selectedGeo, String competitor) {

		Map<String, String> ddMap = new HashMap<String, String>();
		String selAllStr = "Select All";
		ddMap.put("serviceLineList",
				ProposalUtil.createDropDownHTML(
						ProposalDAO.getGenericDDList(MasterDataDAO.SELECT_SERVICE_LINE, "SERVICE_LINE"),
						selectedServiceLine, false, selAllStr));
		ddMap.put("geoList", ProposalUtil.createDropDownHTML(
				ProposalDAO.getGenericDDList(MasterDataDAO.SELECT_GEO, "GEO"), selectedGeo, false, selAllStr));
		
		ddMap.put("competitorsList", ProposalUtil.createDropDownHTML(
				ProposalDAO.getGenericDDList(MasterDataDAO.SELECT_COMPETITORS, "COMPETITORS"), competitor, false, selAllStr));

		return ddMap;
	}

	/**
	 * @param selectedIndustryList
	 * @param isSelectAllIndustry
	 * @param selectedGrowthList
	 * @param isSelectAllGrowthArea
	 * @return
	 */
	public Map<String, String> retrieveCheckBoxHTMLMap(List<String> selectedIndustryList, Boolean isSelectAllIndustry,
			List<String> selectedGrowthList, Boolean isSelectAllGrowthArea) {

		Map<String, String> cbMap = new HashMap<String, String>();

		cbMap.put("industryList",
				ProposalUtil.createCheckBoxHTML(ProposalDAO.getGenericDDList(MasterDataDAO.SELECT_INDUSTRY, "INDUSTRY"),
						selectedIndustryList, isSelectAllIndustry, "industryList", true));
		cbMap.put("growthAreaList",
				ProposalUtil.createCheckBoxHTML(
						ProposalDAO.getGenericDDList(MasterDataDAO.SELECT_GROWTHAREA_CAMSS, "GROWTHAREA_CAMSS"),
						selectedGrowthList, isSelectAllGrowthArea, "growthAreaList", true));
		
		
		return cbMap;
	}

	public Map<String, Object> retrieveContents(String selectedServiceLine, String selectedGeo,
			List<String> selectedIndustryList, Boolean isSelectAllIndustry, List<String> selectedGrowthList,
			Boolean isSelectAllGrowthArea, String type, String maxDate, String minDate, String competitor) {

		Map<String, Object> contentMap = new HashMap<String, Object>();
		contentMap.putAll(retrieveDropDownHTMLMap(selectedServiceLine, selectedGeo, competitor));
		/*System.out.println(
				"retrieveCheckBoxHTMLMap(selectedIndustryList, isSelectAllIndustry, selectedGrowthList, isSelectAllGrowthArea)::: "
						+ retrieveCheckBoxHTMLMap(selectedIndustryList, isSelectAllIndustry, selectedGrowthList,
								isSelectAllGrowthArea));*/
		contentMap.putAll(retrieveCheckBoxHTMLMap(selectedIndustryList, isSelectAllIndustry, selectedGrowthList,
				isSelectAllGrowthArea));
		
		contentMap.putAll(khContentDAO.retrieveDateRange(type));
		
		contentMap.put("contentList", khContentDAO.retrieveContents(selectedServiceLine, selectedGeo,
				selectedIndustryList, selectedGrowthList, type, maxDate, minDate, competitor));

		return contentMap;

	}

	
	//public retrieveContents
	
}
