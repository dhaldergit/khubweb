<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<!-- <link rel="stylesheet" href="css/cssout172c.css">-->
<link rel="stylesheet" href="css/connection.css"> 
<!-- <link rel="stylesheet" type="text/css" href="css/tab_style.css">
<link rel="stylesheet" href="css/banneronly.css">
<link rel="stylesheet" href="css/design.css"> -->
<!-- <link rel="stylesheet" href="css/tab_style.css"> -->

<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">


<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
<!-- <script src="http://code.angularjs.org/1.4.8/angular.js"></script>   -->
<!-- <script src="http://code.angularjs.org/1.4.8/angular-resource.js"></script> -->  
<!-- <script type="text/javascript" src="js/jquery.simplePagination.js"></script> -->
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
<!-- <script src="js/facestypeahead-0.4.1.namespaced.min.js"></script> -->

   <script>
	  $( function() {
	    $( document ).tooltip();
	  } );
  </script>
 
<script>

$(document).ready(function(){
	$("#submit").on("click", function(){
		performClick();
	});
});

// sudipta
//$(document).ready(function(){
	
	function performClick(){
		$.ajax({
			url : 'Connection_members',
			contentType: "text/plain",
	         cache: false,
			success : function(responseText) {
				//alert(responseText);
				//var emp = $.parseJSON(responseText);
				alert(responseText);
				jsonArr = JSON.parse(responseText);
				
				console.log(jsonArr.length);
				
				for(var i=0;i<jsonArr.length; i++){
					emp = jsonArr[i].items;
	
					pic = emp[0].picture;
					pic = "<img src='"+pic+"' style='height: 40px; width: 40px' />";
					
	
					$("#submit").css("visibility", "hidden");
					
					empdetails = "<br>"+pic+"<br>"+emp[0].email+"<br>"+emp[0].notes+"<br>"+emp[0].ephone+"<br>"+emp[0].job;
					
					$("#empdata").append("<span title='' id='emp"+i+"'><br><br><br>"+emp[0].name+"<br>"+pic+"</span>");
					
					$( "#emp"+i ).tooltip({ content: empdetails });
				}
				
			
			}
		});
	
	}	
//});



	$.ajax({
		url : 'Connection_member_display?name=',
		contentType: "text/plain",
        cache: false,
		success : function(responseText) {
			//alert(responseText);
			
			var emp = responseText.split("|");
			var emphtml="";
			
			for(var i=0; i<emp.length-1; i++) {
				var empdata = emp[i].split("&");
				
				for(var j=0; j<empdata.length-1; j++) {
					if(empdata[j].includes("NAME")){
						emphtml += empdata[j]+"\n\n";
					}
					
					if(empdata[j].includes("CELLULAR")){
						emphtml += empdata[j]+"\n\n";
					}
					if(empdata[j].includes("JOBRESPONSIB")){
						emphtml += empdata[j]+"\n\n";
					}
					if(empdata[j].includes("INTERNET")){
						emphtml += empdata[j]+"\n\n";
					}
					
					
				}
				
				emphtml += "\n\n";
			}
			
			$("#page3").attr("title", emphtml);
		}
	});



</script>





</head>
	<body bgcolor="#cce6ff">
	
<div id="banner"><img id="banner_img" src="images/kH-banner.png" alt="" /></div>
 <div id="welcome">Welcome to GBS Knowledge Hub</div> 
	
		<div id="hh" type="visible" >
		<input class="button" id="submit" type="button"  src ="../images/searchbutton9.png" value="Members" style="visibility:visible;"></div>

		<div id="empdata"  width="200px" height="800px" style="background: transparent; font-size:12px;font-family:Times New Roman">
		</div>
	
	</body>
</html>