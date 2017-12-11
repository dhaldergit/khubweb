<%@page import="com.ibm.khub.pojo.UserDetails"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>

<html>
<head>
 
<title>Knowledge Hub</title>
<link rel="stylesheet" href="css/master.css" type="text/css" media="all" />
<link rel="stylesheet" href="css/styles.css" type="text/css" media="all" />

<link rel="stylesheet" href="css/new-topnav.css" media="screen">


<link rel="stylesheet" href="css/Jquery_modal_ui.css" media="screen">

<!-- THIS IS FOR CAROUSEL Start -->
<link rel="stylesheet" href="css/prism.css">
<link rel="stylesheet" href="css/stylesheet.css">
<link rel="stylesheet" href="css/carousel.css">
<!-- THIS IS FOR CAROUSEL End -->

<!-- THIS IS FOR JQUERY ACCORDION script Start-->
<script>
	document.documentElement.className = "js";
</script>
<script src="vendor/jquery-1.9.1.js"></script>
<script src="vendor/json2.js"></script>
<script src="src/jquery.collapse.js"></script>
<script src="src/jquery.collapse_storage.js"></script>
<script src="src/jquery.collapse_cookie_storage.js"></script>
<!-- THIS IS FOR JQUERY ACCORDION script end-->

<!-- THIS IS FOR CAROUSEL script start -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>

<script type="text/javascript" src="js/prism.js"></script>
<script type="text/javascript" src="js/simplycarousel.js"></script>
<script type="text/javascript" src="js/script2.js"></script>


<!-- THIS IS FOR JQUERY ACCORDION Start-->
<link rel="stylesheet" href="css/demo.css">
<!--THIS IS FOR JQUERY ACCORDION End -->
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$("#Carousel_Testimonials ul").each(function() {
			// Set the interval to be 10 seconds
			var t = setInterval(function() {
				$("#Carousel_Testimonials ul").animate({
					marginTop : -270
				}, 1000, function() {
					// This code runs after the animation completes
					$(this).find("li:last").after($(this).find("li:first"));
					// Now we've taken out the left-most list item, reset the margin
					$(this).css({
						marginTop : 10
					});
				})
			}, 15000);
		});
	});
</script>
<script type="text/javascript">
	$(document).ready(function() {

		$("#Carousel_Spotlight ul").each(function() {
			// Set the interval to be 10 seconds
			var t = setInterval(function() {
				$("#Carousel_Spotlight ul").animate({
					marginTop : -270
				}, 1000, function() {
					// This code runs after the animation completes
					$(this).find("li:last").after($(this).find("li:first"));
					// Now we've taken out the left-most list item, reset the margin
					$(this).css({
						marginTop : 10
					});
				})
			}, 15000);
		});
	});
</script>

