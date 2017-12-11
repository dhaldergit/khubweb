

package com.ibm.khub.pojo;

/*
 * For Table KH_CONTENT
 */
public class KhContent implements java.io.Serializable, Cloneable {
    private KhContentKey _key = new KhContentKey();

    /* KH_CONTENT_STORE_ID, PK */
    protected long khContentStoreId;

    /* LINK */
    protected String link;

    /* CONTENT_NAME */
    protected String contentName;

    /* INDUSTRY */
    protected String industry;

    /* SERVICE_AREA */
    protected String serviceArea;

    /* SERVICE_LINE */
    protected String serviceLine;

    /* TECH_TOOLS */
    protected String techTools;

    /* TYPE */
    protected String type;

    /* DATE_PUBLISHED */
    protected java.util.Date datePublished;

    /* IS_RETIRED */
    protected String isRetired;

    /* TOP */
    protected String top;

    /* EXTERNAL_LINK */
    protected String externalLink;

    /* CATEGORY */
    protected String category;

    /* GEO */
    protected String geo;

    /* GROWTHAREA_CAMSS */
    protected String growthareaCamss;

    /* COMPETITORS */
    protected String competitors;

    /* YEAR */
    protected long year;

    /* SOURCE */
    protected String source;

    /* TCV */
    protected String tcv;

    /* TAGS */
    protected String tags;

    /* SCORE */
    protected long score;

    /* COMMENTS */
    protected String comments;

    /* SERIAL_NO */
    protected long serialNo;

    /* DESCRIPTION */
    protected String description;
    
    protected String client;
    
    protected String isDeleted;

    public String getClient() {
		return client;
	}

	public void setClient(String client) {
		this.client = client;
	}

	public String getIsDeleted() {
		return isDeleted;
	}

	public void setIsDeleted(String isDeleted) {
		this.isDeleted = isDeleted;
	}

	/* Return the key object. */
    public KhContentKey getKeyObject() {
        return _key;
    }

    /* KH_CONTENT_STORE_ID, PK */
    public long getKhContentStoreId() {
        return khContentStoreId;
    }

    /* KH_CONTENT_STORE_ID, PK */
    public void setKhContentStoreId(long khContentStoreId) {
        this.khContentStoreId = khContentStoreId;
        _key.setKhContentStoreId(khContentStoreId);
    }

    /* LINK */
    public String getLink() {
        return link;
    }

    /* LINK */
    public void setLink(String link) {
        this.link = link;
    }

    /* CONTENT_NAME */
    public String getContentName() {
        return contentName;
    }

    /* CONTENT_NAME */
    public void setContentName(String contentName) {
        this.contentName = contentName;
    }

    /* INDUSTRY */
    public String getIndustry() {
        return industry;
    }

    /* INDUSTRY */
    public void setIndustry(String industry) {
        this.industry = industry;
    }

    /* SERVICE_AREA */
    public String getServiceArea() {
        return serviceArea;
    }

    /* SERVICE_AREA */
    public void setServiceArea(String serviceArea) {
        this.serviceArea = serviceArea;
    }

    /* SERVICE_LINE */
    public String getServiceLine() {
        return serviceLine;
    }

    /* SERVICE_LINE */
    public void setServiceLine(String serviceLine) {
        this.serviceLine = serviceLine;
    }

    /* TECH_TOOLS */
    public String getTechTools() {
        return techTools;
    }

    /* TECH_TOOLS */
    public void setTechTools(String techTools) {
        this.techTools = techTools;
    }

    /* TYPE */
    public String getType() {
        return type;
    }

    /* TYPE */
    public void setType(String type) {
        this.type = type;
    }

    /* DATE_PUBLISHED */
    public java.util.Date getDatePublished() {
        return datePublished;
    }

    /* DATE_PUBLISHED */
    public void setDatePublished(java.util.Date datePublished) {
        this.datePublished = datePublished;
    }

    /* IS_RETIRED */
    public String getIsRetired() {
        return isRetired;
    }

    /* IS_RETIRED */
    public void setIsRetired(String isRetired) {
        this.isRetired = isRetired;
    }

    /* TOP */
    public String getTop() {
        return top;
    }

    /* TOP */
    public void setTop(String top) {
        this.top = top;
    }

    /* EXTERNAL_LINK */
    public String getExternalLink() {
        return externalLink;
    }

    /* EXTERNAL_LINK */
    public void setExternalLink(String externalLink) {
        this.externalLink = externalLink;
    }

    /* CATEGORY */
    public String getCategory() {
        return category;
    }

    /* CATEGORY */
    public void setCategory(String category) {
        this.category = category;
    }

    /* GEO */
    public String getGeo() {
        return geo;
    }

    /* GEO */
    public void setGeo(String geo) {
        this.geo = geo;
    }

