<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=0" />
<meta http-equiv="Content-Type" content="text/html;charset=windows-1252">

<meta http-equiv="content-type" content="text/html;charset=utf-8" />

<title>Knowledge Hub</title>
<link rel="stylesheet" href="css/master.css" type="text/css" media="all" />
 <link rel="stylesheet" href="css/styles.css" type="text/css" media="all" /> 

<link rel="stylesheet" href="css/new-topnav.css" media="screen">

 <script src="src/jquery.collapse_storage.js"></script> 

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>
	
	
<script>

$(document).ready(function(){
	
	$("#Type").val('');
	
	//$("#spinner").html("<img src='images/ajax-load.gif' style='width: 20px; height: 20px;'>");
	
	$.ajax({
						url :'/getContent',
						type : 'GET',
						dataType: "json",
						//data: "oppno="+$("#oppno").val(),
						success: function(resp){
							//alert(data);		
							/* jsonArr = JSON.parse(data); */
					//alert(data);
								
							
							var rowdata1 = "";
			
							
			 
			
	 		for(var i=0;i<resp.length;i++)
			{
	 			 rowdata1 += "<tr class='rowdata1'>";
	 		//	rowdata +="</tr>"; 
	 			/* rowdata1 += "<tr class='rowdata1'>"; */
				rowdata1 += "<td class='r_width_cname'>"+"<a class='custom_link' href='"+resp[i].link+"'>"+" "+resp[i].content_name+"</a>"+"</td>";
				rowdata1 += "<td class='r_width_year'>"+resp[i].year+"</td>";
				rowdata1 += "<td class='r_width_type'>"+resp[i].type+"</td>";
				//rowdata1 += "<td class='r_width'>"+resp[i].country+"</td>";
				rowdata1 += "<td class='r_width'>"+resp[i].industry+"</td>";
			
				rowdata1 += "<td class='r_width_serv'>"+resp[i].service_line+"</td>";
				rowdata1 += "<td class='r_width'>"+resp[i].geo+"</td>";
				rowdata1 += "<td class='r_width_camss'>"+resp[i].growtharea_camss+"</td>";
				
				
				
				rowdata1 +="</tr>";
				/* if ((jQuery.data(data[i], outputArray)) == -1)
		        {
		            outputArray.push(data[i]);
		        }
				console.log(outputArray);
				alert(outputArray); */
			//	$("#spinner").html("");	
        
        } 
	 		
	 		
	 		$(".rowdata1").remove();
			$("#service_reqs").append(rowdata1);
			
		
			/* ajaxResult.push(resp);
			console.log(ajaxResult) */
						},	
        
        
        error: function() {
	          alert("Data Error. Data not found . Please Enter the correct search key");
		}
	});
	
	
	
	
	
});
	







</script>

