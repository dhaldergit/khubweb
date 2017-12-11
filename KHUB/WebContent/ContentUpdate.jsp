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

 <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="js/jquery-1.10.2-ui.min.js"></script> 

<script type="text/javascript">


<%-- $(document).ready(function(){
	
	$('#loading').show();
	 var ctx = "<%=request.getContextPath()%>";
	//alert(ctx);
	/* if( document.getElementById("bas_div").hasChildNodes()) {
	 var nxt = document.getElementById("bas_div").firstChild;
	 document.getElementById("bas_div").removeChild(nxt);
	} */
    $.ajax({url: ctx+"/ProposalServlet?khubPageId=populateDropDowns", 
    		success: function(result) {
    	$("#country").html(JSON.stringify(result.countryHTML));
    	 $('#loading').hide();
    },
    type: 'POST'
    }); 
}); --%>



/////////////////////////////////////////////////////////////
	function callSubmit() {
	

		
		document.getElementById("bulkUploadForm").submit();


		
	}
	
	function validateType() {
		if (document.getElementById("type").value == 'HomePage') {
			var hmElement = document.getElementById("homePageType");
			hmElement.disabled = false;
			removeAllChildren(hmElement);
			var opElement = document.createElement("option");
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
			var hmElement = document.getElementById("homePageType");
			hmElement.disabled = false;
			removeAllChildren(hmElement);
			addOptions(hmElement,"Organization Specific");
			addOptions(hmElement,"Transition and Transformation");
			addOptions(hmElement,"Growth Areas");
			addOptions(hmElement,"Service Line Specific");
			addOptions(hmElement,"Industry Specific");
			addOptions(hmElement,"Others");
			
		}
		else {
			var hmElement = document.getElementById("homePageType");
			removeAllChildren(hmElement);
			document.getElementById("homePageType").disabled = true;
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
	
	
/* 	function validateUploadType() {
		
	if (document.uploadTypeForm.uploadType.value == 'singleUpload') {
			document.getElementById("bulkUploadForm").style.display = "none";
			document.getElementById("insertForm").style.display = "block";
		} else if (document.uploadTypeForm.uploadType.value == 'bulkUpload') {
			document.getElementById("bulkUploadForm").style.display = "block";
			document.getElementById("insertForm").style.display = "none";
		}
	} */
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
<!-- 					<div class="pat-head">
						<h1>Content Upload</h1>
					</div> -->
					<!-- top heading end -->

					<div class="clear"></div>

					<!-- Breadcrumb Start--->
					<div id="breadcrumb-holder_form">
						<a href='index.jsp'>Home</a> > Content Upload
					</div>
					
					<!-- Breadcrumb End-->

					<!-- body data Start -->
					<div class="data-holder">
						<div class="form-holder">

							<form action="/ContentUpdate.jsp" method="" id="uploadTypeForm" name = "uploadTypeForm"
								class="form-pat">

								<h1>Content Upload</h1>
								<font color='red'>
									<div id="pik"></div>
								</font><br />
<!-- 								<fieldset>
									<label>How do you want to upload?</label> <input type="radio"
										name="uploadType" value="singleUpload" onclick="validateUploadType();"/> Single Upload<br>
									<input type="radio" name="uploadType" value="bulkUpload" onclick="validateUploadType();"/>
									Bulk Upload<br> 
								</fieldset> -->
</form>
<!-- <form action="/ProposalServlet" method="POST" id="insertForm" name = "insertForm"
								class="form-pat">

								<fieldset>
									<legend>Single Upload</legend>
<input type="hidden" id="khubPageId"	name="khubPageId" value="contentUploadPage" />
									<div class="leftfield">
										<label> <span>URL<span class="required">*</span></span>
											<input id="url" type="text" name="url" value=""
											placeholder="" />
										</label>
									</div>

									<div class="rightfield">
										<label> <span>Content Name<span
												class="required">*</span></span> <input id="contentName"
											type="text" name="contentName" placeholder="" />
										</label>
									</div>

									<div class="leftfield">
										<label> <span>Type <span class="required">*</span></span>
											<select name="type" id="type" onchange="validateType();">
												<option value="Proposal">Proposal</option>
												<option value="Proposal Inserts">Proposal Inserts</option>
												<option value="Capabilities">Capabilities</option>
												<option value="HomePage">HomePage</option>
												<option value="Clients Corner">Clients Corner</option>
												<option value="Market Insights">Market Insights</option>
												<option value="Competitor Insights">Competitor Insights</option>
												

										</select>
										</label> <label> <span style="">Short Desc</span> <input
											style="align: right" id="shortName" type="text"
											name="shortName" placeholder="" />
										</label>
									</div>

									<div class="rightfield">
										<span>Category <span class="required">*</span></span> <select
											name="homePageType" id="homePageType" disabled="disabled">
											<option value="Sales_Enablers">Sales Enablers</option>
											<option value="Competition_Watch">Competition Watch</option>
											<option value="Market,CAMSS">Latest from Market	,CAMSS</option>
											<option value="Industries,ServiceLines">Latest from	Industries, Service Lines</option>
											<option value="Pricing">PRICING</option>
											<option value="What_Done">What Done</option>

										</select>
									</div>

									<div class="leftfield">
										<label> <span
											style="margin: 50px 10px 0px 80px; align: left">Is
												Retired <span class="required">*</span>
										</span> <span style="margin: 45px 10px; align: left"><input
												type="radio" name="isRetired" value="Y"> Yes <input
												type="radio" name="isRetired" value="N" checked="checked"> No</span>

										</label>
									</div>




									<div class="leftfield">
										<label> <span>Industry<span></span></span> <select
											name="industry" id="industry">
												<option value="Automotive">Automotive</option>
												<option value="Aerospace and Defense">Aerospace and Defense</option>
												<option value="Banking and Finacial Markets">Banking and Finacial Markets</option>
												<option value="Chemicals and Petroleum">Chemicals and Petroleum</option>
												<option value="Consumer Products">Consumer Products</option>
												<option value="Education">Education</option>
												<option value="Electronics">Electronics</option>
												<option value="Energy and Utilities">Energy and Utilities</option>
												<option value="Government">Government</option>
												<option value="Healthcare">Healthcare</option>
												<option value="Industrial Products">Industrial Products</option>
												<option value="Insurance">Insurance</option>
												<option value="Life Sciences">Life Sciences</option>
												<option value="Travel and Transportation">Travel and Transportation</option>
												<option value="Media and Entertainment">Media and Entertainment</option>
												<option value="Retail">Retail</option>
												<option value="Telecommunications">Telecommunications</option>
										</select>
										</label>
									</div>
									<div class="leftfield">
										<label> <span
											style="margin: 50px 10px 0px 80px; align: left">Is in
												Box <span class="required">*</span>
										</span> <span style="margin: 45px 10px; align: left"><input
												type="radio" name="isBox" value="Y"> Yes <input
												type="radio" name="isBox" value="N" checked="checked"> No</span>

										</label>
									</div>

									

									<div class="rightfield">
										<label> <span>Country<span></span></span> <select
											name="country" id="country">
												<option value="India" selected>India</option>
												<option value="Japan">Japan</option>
												<option value="Korea">Korea</option>

										</select>
										</label>
									</div>



									<div class="leftfield">
										<label> <span>Service Area<span></span></span> <select
											name="serviceArea" id="serviceArea">
												<option value="BAS" selected>BAS</option>
												<option value="ADI">ADI</option>
												<option value="IXM">IXM</option>
												<option value="EA_SAP">EA-SAP</option>
												<option value="EA_Oracle">EA-Oracle</option>
												<option value="EA_Microsoft">EA-Microsoft</option>
										</select>
										</label>
									</div>
									<div class="rightfield">
										<label> <span>Competitors<span></span></span> <select
											name="competitors" id="competitors">
												<option value="Accenture" >Accenture</option>
												<option value="TCS">TCS</option>
												<option value="Cognizant">Cognizant</option>
												<option value="Capgemini" >Capgemini</option>
												<option value="HCL">HCL</option>
												<option value="Indra">Indra</option>
												<option value="Infosys" >Infosys</option>
												<option value="Tech Mahindra">Tech Mahindra</option>
												<option value="Wipro">Wipro</option>
												<option value="Others" >Others</option>
												

										</select>
										</label>
									</div>



									<div class="leftfield">
										<label> <span>Year<span></span></span> <select
											name="year" id="year">
												<option value="2010" selected>2010</option>
												<option value="2011">2011</option>
												<option value="2012">2012</option>
												<option value="2013">2013</option>
												<option value="2014" >2014</option>
												<option value="2015">2015</option>
												<option value="2016">2016</option>
												<option value="2017" >2017</option>
												<option value="2018">2018</option>
												<option value="2019">2019</option>
												<option value="2020" >2020</option>

										</select>
										</label>
									</div>


								</fieldset>
							
</form> -->
<form action="/BulkContentUploadServlet" method="POST" id="bulkUploadForm" name="bulkUploadForm"
								class="form-pat" enctype="multipart/form-data">
							<fieldset>
								<legend>Bulk Upload</legend>

								<div class="leftfield">

									<label> <span><a href="Content_Storetest.xlsx">Please download the template</a> </span><!-- <span><input
											type="image" src="images/POC.jpg" alt="Submit"
											style="margin: 0px 10px 10px; height: 30px"></span> -->
									</label>
								</div>

								<div class="rightfield">

									<label> <span>Please select file to upload</span><span></span>
										<input type="file" value="Browse" id="fileUpload" name="fileUpload" /> 
									</label>
								</div>



							</fieldset>
</form>

							<label> <span>&nbsp;</span> <input type="button"
								class="button" value="Submit" name="bulkUploadForm" onclick="callSubmit();">&nbsp;&nbsp;
								<input type="button" class="button" value="Reset" />
							</label>

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