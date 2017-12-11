package com.ibm.khub.rowmappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.ibm.khub.pojo.DropDownProp;

public class CategoryRowMapper implements RowMapper<DropDownProp> {

	String prop;
	
	public CategoryRowMapper(String property){
		prop = property;
	}
	@Override
	public DropDownProp mapRow(ResultSet rs, int i) throws SQLException {
		DropDownProp dd = null;
		dd = new DropDownProp();
		dd.setId(rs.getString(prop));
		dd.setData(rs.getString(prop));
		return dd;
	}

}