<script>
function valueChange(){

	// alert("value changed");
	   
	$.ajax({
		url :'/filterContent',
		type : 'POST',
		dataType: "json",
		data: {
			indus :$.trim($("#Industry :selected").val()),
			txttyp :$.trim($("#Type :selected").val().trim()),
		//	txtcntry :$.trim($("#Country :selected").val().trim()),
			txtyear :$.trim($("#Year :selected").val().trim()),
			servic :$.trim($("#Service :selected").val().trim()),
			txtgeo :$.trim($("#GEO :selected").val().trim()),
			txtcam :$.trim($("#Cams :selected").val().trim())
		},
		success: function(resp){
		//alert(resp);
		
		industry_arrs = [];
		type_arrs = [];
		//country_arrs = [];
		year_arrs = [];
		service_arrs = [];
		geo_arrs = [];
		cam_arrs =[];
		
var rowdata1 = "";
		

console.log(resp);

if(resp.length>0)
	{
	
	$("#no_record").html("");
		for(var i=0;i<resp.length;i++)
		{
			//alert(resp);
		/* 	rowdata1 += "<tr class='rowdata1'>";
			rowdata1 += "<td class='r_width_cname'>"+"<a class='custom_link' href='"+resp[i].url+"'>"+" "+resp[i].content_name+"</a>"+"</td>";
			rowdata1 += "<td class='r_width_year'>"+resp[i].year+"</td>";
			rowdata1 += "<td class='r_width_type'>"+resp[i].type+"</td>";
			//rowdata1 += "<td>"+resp[i].country+"</td>";
			rowdata1 += "<td class='r_width'>"+resp[i].industry+"</td>";
			rowdata1 += "<td class='r_width'>"+resp[i].service_area+"</td>";
			rowdata1 += "<td class='r_width'>"+resp[i].geo_detail+"</td>";
			rowdata1 += "<td class='r_width'>"+resp[i].camss+"</td>";
			rowdata1 +="</tr>"; */
		/*  $(".rowdata1").remove();
			$("#service_reqs").append(rowdata1); */ 
			
			 if ( industry_arrs.indexOf(resp[i].industry)==-1 ) {
				industry_arrs.push(resp[i].industry);
			}
			if ( type_arrs.indexOf(resp[i].type)==-1 ) {
				type_arrs.push(resp[i].type);
			} 
			
			if ( year_arrs.indexOf(resp[i].year)==-1 ) {
				year_arrs.push(resp[i].year);
			}
			if ( service_arrs.indexOf(resp[i].service_area)==-1 ) {
				service_arrs.push(resp[i].service_area);
			}
			
			if ( geo_arrs.indexOf(resp[i].geo_detail)==-1 ) {
				geo_arrs.push(resp[i].geo_detail);
			}
			
			if ( cam_arrs.indexOf(resp[i].camss)==-1 ) {
				cam_arrs.push(resp[i].camss);
			}
			 
			industry_dds = "";
			$.each(industry_arrs, function(i, item) {
				industry_dds += "<option value='"+item+"'>"+item+"</option>";
			});
			$(".ind").html("<select id='Industry' name='indus' onchange='valueChange()'>"+industry_dds+"</select>");
			
			type_dds = "";
			$.each(type_arrs, function(i, item) {
				type_dds += "<option value='"+item+"'>"+item+"</option>";
			});
			$(".type").html("<select id='Type' name='txttyp' onchange='valueChange()'>"+type_dds+"</select>");
			
			
			year_dds = "";
			$.each(year_arrs, function(i, item) {
				year_dds += "<option value='"+item+"'>"+item+"</option>";
			});
			$(".cl_yr").html("<select id='Year' name='txtyear' onchange='valueChange()'>"+year_dds+"</select>");
			
			
			service_dds = "";
			$.each(service_arrs, function(i, item) {
				service_dds += "<option value='"+item+"'>"+item+"</option>";
			});
			$(".serv").html("<select id='Service' name='servic' onchange='valueChange()'>"+service_dds+"</select>");
			
			
			geo_dds = "";
			$.each(geo_arrs, function(i, item) {
				geo_dds += "<option value='"+item+"'>"+item+"</option>";
			});
			$(".geo").html("<select id='GEO' name='txtgeo' onchange='valueChange()'>"+geo_dds+"</select>");
			
			
			
			cam_dds = "";
			$.each(cam_arrs, function(i, item) {
				cam_dds += "<option value='"+item+"'>"+item+"</option>";
			});
			$(".camss").html("<select id='Cams' name='txtcam' onchange='valueChange()'>"+cam_dds+"</select>");
			
			 
			
			 
  } 
		
		
		for(var i=0;i<resp.length;i++)
		{
			//alert(resp);
			rowdata1 += "<tr class='rowdata1'>";
			rowdata1 += "<td class='r_width_cname'>"+"<a class='custom_link' href='"+resp[i].url+"'>"+" "+resp[i].content_name+"</a>"+"</td>";
			rowdata1 += "<td class='r_width_year'>"+resp[i].year+"</td>";
			rowdata1 += "<td class='r_width_type'>"+resp[i].type+"</td>";
			//rowdata1 += "<td>"+resp[i].country+"</td>";
			rowdata1 += "<td class='r_width'>"+resp[i].industry+"</td>";
			rowdata1 += "<td class='r_width_serv'>"+resp[i].service_area+"</td>";
			rowdata1 += "<td class='r_width'>"+resp[i].geo_detail+"</td>";
			rowdata1 += "<td class='r_width_camss'>"+resp[i].camss+"</td>";
			rowdata1 +="</tr>"; 
		}
		 $(".rowdata1").remove();
			$("#service_reqs").append(rowdata1);
		
		
		 
	}

else if(resp.length==0)
{

$("#no_record").html("No Data Found");
$.ajax({
	url :'/service_request_data',
	type : 'GET',
	dataType: "json",
	//data: "oppno="+$("#oppno").val(),
	success: function(data1){
//	alert(data);
		
	
		
	var year_arr = data1.yrlist;
	var year_dd = "<option value=''>Please Select  </option>";							
	
	$.each(year_arr, function(i, val){
		year_dd += "<option value='"+val+"'>"+val+"</option>";
	});
	
	
	
	var type_arr = data1.typelist;
	var type_dd = "<option value=''>Please Select  </option>";							
	
	$.each(type_arr, function(i, val){
		type_dd += "<option value='"+val+"'>"+val+"</option>";
	});
	
 	var industry_arr = data1.indslist;
	var industry_dd = "<option value=''>Please Select</option>";							
	
	$.each(industry_arr, function(i, val){
		industry_dd += "<option value='"+val+"'>"+val+"</option>";
	}); 
	
	var country_arr = data1.cntrylist;
	var country_dd = "<option value=''>Please Select</option>";							
	
	$.each(country_arr, function(i, val){
		country_dd += "<option value='"+val+"'>"+val+"</option>";
	});
	
	var serv_arr = data1.srvlist;
	var serv_dd = "<option value=''>Please Select</option>";		
	
	
	$.each(serv_arr, function(i, val){
		serv_dd += "<option value='"+val+"'>"+val+"</option>";
	});
	
	var geo_arr = data1.geolist;
	var geo_dd = "<option value=''>Please Select</option>";		
	
	
	$.each(geo_arr, function(i, val){
		geo_dd += "<option value='"+val+"'>"+val+"</option>";
	});
	
	
	
	var cam_arr = data1.camlist;
	var cam_dd = "<option value=''>Please Select</option>";		
	
	
	$.each(cam_arr, function(i, val){
		cam_dd += "<option value='"+val+"'>"+val+"</option>";
	});
	
	
/* 	var type_arr = data.typlist;
	var type_dd = "";							
	
	$.each(type_arr, function(i, val){
		type_dd += "<option>"+val+"</option>";
	}); */
	$(".ind").html("<select class='drop' style='width:155px;' id='Industry' name='indus' onchange='valueChange()'>"+industry_dd+"</select>");
	$(".cl_yr").html("<select class='drop' style='width:100px;' id='Year' name='txtyear' onchange='valueChange()'>"+year_dd+"</select>");
	$(".cntry").html("<select class='drop' style='width:155px;' id='Country' name='txtcntry' onchange='valueChange()'>"+country_dd+"</select>");
	$(".serv").html("<select class='drop' style='width:165px;' id='Service' name='servic' onchange='valueChange()'>"+serv_dd+"</select></label>");	
	$(".geo").html("<select class='drop' style='width:155px;' id='GEO' name='txtgeo' onchange='valueChange()'>"+geo_dd+"</select></label>");
	$(".type").html("<select class='drop' style='width:145px;' id='Type' name='txttyp' onchange='valueChange()'>"+type_dd+"</select></label>");
	$(".camss").html("<select class='drop' style='width:140px;' id='Cams' name='txtcam' onchange='valueChange()'>"+cam_dd+"</select></label>");

	//$(".types").html("<select id='Type' name='txttyp'>"+type_dd+"</select></label>");
//	$("#spinner").html("");




	},	


error: function() {
alert("Data Error. Data not found . Please Enter the correct search key");
}
});



$("#new").html("");

}
	
		},
		
	});
	    	
	    
	    
	      
	
		
}

