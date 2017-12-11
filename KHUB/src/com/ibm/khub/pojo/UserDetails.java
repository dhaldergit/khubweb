/**
 * 
 */
package com.ibm.khub.pojo;

import org.codehaus.jackson.annotate.JsonIgnore;

/**
 * @author ibm
 *
 */
public class UserDetails {
	
	private String notes;
	private String num;
	private String search;
	private String name;
	private String email;
	private String firstName;
	private String lastName;
	
	@JsonIgnore
	private Role roleDetails;
	
	@JsonIgnore
	private String role;
	
	
	
	
	
	/**
	 * @return the roleDetails
	 */
	public Role getRoleDetails() {
		return roleDetails;
	}
	/**
	 * @param roleDetails the roleDetails to set
	 */
	public void setRoleDetails(Role roleDetails) {
		this.roleDetails = roleDetails;
	}
	/**
	 * @return the notes
	 */
	public String getNotes() {
		return notes;
	}
	/**
	 * @param notes the notes to set
	 */
	public void setNotes(String notes) {
		this.notes = notes;
	}
	/**
	 * @return the num
	 */
	public String getNum() {
		return num;
	}
	/**
	 * @param num the num to set
	 */
	public void setNum(String num) {
		this.num = num;
	}
	/**
	 * @return the search
	 */
	public String getSearch() {
		return search;
	}
	/**
	 * @param search the search to set
	 */
	public void setSearch(String search) {
		this.search = search;
	}
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}
	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	/**
	 * @return the role
	 */
	public String getRole() {
		return role;
	}
	/**
	 * @param role the role to set
	 */
	public void setRole(String role) {
		this.role = role;
	}
	
	
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("UserDetails [notes=");
		builder.append(notes);
		builder.append(", num=");
		builder.append(num);
		builder.append(", search=");
		builder.append(search);
		builder.append(", name=");
		builder.append(name);
		builder.append(", email=");
		builder.append(email);
		builder.append(", firstName=");
		builder.append(firstName);
		builder.append(", lastName=");
		builder.append(lastName);
		builder.append(", roleDetails=");
		builder.append(roleDetails);
		builder.append(", role=");
		builder.append(role);
		builder.append("]");
		return builder.toString();
	}
	
	
	
	
}
