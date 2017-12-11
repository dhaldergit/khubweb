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

<title>Content Update</title>



<link rel="stylesheet" href="css/master.css" type="text/css" media="all" />
<link rel="stylesheet" href="css/styles.css" type="text/css" media="all" />
<link rel="stylesheet" href="css/content.css" type="text/css"
	media="all" />

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


<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/tytabs.jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	document.getElementById("searchResultForm").style.visibility = "hidden";
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
    	$("#category").html(JSON.stringify(result.categoryHTML));
    	$("#type").html(JSON.stringify(result.typeHTML));
    	$("#serviceArea").html(JSON.stringify(result.serviceAreaHTML));
    	$("#industry").html(JSON.stringify(result.industryHTML));
    	 $('#loading').hide();
    },
    type: 'POST'
    }); 
});

function validateCategory() {
	if (document.getElementById("type").value == 'HomePage') {
		var hmElement = document.getElementById("category");
		hmElement.disabled = false;
		removeAllChildren(hmElement);
		var opElement = document.createElement("option");
		opElement.setAttribute("value", "");
		opElement.innerHTML = "Please Select";
		hmElement.appendChild(opElement);
		
		opElement = document.createElement("option");
		opElement.setAttribute("value", "Sales_Enablers");
		opElement.innerHTML = "Sales_Enablers";
		hmElement.appendChild(opElement);
		
		
		opElement = document.createElement("option");
		opElement.setAttribute("value", "Competition_Watch");
		opElement.innerHTML = "Competition_Watch";
		hmElement.appendChild(opElement);
		
		opElement = document.createElement("option");
		opElement.setAttribute("value", "What_We_Have_Done");
		opElement.innerHTML = "What_We_Have_Done";
		hmElement.appendChild(opElement);
		
		opElement = document.createElement("option");
		opElement.setAttribute("value", "Pricing");
		opElement.innerHTML = "Pricing";
		hmElement.appendChild(opElement);
		
		opElement = document.createElement("option");
		opElement.setAttribute("value", "Request_Response");
		opElement.innerHTML = "Request_Response";
		hmElement.appendChild(opElement);
		
		opElement = document.createElement("option");
		opElement.setAttribute("value", "Market,CAMSS");
		opElement.innerHTML = "Market,CAMSS";
		hmElement.appendChild(opElement);
		
		opElement = document.createElement("option");
		opElement.setAttribute("value", "Industries, ServiceLines");
		opElement.innerHTML = "Industries, ServiceLines";
		hmElement.appendChild(opElement);
		
	} else if (document.getElementById("type").value == 'Proposal Inserts') {
		var hmElement = document.getElementById("category");
		hmElement.disabled = false;
		removeAllChildren(hmElement);
		var opElement = document.createElement("option");
		opElement.setAttribute("value", "");
		opElement.innerHTML = "Please Select";
		hmElement.appendChild(opElement);
		addOptions(hmElement,"Organization Specific");
		addOptions(hmElement,"Transition and Transformation");
		addOptions(hmElement,"Growth Areas");
		addOptions(hmElement,"Service Line Specific");
		addOptions(hmElement,"Industry Specific");
		addOptions(hmElement,"Others");
		
	}
	else {
		var hmElement = document.getElementById("category");
		removeAllChildren(hmElement);
		document.getElementById("category").disabled = true;
	}
}

function isEmpty(str) {
    return (!str || 0 === str.length);
}