$(document).ready(function(){
	
	
	
	
	$.ajax({
						url :'/service_request_data',
						type : 'GET',
						dataType: "json",
						//data: "oppno="+$("#oppno").val(),
						success: function(data1){
					//	alert(data);
							
						
							
						var year_arr = data1.yrlist;
						var year_dd = "<option value=''>Please Select  </option>";							
						
						$.each(year_arr, function(i, val){
							year_dd += "<option value='"+val+"'>"+val+"</option>";
						});
						
						
						
						var type_arr = data1.typelist;
						var type_dd = "<option value=''>Please Select  </option>";							
						
						$.each(type_arr, function(i, val){
							type_dd += "<option value='"+val+"'>"+val+"</option>";
						});
						
					 	var industry_arr = data1.indslist;
						var industry_dd = "<option value=''>Please Select</option>";							
						
						$.each(industry_arr, function(i, val){
							industry_dd += "<option value='"+val+"'>"+val+"</option>";
						}); 
						
						var country_arr = data1.cntrylist;
						var country_dd = "<option value=''>Please Select</option>";							
						
						$.each(country_arr, function(i, val){
							country_dd += "<option value='"+val+"'>"+val+"</option>";
						});
						
						var serv_arr = data1.srvlist;
						var serv_dd = "<option value=''>Please Select</option>";		
						
						
						$.each(serv_arr, function(i, val){
							serv_dd += "<option value='"+val+"'>"+val+"</option>";
						});
						
						var geo_arr = data1.geolist;
						var geo_dd = "<option value=''>Please Select</option>";		
						
						
						$.each(geo_arr, function(i, val){
							geo_dd += "<option value='"+val+"'>"+val+"</option>";
						});
						
						
						
						var cam_arr = data1.camlist;
						var cam_dd = "<option value=''>Please Select</option>";		
						
						
						$.each(cam_arr, function(i, val){
							cam_dd += "<option value='"+val+"'>"+val+"</option>";
						});
						
						
					/* 	var type_arr = data.typlist;
						var type_dd = "";							
						
						$.each(type_arr, function(i, val){
							type_dd += "<option>"+val+"</option>";
						}); */
						$(".ind").html("<select class='drop' style='width:155px;' id='Industry' name='indus' onchange='valueChange()'>"+industry_dd+"</select>");
						$(".cl_yr").html("<select class='drop' style='width:100px;' id='Year' name='txtyear' onchange='valueChange()'>"+year_dd+"</select>");
						$(".cntry").html("<select class='drop' style='width:155px;' id='Country' name='txtcntry' onchange='valueChange()'>"+country_dd+"</select>");
						$(".serv").html("<select class='drop' style='width:165px;' id='Service' name='servic' onchange='valueChange()'>"+serv_dd+"</select></label>");	
						$(".geo").html("<select class='drop' style='width:155px;' id='GEO' name='txtgeo' onchange='valueChange()'>"+geo_dd+"</select></label>");
						$(".type").html("<select class='drop' style='width:145px;' id='Type' name='txttyp' onchange='valueChange()'>"+type_dd+"</select></label>");
						$(".camss").html("<select class='drop' style='width:140px;' id='Cams' name='txtcam' onchange='valueChange()'>"+cam_dd+"</select></label>");
						//$(".types").html("<select id='Type' name='txttyp'>"+type_dd+"</select></label>");
					//	$("#spinner").html("");
				
			 
			
	
						},	
        
        
        error: function() {
	          alert("Data Error. Data not found . Please Enter the correct search key");
		}
	});
	
	
		
	
	
		

});


