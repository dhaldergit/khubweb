<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=0" />
<meta http-equiv="Content-Type" content="text/html;charset=windows-1252">

<meta http-equiv="content-type" content="text/html;charset=utf-8" />

<title>Proposal Insert</title>


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
			<div id="main_proposal">
				<div class="mid-data-container">
				<div id="multi-sections">
				<div class="part1_proposal">
<form id="searchForm" name="searchForm" >
<div class="container">

<div class="sidebar col-md-3">
							<div class="searchholder">
								<div class="searchholder-in">
                            <input type="button" class="srh" value="Search" onclick="searchFil();"><br></div></div>
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
																<div class="well"><fieldset><legend>Industry</legend>
																<div  id="industry" style="height: 11em;  overflow: auto;"></div>
																</fieldset>
																</div>
																<div class="well"><fieldset><legend>Growth Area</legend>
                                                                      <div  id="growth" style="height: 11em;  overflow: auto;"></div>
                                                                      </fieldset>
                                                                      </div>
                                                                      <div class="well" style="height: 8em;  overflow: auto;"><fieldset><legend>Published Date</legend>
                                                                     <div id="double_date_range" ></div>
                                                                      </fieldset>
                                                                      </div>
                                                                    
                                                                      <br> 
                                                                      <!-- hidden types start -->
<input type="hidden" id="type" name="type" value="Proposal Inserts">
<input type="hidden" id="minDate" name="minDate" value="">
<input type="hidden" id="maxDate" name="maxDate" value="">
<!-- hidden types end -->
                               <div class="searchholder">
								<div class="searchholder-in">
								<input type="button"  class="srh" value="Search"
											onclick="searchFil();"><br></div></div>
											
											</div>
											
											</div>
</form>
					</div>
									<div class="data">
									<div class="clear"></div>
						<div id="breadcrumb-holder">
						<a href='index.jsp'>Home</a> > Proposal Inserts
					</div>
					<div class="data-holder_proposal">
					<div class="tab-holder_proposal">
					<div  id="noResult_div" style=" padding-left: 0px"></div>
									<div  id="bas_div" style=" padding-left:0px"></div>
					</div>
					</div>
					</div>
					</div>
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