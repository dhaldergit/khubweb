
<%@page import="com.ibm.khub.pojo.UserDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=0" />
<meta http-equiv="Content-Type" content="text/html;charset=windows-1252">

<meta http-equiv="content-type" content="text/html;charset=utf-8" />

<title>PAT Search</title>



<link rel="stylesheet" href="css/master.css" type="text/css" media="all" />
<link rel="stylesheet" href="css/styles.css" type="text/css" media="all" />

<link rel="stylesheet" href="css/new-topnav.css" media="screen">

<link rel="stylesheet" href="css/form-styles-v2.css" media="screen">

<script type="text/javascript" src="js/datetimepicker.js"></script>	

<script type="text/javascript" src="js/validation.js"></script>	
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>


<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/tytabs.jquery.min.js"></script>
<script type="text/javascript" src="js/datetimepicker.js"></script>


  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<script type="text/javascript">

$( function() {
    $( "#requestDate" ).datepicker({
        showOn: "button",
        buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
        buttonImageOnly: true
    });
  } );

$(document).ready(function(){
	document.getElementById("patResultForm").style.visibility = "hidden";
	$('#loading').show();
	 var ctx = "<%=request.getContextPath()%>";
	//alert(ctx);
	/* if( document.getElementById("bas_div").hasChildNodes()) {
	 var nxt = document.getElementById("bas_div").firstChild;
	 document.getElementById("bas_div").removeChild(nxt);
	} */
    $.ajax({url: ctx+"/ProposalServlet?khubPageId=populateDropDowns", 
    		success: function(result) {
    	//alert(JSON.stringify(result.categoryHTML));
    	//$("#category").html(JSON.stringify(result.categoryHTML));
    	//$("#type").html(JSON.stringify(result.typeHTML));
    	//$("#serviceArea").html(JSON.stringify(result.serviceAreaHTML));
    	$("#industry").html(JSON.stringify(result.industryHTML));
    	$("#geo").html(JSON.stringify(result.geoHTML));
    	 $('#loading').hide();
    },
    type: 'POST'
    }); 
});



function submitButton() {
	//alert("here");
	$('#loading').show();
	document.getElementById("patResultForm").style.visibility = "hidden";
		var ctx = "<%=request.getContextPath()%>";
		clearTable(document.getElementById('contentTable'));
		var sForm = document.getElementById("searchForm");
		var formVals = $("#searchForm").serialize();
		console.log(formVals);
		$.ajax({
			url : ctx + "/ProposalServlet?khubPageId=patSearchPage&"+formVals.replace('\"',''),
			success : function(result) {
				var res = JSON.stringify(result);
				var json = JSON.parse(res);
				
				var cEle = document.getElementById('contentTable');
				clearTable(cEle);
                var isSearchEmpty = true;
				for (var i = 0; i < json.length; i++) {
					var chEle = document.createElement('tr');
					chEle.setAttribute('id', "r_" + i);
					chEle.setAttribute('class', "rowdata");
					 var valJson = json[i];
					 /*if (valJson.hasOwnProperty('url')) {

					} else {
						addCells(cEle, chEle, "text", "", "url", i);
					}
 */
 
					 for(var j in valJson) {
						isSearchEmpty = false;
					//var ach = document.createElement('td');
					var cell1 = document.createElement('td');
					
					
					//var cell1 = document.createElement('input');
					
					if(j == "id") {
						cell1.setAttribute('style', 'visibility:hidden');
					} //else {
						//cell1.setAttribute('type', 'text');
						//cell1.setAttribute('readonly',"true");
					//}
				//	cell1.setAttribute('value', valJson[j]);
				if( j == "isComplete") {
					var selElement = document.createElement("select");
					var opElement = document.createElement("option");
					opElement.setAttribute("value", "Y");
					opElement.innerHTML = "Y";
					selElement.appendChild(opElement);
					opElement = document.createElement("option");
					opElement.setAttribute("value", "N");
					opElement.innerHTML = "N";
					selElement.appendChild(opElement);
					selElement.setAttribute('id', "r_"+i+"_"+j);
					selElement.value =  valJson[j];
					cell1.appendChild(selElement);
				} else {
					cell1.setAttribute('id', "r_"+i+"_"+j);
					cell1.innerHTML = valJson[j];
				}
					//ach.appendChild(cell1);
					//chEle.appendChild(ach);
					chEle.appendChild(cell1);
					cEle.appendChild(chEle);
					
				}

				}
				if(isSearchEmpty) {
					alert("No record found!!!!!");
					$('#loading').hide();
					return;
				} else {
					document.getElementById("patResultForm").style.visibility = "visible";
				}
				$('#loading').hide();
			},
			type : 'POST'
		});

	}

