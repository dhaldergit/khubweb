/**
 * 
 */
package com.ibm.khub.rowmappers;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import org.springframework.jdbc.core.RowMapper;

import com.ibm.khub.pojo.KhContent;

/**
 * @author ibm
 *
 */
public class ContentStoreRowMapper implements RowMapper<KhContent> {

	@Override
	public KhContent mapRow(ResultSet rs, int i) throws SQLException {
		KhContent bean = new KhContent();
        bean.setKhContentStoreId(rs.getLong("KH_CONTENT_STORE_ID"));
        if (rs.getString("LINK") != null) {
			bean.setLink(rs.getString("LINK"));
		} else {
			bean.setLink("");
		}
		if (rs.getString("CONTENT_NAME") != null) {
			bean.setContentName(rs.getString("CONTENT_NAME"));
		} else {
			bean.setContentName("");
		}
		if (rs.getString("INDUSTRY") != null) {
			bean.setIndustry(rs.getString("INDUSTRY"));
		} else {
			bean.setIndustry("");
		}
		if (rs.getString("SERVICE_AREA") != null) {
			bean.setServiceArea(rs.getString("SERVICE_AREA"));
		} else {
			bean.setServiceArea("");
		}
		if (rs.getString("SERVICE_LINE") != null) {
			bean.setServiceLine(rs.getString("SERVICE_LINE"));
		} else {
			bean.setServiceLine("");
		}
		if (rs.getString("TECH_TOOLS") != null) {
			bean.setTechTools(rs.getString("TECH_TOOLS"));
		} else {
			bean.setTechTools("");
		}
		if (rs.getString("TYPE") != null) {
			bean.setType(rs.getString("TYPE"));
		} else {
			bean.setType("");
		}
		if (rs.getDate("DATE_PUBLISHED") != null) {
			bean.setDatePublished(rs.getDate("DATE_PUBLISHED"));
		} else {
			bean.setDatePublished(new Date());
		}
		if (rs.getString("IS_RETIRED") != null) {
			bean.setIsRetired(rs.getString("IS_RETIRED"));
		} else {
			bean.setIsRetired("");
		}
		if (rs.getString("TOP") != null) {
			bean.setTop(rs.getString("TOP"));
		} else {
			bean.setTop("");
		}
		if (rs.getString("EXTERNAL_LINK") != null) {
			bean.setExternalLink(rs.getString("EXTERNAL_LINK"));
		} else {
			bean.setExternalLink("");
		}
		if (rs.getString("CATEGORY") != null) {
			bean.setCategory(rs.getString("CATEGORY"));
		} else {
			bean.setCategory("");
		}
		if (rs.getString("GEO") != null) {
			bean.setGeo(rs.getString("GEO"));
		} else {
			bean.setGeo("");
		}
		if (rs.getString("GROWTHAREA_CAMSS") != null) {
			bean.setGrowthareaCamss(rs.getString("GROWTHAREA_CAMSS"));
		} else {
			bean.setGrowthareaCamss("");
		}
		if (rs.getString("COMPETITORS") != null) {
			bean.setCompetitors(rs.getString("COMPETITORS"));
		} else {
			bean.setCompetitors("");
		}
		bean.setYear(rs.getLong("YEAR"));
        if (rs.getString("SOURCE") != null) {
			bean.setSource(rs.getString("SOURCE"));
		} else {
			bean.setSource("");
		}
		if (rs.getString("TCV") != null) {
			bean.setTcv(rs.getString("TCV"));
		} else {
			bean.setTcv("");
		}
		if (rs.getString("TAGS") != null) {
			bean.setTags(rs.getString("TAGS"));
		} else {
			bean.setTags("");
		}
		bean.setScore(rs.getLong("SCORE"));
        if (rs.getString("COMMENTS") != null) {
			bean.setComments(rs.getString("COMMENTS"));
		} else {
			bean.setComments("");
		}
        if (rs.getLong("SERIAL_NO") != 0l) {
			bean.setSerialNo(rs.getLong("SERIAL_NO"));
		} else {
			bean.setSerialNo(0l);
		}
        if (rs.getString("DESCRIPTION") != null) {
			bean.setDescription(rs.getString("DESCRIPTION"));
		} else {
			bean.setDescription("");
		}
		return bean;
	}

}
