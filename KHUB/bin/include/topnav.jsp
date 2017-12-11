<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=0" />

<meta http-equiv="content-type" content="text/html;charset=utf-8" />

<title>Knowledge Hub</title>
<link rel="stylesheet" href="../css/master.css" type="text/css" media="all" />
<link rel="stylesheet" href="../css/styles.css" type="text/css" media="all" />

<link rel="stylesheet" href="../css/new-topnav.css" media="screen">


	<!-- THIS IS FOR CAROUSEL Start -->
    <link rel="stylesheet" href="../css/prism.css">
    <link rel="stylesheet" href="../css/stylesheet.css">
    <link rel="stylesheet" href="../css/carousel.css">
	<!-- THIS IS FOR CAROUSEL End -->
	
	

	<!-- THIS IS FOR JQUERY ACCORDION Start--> 
	<link rel="stylesheet" href="../css/demo.css">
	<!--THIS IS FOR JQUERY ACCORDION End -->
	
</head>
<body>
<div id="top-nav">

		<div id='cssmenu'>
			<ul id ="nav">
			   <li class='active has-sub'><a href='index.jsp'><span style="font-size: 14px; font-weight: bold; padding-right: 10px; padding-left: 10px;">Home</span></a></li>
			   <li class='has-sub'><a href='storybankmain.jsp'><span style="font-size: 14px; font-weight: bold; padding-right: 10px; padding-left: 10px;">Story Bank</span></a>
				  <ul>
					 <li class='has-sub'><a href="proposalbank.jsp"><span style="font-size: 12px; font-weight: bold;">Communications</span></a>
						<ul>
						   <li><a href='storybankmain.jsp'><span style="font-size: 12px; font-weight: bold;">E&U</span></a></li>
						   <li><a href='storybankmain.jsp'><span style="font-size: 12px; font-weight: bold;">M&E</span></a></li>
						   <li class='last'><a href='storybankmain.jsp'><span style="font-size: 12px; font-weight: bold;">Telco</span></a></li>
						</ul>
					 </li>
					 <li class='has-sub'><a href='proposalbank.jsp'><span style="font-size: 12px; font-weight: bold;" tab="distribution">Distribution</span></a>
						<ul>
						   <li><a href='storybankmain.jsp'><span style="font-size: 12px; font-weight: bold;">CPG</span></a></li>
						   <li><a href='storybankmain.jsp'><span style="font-size: 12px; font-weight: bold;">LSP</span></a></li>
						   <li><a href='storybankmain.jsp'><span style="font-size: 12px; font-weight: bold;">Retail</span></a></li>
						   <li class='last'><a href="storybankmain.jsp"><span style="font-size: 12px; font-weight: bold;">T&T</span></a></li>
						</ul>
					 </li>
					 <li class='has-sub'><a href="proposalbank.jsp"><span style="font-size: 12px; font-weight: bold;" tab="financial">Financial</span></a>
						<ul>
						   <li><a href='storybankmain.jsp'><span style="font-size: 12px; font-weight: bold;">Banking</span></a></li>
						   <li><a href='storybankmain.jsp'><span style="font-size: 12px; font-weight: bold;">Financial Services</span></a></li>
						   <li class='last'><a href='storybankmain.jsp'><span style="font-size: 12px; font-weight: bold;">Insurance</span></a></li>
						</ul>
					 </li>
					  <li class='has-sub'><a href="proposalbank.jsp"><span style="font-size: 12px; font-weight: bold;" tab="industrial">Industrial</span></a>
						<ul>
						   <li><a href='#'><span style="font-size: 12px; font-weight: bold;">Auto</span></a></li>
						   <li><a href='#'><span style="font-size: 12px; font-weight: bold;">C&P</span></a></li>
						   <li class='last'><a href='#'><span style="font-size: 12px; font-weight: bold;">Electronics</span></a></li>
						</ul>
					 </li>
					  <li class='has-sub'><a href="proposalbank.jsp"><span style="font-size: 12px; font-weight: bold;" tab="public">Public</span></a>
						<ul>
						   <li><a href="proposalbank.jsp"><span style="font-size: 12px; font-weight: bold;">Government</span></a></li>
						</ul>
					 </li>

				  </ul>
			   </li>



			   <li class='active has-sub'><a href='proposalbank.jsp'><span style="font-size: 14px; font-weight: bold; padding-right: 10px; padding-left: 10px;">Proposal Bank</span></a></li>

			   <li class='active has-sub'><a href='kmt.jsp'><span style="font-size: 14px; font-weight: bold; padding-right: 10px; padding-left: 10px;">Knowledge Management Team</span></a>
				  <ul>
					 <li class='has-sub'><a href='kh_contribute.jsp'><span style="font-size: 12px; font-weight: bold;">Contribute Intellectual Capital</span></a></li>
					 <li class='has-sub'><a href='kh_feedback.jsp'><span style="font-size: 12px; font-weight: bold;">KH Feedback</span></a></li>
					 <li class='last'><a href='service_request.jsp'><span style="font-size: 12px; font-weight: bold;">Request Intellectual Capital</span></a></li>
				  </ul>
			   </li>

				<li class='active has-sub'><a href='pat.jsp'><span style="font-size: 14px; font-weight: bold; padding-right: 10px; padding-left: 10px;">Proposal Assistance Team</span></a>
				  <ul>
					 <li class='has-sub'><a href='pat_feedback.jsp'><span style="font-size: 12px; font-weight: bold; width: 300px;">PAT Feedback</span></a></li>
					 <li class='last'><a href='pat_request.jsp'><span style="font-size: 12px; font-weight: bold; width: 300px;">Request Proposal Development</span></a></li>
				  </ul>
			   </li>


			   <li class='active has-sub'><a href='contentlist.jsp'><span style="font-size: 14px; font-weight: bold; padding-right: 10px; padding-left: 10px;">Content List</span></a></li>


			  
			   <li class='active has-sub'><a href='sitemap.jsp'><span style="font-size: 14px; font-weight: bold; padding-right: 22px; padding-left: 22px;">Sitemap</span></a></li>

			</ul>
			</div>

		</div>
	
</body>
</html>