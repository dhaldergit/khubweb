<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Proposal Assist Team</title>
<meta name="author" content="Nirmalya Goswami" />
<meta name="description" content="PAT services page" />
<meta name="keywords" content="proposal, consultancy, knowledge" />
<meta name="Resource-type" content="Document" />

<link rel="stylesheet" type="text/css" href="css/PAT_1.css" />
<link rel="stylesheet" type="text/css" href="css/PAT_2.css" />

<!--[if IE]>
		<script type="text/javascript">
			 var console = { log: function() {} };
		</script>
	<![endif]-->
	  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js" type="text/javascript"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js" type="text/javascript"></script>

<script type="text/javascript" src="js/PAT_1.js"></script>
<script type="text/javascript" src="js/PAT_2.js"></script>
<script type="text/javascript" src="js/PAT_3.js"></script>
	
<script type="text/javascript" src="js/service_sector_pat.js"></script>

<link
	href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,600,700'
	rel='stylesheet' type='text/css'>
<link href="css/PAT_3.css" rel="stylesheet" />
<link href="css/PAT_4.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="css/normalize.css" />
<link rel="stylesheet" type="text/css" href="css/demo.css" />
<link rel="stylesheet" type="text/css" href="css/tooltip-classic.css" />
<link rel="stylesheet" type="text/css"
	href="css/tooltip-classic_new.css" />
<link rel="stylesheet" href="css/form-styles-v3.css" media="screen">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  
  <!--   <script>
  $( function() {
    $( "#demo1" ).datepicker({
      showOn: "button",
      buttonImage: "images/cal.gif",
      buttonImageOnly: true,
      buttonText: "Select date",
      minDate: 0, maxDate: "+0D",dateFormat: 'dd-mm-yy' 
    });
  } );
  </script> -->
      <script>
  $( function() {
    $( "#demo5" ).datepicker({
      showOn: "button",
      buttonImage: "images/cal.gif",
      buttonImageOnly: true,
      buttonText: "Select date",
      minDate: +1, maxDate: "+1M",dateFormat: 'dd-mm-yy'
    });
  } );
  </script>
<!--       <script>
  $( function() {
    $( "#demo6" ).datepicker({
      showOn: "button",
      buttonImage: "images/cal.gif",
      buttonImageOnly: true,
      buttonText: "Select date"
    });
  } );
  </script>
      <script>
  $( function() {
    $( "#demo7" ).datepicker({
      showOn: "button",
      buttonImage: "images/cal.gif",
      buttonImageOnly: true,
      buttonText: "Select date"
    });
  } );
  </script> -->
<!--   <script>
  $( function() {
    $( "#demo1" ).datepicker({ minDate: 0, maxDate: "+0D",dateFormat: 'dd-mm-yy' });
  } );
  </script>
    <script>
  $( function() {
    $( "#demo5" ).datepicker({ minDate: +1, maxDate: "+1M",dateFormat: 'dd-mm-yy' });
  } );
  </script> -->

  <script>
/*   $(document).ready(function () {

      $("#demo6").datepicker({
          dateFormat: "dd-mm-yy",
          minDate1: new Date(),
          minDate:+1,
          onSelect: function (date) {
              var dt2 = $('#demo7');
              var startDate = $(this).datepicker('getDate');
              var minDate = $(this).datepicker('getDate');
              dt2.datepicker('setDate', minDate);
              startDate.setDate(startDate.getDate() + 30);
              //sets dt2 maxDate to the last day of 30 days window
              dt2.datepicker('option', 'maxDate', startDate);
              dt2.datepicker('option', 'minDate', minDate);
              $(this).datepicker('option', 'minDate', minDate);
          }
      });
      $('#demo7').datepicker({
          dateFormat: "dd-mm-yy",
          minDate: new Date(),
      });
  }); */
  $(document).ready(function () {
	    
      $("#demo6").datepicker({
          showOn: "button",
          buttonImage: "images/cal.gif",
          buttonImageOnly: true,
          buttonText: "Select date",
          dateFormat: "dd-mm-yy",
          minDate: +1,
          onSelect: function (date) {
              var date2 = $('#demo6').datepicker('getDate');
              date2.setDate(date2.getDate());
              $('#demo7').datepicker('setDate', date2);
              //sets minDate to dt1 date + 1
              $('#demo7').datepicker('option', 'minDate', date2);
          }
      });
      $('#demo7').datepicker({
          showOn: "button",
          buttonImage: "images/cal.gif",
          buttonImageOnly: true,
          buttonText: "Select date",
          dateFormat: "dd-mm-yy",
          onClose: function () {
              var dt1 = $('#demo6').datepicker('getDate');
              
              var dt2 = $('#demo7').datepicker('getDate');
              if (dt2 <= dt1) {
                  var minDate = $('#demo7').datepicker('option', 'minDate');
                  $('#demo7').datepicker('setDate', minDate);
              }
          }
      });
  });
  </script>
  <script>
  $( function() {
    /* var dateFormat = "dd/mm/yy",
      from = $( "#demo6" )
        .datepicker({
          defaultDate: "+1w",
          changeMonth: true,
          numberOfMonths: 1
        })
        .on( "change", function() {
          to.datepicker( "option", "minDate", getDate( this ) );
        }),
      to = $( "#demo7" ).datepicker({
        defaultDate: "+1w",
        changeMonth: true,
        numberOfMonths: 1
      })
      .on( "change", function() {
        from.datepicker( "option", "maxDate", getDate( this ) );
      }); */
 
    function getDate( element ) {
      var date;
      try {
        date = $.datepicker.parseDate( dateFormat, element.value );
      } catch( error ) {
        date = null;
      }
 
      return date;
    }
  } );
  </script>
<script type="text/javascript">
	$(document).ready(function() {
		$(window).scroll(function() {
			if ($(window).scrollTop() > 50) {
				$('#header').addClass("sticky");
			} else {
				$('#header').removeClass("sticky");
			}
		});
	});
</script>


