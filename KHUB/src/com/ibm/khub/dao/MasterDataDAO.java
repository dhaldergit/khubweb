package com.ibm.khub.dao;

public class MasterDataDAO {
	
	public static final String SELECT_GEO = "select distinct GEO from KH_CONTENT where IS_DELETED = 'N'";
	
	public static final String SELECT_INDUSTRY = "select distinct INDUSTRY from KH_CONTENT where IS_DELETED = 'N'";
	
	public static final String SELECT_SERVICE_LINE = "select distinct SERVICE_LINE from KH_CONTENT where IS_DELETED = 'N'";
	
	public static final String SELECT_GROWTHAREA_CAMSS = "select distinct GROWTHAREA_CAMSS from KH_CONTENT where IS_DELETED = 'N'";
	
	public static final String SELECT_COMPETITORS = "select distinct COMPETITORS from KH_CONTENT where IS_DELETED = 'N'";
	
	
	
	
	
}

