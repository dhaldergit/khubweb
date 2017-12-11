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

<title>KH Search</title>



<link rel="stylesheet" href="css/master.css" type="text/css" media="all" />
<link rel="stylesheet" href="css/styles.css" type="text/css" media="all" />

<link rel="stylesheet" href="css/cssout172c.css">
<link rel="stylesheet" href="css/design.css">
<!-- <link rel="stylesheet" href="css/simplePagination.css"> -->
<link rel="stylesheet" href="../css/master.css" type="text/css"
	media="all" />
<link rel="stylesheet" href="../css/styles.css" type="text/css"
	media="all" />

<link rel="stylesheet" href="../css/new-topnav.css" media="screen">
<link rel="stylesheet" href="/css/Jquery_modal_ui.css" media="screen">
<!-- THIS IS FOR CAROUSEL Start -->
<link rel="stylesheet" href="../css/prism.css">
<link rel="stylesheet" href="../css/stylesheet.css">
<link rel="stylesheet" href="../css/carousel.css">


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
 <script src="js/jquery-1.9.1.min.js"></script> 
<script src="http://code.angularjs.org/1.4.8/angular.js"></script>
<script src="http://code.angularjs.org/1.4.8/angular-resource.js"></script>
<!-- <script type="text/javascript" src="js/jquery.simplePagination.js"></script> -->
<link rel="stylesheet" href="css/new-topnav.css" media="screen">

<link rel="stylesheet" href="css/form-styles-v2.css" media="screen">

<script type="text/javascript" src="js/datetimepicker.js"></script>
<style type="text/css">
.meta {
	text-size: 10px;
	color: #05B8CC;
	/* //text-decoration: underline; */
	font-family: "Times New Roman", Georgia, Serif;
	font-style: normal;
}
</style>

<script>
		$(document).ready(function(){
		//	$("#spinner").html("<img src='images/8.gif'>");
			$.ajax({
				type: 'POST',
			       url:"/Content_Search?txtsrch=<%=request.getParameter("txtsrch")%>",
		       
		        
			       contentType : "text/plain",
		      //  dataType: "json",
		        cache: false,
		        success: function (data){
		        	//alert(data);
		        
		      
		        	
		     jsonArr = JSON.parse(data);
		        	
		        	$("#resp").css("visibility", "visible"); 
		        	$("#resp").html("");
					
		        	for (var i = 0; i < jsonArr.length; i++) {	
							
							 
							if(jsonArr[i].external_link =='N')
				   					
				   				{
								var ctx = "<%=request.getContextPath()%>";
								var linkdata = jsonArr[i].link.substring(13);
				   			 	var row_data = "<span class='row_item'>"+
				   								"<input type=checkbox class='check' fileid='"+linkdata+"'>"+
				   				"<a class='custom_link' href='"+ctx+jsonArr[i].link+"' fileid='"+linkdata+"'>"+" "+jsonArr[i].content_name+"</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
				   				"<span class='meta'>Created on "+jsonArr[i].date_published+" &nbsp;</span>"+ "<span class= 'meta1'><br> &nbsp;"+jsonArr[i].type+"</span>"+
			   				"</span>"; 
			   				
				   				$('#resp').append(row_data);
			   				
				   				}
			   				
							
							
							else if(jsonArr[i].external_link =='Y')
								
								{
								
								var row_data1 = "<span class='row_item'>"+
				   								"<a target='_blank' class='custom_link' href='"+jsonArr[i].link+"'> "+jsonArr[i].content_name+
				   								"</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
						   						"<span class='meta'>Created on "+jsonArr[i].date_published+" &nbsp;</span>"+ "<span class= 'meta1'><br> &nbsp;"+jsonArr[i].type+"</span>"+
				   								"</span>";
								
								$('#resp').append(row_data1);
								
								}							
		        	}					
					
					var sresults =  "<span class='row_item'>"+
	   				 "<span class='meta3'>Displaying <b> "+jsonArr.length+"</b>   Results  for the keyword &nbsp;\"<i><b><%= request.getParameter("txtsrch") %></i></b>\" </span>"+ 
  				"</span>";
					
  				$('#results').append(sresults); 
					
					
					$("#click").css("visibility", "visible"); 
				//	$("#spinner").html("");
				 
					
/* 		        $(function() {
         		var pageParts = $(".row_item");
         		var numPages = pageParts.length;
         		var perPage = 70;
         		
         		var start = 0;
         		var end = start + perPage;
         		pageParts.hide().slice(start, end).show();
         		
         		$("#page-nav").pagination({
         			items: numPages,
         			itemsOnPage: perPage,
         			cssStyle: "light-theme",
         			onPageClick: function(pageNum) {
         				// Which page parts do we show?
         				var start = perPage * (pageNum - 1);
         				var end = start + perPage;
         
         				// First hide all page parts
         				// Then show those just for our page
         				pageParts.hide()
         						 .slice(start, end).show();
         			}
         		});
         	});
		         */
		        
		        
		         if(jsonArr.length==0)
		    	{
				
		        $("#spinner").html("");
		    	$("#no_record").html("No results found for the search criteria..");
		    	$("#resp").html("");
		    	$("#click").html("");
		    		    	}
		        
		        },	error: function() {
			         
			        alert("data Error..")
				}
			        
			
			});
			
			 });
	//	}
		
</script>

<script>

