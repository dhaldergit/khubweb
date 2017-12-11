<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.util.Set"
import="java.security.Principal"
import="javax.security.auth.Subject"
import="com.ibm.websphere.security.auth.WSSubject"
import= "com.ibm.websphere.security.cred.WSCredential"
    %>
    
    <%
response.setHeader("Pragma", "no‐cache");
response.setHeader("Cache‐control", "no‐store");
Subject s = WSSubject.getCallerSubject();
String username="unknown";
if (s != null) {
Set<Principal> principals = s.getPrincipals();
if (principals != null && principals.size() > 0) {
// in production this should be html encoded for safety
username = principals.iterator().next().getName();
username = username.substring(username.lastIndexOf("/") + 1);
}

}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h3>Hello: <%=username%></h3>
<p class='description'></p> Thanks for testing SSO in KHUB 2.0  Application</span>.
</body>
</html>