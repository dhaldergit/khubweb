<%@page import="com.ibm.khub.pojo.UserDetails"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=0" />
<meta http-equiv="Content-Type" content="text/html;charset=windows-1252">

<meta http-equiv="content-type" content="text/html;charset=utf-8" />


<title>Knowledge Hub</title>
<link rel="stylesheet" href="css/master.css" type="text/css"
	media="all" />
<link rel="stylesheet" href="css/styles.css" type="text/css"
	media="all" />

<link rel="stylesheet" href="../css/new-topnav.css" media="screen">
<link rel="stylesheet" href="/css/Jquery_modal_ui.css" media="screen">
<!-- THIS IS FOR CAROUSEL Start -->
<link rel="stylesheet" href="css/prism.css">
<link rel="stylesheet" href="css/stylesheet.css">
<link rel="stylesheet" href="css/carousel.css">
<!-- THIS IS FOR CAROUSEL End -->

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
	
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js"
	type="text/javascript"></script>


<!-- THIS IS FOR JQUERY ACCORDION Start-->
<link rel="stylesheet" href="../css/demo.css">
<!--THIS IS FOR JQUERY ACCORDION End -->
  


<script type="text/javascript">
	document.documentElement.className = "js";
</script>
<script src="vendor/jquery-1.9.1.js" type="text/javascript"></script>
<script src="vendor/json2.js" type="text/javascript"></script>
<script src="src/jquery.collapse.js" type="text/javascript"></script>
<script src="src/jquery.collapse_storage.js" type="text/javascript"></script>
<script src="src/jquery.collapse_cookie_storage.js"
	type="text/javascript"></script>
<!-- THIS IS FOR JQUERY ACCORDION script end-->

<!-- THIS IS FOR CAROUSEL script start -->



<script type="text/javascript" src="js/prism.js"></script>
<script type="text/javascript" src="js/simplycarousel.js"></script>
<script type="text/javascript" src="js/script2.js"></script>


<!-- THIS IS FOR JQUERY ACCORDION Start-->
<link rel="stylesheet" href="css/demo.css">
<!--THIS IS FOR JQUERY ACCORDION End -->

<script src="js/navigation.js" type="text/javascript"></script>
<script type="text/javascript">
	/* 	$(document).ready(function() {
	 var $li = $('#cssmenu li').click(function(e) {
	
	 $li.removeClass('selected');
	 $(this).addClass('selected');
	 e.preventDefault();
	 });
	 }); */
</script>

</head>
<head></head>
<body>
<div id="fixed">
	<div id="header">
		<!-- shell -->
		<div class="shell">
			<div class="header-inner">
				<div
					style="float: left; width: 300px; height: 130px; text-align: center">
					<img width="130px;" height="130px;" src="images/khub_logo.png"
						alt="">
				</div>
				<div style="display: inline-block; height: 130px; width: 300px;">
					<span
						style="display: inline-block; margin-top: 10px; color: #022257; font-size: 60px; font-family: Impact, Charcoal, sans-serif;">GBS</span><br>
					<span style="color: #022257; font-size: 32px;">Knowledge Hub</span>
				</div>
				<div style="float: right; width: 473px; height: 130px">
					<img width="473px;" height="130px;" src="images/khub_graphic2.png"
						alt="">
				</div>
			</div>
		</div>
		<!-- shell end -->
	</div>

	<div class="clear"></div>
<%-- 	<div id="user">
	
		    <%
		UserDetails userdtl = (UserDetails)session.getAttribute("userDetailsObj");
         String role  = userdtl.getRole();%>    
		<div
			style="background-color: #88a7db; padding-right: 0px; color: #093377; text-align: right; font-style: italic; font-size: 20px">
			Hello&nbsp;
			    <% 
           if(StringUtils.isNotBlank(userdtl.getFirstName())) {
        	 out.println(userdtl.getFirstName());
         } else {
        	 out.println(userdtl.getEmail());
         }
         %>      
		</div>
	</div> --%>