<script>
	$(document)
			.ready(
					function() {
						
						$
								.ajax({
									type : 'POST',
									url : "/Home",

									contentType : "text/plain",
									cache : false,
									success : function(responseText) {
										jsonArr = JSON.parse(responseText);

										console.log(jsonArr.length);

										$(".a")
												.html(
														"<img width='310px' src='images/sales_1.png' />");
										$(".c")
												.html(
														"<img width='310px' src='images/pricing.png' />");
										$(".b")
												.html(
														"<img width='310px' src='images/competition_watch.png' />");
										$(".d")
												.html(
														"<img width='310px' src='images/what_done.png' />");

										for (var i = 0; i < jsonArr.length; i++) {

											var firstDate = new Date();
											var seconddate = jsonArr[i].date_published;
											var newDate = seconddate.split("-")[1]
													+ "/"
													+ seconddate.split("-")[0]
													+ "/"
													+ seconddate.split("-")[2];
											var dateParse = new Date(newDate);
											var dateDiff = (firstDate - dateParse)
													/ (1000 * 3600 * 24);

											if (jsonArr[i].category == "Sales Enabler"
													&& jsonArr[i].is_retired == "N") {
												if (Math.floor(dateDiff) < 7) {

													var data = "<br>"+"<img src='images/arrow-2.png' />"
															+ "<a target='_blank' class='custom_link' href='"+jsonArr[i].url+"'>"
															+ " "
															+ jsonArr[i].content_name
															+ "</a>"
															+ "<img src='images/icon-new.gif' />"
															+ "<br>";
													
													if (!(jsonArr[i].short_desc == undefined)) {

														data += 
																 jsonArr[i].short_desc +"<br>";
														$(".a").append(data);

													}

													else {

														$(".a").append(data);
													}

												}

												else {

													var data = "<br>"+"<img src='images/arrow-2.png' />"
															+ "<a target='_blank' class='custom_link' href='"+jsonArr[i].url+"'>"
															+ " "
															+ jsonArr[i].content_name
															+ "</a>" + "<br>";
													if (!(jsonArr[i].short_desc == undefined)) {

														data += jsonArr[i].short_desc
																+ "<br>";
														$(".a").append(data);
													}

													else {

														$(".a").append(data);

													}

												}

											}

											else if (jsonArr[i].category == "Competition Watch"
													&& jsonArr[i].is_retired == "N") {

												if (Math.floor(dateDiff) < 7) {

													var data = "<br>"+"<img src='images/arrow-2.png' />"
															+ "<a target='_blank' class='custom_link' href='"+jsonArr[i].url+"'>"
															+" "	
															+ jsonArr[i].content_name
															+ "</a>"
															+ "<img src='images/icon-new.gif' />"
															+ "<br>";

													if (!(jsonArr[i].short_desc == undefined)) {

														data += jsonArr[i].short_desc
																+ "<br>";
														$(".b").append(data);
													}
													
													else {

														$(".b").append(data);
													}

												}

												else {

													var data = "<br>"
															+ "<img src='images/arrow-2.png' />"
															+ "<a target='_blank' class='custom_link' href='"+jsonArr[i].url+"'>"
															+" "
															+ jsonArr[i].content_name
															+ "</a>" + "<br>";

													if (!(jsonArr[i].short_desc == undefined)) {

														data += jsonArr[i].short_desc
																+ "<br>";
														$(".b").append(data);
													}

													else {
														$(".b").append(data);
													}

												}

											}

											else if (jsonArr[i].category == "Pricing To Win"
													&& jsonArr[i].is_retired == "N") {

												if (Math.floor(dateDiff) < 7) {

													var data = "<br>"+"<img src='images/arrow-2.png' />"
															+ "<a target='_blank' class='custom_link' href='"+jsonArr[i].url+"'>"
															+ " "
															+ jsonArr[i].content_name
															+ "</a>"
															+ "<img src='images/icon-new.gif' />"
															+ "<br>";

													if (!(jsonArr[i].short_desc == undefined)) {

														data += jsonArr[i].short_desc + "<br>";
														$(".c").append(data)
													}
													else {

														$(".c").append(data)
													}

												}
												else {

													var data = "<br>"+"<img src='images/arrow-2.png' />"
															+ "<a target='_blank' class='custom_link' href='"+jsonArr[i].url+"'>"
															+ " "
															+ jsonArr[i].content_name
															+ "</a>" + "<br>";

													if (!(jsonArr[i].short_desc == undefined)) {

														data +=  jsonArr[i].short_desc +"<br>";
														$(".c").append(data);
													}

													else {

														$(".c").append(data);
													}
												}
											}
											else if (jsonArr[i].category == "What  We have done"
													&& jsonArr[i].is_retired == "N") {

												if (Math.floor(dateDiff) < 7) {
													var data = "<br>"+"<img src='images/arrow-2.png' />"
															+ "<a target='_blank' class='custom_link' href='"+jsonArr[i].url+"'>"
															+" "
															+ jsonArr[i].content_name
															+ "</a>"
															+ "<img src='images/icon-new.gif' />"
															+ "<br>";

													if (!(jsonArr[i].short_desc == undefined)) {
														data += jsonArr[i].short_desc
																+ "<br>";
														$(".d").append(data);
													}

													else {
														$(".d").append(data);

													}

												}

												else

												{

													var data = "<br>"+"<img src='images/arrow-2.png' />"
															+ "<a target='_blank' class='custom_link' href='"+jsonArr[i].url+"'>"
															+" "
															+ jsonArr[i].content_name
															+ "</a>" + "<br>";

													if (!(jsonArr[i].short_desc == undefined)) {
														data += jsonArr[i].short_desc
																+ "<br>";
														$(".d").append(data);
													}

													else {
														$(".d").append(data);
													}

												}


											}

											else if (jsonArr[i].category == "Latest From Market"
													&& jsonArr[i].is_retired == "N") {

												if (Math.floor(dateDiff) < 7) {
													var data = "<img src='images/arrow-2.png' />"
															+ "<a target='_blank' class='custom_link' href='"+jsonArr[i].url+"'>"
															+" "
															+ jsonArr[i].content_name
															+ "</a>"
															+ "<img src='images/icon-new.gif' />"
															+ "<br>" + "<br>";


												}

												else {

													var data = "<img src='images/arrow-2.png' />"
															+ "<a target='_blank' class='custom_link' href='"+jsonArr[i].url+"'>"
															+ jsonArr[i].content_name
															+ "</a>"
															+ "<br>"
															+ "<br>";


												}

												$(".g").append(data);
											}

											else if (jsonArr[i].category == "Latest From Industry"
													&& jsonArr[i].is_retired == "N") {

												if (Math.floor(dateDiff) < 7) {
													// var data = "<h4>RECENT CASE STUDIES</h4>";
													var data = "<img src='images/arrow-2.png' />"
															+ "<a target='_blank' class='custom_link' href='"+jsonArr[i].url+"'>"
															+" "
															+ jsonArr[i].content_name
															+ "</a>"
															+ "<img src='images/icon-new.gif' />"
															+ "<br>" + "<br>";
													
												} else {

													var data = "<img src='images/arrow-2.png' />"
															+ "<a target='_blank' class='custom_link' href='"+jsonArr[i].url+"'>"
															+" "
															+ jsonArr[i].content_name
															+ "</a>"
															+ "<br>"
															+ "<br>";													
												}
												$(".h").append(data);
											}
										}
									},

									error : function() {
										
									}
								});

					});
