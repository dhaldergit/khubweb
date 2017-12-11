package com.ibm.khub.rowmappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.ibm.khub.pojo.DropDownProp;

public class ServiceAreaRowMapper implements RowMapper<DropDownProp> {

	@Override
	public DropDownProp mapRow(ResultSet rs, int i) throws SQLException {
		DropDownProp dd = null;
		dd = new DropDownProp();
		dd.setId(String.valueOf(rs.getString("SERVICE_LINE_ID")));
		dd.setData(rs.getString("SERVICE_LINE_NAME"));
		return dd;
	}
}
