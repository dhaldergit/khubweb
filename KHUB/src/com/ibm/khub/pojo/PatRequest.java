
package com.ibm.khub.pojo;

/*
 * For Table PATREQUEST
 */
/**
 * @author ibm
 *
 */
public class PatRequest implements java.io.Serializable, Cloneable {

    /* ID, PK */
    protected long id;
    
    protected String clientName;

    /* GEO */
    protected String geo;

    /* REGION */
    protected String region;

    /* OPP_NO */
    protected String oppNo;

    /* OPP_NAME */
    protected String oppName;

    /* INDUSTRY */
    protected String industry;

    /* SECTOR */
    protected String sector;

    /* OFFERING_AREA */
    protected String offeringArea;

    /* TCV */
    protected String tcv;

    /* DESC */
    protected String desc;

    /* COUNTRY */
    protected String country;

    /* SERVICE_LINE */
    protected String serviceLine;

    /* OWNER */
    protected String owner;

    /* PROPOSAL_TYPE */
    protected String proposalType;

    /* CONTRACT */
    protected String contract;

    /* INCUMBENT */
    protected String incumbent;

    /* MAIN_COMPETITOR */
    protected String mainCompetitor;

    /* OTHER_COMPETITOR */
    protected String otherCompetitor;

    /* START_DATE */
    protected String startDate;

    /* STRATEGY */
    protected String strategy;

    /* PROPOSAL_DUE_DATE */
    protected String proposalDueDate;

    /* PROPOSAL_DUE_DATE_CUSTOMER */
    protected String proposalDueDateCustomer;

    /* REQUESTER */
    protected String requester;

  
    protected String completedDate;
    protected String requestDate;
    protected String isComplete;

    
    
    
    
    
    public String getClientName() {
		return clientName;
	}

	public void setClientName(String clientName) {
		this.clientName = clientName;
	}

	public String getCompletedDate() {
		return completedDate;
	}

	public void setCompletedDate(String completedDate) {
		this.completedDate = completedDate;
	}

	public String getRequestDate() {
		return requestDate;
	}

	public void setRequestDate(String requestDate) {
		this.requestDate = requestDate;
	}

	public String getIsComplete() {
		return isComplete;
	}

	public void setIsComplete(String isComplete) {
		this.isComplete = isComplete;
	}

	/* ID, PK */
    public long getId() {
        return id;
    }

    /* ID, PK */
    public void setId(long id) {
        this.id = id;
    }

    /* REQUESTER */
    public String getRequester() {
        return requester;
    }

    /* REQUESTER */
    public void setRequester(String requester) {
        this.requester = requester;
    }

    /* GEO */
    public String getGeo() {
        return geo;
    }

    /* GEO */
    public void setGeo(String geo) {
        this.geo = geo;
    }

    /* REGION */
    public String getRegion() {
        return region;
    }

    /* REGION */
    public void setRegion(String region) {
        this.region = region;
    }

    /* OPP_NO */
    public String getOppNo() {
        return oppNo;
    }

    /* OPP_NO */
    public void setOppNo(String oppNo) {
        this.oppNo = oppNo;
    }

    /* OPP_NAME */
    public String getOppName() {
        return oppName;
    }

    /* OPP_NAME */
    public void setOppName(String oppName) {
        this.oppName = oppName;
    }

    /* INDUSTRY */
    public String getIndustry() {
        return industry;
    }

    /* INDUSTRY */
    public void setIndustry(String industry) {
        this.industry = industry;
    }

    /* SECTOR */
    public String getSector() {
        return sector;
    }

    /* SECTOR */
    public void setSector(String sector) {
        this.sector = sector;
    }

    /* OFFERING_AREA */
    public String getOfferingArea() {
        return offeringArea;
    }

    /* OFFERING_AREA */
    public void setOfferingArea(String offeringArea) {
        this.offeringArea = offeringArea;
    }

    /* TCV */
    public String getTcv() {
        return tcv;
    }

    /* TCV */
    public void setTcv(String tcv) {
        this.tcv = tcv;
    }

    /* DESC */
    public String getDesc() {
        return desc;
    }

    /* DESC */
    public void setDesc(String desc) {
        this.desc = desc;
    }

    /* COUNTRY */
    public String getCountry() {
        return country;
    }

    /* COUNTRY */
    public void setCountry(String country) {
        this.country = country;
    }

