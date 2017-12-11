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
						  <th>Oppnumber</th>
						  <th>Geo</th>
						  <th>Region</th>
						  <th>Country</th>
						  <th>Sector</th>
						  <th>Industry</th>
						  <th>Client Name</th>
						   <th>OppName</th>
						  <th>comment</th>
						  <th>ServiceLine</th>
						  <th>Offering</th>
						  <th>GBS</th>
						  <th>Oppowner</th>
						  <th>RequestDate</th>
						  <th>Requester</th>
						  <th>Proposaltype</th>
						  <th>Contract</th>
						  <th>Incumbent</th>
						  <th>MainCompetitor</th>
						  <th>OtherCompetitor</th>
						  <th>StartDate</th>
						  <th>StrategySummary</th>
						   <th>ProposalDuedateforproposal</th>
						  <th>ProposalDuedateforcust</th>
						  <th>AdditionalComment</th>
												</tr>

<tr>
<td><%= request.getAttribute("oppNumber") %></td>
<td><%= request.getAttribute("geo") %></td>
<td><%= request.getAttribute("reg") %></td>
<td><%= request.getAttribute("cntry") %></td>
<td><%= request.getAttribute("sctr") %></td>
<td><%= request.getAttribute("inds") %></td>
<td><%= request.getAttribute("clntnm") %></td>
<td><%= request.getAttribute("oppname") %></td>
<td><%= request.getAttribute("comment") %></td>
<td><%= request.getAttribute("psl") %></td>
<td><%= request.getAttribute("ofa") %></td>
<td><%= request.getAttribute("gbs") %></td>
<td><%= request.getAttribute("oppown") %></td>
<td><%= request.getAttribute("reqdate") %></td>
<td><%= request.getAttribute("requester") %></td>
<td><%= request.getAttribute("proposal") %></td>
<td><%= request.getAttribute("contract") %></td>
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