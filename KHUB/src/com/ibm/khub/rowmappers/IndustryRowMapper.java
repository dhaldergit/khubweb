package com.ibm.khub.rowmappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.ibm.khub.pojo.DropDownProp;

public class IndustryRowMapper implements RowMapper<DropDownProp> {

	@Override
	public DropDownProp mapRow(ResultSet rs, int i) throws SQLException {
		DropDownProp dd = null;
		dd = new DropDownProp();
		dd.setId(String.valueOf(rs.getString("INDUSTRY_ID")));
		dd.setData(rs.getString("INDUSTRY_NAME"));
		return dd;
	}

}