function clearTable(table) {
	var rows = table.rows;
	var i = rows.length;
	while (--i) {
		rows[i].parentNode.removeChild(rows[i]);
		// or
		// table.deleteRow(i);
	}
}




function submitUpdateForm() {
	//alert("here");
	$('#loading').show();
		var ctx = "<%=request.getContextPath()%>";
		var x = document.getElementById("contentTable").rows.length;
		//alert(x);
		var tableData = { 
			    khReqData : [] 
			};

		for (var i=0; i< x - 1 ; i++)
			{
			var jsonData = {};
			//var yesNo = document.getElementById(i).value;
			
			var colVal = document.getElementById("r_"+i+"_isComplete").value;
			var colId = document.getElementById("r_"+i+"_id").innerHTML;
			//jsonData.yesNo = yesNo;
			jsonData.colId = colId;
			jsonData.colVal = colVal;
			tableData.khReqData.push(jsonData);
			
			}
		var newData = JSON.stringify(tableData);
		$.ajax({
			url : ctx + "/ProposalServlet?khubPageId=patSearchUpdatePage&tableData="+newData,
			success : function(result) {
				alert("Content Udate Successful !!!!!!!!");
				$('#loading').hide();
			},
			type : 'POST'
		});

	}




</script>

<style type="text/css">
#loading {
	width: 100%;
	height: 100%;
	position: fixed;
	top: 0;
	left: 0;
	background-color: rgba(0, 0, 0, .5);
	-webkit-transition: all .5s ease;
	z-index: 1000;
	display: none;
}

#slide-wrap {
    margin:0 auto;
    overflow: auto;
    background:#BCC5E1;
    border:1px solid #000;
}
#inner-wrap {
    float:left;
    margin-right:-30000px;/*Be safe with Opera's limited negative margin of 32695px (-999em could cause problems with large font sizes)*/
    padding-left:20px;
    height:200px;
    width:300px;
}

fieldset{
    margin: 10px;
    padding: 10px;
    border: 2px solid #D0D0D0;
}

label{
    float: left;
    width: 320px;
    font-weight: bold;
}

div.horizontal-fields input,
div.horizontal-fields textarea,
div.horizontal-fields select,
div.horizontal-fields label {
    float: left;
    width: auto;
}

div.horizontal-fields button {
    width: auto;
    margin: 0;
}

/* Horizontal fields is the class which is not re-sizing it's with correctly */
.horizontal-fields {
    display: inline-block;
    width: 100%;
}
        
.service-item {
    clear: left;
}

input{
    float: left;
    width: 100px;
    margin-bottom: 5px;
    margin-right: 10px;
} 
textarea{
    float: left;
    width: 180px;
    margin-bottom: 5px;
    margin-right: 10px;
}

textarea{
    width: 250px;
    height: 150px;
}

select {
    margin-bottom: 5px;
    margin-right: 10px;
}


        </style>


<body>

