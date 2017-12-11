package com.ibm.khub.rowmappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.ibm.khub.pojo.Metrics;

public class MetricsRowMappers implements RowMapper<Metrics> {

	@Override
	public Metrics mapRow(ResultSet rs, int i) throws SQLException {
		
		Metrics metrics = new Metrics();
		
		metrics.setHits(String.valueOf(rs.getInt("HITS")));
		metrics.setPageName(rs.getString("PAGE_NAME"));
		metrics.setMonth(rs.getString("MONTH"));
		metrics.setYear(rs.getString("YEAR"));
		
		return metrics;
	}

}