<script type="text/javascript">
	$(document)
			.ready(
					function() {

						function initialization() {
							$('#myContainer')
									.fullpage(
											{
												sectionsColor : [ '#0C0C28',
														'#0C0C28', '#0C0C28',
														'#0C0C28', '#0C0C28' ],
												anchors : [ 'aboutUs',
														'ourWork', 'portfolio',
														'ourTeam', 'contactUs' ],
												resize : false,
												animateAnchor : false,
												scrollOverflow : true,
												autoScrolling : false,
												responsive : 900,
												fitSection : false,
												menu : '#menu',
												navigation : false,
												continuousVertical : true,
												paddingTop : '20px',
												css3 : true,
												onLeave : function(index,
														nextIndex, direction) {
													console.log("onLeave--"
															+ "index: " + index
															+ " nextIndex: "
															+ nextIndex
															+ " direction: "
															+ direction);
												},
												afterLoad : function(
														anchorLink, index) {
													console.log("afterLoad--"
															+ "anchorLink: "
															+ anchorLink
															+ " index: "
															+ index);
												},
												afterSlideLoad : function(
														anchorLink, index,
														slideAnchor, slideIndex) {
													console
															.log("afterSlideLoad--"
																	+ "anchorLink: "
																	+ anchorLink
																	+ " index: "
																	+ index
																	+ " slideAnchor: "
																	+ slideAnchor
																	+ " slideIndex: "
																	+ slideIndex);
												},
												onSlideLeave : function(
														anchorLink, index,
														slideIndex, direction) {
													console
															.log("onSlideLeave--"
																	+ "anchorLink: "
																	+ anchorLink
																	+ " index: "
																	+ index
																	+ " slideIndex: "
																	+ slideIndex
																	+ " direction: "
																	+ direction);
												},
												afterRender : function() {
													console.log("afterRender");
												},
												afterResize : function() {
													console.log("afterResize");
												}
											});
						}

						//fullPage.js initialization
						initialization();

					});
</script>


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
					
					$("#Owner").val(data.email);
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
						
						
						var geo_arr = data.geolist;
						//	alert(sector_arr);
							var geo_add ="<option value=''>Please Select</option>";;
							
							$.each(geo_arr, function(i, val){
								geo_add += "<option value='"+val+"'>"+val+"</option>";
							});
						
						
						
						
					
				//	$(".note").html("");
					
					
					$(".country").html("<label><span>Country<span class='required'>*</span></span><select id='Country'  name='cntry' onchange='valueChange()'>"+country_dd+"</select></label>");
					$("#Country").val(data.country_code.ccode);
					$(".industry").html("<label><span>Industry<span class='required'>*</span></span><select id='Industry' name='inds' onchange='sectorChange()'>"+industry_dd+"</select></label>");
				//	$(".sector").html("<label><span>Sector<span class='required'>*</span></span><select id='Sctr' name='sctr'>"+sector_dd+"</select></label>");
				//	$(".geography").html("<label><span>Geo<span class='required'>*</span></span><select id='Geo' name='geo'>"+geo_add+"</select></label>");
					$("#Geo").val(data.country_code.gcode);
					$("#Region").val(data.country_code.rcode);
					$(".service").html("<label><span>Primary Service Area<span class='required'>*</span></span><select id='Service' name='psl'>"+serv_dd+"</select></label>");	
					$("#spinner").html("");
					$(".opp_details input[type='text']").removeAttr("readonly");
				/* 	$("#Comment").removeAttr("disabled"); */
					$("#Comment").removeAttr("readonly");
														
					$("#demo1").val(data.textdate);
					$("#demo6").val(data.newdate);
					$("#demo7").val(data.newdate);
					

			
				

	

},	


error: function() {
     // alert("Data Error. Data not found . Please Enter the correct search key");
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
			$("#Region").val(resp.regname);
		//	$("#Sctr").val(resp.sctrname);
			
			}
			
		});
		
		
		
		
		
	}
	
	
	</script>
	
	
		<script>
	function sectorChange(){
		
		$.ajax({
			url :'/filtergeo',
			type : 'POST',
			dataType: "json",
			data: {
			
			
			txtind : $.trim($("#Industry :selected").val().trim())
			
			},
			success: function(resp){
			//alert(resp);
			//$("#Geo").val(resp.geoname);
			$("#Sctr").val(resp.sctrname);
			
			}
			
		});
		
		
		
		
		
	}
	
	
	</script>
	
	
	

<style type="text/css">
ul.img-list {
	width: 900px;
	margin-left: 250px;
	columns: 4;
	-webkit-columns: 4;
	-moz-columns: 4;
}

.img-list li {
	height: 110px;
	width: 110px;
}

span.text-content span {
	display: table-cell;
	text-align: center;
	vertical-align: middle;
}

ul.img-list li:hover span.text-content {
	opacity: 1;
}

span.text-content {
	background: rgba(0, 0, 0, 0.5);
	color: white;
	cursor: pointer;
	display: table;
	height: 100px;
	left: 5px;
	position: relative;
	top: -107px;
	width: 100px;
	opacity: 0;
	-webkit-transition: opacity 500ms;
	-moz-transition: opacity 500ms;
	-o-transition: opacity 500ms;
	transition: opacity 500ms;
	border-radius: 50%;
}

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

#actions {
	position: fixed;
	top: 73px;
	left: 30px;
	z-index: 99999;
}

#actions a {
	background: rgba(0, 0, 0, 0.8);
	padding: 7px;
	margin: 2px;
	color: #ccc;
	display: inline-block;
}

#actions a:hover {
	color: #fff;
	background: #81A140;
}

/* Overwriting styles for control arrows for slides
		* --------------------------------------- */
.fp-controlArrow.fp-prev {
	left: 190px;
}

.fp-controlArrow.fp-next {
	right: 60px;
}

#section0, #section1, #section2, #section3 {
	background-size: cover;
	background-attachment: fixed;
	background-image: url("images/background.jpg");
	padding: 6% 0 0 0;
}

/* Style for our header texts
	* --------------------------------------- */
.intro p {
	color: #fff;
}

/* Centered texts in each section
	* --------------------------------------- */
.section {
	text-align: center;
}

/* Fixed header and footer.
	* --------------------------------------- */
#header {
	position: fixed;
	height: 100px;
	font-size: 50px;
	display: block;
	width: 100%;
	background: #335C7D;
	z-index: 9;
	text-align: left;
	color: #f2f2f2;
	padding: 10px 0 10px 200px;
	top: 0px;
}

body {
	color: #333;
	font-family: "Lucida Grande", "Lucida Sans Unicode", Helvetica, Arial,
		Verdana, sans-serif;
}

/* Style for our header texts
	* --------------------------------------- */
h1 {
	font-size: 3em;
	font-family: arial, helvetica;
	margin: 10px 0 20px 0;
	padding: 0;
	text-align:center;
	color:#66B2FF;
}

h2 {
	font-size: 2em;
	margin: 0 0 18px 0;
	font-family: arial, helvetica;
	text-align:left;
}

/* Common styles
	* --------------------------------------- */
img {
	-webkit-transition: all 0.7s ease-out;
	-moz-transition: all 0.7s ease-out;
	-o-transition: all 0.7s ease-out;
	transition: all 0.7s ease-out;
}

.section {
	text-align: center;
	overflow: hidden;
}

.wrap {
	width: 1180px;
	height: 590px;
	margin-left: auto;
	margin-right: auto;
	position: center;
	margin-bottom:-50px;
}

.box {
	text-align: left;
	color: #DFDFDF;
	font-size: 1.2em;
	line-height: 1.6em;
}

.background_box {
	width: 980px;
	height: 75%;
	margin-left: 200px;
	/* margin-right: auto; */
	position: relative;
	background-color: #003366;
	/* padding:20px; */
	border-radius: 25px;
}

