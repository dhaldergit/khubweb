package com.ibm.khub.rowmappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.ibm.khub.pojo.Role;

public class RoleRowMapper implements RowMapper<Role> {

	@Override
	public Role mapRow(ResultSet rs, int i) throws SQLException {
		Role role ;
		role = new Role();
		role.setRoleName(rs.getString("ROLE_NAME"));
		role.setRoleDesc(rs.getString("ROLE_DESCRIPTION"));
		role.setRoleId(String.valueOf(rs.getInt("ROLE_ID")));
		return role;
	}

}
