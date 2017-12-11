<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=0" />
<meta http-equiv="Content-Type" content="text/html;charset=windows-1252">

<meta http-equiv="content-type" content="text/html;charset=utf-8" />

<title>Request Proposal Development</title>



<link rel="stylesheet" href="css/master.css" type="text/css" media="all" />
<link rel="stylesheet" href="css/styles.css" type="text/css" media="all" />

<link rel="stylesheet" href="css/new-topnav.css" media="screen">

<link rel="stylesheet" href="css/form-styles-v2.css" media="screen">

<script type="text/javascript" src="js/datetimepicker.js"></script>

<script type="text/javascript" src="js/validation.js"></script>
<script src="vendor/jquery-1.9.1.js"></script>
<script src="vendor/json2.js"></script>
<script src="src/jquery.collapse.js"></script>
<script src="src/jquery.collapse_storage.js"></script>
<script src="src/jquery.collapse_cookie_storage.js"></script>
<!-- THIS IS FOR JQUERY ACCORDION script end-->

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>


<script type="text/javascript">



	
	


/////////////////////////////////////////////////////////////
	function callSubmit() {
	
	
	if (document.getElementById("contactName").value == "") {
		alert("Please enter  a Name");
		return;
	}
	
	if (document.getElementById("comments").value == "") {
		alert("Please write  a comment");
		return;
	}
	
	if (document.getElementById("contactEmail").value == "") {
		alert("Please enter  a Name");
		return;
	}
		
	
		/* if (document.uploadTypeForm.uploadType.value == 'bulkUpload') {
		document.getElementById("bulkUploadForm").submit();
		} else if (document.uploadTypeForm.uploadType.value == 'singleUpload') {
			document.getElementById("insertForm").submit();
		} */
	document.getElementById("insertForm").submit();
	}
	
	
</script>
<style type="text/css">
#loading {
	width: 100%;
	height: 100%;
	position: fixed;
	top: 0;
	left: 0;
	background-image:url('/images/loading.gif');
	background-color: rgba(0, 0, 0, .5);
	background-repeat : no-repeat;
	background-position : center;
     -webkit-transition: all .5s ease; 
	z-index: 1000;
	display: none;
} 

</style>
<body>
<div id="loading"></div>
	<!-- WRAPPER START -->
	<div id="wrapper">
		<!-- Container Start -->
		<div class="container">
			<!-- Header -->
			<%@ include file="include/headers.jsp" %>
			<!-- Header End -->

			<div class="clear"></div>

			<!-- Top-nav -->
			
			<!-- Top-nav End -->

			<div class="clear"></div>

			<!-- Main data -->
			<div id="main">
				<div class="mid-data-container">
					<!-- top heading start -->
					<!-- <div class="pat-head">
						<h1>Feedback Form</h1>
					</div> -->
					<!-- top heading end -->

					<div class="clear"></div>

					<!-- Breadcrumb Start
					<div id="breadcrumb-holder">
						<a href='index.html'>Home</a> > <a href='pat.html.html'>Proposal Assistance Team</a> > Request Proposal Development
					</div>
				Breadcrumb End -->

					<!-- body data Start -->
					<div class="data-holder">
						<div class="form-holder">

							
<form action="/ProposalServlet" method="POST" id="insertForm" name = "insertForm"
								class="form-pat">
<!-- <div class="leftfield"> -->
<h1>Feedback Form</h1>
								<fieldset>
									<legend>Contact Information</legend>
<input type="hidden" id="khubPageId"	name="khubPageId" value="feedBackPage" />
									
										<label> <span>Your Name<span class="required">*</span></span>
											<input id="contactName" type="text" name="contactName" value=""
											placeholder="" />
										</label>
									
									<label> <span>E-mail Address<span class="required">*</span></span>
											<input id="contactEmail" type="text" name="contactEmail" value="<%=userdtl.getEmail() %>" readonly="readonly"
											placeholder="" />
										</label>
									</fieldset>
									<fieldset>
									<legend>General Impression</legend>
									
										<label> <span>Please let us know your overall impression of the site: </span></label>
											<select name="impressionType" id="impressionType" style=" width: 100%">
											<option value="">Please Select</option>
												<option value="Positive">Positive</option>
												<option value="Neutral">Neutral</option>
												<option value="Negative">Negative</option>

										</select>
										
										</fieldset>
									<fieldset>
									<legend>Problem Report</legend>
									
										<label> <span>If you are referring to specific page, Please provide the exact URL:</span></label>
											<input id="problemURL" type="text" name="problemURL" value=""
											placeholder="" />
										
									
										<label> <span>Write you question or Comment below:<span class="required">*</span></span>			</label>
											<textarea id="comments"  name="comments" value=""
											placeholder="" ></textarea>
							
									

								</fieldset>
								<!-- </div> -->
							<label> <span>&nbsp;</span> <input type="button"
								class="button" value="Submit" onclick="callSubmit();">&nbsp;&nbsp;
								
							</label>
</form>


							

						</div>

					</div>
					<!-- body data End -->
				</div>

			</div>
			<!-- Main data End -->

			<div class="clear"></div>

			<!-- Footer Bottom -->
			<div id="footer-bottom">
				<div class="leftshell">Copyright 2015. GBS Knowledge Hub.</div>
				<div class="rightshell">
					<ul>
						<li><a href="#">Terms of Use</a></li>
						<li><a href="#">Feedback</a></li>
						<li><a href="#">Help</a></li>
						<li style="border-right: none;"><a href="#">Contact Us</a></li>
					</ul>
				</div>
			</div>
			<!-- Footer Bottom End -->

		</div>
		<!-- Container End -->
	</div>
	<!-- WRAPPER END -->







</body>
</html>