</script> 

<script>
$(document).ready(function(){
	
	
	$("#formReset").click(function(){
	/* Single line Reset function executes on click of Reset Button */
	//alert("reset initiated");
	
	
	$("#form")[0].reset();
	
	$("#no_record").html("");
	
	
	//alert("hello");
	$.ajax({
		url :'/getContent',
		type : 'GET',
		dataType: "json",
		//data: "oppno="+$("#oppno").val(),
		success: function(resp){
			//alert(data);		
			/* jsonArr = JSON.parse(data); */
	//	alert(data);
				
		//	$("#Type").val('');
			var rowdata1 = "";




for(var i=0;i<resp.length;i++)
{
	/* rowdata += "<tr class='rowdata'>";
	rowdata +="</tr>"; */
	 rowdata1 += "<tr class='rowdata1'>";
		//	rowdata +="</tr>"; 
			/* rowdata1 += "<tr class='rowdata1'>"; */
			rowdata1 += "<td class='r_width_cname'>"+"<a class='custom_link' href='"+resp[i].link+"'>"+" "+resp[i].content_name+"</a>"+"</td>";
			rowdata1 += "<td class='r_width_year'>"+resp[i].year+"</td>";
			rowdata1 += "<td class='r_width_type'>"+resp[i].type+"</td>";
			//rowdata1 += "<td class='r_width'>"+resp[i].country+"</td>";
			rowdata1 += "<td class='r_width'>"+resp[i].industry+"</td>";
		
			rowdata1 += "<td class='r_width_serv'>"+resp[i].service_line+"</td>";
			rowdata1 += "<td class='r_width'>"+resp[i].geo+"</td>";
			rowdata1 += "<td class='r_width_camss'>"+resp[i].growtharea_camss+"</td>";
			
			
			
			rowdata1 +="</tr>";


} 
$(".rowdata1").remove();
$("#service_reqs").append(rowdata1);
		

		
		},	


error: function() {
alert("Data Error. Data not found . Please Enter the correct search key");
}
});
	
	

	
	$.ajax({
		url :'/service_request_data',
		type : 'GET',
		dataType: "json",
		//data: "oppno="+$("#oppno").val(),
		success: function(data1){
//		alert(data);
			
		
			
		var year_arr = data1.yrlist;
		var year_dd = "<option value=''>Please Select  </option>";							
		
		$.each(year_arr, function(i, val){
			year_dd += "<option value='"+val+"'>"+val+"</option>";
		});
		
		
		var type_arr = data1.typelist;
		var type_dd = "<option value=''>Please Select  </option>";							
		
		$.each(type_arr, function(i, val){
			type_dd += "<option value='"+val+"'>"+val+"</option>";
		});
		
	 	var industry_arr = data1.indslist;
		var industry_dd = "<option value=''>Please Select</option>";							
		
		$.each(industry_arr, function(i, val){
			industry_dd += "<option value='"+val+"'>"+val+"</option>";
		}); 
		
		var country_arr = data1.cntrylist;
		var country_dd = "<option value=''>Please Select</option>";							
		
		$.each(country_arr, function(i, val){
			country_dd += "<option value='"+val+"'>"+val+"</option>";
		});
		
		var serv_arr = data1.srvlist;
		var serv_dd = "<option value=''>Please Select</option>";		
		
		
		$.each(serv_arr, function(i, val){
			serv_dd += "<option value='"+val+"'>"+val+"</option>";
		});
		
		var geo_arr = data1.geolist;
		var geo_dd = "<option value=''>Please Select</option>";		
		
		
		$.each(geo_arr, function(i, val){
			geo_dd += "<option value='"+val+"'>"+val+"</option>";
		});
		
		var cam_arr = data1.camlist;
		var cam_dd = "<option value=''>Please Select</option>";		
		
		
		$.each(cam_arr, function(i, val){
			cam_dd += "<option value='"+val+"'>"+val+"</option>";
		});
		
	/* 	var type_arr = data.typlist;
		var type_dd = "";							
		
		$.each(type_arr, function(i, val){
			type_dd += "<option>"+val+"</option>";
		}); */
		
			$(".ind").html("<select class='drop' style='width:155px;' id='Industry' name='indus' onchange='valueChange()'>"+industry_dd+"</select>");
		$(".cl_yr").html("<select class='drop' style='width:100px;' id='Year' name='txtyear' onchange='valueChange()'>"+year_dd+"</select>");
		$(".cntry").html("<select class='drop' style='width:155px;' id='Country' name='txtcntry' onchange='valueChange()'>"+country_dd+"</select>");
		$(".serv").html("<select class='drop' style='width:165px;' id='Service' name='servic' onchange='valueChange()'>"+serv_dd+"</select></label>");	
		$(".geo").html("<select class='drop' style='width:155px;' id='GEO' name='txtgeo' onchange='valueChange()'>"+geo_dd+"</select></label>");
		$(".type").html("<select class='drop' style='width:145px;' id='Type' name='txttyp' onchange='valueChange()'>"+type_dd+"</select></label>");
		$(".camss").html("<select class='drop' style='width:140px;' id='Cams' name='txtcam' onchange='valueChange()'>"+cam_dd+"</select></label>");

		
		//$(".types").html("<select id='Type' name='txttyp'>"+type_dd+"</select></label>");
//		$("#spinner").html("");




		},	


	error: function() {
	alert("Data Error. Data not found . Please Enter the correct search key");
	}
	});
		
			
		

	});

	});
	
	
	