<div id="loading"></div>
<!-- WRAPPER START -->
<div id="wrapper">
	<!-- Container Start -->
	<div class="container">
		<!-- Header -->
		
		<!-- Header End -->
		
		<div class="clear"></div>
		
		<!-- Top-nav -->
		<%@ include file="include/headers.jsp" %>
	
		<!-- <div id='cssmenu'>
			<ul>
			   <li class='active has-sub'><a href='index.html'><span style="font-size: 14px; font-weight: bold; padding-right: 10px; padding-left: 10px;">Home</span></a></li>
			   <li class='active has-sub'><a href='#'><span style="font-size: 14px; font-weight: bold; padding-right: 10px; padding-left: 10px;">Story Bank</span></a>
				  <ul>
					 <li class='has-sub'><a href='#'><span style="font-size: 12px; font-weight: bold;">Communications</span></a>
						<ul>
						   <li><a href='#'><span style="font-size: 12px; font-weight: bold;">E&U</span></a></li>
						   <li><a href='#'><span style="font-size: 12px; font-weight: bold;">M&E</span></a></li>
						   <li class='last'><a href='#'><span style="font-size: 12px; font-weight: bold;">Telco</span></a></li>
						</ul>
					 </li>
					 <li class='has-sub'><a href='#'><span style="font-size: 12px; font-weight: bold;">Distribution</span></a>
						<ul>
						   <li><a href='#'><span style="font-size: 12px; font-weight: bold;">CPG</span></a></li>
						   <li><a href='#'><span style="font-size: 12px; font-weight: bold;">LSP</span></a></li>
						   <li><a href='#'><span style="font-size: 12px; font-weight: bold;">Retail</span></a></li>
						   <li class='last'><a href='#'><span style="font-size: 12px; font-weight: bold;">T&T</span></a></li>
						</ul>
					 </li>
					 <li class='has-sub'><a href='#'><span style="font-size: 12px; font-weight: bold;">Financial</span></a>
						<ul>
						   <li><a href='#'><span style="font-size: 12px; font-weight: bold;">Banking</span></a></li>
						   <li><a href='#'><span style="font-size: 12px; font-weight: bold;">Financial Services</span></a></li>
						   <li class='last'><a href='#'><span style="font-size: 12px; font-weight: bold;">Insurance</span></a></li>
						</ul>
					 </li>
					  <li class='has-sub'><a href='#'><span style="font-size: 12px; font-weight: bold;">Industrial</span></a>
						<ul>
						   <li><a href='#'><span style="font-size: 12px; font-weight: bold;">Auto</span></a></li>
						   <li><a href='#'><span style="font-size: 12px; font-weight: bold;">C&P</span></a></li>
						   <li class='last'><a href='#'><span style="font-size: 12px; font-weight: bold;">Electronics</span></a></li>
						</ul>
					 </li>
					  <li class='has-sub'><a href='#'><span style="font-size: 12px; font-weight: bold;">Public</span></a>
						<ul>
						   <li><a href='#'><span style="font-size: 12px; font-weight: bold;">Government</span></a></li>
						</ul>
					 </li>
					
				  </ul>
			   </li>
			   
			   
			   
			   <li class='active has-sub'><a href='proposalbank.jsp'><span style="font-size: 14px; font-weight: bold; padding-right: 10px; padding-left: 10px;">Proposal Bank</span></a></li>
			   
			   <li class='active has-sub'><a href='kmt.html'><span style="font-size: 14px; font-weight: bold; padding-right: 10px; padding-left: 10px;">Knowledge Management Team</span></a>
				  <ul>
					 <li class='has-sub'><a href='kh_contribute.jsp'><span style="font-size: 12px; font-weight: bold;">Contribute Intellectual Capital</span></a></li>
					 <li class='has-sub'><a href='kh_feedback.jsp'><span style="font-size: 12px; font-weight: bold;">KH Feedback</span></a></li>
					 <li class='last'><a href='#'><span style="font-size: 12px; font-weight: bold;">Request Intellectual Capital</span></a></li>
				  </ul>
			   </li>
			   
				<li class='has-sub'><a href='pat.html'><span style="font-size: 14px; font-weight: bold; padding-right: 10px; padding-left: 10px;">Proposal Assistance Team</span></a>
				  <ul>
					 <li class='has-sub'><a href='pat_feedback.jsp'><span style="font-size: 12px; font-weight: bold; width: 300px;">PAT Feedback</span></a></li>
					 <li class='last'><a href='pat_request.jsp'><span style="font-size: 12px; font-weight: bold; width: 300px;">Request Proposal Development</span></a></li>
				  </ul>
			   </li>
			   
			   
			   <li class='active has-sub'><a href='contentlist.jsp'><span style="font-size: 14px; font-weight: bold; padding-right: 10px; padding-left: 10px;">Content List</span></a></li>
			   
			   
			   <li class='last'><a href='#'><span>Sitemap</span></a></li>
			   <li class='active has-sub'><a href='sitemap.jsp'><span style="font-size: 14px; font-weight: bold; padding-right: 22px; padding-left: 22px;">Sitemap</span></a></li>
			   
			</ul>
			</div>
			
		</div> -->
		<!-- Top-nav End -->
		
		<div class="clear"></div>
		
		<!-- Main data -->
		<div id="main">
			<div class="mid-data-container">
				<!-- top heading start -->