function submitButton() {
	//alert("here");
	var strVal = document.getElementById("type").value;
	if(isEmpty(strVal)) {
		alert("Please Select a TYPE");
		return;
	}
	$('#loading').show();
		var ctx = "<%=request.getContextPath()%>";
		clearTable(document.getElementById('contentTable'));
		var sForm = document.getElementById("searchForm");
		var formVals = $("#searchForm").serialize();
		console.log(formVals);
		$.ajax({
			url : ctx + "/ProposalServlet?khubPageId=searchContentPage&"+formVals.replace('\"',''),
			success : function(result) {
				var res = JSON.stringify(result);
				

				var emptyResultFlag = true;
				var json = JSON.parse(res);
				var cEle = document.getElementById('contentTable');
				clearTable(cEle);

				for (var i = 0; i < json.length; i++) {
					var chEle = document.createElement('tr');
					chEle.setAttribute('id', "r" + i);
					 var valJson = json[i];
					
					 for(var j in valJson) {
						 emptyResultFlag = false;
					var ach = document.createElement('td');
					
					if(j == "industryDD" || j == "serviceAreaDD" || j == "countryDD" || j == "categoryDD" || j == "typeDD" || j == "isBoxDD" || j == "isRetiredDD" || j == "proposalInsertCategoryDD" || j == "dayDiff") {
						continue;
					} else if(j == "industry" || j == "serviceLine" || j == "geo" || j == "type" || j == "isBox"  || j == "isRetired") {
						var cell1 = document.createElement('select');
						cell1.setAttribute('id', "r"+i+"_"+j);
						if (j == "industry" ) {
							$(cell1).html(valJson.industryDD);
						} else if (j == "serviceLine") {
							
							$(cell1).html(valJson.serviceAreaDD);
						} else if (j == "geo") {
							
							$(cell1).html(valJson.geoDD);
						} else if (j == "isBox") {
							$(cell1).html(valJson.isBoxDD);
						} else if (j == "isRetired") {
							$(cell1).html(valJson.isRetiredDD);
						} else if (j == "category") {
							var tVal = valJson.type;
							if (tVal.toUpperCase().trim() == "HOMEPAGE") {
								$(cell1).html(valJson.categoryDD);	
							} else if (tVal.toUpperCase().trim() == "PROPOSAL INSERTS") {
								$(cell1).html(valJson.proposalInsertCategoryDD);	
							}
							
						} else if (j == "type") {
							cell1.setAttribute('onClick', "validateType(this)");
							$(cell1).html(valJson.typeDD);
						}
						
					} else {
					
					var cell1 = document.createElement('input');
					cell1.setAttribute('id', "r"+i+"_"+j);
					if(j == "contentId") {
						cell1.setAttribute('type', 'hidden');
					} else {
						cell1.setAttribute('type', 'text');
					}
					cell1.setAttribute('value', valJson[j]);
					}
					ach.appendChild(cell1);
					chEle.appendChild(ach);
					cEle.appendChild(chEle);
					
					} 

				}
				
				if(emptyResultFlag) {
					alert("Search Result is Blank");
					$('#loading').hide();
					return;
				}
				document.getElementById("searchResultForm").style.visibility = "visible";
				$('#loading').hide();
			},
			type : 'POST'
		});

	}
	
	
function validateType(tElement) {
	if (tElement.value == 'HomePage') {
		
		var sArr = tElement.id.split("_");
		var hmElement = document.getElementById(sArr[0]+"_category");
		hmElement.disabled = false;
		removeAllChildren(hmElement);
		var opElement = document.createElement("option");
		opElement.setAttribute("value", "Please Select");
		opElement.innerHTML = "";
		hmElement.appendChild(opElement);
		
		
		document.createElement("option");
		opElement.setAttribute("value", "Sales_Enablers");
		opElement.innerHTML = "Sales_Enablers";
		hmElement.appendChild(opElement);
		
		opElement = document.createElement("option");
		opElement.setAttribute("value", "Competition_Watch");
		opElement.innerHTML = "Competition_Watch";
		hmElement.appendChild(opElement);
		
		opElement = document.createElement("option");
		opElement.setAttribute("value", "What_We_Have_Done");
		opElement.innerHTML = "What_We_Have_Done";
		hmElement.appendChild(opElement);
		
		opElement = document.createElement("option");
		opElement.setAttribute("value", "Pricing");
		opElement.innerHTML = "Pricing";
		hmElement.appendChild(opElement);
		
		opElement = document.createElement("option");
		opElement.setAttribute("value", "Request_Response");
		opElement.innerHTML = "Request_Response";
		hmElement.appendChild(opElement);
		
		opElement = document.createElement("option");
		opElement.setAttribute("value", "Market,CAMSS");
		opElement.innerHTML = "Market,CAMSS";
		hmElement.appendChild(opElement);
		
		opElement = document.createElement("option");
		opElement.setAttribute("value", "Industries, ServiceLines");
		opElement.innerHTML = "Industries, ServiceLines";
		hmElement.appendChild(opElement);
		
	} else if (tElement.value == 'Proposal Inserts') {
		var sArr = tElement.id.split("_");
		var hmElement = document.getElementById(sArr[0]+"_category");
		hmElement.disabled = false;
		removeAllChildren(hmElement);
		var opElement = document.createElement("option");
		opElement.setAttribute("value", "Please Select");
		opElement.innerHTML = "";
		hmElement.appendChild(opElement);
		addOptions(hmElement,"Organization Specific");
		addOptions(hmElement,"Transition and Transformation");
		addOptions(hmElement,"Growth Areas");
		addOptions(hmElement,"Service Line Specific");
		addOptions(hmElement,"Industry Specific");
		addOptions(hmElement,"Others");
		
	}
	else {
		var sArr = tElement.id.split("_");
		var hmElement = document.getElementById(sArr[0]+"_category");
		removeAllChildren(hmElement);
		hmElement.disabled = true;
	}
}

