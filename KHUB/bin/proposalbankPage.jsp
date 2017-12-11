<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=0" />
<meta http-equiv="Content-Type" content="text/html;charset=windows-1252">

<meta http-equiv="content-type" content="text/html;charset=utf-8" />

<title>Proposal Bank</title>


<!-- THIS IS FOR JQUERY ACCORDION script Start-->
<script src="vendor/jquery-1.9.1.js"></script>
<script src="vendor/json2.js"></script>
<script src="src/jquery.collapse.js"></script>
<script src="src/jquery.collapse_storage.js"></script>
<script src="src/jquery.collapse_cookie_storage.js"></script>
<!-- THIS IS FOR JQUERY ACCORDION script end-->

<!-- <script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script> -->

<!-- THIS IS FOR JQUERY ACCORDION Start-->
<link rel="stylesheet" href="css/proposal-demo.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/jquery-ui-1.10.2.custom.min.css">
<link rel="stylesheet" href="css/stream.css">
<!--THIS IS FOR JQUERY ACCORDION End -->
<link rel="stylesheet" href="css/range-picker.css">





 <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="js/jquery-1.10.2-ui.min.js"></script> 
<script src="js/range_picker.js" type="text/javascript" charset="utf-8"></script>
<script src="js/range_picker_impl.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="js/khContent.js"></script>
<link href="css/tabs-styles.css" rel="stylesheet" type="text/css" />



<link rel="stylesheet" href="css/master.css" type="text/css" media="all" />
<link rel="stylesheet" href="css/styles.css" type="text/css" media="all" />

<link rel="stylesheet" href="css/new-topnav.css" media="screen">

<link rel="stylesheet" href="css/form-styles-v2.css" media="screen">
<link rel="stylesheet" href="css/khContentStyle.css" media="screen">

</head>

<body>
<div id="loading"></div>

	<!-- WRAPPER START -->
	<div id="wrapper">
		<!-- Container Start -->
		<div class="container">
			<!-- Header -->
			
			<!-- Header End -->
<%@ include file="include/headers.jsp" %>

			<div class="clear"></div>

			<!-- Top-nav -->
			
			<!-- Top-nav End -->

			<div class="clear"></div>

			<!-- Main data -->
			<div id="main">
				<div class="mid-data-container">
					<!-- top heading start -->
<!-- 					<div class="pat-head">
						<h1>Proposal Bank</h1>
					</div> -->
					<!-- top heading end -->

					<div class="clear"></div>

					<!-- Breadcrumb Start -->
					<div id="breadcrumb-holder">
						<a href='index.html'>Home</a> > Proposal Bank
					</div>
					<!-- Breadcrumb End -->

					<div class="clear"></div>
<form id="searchForm" name="searchForm" >
<div class="container">

<div class="sidebar col-md-3">
                            <input type="button"  value="Search" onclick="searchFil();"><br>
																<div class="well">
																<fieldset>
																<legend>Service Line</legend>
																<select id="serviceLine" name="serviceLine"></select>
																</fieldset>
																</div>
																<div class="well">
																<fieldset>
																<legend>Geography</legend>
																<select id="geo" name="geo"></select>
																</fieldset>
																</div>
																<div class="well" style="height: 12em;  overflow: auto;"><fieldset><legend>Industry</legend>
																<div  id="industry"></div>
																</fieldset>
																</div>
																<div class="well" style="height: 12em;  overflow: auto;"><fieldset><legend>Growth Area</legend>
                                                                      <div  id="growth"></div>
                                                                      </fieldset>
                                                                      </div>
                                                                      <div class="well" style="height: 12em;  overflow: auto;"><fieldset><legend>Published Date</legend>
                                                                     <div id="double_date_range" ></div>
                                                                      </fieldset>
                                                                      </div>
                                                                     <!-- <script src="js/range_picker.js" type="text/javascript" charset="utf-8"></script>
                                                                       <script src="js/range_picker_impl.js" type="text/javascript" charset="utf-8"></script> -->
                                                                      <br> 
                                                                      <!-- hidden types start -->
<input type="hidden" id="type" name="type" value="proposal">
<input type="hidden" id="minDate" name="minDate" value="">
<input type="hidden" id="maxDate" name="maxDate" value="">
<!-- hidden types end -->
                                                                     <input type="button"  value="Search"
											onclick="searchFil();">
											
											</div>
											<div  id="bas_div" style=" padding-left: 300px"></div>
											</div>
</form>
					</div>

				</div>
				<!-- Main data End -->



				<div class="clear"></div>

				<!-- Footer Bottom -->
				<%@ include file="include/footer.jsp"%>
				<!-- Footer Bottom End -->
			</div>
			<!-- Container End -->
		</div>
		<!-- WRAPPER END -->
</body>
</html>