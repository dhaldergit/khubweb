package com.ibm.khub.dao;

import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;

import com.ibm.khub.pojo.Role;
import com.ibm.khub.rowmappers.RoleRowMapper;
import com.ibm.khub.util.DatabaseConnectionUtil;

public class AuthDAO {

	public Role retrieveUserRole(String email) {

		String query = "SELECT r.role_id, r.role_name, r.role_description, u.email FROM role r, USERS u   WHERE u.ROLE_ID = r.ROLE_ID AND u.email = '"
				+ email + "'";

		JdbcTemplate jdbcTemplate = DatabaseConnectionUtil.getDB2JdbcTemplate();

		List<Role> roleList = jdbcTemplate.query(query, new RoleRowMapper());
		if (roleList.size() > 0) {
			return roleList.get(0);
		} else {
			return null;
		}

	}

}