<!-- 				<div class="pat-head">
					<h1>Search Proposal Hub</h1>
				</div> -->
				<!-- top heading end -->
				
				<div class="clear"></div>
				
					<!-- Breadcrumb Start--->
					<div id="breadcrumb-holder_form">
						<a href='index.jsp'>Home</a> > Proposal Hub Request Search
					</div>
					
					<!-- Breadcrumb End-->
				
				<!-- body data Start -->
				<div class="data-holder">
					<div class="form-holder">
					
						<form id="searchForm" name="searchForm" class="form-pat" onsubmit="return validateForm(this)">
							
							<h1>Search Proposal Hub 
							</h1>
							    <font color='red'> <div id="pik"> </div> </font><br/>


						
							<fieldset>
								<legend>Search</legend>
								

								
							<div class="leftfield" >
									<label>
									<span>Opportunity Number<span class=""></span></span>
									<input  id="oppNo" type="text" name="oppNo" value="" placeholder="" />
									</label>
								</div>
								<div class="rightfield">
									<label>
									<span>Opportunity Name<span class=""></span></span>
									<input  id="oppName" type="text" name="oppName" placeholder="" />
									</label>
								</div>
								

								


								
								<div class="leftfield"><label>
									<span>Industry<span ></span></span>
									<select name="industry" id="industry">
										<option value="">Automotive</option>
										<option value="">Aerospace & Defence</option>
										<option value="">Banking / Financial Markets</option>
										
									</select>
									</label>
								</div>
								<div class="rightfield"><label>
									<span>Geo</span>
									<select id="geo" name="geo">
									
										
									</select>
									</label>
								</div>

							<div class="leftfield" >
									<label>
									<span>Requested by (IBM Intranet ID)<span class=""></span></span>
									<input  id="requester" type="text" name="requester" value="" placeholder="" />
									</label>
									
							
								</div>
								
                            <div class="rightfield">
									
									<span>Request Date </span>
								<!-- <input id="demo1" type="text" name="txtreqdate" style="width: 320px;"><a href="javascript:NewCal('demo1')"><img src="images/cal.gif" width="16" height="16" border="0"></a> -->
	  								<input type="text" id="requestDate" name="requestDate">
									
								</div>
							</fieldset>
							<label>
								<span>&nbsp;</span> 
								<input type="button" class="button" value="Search" onclick="submitButton();">&nbsp;&nbsp;
								
							</label>
							
							</form>
							<form id="patResultForm" name="patResultForm" class="form-pat">
							<fieldset>
								<legend>Results</legend>
								
								            <div id="slide-wrap">
                <div id="inner-wrap">
                    <div style="display: inline-block;" class="horizontal-fields service-item">
                    <table id="contentTable" border="1">
                    	<tr>
                    	<td style="visibility: hidden;"><label
															for="service_name">Id</label></td>
															
						<td style="width:10px;padding-left:5px;padding-right:7px;font-size:14px;font-family:TimesNewRoman">
                        <label for="service_duration">Client Name</label><p>
                       
                        </td>
															
						<td style="width:10px;padding-left:5px;padding-right:7px;font-size:14px;font-family:TimesNewRoman">
                        <label for="service_description">Geo</label>

						</td>
						<td style="width:10px;padding-left:5px;padding-right:7px;font-size:14px;font-family:TimesNewRoman">
                        <label for="service_price">Region</label><p>
                        			
                        </td>
                        
                         <td style="width:10px;padding-left:5px;padding-right:7px;font-size:14px;font-family:TimesNewRoman">
                        <label for="service_duration">Opportunity No</label>
                        </td>
						
                        <td style="width:10px;padding-left:5px;padding-right:7px;font-size:14px;font-family:TimesNewRoman">
                        <label for="service_duration">Opportunity Name</label>
                        
                        </td>
                        <td style="width:10px;padding-left:5px;padding-right:7px;font-size:14px;font-family:TimesNewRoman">
                        <label for="service_duration">Industry</label>
                        
                        </td>
                        <td style="width:10px;padding-left:5px;padding-right:7px;font-size:14px;font-family:TimesNewRoman">
                        <label for="service_duration">Sector</label>
                        
                        </td>
                        <td style="width:10px;padding-left:5px;padding-right:7px;font-size:14px;font-family:TimesNewRoman">
                        <label for="service_duration">Offering Area</label>
                        
                        </td>
                        <td style="width:10px;padding-left:5px;padding-right:7px;font-size:14px;font-family:TimesNewRoman">
                        <label for="service_duration">TCV</label>
                        
                        </td>
                        <td style="width:10px;padding-left:5px;padding-right:7px;font-size:14px;font-family:TimesNewRoman">
                        <label for="service_duration">Description</label>
                        
                        </td>
                        <td style="width:10px;padding-left:5px;padding-right:7px;font-size:14px;font-family:TimesNewRoman">
                        <label for="service_duration">Country</label>
                        
                        </td>
                        <td style="width:10px;padding-left:5px;padding-right:7px;font-size:14px;font-family:TimesNewRoman">
                        <label for="service_duration">Service Line</label>
                        
                        </td>
                        <td style="width:10px;padding-left:5px;padding-right:7px;font-size:14px;font-family:TimesNewRoman">
                        <label for="service_duration">Owner</label>
                        
                        </td>
                        <td style="width:10px;padding-left:5px;padding-right:7px;font-size:14px;font-family:TimesNewRoman">
                        <label for="service_duration">Proposal Type</label>
                        
                        </td>
                        <td style="width:10px;padding-left:5px;padding-right:7px;font-size:14px;font-family:TimesNewRoman">
                        <label for="service_duration">Contract</label>
                        
                        </td>
                        <td style="width:10px;padding-left:5px;padding-right:7px;font-size:14px;font-family:TimesNewRoman">
                        <label for="service_duration">Incumbent</label>
                        
                        </td>
                        <td style="width:10px;padding-left:5px;padding-right:7px;font-size:14px;font-family:TimesNewRoman">
                        <label for="service_duration">Main Competitor</label>
                        
                        </td>
                        <td style="width:10px;padding-left:5px;padding-right:7px;font-size:14px;font-family:TimesNewRoman">
                        <label for="service_duration">Other Competitors</label>
                        
                        </td>
                        <td style="width:10px;padding-left:5px;padding-right:7px;font-size:14px;font-family:TimesNewRoman">
                        <label for="service_duration">Start Date</label>
                        
                        </td>
                       <td style="width:10px;padding-left:5px;padding-right:7px;font-size:14px;font-family:TimesNewRoman">
                        <label for="service_duration">Strategy</label>
                        
                        </td>
                        <td style="width:10px;padding-left:5px;padding-right:7px;font-size:14px;font-family:TimesNewRoman">
                        <label for="service_duration">Proposal Due Date</label>
                        
                        </td>
                        <td style="width:10px;padding-left:5px;padding-right:7px;font-size:14px;font-family:TimesNewRoman">
                        <label for="service_duration">Proposal Due Date Customer</label>
                        
                        </td>
                      <td style="width:10px;padding-left:5px;padding-right:7px;font-size:14px;font-family:TimesNewRoman">
                        
                        <label for="service_name">Requested by</label>
                        
                        </td>
                        
                         </td>
                        <td style="width:10px;padding-left:5px;padding-right:7px;font-size:14px;font-family:TimesNewRoman">
                        <label for="service_duration">Completed Date</label>
                        
                        </td>
                        <td style="width:10px;padding-left:5px;padding-right:7px;font-size:14px;font-family:TimesNewRoman">
                        <label for="service_duration">Request Date</label>
                        
                        </td> 
                        <td style="width:10px;padding-left:5px;padding-right:7px;font-size:14px;font-family:TimesNewRoman">
                        
                        <label for="service_name">Is Completed ?</label>
                        
                        </td>
                        </tr>
                        
                       
					</table>
                        <br>
                    </div>

                </div>
            </div>
								
								
							</fieldset>
							
							
<label>
								<span>&nbsp;</span> 
								<input type="button" class="button" value="Update" onclick="submitUpdateForm();">&nbsp;&nbsp;
								
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