.box_portfolio {
	text-align: left;
	color: #DFDFDF;
	font-size: 1.2em;
	line-height: 1.6em;
	background: #0166CB;
	margin-left: 220px;
	border-radius: 25px;
	padding: 10px 30px;
}
/* Section 0
	* --------------------------------------- */
#section0 .box {
	text-align: center;
	margin: 10% 5% 0 20%;
}

#section1 .box {
	text-align: center;
	margin: 10% 5% 0 5%;
	padding: 20px 0px 0px 0px;
}

#section2 .box {
	text-align: center;
	margin: 10% 5% 0 20%;
}

#section3 .box {
	text-align: center;
	margin: 10% 5% 0 20%;
}

/* Overwriting fullPage.js tooltip color
	* --------------------------------------- */
.fp-tooltip {
	color: #AAA;
}

#fp-nav span, .fp-slidesNav span {
	border-color: #AAA;
}

#fp-nav li .active span, .fp-slidesNav .active span {
	background: #AAA;
}
</style>
<style type="text/css">
<
style>table, th, td {
	border: 1px solid black;
}

.client{
width:100%;
}
.box ul{
margin:0 0 0 20px;
}
</style>

<style type="text/css">
		a.tooltips {outline:none; } 			
		a.tooltips strong {line-height:5px;} 			
		a.tooltips:hover {text-decoration:none;} 			
		a.tooltips span { 			
		    z-index:10;display:none; padding:0px 5px; 			
	    margin-top:60px; margin-left:-160px; 			
	    width:150px; height:auto; font-size:12px; 			
		} 			
		a.tooltips:hover span{ 			
		    display:inline; position:absolute; 			
		    border:1px solid #000000;  color:#000000; 			
		    background:#FFFFFF repeat-x 0 0; 			
		}
</style>
</head>
<body>

	<nav id="menu">
	<ul>
		<li data-menuanchor="aboutUs"><a href="#aboutUs"><img
				src="icons/aboutus_sm.png" alt="">ABOUT US</a></li>
		<li data-menuanchor="ourWork"><a href="#ourWork"><img
				src="icons/ourwork_sm.png" alt="">OUR WORK</a></li>
		<li data-menuanchor="portfolio"><a href="#portfolio"><img
				src="icons/portfolio_sm.png" alt="">PORTFOLIO</a></li>
		<li data-menuanchor="ourTeam"><a href="#ourTeam"><img
				src="icons/team_sm.png" alt="">OUR TEAM</a></li>
		<li><a href="#!" data-display="contact_form" class="tooltips"><img
				src="icons/request_sm.png" alt=""> CONTACT US<span>Request assistance for responding to RFI/RFP</span></a> </li>
		<!-- 			<li><a href="#" data-display="feedback_form"><img
					src="icons/feedback_sm.png"> FEEDBACK</a></li> -->
	</ul>
	</nav>
	<div id="header">GBS Sales Transformation - Proposal Hub</div>
	<div id="myContainer">

		<div class="section" id="section0">
			<div class="wrap">
				<div class="box">
					<h1>About Us</h1>
					<div style="text-align: left;">Proposal Hub provides customized support for individual proposal development work for deals greater than $5 Million. The team leverages the best available material from recent proposals, service line documents and industry collaterals to create and customize proposals for your client's specific requirement. One prime objective for this service is to ensure that new age offerings like CAMSS, Cognitive or Automation are an integral part of our proposals. For a more focused attention to deals, we have proposal managers specifically assigned in line with the service line and sector represented in the proposal.</div>
				</div>
			</div>
		</div>
		<div class="section" id="section1">
			<!-- 			<div class="slide">				
				<div class="wrap">
				<div class="background_box">
				<div class="box">
				<h2>Our Work</h2>
				<div style="text-align:left;">
				This team is formed to provide customized support for individual proposal development work, for deals between $5-25M USD, except iXM at $2-25M. The team will leverage the best available material from previous proposals or create afresh and customized it for your client's specific requirement. One of prime objectives for this team is to ensure that new age offerings, like CAMSS, are an integral part of our proposals. Individual proposal managers for service lines and sectors may be contacted for support as required. Team details are available at the bottom of the pane on the right.
				</div>
				</div>
				</div>
			</div>
			</div> -->
			
				<div class="wrap" style="margin-top: 50px;">
				<h1>Our Work</h1>
					<div class="background_box" style="margin-top: 10px;">
						<div class="box"
							style="width: 430px; float: left; margin-left: 50px; text-align: left; margin-top: 0px; padding-top: 20px;">
							
							<h2>Proposal Consulting</h2>
							<div style="text-align: left;">A major factor for selection or winning bid is in researching the client&#8217;s business and providing insights into the pain points for the client. Apart from working on Proposal development, we have strong capability to help the bid team with Client Business insights and Analytics based on our research.