</script>



<script>
$(document)
.ready(
		function() {

			$
					.ajax({
						type : 'POST',
						url : "/Recent_Link",

						contentType : "text/plain",
						// dataType: "json",
						cache : false,
						success : function(response1) {
							 		   
							jsonArr = JSON.parse(response1);
							var data1 = "<img src='images/arrow-2.png' />"+"<i>Your most recently visited pages";
							$(".u").append(data1);
							for (var i = 0; i < jsonArr[0].length; i++) {
																
								var data = "<br>"
									+ "<img class ='blue_dot' src='images/bullet_blue_final.png' /><a class='custom_link' href='"+jsonArr[0][i].link_url+"'>"
									+jsonArr[0][i].pagedetail+"</a>"
									;
									
									$(".u").append(data);
							
							}
							
							var data2 ="<br>"+"<br>"+"<img src='images/arrow-2.png' />"+"<i>Your most recently searched keywords ";
							$(".u").append(data2);
							for (var j = 0; j < jsonArr[1].length; j++) {					
								
								var data3 = "<br>"
									+ "<img class ='blue_dot' src='images/bullet_blue_final.png' />" +"<a class='custom_link' href='"+jsonArr[1][j].key_url+"'>"
									+jsonArr[1][j].keydetail+"</a>"
									;
								$(".u").append(data3)	
							
							}
							
							},

						error : function() {
							//alert("Data Error. Data not found for the latest link..");
						}
					});
		
		});

</script>

<script>
	$(document)
			.ready(
					function() {
						//alert("hi");

						$
								.ajax({
									type : 'POST',
									url : "/PopularLink",

									contentType : "text/plain",
									// dataType: "text",
									cache : false,
									success : function(response) {
										// alert(response);		   
										jsonArr = JSON.parse(response);
										$("#record")
												.append(
														"<h5>TOP RATED LINKS FROM THE LAST 4 WEEKS</h5>");
										$(".e")
										.html(
												"<h3>Sales Enablers/ Pricing to Win</h3>");
										$(".f")
										.html(
												"<h3>Competition Watch/ What We've Done</h3>");
										$(".v")
										.html(
												"<h3>Latest from Market, CAMSS</h3>");
										$(".z")
										.html(
												"<h3>Latest from Industries, Service Lines</h3>");
										for (var i = 0; i < jsonArr.length; i++) {

											if (jsonArr[i].category == "Sales Enabler AND Pricing To Win"
													&& jsonArr[i].is_retired == "Y") {

												var data = "  "
														+ "<img src='images/arrow-2.png' />"
														+ "<a target='_blank' class='custom_link_past' href='"+jsonArr[i].url+"'>"
														+ jsonArr[i].content_name
														+ "</a>" + "<br>";
												$(".e").append(data);

											} else if (jsonArr[i].category == "Competition Watch AND What We have done"
													&& jsonArr[i].is_retired == "Y") {

												var data = "<img src='images/arrow-2.png' />"
														+ "<a target='_blank' class='custom_link_past' href='"+jsonArr[i].url+"'>"
														+ jsonArr[i].content_name
														+ "</a>" + "<br>";
											
												$(".f").append(data);

											}
											else if (jsonArr[i].category == "Latest From Market"
													&& jsonArr[i].is_retired == "Y") {

												var data = "<img src='images/arrow-2.png' />"
														+ "<a target='_blank' class='custom_link_past' href='"+jsonArr[i].url+"'>"
														+ jsonArr[i].content_name
														+ "</a>" + "<br>";
												//	  data+= "<a class='custom_link' href='"+jsonArr[i].link+"'>"+"<br>"+jsonArr[i].content_name+"</a>";
												// data += "<br>"+jsonArr[i].short_desc;

												$(".v").append(data);

											}
											else if (jsonArr[i].category == "Latest From Industry"
													&& jsonArr[i].is_retired == "Y") {

												var data = "<img src='images/arrow-2.png' />"
														+ "<a target='_blank' class='custom_link_past' href='"+jsonArr[i].url+"'>"
														+ jsonArr[i].content_name
														+ "</a>" + "<br>"; 

												$(".z").append(data);
											}
										}
									},
									error : function() {										
									}
								});
					});
