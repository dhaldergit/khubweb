<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.sql.*"%>
<% Class.forName("com.ibm.db2.jcc.DB2Driver"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Fetching Data From a Database</title>
</head>
<body>

	<% 
            Connection connection = DriverManager.getConnection(
            		"jdbc:db2://awh-yp-small03.services.dal.bluemix.net:50000/BLUDB","dash102657","pS3CXxOzckH4");

           Statement statement = connection.createStatement();

           /*  String id = request.getParameter("id"); */  

            ResultSet resultset = 
                statement.executeQuery("select value from Parameter where Key='visitor_count'") ; 

            if(!resultset.next()) {
                out.println(" data Error");
            }
            
            else {
        %>


	<TABLE>

		<TR style="font-family: Arial, Helvetica, sans-serif">
			<TD><label>&nbsp; You are Visitor Number :</label></TD>
			<TD><%= resultset.getInt("value") %></TD>

		</TR>
	</TABLE>
	<BR>
	<% 
           } 
       %>


	<% 
            Connection con = DriverManager.getConnection(
            		"jdbc:db2://dashdb-entry-yp-dal09-10.services.dal.bluemix.net:50000/BLUDB","dash6739","0c144e11547d");

			String query = "update DASH6739.Parameter set value = value +1 where Key ='visitor_count'";
			PreparedStatement ps = con.prepareStatement(query);

            ps.executeUpdate(); 
           
           

            
        %>



</body>
</html>