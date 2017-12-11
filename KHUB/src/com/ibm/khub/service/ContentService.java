package com.ibm.khub.service;

import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.json.simple.JSONObject;

import com.ibm.khub.dao.KhContentDAO;
import com.ibm.khub.dao.PatRequestDAO;
import com.ibm.khub.dao.ProposalDAO;
import com.ibm.khub.dao.impl.KhContentDAOImpl;
import com.ibm.khub.pojo.DropDownProp;
import com.ibm.khub.pojo.KhContent;
import com.ibm.khub.pojo.PatRequest;
import com.ibm.khub.pojo.ProposalDTO;
import com.ibm.khub.util.ProposalUtil;

public class ContentService {
	ProposalDAO proposalDAO = new ProposalDAO();
	KhContentDAO khContentDAO = new KhContentDAOImpl();

	public void insertForIndividualContent(HttpServletRequest request) {
		ProposalDTO proposal = new ProposalDTO();
		/*
		 * if (request.getParameter("url") != null &&
		 * StringUtils.isNotBlank(request.getParameter("url"))) {
		 * proposal.setUrl(request.getParameter("url")); }
		 * 
		 * 
		 * if (request.getParameter("url") != null &&
		 * StringUtils.isNotBlank(request.getParameter("url"))) {
		 * proposal.setUrl(request.getParameter("url")); }
		 */
		ProposalUtil.loadContent(request, proposal);
		System.out.println("proposal::: " + proposal);

		proposalDAO.insertContent(proposal);

	}

	