</script>

<script>

$(document)
.ready(
		function() {

			$
					.ajax({
						type : 'POST',
						url : "/getTicker",

						contentType : "text/plain",
						//dataType: "json",
						cache : false,
						success : function(responseticker) {
							 //alert(responseticker);		   
							jsonArr = JSON.parse(responseticker);
							
							for (var i = 0; i < jsonArr.length; i++) {

								if (jsonArr[i].ticker_type == "spotlight"
										&& jsonArr[i].is_retired == "N") {

									// var data="<br>"
									var data = "  "
											+jsonArr[i].ticker_desc
											+ "<br>" ;
									$(".unordered").append("<li>"+data+"</li>");

								} 					

								else if(jsonArr[i].ticker_type == "testimonial"
									&& jsonArr[i].is_retired == "N")

								{							
									
									var data = "  "
										+jsonArr[i].ticker_desc
										+ "<br>" ;
								$(".unordered1").append("<li>"+data+"</li>");									
								}
							}
						},
						error : function() {							
						}
					});
		});
</script>

<script>
	$(document).ready(function() {

		 $("#txtsrchs").on("keypress", function(key){
			if(key.which==13){
				performClick();
			}
		}); 		
		
		 $("#submit").on("click", function(){
			performClick();
		}); 	
	});

	function performClick() {
		
		if ($("#txtsrchs").val() != "") {
		//	window.location = "/BoxElement.jsp?txtsrch=" + $("#txtsrchs").val()   ;
			window.location = "/search.jsp?txtsrch=" + $("#txtsrchs").val()   ;	
		}

		else if($("#txtsrchs").val() == ""){
			alert("Please enter a search key..")

		}	      
	}	
</script>

<script type="text/javascript">
//var feedback_status = "";
var feedbackstatus="";
var browsingstatus="";
var  respsession="";

console.log(respsession);
	function executeMe(){
	
	
		if( respsession=="Y"){			
			function getDate()
			{				 
			    var today = new Date();
			    var hr = today.getHours();
			    var mm = today.getMinutes();
			    var ss = today.getSeconds();
	
			  	if($("#todayDate").val()=="")
			  		$("#todayDate").val(ss);
			}
	
			//call getDate() when loading the page
			getDate();
					
			setTimeout(function(){
				var now = new Date();
				nowMin = now.getSeconds();
				console.log(">>Checking feedback status (IF) : "+feedbackstatus);
				if((feedbackstatus % 5) == 1)
						$(".portbox").load('/include/user_feedback.jsp').dialog({modal:true, width: '600', height: 'auto' , bottom:'1000px'});
						
			}, 5000);
		}
		
	 	else 
		{
			function getDate()
			{
				 
			    var today = new Date();
			    var hr = today.getHours();
			    var mm = today.getMinutes();
			    var ss = today.getSeconds();
			   
			  console.log("in the existing user block");
	
			  	if($("#todayDate").val()=="")
			  		$("#todayDate").val(ss);
			}
	
			//call getDate() when loading the page
			getDate();
	
			if(document.getElementById("sessionId").value=="")
				document.getElementById("sessionId").value = '<%=session.getId()%>';

			setTimeout(function() {
				var now = new Date();
				nowMin = now.getSeconds();

				console.log(">>Checking feedback status (ELSE) : "
						+ feedbackstatus);
			}, 2000);

		}
	}
