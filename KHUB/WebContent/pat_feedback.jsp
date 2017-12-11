<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=0" />
<meta http-equiv="Content-Type" content="text/html;charset=windows-1252">

<meta http-equiv="content-type" content="text/html;charset=utf-8" />

<title>Request Proposal Development</title>


<link rel="stylesheet" href="css/master.css" type="text/css" media="all" />
<link rel="stylesheet" href="css/styles.css" type="text/css" media="all" />

<link rel="stylesheet" href="css/new-topnav.css" media="screen">

<link rel="stylesheet" href="css/form-styles-v4.css" media="screen">
<link rel="stylesheet" href="css/form-styles.css" media="screen">
<script type="text/javascript" src="js/pfeedback.js"></script>

	
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
		<%-- <%@ include file="include/topnav.jsp" %> --%>
		<!-- Top-nav End -->
		
		<div class="clear"></div>
		
		<!-- Main data -->
		<div id="main">
			<div class="mid-data-container">
				<!-- top heading start -->
				<div class="pat-head">
					<h1>PAT - Feedback </h1>
				</div>
				<!-- top heading end -->
				
				<div class="clear"></div>
				
				<!-- body data Start -->

					
						<!-- Breadcrumb Start -->
					<div id="breadcrumb-holder">
						<a href='index.jsp'>Home</a> > <a href='pat_feedback.jsp'> Proposal Assistance Team</a> > PAT Feedback
					</div>
				<!-- Breadcrumb End -->

					


				<div class="data-holder">
					
					
					<div class="form-holder">
					
					
						<form action="PatFeedback" method="post"  name="pback" class="pat-form" onsubmit="return verifyPat()">
						
							<h1>PAT Feedback Form
							<span>Please fill all the texts in the fields.</span>
							</h1>

							
							<font color='red'>
									<div id="fed"></div>
								</font>
							
							
							<label>
								<span>Opportunity Number <span style="color: red;">*</span> :</span>
								<input id="oppnumb" type="text" name="txtoppno" placeholder="" />
							</label>

							<label>
								<span>Opportunity Name <span style="color: red;">*</span> :</span>
								<input id="oppnm" type="text" name="txtoppname" placeholder="" />
							</label>

							<label>
								<span>Feedback Submitter Name <span style="color: red;">*</span> :</span>
								<input id="submitr" type="text" name="txtsubmitter" placeholder="" />
							</label>
							

							<label>
								<span>Feedback Submitter LN ID <span style="color: red;">*</span> :</span>
								<input id="sid" type="text" name="txtsubid" placeholder=""/>
							</label>


							
							
						<div class="clear"></div>	


						    <div class="def">
								<fieldset>

						
										<legend>
											<span class="required">* </span>Please rate the following
											questions (5-Exellent, 1-Poor)
										</legend>
							
						
							
										<div class="leftfield">
											<label> <span>1.&nbsp;Overall Satisfaction Level<span
													class="required">*</span>
											</span>

											</label>

										</div>




										<div class="leftfield">

											<span><input type="radio" id="satlvl" name="txtslvl"
												value="5" >5</span>
												 <span> <input
												type="radio" id="satlvl" name="txtslvl" value="4">4
											</span>
											 <span><input type="radio" id="satlvl" name="txtslvl" value="3">3</span>

											<span><input type="radio" id="satlvl" name="txtslvl" value="2">2</span>

											<span><input type="radio" id="satlvl" name="txtslvl" value="1">1</span>


										</div>


										<div class="clear"></div>




										<div class="leftfield">

											<label> <span>2.&nbsp;Quality Of Proposal/documents<span class="required">*</span>
											</span>

											</label>


										</div>



										<div class="leftfield">

											<span><input type="radio" id="qap" name="txtprop"
												value="5" >5</span> 
												<span> <input
												type="radio" id="qap" name="txtprop" value="4">4
											</span>
											 <span><input type="radio" id="qap" name="txtprop" value="3">3</span>


											<span><input type="radio" id="qap" name="txtprop" value="2">2</span>


											<span><input type="radio" id="qap" name="txtprop" value="1">1</span>



										</div>


										<div class="clear"></div>


										
										<div class="leftfield">

											<label> <span>3.&nbsp;Submitted proposal on Time<span class="required">*</span>
											</span>

											</label>



										</div>


										<div class="leftfield">

											<span><input type="radio" id="subid" name="txttime"
												value="5" >5</span>
												 <span> <input
												type="radio" id="subid" name="txttime" value="4">4
											</span> 
											<span><input type="radio" id="subid" name="txttime" value="3">3</span>


											<span><input type="radio" id="subid" name="txttime" value="2">2</span>


											<span><input type="radio" id="subid" name="txttime" value="1">1</span>


										</div>

										<div class="clear"></div>
										

										<div class="leftfield">
											<label> <span>4.&nbsp;Responsiveness of Team<span class="required">*</span>
											</span>

											</label>


										</div>


										


										<div class="leftfield">
											<span><input type="radio" id="resid" name="txtresp"
												value="5" > 5</span>
												 <span>
												  <input type="radio" id="resid" name="txtresp" value="4">4
											</span>
											 <span>
											 <input type="radio" id="resid" name="txtresp" value="3">3</span>
											<span><input type="radio" id="resid" name="txtresp" value="2">2</span>
											 <span><input type="radio" id="resid" name="txtresp" value="1">1</span>
											


										</div>


										<div class="clear"></div>


										




										<div class="leftfield">

											<label> <span>5.&nbsp;Any specific feedback
													for something you liked<span class="required">*</span>
											</span>

											</label>
										</div>

										<div class="fullfield">

											<textarea id= "fdblk" name="txtfdb"></textarea>
										</div>




										<div class="clear"></div>



										<div class="leftfield">


											<label> <span>6.&nbsp;Any specific feedback
													for something you did not like<span class="required">*</span>
											</span>

											</label>

										</div>


										<div class="fullfield">

											<textarea id="fdndl" name="txtfdn"></textarea>
										</div>





									</fieldset></div>

							<div class="ijk">

								<span>&nbsp;</span> 
								<input type="submit" class="button" value="Submit" />&nbsp;&nbsp;
								<input type="reset" class="button" value="Reset" />

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
        	<%@ include file="include/footer.jsp" %>
		<!-- Footer Bottom End -->
		
	</div>
	<!-- Container End -->
</div>				
<!-- WRAPPER END -->







</body>
</html>