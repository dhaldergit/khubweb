<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=0" />
<meta http-equiv="Content-Type" content="text/html;charset=windows-1252">

<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<title>Story Bank Main</title>


	<!-- THIS IS FOR JQUERY ACCORDION script Start-->
    <script src="vendor/jquery-1.9.1.js"></script>
    
    <script src="src/jquery.collapse.js"></script>
  
	<!-- THIS IS FOR JQUERY ACCORDION script end-->

	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>

	<!-- THIS IS FOR JQUERY ACCORDION Start-->
	<link rel="stylesheet" href="css/proposal-demo.css">
	<!--THIS IS FOR JQUERY ACCORDION End -->



<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/tytabs.jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	$("#tabsholder").tytabs({
							tabinit:"1",
							fadespeed:"fast"
							});
	$("#tabsholder2").tytabs({
							prefixtabs:"tabz",
							prefixcontent:"contentz",
							classcontent:"tabscontent",
							tabinit:"3",
							catchget:"tab1",
							fadespeed:"normal"
							});

	$("span[tab='distribution']").click(function(){
		$("li").removeClass("current");

		$("#tabsholder").tytabs({
							tabinit:"2",
							fadespeed:"fast"
							});
	});


       $("span[tab='financial']").click(function(){
		$("li").removeClass("current");

		$("#tabsholder").tytabs({
							tabinit:"3",
							fadespeed:"fast"
							});


	});




       
       $("span[tab='industrial']").click(function(){
		$("li").removeClass("current");

		$("#tabsholder").tytabs({
							tabinit:"4",
							fadespeed:"fast"
							});


	});




      $("span[tab='public']").click(function(){
		$("li").removeClass("current");

		$("#tabsholder").tytabs({
							tabinit:"5",
							fadespeed:"fast"
							});


	});
});

</script>
<link href="css/tabs-styles.css" rel="stylesheet" type="text/css" />



<link rel="stylesheet" href="css/master.css" type="text/css" media="all" />
<link rel="stylesheet" href="css/styles.css" type="text/css" media="all" />

<link rel="stylesheet" href="css/new-topnav.css" media="screen">

