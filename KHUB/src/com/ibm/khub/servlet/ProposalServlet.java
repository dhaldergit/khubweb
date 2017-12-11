package com.ibm.khub.servlet;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.map.type.TypeFactory;
import org.codehaus.jackson.type.TypeReference;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PiePlot3D;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DefaultPieDataset;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.DatabaseStartupValidator;
import org.springframework.util.StringUtils;

import com.google.gson.Gson;
import com.ibm.khub.dao.MetricsDAO;
import com.ibm.khub.dao.PatRequestDAO;
import com.ibm.khub.pojo.Feedback;
import com.ibm.khub.pojo.PatRequest;
import com.ibm.khub.pojo.ProposalDTO;
import com.ibm.khub.pojo.ReportPOJO;
import com.ibm.khub.rowmappers.ProposalRowMapper;
import com.ibm.khub.service.ContentService;
import com.ibm.khub.service.FeedBackService;
import com.ibm.khub.service.KHContentService;
import com.ibm.khub.service.MetricsService;
import com.ibm.khub.service.ProposalService;
import com.ibm.khub.util.DatabaseConnectionUtil;

/**
 * Servlet implementation class ProposalServlet
 */
public class ProposalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ContentService contentService = new ContentService();
	PatRequestDAO patRequestDAO = new PatRequestDAO();
	FeedBackService feedBackService = new FeedBackService();
	KHContentService kHContentService = new KHContentService();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProposalServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
