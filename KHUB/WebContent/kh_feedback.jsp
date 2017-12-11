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


<link rel="stylesheet" href="css/form-styles.css" media="screen">
<script type="text/javascript" src="js/feedback_validation.js"></script>


</head>

<body>
	<!-- WRAPPER START -->
	<div id="wrapper">
		<!-- Container Start -->
		<div class="container">
			<!-- Header -->
			<!-- Header file headers is included here  -->
				<%@ include file="include/headers.jsp" %>
			<!-- Header End -->




			<div class="clear"></div>

			<!-- Top-nav -->
			<%-- <%@ include file="include/topnav.jsp"%> --%>
			<!-- Top-nav End -->

			<div class="clear"></div>

			<!-- Main data -->
			<div id="main">
				<div class="mid-data-container">
					<!-- top heading start -->
					<div class="pat-head">
						<h1>KH - Feedback</h1>
					</div>
					<!-- top heading end -->

					<div class="clear"></div>

					<!-- body data Start -->
					<div class="data-holder">
						<!-- Breadcrumb Start 
					<div id="breadcrumb-holder">
						<a href='index.html'>Home</a> > Know Us
					</div>
					<!-- Breadcrumb End -->

						<div class="form-holder">


							<form action="feedback" method="post" name="fedb"
								class="pat-form" onsubmit="return verifyFeedback()">



								<h1>
									KH Feedback Form <span>Please fill all the texts in the
										fields.</span>
								</h1>

								<font color='red'>
									<div id="feed"></div>
								</font>

								<!--- 1st part starts here--->

								<div class="abc">

									<label> <span>Your Name <span class="required">*</span>
											:
									</span> <input id="uname" type="text" name="txtname" padding-left="9px"
										placeholder="Enter Your Name" />
									</label> <label> <span>Lotus Notes ID <span
											class="required">*</span> :
									</span> <input id="notes" type="text" name="notes"
										placeholder="Enter Lotus ID" />
									</label>


								</div>




								<!--- 1st part ends here--->


								<div class="clear"></div>





								<!---2nd part starts here with the div def--->

								<div class="def">
									<fieldset>

										<legend>
											<span class="required">* </span>Please rate the following
											questions (5-Exellent, 1-Poor)
										</legend>



										<div class="leftfield">
											<label> <span>1.&nbsp;How satisfied are you
													with the KH &nbsp;&nbsp;Content (Beta Version)<span
													class="required">*</span>
											</span>

											</label>

										</div>




										<div class="leftfield">

											<span> <input type="radio" id="satid" name="txtsat"
												value="5">5
											</span> <span> <input type="radio" id="satid" name="txtsat"
												value="4">4
											</span> <span><input type="radio" id="satid" name="txtsat"
												value="3">3 
											</span> <span><input type="radio"
												id="satid" name="txtsat" value="2">2 
												</span> <span><input
												type="radio" id="satid" name="txtsat" value="1">1 </span>


										</div>


										<div class="clear"></div>


										<div class="newfield">

											<label> <span>Remarks/Notes
											</span>

											</label>


										</div>

										<div class="fullfield">

											<textarea name="txtsatsfld" id="satsf"></textarea>
										</div>


										<div class="leftfield">

											<label> <span>2.&nbsp;How do You rate the KH
													for Content<span class="required">*</span>
											</span>

											</label>


										</div>



										<div class="leftfield">

											<span> <input type="radio" id="rad1" name="txtrado"
												value="5">5
											</span> <span> <input type="radio" id="rad2" name="txtrado"
												value="4">4
											</span> <span> <input type="radio" id="rad3" name="txtrado"
												value="3">3
											</span> <span> <input type="radio" id="rad4" name="txtrado"
												value="2">2
											</span> <span> <input type="radio" id="rad5" name="txtrado"
												value="1">1
											</span>



										</div>


										<div class="clear"></div>


										<div class="newfield">

											<label> <span>Remarks/Notes
											</span>

											</label>


										</div>

										<div class="fullfield">

											<textarea name="txtrate" id="idrate"></textarea>
										</div>


										<div class="leftfield">

											<label> <span>3.&nbsp;How do you rate the KH
													in terms of usability/navigation?<span class="required">*</span>
											</span>

											</label>



										</div>


										<div class="leftfield">

											<span> <input type="radio" id="nav1" name="txtnav"
												value="5">5
											</span> <span> <input type="radio" id="nav2" name="txtnav"
												value="4">4
											</span> <span> <input type="radio" id="nav3" name="txtnav"
												value="3">3
											</span> <span> <input type="radio" id="nav4" name="txtnav"
												value="2">2
											</span> <span> <input type="radio" id="nav5" name="txtnav"
												value="1">1
											</span>



										</div>


										<div class="newfield">

											<label> <span>Remarks/Notes
											</span>

											</label>


										</div>

										<div class="fullfield">

											<textarea name="txtnavs" id="idnav"></textarea>
										</div>

										<div class="leftfield">
											<label> <span>4.&nbsp;How do you rate the KH
													in terms of Look & Feel<span class="required">*</span>
											</span>

											</label>


										</div>


										<div class="leftfield">

											<span> <input type="radio" id="lkid" name="txtlk"
												value="5">5
											</span> <span> <input type="radio" id="lkid1" name="txtlk"
												value="4">4
											</span> <span> <input type="radio" id="lkid2" name="txtlk"
												value="3">3
											</span> <span> <input type="radio" id="lkid3" name="txtlk"
												value="2">2
											</span> <span> <input type="radio" id="lkid3" name="txtlk"
												value="1">1
											</span>



										</div>


										<div class="newfield">

											<label> <span>Remarks/Notes
											</span>

											</label>


										</div>

										<div class="fullfield">

											<textarea name="txtapp" id="idapp"></textarea>
										</div>


										<div class="leftfield">
											<label> <span>5.&nbsp;What are your
													recommendations to improve
											</span>

											</label>



										</div>


										<div class="fullfield">

											<textarea name="txtrecom" id="idrecom">
								   
								    </textarea>
										</div>
										<div class="leftfield">
											<label> <span>6.&nbsp;What else would you like
													to see in KH?</span>

											</label>



										</div>



										<div class="fullfield">

											<textarea name="txtuser" id="iduser"></textarea>
										</div>
										<div class="leftfield">
											<label> <span>7.&nbsp;Would you like to submit
													ICAP into KH
											</span>

											</label>



										</div>



										<div class="fullfield">

											<textarea name="txticap" id="idicap"></textarea>
										</div>


										<div class="leftfield">
											<label> <span>8.&nbsp;How often you visit KH?<span
													class="required">*</span></span>

											</label>


										</div>


										<div class="leftfield">

											<span> <input type="radio" id="ra1" name="txtradon"
												value="5">5
											</span> <span> <input type="radio" id="ra2" name="txtradon"
												value="4">4
											</span> <span> <input type="radio" id="ra3" name="txtradon"
												value="3">3
											</span> <span> <input type="radio" id="ra4" name="txtradon"
												value="2">2
											</span> <span> <input type="radio" id="ra5" name="txtradon"
												value="1">1
											</span>



										</div>



										<div class="clear"></div>

										<div class="newfield">

											<label> <span>Remarks/Notes
											</span>

											</label>

										</div>

										<div class="fullfield">

											<textarea name="txtvisit" id="idvisit"></textarea>
										</div>



										<div class="leftfield">

											<label> <span>9.&nbsp;Any specific feedback
													for something you liked<span class="required">*</span>
											</span>

											</label>
										</div>

										<div class="fullfield">

											<textarea name="txtspfed" id="idsp"></textarea>
										</div>








										<div class="leftfield">


											<label> <span>10.&nbsp;Any specific feedback
													for something you did not like<span class="required">*</span>
											</span>

											</label>

										</div>


										<div class="fullfield">

											<textarea name="txtsomfed" id="idsomfed"></textarea>
										</div>





									</fieldset>

             

									<span>&nbsp;</span> <input type="submit" class="button"
										value="Submit" />&nbsp;&nbsp; <input type="reset"
										class="button" value="Reset" />

								</div>
							</form>


						</div>

					</div>
					<!-- body data End -->
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