</script>

<style>
#btn {
	font-size: 12px;
	border: 1px solid gray;
	background-color: #4CAF50;
	/* //font-weight:bold; */
	box-shadow: 0 0 5px;
	border-radius: 2px;
	cursor: pointer;
	width: 10%;
}
table.cnt{
table-layout:fixed;
overflow:auto;
} 
tbody td {
  position: relative;
}
.r_width
{

min-width:155px;
max-width:155px;
 word-wrap: break-word; 
/* word-wrap:normal; */

} 

.r_width_cname

{

min-width:220px;
max-width:220px;
 word-wrap: break-word; 
/* word-wrap:normal; */

} 

.r_width_year
{

min-width:100px;
max-width:100px;
 word-wrap: break-word; 
/* word-wrap:normal; */

} 


.r_width_type
{

min-width:145px;
max-width:145px;
 word-wrap: break-word; 
/* word-wrap:normal; */

} 


.r_width_camss
{

min-width:140px;
max-width:140px;
 word-wrap: break-word; 
/* word-wrap:normal; */

}


.r_width_serv
{

min-width:165px;
max-width:165px;
 word-wrap: break-word; 
/* word-wrap:normal; */

}

thead {

    tr {
      display: block;
      position: relative;
      background-color: #003366 ;
    color: white;
    }
    
    
  }
  
  th
  {
  
   background-color: #88a7db ;
    color: white;
  
  }
  
  
   .theader
  {
  
   background-color: #ffffff ;
    color: white;
  
  }