<link rel="stylesheet" href="css/form-styles-v2.css" media="screen">

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
					<h1>Story Bank</h1>
				</div>
				<!-- top heading end -->

				<div class="clear"></div>

				<!-- Breadcrumb Start -->
					<div id="breadcrumb-holder">
						<a href='index.html'>Home</a> > Story Bank
					</div>
				<!-- Breadcrumb End -->

				<div class="clear"></div>
                	<!-- Mid Nav Start -->
				<div id="mid-nav-section">
					<!-- Mid Nav left -->
					<div class="mid-nav-leftside">
						<div class="proposal"><a href="proposalinserts.jsp">Proposal Inserts</a></div>
						<div class="proposal"><a href="capabilities.jsp">Capabilities & Clients Corner</a></div>
						<div class="proposal"><a href="requestresponse.jsp">Requests & Responses</a></div>
						<div class="proposal"><a href="competitorinsight.jsp">Competitor Insights</a></div>
						<div class="proposal"><a href="marketinsight.jsp">Market Insights</a></div>
						<div class="market"><a href="salesprocess.jsp">Sales Processes</a></div>
					</div>
					<!-- Mid Nav left end -->

					<!-- Mid Nav right -->
					<!--div class="mid-nav-rightside">
						<form action="" method="post" class="form-search">
							<label>
								<input id="name" type="text" name="name" placeholder="What are you looking for?" />
								&nbsp;&nbsp;&nbsp;
								<input type="button" class="button" value="Search" />
							</label>
						</form>
						<!--<div class="icon1"><a href="#">1000+ Proposals</a></div>-->
					</div-->
					<!-- Mid Nav right -->
				</div>
				<!-- Mid Nav End -->
                
				<!-- Body data Start -->
				<div class="data-holder">
					<div class="tab-holder">

						<div class="center">
							<!-- Tabs -->
							<div id="tabsholder">

								<ul class="tabs">
									<li id="tab1">Communication</li>
									<li id="tab2">Distribution</li>
									<li id="tab3">Financial Services</li>
									<li id="tab4">Industrial</li>
									<li id="tab5">Public</li>

								</ul>
								<div class="contents marginbot">

									<div id="content1" class="tabscontent">
										<div class="proposal-list-holder">
											<p>Welcome to the GBS Knowledge Hub Storybank, the GBS Europe destination for client stories. This wiki is designed to aid your search for case studies, stories and client materials.</p>
											<p>Get started! Browse the client logos below. Some of the links below may take you out of Knowledge Hub community.</p>
											<p>Read and hear the <a href="https://w3-connections.ibm.com/blogs/30f982c3-616f-4b5b-9978-3b711e1fda79/entry/power-of-storytelling?lc=https://w3-connections.ibm.com/blogs/30f982c3-616f-4b5b-9978-3b711e1fda79/entry/power-of-storytelling&ecLink=read this message&ecwtmsite=Emailcmp&ecGroup=CHQCOMM&ecTitle=Ginni%27s blog post: The power of sharing stories&ecAuthor=THINKTogether&ecCampaign=02102015_GinniBlogNote&ecDistlist=INTL_ThinkTogether_FEB2015 GB 0050-0054 -- Members = 1000&ecDLsize=1000&ecDate=2015-02-10&lang=en_us" target="_blank">Power of Sharing Stories</a> from Ginni Rometty.</p>
											
											<!-- Middle sections Start -->
										<div class="prop-acc-part">
											<div class="prop-acc-container">

											<div class="prop-col c3">
											  <!-- BEGIN Events -->

											  <script>
												var el = $("#events-example"),
												  log = $("#event-log");

												el.collapse();
												el.bind("opened", function(e, section) {
												  log.html("'" + section.$summary.text() + "' was opened");
												})
												.bind("closed", function(e, section) {
												  log.html("'" + section.$summary.text() + "' was closed");
												});

												$("#btn-open-all").click(function() {
												  $("#events-example").trigger("open")
												})
												$("#btn-close-first").click(function() {
													console.log("hwat what");
												  $("#events-example h3 a").first().trigger("close")
												})
												$("#btn-toggle-last").click(function() {
												  $("#events-example h3 a").last().trigger("toggle")
												})
											  </script>

											
											  <h2>Some Heading</h2>
											  <div id="open-by-default-example" data-collapse>

												<!--First acc start-->
												<h3 class="open">Energy and Utilities (E&U)</h3>
												<div>

													<div class="proposal-list-section">
														<!--<h1>Most Accessed</h1>-->
														<!--Logo data section start-->
														<div class="story-tabl-holder">
															<table class="story-logo" style="margin-left: auto; margin-right: auto;">
															  <tr>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/Acque%20spa%20and%20Publiacqua%20spa" target="_blank""><img width="182" height="90" alt="acque" src="images/logos/acque.png"></a></td>
																<td>&nbsp;</td>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/Electrabel%20%28Engie%20GDF%20Suez%29" target="_blank"><img width="150" height="67" alt="Electrabel GDF Suez" src="images/logos/Electrabell.png"></a></td>
																<td>&nbsp;</td>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/W9158cbc010ed_4a0e_91fc_d2ffc0303eb9/page/KH%20Storybank%20-%20Northumbrian%20Water" target="_blank""><img width="150" height="35" alt="northumbria" src="images/logos/northumbria.png"></a></td>
																<td>&nbsp;</td>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/W9158cbc010ed_4a0e_91fc_d2ffc0303eb9/page/KH%20Storybank%20-%20Scottish%20Power" target="_blank""><img width="150" height="47" alt="Scottish_Power" src="images/logos/Scottish_Power.png"></a></td>
															  </tr>
															  
															  <tr>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/United%20Utilities"target="_blank""><img width="150" height="51" alt="unitedutilities" src="images/logos/unitedutilities.png"></a></td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
															  </tr>
															  
															  </table>
														</div>
														<!--Logo data section end-->
														<!--<p class="more""><a href="more.html">More...</a></p>-->
													</div>

												</div>
											<!--First acc end-->

											<!--Second acc start-->
											<h3>Media and Entertainment (M&E)</h3>
												<div>

													<div class="proposal-list-section">
													
													<!--<h1>Most Accessed</h1>-->
														<!--Logo data section start-->
														<div class="story-tabl-holder">
															<table class="story-logo" style="margin-left: auto; margin-right: auto;">
															  <tr>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/BBC%20Proposal" target="_blank"><img width="140" height="49" alt="BBC Proposal" src="images/logos/bbc.png"></a></td>
																<td>&nbsp;</td>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/Milan%20Fashion%20Week" target="_blank""><img width="100" height="77" alt="milanfashionweek" src="images/logos/milanfashionweek.png"></a></td>
																<td>&nbsp;</td>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/Rugby%20Football%20Union%20%28Hub%29" target="_blank""><img width="120" height="88" alt="rfu" src="images/logos/rfu.png"></a></td>
																<td>&nbsp;</td>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/Sony%20Pictures%20%28Spain%29" target="_blank""><img width="74" height="100" alt="sonypictures" src="images/logos/sonypictures.png"></a></td>
															  </tr>
															  
															  <tr>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/Wimbledon%20v1" target="_blank""><img width="90" height="88" alt="wimbledon" src="images/logos/wimbledon.png"></a></td>
																<td>&nbsp;</td>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/World%20Cup%20%28Ei%20Treinador%20App%29" target="_blank""><img width="92" height="90" alt="EI" src="images/logos/ei.png"></a></td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
															  </tr>
															  
															  </table>
														</div>
														<!--Logo data section end-->
														
													<!--<p class="more""><a href="more.html">More...</a></p>-->
													</div>

												</div>
											<!--Second acc end-->

											<!--Third acc start-->
											<h3>Telecommunications (Telco)</h3>
												<div>

													<div class="proposal-list-section">
														<!--<h1>Most Accessed</h1>-->
														<!--Logo data section start-->
														<div class="story-tabl-holder">
															<table class="story-logo" style="margin-left: auto; margin-right: auto;">
															  <tr>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/Bharti%20Airtel.html" target="_blank""><img width="165" height="56" alt="airtel" src="images/logos/airtel.png"></a></td>
																<td>&nbsp;</td>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/Celcom" target="_blank"" ><img width="121" height="80" alt="celcom" src="images/logos/celcom.png"></a></td>
																<td>&nbsp;</td>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/KPN%20v1" target="_blank""><img width="150" height="63" alt="kpn" src="images/logos/kpn.png"></a></td>
																<td>&nbsp;</td>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/Orange%20Spain" target="_blank""><img width="82" height="82" alt="orange" src="images/logos/orange.png"></a></td>
															  </tr>
															  
															  <tr>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/Vodafone%20v1" target="_blank""><img width="125" height="100" alt="vodafone" src="images/logos/vodafone.png"></a></td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
															  </tr>
															  
															  </table>
														</div>
														<!--Logo data section end-->
														<!--<p class="more""><a href="more.html">More...</a></p>-->
													</div>

												</div>
											<!--Third acc end-->

											</div>
											<!-- END Events -->
											</div>
											</div>
										</div>
										<!-- Middle sections End -->
											
										</div>
									</div>


									<div id="content2" class="tabscontent">

										<div class="proposal-list-holder">
											<p>Welcome to the GBS Knowledge Hub Storybank, the GBS Europe destination for client stories. This wiki is designed to aid your search for case studies, stories and client materials.</p>
											<p>Get started! Browse the client logos below. Some of the links below may take you out of Knowledge Hub community.</p>
											<p>Read and hear the <a href="https://w3-connections.ibm.com/blogs/30f982c3-616f-4b5b-9978-3b711e1fda79/entry/power-of-storytelling?lc=https://w3-connections.ibm.com/blogs/30f982c3-616f-4b5b-9978-3b711e1fda79/entry/power-of-storytelling&ecLink=read this message&ecwtmsite=Emailcmp&ecGroup=CHQCOMM&ecTitle=Ginni%27s blog post: The power of sharing stories&ecAuthor=THINKTogether&ecCampaign=02102015_GinniBlogNote&ecDistlist=INTL_ThinkTogether_FEB2015 GB 0050-0054 -- Members = 1000&ecDLsize=1000&ecDate=2015-02-10&lang=en_us" target="_blank">Power of Sharing Stories</a> from Ginni Rometty.</p>
										
											<!-- Middle sections Start -->
										<div class="prop-acc-part">
											<div class="prop-acc-container">

											<div class="prop-col c3">
											  <!-- BEGIN Events -->

											  <script>
												var el = $("#events-example"),
												  log = $("#event-log");

												el.collapse();
												el.bind("opened", function(e, section) {
												  log.html("'" + section.$summary.text() + "' was opened");
												})
												.bind("closed", function(e, section) {
												  log.html("'" + section.$summary.text() + "' was closed");
												});

												$("#btn-open-all").click(function() {
												  $("#events-example").trigger("open")
												})
												$("#btn-close-first").click(function() {
													console.log("hwat what");
												  $("#events-example h3 a").first().trigger("close")
												})
												$("#btn-toggle-last").click(function() {
												  $("#events-example h3 a").last().trigger("toggle")
												})
											  </script>

											
											  <h2>Some Heading</h2>
											  <div id="open-by-default-example" data-collapse>

												<!--First acc start-->
												<h3 class="open">Consumer Products Group (CPG)</h3>
												<div>

													<div class="proposal-list-section">
														<!--<h1>Most Accessed</h1>-->
														<!--Logo data section start-->
														<div class="story-tabl-holder">
															<table class="story-logo" style="margin-left: auto; margin-right: auto;">
															  <tr>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/W9158cbc010ed_4a0e_91fc_d2ffc0303eb9/page/KH%20Storybank%20-%20Arla%20Foods" target="_blank"><img width="150" height="75" alt="ArlaFoods" src="images/logos/ArlaFoodsLogo.gif"></a></td>
																<td>&nbsp;</td>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/Autogrill" target="_blank"><img width="70" height="70" alt="autogrill" src="images/logos/autogrill.png"></a></td>
																<td>&nbsp;</td>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/Bvlgari" target="_blank"><img width="150" height="38" alt="bvlgari" src="images/logos/bvlgari.png"></a></td>
																<td>&nbsp;</td>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/Jose%20Cuervo%20TEM%281%29" target="_blank"><img width="150" height="51" alt="jose_cuervo" src="images/logos/jose_cuervo.jpg"></a></td>
															  </tr>
															  
															  <tr>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/Nandos" target="_blank"><img width="130" height="92" alt="nandos" src="images/logos/nandos.png"></a></td>
																<td>&nbsp;</td>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/Nespresso" target="_blank"><img width="130" height="82" alt="nespresso" src="images/logos/nespresso.png"></a></td>
																<td>&nbsp;</td>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/Calidad%20Pascual" target="_blank"><img width="120" height="88" alt="pascual" src="images/logos/pascual.png"></a></td>
																<td>&nbsp;</td>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/PassionFroid" target="_blank"><img width="106" height="100" alt="passionfroid" src="images/logos/passionfroid.png"></a></td>
															  </tr>
															  
															  <tr>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/Nandos" target="_blank"><img width="130" height="92" alt="Reckitt Benckiser" src="images/logos/.png"></a></td>
																<td>&nbsp;</td>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/Starbucks" target="_blank"><img width="90" height="90" alt="Starbucks" src="images/logos/Starbucks.png"></a></td>
																<td>&nbsp;</td>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/Tim%20Hortons"target="_blank"><img width="140" height="93" alt="timhortons" src="images/logos/timhortons.png"></a></td>
																<td>&nbsp;</td>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/Unilever" target="_blank"><img width="150" height="83" alt="Unilever" src="images/logos/Unilever.png"></a></td>
															  </tr>
															  
															  </table>
														</div>
														<!--Logo data section end-->
														<!--<p class="more""><a href="more.html">More...</a></p>-->
													</div>

												</div>
											<!--First acc end-->

											<!--Second acc start-->
											<h3>Life Sciences and Pharma (LSP)</h3>
												<div>

													<div class="proposal-list-section">
													
													<!--<h1>Most Accessed</h1>-->
														<!--Logo data section start-->
														<div class="story-tabl-holder">
															<table class="story-logo" style="margin-left: auto; margin-right: auto;">
															  <tr>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/W9158cbc010ed_4a0e_91fc_d2ffc0303eb9/page/KH%20Storybank%20-%20Johnson%20%26%20Johnson" target="_blank"><img width="150" height="47" alt="Johnson & Johnson" src="images/logos/J&J.jpg"></a></td>
																<td>&nbsp;</td>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/W9158cbc010ed_4a0e_91fc_d2ffc0303eb9/page/KH%20Storybank%20-%20Novartis" target="_blank"><img width="150" height="45" alt="Novartis" src="images/logos/Novartis.jpg"></a></td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
															  </tr>
															  
															  </table>
														</div>
														<!--Logo data section end-->
														
													<!--<p class="more""><a href="more.html">More...</a></p>-->
													</div>

												</div>
											<!--Second acc end-->

											<!--Third acc start-->
											<h3>Retail</h3>
												<div>

													<div class="proposal-list-section">
														<!--<h1>Most Accessed</h1>-->
														<!--Logo data section start-->
														<div class="story-tabl-holder">
															<table class="story-logo" style="margin-left: auto; margin-right: auto;">
															  <tr>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/David%20Jones" target="_blank"><img width="150" height="79" alt="davidjones" src="images/logos/davidjones.png"></a></td>
																<td>&nbsp;</td>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/Homebase" target="_blank"><img width="150" height="28" alt="Homebase" src="images/logos/homebase.png"></a></td>
																<td>&nbsp;</td>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/IKEA%20v1" target="_blank"><img width="138" height="42" alt="Ikea" src="images/logos/ikea.png"></a></td>
																<td>&nbsp;</td>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/JD%20Williams" target="_blank"><img width="120" height="52" alt="JD Williams" src="images/logos/jdwilliams.png"></a></td>
															  </tr>
															  
															  <tr>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/Kaufland" target="_blank"><img width="80" height="80" alt="Kaufland" src="images/logos/kaufland.png"></a></td>
																<td>&nbsp;</td>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/Media%20Saturn" target="_blank"><img width="150" height="23" alt="Media Saturn" src="images/logos/mediasaturn.jpg"></a></td>
																<td>&nbsp;</td>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/Philip%20Morris%20International" target="_blank"><img width="114" height="90" alt="Philip Morris" src="images/logos/pmi_logo.jpg"></a></td>
																<td>&nbsp;</td>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/Reed%20Exhibitions" target="_blank"><img width="150" height="49" alt="Reed Exhibitions" src="images/logos/reedexhib.jpg"></a></td>
															  </tr>
															  
															  <tr>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/Shop%20Direct%20Group%20%28Accelerated%20Visioning%29" target="_blank"><img width="87" height="80" alt="Shop Direct" src="images/logos/shopdirect.png"></a></td>
																<td>&nbsp;</td>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/W9158cbc010ed_4a0e_91fc_d2ffc0303eb9/page/KH%20Storybank%20-%20Technopolis" target="_blank"><img width="156" height="58" alt="Technopolis" src="images/logos/Technopolis.jpg"></a></td>
																<td>&nbsp;</td>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/Tesco%20v1" target="_blank"><img width="150" height="40" alt="Tesco" src="images/logos/tesco.jpg"></a></td>
																<td>&nbsp;</td>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/North%20Face%20%28Watson%29" target="_blank"><img width="80" height="80" alt="The North Face" src="images/logos/The_North_Face_logo.png"></a></td>
															  </tr>
															  
															   <tr>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/Waitrose%20Hub" target="_blank"><img width="80" height="80" alt="waitrose" src="images/logos/waitrose.jpeg"></a></td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
															  </tr>
															  
															  </table>
														</div>
														<!--Logo data section end-->
														<!--<p class="more""><a href="more.html">More...</a></p>-->
													</div>

												</div>
											<!--Third acc end-->
											
											
											<!--Fourth acc start-->
											<h3>Travel and Transportation (T&T)</h3>
												<div>

													<div class="proposal-list-section">
														<!--<h1>Most Accessed</h1>-->
														<!--Logo data section start-->
														<div class="story-tabl-holder">
															<table class="story-logo" style="margin-left: auto; margin-right: auto;">
															  <tr>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/Air%20Canada" target="_blank"><img width="120" height="50" alt="Air Canada" src="images/logos/aircanada.png"></a></td>
																<td>&nbsp;</td>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/British%20Airways%20v1" target="_blank"><img width="150" height="32" alt="British Airways" src="images/logos/britishairways.png"></a></td>
																<td>&nbsp;</td>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/DB%20Schenker" target="_blank"><img width="140" height="29" alt="DB Schenker" src="images/logos/schenker.png"></a></td>
																<td>&nbsp;</td>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/Finnair" target="_blank""><img width="120" height="73" alt="Finnair" src="images/logos/finnair.jpg"></a></td>
															  </tr>
															  
															  <tr>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/Japan%20Airlines%20-%20Apple%20Watch%20Story" target="_blank"><img width="140" height="42" alt="Japan Airlines" src="images/logos/japanairlines.png"></a></td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
															  </tr>
															  
															  </table>
														</div>
														<!--Logo data section end-->
														<!--<p class="more""><a href="more.html">More...</a></p>-->
													</div>

												</div>
											<!--Fourth acc end-->

											

											</div>
											<!-- END Events -->
											</div>
											</div>
										</div>
										<!-- Middle sections End -->

											
										</div>

									</div>




									<div id="content3" class="tabscontent">

										<div class="proposal-list-holder">
										
											<p>Welcome to the GBS Knowledge Hub Storybank, the GBS Europe destination for client stories. This wiki is designed to aid your search for case studies, stories and client materials.</p>
											<p>Get started! Browse the client logos below. Some of the links below may take you out of Knowledge Hub community.</p>
											<p>Read and hear the <a href="https://w3-connections.ibm.com/blogs/30f982c3-616f-4b5b-9978-3b711e1fda79/entry/power-of-storytelling?lc=https://w3-connections.ibm.com/blogs/30f982c3-616f-4b5b-9978-3b711e1fda79/entry/power-of-storytelling&ecLink=read this message&ecwtmsite=Emailcmp&ecGroup=CHQCOMM&ecTitle=Ginni%27s blog post: The power of sharing stories&ecAuthor=THINKTogether&ecCampaign=02102015_GinniBlogNote&ecDistlist=INTL_ThinkTogether_FEB2015 GB 0050-0054 -- Members = 1000&ecDLsize=1000&ecDate=2015-02-10&lang=en_us" target="_blank">Power of Sharing Stories</a> from Ginni Rometty.</p>
											
											<!-- Middle sections Start -->
										<div class="prop-acc-part">
											<div class="prop-acc-container">

											<div class="prop-col c3">
											  <!-- BEGIN Events -->

											  <script>
												var el = $("#events-example"),
												  log = $("#event-log");

												el.collapse();
												el.bind("opened", function(e, section) {
												  log.html("'" + section.$summary.text() + "' was opened");
												})
												.bind("closed", function(e, section) {
												  log.html("'" + section.$summary.text() + "' was closed");
												});

												$("#btn-open-all").click(function() {
												  $("#events-example").trigger("open")
												})
												$("#btn-close-first").click(function() {
													console.log("hwat what");
												  $("#events-example h3 a").first().trigger("close")
												})
												$("#btn-toggle-last").click(function() {
												  $("#events-example h3 a").last().trigger("toggle")
												})
											  </script>

											
											  <h2>Some Heading</h2>
											  <div id="open-by-default-example" data-collapse>

												<!--First acc start-->
												<h3 class="open">Banking</h3>
												<div>

													<div class="proposal-list-section">
														<!--<h1>Most Accessed</h1>-->
														<!--Logo data section start-->
														<div class="story-tabl-holder">
															<table class="story-logo" style="margin-left: auto; margin-right: auto;">
															  <tr>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/AMEX%20hub%20page" target="_blank"><img width="80" height="69" alt="American Express" src="images/logos/amex.jpeg"></a></td>
																<td>&nbsp;</td>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/Banco%20Popolare%20di%20Milano" target="_blank"><img width="140" height="37" alt="Banca Popolare Di Milano" src="images/logos/banca-popolare-di-milano.jpg"></a></td>
																<td>&nbsp;</td>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/Barclays%20%28Barclaycard%29" target="_blank"><img width="150" height="58" alt="Barclaycard" src="images/logos/barclaycard.png"></a></td>
																<td>&nbsp;</td>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/Caixa%20Bank" target="_blank"><img width="150" height="45" alt="Caixa Bank" src="images/logos/caixabank.png"></a></td>
															  </tr>
															  
															  <tr>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/Banca%20Carige" target="_blank"><img width="140" height="67" alt="Grupo Banca Carige" src="images/logos/grupobanca.png"></a></td>
																<td>&nbsp;</td>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/Lloyds%20Banking%20Group" target="_blank"><img width="130" height="78" alt="lloyds Banking" src="images/logos/lloydsbanking.png"></a></td>
																<td>&nbsp;</td>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/Nationwide%20Hub" target="_blank"><img width="150" height="36" alt="Nationwide" src="images/logos/nationwide.png"></a></td>
																<td>&nbsp;</td>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/Unicredit" target="_blank"><img width="140" height="92" alt="unicredit" src="images/logos/unicredit.png"></a></td>
															  </tr>
															  
															  <tr>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/Wells%20Fargo" target="_blank"><img width="71" height="70" alt="Wells Fargo" src="images/logos/wellsfargo.png"></a></td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
															  </tr>
															  
															  </table>
														</div>
														<!--Logo data section end-->
														<!--<p class="more""><a href="more.html">More...</a></p>-->
													</div>

												</div>
											<!--First acc end-->

											<!--Second acc start-->
											<h3>Financial Services</h3>
												<div>

													<div class="proposal-list-section">
													
													<!--<h1>Most Accessed</h1>-->
														<!--Logo data section start-->
														<div class="story-tabl-holder">
															<table class="story-logo" style="margin-left: auto; margin-right: auto;">
															  <tr>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/Coventry%20Building%20Society%20Accelerated%20Visioning%20Proposal" target="_blank"><img width="85" height="96" alt="coventry" src="images/logos/coventry.png"></a></td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
															  </tr>
															  
															  </table>
														</div>
														<!--Logo data section end-->
														
													<!--<p class="more""><a href="more.html">More...</a></p>-->
													</div>

												</div>
											<!--Second acc end-->

											<!--Third acc start-->
											<h3>Insurance</h3>
												<div>

													<div class="proposal-list-section">
														<!--<h1>Most Accessed</h1>-->
														<!--Logo data section start-->
														<div class="story-tabl-holder">
															<table class="story-logo" style="margin-left: auto; margin-right: auto;">
															  <tr>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/Atradius" target="_blank"><img width="90" height="90" alt="atradius" src="images/logos/atradius.png"></a></td>
																<td>&nbsp;</td>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/GEICO" target="_blank"><img width="140" height="87" alt="geico" src="images/logos/geico.png"></a></td>
																<td>&nbsp;</td>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/Metlife" target="_blank"><img width="140" height="46" alt="metlife" src="images/logos/metlife.png"></a></td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
															  </tr>
															  
															  </table>
														</div>
														<!--Logo data section end-->
														<!--<p class="more""><a href="more.html">More...</a></p>-->
													</div>

												</div>
											<!--Third acc end-->

											</div>
											<!-- END Events -->
											</div>
											</div>
										</div>
										<!-- Middle sections End -->
											
										</div>

									</div>



									<div id="content4" class="tabscontent">

										<div class="proposal-list-holder">
										
											<p>Welcome to the GBS Knowledge Hub Storybank, the GBS Europe destination for client stories. This wiki is designed to aid your search for case studies, stories and client materials.</p>
											<p>Get started! Browse the client logos below. Some of the links below may take you out of Knowledge Hub community.</p>
											<p>Read and hear the <a href="https://w3-connections.ibm.com/blogs/30f982c3-616f-4b5b-9978-3b711e1fda79/entry/power-of-storytelling?lc=https://w3-connections.ibm.com/blogs/30f982c3-616f-4b5b-9978-3b711e1fda79/entry/power-of-storytelling&ecLink=read this message&ecwtmsite=Emailcmp&ecGroup=CHQCOMM&ecTitle=Ginni%27s blog post: The power of sharing stories&ecAuthor=THINKTogether&ecCampaign=02102015_GinniBlogNote&ecDistlist=INTL_ThinkTogether_FEB2015 GB 0050-0054 -- Members = 1000&ecDLsize=1000&ecDate=2015-02-10&lang=en_us" target="_blank">Power of Sharing Stories</a> from Ginni Rometty.</p>
											
											<!-- Middle sections Start -->
										<div class="prop-acc-part">
											<div class="prop-acc-container">

											<div class="prop-col c3">
											  <!-- BEGIN Events -->

											  <script>
												var el = $("#events-example"),
												  log = $("#event-log");

												el.collapse();
												el.bind("opened", function(e, section) {
												  log.html("'" + section.$summary.text() + "' was opened");
												})
												.bind("closed", function(e, section) {
												  log.html("'" + section.$summary.text() + "' was closed");
												});

												$("#btn-open-all").click(function() {
												  $("#events-example").trigger("open")
												})
												$("#btn-close-first").click(function() {
													console.log("hwat what");
												  $("#events-example h3 a").first().trigger("close")
												})
												$("#btn-toggle-last").click(function() {
												  $("#events-example h3 a").last().trigger("toggle")
												})
											  </script>

											
											  <h2>Some Heading</h2>
											  <div id="open-by-default-example" data-collapse>

												<!--First acc start-->
												<h3 class="open">Chemical & Petroleum (C&P)</h3>
												<div>

													<div class="proposal-list-section">
														<!--<h1>Most Accessed</h1>-->
														<!--Logo data section start-->
														<div class="story-tabl-holder">
															<table class="story-logo" style="margin-left: auto; margin-right: auto;">
															  <tr>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/BP%20Mobile%20Payments%20Solution%20Proposal" target="_blank"><img width="79" height="98" alt="BP" src="images/logos/bp.png"></a></td>
																<td>&nbsp;</td>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/Castrol" target="_blank"><img width="150" height="40" alt="Castrol" src="images/logos/castrol.png"></a></td>
																<td>&nbsp;</td>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/W9158cbc010ed_4a0e_91fc_d2ffc0303eb9/page/KH%20Storybank%20-%20Husky%20Energy" target="_blank""><img width="90" height="91" alt="HuskyEnergy" src="images/logos/HuskyEnergy.jpg"></a></td>
																<td>&nbsp;</td>
																<td><a href="storybank-client.html" target="_blank"><img width="90" height="90" alt="shell" src="images/logos/shell.png"></a></td>
															  </tr>
															  
															  <tr>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/W9158cbc010ed_4a0e_91fc_d2ffc0303eb9/page/KH%20Storybank%20-%20Suncor%20Energy" target="_blank"><img width="150" height="52" alt="SuncorEnergy" src="images/logos/SuncorEnergy.jpg"></a></td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
															  </tr>
															  
															  </table>
														</div>
														<!--Logo data section end-->
														<!--<p class="more""><a href="more.html">More...</a></p>-->
													</div>

												</div>
											<!--First acc end-->

											<!--Second acc start-->
											<h3>Automotive (Auto)</h3>
												<div>

													<div class="proposal-list-section">
													
													<!--<h1>Most Accessed</h1>-->
														<!--Logo data section start-->
														<div class="story-tabl-holder">
															<table class="story-logo" style="margin-left: auto; margin-right: auto;">
															  <tr>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/Audi" target="_blank"><img width="120" height="96" alt="audi" src="images/logos/audi.jpg"></a></td>
																<td>&nbsp;</td>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/JLR" target="_blank"><img width="140" height="96" alt="Jaguar" src="images/logos/jaguar.png"></a></td>
																<td>&nbsp;</td>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/Ford%20v1" target="_blank"><img width="140" height="93" alt="Ford" src="images/logos/ford.png"></a></td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
															  </tr>
															  
															  </table>
														</div>
														<!--Logo data section end-->
														
													<!--<p class="more""><a href="more.html">More...</a></p>-->
													</div>

												</div>
											<!--Second acc end-->

											<!--Third acc start-->
											<h3>Electronics</h3>
												<div>

													<div class="proposal-list-section">
														<!--<h1>Most Accessed</h1>-->
														<!--Logo data section start-->
														<div class="story-tabl-holder">
															<table class="story-logo" style="margin-left: auto; margin-right: auto;">
															  <tr>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/BSH%20-%20Bosch%20Siemens%20Home%20Appliances%20Group" target="_blank"><img width="120" height="96" alt="'Bosch Siemens Home Appliances Group (BSH)" src="images/logos/bsh.jpg"></a></td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
															  </tr>
															  
															  </table>
														</div>
														<!--Logo data section end-->
														<!--<p class="more""><a href="more.html">More...</a></p>-->
													</div>

												</div>
											<!--Third acc end-->

											</div>
											<!-- END Events -->
											</div>
											</div>
										</div>
										<!-- Middle sections End -->
											
										</div>

									</div>



									<div id="content5" class="tabscontent">

										<div class="proposal-list-holder">
											<p>Welcome to the GBS Knowledge Hub Storybank, the GBS Europe destination for client stories. This wiki is designed to aid your search for case studies, stories and client materials.</p>
											<p>Get started! Browse the client logos below. Some of the links below may take you out of Knowledge Hub community.</p>
											<p>Read and hear the <a href="https://w3-connections.ibm.com/blogs/30f982c3-616f-4b5b-9978-3b711e1fda79/entry/power-of-storytelling?lc=https://w3-connections.ibm.com/blogs/30f982c3-616f-4b5b-9978-3b711e1fda79/entry/power-of-storytelling&ecLink=read this message&ecwtmsite=Emailcmp&ecGroup=CHQCOMM&ecTitle=Ginni%27s blog post: The power of sharing stories&ecAuthor=THINKTogether&ecCampaign=02102015_GinniBlogNote&ecDistlist=INTL_ThinkTogether_FEB2015 GB 0050-0054 -- Members = 1000&ecDLsize=1000&ecDate=2015-02-10&lang=en_us" target="_blank">Power of Sharing Stories</a> from Ginni Rometty.</p>
											
											<!-- Middle sections Start -->
										<div class="prop-acc-part">
											<div class="prop-acc-container">

											<div class="prop-col c3">
											  <!-- BEGIN Events -->

											  <script>
												var el = $("#events-example"),
												  log = $("#event-log");

												el.collapse();
												el.bind("opened", function(e, section) {
												  log.html("'" + section.$summary.text() + "' was opened");
												})
												.bind("closed", function(e, section) {
												  log.html("'" + section.$summary.text() + "' was closed");
												});

												$("#btn-open-all").click(function() {
												  $("#events-example").trigger("open")
												})
												$("#btn-close-first").click(function() {
													console.log("hwat what");
												  $("#events-example h3 a").first().trigger("close")
												})
												$("#btn-toggle-last").click(function() {
												  $("#events-example h3 a").last().trigger("toggle")
												})
											  </script>

											
											  <h2>Some Heading</h2>
											  <div id="open-by-default-example" data-collapse>

												<!--First acc start-->
												<h3 class="open">Government</h3>
												<div>

													<div class="proposal-list-section">
														<!--<h1>Most Accessed</h1>-->
														<!--Logo data section start-->
														<div class="story-tabl-holder">
															<table class="story-logo" style="margin-left: auto; margin-right: auto;">
															  <tr>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/W9158cbc010ed_4a0e_91fc_d2ffc0303eb9/page/KH%20Storybank%20-%20Etisalat" target="_blank"><img width="73" height="84" alt="Etisalat" src="images/logos/Etisalat.jpg"></a></td>
																<td>&nbsp;</td>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/The%20Department%20of%20Health%20%28UK%29" target="_blank"><img width="120" height="74" alt="The Department of Health (UK)" src="images/logos/deptofhealth.png"></a></td>
																<td>&nbsp;</td>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/AMS%20Austria%20Mobile%20App" target="_blank"><img width="140" height="93" alt="AMS Austria Mobile App" src="images/logos/ams.png"></a></td>
																<td>&nbsp;</td>
																<td><a href="https://w3-connections.ibm.com/wikis/home/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/State%20Hermitage%20Museum" target="_blank"><img width="90" height="60" alt="State Hermitage Museum" src="images/logos/hermitage.jpg"></a></td>
															  </tr>
															  
															  <tr>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/Wf98c31113f09_42e8_aa66_e6f93fc6b693/page/City%20Forward" target="_blank"><img width="150" height="29" alt="City Forward" src="images/logos/cityforward.png"></a></td>
																<td>&nbsp;</td>
																<td><a href="https://w3-connections.ibm.com/wikis/home?lang=en-us#!/wiki/W9158cbc010ed_4a0e_91fc_d2ffc0303eb9/page/KH%20Storybank%20-%20UK%20PO" target="_blank""><img width="90" height="78" alt="UK Post Office" src="images/logos/post-office.png"></a></td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
															  </tr>
															  
															  </table>
														</div>
														<!--Logo data section end-->
														<!--<p class="more""><a href="more.html">More...</a></p>-->
													</div>

												</div>
											<!--First acc end-->

											</div>
											<!-- END Events -->
											</div>
											</div>
										</div>
										<!-- Middle sections End -->
											
										</div>

									</div>



								</div>
							</div>
							<!-- /Tabs -->
						</div>

					</div>

				</div>
				<!-- Body data End -->

				<!-- Multi sections Start
				<div id="multi-sections">
					data
				</div>
				<!-- Multi sections End -->
			</div>

		</div>
		<!-- Main data End -->

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