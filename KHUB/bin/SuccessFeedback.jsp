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
					<div class="success-data">
					<p>Please find below the list of data</p>
						<table class="success-data">
	<tr>
		<th>LotusID</th>
		<th>Name</th>
			</tr>
	
	<c:forEach items="${lst}" var="last" varStatus="counter">
<tr>
 <td>${last.LotusID} </td>  
<td> ${last.Name}</td>  
    
    </tr>
<!-- </c:forEach> -->
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