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
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>

<link rel="stylesheet" href="css/new-topnav.css" media="screen">

<link rel="stylesheet" href="css/form-styles-v3.css" media="screen">

<script type="text/javascript" src="js/datetimepicker.js"></script>	

 <script type="text/javascript" src="js/service_sector.js"></script>	 

	<script>
$(document).ready(function(){
	//alert("hi");
	
	$("input[type='text']").val("");
	$("#Additional_Comment").val("");
	
	
	
	$.ajax({
						url : 'service_request_data',
						type : 'GET',
						dataType: "json",
						//data: "oppno="+$("#oppno").val(),
						success: function(data){
							//alert(data);
							
							var country_arr = data.cntrylist;
							var country_dd = "<option value=''>Please Select</option>";							
							
							$.each(country_arr, function(i, val){
								country_dd += "<option value='"+val+"'>"+val+"</option>";
							});
							
							var industry_arr = data.indslist;
							var industry_dd = "<option value=''>Please Select</option>";							
							
							$.each(industry_arr, function(i, val){
								industry_dd += "<option value='"+val+"'>"+val+"</option>";
							});
							
							/* email_rr = data.email; */
							
						$(".country").html("<label><span>Country</span><select id='Region'  name='txtloc'>"+country_dd+"</select></label>");
							$(".industry").html("<label><span>Industry</span><select id='Industry' name='inds'>"+industry_dd+"</select></label>");
							
							$("#Email").val(data.email);
																
							$("#spinner").html("");
					
						
		
			
        
        },	
        
        
        error: function() {
	          alert("Data Error. Data not found . Please Enter the correct search key");
		}
	});


	
	
	
	/* $("#Email").on("blur", function(){
		$.ajax({
			url : 'Emailvalidation?email='+$("#Email").val(),
			contentType: "text/plain",
	         cache: false,
			success : function(responseText) {
				//alert(responseText);
				
				//jsonArr = JSON.parse(responseText);
				
				//console.log(jsonArr.length);
				
				if (responseText=="false"){
					$("#pik").html("Email does not exist");
				}
				
				if(responseText=="true")
					{
					$("#ijk").html("Email id validated successfully ..");
					}
			}
		});
	}); */
	
	
	
});
	

</script>



</head>

<body>
<!-- WRAPPER START -->
<div id="wrapper">
	<!-- Container Start -->
	<div class="container">
		<%@ include file="include/headers.jsp" %>
		<!-- Top-nav End -->
		
		<div class="clear"></div>
		
		
		
		<!-- Main data -->
		<div id="main">
			<div class="mid-data-container">
				<!-- top heading start -->
