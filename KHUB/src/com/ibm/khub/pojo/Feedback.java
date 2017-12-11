/**
 * 
 */
package com.ibm.khub.pojo;

/**
 * @author ibm
 *
 */
public class Feedback {
	
	private String contactName;
	private String contactEmail;
	private String impressionType;
	private String problemURL;
	private String comments;
	public String getContactName() {
		return contactName;
	}
	public void setContactName(String contactName) {
		this.contactName = contactName;
	}
	public String getContactEmail() {
		return contactEmail;
	}
	public void setContactEmail(String contactEmail) {
		this.contactEmail = contactEmail;
	}
	public String getImpressionType() {
		return impressionType;
	}
	public void setImpressionType(String impressionType) {
		this.impressionType = impressionType;
	}
	public String getProblemURL() {
		return problemURL;
	}
	public void setProblemURL(String problemURL) {
		this.problemURL = problemURL;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("feedBack [contactName=");
		builder.append(contactName);
		builder.append(", contactEmail=");
		builder.append(contactEmail);
		builder.append(", impressionType=");
		builder.append(impressionType);
		builder.append(", problemURL=");
		builder.append(problemURL);
		builder.append(", comments=");
		builder.append(comments);
		builder.append("]");
		return builder.toString();
	}
	
	

}