    /* GROWTHAREA_CAMSS */
    public String getGrowthareaCamss() {
        return growthareaCamss;
    }

    /* GROWTHAREA_CAMSS */
    public void setGrowthareaCamss(String growthareaCamss) {
        this.growthareaCamss = growthareaCamss;
    }

    /* COMPETITORS */
    public String getCompetitors() {
        return competitors;
    }

    /* COMPETITORS */
    public void setCompetitors(String competitors) {
        this.competitors = competitors;
    }

    /* YEAR */
    public long getYear() {
        return year;
    }

    /* YEAR */
    public void setYear(long year) {
        this.year = year;
    }

    /* SOURCE */
    public String getSource() {
        return source;
    }

    /* SOURCE */
    public void setSource(String source) {
        this.source = source;
    }

    /* TCV */
    public String getTcv() {
        return tcv;
    }

    /* TCV */
    public void setTcv(String tcv) {
        this.tcv = tcv;
    }

    /* TAGS */
    public String getTags() {
        return tags;
    }

    /* TAGS */
    public void setTags(String tags) {
        this.tags = tags;
    }

    /* SCORE */
    public long getScore() {
        return score;
    }

    /* SCORE */
    public void setScore(long score) {
        this.score = score;
    }

    /* COMMENTS */
    public String getComments() {
        return comments;
    }

    /* COMMENTS */
    public void setComments(String comments) {
        this.comments = comments;
    }

    /* SERIAL_NO */
    public long getSerialNo() {
        return serialNo;
    }

    /* SERIAL_NO */
    public void setSerialNo(long serialNo) {
        this.serialNo = serialNo;
    }

    /* DESCRIPTION */
    public String getDescription() {
        return description;
    }

    /* DESCRIPTION */
    public void setDescription(String description) {
        this.description = description;
    }

    /* Indicates whether some other object is "equal to" this one. */
    public boolean equals(Object obj) {
        if (this == obj)
            return true;

        if (obj == null || !(obj instanceof KhContent))
            return false;

        KhContent bean = (KhContent) obj;

        if (this.khContentStoreId != bean.khContentStoreId)
            return false;

        if (this.link == null) {
            if (bean.link != null)
                return false;
        }
        else if (!this.link.equals(bean.link)) 
            return false;

        if (this.contentName == null) {
            if (bean.contentName != null)
                return false;
        }
        else if (!this.contentName.equals(bean.contentName)) 
            return false;

        if (this.industry == null) {
            if (bean.industry != null)
                return false;
        }
        else if (!this.industry.equals(bean.industry)) 
            return false;

        if (this.serviceArea == null) {
            if (bean.serviceArea != null)
                return false;
        }
        else if (!this.serviceArea.equals(bean.serviceArea)) 
            return false;

        if (this.serviceLine == null) {
            if (bean.serviceLine != null)
                return false;
        }
        else if (!this.serviceLine.equals(bean.serviceLine)) 
            return false;

        if (this.techTools == null) {
            if (bean.techTools != null)
                return false;
        }
        else if (!this.techTools.equals(bean.techTools)) 
            return false;

        if (this.type == null) {
            if (bean.type != null)
                return false;
        }
        else if (!this.type.equals(bean.type)) 
            return false;

        if (this.datePublished == null) {
            if (bean.datePublished != null)
                return false;
        }
        else if (!this.datePublished.equals(bean.datePublished)) 
            return false;

        if (this.isRetired == null) {
            if (bean.isRetired != null)
                return false;
        }
        else if (!this.isRetired.equals(bean.isRetired)) 
            return false;

        if (this.top == null) {
            if (bean.top != null)
                return false;
        }
        else if (!this.top.equals(bean.top)) 
            return false;

        if (this.externalLink == null) {
            if (bean.externalLink != null)
                return false;
        }
        else if (!this.externalLink.equals(bean.externalLink)) 
            return false;

        if (this.category == null) {
            if (bean.category != null)
                return false;
        }
        else if (!this.category.equals(bean.category)) 
            return false;

        if (this.geo == null) {
            if (bean.geo != null)
                return false;
        }
        else if (!this.geo.equals(bean.geo)) 
            return false;

        if (this.growthareaCamss == null) {
            if (bean.growthareaCamss != null)
                return false;
        }
        else if (!this.growthareaCamss.equals(bean.growthareaCamss)) 
            return false;

        if (this.competitors == null) {
            if (bean.competitors != null)
                return false;
        }
        else if (!this.competitors.equals(bean.competitors)) 
            return false;

        if (this.year != bean.year)
            return false;

        if (this.source == null) {
            if (bean.source != null)
                return false;
        }
        else if (!this.source.equals(bean.source)) 
            return false;

        if (this.tcv == null) {
            if (bean.tcv != null)
                return false;
        }
        else if (!this.tcv.equals(bean.tcv)) 
            return false;

        if (this.tags == null) {
            if (bean.tags != null)
                return false;
        }
        else if (!this.tags.equals(bean.tags)) 
            return false;

        if (this.score != bean.score)
            return false;

        if (this.comments == null) {
            if (bean.comments != null)
                return false;
        }
        else if (!this.comments.equals(bean.comments)) 
            return false;

        if (this.serialNo != bean.serialNo)
            return false;

        if (this.description == null) {
            if (bean.description != null)
                return false;
        }
        else if (!this.description.equals(bean.description)) 
            return false;
        
        if (this.client == null) {
            if (bean.client != null)
                return false;
        }
        else if (!this.client.equals(bean.client)) 
            return false;
        
        if (this.isDeleted == null) {
            if (bean.isDeleted != null)
                return false;
        }
        else if (!this.isDeleted.equals(bean.isDeleted)) 
            return false;

        return true;
    }

