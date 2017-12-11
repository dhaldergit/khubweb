package com.ibm.khub.service;

import com.ibm.khub.dao.AuthDAO;
import com.ibm.khub.pojo.Role;

public class AuthService {

	
	public Role retrieveUserRole(String email) {
		return new AuthDAO().retrieveUserRole(email);
	}
}