function removeAllChildren (node) {
    var last;
    while (last = node.lastChild) node.removeChild(last);
};

function addOptions(selElement, opText) {
	
	var opElement = document.createElement("option");
	opElement.setAttribute("value", opText);
	opElement.innerHTML = opText;
	selElement.appendChild(opElement);
}

	function addCells(table, rowObj, type, value, colName, rowIndex) {
		var ach = document.createElement('td');
		var cell1 = document.createElement('input');
		cell1.setAttribute('id', "r" + rowIndex + "_" + colName);
		cell1.setAttribute('type', type);
		cell1.setAttribute('value', value);
		ach.appendChild(cell1);
		rowObj.appendChild(ach);
		table.appendChild(rowObj);
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
	
	function submitData(){
		$('#loading').show();
		

		//alert("here");
		var ctx = "<%=request.getContextPath()%>";
		var dataTable = document.getElementById("contentTable");
		//alert(dataTable.rows.length);
		var tableData = [];
		var colNames = {
			"khContentStoreId" : "",
			"link" : "",
			"contentName" : "",
			"industry" : "",
			"serviceLine" : "",
			"type" : "",
			"datePublished" : "",
			"isRetired" : "",
			"top" : "",
			"shortName" : "",
			"country" : "",
			"growthareaCamss" : "",
			"competitors" : "",
			"year" : "",

			"externalLink"  : ""
		};
		for (var i = 0; i < dataTable.rows.length - 1; i++) {
			var tableArray = {};
			for ( var j in colNames) {
				tableArray[j] = document.getElementById("r" + i + "_" + j).value;
			}
			tableData.push(tableArray);
		}
		//alert(JSON.stringify(tableData));
		$.ajax({
			url : ctx + "/ProposalServlet?khubPageId=contentFormUpdatePage",
			success : function(result) {
				$('#loading').hide();
				window.location.assign("/success.jsp");
			},
			type : 'POST',
			data : {
				"tableData" : JSON.stringify(tableData)
			}
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
	background-image:url('/images/loading.gif');
	background-color: rgba(0, 0, 0, .5);
	background-repeat : no-repeat;
	background-position : center;
     -webkit-transition: all .5s ease; 
	z-index: 1000;
	display: none;
}

<!--
#slide-wrap {
	margin: 0 auto;
	overflow: auto;
	background: #BCC5E1;
	border: 1px solid #000;
}

#inner-wrap {
	float: left;
	margin-right: -30000px;
	/*Be safe with Opera's limited negative margin of 32695px (-999em could cause problems with large font sizes)*/
	padding-left: 20px;
}

fieldset {
	margin: 10px;
	padding: 10px;
	border: 2px solid #D0D0D0;
}

label {
	float: left;
	width: 320px;
	font-weight: bold;
}

div.horizontal-fields input, div.horizontal-fields textarea, div.horizontal-fields select,
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
	height:200px;
}

.service-item {
	clear: left;
}

input {
	float: left;
	width: 100px;
	margin-bottom: 5px;
	margin-right: 10px;
}