    /* Creates and returns a copy of this object. */
    public Object clone()
    {
        KhContent bean = new KhContent();
        bean.khContentStoreId = this.khContentStoreId;
        bean.link = this.link;
        bean.contentName = this.contentName;
        bean.industry = this.industry;
        bean.serviceArea = this.serviceArea;
        bean.serviceLine = this.serviceLine;
        bean.techTools = this.techTools;
        bean.type = this.type;
        if (this.datePublished != null)
            bean.datePublished = (java.util.Date) this.datePublished.clone();
        bean.isRetired = this.isRetired;
        bean.top = this.top;
        bean.externalLink = this.externalLink;
        bean.category = this.category;
        bean.geo = this.geo;
        bean.growthareaCamss = this.growthareaCamss;
        bean.competitors = this.competitors;
        bean.year = this.year;
        bean.source = this.source;
        bean.tcv = this.tcv;
        bean.tags = this.tags;
        bean.score = this.score;
        bean.comments = this.comments;
        bean.serialNo = this.serialNo;
        bean.description = this.description;
        bean.client = this.client;
        bean.isDeleted = this.isDeleted;
        return bean;
    }

    /* Returns a string representation of the object. */
    public String toString() {
        String sep = "\r\n";
        StringBuffer sb = new StringBuffer();
        sb.append(this.getClass().getName()).append(sep);
        sb.append("[").append("khContentStoreId").append(" = ").append(khContentStoreId).append("]").append(sep);
        sb.append("[").append("link").append(" = ").append(link).append("]").append(sep);
        sb.append("[").append("contentName").append(" = ").append(contentName).append("]").append(sep);
        sb.append("[").append("industry").append(" = ").append(industry).append("]").append(sep);
        sb.append("[").append("serviceArea").append(" = ").append(serviceArea).append("]").append(sep);
        sb.append("[").append("serviceLine").append(" = ").append(serviceLine).append("]").append(sep);
        sb.append("[").append("techTools").append(" = ").append(techTools).append("]").append(sep);
        sb.append("[").append("type").append(" = ").append(type).append("]").append(sep);
        sb.append("[").append("datePublished").append(" = ").append(datePublished).append("]").append(sep);
        sb.append("[").append("isRetired").append(" = ").append(isRetired).append("]").append(sep);
        sb.append("[").append("top").append(" = ").append(top).append("]").append(sep);
        sb.append("[").append("externalLink").append(" = ").append(externalLink).append("]").append(sep);
        sb.append("[").append("category").append(" = ").append(category).append("]").append(sep);
        sb.append("[").append("geo").append(" = ").append(geo).append("]").append(sep);
        sb.append("[").append("growthareaCamss").append(" = ").append(growthareaCamss).append("]").append(sep);
        sb.append("[").append("competitors").append(" = ").append(competitors).append("]").append(sep);
        sb.append("[").append("year").append(" = ").append(year).append("]").append(sep);
        sb.append("[").append("source").append(" = ").append(source).append("]").append(sep);
        sb.append("[").append("tcv").append(" = ").append(tcv).append("]").append(sep);
        sb.append("[").append("tags").append(" = ").append(tags).append("]").append(sep);
        sb.append("[").append("score").append(" = ").append(score).append("]").append(sep);
        sb.append("[").append("comments").append(" = ").append(comments).append("]").append(sep);
        sb.append("[").append("serialNo").append(" = ").append(serialNo).append("]").append(sep);
        sb.append("[").append("description").append(" = ").append(description).append("]").append(sep);
        sb.append("[").append("client").append(" = ").append(client).append("]").append(sep);
        sb.append("[").append("isDeleted").append(" = ").append(isDeleted).append("]").append(sep);
        return sb.toString();
    }
}