package com.ibm.khub.pojo;

public class ReportPOJO {
	
	private String hitCount;
	private String difference;
	
	public ReportPOJO () {
		
	}
	
	
	public ReportPOJO(String hitCount, String difference) {
		super();
		this.hitCount = hitCount;
		this.difference = difference;
	}


	public String getHitCount() {
		return hitCount;
	}
	public void setHitCount(String hitCount) {
		this.hitCount = hitCount;
	}
	public String getDifference() {
		return difference;
	}
	public void setDifference(String difference) {
		this.difference = difference;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ReportPOJO [hitCount=");
		builder.append(hitCount);
		builder.append(", difference=");
		builder.append(difference);
		builder.append("]");
		return builder.toString();
	}
	
	

}