textarea {
	float: left;
	width: 180px;
	margin-bottom: 5px;
	margin-right: 10px;
}

textarea {
	width: 250px;
	height: 150px;
}

select {
	margin-bottom: 5px;
	margin-right: 10px;
}
-->
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
<!-- 					<div class="pat-head">
						<h1>Content Update</h1>
					</div> -->
										<div id="breadcrumb-holder_form">
						<a href='index.jsp'>Home</a> > Content Update
					</div>
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

							<form action="" id="searchForm" name="searchForm"
								class="form-pat">

								<h1>Content Update</h1>
								<font color='red'>
									<div id="pik"></div>
								</font><br />



								<fieldset>
									<legend>Search</legend>


									<div class="leftfield">
										<label> <span>Type <span class="required">*</span></span>
											<select name="type" id="type" onclick="validateCategory();">
												<option value="">Proposal</option>
												<option value="">Proposal Inserts</option>
												<option value="">Capabilities</option>
												<option value="">HomePage</option>

										</select>
										</label>
									</div>


									<div class="rightfield">
										<label> <span>Category 
										<!-- <span class="required">*</span> -->
										</span>
											<select name="category" id="category">

										</select>
										</label>
									</div>
									<div class="leftfield">
										<label> <span style="">Content Name</span> <input
											id="contentName" type="text" name="contentName" placeholder="" />
										</label> <label> <span style="">Industry</span> <select
											id="industry" name="industry">


										</select>
										</label>

									</div>
									<div class="rightfield">
										<label> <span style="">Service Area</span> <select
											id="serviceArea" name="serviceArea">


										</select>
										</label>
									</div>




									<div class="rightfield">
										<label> <span style="margin: 35px 0px 0px 0px">Is
												Retired <span class="required">*</span>
										</span> <span style="margin: 30px 0px"><input type="radio"
												name="isRetired" value="Y"> Yes <br> <input
												type="radio" name="isRetired" value="N" checked="checked">
												No</br></span>

										</label>
									</div>


									
									
									<!-- <div class="rightfield" style="margin: 0px 60px 0px 0px; ">
										<label> <span style="margin: 35px 0px 0px 0px">Is
												Box Present <span class="required">*</span>
										</span> <span style="margin: 30px 0px"><input type="radio"
												name="isBox" value="Y"> Yes <br> <input
												type="radio" name="isBox" value="N" checked="checked">
												No</br></span>

										</label>
									</div> -->
									
									<div class="leftfield">
										<label> <span style="margin: 10px 0px 0px 0px"></span>
											<input type="button" class="button" value="Search"
											onclick="submitButton();">
										</label>
									</div>
								</fieldset>


							</form>
							<form id="searchResultForm" name="searchResultForm" action="" class="form-pat">

								<fieldset>
									<legend>Update</legend>
									<div id="slide-wrap">
										<div id="inner-wrap">
											<div style="display: inline-block;"
												class="horizontal-fields service-item">
												<table id="contentTable" border="1" >
													<tr>

														<td style="visibility: hidden;"><label
															for="service_name">Id</label></td>
														<!-- <td ><label for="service_name">Id</label></td> -->

														<td><label for="service_name">Link</label></td>

														<td><label for="service_description">Content
																Name</label></td>
														<td><label for="service_price">Industry</label>
															<p></td>
														<td><label for="service_duration">Type</label>
															<p></td>
														<td><label for="service_duration">Date of
																Publish</label></td>
														<td><label for="service_duration">Retired</label></td>
														<td><label for="service_duration">Country</label></td>
														<td><label for="service_duration">Service
																Area</label></td>
														<td><label for="service_duration">Growth Area
																/ CAMSS</label></td>
														<td><label for="service_duration">Competitors</label>

														</td>
														<td><label for="service_duration">Year</label></td>
														<td><label for="service_duration">Home Page
																Links</label></td>
														<td><label for="service_duration">Short
																Description</label></td>
														<td><label for="service_duration">Is in Box ?</label></td>

													</tr>

													
												</table>
												<br>
											</div>

										</div>
									</div>
								</fieldset>


								<label> <span>&nbsp;</span> <input type="button"
									class="button" value="Update" onclick="submitData();">
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