</script>
<script>
	$(document).ready(function() {

		//alert("ajax calling");
		$.ajax({
			url : '/service_request_data',
			type : 'GET',
			dataType : "json",
			//data: "oppno="+$("#oppno").val(),
			success : function(data) {
				//	alert(data.email);

				$("#Email").val(data.email);
				$("#namedtl").val(data.name);

				//	$("#ID").val(data.id);
				$.ajax({
					url : '/validatesession',
					type : 'GET',
					dataType : "json",

					data : {
						//"emailid="+data.email,
						emailid : $("#Email").val(),
						namedtl : $("#namedtl").val()
					},
					//data: "emailid="+$("#Email").val(),
					success : function(response) {

						//	alert("Feedback status : "+response.feedback_status);
						feedbackstatus = response.feedback_status;
						browsingstatus = response.browsing_stat;

						$.ajax({
							url : '/Session',
							type : 'GET',
							dataType : "json",
							data : "emailid=" + $("#Email").val(),
							success : function(data) {

								console.log(respsession);
								//	alert(data.responsesession);

								respsession = data.responsesession;

								executeMe();

								$("#ID").val(response.id);
								$("#fstatus").val(response.feedback_status);
								console.log(response.feedback_status)
							
								if (response.feedback_status >= 0) {
									$.ajax({
										url : '/sessionunload',
										type : 'GET',
										dataType : "json",

										data : "emailid=" + $("#Email").val(),
										success : function(response1) {


										},
										error : function(xhr, status, error) {
											
										}
									});
								}
							},
						});
					},
					error : function(xhr, status, error) {
						console.log(xhr);
						console.log(status);
						console.log(error);
					}
				});
			},
			error : function() {
			}
		});

	});
</script>

<style>
$("
#dialog
 
")
.modal
 
({
clickClose
:
 
true

}
);
</style>

<script>	
	window.addEventListener('beforeunload', function(event) {
		// Your logic to prepare for 'Stay on this Page' goes here 
		//alert("hi");
		$.ajax({
			url : '/sessionunload',
			type : 'POST',
			//dataType: "json",
			data : "emailid=" + $("#Email").val(),
			success : function(responsedata) {
				alert(responsedata);
			},
			error : function(xhr, status, error) {

			}

		});

		
	});
</script>

<script type="text/javascript">
	document.documentElement.className = "js";
</script>

<style type="text/css">
.row_item {
	color: #444;
	display: block;
	width: 100%;
}

.row_item:nth-child(odd) {
	background: #ffffff;
}

.row_item:nth-child(even) {
	background: #ccff99;
}

.row_item:hover {
	background: #dddddd;
}

#resp {
	visibility: hidden;
	border: 1px solid #222;
}
</style>


<style>
.custom_link {
	text-decoration: none;
	text-decoration-color: none;
	font-weight: bold;
	font-color: 0b5129;
}

.custom_link:hover {
	/* text-decoration: underline; */
}

.custom_link_past {
	text-decoration: none;
	text-decoration-color: none;
	font-weight: bold;
	font-style: italic;
}

.custom_link_past:hover {
	/* text-decoration: underline; */
}
</style>