/*	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}*/

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session =  request.getSession();
		String url1  = request.getQueryString();
		String url2 =  request.getRequestURI();
		String url5 = request.getContextPath();
		String svc = request.getParameter("serviceLine");
		String comp =  request.getParameter("competitor");
		String type_page =  request.getParameter("type");
		
		String pag_svc = "serviceLine=";
		String iot = "& Internet of Things";
		String analytic ="& Analytics";
		String design = "& Design";
		String comp_desc="competitor=";
		String ind_desc = "industryList=";
		String util = "& Utilities";
		String chem = "& Petroleum";
		String induslist = request.getParameter("industryList");
		
		String url= null;
		//System.out.println("the url5 is ::::"+type_page);
		
				
	if((StringUtils.hasText(type_page) && type_page.trim().length() > 0) || (StringUtils.hasText(svc) && svc.trim().length() > 0) || (StringUtils.hasText(comp) && comp.trim().length() > 0)||(StringUtils.hasText(induslist) && induslist.trim().length() > 0))	
		{
		if(type_page.trim().equalsIgnoreCase("Capabilities"))
		
		{
		if(svc.trim().equalsIgnoreCase("Digital"))
		{
			url = '/'+ "capabilities.jsp"+'?'+pag_svc+svc+' '+iot;
			
			
		}
		
		if(svc.trim().equalsIgnoreCase("Strategy"))
		{
			url = '/'+ "capabilities.jsp"+'?'+pag_svc+svc+' '+'&'+' '+design;
			
			
		}
		if(svc.trim().equalsIgnoreCase("Cognitive"))
		{
			url = '/'+ "capabilities.jsp"+'?'+pag_svc+svc+' '+analytic;
			
			
		}
		
		else
		{
			url = '/'+ "capabilities.jsp"+'?'+pag_svc+svc;
		}
		
		
		}
		
		
		if(type_page.trim().equalsIgnoreCase("Proposals"))
		{
		
		if(svc.trim().equalsIgnoreCase("Cognitive "))
		{
			url = '/'+"proposalbank.jsp"+'?'+pag_svc+svc+' '+analytic;
		}
	
		if(svc.trim().equalsIgnoreCase("Digital Operations "))
		{
			url = '/'+"proposalbank.jsp"+'?'+pag_svc+svc+' '+iot;
			
			
		}
		
		if(svc.trim().equalsIgnoreCase("Strategy"))
		{
			url = '/'+ "proposalbank.jsp"+'?'+pag_svc+svc+' '+design;
			
			
		}
		
		else
		{
			url = '/'+"proposalbank.jsp"+'?'+pag_svc+svc;
		}
		
		}
		
		
		if(type_page.trim().equalsIgnoreCase("Proposal Inserts"))
		{
		
		if(svc.trim().equalsIgnoreCase("Cognitive "))
		{
			url = '/'+ "proposalinserts.jsp"+'?'+pag_svc+svc+' '+analytic;
		}
	
		if(svc.trim().equalsIgnoreCase("Digital Operations & Internet of Things"))
		{
			url = '/'+ "proposalinserts.jsp"+'?'+pag_svc+svc+' '+iot;
			
			
		}
		
		if(svc.trim().equalsIgnoreCase("Strategy"))
		{
			url = '/'+ "proposalinserts.jsp"+'?'+pag_svc+svc+' '+design;
			
			
		}
		
		else
		{
			url = '/'+ "proposalinserts.jsp"+'?'+pag_svc+svc;
		}
		
		}
		
		
		
		if(type_page.trim().equalsIgnoreCase("Client Corner"))
		{
		
		if(svc.trim().equalsIgnoreCase("Cognitive"))
		{
			url = '/'+ "clientsCorner.jsp"+'?'+pag_svc+svc+' '+analytic;
		}
	
		if(svc.trim().equalsIgnoreCase("Digital "))
		{
			url = '/'+ "clientsCorner.jsp"+'?'+pag_svc+svc+' '+iot;
			
			
		}
		
		if(svc.trim().equalsIgnoreCase("Strategy"))
		{
			url = '/'+ "clientsCorner.jsp"+'?'+pag_svc+svc+' '+design;
			
			
		}
		
		else
		{
			url = '/'+ "clientsCorner.jsp"+'?'+pag_svc+svc;
		}
		
		}
		
		
		
		if(type_page.trim().equalsIgnoreCase("Competitor Insights"))
		{
			url = '/'+ "competitorinsight.jsp"+'?'+comp_desc+comp;
		}
		
		
		if(type_page.trim().equalsIgnoreCase("Market Insights"))
		{
			
			if(induslist.trim().equalsIgnoreCase("Energy"))
			{
				url = '/'+ "marketinsight.jsp"+'?'+ind_desc+induslist+' '+util;
			}
			
			if(induslist.trim().equalsIgnoreCase("Chemical"))
			{
				url = '/'+ "marketinsight.jsp"+'?'+ind_desc+induslist+' '+chem;
			}
		
			else
			{
			url = '/'+ "marketinsight.jsp"+'?'+ind_desc+induslist;
			}
		}
		
	}

		//System.out.println("the url value::"+url);
		session.setAttribute("contexturl", url);
		
		String khubPage = request.getParameter("khubPageId");
		 //System.out.println("khubPage:: " + khubPage);
		if (khubPage.equalsIgnoreCase("proposalBankPage")) {
			String serviceArea = request.getParameter("service_area");
			 //System.out.println("serviceArea :: " + serviceArea);
			if (serviceArea != null) {
				try {
					List<ProposalDTO> proposalList = new ProposalService().retrieveProposalContents(serviceArea);
					String json = new Gson().toJson(proposalList);
					response.setContentType("application/json");
					response.setCharacterEncoding("UTF-8");
					response.getWriter().write(json);

				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					throw new ServletException("Error Occured");
				}
			}
		} else if (khubPage.equalsIgnoreCase("contentUploadPage")) {
			Map<String, Object> parameterMap = request.getParameterMap();
			// System.out.println("parameterMap :: " + parameterMap);
			contentService.insertForIndividualContent(request);
			response.sendRedirect("/success.jsp");
		} else if (khubPage.equalsIgnoreCase("proposalInsertPage")) {
			String category = request.getParameter("category");
			// System.out.println("category :: " + category);
			if (category.equalsIgnoreCase("TransitionTransformation")) {
				category = "Transition & Transformation";
			}
			if (category != null) {
				try {
					List<ProposalDTO> proposalList = new ProposalService().retrieveContentsByCategory(category);
					String json = new Gson().toJson(proposalList);
					response.setContentType("application/json");
					response.setCharacterEncoding("UTF-8");
					response.getWriter().write(json);

				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					throw new ServletException("Error Occured");
				}
			}
		} else if (khubPage.equalsIgnoreCase("contentFormUpdatePage")) {
			String tableData = (String) request.getParameter("tableData");
			ObjectMapper mapper = new ObjectMapper();
			List<ProposalDTO> contentList = new ArrayList<ProposalDTO>();
			contentList = mapper.readValue(tableData, new TypeReference<ArrayList<ProposalDTO>>() {
			});
			//System.out.println("Here::  " + contentList);

			contentService.updateBulkContent(contentList);
		} else if (khubPage.equalsIgnoreCase("searchContentPage")) {
			List<ProposalDTO> contentList = contentService.searchContent(request);
			String json = new Gson().toJson(contentList);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(json);

		} else if (khubPage.equalsIgnoreCase("populateDropDowns")) {

			String json = contentService.populateDropDowns();
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(json);
		} else if (khubPage.equalsIgnoreCase("capabilitiesPage")) {
			String serviceArea = request.getParameter("service_area");
			// System.out.println("serviceArea :: " + serviceArea);
			if (serviceArea != null) {
				try {
					List<ProposalDTO> proposalList = new ProposalService().retrieveCapabilitiesContents(serviceArea);
					String json = new Gson().toJson(proposalList);
					response.setContentType("application/json");
					response.setCharacterEncoding("UTF-8");
					response.getWriter().write(json);

				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					throw new ServletException("Error Occured");
				}
			}
		} else if (khubPage.equalsIgnoreCase("competitorsPage")) {
			String competitor = request.getParameter("competitor");
			// System.out.println("competitor :: " + competitor);
			if (competitor != null) {
				try {
					List<ProposalDTO> proposalList = new ProposalService().retrieveCompetitorContents(competitor);
					String jsonContentList = new Gson().toJson(proposalList);
					response.setContentType("application/json");
					response.setCharacterEncoding("UTF-8");
					response.getWriter().write(jsonContentList);

				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					throw new ServletException("Error Occured");
				}
			}
		} else if (khubPage.equalsIgnoreCase("competitorsList")) {
			String competitor = request.getParameter("competitor");
			// System.out.println("competitor :: " + competitor);
			if (competitor != null) {
				try {
					List<ProposalDTO> proposalList = new ProposalService().retrieveCompetitorContents(competitor);
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("contentList", proposalList);
					// map.put("competitorList", competitorList);
					Map<String, String> competitorMap = ProposalService.competitorMap;
					competitorMap.put("Others", "Others");
					map.put("competitorList", competitorMap);

					// String json = new Gson().toJson(map, HashMap.class);
					ObjectMapper mapper = new ObjectMapper();
					String json = mapper.writeValueAsString(map);
					// System.out.println("map::: " + map);
					// System.out.println("json::: " + json);
					response.setContentType("application/json");
					response.setCharacterEncoding("UTF-8");
					response.getWriter().write(json);

				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					throw new ServletException("Error Occured");
				}
			}
		} else if (khubPage.equalsIgnoreCase("patSearchPage")) {
			List<PatRequest> contentList = contentService.retrievePatRequestContent(request);
			String json = new Gson().toJson(contentList);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(json);

		} else if (khubPage.equalsIgnoreCase("patSearchUpdatePage")) {
			String updateJson = request.getParameter("tableData");
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObj = null;
			try {
				jsonObj = (JSONObject) jsonParser.parse(updateJson);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				throw new ServletException("Error Occured");
			}
			JSONArray jsonArr = (JSONArray) jsonObj.get("khReqData");

			ObjectMapper mapper = new ObjectMapper();
			// Map<String, String> contentMap = new HashMap<String, String>();
			List<Map<String, String>> contentList = new ArrayList<Map<String, String>>();
			contentList = mapper.readValue(jsonArr.toJSONString(), new TypeReference<ArrayList<Map<String, String>>>() {
			});

			// System.out.println("contentList::: "+contentList);

			patRequestDAO.patBulkUpdate(contentList);
		} else if (khubPage.equalsIgnoreCase("proposalInsertServiceLinePage")) {
			String serviceArea = request.getParameter("service_area");
			// System.out.println("serviceArea :: " + serviceArea);
			if (serviceArea != null) {
				try {
					List<ProposalDTO> proposalList = new ContentService()
							.retrieveContentsByCategoryAndServiceLine(serviceArea);
					String json = new Gson().toJson(proposalList);
					response.setContentType("application/json");
					response.setCharacterEncoding("UTF-8");
					response.getWriter().write(json);

				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					throw new ServletException("Error Occured");
				}
			}
		} else if (khubPage.equalsIgnoreCase("clientsCornerPage")) {
			String serviceArea = request.getParameter("service_area");
			 //System.out.println("serviceArea :: " + serviceArea);
			if (serviceArea != null) {
				try {
					List<ProposalDTO> proposalList = new ProposalService().retrieveClientsCornerContents(serviceArea);
					String json = new Gson().toJson(proposalList);
					response.setContentType("application/json");
					response.setCharacterEncoding("UTF-8");
					response.getWriter().write(json);

				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					throw new ServletException("Error Occured");
				}
			}
		} else if (khubPage.equalsIgnoreCase("metricsTrendPage")) {
			MetricsService metricsService = new MetricsService();
			String json = metricsService.createReportJson();
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(json);

		} else if (khubPage.equalsIgnoreCase("metricsTrendGraph")) {
			MetricsService metricsService = new MetricsService();
			metricsService.createMetricGraphs(getServletContext().getRealPath("/images"));

			String json = "success";
			response.setContentType("text/html");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(json);

		} else if (khubPage.equalsIgnoreCase("metricsKHServicePage")) {
			MetricsService metricsService = new MetricsService();
			String json = metricsService.createOtherMetricJson(MetricsDAO.serviceRequestKhubMetricsQuery, null);
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("khMonthWiseData", json);
			json = metricsService.createOtherMetricJson(MetricsDAO.servReqMetricsBySectorQuery, null);
			jsonObj.put("khSectorWiseData", json);
			json = metricsService.createOtherMetricJson(MetricsDAO.servReqMetricsByGroupQuery, null);
			jsonObj.put("khGroupWiseData", json);

			metricsService.createOtherMetricsBARChartGraphs(getServletContext().getRealPath("/images"),
					MetricsDAO.serviceRequestKhubMetricsQuery, "BarChartKHServ.jpeg", "Month wise KH Requests Report",
					"Number of Requests", "Months");
			metricsService.createOtherMetricPieGraphs(getServletContext().getRealPath("/images"),
					MetricsDAO.servReqMetricsBySectorQuery, "PieChartKHBySector.jpeg",
					"Sectorwise Distribution of KH Requests", null);
			metricsService.createOtherMetricPieGraphs(getServletContext().getRealPath("/images"),
					MetricsDAO.servReqMetricsByGroupQuery, "PieChartKHByGroup.jpeg",
					"Group wise Distribution of KH Requests", null);

			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(jsonObj.toString());

		} else if (khubPage.equalsIgnoreCase("metricsPatReqPage")) {
			MetricsService metricsService = new MetricsService();
			String json = metricsService.createOtherMetricJson(MetricsDAO.servPatTCVMetricsBySectorQuery, "DOUBLE");
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("patTCVSectorWiseData", json);
			json = metricsService.createOtherMetricJson(MetricsDAO.servPatReqMetricsBySectorQuery, "DOUBLE");
			jsonObj.put("patReqSectorWiseData", json);
			// json =
			// metricsService.createOtherMetricJson(MetricsDAO.servReqMetricsByGroupQuery);
			// jsonObj.put("khGroupWiseData", json);

			// metricsService.createOtherMetricsBARChartGraphs(getServletContext().getRealPath("/images"),
			// MetricsDAO.serviceRequestKhubMetricsQuery, "BarChartKHServ.jpeg",
			// "Month wise KH Requests Report", "Number of Requests", "Months");
			// metricsService.createOtherMetricsBARChartGraphs(getServletContext().getRealPath("/images"),
			// MetricsDAO.servReqMetricsBySectorQuery,
			// "BarChartKHBySector.jpeg", "Sector wise KH Requests Report",
			// "Number of Requests", "Sector");
			metricsService.createOtherMetricPieGraphs(getServletContext().getRealPath("/images"),
					MetricsDAO.servPatReqMetricsBySectorQuery, "PieChartPatReqBySector.jpeg",
					"Sectorwise Distribution of PAT Requests", "DOUBLE");
			metricsService.createOtherMetricPieGraphs(getServletContext().getRealPath("/images"),
					MetricsDAO.servPatTCVMetricsBySectorQuery, "PieChartPatTcvBySector.jpeg",
					"TCV wise Distribution of PAT Requests", "DOUBLE");

			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(jsonObj.toString());

		} else if (khubPage.equalsIgnoreCase("feedBackPage")) {
			Map<String, Object> parameterMap = request.getParameterMap();
			// System.out.println("parameterMap :: " + parameterMap);
			feedBackService.insertFeedBackRecord(request);
			response.sendRedirect("/success.jsp");
		} else if (khubPage.equalsIgnoreCase("feedBackMetricsPage")) {

			List<Feedback> feedbacks = feedBackService.retrieveFeedbacks();
			String json = new Gson().toJson(feedbacks);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(json);
		} else if (khubPage.equalsIgnoreCase("proposalPage")) {
			String type = request.getParameter("type");
			String maxDate = request.getParameter("maxDate");
			String minDate = request.getParameter("minDate");
			String selectedServiceLine = "";
			if (org.apache.commons.lang3.StringUtils.isNotBlank(request.getParameter("serviceLine"))) {
				selectedServiceLine = request.getParameter("serviceLine");
				//System.out.println("The selected service line is ::"+selectedServiceLine);
			}

			String competitor = "";
			if (org.apache.commons.lang3.StringUtils.isNotBlank(request.getParameter("competitor"))) {
				competitor = request.getParameter("competitor");
			}
			String selectedGeo = "";
			if (org.apache.commons.lang3.StringUtils.isNotBlank(request.getParameter("geo"))) {
				selectedGeo = request.getParameter("geo");
			}
			List<String> selectedIndustryList = null;
			Boolean isAllIndustry = false;
			Boolean isAllGrowthArea = false;
			if (org.apache.commons.lang3.StringUtils.isNotBlank(request.getParameter("selectAll_industryList"))) {
				isAllIndustry = true;
			} else if (request.getParameterValues("industryList") != null) {
				selectedIndustryList = Arrays.asList(request.getParameterValues("industryList"));
			} else {
				isAllIndustry = true;
			}
			List<String> selectedGrowthList = null;
			if (org.apache.commons.lang3.StringUtils.isNotBlank(request.getParameter("selectAll_growthAreaList"))) {
				isAllGrowthArea = true;
			} else if (request.getParameterValues("growthAreaList") != null) {
				selectedGrowthList = Arrays.asList(request.getParameterValues("growthAreaList"));
			} else {
				isAllGrowthArea = true;
			}

			Map<String, Object> map = kHContentService.retrieveContents(selectedServiceLine, selectedGeo,
					selectedIndustryList, isAllIndustry, selectedGrowthList, isAllGrowthArea, type, maxDate, minDate,
					competitor);
			ObjectMapper mapper = new ObjectMapper();
			String json = mapper.writeValueAsString(map);
			// System.out.println("map::: " + map);

			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(json);
		}

	}

}
