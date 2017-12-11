<%@page import="java.util.Map"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Iterator"%>
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
Set<Object> pubCreds = s.getPublicCredentials();
Set<Object> privCreds = s.getPrivateCredentials();
Iterator<Principal> itr = principals.iterator();
while(itr.hasNext()) {
	out.println("new principle:: "+itr.next().getName());
	%>
	<br><br>
	<% 
}

Iterator<Object> itr1 = pubCreds.iterator();
while(itr1.hasNext()) {
	out.println("new pubCred:: "+itr1.next().toString());
	%>
	<br><br>
	<% 
}


Iterator<Object> itr2 = privCreds.iterator();
int c=0;
while(itr2.hasNext()) {
	//JSONObject json = (JSONObject)(new JSONParser().parse(itr2.next().toString()));
	
	//Map<String, String> credMap =(Map<String, String>) itr2.next();
	out.println("new privCred:: "+itr2.next().toString());
	/* if(c == 0) {
		out.println(" firstName:"+ credMap.get("firstName"));
		out.println(" lastName:"+ credMap.get("lastName"));
	} */
	%>
	<br><br>
	<% 
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
<p class='description'></p> Thanks for trying SAML enterprise SSO demo with Liberty for
Java Application</span>.
</body>
</html>