<style>
h4 {
	margin: 0px 0px 0px 0px;
	padding: 10px 0px 0px 0px;
	/*background-color:#38bdd0;*/
	background: -webkit-gradient(linear, left top, left bottom, from(#30b8c2),
		to(#8adcf1));
	/* background: -moz-linear-gradient(top,  #30b8c2,  #8adcf1); */
	background: -moz-linear-gradient(top, #30b8c2, #45b845);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#30b8c2',
		endColorstr='#8adcf1');
	text-align: left;
	font-size: 12px;
	font-weight: bold;
	font-style: normal;
	color: #ffffff;
}
</style>


<style>
.e {
	margin: 0px 0px 0px 20px;
}
</style>

<style>
.
#record {
	width: 100%;
}
</style>
<style>
h5 {
	margin: 0px 0px 0px 0px;
	padding: 10px 0px 5px 10px;
	background: #B2D9FF;
	/*	background-color: #38bdd0;
	width: 586px;
	background: -webkit-gradient(linear, left top, left bottom, from(#30b8c2),
		to(#8adcf1));
	background: -moz-linear-gradient(top, #30b8c2, #45b845);*/
	/* filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#30b8c2', endColorstr='#8adcf1');*/
	text-align: left;
	font-size: 16px;
	font-weight: bold;
	font-style: normal;
	color: #002f7c;
}

h3 {
	font-size: 16px;
	/* font-style: italic; */
	font-family: "Times New Roman", Georgia, Serif;
	font-weight: 900;
	font-stretch: expanded;
	color: #002f7c;
	padding: 0px 0px 5px 0px;
}

h3, img {
	margin: 0px;
}
</style>


<style>
a.tooltip {
	outline: none;
}

a.tooltip strong {
	line-height: 5px;
}

a.tooltip:hover {
	text-decoration: none;
}

a.tooltip span {
	z-index: 10;
	display: none;
	padding: 0px 5px;
	margin-top: 0px;
	margin-left: 0px;
	width: 150px;
	height: auto;
	font-size: 12px;
}

a.tooltip:hover span {
	display: inline;
	position: absolute;
	border: 1px solid #000000;
	color: #000000;
	background: #FFFFFF repeat-x 0 0;
}

a.tooltip_clientSuccess {
	outline: none;
}

a.tooltip_clientSuccess strong {
	line-height: 5px;
}

a.tooltip_clientSuccess:hover {
	text-decoration: none;
}

a.tooltip_clientSuccess span {
	z-index: 10;
	display: none;
	padding: 0px 5px;
	margin-top: 0px;
	margin-left: 0px;
	width: 150px;
	height: auto;
	font-size: 12px;
}

a.tooltip_clientSuccess:hover span {
	display: inline;
	position: absolute;
	border: 1px solid #000000;
	color: #000000;
	background: #FFFFFF repeat-x 0 0;
}

.callout {
	z-index: 20;
	position: absolute;
	border: 0;
	top: -14px;
	left: 120px;
}

/*CSS3 extras*/
a.tooltip span {
	border-radius: 1px;
	box-shadow: 0px 0px 8px 4px #666;
	/*opacity: 0.8;*/
}


.myButton {
	display: inline-block;
	font-family: arial;
	color: #fff;
	font-size: 22px;
	box-shadow: 1px 1px 0px #BEE2F9;
	padding: 10px 5px;
	border: 4px outset #3866A3;
	background: #63B8EE;
	background: linear-gradient(top, #63B8EE, #468CCF);
	background: -ms-linear-gradient(top, #63B8EE, #468CCF);
	background: -webkit-gradient(linear, left top, left bottom, from(#63B8EE),
		to(#468CCF));
	background: -moz-linear-gradient(top, #63B8EE, #468CCF);
	width: 283px;
	height: 50px;
	text-decoration: none;
	text-align: center;
	text-shadow: 1px 1px #555;
}

.myButton:hover {
	background: #468CCF;
	background: linear-gradient(top, #468CCF, #63B8EE);
	background: -ms-linear-gradient(top, #468CCF, #63B8EE);
	background: -webkit-gradient(linear, left top, left bottom, from(#468CCF),
		to(#63B8EE));
	background: -moz-linear-gradient(top, #468CCF, #63B8EE);
}

.myButton:active {
	position: relative;
	top: 2px;
}

p {
	font-size: 14px;
	margin: 3px 0px 0px 0px;
}

.blue_dot{
margin:0 0 0 8px;;
}

.u i {
color:#093377;
font-size: 12px;
font-style: italic; 
font-weight: 600;
} 
</style>
</head>
<body>
	<!-- WRAPPER START -->
	<div id="wrapper">
		<!-- Container Start -->
		<div class="container">
			<div id="dialog" class="portbox" style="display: none"></div>
			<!-- Header file headers is included here  -->
			<%-- <%@ include file="../include/headers.jsp" %> --%>
			<%@ include file="include/headers.jsp"%>
			<!-- Header End -->

			<div class="clear"></div>

			<!-- top-nav strts here & jsp file topnav is included  -->

			<%-- <%@ include file="include/topnav.jsp" %> --%>
			<div class="clear"></div>

			<!-- Main data -->
			<div id="main">
				<div class="mid-data-container">
					<!-- Multi sections Start -->
					<div id="multi-sections">
						<!-- Left sections Start -->
						<div class="part1">
							<div>

								<a href="PATPage.jsp" target="_blank" class="myButton"><b>Proposal
										Development</b>
								<p>
										<i>Professional Proposal Writing & Analytics</i>
									</p></a>

							</div>
							<h1>Explore Knowledge Hub on your own!</h1>
							<h2>Search our document repository:</h2>
							<div class="searchholder">
								<div class="searchholder-in">
									<!--<h2>Explore Knowledge Hub on your own!</h2>-->
									<div>
										<input ID="txtsrchs" type="text" name="txtsrch"> <input
											type="button" class="srh" id="submit" value="GO"
											title="Create">
									</div>
								</div>
							</div>
							<h2>Lookup a list of articles published:</h2>
							<div style="padding: 10px">
								<table>
									<tr rowspan="4">
										<td
											style="width: 100%; padding-left: 0px; font-size: 12px; font-family: Arial"
											valign="top" class="y"><a href="contentlist.jsp"><img
												src="images/cont_imge.png"></a></td>
									</tr>
								</table>
							</div>
							<h1>Spotlight of The Week</h1>
							<div id="Carousel_Spotlight">
								<ul class="unordered">									
								</ul>

								<table>
									<tr>
										<td><div id="spotlight"></div></td>
									</tr>
								</table>
							</div>

							<h1>Request a service</h1>
							<div class="searchholder-in">
								<ul>
									<li><img style="width: 15px"
										src='images/service_arrow.png' /><a
										href="service_request.jsp">&nbsp;Request Intellectual
											Capital</a></li>
								</ul>
							</div>
							<h1>Testimonials</h1>
							<div id="Carousel_Testimonials">
								<ul class="unordered1">									
								</ul>
							</div>

							<h1>Other Useful Resources</h1>
							<div>
								<div class="imgholder-in" style="height: 220px;">
									<table class="client">
										<tr>
											<td><a
												href="https://w3-03.sso.ibm.com/marketing/mi/mihome.nsf/pages/mihome"
												target="_blank" class="tooltip"><img width="85"
													height="55" alt="bluemine" src="images/blue-mine.png"><span>Direct
														Access to Client, Competitive & Market Insights</span></a></td>
											<td></td>
											<td><a href="http://ibv.dst.ibm.com/index.html"
												target="_blank" class="tooltip"><img width="85"
													height="55" alt="ISBV" src="images/IBV_new.png"><span>Fact
														based thought leadership & tools that help clients realize
														business value</span></a></td>
											<td></td>
											<td><a
												href="https://w3-03.sso.ibm.com/marketing/mi/miibot.nsf/f.MWEBIBOT"
												target="_blank" class="tooltip"><img width="85"
													height="55" alt="IBOT" src="images/ibot.png"><span>Client
														references, benchmark reports & third party research to
														highlight benefits realization</span></a></td>
										</tr>
										<tr>
											<td><a
												href="https://w3-connections.ibm.com/communities/service/html/communityview?communityUuid=360f6b48-9359-4b50-85f4-36045bde52b5"
												target="_blank" class="tooltip"><img width="85"
													height="55" alt="iRam" src="images/iRam.png"><span>IBM
														strategic repository for all high-quality / high-value,
														reusable assets</span></a></td>
											<td></td>
											<td><a
												href="https://w3-03.sso.ibm.com/marketing/mi/mihome.nsf/pages/IBMCAI"
												target="_blank" class="tooltip"><img width="85"
													height="55" alt="ICAI" src="images/IBMCAI_new.png"><span>Aggregated
														insights from various quantitative & qualitative studies</span></a></td>
											<td></td>
											<td><a
												href="https://w3-03.sso.ibm.com/services/practitionerportal/assethub/production/sacindex.jsp"
												target="_blank" class="tooltip"><img width="85"
													height="55" alt="ISG" src="images/SolutionGateway_new.png"><span>IBM
														cross-brand solutions, asset sales & delivery materials</span></a></td>
										</tr>
										<tr>
											<td><a
												href="https://apps.na.collabserv.com/wikis/home?lang=en-us#!/wiki/Wfcf90412192e_4e17_8d2a_4592e3b53b87/page/AIC%20Sellers%27%20Hub"
												target="_blank" class="tooltip"><img width="85"
													height="55" alt="iRam" src="images/AIC.png"><span>Global
														AIC Offerings, Differentiators & Sales Enablers</span></a></td>
											<td></td>
											<td><a
												href="https://w3-workplace.ibm.com/ibm/thinkacademy/index.html"
												target="_blank" class="tooltip"><img width="85"
													height="55" alt="ICAI" src="images/ThinkAcademy_new.png"><span>Place
														for learning, exploring & sharing</span></a></td>
											<td></td>
											<td><a
												href="http://www.finlistics-vm.com/vmolweb/ibmcbv/IBMCBV.asp"
												target="_blank" class="tooltip"><img width="85"
													height="55" alt="ISG" src="images/cbv.png"><span>Value
														modelling around KPIs of Client's business</span></a></td>
										</tr>
										<tr>
											<td colspan="5"><a
												href="https://rv.roinnovation.com/IBM" target="_blank"
												class="tooltip"><img width="282" height="55" alt="ICRMD"
													src="images/CSC.png"><span>Insightful Client
														References & Stories</span></a></td>
										</tr>
									</table>
								</div>
								<div><%@ include file="include/visitorcount.jsp"%></div>
							</div>
						</div>
						<!-- Left sections End -->
						<!-- Middle sections Start -->
						<div class="part2">
							<div class="acc-container1">
								<div class="col c3">
									<!-- BEGIN Events -->
									<table class="type_details" style="padding: 0px 10px 0px 0px;">
										<tr>
											<td style="vertical-align: top">
												<div
													style="width: 300px; padding: 5px 10px; font-size: 12px; font-family: Arial"
													valign="top" class="a"></div>
											</td>
											<td style="vertical-align: top"><div
													style="width: 295px; padding: 5px 10px; font-size: 12px; font-family: Arial"
													valign="top" class="b"></div></td>
										</tr>
										<tr>
											<td style="vertical-align: top"><div
													style="width: 300px; padding: 5px 10px; font-size: 12px; font-family: Arial"
													valign="top" class="c"></div></td>
											<td style="vertical-align: top"><div
													style="width: 295px; padding: 5px 10px; font-size: 12px; font-family: Arial"
													valign="top" class="d"></div></td>
										</tr>
									</table>
									<table>
										<tr>
											<input type="hidden" id="txtaccess" name="txtaccess" value="" />
										</tr>
										<tr>
											<input type="hidden" id="txtrefresh" name="txtrefresh"
												value="" />
										</tr>
										<tr>
											<input type="hidden" id="Email" name="emailid" value="" />
										</tr>
										<tr>
											<input type="hidden" id="namedtl" name="namedtl" value="" />
										</tr>
										<tr>
											<input type="hidden" id="sessionId" value="" />
										</tr>
										<tr>
											<input type="hidden" name="startdate" id="todayDate" value="" />
										<tr>
										<tr>
											<input type="hidden" id="ID" name="txtid" value="" />
										</tr>
									</table>

									<!-- END Events -->
								</div>
							</div>
							<table style="width: 640px;">
								<tr>
									<td id="record" colspan="2"></td>

								</tr>
								<tr rowspan="5">
									<td
										style="width: 50%; padding: 5px 10px; border: 2px solid #fff; font-size: 12px; font-family: Arial"
										valign="top" class="e"></td>
									<td
										style="width: 50%; padding: 5px 10px; border: 2px solid #fff; font-size: 12px; font-family: Arial"
										valign="top" class="f"></td>
								</tr>
								<tr></tr>
								<tr></tr>
								<tr rowspan="5">
									<td
										style="width: 50%; padding: 5px 10px; border: 2px solid #fff; font-size: 12px; font-family: Arial"
										valign="top" class="v"></td>
									<td
										style="width: 50%; padding: 5px 10px; border: 2px solid #fff; font-size: 12px; font-family: Arial"
										valign="top" class="z"></td>
								</tr>
							</table>
						</div>
						<!-- Middle sections End -->

						<!-- Right sections Start -->
						<div class="part3">
							<h4>
								<div style="float: left; height: 32px;">
									<img src='images/Recent_links_new.png' />
								</div>
								<div style="height: 32px;">
									<span
										style="display: inline-block; text-align: center; padding: 4px 0px; font-size: 20px; font-style: italic; font-weight: normal;">Hello&nbsp;
										<% 
								           if(StringUtils.isNotBlank(userdtl.getFirstName())) {
								        	 out.println(userdtl.getFirstName());
								         } else {
								        	 out.println(userdtl.getEmail());
								         }
								         %> 
        							 	<%-- <% out.println("Nirmalya"); %> --%>
									</span>
								</div>
							</h4>
							<table class="req_resp">
								<tr rowspan="5">

									<td
										style="width: 100%; padding-left: 7px; padding-bottom: 10px; font-size: 12px; font-family: Arial"
										valign="top" class="u"></td>

								</tr>
							</table>
							<h2>
								<img src='images/market_watch.png' />
							</h2>
							<table class="camss">
								<tr>
									<td
										style="width: 100%; padding-left: 7px; font-size: 12px; font-family: Arial"
										valign="top" class="g"></td>
									</td>
								</tr>
							</table>
							<h2>
								<img src='images/industry_latest.png' />
							</h2>
							<table class="service">
								<tr>
									<td
										style="width: 100%; padding-left: 7px; font-size: 12px; font-family: Arial"
										valign="top" class="h"></td>
									</td>
								</tr>
							</table>
						</div>
						<!-- Right sections End -->
					</div>
					<!-- Multi sections End -->
				</div>
				<div class="clear"></div>
				<!-- Customer Start -->
			</div>
			<!--.container-->
		</div>
		<!-- Customer Bottom -->

		<div class="clear"></div>

		<!-- Footer Bottom -->
		<%@ include file="include/footer.jsp"%>
		<!-- Footer Bottom End -->

	</div>
	<!-- Container End -->
	</div>
	<!-- WRAPPER END -->

	</div>

	<script>
		jQuery(document).on('ready', function() {
			jQuery("#accordion").accordion();
			//jQuery("#accordion").tabs("#accordion div.pane", {tabs: 'h2', effect: 'slide', initialIndex: null});

		});
	</script>

</body>
</html>