package com.ibm.khub.util;

import java.lang.reflect.Field;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.poi.ss.usermodel.DateUtil;
import org.codehaus.jackson.annotate.JsonIgnore;

import com.ibm.khub.pojo.DropDownProp;
import com.ibm.khub.pojo.ProposalDTO;

public class ProposalUtil {

	public static String createDropDownHTML(List<DropDownProp> contentList, String selectedValue, Boolean includeDef, String selectAllStr) {
		StringBuffer html = new StringBuffer();
		boolean selected = false;

		if (contentList == null || selectedValue == null) {
			return "";
		}

		if (includeDef) {
			html.append("<option value=").append("").append(">Please Select</option>\n");
		}else if (StringUtils.isNotBlank(selectAllStr)) {
			html.append("<option value=").append("").append(">").append(selectAllStr).append("</option>\n");
		}
		for (DropDownProp dd : contentList) {
			String key = dd.getId();
			String value = dd.getData();
if(StringUtils.isBlank(value)) {
	continue;
}
			try {
				if (key.equals(selectedValue)) {
					selected = true;
				} else {
					selected = false;
				}

				html.append("<option value='");
				html.append(key);
				html.append("'");
				html.append((selected ? " selected>" : ">"));
				html.append(value);
				html.append("</option>\n");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				// e.printStackTrace();
			}

		}
		return html.toString();
	}

	public static void loadContent(HttpServletRequest req, Object obj) {
		Set<String> names = new HashSet<String>();
		@SuppressWarnings("unchecked")
		Enumeration<String> enm = req.getParameterNames();
		while (enm.hasMoreElements()) {
			names.add(enm.nextElement());
		}
		Class clazz = obj.getClass();
		while (clazz != Object.class && !names.isEmpty()) {
			for (Field field : clazz.getDeclaredFields()) {
				String name = field.getName();
				if (names.contains(name)) {
					try {
						names.remove(name);
						field.setAccessible(true);
						String val = req.getParameter(name);
						field.set(obj, val);
					} catch (Exception ex) {
						ex.printStackTrace();
					}
				}
			}
			clazz = clazz.getSuperclass();
		}
	}

	public static Date getSqlDateFromXlsDate(String date) {
		java.util.Date utilDate = DateUtil.getJavaDate(Double.parseDouble(date));
		java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
		return sqlDate;
	}

	public static Date getSqlDateFromString(String date) {
		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date utilDate = null;
		try {
			utilDate = formatter.parse(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
		return sqlDate;
	}

	public static String createCheckBoxHTML(List<DropDownProp> contentList, List<String> selectedValues,
			Boolean selectAll, String elementName, Boolean isAddAll) {
		StringBuffer html = new StringBuffer();
		boolean selected = false;

		if (contentList == null) {
			return "";
		}
		if (isAddAll != null && isAddAll) {
			html.append("<div class='checkbox'>");
			html.append("<label>");
			html.append("<input type='checkbox' ").append("id = 'selectAll_").append(elementName)
					.append("' class='checkAll' value='");
			html.append(elementName);
			html.append("'");

			html.append("  name='selectAll_");
			html.append(elementName);
			html.append("'");
			if (selectAll) {
				html.append(" checked='checked'>");
			} else {
				html.append("  >");

			}
			html.append("<span> ");
			html.append("ALL");
			html.append(" </span>");
			html.append("<label>");
			html.append("</div>");
		}

		for (DropDownProp dd : contentList) {
			String key = dd.getId();
			String value = dd.getData();
			if (StringUtils.isBlank(value)) {
				continue;
			}
			try {
				if ((selectedValues != null) && (selectedValues.contains(value))) {
					selected = true;
				} else {
					selected = false;
				}
				html.append("<div class='checkbox'>");
				html.append("<label>");
				html.append("<input type='checkbox' class='checkBoxVdte' value='");
				html.append(key);
				html.append("'");

				html.append("  name='");
				html.append(elementName);
				html.append("'");
				if (selectAll) {
					html.append(" checked='checked'>");
				} else {
					html.append((selected ? " checked='checked'>" : "  >"));

				}
				html.append("<span> ");
				html.append(value);
				html.append(" </span>");
				html.append("<label>");
				html.append("</div>");

			} catch (Exception e) {
				// TODO Auto-generated catch block
				// e.printStackTrace();
			}

		}
		return html.toString();
	}

	public static void main(String args[]) {

		List<DropDownProp> ddList = new ArrayList<DropDownProp>();

		DropDownProp dd = new DropDownProp();
		dd.setId("abc");
		dd.setData("abc");
		ddList.add(dd);

		dd = new DropDownProp();
		dd.setId("xyz");
		dd.setData("xyz");
		ddList.add(dd);

		dd = new DropDownProp();
		dd.setId("def");
		dd.setData("def");
		ddList.add(dd);

		dd = new DropDownProp();
		dd.setId("pqr");
		dd.setData("pqr");
		ddList.add(dd);

		List<String> selList = new ArrayList<String>() {
			{
				add("abc");
				add("def");
			}
		};

		System.out.println(createCheckBoxHTML(ddList, null, false, "testChBox", true));

	}

	/**
	 * @param params
	 * @return
	 */
	public static String createQueryString(List<String> params) {
		StringBuilder qStringBuilder = new StringBuilder();

		qStringBuilder.append("  (");

		for (int i = 0; i < params.size(); i++) {
			if (i == 0) {
				qStringBuilder.append("'").append(params.get(i).toUpperCase()).append("'");
			} else {
				qStringBuilder.append(",").append("'").append(params.get(i).toUpperCase()).append("'");
			}
		}
		qStringBuilder.append(")  ");
		return qStringBuilder.toString();
	}

	
	public static Date getSqlDateFromStringFormatII(String strDate) {
		DateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
		java.util.Date utilDate = null;
		try {
			utilDate = formatter.parse(strDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
		return sqlDate;
	}
}