<br><br>Our Customer and Competition Assessment has helped win several deals in addition to opening new opportunities for IBM.
</div>
						</div>
						<div class="graphics"
							style="float: left; margin-top:; width: 450px; padding-top: 20px;">
							<img id="" src="images/Proposal_Consulting.jpg" width="396"
								height="389" style="margin: 0px;" alt=""/>
						</div>
					</div>
				</div>
			
			
				<div class="wrap">
					<div class="background_box">
						<div class="graphics"
							style="float: left; margin-left: 0px; width: 500px; padding-top: 20px;">
							<img id="" src="images/Proposal_Development.jpg" width="440"
								height="411" style="margin: 0px;" alt=""/>
						</div>
						<div class="box" style="padding-top: 20px;">
							<h2>Proposal Development</h2>
							<div style="text-align: left;">We help, guide and effectively contribute with relevant customized content (except Legal, Pricing and HR) for end to end proposal development for Qualified Opportunity in part or whole. We can support you at your location or virtually from offshore in India.</div>
						</div>
					</div>
				</div>
			
		</div>
		<div class="section" id="section2">
			
				<div class="wrap">
					<div class="box">
						<h1>Portfolio</h1>
						<div style="text-align: left;">
							<br>This team utilizes its expertise and capabilities to contribute and develop end to end client centric proposals, emphasizing the importance of understanding the client&#8217;s needs at an individual and industry level. We follow the Value Driven Proposal approach towards customizing and enabling our stakeholders - through guidance and exercises - and enhance it further to bring bold ideas to our clients, backed with clear articulation of business value.
							<br><br>With years of accumulated experience across domains and industries the team has strong capabilities across service lines and technologies.
						</div>
					</div>
				</div>
			
			
				<div class="wrap">
					<div class="box">
						<h2>Application Innovation Consulting</h2>
						<div style="text-align: left;">
							<br>AIC team offers an innovation driven comprehensive proposal portfolio to develop and manage client applications, including initiatives to transform the applications and improve efficiency 
							<ul style="list-style-type: circle; text-align: left;">
								<li>DevOps-Continuous delivery of software-driven innovation with a tool based approach</li>
								<li>Agile - An application development approach for faster time to market</li>
								<li>Cloud Services - Flexibility and scalability for client experience and cost optimization</li>
								<li>Cognitive Solutions - Watson Automation for advanced analytics</li>
							</ul>
						</div>
					</div>
					<div class="box_portfolio">
						<span style="color: white;">Few IBM Clients serviced under
							AIC</span>
						<table class="client">
							<tr>
								<td><span class="tooltip_new tooltip_new-effect-1"><span
										class="tooltip-item_new"><img id="yourimage"
											src="images/logos/YorkshireWater.jpg" height="45"
											style="margin: 0px 10px 10px 10px; border-radius: 10%" alt=""/></span><span
										style="margin-bottom: 75px; width: 300px;"
										class="tooltip_new-content clearfix"><span
											class="tooltip_new-text" style="display: inline-block;"><strong>Yorkshire
													Water Services LTD: </strong>Decision Management Framework to help
												client understand the risks and benefits of various
												investment decisions related to the maintenance and
												replacement of assets.<span
												class="tooltip_feedback-text" style="display: inline-block; float:">"Responsiveness
													relevance and the fact that some real intelligence had been
													applied with limited background info."</span></span></span></span></td>
								<td><span class="tooltip_new tooltip_new-effect-1"><span
										class="tooltip-item_new"><img id="yourimage"
											src="images/logos/VattenFall.png" height="45"
											style="margin: 0px 10px 10px 10px; border-radius: 10%" alt=""/></span><span
										style="margin-bottom: 75px; width: 300px;"
										class="tooltip_new-content clearfix"><span
											class="tooltip_new-text" style="display: inline-block;"><strong>Vattenfall:
											</strong>AMS Core Horizontal Systems in Vattenfall (SAP and non SAP)<span class="tooltip_feedback-text"
												style="display: inline-block; float:">"The team took
													over the task with enthusiasm and has been critical for
													getting things done on time</span></span></span></span></td>
								<td><span class="tooltip_new tooltip_new-effect-1"><span
										class="tooltip-item_new"><img id="yourimage"
											src="images/logos/SIG.png" height="55"
											style="margin: 0px 10px 10px 10px; border-radius: 10%" alt=""/></span><span
										style="margin-bottom: 75px; width: 300px;"
										class="tooltip_new-content clearfix"><span
											class="tooltip_new-text" style="display: inline-block;"><strong>SIGplc:
											</strong>Middleware applications through a managed service provision
												on Enterprise Service Bus designed and built by Tibco Inc.
												<span class="tooltip_feedback-text"
												style="display: inline-block; float:">"Excellent
													Work!! Thank you so much for all your help</span></span></span></span></td>
								<td><span class="tooltip_new tooltip_new-effect-1"><span
										class="tooltip-item_new"><img id="yourimage"
											src="images/logos/Capita.jpg" height="45"
											style="margin: 0px 10px 10px 10px; border-radius: 10%" alt=""/></span><span
										style="margin-bottom: 75px; width: 300px;"
										class="tooltip_new-content clearfix"><span
											class="tooltip_new-text" style="display: inline-block;"><strong>Capita
													& Parent Company BBC: </strong>Managed services covering all
												applications of BBC TV Licenses<span
												class="tooltip_feedback-text" style="display: inline-block; float:">"Glad
													to inform you that we got GM Transformation award for
													Capita TVL. Part of this success goes to you as without
													your timely support we could not have completed this
													proposal on time"</span></span></span></span></td>
								<td><span class="tooltip_new tooltip_new-effect-1"><span
										class="tooltip-item_new"><img id="yourimage"
											src="images/logos/Horizon.png" height="45"
											style="margin: 0px 10px 10px 10px; border-radius: 10%" alt=""/></span><span
										style="margin-bottom: 75px; width: 300px;"
										class="tooltip_new-content clearfix"><span
											class="tooltip_new-text" style="display: inline-block;"><strong>Horizon
													Nuclear Power: </strong>AD projects : Service Integration model for
												upcoming and ongoing Programmes / Projects<span
												class="tooltip_feedback-text" style="display: inline-block; float:">"The
													enthusiasm of the team was commendable. I got various
													inputs to craft my win messages and competitive analysis
													which was a pleasant surprise for me. Proposal Team has
													done an excellent job and they deserve a pat on their back.
													It’s a new logo for IBM."</span></span></span></span></td>
								<td><span class="tooltip_new tooltip_new-effect-1"><span
										class="tooltip-item_new"><img id="yourimage"
											src="images/logos/UKPowerNetworks.png" height="35"
											style="margin: 0px 10px 10px 10px; border-radius: 10%" alt=""/></span><span
										style="margin-bottom: 75px; width: 300px;"
										class="tooltip_new-content clearfix"><span
											class="tooltip_new-text" style="display: inline-block;"><strong>UKPN
													SO & AMS: </strong>SO & AMS for Infrastructure Application
												management End-user computing & Cloud<span
												class="tooltip_feedback-text" style="display: inline-block; float:">"Was
													great to get a quick start find people who were
													enthusiastic and take on the challenge and used their heads
													to get on with the task in hand. The input and content was
													of a high standard and the team went and found recent
													relevant materials and references/case studies – always a
													difficult challenge."</span></span></span></span></td>
								<td><span class="tooltip_new tooltip_new-effect-1"><span
										class="tooltip-item_new"><img id="yourimage"
											src="images/logos/Vodaphone.jpg" height="55"
											style="margin: 0px 10px 10px 10px; border-radius: 10%" alt=""/></span><span
										style="margin-bottom: 75px; width: 300px;"
										class="tooltip_new-content clearfix"><span
											class="tooltip_new-text" style="display: inline-block;"><strong>Vodafone
													Equinox AD: </strong>AD proposal to achieve Improved Quality of
												outcomes through increased Automation & sophisticated
												Analytics for client<span class="tooltip_feedback-text"
												style="display: inline-block; float:">"I was very
													impressed with the quality of the work carried out by the
													PAT team. The team produced a high quality compelling
													proposal deck that presented our value proposition clearly
													and in a manner that differentiated IBM. The inputs
													strengthened our chances of winning the deal and I would
													recommend engaging the PAT team to help produce similar
													customer deliverables in the future."</span></span></span></span></td>
								<td><span class="tooltip_new tooltip_new-effect-1"><span
										class="tooltip-item_new"><img id="yourimage"
											src="images/logos/O2.jpg" height="55"
											style="margin: 0px 10px 10px 10px; border-radius: 10%" alt=""/></span><span
										style="margin-bottom: 75px; width: 300px;"
										class="tooltip_new-content clearfix"><span
											class="tooltip_new-text" style="display: inline-block;"><strong>Telefonica
													O2 (Germany): </strong>BSS Transformation and Digital
												Transformation: <strong></strong><span class="tooltip_feedback-text"
												style="display: inline-block; float:"><br/>"Overall my
													expectation were exceeded! I had expected primarily
													boilerplate input but the team has definitely gone beyond
													that. The responsiveness and reliability I found
													outstanding. I was very impressed by the passion the team
													has shown."</span></span></span></span></td>

							</tr>

						</table>

					</div>
				</div>
			
			
				<div class="wrap">
					<div class="box">
						<h2>Digital Consulting</h2>
						<div style="text-align: left;">
							The team uses IBM's Design Thinking methodologies to addresses client needs with a three pillar growth strategy that leverages analytics to engage in new market positions
							<ul style="list-style-type: circle; text-align: left;">
								<li>Lead the Shift to Line of Business</li>
								<li>Differentiate through end-to-end solutions</li>
								<li>Accelerate growth of global talent base</li>
							</ul>
						</div>
					</div>
					<div class="box_portfolio">
						<span style="color: white;">Few IBM Clients serviced under
							Digital</span>
						<table class="client">
							<tr>
								<td><span class="tooltip_new tooltip_new-effect-1"><span
										class="tooltip-item_new"><img id="yourimage"
											src="images/logos/NetworkRail.png"  height="65"
											style="margin: 0px 10px 10px 10px; border-radius: 10%" alt=""/></span><span
										style="margin-bottom: 75px; width: 300px;"
										class="tooltip_new-content clearfix"><span
											class="tooltip_new-text" style="display: inline-block;"><strong>Network
													Rail: </strong>Intelligent Infrastructure programme : Delivery;
												including build (based on Network Rail design) software
												design test and implementation services including the
												implementation of new asset templates<span
												class="tooltip_feedback-text" style="display: inline-block; float:">"Working
													with the team was an absolute pleasure they understood the
													brief very quickly and developed quality responses in zero
													time. Excellent coordination and responsiveness."</span></span></span></span></td>
								<td><span class="tooltip_new tooltip_new-effect-1"><span
										class="tooltip-item_new"><img id="yourimage"
											src="images/logos/DB.png"  height="65"
											style="margin: 0px 10px 10px 10px; border-radius: 10%" alt=""/></span><span
										style="margin-bottom: 75px; width: 300px;"
										class="tooltip_new-content clearfix"><span
											class="tooltip_new-text" style="display: inline-block;"><strong>Deutsche
													Bank: </strong>Proposal Response: Includes Target Operating Model
												Process Design High-Level Workday Design Data Migration
												Integration and Enabling Technology (Case Management Portal
												Analytics Document Management).</span></span></span></td>
								<td><span class="tooltip_new tooltip_new-effect-1"><span
										class="tooltip-item_new"><img id="yourimage"
											src="images/logos/TransportLondon.png"  height="35"
											style="margin: 0px 10px 10px 10px; border-radius: 10%" alt=""/></span><span
										style="margin-bottom: 75px; width: 300px;"
										class="tooltip_new-content clearfix"><span
											class="tooltip_new-text" style="display: inline-block;"><strong>TFL:
											</strong>Response in the area of Building Information Modelling (BIM) - quite new mainly pursued within the US and UK and IBM
												don't have much experience in implementations (not many case
												studies available).<span class="tooltip_feedback-text"
												style="display: inline-block; float:">"Liked the
													responsiveness and organization. Found the PAT team tracker
													a very useful tool helped to facilitate the conversations"</span></span></span></span></td>
								<td><span class="tooltip_new tooltip_new-effect-1"><span
										class="tooltip-item_new"><img id="yourimage"
											src="images/logos/IAG.png"  height="75"
											style="margin: 0px 10px 10px 10px; border-radius: 10%" alt=""/></span><span
										style="margin-bottom: 75px; width: 300px;"
										class="tooltip_new-content clearfix"><span
											class="tooltip_new-text" style="display: inline-block;"><strong>IAG:
											</strong>IAG - Selling Channels Loyalty & Revenue Management Domain /
												Mobile Applications Domain / ba.com Domain<span
												class="tooltip_feedback-text" style="display: inline-block; float:">"
													I have been impressed by the overall experience of working
													with this team. I am glad to say that the overall
													experience has been very positive"</span></span></span></span></td>
								<td><span class="tooltip_new tooltip_new-effect-1"><span
										class="tooltip-item_new"><img id="yourimage"
											src="images/logos/lloydsbanking.png"  height="65"
											style="margin: 0px 10px 10px 10px; border-radius: 10%" alt=""/></span><span
										style="margin-bottom: 75px; width: 300px;"
										class="tooltip_new-content clearfix"><span
											class="tooltip_new-text" style="display: inline-block;"><strong>Lloyds
													Bank Group: </strong>AMS Response : Agile & Devops<span
												class="tooltip_feedback-text" style="display: inline-block; float:">"Pretty
													responsive and timelines were strict but were well adhered
													to. "</span></span></span></span></td>

							</tr>

						</table>

					</div>
				</div>
			
			
				<div class="wrap">
					<div class="box">
						<h2>Enterprise Applications</h2>
						<div style="text-align: left;">
							<br>This team serves the EA Service Line - SAP, Oracle and Microsoft Consulting Services
							<ul style="list-style-type: circle; text-align: left;">
								<li>Team of EA specialized consultants led by experienced
									Proposal Managers</li>
								<li>Support crafting of proposals based on new age
									solutions, core IBM offerings around Cloud, Mobility, Cognitive
									and Analytics and industry relevant value propositions</li>
								<li>Create differentiated and high quality proposals while
									leveraging best practices</li>
							</ul>
						</div>
					</div>
					<div class="box_portfolio">
						<span style="color: white;">Few IBM Clients serviced under
							EA</span>
						<table class="client">
							<tr>
								<td><span class="tooltip_new tooltip_new-effect-1"><span
										class="tooltip-item_new"><img id="yourimage"
											src="images/logos/Hydro.png" height="55"
											style="margin: 0px 10px 10px 10px; border-radius: 10%" alt=""/></span><span
										style="margin-bottom: 75px; width: 300px;"
										class="tooltip_new-content clearfix"><span
											class="tooltip_new-text" style="display: inline-block;"><strong>NorskHydro:
											</strong>To establish projects and operations in: Microsoft products
												Infrastructure services SAP products Application services
												Security IT asset management and SW compliance<span
												class="tooltip_feedback-text" style="display: inline-block; float:">"Very
													flexible and supporting team - thanks</span></span></span></span></td>
								<td><span class="tooltip_new tooltip_new-effect-1"><span
										class="tooltip-item_new"><img id="yourimage"
											src="images/logos/Honda.png" height="75"
											style="margin: 0px 10px 10px 10px; border-radius: 10%" alt=""/></span><span
										style="margin-bottom: 75px; width: 300px;"
										class="tooltip_new-content clearfix"><span
											class="tooltip_new-text" style="display: inline-block;"><strong>HONDA
													OF THE (UK): </strong>SAP Support to the Honda Motor Europe : Scope
												EEC 6 SRM Sourcing BW MDG PI Portal and Sol Man<span class="tooltip_feedback-text"
												style="display: inline-block; float:">"the work your
													team was involved in on the Honda response was timely very
													good quality and showed that you had really understood what
													the issues were and what we were trying to convey"</span></span></span></span></td>
								<td><span class="tooltip_new tooltip_new-effect-1"><span
										class="tooltip-item_new"><img id="yourimage"
											src="images/logos/BBC_NEWS.png" height="65"
											style="margin: 0px 10px 10px 10px; border-radius: 10%" alt=""/></span><span
										style="margin-bottom: 75px; width: 300px;"
										class="tooltip_new-content clearfix"><span
											class="tooltip_new-text" style="display: inline-block;"><strong>BBC
													TELEVISION CENTRE: </strong>Proposal for New age AMS service and
												better collaboration among teams knowledge mgmt keeping
												updated with version changes better issue mgmt innovation
												continuos improvements<span
												class="tooltip_feedback-text" style="display: inline-block; float:">"Team
													is very responsive in supporting responses. On-boarding
													this Proposal support team is a welcome move and this has
													helped the Sales team in RFP response process. </span></span></span></span></td>
								<td><span class="tooltip_new tooltip_new-effect-1"><span
										class="tooltip-item_new"><img id="yourimage"
											src="images/logos/Gazprom.png" height="55"
											style="margin: 0px 10px 10px 10px; border-radius: 10%" alt=""/></span><span
										style="margin-bottom: 75px; width: 300px;"
										class="tooltip_new-content clearfix"><span
											class="tooltip_new-text" style="display: inline-block;"><strong>Gazprom:
											</strong>The project involves provision of AMS support to Gazprom for
												their GT&M trading operation: includes the upgrade of the
												SAP ECC and hosting capability<span
												class="tooltip_feedback-text" style="display: inline-block; float:">"Thanks
													for the great effort. I really appreciate your hard work to
													meet the deadline. I can see that you have produced quality
													content that has enhanced the quality of the bid.</span></span></span></span></td>
								<td><span class="tooltip_new tooltip_new-effect-1"><span
										class="tooltip-item_new"><img id="yourimage"
											src="images/logos/IAG.png" height="75"
											style="margin: 0px 10px 10px 10px; border-radius: 10%" alt=""/></span><span
										style="margin-bottom: 75px; width: 300px;"
										class="tooltip_new-content clearfix"><span
											class="tooltip_new-text" style="display: inline-block;"><strong>IAG:
											</strong>MANAGED SERVICE - IT Applications Support -
												Engineering Domain<span class="tooltip_feedback-text"
												style="display: inline-block; float:">"Very good - comments have generally been addressed at the first pass
													each time.</span></span></span></span></td>
								<td><span class="tooltip_new tooltip_new-effect-1"><span
										class="tooltip-item_new"><img id="yourimage"
											src="images/logos/ESB.png" height="75"
											style="margin: 0px 10px 10px 10px; border-radius: 10%" alt=""/></span><span
										style="margin-bottom: 75px; width: 300px;"
										class="tooltip_new-content clearfix"><span
											class="tooltip_new-text" style="display: inline-block;"><strong>ESB:
											</strong>Application Development SAP AMS and Programme management<span class="tooltip_feedback-text"
												style="display: inline-block; float:">"Many thanks for your teams help as it was a huge benefit. Overall we
													were very happy with your teams input."</span></span></span></span></td>

							</tr>

						</table>

					</div>
				</div>
			
		</div>
		<div class="section" id="section3">
			<h1>Our Team</h1>
			<div style="margin-left: 500px; width: 820px;">
				<div style="float: left; width: 300px; height: 475px">
					<div style="width:; height:">
						<span class="tooltip tooltip-effect-1"><span
							class="tooltip-item"><img id="yourimage"
								src="images/team/photo-ujjwal-kumar.jpg"
								width="175" height="175"
								style="margin: 0px 10px 10px 45px; border-radius: 50%" alt=""/></span><span
							class="tooltip-content clearfix"><img
								src="images/team/photo-ujjwal-kumar.jpg" alt=""/><span
								class="tooltip-text"><strong>Ujjwal Kumar</strong><br>Leader
									- GBS Europe Knowledge & Proposal Hub</span></span></span>
					</div>
					<div style="width:; height:">
						<table>
							<tr>
								<td><span class="tooltip tooltip-effect-1"><span
										class="tooltip-item"><img id="yourimage"
											src="images/team/photo-Amitava-Gupta.png"
											width="125" height="125"
											style="margin: 15px 10px 10px 10px; border-radius: 50%" alt=""/></span><span
										class="tooltip-content clearfix"><img
											src="images/team/photo-Amitava-Gupta.png" alt=""/><span
											class="tooltip-text"><strong>Amitava Gupta</strong><br>Proposal
												Manager</span></span></span>
								</td><th></th>
								<td><span class="tooltip tooltip-effect-1"><span
										class="tooltip-item"><img id="yourimage"
											src="images/team/photo-Sanjay-Basu.png"
											width="125" height="125"
											style="margin: 15px 10px 10px 10px; border-radius: 50%" alt=""/></span><span
										class="tooltip-content clearfix"><img
											src="images/team/photo-Sanjay-Basu.png" alt=""/><span
											class="tooltip-text"><strong>Sanjay Basu</strong><br>Proposal
												Manager</span></span></span>
								</td><th></th>
							</tr>
							<tr>
								<td><span class="tooltip tooltip-effect-1"><span
										class="tooltip-item"><img id="yourimage"
											src="images/team/photo-Sanjay-M.Deshpande.png"
											width="125" height="125"
											style="margin: 15px 10px 0px 10px; border-radius: 50%" alt=""/></span><span
										class="tooltip-content clearfix"><img
											src="images/team/photo-Sanjay-M.Deshpande.png" alt=""/><span
											class="tooltip-text"><strong>Sanjay M
													Deshpande</strong><br>Proposal Manager</span></span></span>
								</td><th></th>
								<td><span class="tooltip tooltip-effect-1"><span
										class="tooltip-item"><img id="yourimage"
											src="images/team/photo-Kailash-Raghuvanshi.jpg"
											width="125" height="125"
											style="margin: 15px 10px 0px 10px; border-radius: 50%" alt=""/></span><span
										class="tooltip-content clearfix"><img
											src="images/team/photo-Kailash-Raghuvanshi.jpg" alt=""/><span
											class="tooltip-text"><strong>Kailash M
													Raghuvanshi</strong><br>Proposal Manager</span></span></span>
								</td><th></th>
							</tr>
						</table>
					</div>
				</div>

				<div
					style="float: right; width: 200px; height: 475px; margin-top: 0px; margin-right: 300px;">
					<table>
						<tr>
							<td><span class="tooltip_developers tooltip-effect-1"><span
									class="tooltip-item_developers"><img id="yourimage"
										src="images/team/photo-Arnab-Chakrabarty.jpg"
										width="75" height="75"
										style="margin: 0px 10px 10px 10px; border-radius: 50%" alt=""/></span><span
									class="tooltip-content_developers clearfix"><img
										src="images/team/photo-Arnab-Chakrabarty.jpg" alt=""/><span
										class="tooltip-text"><strong>Arnab Chakrabarty</strong><br>Proposal
											Developer</span></span></span>
							</td><th></th>
							<td><span class="tooltip_developers tooltip-effect-1"><span
									class="tooltip-item_developers"><img id="yourimage"
										src="images/team/photo-Sarmistha-Das.jpg"
										width="75" height="75"
										style="margin: 0px 10px 10px 10px; border-radius: 50%" alt=""/></span><span
									class="tooltip-content_developers clearfix"><img
										src="images/team/photo-Sarmistha-Das.jpg" alt=""/><span
										class="tooltip-text"><strong>Sarmistha Das</strong><br>Proposal
											Developer</span></span></span>
							</td><th></th>
							<td><span class="tooltip_developers tooltip-effect-1"><span
									class="tooltip-item_developers"><img id="yourimage"
										src="images/team/photo-Arijit-Debbarman.jpg"
										width="75" height="75"
										style="margin: 0px 10px 10px 10px; border-radius: 50%" alt=""/></span><span
									class="tooltip-content_developers clearfix"><img
										src="images/team/photo-Arijit-Debbarman.jpg" alt=""/><span
										class="tooltip-text"><strong>Arijit Debbarman</strong><br>Proposal
											Developer</span></span></span>
							</td><th></th>
						</tr>
						<tr>
							<td><span class="tooltip_developers tooltip-effect-1"><span
									class="tooltip-item_developers"><img id="yourimage"
										src="images/team/photo-Sanjukta-Kundu.png"
										width="75" height="75"
										style="margin: 15px 10px 10px 10px; border-radius: 50%" alt=""/></span><span
									class="tooltip-content_developers clearfix"><img
										src="images/team/photo-Sanjukta-Kundu.png" alt=""/><span
										class="tooltip-text"><strong>Sanjukta Kundu</strong><br>Proposal
											Developer</span></span></span>
							</td><th></th>
							<td><span class="tooltip_developers tooltip-effect-1"><span
									class="tooltip-item_developers"><img id="yourimage"
										src="images/team/photo-Soumya-Mukherjee.png"
										width="75" height="75"
										style="margin: 15px 10px 10px 10px; border-radius: 50%" alt=""/></span><span
									class="tooltip-content_developers clearfix"><img
										src="images/team/photo-Soumya-Mukherjee.png" alt=""/><span
										class="tooltip-text"><strong>Soumya Mukherjee</strong><br>Proposal
											Developer</span></span></span>
							</td><th></th>
							<td><span class="tooltip_developers tooltip-effect-1"><span
									class="tooltip-item_developers"><img id="yourimage"
										src="images/team/photo-Kaustabh-Nandi.jpg"
										width="75" height="75"
										style="margin: 15px 10px 10px 10px; border-radius: 50%" alt=""/></span><span
									class="tooltip-content_developers clearfix"><img
										src="images/team/photo-Kaustabh-Nandi.jpg" alt=""/><span
										class="tooltip-text"><strong>Kaustabh Nandi</strong><br>Proposal
											Developer</span></span></span>
							</td><th></th>

						</tr>
						<tr>
							<td><span class="tooltip_developers tooltip-effect-1"><span
									class="tooltip-item_developers"><img id="yourimage"
										src="images/team/photo-Paras-Doshi.jpg"
										width="75" height="75"
										style="margin: 15px 10px 10px 10px; border-radius: 50%" alt=""/></span><span
									class="tooltip-content_developers clearfix"><img
										src="images/team/photo-Paras-Doshi.jpg" alt=""/><span
										class="tooltip-text"><strong>Paras B Doshi</strong><br>Proposal
											Developer</span></span></span>
							</td><th></th>
							<td><span class="tooltip_developers tooltip-effect-1"><span
									class="tooltip-item_developers"><img id="yourimage"
										src="images/team/photo-Manisha-V.-Ghatpande.jpg"
										width="75" height="75"
										style="margin: 15px 10px 10px 10px; border-radius: 50%" alt=""/></span><span
									class="tooltip-content_developers clearfix"><img
										src="images/team/photo-Manisha-V.-Ghatpande.jpg" alt=""/><span
										class="tooltip-text"><strong>Manisha V
												Ghatpande</strong><br>Proposal Developer</span></span></span>
							</td><th></th>
							<td><span class="tooltip_developers tooltip-effect-1"><span
									class="tooltip-item_developers"><img id="yourimage"
										src="images/team/photo-Deepak-Gupta.png"
										width="75" height="75"
										style="margin: 15px 10px 10px 10px; border-radius: 50%" alt=""/></span><span
									class="tooltip-content_developers clearfix"><img
										src="images/team/photo-Deepak-Gupta.png" alt=""/><span
										class="tooltip-text"><strong>Deepak Gupta</strong><br>Proposal
											Developer</span></span></span>
							</td><th></th>
						</tr>
						<tr>
							<td><span class="tooltip_developers tooltip-effect-1"><span
									class="tooltip-item_developers"><img id="yourimage"
										src="images/team/photo-Amol-A.-Ketkar.jpg"
										width="75" height="75"
										style="margin: 15px 10px 10px 10px; border-radius: 50%" alt=""/></span><span
									class="tooltip-content_developers clearfix"><img
										src="images/team/photo-Amol-A.-Ketkar.jpg" alt=""/><span
										class="tooltip-text"><strong>Amol A Ketkar</strong><br>Proposal
											Developer</span></span></span>
							</td><th></th>
							<td><span class="tooltip_developers tooltip-effect-1"><span
									class="tooltip-item_developers"><img id="yourimage"
										src="images/team/photo-Nitin-R.-Patil.png"
										width="75" height="75"
										style="margin: 15px 10px 10px 10px; border-radius: 50%" alt=""/></span><span
									class="tooltip-content_developers clearfix"><img
										src="images/team/photo-Nitin-R.-Patil.png" alt=""/><span
										class="tooltip-text"><strong>Nitin R Patil</strong><br>Proposal
											Developer</span></span></span>
							</td><th></th>
							<td><span class="tooltip_developers tooltip-effect-1"><span
									class="tooltip-item_developers"><img id="yourimage"
										src="images/team/photo-Gaurav-Pandey.png"
										width="75" height="75"
										style="margin: 15px 10px 10px 10px; border-radius: 50%" alt=""/></span><span
									class="tooltip-content_developers clearfix"><img
										src="images/team/photo-Gaurav-Pandey.png" alt=""/><span
										class="tooltip-text"><strong>Gaurav Pandey</strong><br>Proposal
											Developer</span></span></span>
							</td><th></th>
						</tr>
						<tr>
							<td><span class="tooltip_developers tooltip-effect-1"><span
									class="tooltip-item_developers"><img id="yourimage"
										src="images/team/photo-Sutapriya-Das.jpg"
										width="75" height="75"
										style="margin: 15px 10px 0px 10px; border-radius: 50%" alt=""/></span><span
									class="tooltip-content_developers clearfix"><img
										src="images/team/photo-Sutapriya-Das.jpg" alt=""/><span
										class="tooltip-text"><strong>Sutapriya Das</strong><br>Proposal
											Developer</span></span></span>
							</td><th></th>
							<td><span class="tooltip_developers tooltip-effect-1"><span
									class="tooltip-item_developers"><img id="yourimage"
										src="images/team/photo-Shrirang-M-Bhave.jpg"
										width="75" height="75"
										style="margin: 15px 10px 0px 10px; border-radius: 50%" alt=""/></span><span
									class="tooltip-content_developers clearfix"><img
										src="images/team/photo-Shrirang-M-Bhave.jpg" alt=""/><span
										class="tooltip-text"><strong>Shrirang M Bhave</strong><br>Proposal
											Developer</span></span></span>
							</td><th></th>
							<td><span class="tooltip_developers tooltip-effect-1"><span
									class="tooltip-item_developers"><img id="yourimage"
										src="images/team/photo-Anupama-Jamwal.png"
										width="75" height="75"
										style="margin: 15px 10px 0px 10px; border-radius: 50%" alt=""/></span><span
									class="tooltip-content_developers clearfix"><img
										src="images/team/photo-Anupama-Jamwal.png" alt=""/><span
										class="tooltip-text"><strong> Anupama S Jamwal</strong><br>Proposal
											Developer</span></span></span>
							</td><th></th>
						</tr>
					</table>

				</div>
			</div>


		</div>
		<div id="contact_form" style="margin-top: 60px;height:520px;" class="portBox">

			<!-- <h3>Proposal Hub Request Form</h3> -->
				<div class="data-holder">
					<div class="form-holder">
					
						<form id ="" action="request" method="post" name="patreq" class="form-pat"  onsubmit="return validatesectorForm()">
							
							<h3>Proposal Hub Request</h3> 
							<h4>Please fill up the Request Details section (<span class="required">*</span> indicates mandatory fields)</h4>
							
							</h3>
							
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
									<input id="Region" type="text" name="reg" placeholder="" disabled />
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
									<span>Geo</span>
									<input  id="Geo" type="text" name="geo" placeholder="" disabled />
									</label>
								</div>
								
								
								
								
								
									<div class="leftfield industry">
									<label>
									<span>Industry<span class="required">*</span></span>&nbsp;
									<input  id="Industry" type="text" name="inds" placeholder="" readonly />
									</label>
								</div>
								
								
								<div class="rightfield sector">
									<label>
									<span>Sector</span>&nbsp;
									<input  id="Sctr" type="text" name="sctr"  placeholder="" disabled />
									</label>
								</div>
							
								
								<div class="leftfield">
									<label>
									<span>Client Name<span class="required">*</span></span>
									<input  id="clnt" type="text" name="clntnm" placeholder="" readonly />
									</label>
								</div>
								<br/>
								<div class="rightfield">
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
									<span>Total GBS TCV (Number in Million $)</span>
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
									<span>Request Date<span class="required">*</span></span><input id="demo1" type="text" name="reqstdate" readonly style="width: 290px;"><!-- <a href="javascript:NewCal('demo1')"><img src="images/cal.gif" width="16" height="16" border="0"></a> -->

									</label>
								</div>
								
								<div class="rightfield">
									<label>
									<span>Requestor (Intranet id) <span class="required">*</span></span>
									<input id="Email" type="text" name="rqstr" placeholder="" readonly/>
									</label>
								</div>
								
								<div class="leftfield">
									<label>
									<span>Type of Proposal <span class="required">*</span></span>
									<select name="typpro" id="prop">
										<option value="CS" selected>CS</option>
										<option value="CS_AMS">CS & AMS</option>
										<option value="AMS">AMS</option>
										<option value="GPS">GPS</option>
									</select>
									</label>
								</div>