$(document).ready(function(){
	
	

		
		$("#click").on("click", function(){
			performDownload();
		});
		
		
		
	});
		function performDownload()
		{
			var selected = [];
			  $('.check:checked').each(function() {
			      selected.push($(this).attr('fileid'));
			      
			  });
			  
			 
		
			  
		    $.ajax({
		        url: 'box?fileids='+selected+'&download=true',// background processing procedures
		        type: 'GET',
		        success: function (data) {
		        	console.log(data);
		        	
		        
		        	 
		        	 $.each(data.split(/\|/), function (i, val) {
		        		
		        	
		        		
		        		 window.open(val, "_blank");
		        		 
		        	 });
		        	 
		        	 
		        	
		        },
		        failure: function () {
		          alert("data error")
		          return false;
		        }
		    });
	    }
		
	</script>

<script>
	$(document).ready(function() {

		 $("#boxsrchs").on("keypress", function(key){
			if(key.which==13){
				performSearch();
			}
		}); 
		
		
		
		 $("#submitsearch").on("click", function(){
			 performSearch();
		}); 

		
	
	});

	function performSearch() {
		
		if ($("#boxsrchs").val() != "") {
			window.location = "/search.jsp?txtsrch=" + $("#boxsrchs").val()   ;
			
		}

		else if($("#boxsrchs").val() == ""){
			alert("Please enter a search key..")

		}
		
	      
	}

	
</script>




<style>
.custom_link {
	text-decoration: none;
	text-decoration-color: none;
	/* //font-weight: bold; */
	color: #003366;
	font-size: 14px;
}

.custom_link:hover {
	text-decoration: underline;
}

.custom_link_past {
	text-decoration: none;
	text-decoration-color: none; //
	font-weight: bold;
	font-style: italic;
}

.custom_link_past:hover {
	text-decoration: underline;
}
</style>








<style type="text/css">
.row_item {
	color: #444;
	display: block;
	/* width: 100%; */
	font-style: bold;
	padding-left: 7px;
}

.row_item:nth-child(odd) {
	background: #ffffff;
}

.row_item:nth-child(even) {
	background: #CCE4FB;
}

.row_item:hover {
	background: #dddddd;
}

#resp {
	visibility: hidden;
	border: 1px solid #222;
}

#no_record {
	font-family: "Times New Roman", Times, serif;
	color: #629632;
}

.meta {
	float: right;
	/* color :#5273F3; */
	color: #003366;
	font-size: 14px;
	padding-right: 5px;
}

.meta1 {
	/* color :#5273F3; */
	color: #003366;
	font-size: 11px;
	padding-left: 7px;
}

.meta2 {
	float: right;
	color: #003366;
	font-size: 11px;
	padding-right: 5px;
}

.meta3 {
	float: left;
	/* color :#5273F3; */
	color: #003366;
	font-size: 14px;
	padding-left: 5px;
}

.box-head {
	margin: 0px 0px 0px 0px;
	padding: 0px 0px 0px 0px;
	width: 1200px;
	height: auto;
	background-color: #ffffff;
}

input.srh1 {
	background-color: #0080c0;
	/*     border-radius: 0.5em;
    box-shadow: 0 1px 2px rgba(0, 0, 0, 0.2); */
	color: #ffffff;
	cursor: pointer;
	font-size: 14px;
	font-weight: bold;
	height: 25px;
	margin: 5px 5px 5px 0px;
	padding: 0px 5px 10px;
	width: 100px;
	background: rgba(0, 0, 0, 0)
		-moz-linear-gradient(center top, #acc9f8, #498bf8) repeat scroll 0 0;
	color: #ffffff;
	font-family: Helvetica, Arial, Verdana, sans-serif;
}

.headerlabel {
	background: rgba(0, 0, 0, 0)
		-moz-linear-gradient(center top, #acc9f8, #498bf8) repeat scroll 0 0;
	color: #ffffff;
	font-family: Helvetica, Arial, Verdana, sans-serif;
	font-size: 14px;
	/* font-weight: bold; */
}

.headerlabel  h1 {
	margin: 0px 0px 0px 0px;
	padding: 0px 0px 10px 20px;
	font-size: 22px;
	color: #000000;
	/* font-weight:bold; */
	/* font-family: "Times New Roman", Times, serif; */
}
</style>



</head>
<body>
	<!-- WRAPPER START -->
	<div id="wrapper">
		<!-- Container Start -->
		<div class="container">
			<%@ include file="/boxheader.jsp"%>








			<!-- Top-nav End -->

			<div class="clear"></div>

			<!-- Main data -->
			<div id="main">
				<div class="mid-data-container">
					<!-- top heading start -->

					<div>
						<div class="headerlabel">
							&nbsp;&nbsp;&nbsp;&nbsp; <input ID="boxsrchs" type="text"
								style="width: 300px; height: 19px" name="boxsrch"
								placeholder="Search.." img src='images/searchbutton9.png'>
							<input type="button" class="srh1" id="submitsearch"
								value="SearchAgain" title="Create">
							<!-- <div class="adv"><a href="AdvanceSearch.jsp">Advanced Search</a></div> -->

							<!-- <h1>Search Results</h1> -->
							<div id="results"></div>
						</div>

						<!-- 					<div class="box-head">
						<h1>Search Results</h1>
					</div> -->

					</div>
					<!-- top heading end -->

					<!-- <div class="clear"></div> -->



					<!-- body data Start -->
					<!-- <div id="spinner"></div> -->

					<div>
						<h3 id="no_record"></h3>
					</div>
					<div id="resp">
						<!--table id="response_table">

</table-->


					</div>


					<div>
						<table cellpadding="0px" cellspacing="0px">

							
							<tr>

								<td><input type="button" id="click" align="center"
									style="visibility: hidden;"></td>
							</tr>
						</table>
					</div>

				</div>

				<!-- body data End -->
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