<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=0" />
<meta http-equiv="Content-Type" content="text/html;charset=windows-1252">

<meta http-equiv="content-type" content="text/html;charset=utf-8" />

<title>Requests and Responses</title>


	<!-- THIS IS FOR JQUERY ACCORDION script Start-->
    <script src="vendor/jquery-1.9.1.js"></script>
    <script src="vendor/json2.js"></script>
    <script src="src/jquery.collapse.js"></script>
    <script src="src/jquery.collapse_storage.js"></script>
    <script src="src/jquery.collapse_cookie_storage.js"></script>
	<!-- THIS IS FOR JQUERY ACCORDION script end-->

	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>

	<!-- THIS IS FOR JQUERY ACCORDION Start-->
	<link rel="stylesheet" href="css/proposal-demo.css">
	<!--THIS IS FOR JQUERY ACCORDION End -->





<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/tytabs.jquery.min.js"></script>
<script type="text/javascript">
<!--
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
});
-->
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
		<!-- Header -->
		<%@ include file="include/headers.jsp" %>
		<!-- Header End -->

		<div class="clear"></div>

		<!-- Top-nav -->
		<%@ include file="include/topnav.jsp" %>
		<!-- Top-nav End -->

		<div class="clear"></div>

		<!-- Main data -->
		<div id="main">
			<div class="mid-data-container">
				<!-- top heading start -->
				<div class="pat-head">
					<h1>Requests and Responses</h1>
				</div>
				<!-- top heading end -->

				<div class="clear"></div>

				<!-- Breadcrumb Start -->
					<div id="breadcrumb-holder">
						<a href='index.html'>Home</a> > Requests and Responses
					</div>
				<!-- Breadcrumb End -->

				<div class="clear"></div>

				<!-- Mid Nav Start -->
				<%@ include file="include/subnav.jsp" %>	
							<!-- Mid Nav End -->


				<!-- Body data Start -->
				<div class="data-holder">
					<div class="tab-holder">

						<div class="center">
							<!-- Tabs -->
							<div id="tabsholder">

								<ul class="tabs">
									<li id="tab1">Sector / Industry Specific</li>
									<li id="tab2">Others</li>
								</ul>
								<div class="contents marginbot">


									<div id="content1" class="tabscontent">

										<div class="proposal-list-holder">

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


											  <h2>Sector / Industry Specific</h2>
											  <div id="open-by-default-example" data-collapse>

												<!--First acc start-->
												<h3 class="open">Communication</h3>
													<div>

														<div class="proposal-list-section">
															<ul>
																<li>CSI References for Telecom</li>
																<li>AMS References for Energy & Utilities</li>
																<li>ADM Capabilities for Utilities</li>
																<li>Transformation References for Media & Entertainment</li>
																<li>Oracle References for Utilities</li>
																<li>Transformation References for Energy & Utilities</li>
																<li>Hybrid Cloud References for Telecom</li>
															</ul>
															<p class="more""><a href="more.html">More...</a></p>
														</div>

													</div>
											<!--First acc end-->

											<!--Second acc start-->
											<h3>Distribution</h3>
												<div>

													<div class="proposal-list-section">
														<ul>
															<li>SAP References for Retail</li>
															<li>SAP AMS References for Life Sciences</li>
														</ul>
														<p class="more""><a href="more.html">More...</a></p>
													</div>

												</div>
											<!--Second acc end-->

											<!--Third acc start-->
												<h3>Financial</h3>
												<div>

													<div class="proposal-list-section">
														<ul>
															<li>Back Office Transformation References for FSS</li>
															<li>Analytics References for Banking</li>
															<li>Transition References for FSS</li>
															<li>Application Rationalization References for FSS</li>
															<li>Business Transformation References for FSS</li>
															<li>Innovation References for Banking</li>
															<li>Transformation References for FSS</li>
														</ul>
														<p class="more""><a href="more.html">More...</a></p>
													</div>

												</div>
											<!--Third acc end-->

											<!--Fourth acc start-->
											<h3>Industrial</h3>
												<div>

													<div class="proposal-list-section">
														<ul>
															<li>SAP References for Metals Industry</li>
														</ul>
														<p class="more""><a href="more.html">More...</a></p>
													</div>

												</div>
											<!--Fourth acc end-->

											<!--Fifth acc start-->
											<h3>Public</h3>
												<div>

													<div class="proposal-list-section">
														<ul>
															<li>Public Sector References</li>
															<li>CAMSS References for Public sector</li>
														</ul>
														<p class="more""><a href="more.html">More...</a></p>
													</div>

												</div>
											<!--Fifth acc end-->

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


											  <h2>Others</h2>
											  <div id="open-by-default-example" data-collapse>

												<!--First acc start-->
												<div>

													<div class="proposal-list-section">
														<ul>
															<li>BSS - IBM Capabilties</li>
															<li>DW-BI References</li>
															<li>GIS References</li>
															<li>IaaS-Paas References</li>
															<li>IBM Alliances & Partners</li>
															<li>GBS-GTS Interaction</li>
														</ul>
														<p class="more""><a href="more.html">More...</a></p>
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