<!-- 								
								<div class="rightfield">
									<label>
									<span>Contract Type</span>
									<select name="cntrtyp" id="ctrct">
										<option value="AMS" selected>AMS</option>
										<option value="ADS">CRM</option>
										<option value="CS">PEGA</option>
										<option value="GPS">GPS</option>
										<option value="OTHERS">OTHERS</option>
									</select>
									</label>
								</div> -->
								
								<div class="rightfield">
									<label>
									<span>Incumbent</span>
									<input id="Incumbent" type="text" name="inc" placeholder="" />
									</label>
								</div>
								
								<div class="leftfield">
									<label>
									<span>Main Competition</span>
									<input id="Competition" type="text" name="mncomp" placeholder="" />
									</label>
								</div>
								
								<div class="rightfield">
									<label>
									<span>Other Competitors</span>
									<input id="Competitors" type="text" name="othcomp" placeholder="" />
									</label>
								</div>
<!-- 								
								<div class="rightfield">
									<label>
									<span>Required Start Date</span>
									<input id="demo5" type="text" name="stdate" readonly style="width: 290px;"><a href="javascript:NewCal('demo5')"><img src="images/cal.gif" width="16" height="16" border="0"></a>

									</label>
								</div>
 -->								
								<div class="fullfield">
									<label>
									<span>Competitive Strategy Summary</span>
									<textarea id="csc" name="summ" placeholder=""></textarea>
									</label>
								</div>
								
								<div class="leftfield">
									<label>
									<span>Date this Proposal is Due from Proposal Hub<span class="required">*</span></span>
									<input id="demo6" type="text"  name="pdp" readonly style="width: 290px;"><!-- <a href="javascript:NewCal('demo6')"><img src="images/cal.gif" width="16" height="16" border="0"></a> -->

									</label>
								</div>
								
								<div class="rightfield">
									<label>
									<span>Date this Proposal is Due to Customer<span class="required">*</span></span><input id="demo7" type="text" name="pdc" readonly style="width: 290px;"><!-- <a href="javascript:NewCal('demo7')"><img src="images/cal.gif" width="16" height="16" border="0"></a> -->

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

		</div>
		<!-- 		<div id="feedback_form" style="margin-top:30px;" class="portBox" >
			<form id="form_1">
				<h3>PAT Feedback Form</h3>
				<p id="returnmessage"></p>
				<label>Name: <span>*</span></label> <input type="text" id="name"
					placeholder="Name" /> <label>Email: <span>*</span></label> <input
					type="text" id="email" placeholder="Email" /> <label>Contact
					No: <span>*</span>
				</label> <input type="text" id="contact" placeholder="10 digit Mobile no." />
				<label>Message:</label>
				<textarea id="message" placeholder="Message......."></textarea>
				<input type="button" id="submit" value="Send Message" />
			</form>
		</div> -->
	</div>


</body>
</html>
