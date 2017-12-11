/**
 * 
 */
package com.ibm.khub.pojo;

import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.concurrent.TimeUnit;

import org.apache.poi.ss.usermodel.DateUtil;
import org.codehaus.jackson.annotate.JsonIgnore;

/**
 * @author ibm
 *
 */
public class ProposalDTO {
	String contentId;
	String url;
	String contentName;
	String industry;
	String type;
	String date_published;
	String isRetired;
	String country;
	String serviceArea;
	String category;
	String growthareaCamss;
	String competitors;
	String year;
	String homepageLinks;
	String shortName;
	String tcv;
	String isBox;
	String homePageType;
	String homePageLink;
	String serviceAreaDD;
	String countryDD;
	String categoryDD;
	String proposalInsertCategoryDD;
	String industryDD;
	String typeDD;
	String isRetiredDD;
	String isBoxDD;
	String dayDiff;
	
	
	
	
	
	

	public String getDayDiff() {
		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date utilDate = null;
		java.util.Date currentDate = new java.util.Date();
		//TimeUnit timeUnit = new Timeuni
		String diff = "";
			
		
		try {
			utilDate = formatter.parse(date_published);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		TimeUnit.DAYS.convert((currentDate.getTime() - utilDate.getTime()), TimeUnit.MILLISECONDS);
		diff = String.valueOf(TimeUnit.DAYS.convert((currentDate.getTime() - utilDate.getTime()), TimeUnit.MILLISECONDS));
		//System.out.println("timediff::: " +diff);
		return diff;
	}

	public void setDayDiff(String dayDiff) {
		this.dayDiff = dayDiff;
	}

	public String getProposalInsertCategoryDD() {
		return proposalInsertCategoryDD;
	}

	public void setProposalInsertCategoryDD(String proposalInsertCategoryDD) {
		this.proposalInsertCategoryDD = proposalInsertCategoryDD;
	}

	public String getIsRetiredDD() {
		return isRetiredDD;
	}

	public void setIsRetiredDD(String isRetiredDD) {
		this.isRetiredDD = isRetiredDD;
	}

	public String getIsBoxDD() {
		return isBoxDD;
	}

	public void setIsBoxDD(String isBoxDD) {
		this.isBoxDD = isBoxDD;
	}

	public String getIsBox() {
		return isBox;
	}

	public void setIsBox(String isBox) {
		this.isBox = isBox;
	}

	/**
	 * @return the typeDD
	 */
	public String getTypeDD() {
		return typeDD;
	}

	/**
	 * @param typeDD the typeDD to set
	 */
	public void setTypeDD(String typeDD) {
		this.typeDD = typeDD;
	}

	/**
	 * @return the serviceAreaDD
	 */
	public String getServiceAreaDD() {
		return serviceAreaDD;
	}

	/**
	 * @param serviceAreaDD the serviceAreaDD to set
	 */
	public void setServiceAreaDD(String serviceAreaDD) {
		this.serviceAreaDD = serviceAreaDD;
	}

	/**
	 * @return the countryDD
	 */
	public String getCountryDD() {
		return countryDD;
	}

	/**
	 * @param countryDD the countryDD to set
	 */
	public void setCountryDD(String countryDD) {
		this.countryDD = countryDD;
	}

	/**
	 * @return the categoryDD
	 */
	public String getCategoryDD() {
		return categoryDD;
	}

	/**
	 * @param categoryDD the categoryDD to set
	 */
	public void setCategoryDD(String categoryDD) {
		this.categoryDD = categoryDD;
	}

	/**
	 * @return the industryDD
	 */
	public String getIndustryDD() {
		return industryDD;
	}

	/**
	 * @param industryDD the industryDD to set
	 */
	public void setIndustryDD(String industryDD) {
		this.industryDD = industryDD;
	}

	/**
	 * @return the contentId
	 */
	public String getContentId() {
		return contentId;
	}

	/**
	 * @param contentId the contentId to set
	 */
	public void setContentId(String contentId) {
		this.contentId = contentId;
	}

	/**
	 * @return the category
	 */
	public String getCategory() {
		return category;
	}

	/**
	 * @return the homePageLink
	 */
	public String getHomePageLink() {
		return homePageLink;
	}

	/**
	 * @param homePageLink
	 *            the homePageLink to set
	 */
	public void setHomePageLink(String homePageLink) {
		this.homePageLink = homePageLink;
	}

	/**
	 * @param category
	 *            the category to set
	 */
	public void setCategory(String category) {
		this.category = category;
	}

	/**
	 * @return the url
	 */
	public String getUrl() {
		return url;
	}

	/**
	 * @param url
	 *            the url to set
	 */
	public void setUrl(String url) {
		this.url = url;
	}

	/**
	 * @return the contentName
	 */
	public String getContentName() {
		return contentName;
	}

	/**
	 * @param contentName
	 *            the contentName to set
	 */
	public void setContentName(String contentName) {
		this.contentName = contentName;
	}

	/**
	 * @return the industry
	 */
	public String getIndustry() {
		return industry;
	}

	/**
	 * @param industry
	 *            the industry to set
	 */
	public void setIndustry(String industry) {
		this.industry = industry;
	}

	/**
	 * @return the serviceArea
	 */
	public String getServiceArea() {
		return serviceArea;
	}

	/**
	 * @param serviceArea
	 *            the serviceArea to set
	 */
	public void setServiceArea(String serviceArea) {
		this.serviceArea = serviceArea;
	}

	/**
	 * @return the type
	 */
	public String getType() {
		return type;
	}

	/**
	 * @param type
	 *            the type to set
	 */
	public void setType(String type) {
		this.type = type;
	}

	/**
	 * @return the date_published
	 */
	public String getDate_published() {
		return date_published;
	}

	/**
	 * @param date_published
	 *            the date_published to set
	 */
	public void setDate_published(String date_published) {
		this.date_published = date_published;
	}

	/**
	 * @return the isRetired
	 */
	public String getIsRetired() {
		return isRetired;
	}

	/**
	 * @param isRetired
	 *            the isRetired to set
	 */
	public void setIsRetired(String isRetired) {
		this.isRetired = isRetired;
	}

	/**
	 * @return the homePageType
	 */
	public String getHomePageType() {
		return homePageType;
	}

	/**
	 * @param homePageType
	 *            the homePageType to set
	 */
	public void setHomePageType(String homePageType) {
		this.homePageType = homePageType;
	}

	/**
	 * @return the homepageLinks
	 */
	public String getHomepageLinks() {
		return homepageLinks;
	}

	/**
	 * @param homepageLinks
	 *            the homepageLinks to set
	 */
	public void setHomepageLinks(String homepageLinks) {
		this.homepageLinks = homepageLinks;
	}

	/**
	 * @return the shortName
	 */
	public String getShortName() {
		return shortName;
	}

	/**
	 * @param shortName
	 *            the shortName to set
	 */
	public void setShortName(String shortName) {
		this.shortName = shortName;
	}

	/**
	 * @return the country
	 */
	public String getCountry() {
		return country;
	}

	/**
	 * @param country
	 *            the country to set
	 */
	public void setCountry(String country) {
		this.country = country;
	}

	/**
	 * @return the growthareaCamss
	 */
	public String getGrowthareaCamss() {
		return growthareaCamss;
	}

	/**
	 * @param growthareaCamss
	 *            the growthareaCamss to set
	 */
	public void setGrowthareaCamss(String growthareaCamss) {
		this.growthareaCamss = growthareaCamss;
	}

	/**
	 * @return the competitors
	 */
	public String getCompetitors() {
		return competitors;
	}

	/**
	 * @param competitors
	 *            the competitors to set
	 */
	public void setCompetitors(String competitors) {
		this.competitors = competitors;
	}

	/**
	 * @return the year
	 */
	public String getYear() {
		return year;
	}

	/**
	 * @param year
	 *            the year to set
	 */
	public void setYear(String year) {
		this.year = year;
	}

	/**
	 * @return the tcv
	 */
	public String getTcv() {
		return tcv;
	}

	/**
	 * @param tcv
	 *            the tcv to set
	 */
	public void setTcv(String tcv) {
		this.tcv = tcv;
	}

	@JsonIgnore
	public Date getSqlDate() {
		java.util.Date utilDate = DateUtil.getJavaDate(Double.parseDouble(date_published));
		java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
		return sqlDate;
	}
	
	@JsonIgnore
	public Date getSqlDateFromString() {
		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date utilDate = null;
		try {
			utilDate = formatter.parse(date_published);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
		return sqlDate;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ProposalDTO [contentId=");
		builder.append(contentId);
		builder.append(", url=");
		builder.append(url);
		builder.append(", contentName=");
		builder.append(contentName);
		builder.append(", industry=");
		builder.append(industry);
		builder.append(", type=");
		builder.append(type);
		builder.append(", date_published=");
		builder.append(date_published);
		builder.append(", isRetired=");
		builder.append(isRetired);
		builder.append(", country=");
		builder.append(country);
		builder.append(", serviceArea=");
		builder.append(serviceArea);
		builder.append(", category=");
		builder.append(category);
		builder.append(", growthareaCamss=");
		builder.append(growthareaCamss);
		builder.append(", competitors=");
		builder.append(competitors);
		builder.append(", year=");
		builder.append(year);
		builder.append(", homepageLinks=");
		builder.append(homepageLinks);
		builder.append(", shortName=");
		builder.append(shortName);
		builder.append(", tcv=");
		builder.append(tcv);
		builder.append(", isBox=");
		builder.append(isBox);
		builder.append(", homePageType=");
		builder.append(homePageType);
		builder.append(", homePageLink=");
		builder.append(homePageLink);
		builder.append(", serviceAreaDD=");
		builder.append(serviceAreaDD);
		builder.append(", countryDD=");
		builder.append(countryDD);
		builder.append(", categoryDD=");
		builder.append(categoryDD);
		builder.append(", proposalInsertCategoryDD=");
		builder.append(proposalInsertCategoryDD);
		builder.append(", industryDD=");
		builder.append(industryDD);
		builder.append(", typeDD=");
		builder.append(typeDD);
		builder.append(", isRetiredDD=");
		builder.append(isRetiredDD);
		builder.append(", isBoxDD=");
		builder.append(isBoxDD);
		builder.append(", dayDiff=");
		builder.append(dayDiff);
		builder.append("]");
		return builder.toString();
	}

}