<%-- 	<%
		String role = "USER";
		if (role.equalsIgnoreCase("ADMIN") || role.equalsIgnoreCase("WINLAB")) {
	%> --%>
	<div id="admin">
		<div id="top-nav">

			<div id='cssmenu'>
				<ul class='active has-sub'>

					<li class='active'><a href='index.jsp'><span
							style="font-size: 16px; font-weight:; padding-right: 17px; padding-left: 17px;">Home</span></a></li>




					<li class='active has-sub '><a href='proposalbank.jsp'><span
							style="font-size: 16px; font-weight:; padding-right: 17px; padding-left: 17px;">Proposal
								Bank</span></a>
						<ul>
							<li class='has-sub'><a href='/proposalbank.jsp?serviceLine=Application Innovation Consulting'>Application Innovation Consulting</a></li>
							<li class='has-sub'><a href='/proposalbank.jsp?serviceLine=Business Process Services'>Business	Process Services</a></li>
							<li class='has-sub'><a href='/proposalbank.jsp?serviceLine=Cognitive & Analytics'>Cognitive &amp; Analytics</a></li>
							<li class='has-sub'><a href='/proposalbank.jsp?serviceLine=Customer Platforms'>Customer Platforms</a></li>
							<li class='has-sub'><a href='/proposalbank.jsp?serviceLine=Digital Operations & Internet of Things'>Digital Operations &amp; IoT>Digital Operations &amp; IoT</a></li>
							<li class='has-sub'><a href='/proposalbank.jsp?serviceLine=Mobile'>Mobile</a></li>
							<li class='has-sub'><a href='/proposalbank.jsp?serviceLine=Strategy & Design'>Strategy &amp; Design</a></li>
							<li class='has-sub'><a href='/proposalbank.jsp?serviceLine=EA - Microsoft'>EA - Microsoft</a></li>
							<li class='has-sub'><a href='/proposalbank.jsp?serviceLine=EA - Oracle'>EA - Oracle</a></li>
							<li class='has-sub'><a href='/proposalbank.jsp?serviceLine=EA - SAP'>EA - SAP</a></li>
							<li class='has-sub'><a href='/proposalbank.jsp?serviceLine=Cross SL'>Cross SL</a></li>
						</ul></li>


					<li class='active has-sub'><a href="proposalinserts.jsp"><span
							style="font-size: 16px; font-weight:; padding-right: 17px; padding-left: 17px;">Proposal
								Inserts</span></a>
						<ul>
							<li class='has-sub'><a href='/proposalinserts.jsp?serviceLine=Application Innovation Consulting'>Application Innovation Consulting</a></li>
							 <li class='has-sub'><a href='/proposalinserts.jsp?serviceLine=Business Process Services'>Business Process Services</a></li> 
							 <li class='has-sub'><a href='/proposalinserts.jsp?serviceLine=Cognitive & Analytics'>Cognitive &amp; Analytics</a></li>
							<li class='has-sub'><a href='/proposalinserts.jsp?serviceLine=Customer Platforms'>Customer Platforms</a></li> 
							<li class='has-sub'><a href='/proposalinserts.jsp?serviceLine=Digital Operations & Internet of Things'>Digital Operations &amp; IoT</a></li> 
							<li class='has-sub'><a href='/proposalinserts.jsp?serviceLine=Mobile'>Mobile</a></li>
							<li class='has-sub'><a href='/proposalinserts.jsp?serviceLine=Strategy & Design'>Strategy &amp; Design</a></li>
							<li class='has-sub'><a href='/proposalinserts.jsp?serviceLine=EA - Microsoft'>EA - Microsoft</a></li>
							<li class='has-sub'><a href='/proposalinserts.jsp?serviceLine=EA - Oracle'>EA - Oracle</a></li>
							<li class='has-sub'><a href='/proposalinserts.jsp?serviceLine=EA - SAP'>EA - SAP</a></li>
							<li class='has-sub'><a href='/proposalinserts.jsp?serviceLine=Cross SL'>Cross SL</a></li>
						</ul></li>
					<li class='active has-sub'><a href='capabilities.jsp'><span
							style="font-size: 16px; font-weight:; padding-right: 17px; padding-left: 17px;">Capabilities</span></a>
						<ul>
							 <li class='has-sub'><a href='/capabilities.jsp?serviceLine=Application Innovation Consulting'>Application Innovation Consulting</a></li>
							<li class='has-sub'><a href='/capabilities.jsp?serviceLine=Business Process Services'>Business Process Services</a></li>
							<li class='has-sub'><a href='/capabilities.jsp?serviceLine=Cognitive & Analytics'>Cognitive &amp; Analytics</a></li>
							<li class='has-sub'><a href='/capabilities.jsp?serviceLine=Customer Platforms'>Customer Platforms</a></li>
							 <li class='has-sub'><a href='/capabilities.jsp?serviceLine=Digital Operations & Internet of Things'>Digital Operations &amp; IoT</a></li>
							 <li class='has-sub'><a href='/capabilities.jsp?serviceLine=Mobile'>Mobile</a></li>
							 <li class='has-sub'><a href='/capabilities.jsp?serviceLine=Strategy & Design'>Strategy &amp; Design</a></li>
							 <li class='has-sub'><a href='/capabilities.jsp?serviceLine=EA - Microsoft'>EA - Microsoft</a></li>
							 <li class='has-sub'><a href='/capabilities.jsp?serviceLine=EA - Oracle'>EA - Oracle</a></li>
							<li class='has-sub'><a href='/capabilities.jsp?serviceLine=EA - SAP'>EA - SAP</a></li>
							 <li class='has-sub'><a href='/capabilities.jsp?serviceLine=Cross SL'>Cross SL</a></li>
						</ul></li>
					<li class='active has-sub'><a href="clientsCorner.jsp"><span
							style="font-size: 16px; font-weight:; padding-right: 17px; padding-left: 17px;">Clients
								Corner</span></a>
						<ul>
							<li class='has-sub'><a href='/clientsCorner.jsp?serviceLine=Application Innovation Consulting'>Application Innovation Consulting</a></li>
							<li class='has-sub'><a href='/clientsCorner.jsp?serviceLine=Business Process Services'>Business Process Services</a></li>
							<li class='has-sub'><a href='/clientsCorner.jsp?serviceLine=Cognitive & Analytics'>Cognitive &amp; Analytics</a></li>
							<li class='has-sub'><a href='/clientsCorner.jsp?serviceLine=Customer Platforms'>Customer Platforms</a></li>
							 <li class='has-sub'><a href='/clientsCorner.jsp?serviceLine=Digital Operations & Internet of Things'>Digital Operations &amp; IoT</a></li>
							 <li class='has-sub'><a href='/clientsCorner.jsp?serviceLine=Mobile'>Mobile</a></li>
							 <li class='has-sub'><a href='/clientsCorner.jsp?serviceLine=Strategy & Design'>Strategy &amp; Design</a></li>
							<li class='has-sub'><a href='/clientsCorner.jsp?serviceLine=EA - Microsoft'>EA - Microsoft</a></li>
							<li class='has-sub'><a href='/clientsCorner.jsp?serviceLine=EA - Oracle'>EA - Oracle</a></li>
							<li class='has-sub'><a href='/clientsCorner.jsp?serviceLine=EA - SAP'>EA - SAP</a></li>
							  <li class='last'><a href='/clientsCorner.jsp?serviceLine=Cross SL'>Cross SL</a></li>
						</ul></li>
					<li class='active has-sub'><a href="competitorinsight.jsp"><span
							style="font-size: 16px; font-weight:; padding-right: 17px; padding-left: 17px;">Competitor
								Insights</span></a>
						<ul>
							<li class='has-sub'><a href='/competitorinsight.jsp?competitor=Accenture'>Accenture</a></li>
							<li class='has-sub'><a href='/competitorinsight.jsp?competitor=Amazon'>Amazon</a></li>
							<li class='has-sub'><a href='/competitorinsight.jsp?competitor=Cisco'>Cisco</a></li>
							 <li class='has-sub'><a href='/competitorinsight.jsp?competitor=Cognizant'>Cognizant</a></li>
							  <li class='has-sub'><a href='/competitorinsight.jsp?competitor=EMC'>EMC</a></li>
							<li class='has-sub'><a href='/competitorinsight.jsp?competitor=Google'>Google</a></li>
							<li class='has-sub'><a href='/competitorinsight.jsp?competitor=HCL'>HCL</a></li>
							 <li class='has-sub'><a href='/competitorinsight.jsp?competitor=Hewlett-Packard'>Hewlett-Packard</a></li>
							<li class='has-sub'><a href='/competitorinsight.jsp?competitor=Infosys'>Infosys</a></li>
							 <li class='has-sub'><a href='/competitorinsight.jsp?competitor=Microsoft'>Microsoft</a></li>
							 <li class='has-sub'><a href='/competitorinsight.jsp?competitor=Oracle'>Oracle</a></li>
							 <li class='has-sub'><a href='/competitorinsight.jsp?competitor=TCS'>TCS</a></li>
							
						</ul></li>
					<li class='active has-sub'><a href="marketinsight.jsp"><span
							style="font-size: 16px; font-weight:; padding-right: 17px; padding-left: 17px;">Market
								Insights</span></a>
						<ul>
							 <li class='has-sub'><a href='/marketinsight.jsp?industryList=Aerospace and Defense'>Aerospace and Defense</a></li>
							 <li class='has-sub'><a href='/marketinsight.jsp?industryList=Automotive'>Automotive</a></li>
							 <li class='has-sub'><a href='/marketinsight.jsp?industryList=Banking'>Banking</a></li>
							 <li class='has-sub'><a href='/marketinsight.jsp?industryList=Chemicals & Petroleum'>Chemicals &amp; Petroleum</a></li>
							 <li class='has-sub'><a href='/marketinsight.jsp?industryList=Consumer Products'>Consumer Products</a></li>
							 <li class='has-sub'><a href='/marketinsight.jsp?industryList=Education'>Education</a></li>
							 <li class='has-sub'><a href='/marketinsight.jsp?industryList=Electronics'>Electronics</a></li>
							<li class='has-sub'><a href='/marketinsight.jsp?industryList=Energy & Utilities'>Energy &amp; Utilities</a></li>
							<li class='has-sub'><a href='/marketinsight.jsp?industryList=Financial Markets'>Financial Markets</a></li>
							<li class='has-sub'><a href='/marketinsight.jsp?industryList=Government'>Government</a></li>
							 <li class='has-sub'><a href='/marketinsight.jsp?industryList=Healthcare'>Healthcare</a></li>
							<li class='has-sub'><a href='/marketinsight.jsp?industryList=Industrial Products'>Industrial Products</a></li>
							<li class='has-sub'><a href='/marketinsight.jsp?industryList=Insurance'>Insurance</a></li>
							<li class='has-sub'><a href='/marketinsight.jsp?industryList=Life sciences'>Life sciences</a></li>
							<li class='has-sub'><a href='/marketinsight.jsp?industryList=Media & Entertainment'>Media &amp; Entertainment</a></li>
							<li class='has-sub'><a href='/marketinsight.jsp?industryList=Retail'>Retail</a></li>
							<li class='has-sub'><a href='/marketinsight.jsp?industryList=Telecommunications'>Telecommunications</a></li>
							<li class='has-sub'><a href='/marketinsight.jsp?industryList=Travel & Transportation'>Travel &amp; Transportation</a></li>
							 <li class='has-sub'><a href='/marketinsight.jsp?industryList=Cross Industry'>Cross Industry</a></li>
						</ul></li>
						<%   
							/* String role = "ADMIN"; */
									    
							UserDetails userdtl = (UserDetails)session.getAttribute("userDetailsObj");
         					String role  = userdtl.getRole();
							if (role.equalsIgnoreCase("ADMIN")) { %>	
					<li class='active has-sub'><a><span
							style="font-size: 16px; font-weight:; padding-right: 17px; padding-left: 17px;">Extras</span></a>
						<ul>
							<li class='has-sub'><a href='metrics.jsp'>Metrics- Hit Count</a></li>
							<li class='has-sub'><a href='PatRequestMetrics.jsp'>Metrics- Proposal Hub</a></li>
							<li class='has-sub'><a href='metricKHRequest.jsp'>Metrics- KH</a></li>
							<li class='has-sub'><a href='update.jsp'>Content Management</a></li>
							<li class='has-sub'><a href='ContentUpdate.jsp'>Content Data Entry</a></li>
							<li class='has-sub'><a href='KHRequestSearch.jsp'>KH Request Search</a></li>
							<li class='has-sub'><a href='PATSearch.jsp'>Proposal Hub Request Search</a></li>
						</ul></li>
						<%} %>
				</ul>
			</div>
		</div>
	</div>
</div>
</body>
</html>