	public void saveBulkContent(FileItem item) {
		List<KhContent> proposalList;
		try {
			proposalList = processXLS(item);
			//System.out.println("ProposalList size:: "+proposalList.size());
			khContentDAO.insertBulkContent(proposalList);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			 while(e.getNextException() != null) {
				 e.getNextException().printStackTrace();
			      e = e.getNextException();
			   }
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void updateBulkContent(List<ProposalDTO> proposalList) {
		try {
			proposalDAO.updateBulkContent(proposalList);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			 while(e.getNextException() != null) {
				 e.getNextException().printStackTrace();
			      e = e.getNextException();
			   }
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public List<KhContent> processXLS(FileItem item) throws Exception {
		String msg = "";
		List<KhContent> proposalList = new ArrayList<KhContent>();
		try {
			InputStream inputStream = item.getInputStream();
			XSSFWorkbook workbook = new XSSFWorkbook(inputStream);
			XSSFSheet firstSheet = workbook.getSheetAt(0);
			Iterator<Row> iterator = firstSheet.iterator();
			iterator.next();
			/*iterator.remove();
			iterator.next();
			iterator.remove();*/

			while (iterator.hasNext()) {
				Row nextRow = iterator.next();
				KhContent proposal = new KhContent();
				Iterator<Cell> cellIterator = nextRow.cellIterator();
				int cellNo = 1;
				if(nextRow.getCell(cellNo).getCellType() == Cell.CELL_TYPE_BLANK){
			    	  break;
			      }	
				
				System.out.println("\n---------------------------------------");
				while (cellIterator.hasNext()) {
					Cell cell = cellIterator.next();

					String value = null;
					int cellVal = cell.getColumnIndex();
					switch (cell.getCellType()) {
					case Cell.CELL_TYPE_STRING:
						//System.out.print( "\nString:: "+cellVal);
						//System.out.print(cell.getStringCellValue());
						value = cell.getStringCellValue();
						populateKHContentDTO(proposal, cellVal, value, cell);
						cellNo++;
						break;
					case Cell.CELL_TYPE_BOOLEAN:
						//System.out.print( "\nBoolean:: "+cellVal);
						//System.out.print(cell.getBooleanCellValue());
						value = String.valueOf(cell.getBooleanCellValue());
						populateKHContentDTO(proposal, cellVal, value, cell);
						cellNo++;
						break;
					case Cell.CELL_TYPE_NUMERIC:
						//System.out.print( "\nNumeric:: "+cellVal);
						//System.out.print(cell.getNumericCellValue());
						value = String.valueOf(cell.getNumericCellValue());
						populateKHContentDTO(proposal, cellVal, value, cell);
						cellNo++;
						break;
						
					default:
						//System.out.print( "\ndefault:: "+cellVal);
						value = "";
						populateKHContentDTO(proposal, cellVal, value, cell);
						cellNo++;
						//System.out.print(cellNo + " default:: ");
						cellNo++;
						break;
					}

					//System.out.print(" - ");
				}
				System.out.println("proposal:: " + proposal);

			/*	if (StringUtils.isBlank(proposal.getUrl()) || StringUtils.isBlank(proposal.getType())
						|| StringUtils.isBlank(proposal.getIsRetired())) {
					msg = " Not a valid format";
					System.out.println(msg);
					break;
				}*/
				
				if (StringUtils.isBlank(proposal.getLink()) || StringUtils.isBlank(proposal.getType())
						) {
					msg = " Not a valid format:: "+proposal;
					System.out.println(msg);
					continue;
				}
				proposalList.add(proposal);
			}

			inputStream.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (StringUtils.isNotBlank(msg)) {
			// throw new Exception(" Not a valid format");

		}
		return proposalList;

	}

	public void populateProposalDTO(ProposalDTO proposal, int cellNo, String value) {

		if (cellNo == 0) {
			proposal.setUrl(value);
		} else if (cellNo == 1) {
			proposal.setContentName(value);
		} else if (cellNo == 3) {
			proposal.setType(value);
		} else if (cellNo == 2) {
			proposal.setIndustry(value);
		} else if (cellNo == 4) {
			proposal.setDate_published(value);
		} else if (cellNo == 5) {
			proposal.setIsRetired(value);
		} else if (cellNo == 6) {
			proposal.setCountry(value);
		} else if (cellNo == 7) {
			proposal.setServiceArea(value);
		} else if (cellNo == 8) {
			proposal.setCategory(value);
		} else if (cellNo == 9) {
			proposal.setGrowthareaCamss(value);
		} else if (cellNo == 10) {
			proposal.setCompetitors(value);
		} else if (cellNo == 11) {
			proposal.setYear(value);
		} else if (cellNo == 12) {
			proposal.setTcv(value);
		} else if (cellNo == 13) {
			proposal.setHomePageLink(value);
		} else if (cellNo == 14) {
			proposal.setShortName(value);
		} else if (cellNo == 15) {
			proposal.setIsBox(value);
		}
	}

	
	public void populateKHContentDTO(KhContent proposal, int cellNo, String value, Cell cell) {
		
		if (cellNo == 3) {
			proposal.setSerialNo(((Double)cell.getNumericCellValue()).longValue());
			//proposal.setSerialNo(Long.parseLong(cell.getStringCellValue()));
		} else if (cellNo == 6) {
			try {
				proposal.setContentName(cell.getStringCellValue());
				if(cell.getHyperlink() != null && cell.getHyperlink().LINK_URL != 0 && cell.getHyperlink().getAddress() != null) {
				proposal.setLink(cell.getHyperlink().getAddress());
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (cellNo == 7) {
			proposal.setDescription(value);
		} else if (cellNo == 8) {
			try {
				proposal.setYear(((Double)cell.getNumericCellValue()).longValue());
			} catch (Exception e) {
				proposal.setYear(0l);
				e.printStackTrace();
			}
		} else if (cellNo == 9) {
			proposal.setType(value);
		} else if (cellNo == 10) {
			proposal.setGeo(value);
		} else if (cellNo == 11) {
			proposal.setIndustry(value);
		} else if (cellNo == 12) {
			proposal.setServiceLine(value);
		} else if (cellNo == 13) {
			proposal.setServiceArea(value);
		} else if (cellNo == 14) {
			proposal.setTechTools(value);
		} else if (cellNo == 15) {
			proposal.setGrowthareaCamss(value);
		} else if (cellNo == 16) {
			proposal.setTags(value);
		} else if (cellNo == 17) {
			proposal.setSource(value);
		} else if (cellNo == 18) {
			proposal.setTop(value);
		} else if (cellNo == 19) {
			proposal.setExternalLink(value);
		} else if (cellNo == 20) {
			//proposal.setDatePublished(ProposalUtil.getSqlDateFromXlsDate(value));
			try {
				proposal.setDatePublished(DateUtil.getJavaDate(Double.parseDouble(value)));
			} catch (NumberFormatException e) {
				proposal.setDatePublished( new java.util.Date());
				e.printStackTrace();
			}
		} else if (cellNo == 21) {
			try {
				proposal.setScore(((Double)cell.getNumericCellValue()).longValue());
			} catch (NumberFormatException e) {
				proposal.setScore(0l);
				e.printStackTrace();
			}
		} else if (cellNo == 22) {
			proposal.setComments(value);
		} else if (cellNo == 23) {
			proposal.setIsRetired(value);
		} else if (cellNo == 24) {
			proposal.setCompetitors(value);
		}else if (cellNo == 26) {
			proposal.setClient(value); 
		}else if (cellNo == 27) {
			proposal.setIsDeleted(value);
		}
				
	}
	public List<ProposalDTO> searchContent(HttpServletRequest request) {
		ProposalDTO proposal = new ProposalDTO();
		List<ProposalDTO> contentList = new ArrayList<ProposalDTO>();
		ProposalUtil.loadContent(request, proposal);
		System.out.println("Query Parameters::  " + proposal);
		contentList = proposalDAO.searchContent(proposal);
		populateDropDownsResults(contentList);
		return contentList;
	}

	public String populateDropDowns() {

		List<DropDownProp> ss = proposalDAO.getGenericDDList(ProposalDAO.SELECT_CATEGORY, "CATEGORY");
		List<DropDownProp> proposalInsertCategory = proposalDAO.getGenericDDList(ProposalDAO.SELECT_CATEGORY_PROPOSAL_INSERT, "CATEGORY");
		System.out.println("ss::  " + ss);
		String json = ProposalUtil.createDropDownHTML(ss, "", true, null);
		List<DropDownProp> typeDD = proposalDAO.getGenericDDList(ProposalDAO.SELECT_TYPE, "TYPE");
		List<DropDownProp> countryDD = proposalDAO.getGenericDDList(ProposalDAO.SELECT_COUNTRY, "COUNTRY_NAME");

		// List<DropDownProp> serviceAreaDD =
		// proposalDAO.getServiceAreaDDList();
		// List<DropDownProp> industryDD = proposalDAO.getIndustryDDList();

		List<DropDownProp> serviceAreaDD = proposalDAO
				.getGenericDDList("select SERVICE_LINE_NAME as SERVICE_LINE from SERVICE_LINE_LIST", "SERVICE_LINE");
		List<DropDownProp> industryDD = proposalDAO.getGenericDDList("select INDUSTRY_NAME as INDUSTRY from INDUSTRY_LIST",
				"INDUSTRY");
		List<DropDownProp> geoDD = proposalDAO.getGenericDDList("Select GEO_NAME as GEO from GEO_LIST", "GEO");

		String countryHTML = ProposalUtil.createDropDownHTML(countryDD, "", true, null);
		String typeHTML = ProposalUtil.createDropDownHTML(typeDD, "", true, null);
		String serviceAreaHTML = ProposalUtil.createDropDownHTML(serviceAreaDD, "", true, null);
		String industryHTML = ProposalUtil.createDropDownHTML(industryDD, "", true, null);
		String geoHTML = ProposalUtil.createDropDownHTML(geoDD, "", true, null);
		String proposalInsertHTML = ProposalUtil.createDropDownHTML(proposalInsertCategory, "", true, null);
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("categoryHTML", json);
		jsonObj.put("countryHTML", countryHTML);
		jsonObj.put("typeHTML", typeHTML);
		jsonObj.put("serviceAreaHTML", serviceAreaHTML);
		jsonObj.put("industryHTML", industryHTML);
		jsonObj.put("geoHTML", geoHTML);
		jsonObj.put("proposalInsertHTML", proposalInsertHTML);
		return jsonObj.toJSONString();

	}

	public void populateDropDownsResults(List<ProposalDTO> contentList) {

		List<DropDownProp> ss = proposalDAO.getGenericDDList(ProposalDAO.SELECT_CATEGORY, "CATEGORY");
		List<DropDownProp> proposalInsertCategory = proposalDAO.getGenericDDList(ProposalDAO.SELECT_CATEGORY_PROPOSAL_INSERT, "CATEGORY");
		System.out.println("ss::  " + ss);
		String json = ProposalUtil.createDropDownHTML(ss, "", true, null);
		List<DropDownProp> typeDD = proposalDAO.getGenericDDList(ProposalDAO.SELECT_TYPE, "TYPE");
		List<DropDownProp> countryDD = proposalDAO.getGenericDDList(ProposalDAO.SELECT_COUNTRY, "COUNTRY_NAME");

		// List<DropDownProp> serviceAreaDD =
		// proposalDAO.getServiceAreaDDList();
		// List<DropDownProp> industryDD = proposalDAO.getIndustryDDList();

		List<DropDownProp> serviceAreaDD = proposalDAO
				.getGenericDDList("select SERVICE_LINE_NAME as SERVICE_LINE from SERVICE_LINE_LIST", "SERVICE_LINE");
		List<DropDownProp> industryDD = proposalDAO.getGenericDDList("select INDUSTRY_NAME as INDUSTRY from INDUSTRY_LIST",
				"INDUSTRY");
		List<DropDownProp> geoDD = proposalDAO.getGenericDDList("Select distinct GEO from PAT_REQUEST", "GEO");
		List<DropDownProp> yesNoDD = new ArrayList<DropDownProp>();
		DropDownProp newDD = new DropDownProp();
		newDD.setData("Yes");
		newDD.setId("Y");
		yesNoDD.add(newDD);
		newDD = new DropDownProp();
		newDD.setData("No");
		newDD.setId("N");
		yesNoDD.add(newDD);
		for (ProposalDTO content : contentList) {
			content.setCategoryDD(ProposalUtil.createDropDownHTML(ss, content.getCategory(), true, null));
			content.setCountryDD(ProposalUtil.createDropDownHTML(countryDD, content.getCountry(), true, null));
			content.setIndustryDD(ProposalUtil.createDropDownHTML(industryDD, content.getIndustry(), true, null));
			content.setServiceAreaDD(ProposalUtil.createDropDownHTML(serviceAreaDD, content.getServiceArea(), true, null));
			content.setTypeDD(ProposalUtil.createDropDownHTML(typeDD, content.getType(), true, null));
			content.setIsBoxDD(ProposalUtil.createDropDownHTML(yesNoDD, content.getIsBox(), false, null));
			content.setIsRetiredDD(ProposalUtil.createDropDownHTML(yesNoDD, content.getIsRetired(), false, null));
			content.setProposalInsertCategoryDD(ProposalUtil.createDropDownHTML(proposalInsertCategory, content.getCategory(), false, null));
		}

	}

	/**
	 * @param request
	 * @return
	 */
	public List<PatRequest> retrievePatRequestContent(HttpServletRequest request) {
		PatRequest patRequest = new PatRequest();
		ProposalUtil.loadContent(request, patRequest);
		System.out.println("Query Parameters for PAT request search::  " + patRequest);
		return new PatRequestDAO().searchPatRequestContents(patRequest);
	}

	public List<ProposalDTO> retrieveContentsByCategoryAndServiceLine(String serviceArea) {
		List<ProposalDTO> resultList = null;
		try {
			resultList = proposalDAO.retrieveContentsByCategoryAndServiceLine("Service Line Specific", serviceArea);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return resultList;
	}
}
