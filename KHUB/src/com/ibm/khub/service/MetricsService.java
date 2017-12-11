package com.ibm.khub.service;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.DateFormatSymbols;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.map.SerializationConfig.Feature;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PiePlot3D;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.data.general.PieDataset;

import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.databind.annotation.JsonSerialize.Inclusion;
import com.ibm.khub.dao.MetricsDAO;
import com.ibm.khub.pojo.Metrics;
import com.ibm.khub.pojo.ReportPOJO;
import com.ibm.khub.util.MetricNullKeySerializer;

public class MetricsService {

	MetricsDAO metricsDAO = new MetricsDAO();
	String[] shortMonths = new DateFormatSymbols().getShortMonths();

	/**
	 * @param metricsList
	 * @return
	 */
	public Map<String, Map<String, Map<String, Metrics>>> retrieveMetricsHitCountMap(List<Metrics> metricsList) {

		Map<String, Map<String, Map<String, Metrics>>> metricMap = new HashMap<String, Map<String, Map<String, Metrics>>>();

		for (Metrics metrics : metricsList) {
			if (metricMap.containsKey(metrics.getPageName())) {
				Map<String, Map<String, Metrics>> yearMap = metricMap.get(metrics.getPageName());
				if (yearMap.containsKey(metrics.getYear())) {
					Map<String, Metrics> monthMap = yearMap.get(metrics.getYear());
					monthMap.put(metrics.getMonth().toUpperCase(), metrics);
				} else {
					Map<String, Metrics> monthMap = new HashMap<String, Metrics>();
					yearMap.put(metrics.getYear(), monthMap);
					monthMap.put(metrics.getMonth().toUpperCase(), metrics);
				}
			} else {
				Map<String, Map<String, Metrics>> yearMap = new HashMap<String, Map<String, Metrics>>();
				metricMap.put(metrics.getPageName(), yearMap);
				Map<String, Metrics> monthMap = new HashMap<String, Metrics>();
				yearMap.put(metrics.getYear(), monthMap);
				monthMap.put(metrics.getMonth().toUpperCase(), metrics);
			}
		}

		return metricMap;
	}

	/**
	 * @return
	 */
	public Map<String, Map<String, ReportPOJO>> createMetricData() {
		Map<String, Object> map = metricsDAO.retrieveHitCountRecords();
		List<Metrics> metricsList = (List<Metrics>) map.get("metricsCountRecords");
		Metrics initialMonthYear = (Metrics) map.get("intialMonthYear");
		Map<String, Map<String, Map<String, Metrics>>> metricMap = retrieveMetricsHitCountMap(metricsList);

		Map<String, Map<String, ReportPOJO>> reportMap = new LinkedHashMap<String, Map<String, ReportPOJO>>();
		Map<String, ReportPOJO> totalMap = new LinkedHashMap<String, ReportPOJO>();

		for (String pageName : metricMap.keySet()) {
			Integer month = Integer.parseInt(initialMonthYear.getMonth());
			Integer year = Integer.parseInt(initialMonthYear.getYear());
			Map<String, Map<String, Metrics>> yearMap = metricMap.get(pageName);
			Map<String, ReportPOJO> mnthMap = new LinkedHashMap<String, ReportPOJO>();
			reportMap.put(pageName, mnthMap);
			Integer currMnth = 0;
			int currYear = year;
			for (int i = 1; i <= 12; i++) {
				currMnth = month + 1;

				if (month == 12) {
					currMnth = 1;
					currYear++;
				} else if (month == 13) {
					month = 1;
					currMnth = 2;
					year++;
				}
				String mntStr = shortMonths[currMnth - 1] + currYear;
				String currYearStr = String.valueOf(currYear);
				String currMonthStr = String.valueOf(shortMonths[currMnth - 1]).toUpperCase();

				String yearStr = String.valueOf(year);
				String monthStr = String.valueOf(shortMonths[month - 1]).toUpperCase();
				Integer prevCount = 0;
				Integer currCount = 0;
				Integer difference = 0;
				if (yearMap.get(yearStr) != null && yearMap.get(yearStr).get(monthStr) != null
						&& StringUtils.isNotBlank(yearMap.get(yearStr).get(monthStr).getHits())) {
					prevCount = Integer.parseInt(yearMap.get(yearStr).get(monthStr).getHits());
				}
				if (yearMap.get(currYearStr) != null && yearMap.get(currYearStr).get(currMonthStr) != null
						&& StringUtils.isNotBlank(yearMap.get(currYearStr).get(currMonthStr).getHits())) {
					currCount = Integer.parseInt(yearMap.get(currYearStr).get(currMonthStr).getHits());
				}

				difference = currCount - prevCount;

				if (totalMap.containsKey(mntStr)) {
					ReportPOJO repPojo = totalMap.get(mntStr);
					repPojo.setHitCount(String.valueOf(Integer.parseInt(repPojo.getHitCount()) + currCount));
					repPojo.setDifference(String.valueOf(Integer.parseInt(repPojo.getDifference()) + difference));
				} else {
					totalMap.put(mntStr,
							new ReportPOJO(String.valueOf(currCount), String.valueOf(currCount - prevCount)));
				}
				ReportPOJO rp = new ReportPOJO(String.valueOf(currCount), String.valueOf(currCount - prevCount));
				mnthMap.put(mntStr, rp);
				month++;
			}

		}

		reportMap.put("Total", totalMap);

		return reportMap;
	}

