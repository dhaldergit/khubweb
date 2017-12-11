package com.ibm.khub.pojo;

public class Metrics {

	private String hits;
	private String pageName;
	private String month;
	private String year;
	private String diff;

	public String getHits() {
		return hits;
	}

	public void setHits(String hits) {
		this.hits = hits;
	}

	public String getPageName() {
		return pageName;
	}

	public void setPageName(String pageName) {
		this.pageName = pageName;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	
	public String getDiff() {
		return diff;
	}

	public void setDiff(String diff) {
		this.diff = diff;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Metrics [hits=");
		builder.append(hits);
		builder.append(", pageName=");
		builder.append(pageName);
		builder.append(", month=");
		builder.append(month);
		builder.append(", year=");
		builder.append(year);
		builder.append(", diff=");
		builder.append(diff);
		builder.append("]");
		return builder.toString();
	}

}
