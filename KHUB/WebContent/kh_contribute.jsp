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

<link rel="stylesheet" href="css/form-styles.css" media="screen">

<link rel="stylesheet" href="css/form-styles-v3.css" media="screen">
<script type="text/javascript" src="js/contribute.js"></script>	

	
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
			<%@ include file="include/topnav.jsp" %>
		<!-- Top-nav End -->
		
		<div class="clear"></div>
		
		<!-- Main data -->
		<div id="main">
			<div class="mid-data-container">
				<!-- top heading start -->
				<div class="pat-head">
					<h1>KH - Contribute Intellectual Capital Form</h1>
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
						<form action="Icap" method="post" class="pat-form" name="icp" onsubmit="return contributeForm()">
						
							<h1>Contribute Intellectual Capital Form
							
							<span>Please fill all the mandatory details.</span>
							</h1>
							
							<font color='red'> <div id="pik"> </div> </font><br/>
										
							
							
							
							
							
							
							<label>
								<span>Type Of ICAP :</span><span class="required">*</span></span>
								<select name="txticap" id="icapid">
								<option value="abc" selected>abc</option>
								<option value="def">def</option>
								<option value="ijk">ijk</option>
								<option value="mno">mno</option>
									<option value=""></option>
								</select>
							</label>


							<label>
								<span>Short Description :</span>
								<input id="descid" type="text" name="txtdesc" placeholder="Short Description" />
							</label>




							<label>
								<span>Service Line :</span><span style="color: red;">*</span><select name="txtserv" id="servid">
								<option value="AD" selected>AD</option>
								<option value="AVM">AVM</option>
								<option value=""></option>
								
								</select>
							</label>							
							
							<label>
								<span>Industry :</span><span style="color: red;">*</span><select name="txtindustry" id="indid">
								<option value="BFS" selected>BFS</option>
								<option value="INS">INS</option>
								<option value="T&H">T&H</option>
								<option value="CRM">CRM</option>
									<option value=""></option>
								</select>
							</label>
							
							
							<label>
								<span>Contributor's Name:</span>
								<input id="contid" type="text" name="contributer" placeholder="" />
							</label>
							
							
							<label>
								<span>Contributor's LN ID:</span><span style="color: red;">*</span>
								<input id="lnid" type="text" name="txtln" id = "lnid" placeholder="" />
							</label>
							

							<div align="justified" style="padding: 8px 4px 8px 1px;">
							
							
								<span>Select File:<span style="color: red;">*</span></span>
								    <input type="file" class="but" name="txtuploadfile" id="upld" />
								
							
							 
							</div>   <div class="clear"></div><div class="clear"></div>
							<div>
								
								<input type="submit" class="button" value="Submit" />
								

							</div><div class="clear"></div><div class="clear"></div>
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