    /* SERVICE_LINE */
    public String getServiceLine() {
        return serviceLine;
    }

    /* SERVICE_LINE */
    public void setServiceLine(String serviceLine) {
        this.serviceLine = serviceLine;
    }

    /* OWNER */
    public String getOwner() {
        return owner;
    }

    /* OWNER */
    public void setOwner(String owner) {
        this.owner = owner;
    }

    /* PROPOSAL_TYPE */
    public String getProposalType() {
        return proposalType;
    }

    /* PROPOSAL_TYPE */
    public void setProposalType(String proposalType) {
        this.proposalType = proposalType;
    }

    /* CONTRACT */
    public String getContract() {
        return contract;
    }

    /* CONTRACT */
    public void setContract(String contract) {
        this.contract = contract;
    }

    /* INCUMBENT */
    public String getIncumbent() {
        return incumbent;
    }

    /* INCUMBENT */
    public void setIncumbent(String incumbent) {
        this.incumbent = incumbent;
    }

    /* MAIN_COMPETITOR */
    public String getMainCompetitor() {
        return mainCompetitor;
    }

    /* MAIN_COMPETITOR */
    public void setMainCompetitor(String mainCompetitor) {
        this.mainCompetitor = mainCompetitor;
    }

    /* OTHER_COMPETITOR */
    public String getOtherCompetitor() {
        return otherCompetitor;
    }

    /* OTHER_COMPETITOR */
    public void setOtherCompetitor(String otherCompetitor) {
        this.otherCompetitor = otherCompetitor;
    }

    /* START_DATE */
    public String getStartDate() {
        return startDate;
    }

    /* START_DATE */
    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    /* STRATEGY */
    public String getStrategy() {
        return strategy;
    }

    /* STRATEGY */
    public void setStrategy(String strategy) {
        this.strategy = strategy;
    }

    /* PROPOSAL_DUE_DATE */
    public String getProposalDueDate() {
        return proposalDueDate;
    }

    /* PROPOSAL_DUE_DATE */
    public void setProposalDueDate(String proposalDueDate) {
        this.proposalDueDate = proposalDueDate;
    }

    /* PROPOSAL_DUE_DATE_CUSTOMER */
    public String getProposalDueDateCustomer() {
        return proposalDueDateCustomer;
    }

    /* PROPOSAL_DUE_DATE_CUSTOMER */
    public void setProposalDueDateCustomer(String proposalDueDateCustomer) {
        this.proposalDueDateCustomer = proposalDueDateCustomer;
    }

    
    

    @Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("PatRequest [id=");
		builder.append(id);
		builder.append(", clientName=");
		builder.append(clientName);
		builder.append(", geo=");
		builder.append(geo);
		builder.append(", region=");
		builder.append(region);
		builder.append(", oppNo=");
		builder.append(oppNo);
		builder.append(", oppName=");
		builder.append(oppName);
		builder.append(", industry=");
		builder.append(industry);
		builder.append(", sector=");
		builder.append(sector);
		builder.append(", offeringArea=");
		builder.append(offeringArea);
		builder.append(", tcv=");
		builder.append(tcv);
		builder.append(", desc=");
		builder.append(desc);
		builder.append(", country=");
		builder.append(country);
		builder.append(", serviceLine=");
		builder.append(serviceLine);
		builder.append(", owner=");
		builder.append(owner);
		builder.append(", proposalType=");
		builder.append(proposalType);
		builder.append(", contract=");
		builder.append(contract);
		builder.append(", incumbent=");
		builder.append(incumbent);
		builder.append(", mainCompetitor=");
		builder.append(mainCompetitor);
		builder.append(", otherCompetitor=");
		builder.append(otherCompetitor);
		builder.append(", startDate=");
		builder.append(startDate);
		builder.append(", strategy=");
		builder.append(strategy);
		builder.append(", proposalDueDate=");
		builder.append(proposalDueDate);
		builder.append(", proposalDueDateCustomer=");
		builder.append(proposalDueDateCustomer);
		builder.append(", requester=");
		builder.append(requester);
		builder.append(", completedDate=");
		builder.append(completedDate);
		builder.append(", requestDate=");
		builder.append(requestDate);
		builder.append(", isComplete=");
		builder.append(isComplete);
		builder.append("]");
		return builder.toString();
	}
}