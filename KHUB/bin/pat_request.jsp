<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=0" />
<meta http-equiv="Content-Type" content="text/html;charset=windows-1252">

<meta http-equiv="content-type" content="text/html;charset=utf-8" />

<title>Request Proposal Development</title>


<link rel="stylesheet" href="css/master.css" type="text/css" media="all" />
<link rel="stylesheet" href="css/styles.css" type="text/css" media="all" />

<link rel="stylesheet" href="css/new-topnav.css" media="screen">

<link rel="stylesheet" href="css/form-styles-v3.css" media="screen">
<link href="http://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet">
      <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
      <script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>

<script type="text/javascript" src="js/datetimepicker.js"></script>		
<script type="text/javascript" src="js/service_sector_pat.js"></script>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>



<script>
		$(document).ready(function(){
			$("input[type='text']").val("");
			$("#Comment").val("");
			$("#ijk").html("");
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
							$("#ijk").html("Email does not exist");
						}
					}
				});
			}); */
			
			$.ajax({
				url : 'service_request_data',
				type : 'GET',
				dataType: "json",
				//data: "oppno="+$("#oppno").val(),
				success: function(data){
					
					
					$("#Email").val(data.email);
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
					
					
					var serv_arr = data.srvlist;
					var serv_dd = "<option value=''>Please Select</option>";		
					
					
					$.each(serv_arr, function(i, val){
						serv_dd += "<option value='"+val+"'>"+val+"</option>";
					});
					
					
					
					
					
					var sector_arr = ["Public","Industrial","Distribution","Financial Services","Communications","UNASSIGNED"];
					//	alert(sector_arr);
						var sector_dd ="<option value=''>Please Select</option>";;
						
						$.each(sector_arr, function(i, val){
							sector_dd += "<option value='"+val+"'>"+val+"</option>";
						});
						
						
						var geo_arr = ["APAC","Nordic","Europe","MEA","NA"];
						//	alert(sector_arr);
							var geo_add ="<option value=''>Please Select</option>";;
							
							$.each(geo_arr, function(i, val){
								geo_add += "<option value='"+val+"'>"+val+"</option>";
							});
						
						
						
						
					
				//	$(".note").html("");
					
					
					$(".country").html("<label><span>Country<span class='required'>*</span></span><select id='Country'  name='cntry' onchange='valueChange()'>"+country_dd+"</select></label>");
					$("#Country").val(data.country_code.ccode);
					//alert(data.country_code.ccode);
					$(".industry").html("<label><span>Industry<span class='required'>*</span></span><select id='Industry' name='inds'>"+industry_dd+"</select></label>");
					$(".sector").html("<label><span>Sector<span class='required'>*</span></span><select id='Sctr' name='sctr'>"+sector_dd+"</select></label>");
					$(".geography").html("<label><span>Geo<span class='required'>*</span></span><select id='Geo' name='geo'>"+geo_add+"</select></label>");
					$("#Geo").val(data.country_code.gcode);
					$(".service").html("<label><span>Primary Service Area<span class='required'>*</span></span><select id='Service' name='psl'>"+serv_dd+"</select></label>");	
					$("#spinner").html("");
					$(".opp_details input[type='text']").removeAttr("readonly");
				/* 	$("#Comment").removeAttr("disabled"); */
					$("#Comment").removeAttr("readonly");
														
				
			
				

	

},	


error: function() {
      alert("Data Error. Data not found . Please Enter the correct search key");
}
});

			
			/* $("#search").on("click", function(){ */
				
				//$("#loader").css("display","block");
			
				/* if($("#oppno").val()=="TBD") { */
					//Ajax call
					
					
					/* 
					$("#spinner").html("<img src='images/ajax-load.gif' style='width: 20px; height: 20px;'>"); */
					/* $.ajax({
						url : 'dbcon',
						type : 'POST',
						dataType: "json",
						data: "oppno="+$("#oppno").val(),
						success: function(data){
							//alert(data.geoloc);
							
							var country_arr = data.cntrylist;
							var country_dd = "";							
							
							$.each(country_arr, function(i, val){
								country_dd += "<option>"+val+"</option>";
							});
							
							var industry_arr = data.indslist;
							var industry_dd = "";							
							
							$.each(industry_arr, function(i, val){
								industry_dd += "<option>"+val+"</option>";
							});
							
							var sector_arr = ["Public","Industrial","Distribution","Financial Services","Communications","UNASSIGNED"];
							//	alert(sector_arr);
								var sector_dd = "";
								
								$.each(sector_arr, function(i, val){
									sector_dd += "<option>"+val+"</option>";
								});
							
							$(".note").html("");
							
							
							$(".country").html("<label><span>Country</span><select id='Country'  name='cntry'>"+country_dd+"</select></label>");
							$(".industry").html("<label><span>Industry</span><select id='Industry' name='inds'>"+industry_dd+"</select></label>");
							$(".sector").html("<label><span>Sector</span><select id='Sctr' name='sctr'>"+sector_dd+"</select></label>");								
							$("#spinner").html("");
							$(".opp_details input[type='text']").removeAttr("readonly");
						/* 	$("#Comment").removeAttr("disabled"); */
						//	$("#Comment").removeAttr("readonly");
							
						//},
						//error: function() {
					  //        alert("Data Error. Try again please with the correct opportunity Number!");
					        
						//}
					
					//});
					
				 
					
				//} 
				
				
		/* 		
				else {
					$("#spinner").html("<img src='images/ajax-load.gif' style='width: 20px; height: 20px;'>");
					$.ajax({
						url : 'dbcon',
						type : 'POST',
						dataType: "json",
						data: "oppno="+$("#oppno").val(),
						success: function(data){
							//alert(data.geoloc);
							
							if(data.geoloc) {
							
								
								//alert(data.oDesc);
								$("#Geo").val(data.geoloc);
								$("#Region").val(data.regn);
								$("#Country").val(data.cntry);
								$("#Sctr").val(data.sctr);
								$("#Industry").val(data.inds);
								$("#clnt").val(data.clntName);
								$("#oname").val(data.opName);
								$("#Comment").val(data.oDesc);
								$("#Owner").val(data.owner);
								$("#Total").val(data.gbs1);
							
																	
								$("#spinner").html("");	
								$(".note").html("");
								$(".opp_details input[type='text']").removeAttr("readonly");
							} else {
								//alert("No data found");
								$("#spinner").html("");	
								$(".note").html("No data found");
							}
							
							
						},
						error: function() {
					          alert("Data Error. Try again.. please with the correct opportunity Number!");
					        
						}
					
					});
				} */
			//});
			
		});
		
		
		
	</script>
	
	
	<script>
	function valueChange(){
		
		$.ajax({
			url :'/filtergeo',
			type : 'POST',
			dataType: "json",
			data: {
			
			txtcntry :$.trim($("#Country :selected").val().trim())
			
			},
			success: function(resp){
			//alert(resp);
			$("#Geo").val(resp.geoname);
			
			}
			
		});
		
		
		
		
		
	}
	
	
	</script>
	
	
	
	
	
	
	
	
	
	
	
	<style>
	.button1
	{
	
 width: 80px;
 height: 30px;
 cursor: pointer;
	}
	</style>
	
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
					<h1>Proposal Hub - Request Proposal Development</h1>
				</div> -->
				<!-- top heading end -->
				
				<div class="clear"></div>
				
				<!-- Breadcrumb Start -->
					<div id="breadcrumb-holder_form">
						<a href='index.jsp'>Home</a> > Request Proposal Development
					</div>
				<!-- Breadcrumb End -->
				
				<!-- body data Start -->
				<div class="data-holder">
					<div class="form-holder">
					
						<form action="request" method="post" name="patreq" class="form-pat"  onsubmit="return validatesectorForm()">
							
							<h1>Proposal Hub Request 
							<span>Please fill up the Request Details section (<span class="required">*</span> indicates mandatory fields)</span>
							
							</h1>
							
							<!-- <label>
								<span>Opportunity Number </span>&nbsp;
								<input style="width: 20%" id="oppno" type="text" name="oppno" placeholder="" />
								&nbsp;
								<input type="button" class="button" id="search" value="Lookup"  />
								<div id="spinner"></div>
							</label> -->
							<label class="note">Please use <i>TBD </i> if Opportunity Number is not available</label>
							
							<font color='red'> <div id="ijk"> </div> </font><br/>	  
								
							<fieldset class="opp_details">
								<legend>Opportunity Details:</legend>
								
							
							
							
							
					<!-- 		<div class="leftfield">
									<label>
									<span>Opportunity Number </span>&nbsp;
									<input  id="oppno" type="text" name="oppno" placeholder="" />
								
									</label>
								</div> -->
							
							
								
								<div class="leftfield">
									<label>
									<span>Opportunity Number<span class="required">*</span> </span>&nbsp;
									<input  id="oppno" type="text" name="oppno" placeholder="" />
								
									</label>
								</div>
								
								<div class="rightfield">
									<label>
									<span>Region</span>
									<input id="Region" type="text" name="reg" placeholder="" readonly />
									</label>
								</div>
								
								<div class="leftfield country">
									<label>
									<span>Country<span class="required">*</span></span>&nbsp;
									<input  id="Country" type="text" name="cntry" placeholder="" readonly />
									</label>
								</div>
								
								
									<div class="rightfield geography">
									<label>
									<span>Geo<span class="required">*</span></span>
									<input  id="Geo" type="text" name="geo" placeholder="" readonly />
									</label>
								</div>
								
								
								
								
								
								
								
								
								<div class="leftfield sector">
									<label>
									<span>Sector<span class="required">*</span></span>&nbsp;
									<input  id="Sctr" type="text" name="sctr"  placeholder="" readonly />
									</label>
								</div>
								<div class="rightfield industry">
									<label>
									<span>Industry<span class="required">*</span></span>&nbsp;
									<input  id="Industry" type="text" name="inds" placeholder="" readonly />
									</label>
								</div>
								
								<div class="leftfield">
									<label>
									<span>Client Name<span class="required">*</span></span>
									<input  id="clnt" type="text" name="clntnm" placeholder="" readonly />
									</label>
								</div>
								<br/>
								<div class="leftfield">
									<label>
									<span>Opportunity Name<span class="required">*</span></span>
									<input  id="oname" type="text" name="oppname" placeholder="" readonly />
									</label>
								</div>
								
								<div class="fullfield">
									<label>
									<span>Request Description<span class="required">*</span></span>
									<textarea  id="Comment" name="comment" placeholder="" readonly></textarea>
									</label>
								</div>
								
								<div class="leftfield service">
									<label>
									<span>Primary Service Area<span class="required">*</span></span>
									<input  id="Service" type="text" name="psl" placeholder="" readonly />
									</label>
								</div>
								
								<div class="rightfield">
									<label>
									<span>Primary Offering Area</span>
									<input  id="Offering" type="text" name="ofa" placeholder="" readonly />
									</label>
								</div>
								
								<div class="leftfield">
									<label>
									<span>Total GBS TCV (USD,M)</span>
									<input  id="Total" type="text" name="gbs" placeholder="" readonly />
									</label>
								</div>
								
								<div class="rightfield">
									<label>
									<span>Opportunity Owner (Intranet id)</span>
									<input  id="Owner" type="text" name="oppown" placeholder="" readonly />
									</label>
								</div>
								
							</fieldset>
							
							
							<fieldset>
								<legend>Request Details</legend>
								
								<div class="leftfield">
									<label>
									<span>Request Date<span class="required">*</span></span><input id="demo1" type="text" name="reqstdate" style="width: 290px;"><a href="javascript:NewCal('demo1')"><img src="images/cal.gif" width="16" height="16" border="0"></a>

									</label>
								</div>
								
								<div class="rightfield">
									<label>
									<span>Requestor (Intranet id) <span class="required">*</span></span>
									<input id="Email" type="text" name="rqstr" placeholder="" />
									</label>
								</div>
								
								<div class="leftfield">
									<label>
									<span>Type of Proposal <span class="required">*</span></span>
									<select name="typpro" id="prop">
										<option value="AMS" selected>AMS</option>
										<option value="ADS">CRM</option>
										<option value="CS">PEGA</option>
										<option value="GPS">GPS</option>
										<option value="OTHERS">OTHERS</option>
									</select>
									</label>
								</div>
								
								<div class="rightfield">
									<label>
									<span>Contract Type</span>
									<input name="cntrtyp" id="ctrct" type="text" placeholder=""/>
									</label>
								</div>
								
								<div class="leftfield">
									<label>
									<span>Incumbent</span>
									<input id="Incumbent" type="text" name="inc" placeholder="" />
									</label>
								</div>
								
								<div class="rightfield">
									<label>
									<span>Main Competition</span>
									<input id="Competition" type="text" name="mncomp" placeholder="" />
									</label>
								</div>
								
								<div class="leftfield">
									<label>
									<span>Other Competitors</span>
									<input id="Competitors" type="text" name="othcomp" placeholder="" />
									</label>
								</div>
								
								<div class="rightfield">
									<label>
									<span>Required Start Date</span>
									<input id="demo5" type="text" name="stdate" style="width: 290px;"><a href="javascript:NewCal('demo5')"><img src="images/cal.gif" width="16" height="16" border="0"></a>

									</label>
								</div>
								
								<div class="fullfield">
									<label>
									<span>Competitive Strategy Summary</span>
									<textarea id="csc" name="summ" placeholder=""></textarea>
									</label>
								</div>
								
								<div class="leftfield">
									<label>
									<span>Date this Proposal is Due from Proposal Hub<span class="required">*</span></span>
									<input id="demo6" type="text"  name="pdp" style="width: 290px;"><a href="javascript:NewCal('demo6')"><img src="images/cal.gif" width="16" height="16" border="0"></a>

									</label>
								</div>
								
								<div class="rightfield">
									<label>
									<span>Date this Proposal is Due to Customer<span class="required">*</span></span><input id="demo7" type="text" name="pdc" style="width: 290px;"><a href="javascript:NewCal('demo7')"><img src="images/cal.gif" width="16" height="16" border="0"></a>

									</label>
								</div>
								
								<div class="fullfield">
									<label>
									<span>Comments or Additional Requirements</span>
									<textarea id="Additional Comment" name="add" placeholder=""></textarea>
									</label>
								</div>
								
							</fieldset>
							
							<label>
								<span>&nbsp;</span> 
								<input type="submit" class="button" value="Submit" />&nbsp;&nbsp;
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
        <%@ include file="include/footer.jsp" %>
		<!-- Footer Bottom End -->
		
		
	</div>
	<!-- Container End -->
</div>				
<!-- WRAPPER END -->







</body>
</html>