<!-- 				<div class="pat-head">
					<h1>KH-Service Request</h1>
				</div> -->
				<!-- top heading end -->
				
				<div class="clear"></div>
				
				<!-- Breadcrumb Start -->
					<div id="breadcrumb-holder_form">
						<a href='index.jsp'>Home</a> > KH-Service Request</a> 
					</div>
				<!-- Breadcrumb End -->
				
				<!-- body data Start -->
				<div class="data-holder">
					<div class="form-holder">
					
						<form action="register" method="post" name="regs" class="form-pat" onsubmit="return validatesectorForm()">
							
							<h1>KH-Service Request 
							
								
							</h1>
							    <font color='red'> <div id="pik"> </div> </font><br/>
							    <font color='red'> <div id="ijk"> </div> </font><br/>
							    
						<span><label class="note">Please use <i>TBD </i> if Opportunity Number is not available</label></span>
							<fieldset>
								<legend>Opportunity Details:</legend>
								
								<div class="leftfield" >
									<label>
									<span>Opportunity Siebel Number<span class="required">*</span></span>
									<input  id="Geo" type="text" name="txtOppNo" value="" placeholder="" />
									</label>
								</div>
								
								<div class="rightfield">
									<label>
									<span>Opportunity Name</span>
									<input  id="Region" type="text" name="txtOppName" placeholder="" />
									</label>
								</div>
								
								<div class="leftfield" >
									<label id="err">
									<span>Client Name</span>
									<input  id="Country" type="text" name="txtClient" value="" placeholder="" />
									<font color='red'> <div id="mne"> </div> </font></label>
								</div>
								
								<div class="rightfield country">
									<label>
									<span>Country</span>
									<input  id="Region" type="text" name="txtloc" placeholder="" />
									</label>
								</div>
								
								<div class="rightfield industry"><label>
									<span>Industry </span>
									<input  id="Industry" type="text" name="inds" placeholder="" enabled />

									</label>
								</div>
								
								<div class="leftfield">
									<label>
									<span>Sector</span><span class="required">*</span></span>
								<!-- 	<input  id="Regio" type="text" name="txtfcsarea" placeholder="" /> -->
									<select name="txtfcsarea" id="Regio">
										<option value="" selected>Please Select</option>
										<option value="Public">Public</option>
										<option value="Industrial">Industrial</option>
										<option value="Distribution">Distribution</option>
										<option value="Financial Services">Financial Services</option>
										<option value="Communications">Communications</option>
										<option value="UNASSIGNED">UNASSIGNED</option>
										
									</select>
									</label>
								</div>
								
								
							</fieldset>
							
							
							<fieldset>
								<legend>Request Details</legend>
								
								<div class="leftfield">
									
									<label>
									<span>KH Request Type</span><span class="required">*</span></span><select name="txtrqsttype" id="rqstt">
											<option value="" selected>Please Select</option>
										<option value="Competitor Insight">Competitor Insight</option>
										<option value="Capabilities">Capabilities</option>
										<option value="proposalinsert">proposal insert</option>
										<option value="Homepage">HomePage</option>
										<option value="Proposal">Proposal</option>
										
										
									</select>
									</label>
								</div>
								
								<div class="rightfield">
									
									<label>
									<span>Owner</span><span ></span><input id="rqstdfor" name="txtrqstdfor" type="text" placeholder=""/>
										
									</label>
								</div>
								
								
								
								
								
								
								<div class="leftfield">
									<label>
									
									<span>Competitors</span>
									<input id="Competition" type="text" name="txtmncomp" placeholder="" />
									</label>
								</div>
								<div class="rightfield request">
									<label>
									<span>Requested By</span>
									<input id="Email" type="text" name="txtrequestby"  placeholder=""></textarea>
									</label>
								</div>
								
								 <div class="fullfield"><label>
									<span>Request Description<span ></span></span>
									<!-- <input id="irel"  type="text" name="txtrltion" placeholder=""/> -->
										
										 	<textarea id="Additional_Comment"  name="txtrltion" placeholder=""></textarea>
									</label>
								</div> 
								
								<!-- <div class="leftfield">
									<label>
									<span>Other Competitors</span>
									<input id="Competitors" type="text" name="txtothcomp" placeholder="" />
									</label>
								</div> -->
								
								
								<div class="leftfield">
									<label>
									<span>Start Date </span>
								<input id="demo1" type="text" name="txtreqdate" style="width: 290px;"><a href="javascript:NewCal('demo1')"><img src="images/cal.gif" width="16" height="16" border="0"></a>
	  								
									</label>
								</div>
								
								<div class="rightfield">
							<!-- 	<label>
									<span>
										End Date<span class="required">*</span>
									</span>
									<input id="demo2" type="text" name="txtrfp" style="width: 290px;">
									<a href="javascript:NewCal('demo2')">
										<img src="images/cal.gif" width="16" height="16" border="0">
									</a>
	  								
									</label> -->
									
									<label>
									<span>
									Group
									</span>
									<select name="txtrfp" id="demo2">
										<option value="Leadership" selected>Leadership</option>
										<option value="PAT">PAT</option>
										<option value="Sales & delivery">Sales and Delivery</option>
										<option value="Solutioning">Solutioning</option>
										<option value="Storm A2">Storm A2</option>
										<option value="Storm A3">Storm A3</option>
										
									</select>	  								
									</label>
								</div>
								
								
								
								
																
							</fieldset>
							
							
							<label>
								<span>&nbsp;</span> 
								<input type="submit" class="button" value="Submit">&nbsp;&nbsp;
								<input type="reset" class="button" value="Reset" /> 
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