<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=0" />
<meta http-equiv="Content-Type" content="text/html;charset=windows-1252">

<meta http-equiv="content-type" content="text/html;charset=utf-8" />

<title>Thank You</title>

<link rel="stylesheet" href="css/master1.css" type="text/css" media="all" />
 <link rel="stylesheet" href="css/style1.css" type="text/css" media="all" /> 
<link rel="stylesheet" href="css/new-topnav.css" media="screen">
<style>
.data-sheet{
width: 1100px;
overflow-x:auto;
}
table.data1 {
    border-collapse: collapse;
    width: 100%;
}

table.data1 th {
    text-align: left;
    padding: 8px;
	background-color: #a6d26d;
	color: #ffffff;
	font-size: 14px; 
	font-weight: bold;
}
table.data1 td {
    text-align: left;
    padding: 22px;	
}

table.data1 tr:nth-child(even){background-color: #f0fbe5;}
</style>
</head>
<body>

<!-- WRAPPER START -->
<div id="wrapper">
	<!-- Container Start -->
	<div class="container">
		<!-- Header file headers is included here  -->
			<%@ include file="include/headers.jsp" %>
		<!-- Header End -->
		
		<div class="clear"></div>
		
		<!-- top-nav strts here & jsp file topnav is included  -->
		
			<%@ include file="include/topnav.jsp" %>
		<div class="clear"></div>

		<!-- Main data -->
		<div id="main">
			<div class="mid-data-container">
				<!-- top heading start -->
				<div class="pat-head">
					<h1>GBS Knowledge Hub</h1>
				</div>
				<!-- top heading end -->

				<div class="clear"></div>

				<!-- Breadcrumb Start 
					<div id="breadcrumb-holder">
						<a href='index.html'>Home</a> > Knowledge Management Team
					</div>
				<!-- Breadcrumb End -->

				<!-- Mid Nav Start -->
				<div class="data-holder">
					<div class="thanks-section">
						You have successfully submitted your form !
					</div>
					
					<div class="clear"></div>
					
					<!--data table start -->
					<div class="data-sheet">
  							<table class="data1">
							   
						<tr>
						  <th>Name</th>
						  <th>Notes</th>
						  <th>Content satisfied</th>
						  <th>Satisfied remarks</th>
						  <th>Content rating</th>
						  <th>remarks</th>
						  <th>Navigation</th>
						   <th>Nav remarks</th>
						  <th>look&Feel</th>
						  <th>Remarks</th>
						  <th>Recommendation to improve</th>
						  <th>User Feedback</th>
						  <th>Icap Feedback on submit</th>
						  <th>KH Visit</th>
						  <th>Remarks</th>
						  <th>Feedback Liked</th>
						  <th>Fedback Dislike</th>
						  
												</tr>

<tr>
<td><%= request.getAttribute("name") %></td>
<td><%= request.getAttribute("notes") %></td>
<td><%= request.getAttribute("satisfaction") %></td>
<td><%= request.getAttribute("satlevel") %></td>
<td><%= request.getAttribute("content") %></td>
<td><%= request.getAttribute("contrate") %></td>
<td><%= request.getAttribute("navigation") %></td>
<td><%= request.getAttribute("navrate") %></td>
<td><%= request.getAttribute("look") %></td>
<td><%= request.getAttribute("lookrate") %></td>
<td><%= request.getAttribute("imprecom") %></td>
<td><%= request.getAttribute("user") %></td>
<td><%= request.getAttribute("icapsubmit") %></td>
<td><%= request.getAttribute("khvisit") %></td>
<td><%= request.getAttribute("visitrem") %></td>
<td><%= request.getAttribute("spfed") %></td>
<td><%= request.getAttribute("smfed") %></td>
<td><%= request.getAttribute("incumb") %></td>
<td><%= request.getAttribute("mcomp") %></td>
<td><%= request.getAttribute("ocomp") %></td>
<td><%= request.getAttribute("sdate") %></td>
<td><%= request.getAttribute("summary") %></td>
<td><%= request.getAttribute("proDue") %></td>
<td><%= request.getAttribute("proCus") %></td>
<td><%= request.getAttribute("addCom") %></td>

</tr>
   </table>
</div>


				</div>
				<!-- Mid Nav End -->

				<!-- Multi sections Start
				<div id="multi-sections">
					data
				</div>
				<!-- Multi sections End -->
			</div>

		</div>

		<div class="clear"></div>

		<!-- Footer Bottom -->
        <%@ include file="include/footer.jsp" %>
		<!-- Footer Bottom End -->

	</div>
	<!-- Container End -->
</div>
<!-- WRAPPER END -->






</body>
</html>