	/**
	 * @return
	 */
	public String createReportJson() {
		Map<String, Map<String, ReportPOJO>> reportMap = createMetricData();
		ObjectMapper mapper = new ObjectMapper();
		String json = null;
		try {
			json = mapper.writeValueAsString(reportMap);
		} catch (JsonGenerationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("map::: " + reportMap);
		System.out.println("json::: " + json);

		return json;
	}

	/*public void insertMetricsRecord(String pageName, String userName) {
		metricsDAO.insertMetricsRecord(pageName, userName);
	}*/
	
	public void insertMetricsRecord(String pageName, String userName, String uri) {
		metricsDAO.insertMetricsRecord(pageName, userName, uri);
	}

	public void createMetricGraphs(String path) {
		final DefaultCategoryDataset dataset = new DefaultCategoryDataset();

		Map<String, Map<String, ReportPOJO>> mets = createMetricData();
		for (String key : mets.get("Total").keySet()) {
			dataset.addValue(Integer.parseInt(mets.get("Total").get(key).getHitCount()), key, "");
		}

		JFreeChart barChart = ChartFactory.createBarChart3D("Month Wise Distribution", "Month", "Hits", dataset,
				PlotOrientation.VERTICAL, true, true, false);

		int width = 640; /* Width of the image */
		int height = 480; /* Height of the image */
		System.out.println("request.getContextPath() ::: " + path);
		File BarChart = new File(path + "/BarChart.jpeg");
		try {
			ChartUtilities.saveChartAsJPEG(BarChart, barChart, width, height);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		/////////////////////////////////////////////////////////

		DefaultPieDataset pieDataset = new DefaultPieDataset();

		for (String key : mets.keySet()) {
			if (!key.equalsIgnoreCase("Total")) {
				Integer hitCount = 0;
				for (String dataKey : mets.get(key).keySet()) {
					hitCount = hitCount + Integer.parseInt(mets.get(key).get(dataKey).getHitCount());
				}
				pieDataset.setValue(key + " = " + hitCount, hitCount);
			}
		}

		JFreeChart chart = ChartFactory.createPieChart3D("Page Wise Distribution", // chart
																			// title
				pieDataset, // data
				true, // include legend
				true, false);

		final PiePlot3D plot = (PiePlot3D) chart.getPlot();
		plot.setStartAngle(270);
//		plot.setForegroundAlpha(0.60f);
		plot.setInteriorGap(0.02);
		width = 640; /* Width of the image */
		height = 480; /* Height of the image */
		File pieChart3D = new File(path + "/PieChart.jpeg");
		try {
			ChartUtilities.saveChartAsJPEG(pieChart3D, chart, width, height);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		////////////////////////////////////////////////////////////////////////
	}
	
	public String createOtherMetricJson(String query, String type) {
		ObjectMapper mapper = new ObjectMapper();
		//mapper.getSerializerProvider().setNullKeySerializer(new MetricNullKeySerializer());
		String json = null;
		try {
			Map<String,String> map = metricsDAO.retrieveGeneralMetricRecords(query, type);
			if(map.containsKey("")) {
				map.remove("");
			}
			if(map.containsKey(null)) {
				map.remove(null);
			}
			json = mapper.writeValueAsString(map);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("other metric json::: " + json);

		return json;
	}
	
	public void createOtherMetricsBARChartGraphs(String path, String query, String fileName, String graphName, String xAxisName, String yAxisName) {
		final DefaultCategoryDataset dataset = new DefaultCategoryDataset();

		Map<String,String> mets = metricsDAO.retrieveGeneralMetricRecords(query, null);
		if(mets.containsKey("")) {
			mets.remove("");
		}
		if(mets.containsKey(null)) {
			mets.remove(null);
		}
		for (String key : mets.keySet()) {
			dataset.addValue(Integer.parseInt(mets.get(key)), key, "");
		}

		JFreeChart barChart = ChartFactory.createBarChart3D(graphName, xAxisName, yAxisName, dataset,
				PlotOrientation.VERTICAL, true, true, false);

		int width = 640; /* Width of the image */
		int height = 480; /* Height of the image */
		System.out.println("request.getContextPath() ::: " + path);
		File BarChart = new File(path + "/" + fileName);
		try {
			ChartUtilities.saveChartAsJPEG(BarChart, barChart, width, height);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void createOtherMetricPieGraphs(String path, String query, String fileName, String graphName, String type) {
		
		DefaultPieDataset pieDataset = new DefaultPieDataset();

		Map<String,String> mets = metricsDAO.retrieveGeneralMetricRecords(query, type);
		if(mets.containsKey("")) {
			mets.remove("");
		}
		if(mets.containsKey(null)) {
			mets.remove(null);
		}
		
		for (String key : mets.keySet()) {

			if ((type != null) && type.equalsIgnoreCase("DOUBLE")) {
				pieDataset.setValue(key + " = " + mets.get(key), Double.parseDouble(mets.get(key)));
			} else {
				pieDataset.setValue(key + " = " + mets.get(key), Integer.parseInt(mets.get(key)));
			}
		}
		


		JFreeChart chart = ChartFactory.createPieChart3D(graphName, // chart
																			// title
				pieDataset, // data
				true, // include legend
				true, false);

		final PiePlot3D plot = (PiePlot3D) chart.getPlot();
		plot.setStartAngle(270);
		plot.setForegroundAlpha(0.60f);
		plot.setInteriorGap(0.02);
		Integer width = 640; /* Width of the image */
		Integer height = 480; /* Height of the image */
		File pieChart3D = new File(path + "/" + fileName);
		try {
			ChartUtilities.saveChartAsJPEG(pieChart3D, chart, width, height);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		////////////////////////////////////////////////////////////////////////
	}



	/*
	 * public static void main ( String[] args) { new
	 * MetricsService().createReportJson(); }
	 */

}
