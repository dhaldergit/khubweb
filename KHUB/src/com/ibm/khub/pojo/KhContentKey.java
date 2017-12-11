

package com.ibm.khub.pojo;

public class KhContentKey implements java.io.Serializable, Cloneable {
    /* KH_CONTENT_STORE_ID */
    protected long khContentStoreId;

    /* KH_CONTENT_STORE_ID */
    public long getKhContentStoreId() {
        return khContentStoreId;
    }

    /* KH_CONTENT_STORE_ID */
    public void setKhContentStoreId(long khContentStoreId) {
        this.khContentStoreId = khContentStoreId;
    }

    /* Calculate hash code */
    public int hashCode() {
        int hashCode = 0;
        hashCode += new Long(khContentStoreId).hashCode();
        return hashCode;
    }
    
    /* Indicates whether some other object is "equal to" this one. */
    public boolean equals(Object obj) {
        if (this == obj)
            return true;

        if (obj == null || !(obj instanceof KhContentKey))
            return false;

        KhContentKey key = (KhContentKey) obj;

        if (this.khContentStoreId != key.khContentStoreId)
            return false;

        return true;
    }

    /* Creates and returns a copy of this object. */
    public Object clone()
    {
        KhContentKey key = new KhContentKey();
        key.khContentStoreId = this.khContentStoreId;
        return key;
    }

    /* Returns a string representation of the object. */
    public String toString() {
        String sep = "\r\n";
        StringBuffer sb = new StringBuffer();
        sb.append(this.getClass().getName()).append(sep);
        sb.append("[").append("khContentStoreId").append(" = ").append(khContentStoreId).append("]");
        return sb.toString();
    }
}