tbody{
  height: auto;
  /* width:auto; */
  min-height:500px;
  min-width: 1150px;
    display:block;
    overflow:auto;

}
tbody td {
  position: relative;
}
.drop{
/* color:red; */
text-overflow:ellipsis;
max-width:155px;
word-wrap: break-word; 
}
.drop:hover{
overflow:visible;
white-space: normal;
} 






.content-head  h1{
margin: 0px 0px 0px 0px;
padding: 15px 0px 10px 10px ;
font-size: 22px; 
color: #000000;
font-weight:bold;
font-family: "Times New Roman", Times, serif;
}

.buttons {
 background: #3498db;
  background-image: -webkit-linear-gradient(top, #3498db, #63b4e6);
  background-image: -moz-linear-gradient(top, #3498db, #63b4e6);
  background-image: -ms-linear-gradient(top, #3498db, #63b4e6);
  background-image: -o-linear-gradient(top, #3498db, #63b4e6);
  background-image: linear-gradient(to bottom, #3498db, #63b4e6);
  -webkit-border-radius: 10;
  -moz-border-radius: 10;
  border-radius: 10px;
  font-family: Arial;
  color: #ffffff;
  font-size: 14px;
  padding: 10px 20px 10px 20px;
  text-decoration: none;
}


.buttons:hover

{


  background: #3cb0fd;
  background-image: -webkit-linear-gradient(top, #3cb0fd, #3498db);
  background-image: -moz-linear-gradient(top, #3cb0fd, #3498db);
  background-image: -ms-linear-gradient(top, #3cb0fd, #3498db);
  background-image: -o-linear-gradient(top, #3cb0fd, #3498db);
  background-image: linear-gradient(to bottom, #3cb0fd, #3498db);
  text-decoration: none;

}

</style>






</head>

<body>
	<!-- WRAPPER START -->
	<div id="wrapper">
		<!-- Container Start -->
		<div class="container">
			<!-- Header file headers is included here  -->
			<%-- <%@ include file="../include/headers.jsp" %> --%>
			<%@ include file="include/headers.jsp"%>
			<!-- Header End -->

			<div class="clear"></div>

			<!-- Top-nav -->


			<div class="clear"></div>

			<!-- Main data -->
			<div id="main">

				<!-- top heading start -->
				<!-- <div class="content-head">
					<h1>GBS Knowledge Hub - List of all Assets</h1>
				</div> -->
				<!-- top heading end -->
	
				<div class="clear"></div>

				<!-- Breadcrumb Start -->
				<div id="breadcrumb-holder_form">
					<a href='index.jsp'>Home</a> > Content List
				</div>
				<!-- Breadcrumb End -->

				<div class="data-holder">
					<p>The below list can be filtered on various parameters of
						Industry, Service lines, Technologies and much more. The list
						contains links to various old and current ICAP across IBM.</p>
					
					
					<div id="pto">
					

						<div id="content_list"style="display: inline-block; width:1127px;"
							class="horizontal-fields service-item">
							<form action="#" method="post" id="form">
								<input type="button"   class="buttons" id="formReset" value="Reset-Data" />
								<table id="service_reqs" class="cnt" border="1"
									style="width:1127px; font-size: 12px;   font-family: Arial ">
									<thead id="abc"><tr>
										<th width="222px"><b>Content-Name</b></th>

										<th width="100px"><b>YEAR</b></th>

										<th width="145px"><b>TYPE</b>
										</th>
										
										<th width="155px"><label for="INDUSTRY"><span><b>INDUSTRY</b></span>
										</label></th>
										<th width="167px"><label for="ServiceArea"><span><b>SERVICE-LINE</b></span></label></th>
									 	<th width="155px"><label for="GEO"><span><b>GEO</b></span></label></th>
									 	<th width="140px"><label for="CAMSS"><span><b>CAMSS</b></span></label></th>
									 	
									</tr>
									
									<tr>
										<th width="220px" class="theader" align="left"></th>
										<th width="100px" class="cl_yr"></th>
										<th width="145px" class="type"></th>
										<th width="155px" class="ind"></th>
										<th width="165px" class="serv"></th>
										<th width="155px" class="geo"></th>
										<th width="140px" class="camss"></th>
										<!-- <td width="90px"></td> -->
										<!--  <td width="90px"></td>
										<td width="90px"></td>
										 <td width="90px"></td> -->
									</tr></thead>
									
					
													<div id="error_block">
					<div id="spinner"></div>
						<h2 id="no_record"></h2>
					</div>
									<tbody id='new' style='height:200px;overflow:auto'></tbody>






								</table> 
							</form>

						</div>





					</div>

				</div>
				<!-- Main data End -->

				<div class="clear"></div>

				<!-- Footer Bottom -->
				<%@ include file="/include/footer.jsp"%>
				<!-- Footer Bottom End -->

			</div>
			<!-- Container End -->
		</div>
		<!-- WRAPPER END -->
</body>
</html>