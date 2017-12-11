<html>
<head>
<title>Knowledge Hub</title>
<link rel="stylesheet" href="css/master.css" type="text/css"
	media="all" />
<link rel="stylesheet" href="css/styles.css" type="text/css"
	media="all" />

<link rel="stylesheet" href="../css/new-topnav.css" media="screen">






<!-- THIS IS FOR JQUERY ACCORDION Start-->
<link rel="stylesheet" href="../css/demo.css">

	<script>document.documentElement.className = "js";</script>
    <script src="vendor/jquery-1.9.1.js"></script>
    <script src="vendor/json2.js"></script>
    <script src="src/jquery.collapse.js"></script>
    <script src="src/jquery.collapse_storage.js"></script>
    <script src="src/jquery.collapse_cookie_storage.js"></script>
		<!-- THIS IS FOR JQUERY ACCORDION script end--> 

	<!-- THIS IS FOR CAROUSEL script start -->
	<!--  <link rel="stylesheet" type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/themes/base/jquery-ui.css"> -->
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
        <!-- <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/jquery-ui.min.js"></script> -->
	<!-- <script type="text/javascript" src="js/jquery_ui_modal.js"></script> -->
	<script type="text/javascript" src="js/prism.js"></script>
	<script type="text/javascript" src="js/simplycarousel.js"></script>
	 <!-- <script type="text/javascript" src="js/script2.js"></script>  -->
	 
	<!-- <link rel="stylesheet" href="/css/jquery_ui.css"> -->


	<link rel="stylesheet" href="css/demo.css">
	<!--THIS IS FOR JQUERY ACCORDION End -->
	<link rel="stylesheet" href="css/Jquery_modal_ui.css" media="screen">
		<link rel="stylesheet" href="css/master.css" type="text/css" media="all" />
<link rel="stylesheet" href="css/styles.css" type="text/css" media="all" />
<!-- <link rel="stylesheet" href="css/jquery_ui.css">  -->
<link rel="stylesheet" href="css/form-styles-v3.css" media="screen">
         <script>
           function OpenModal() {
                $("#divModal").dialog({
                    autoOpen: false, modal: true, title: 'FeedBack', width: '600px' , bottom:'20%',height:'auto' , position:'absolute',
                    
                }).dialog('open');
                return false;
                
            }
        </script>
        <script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>

<script>



$(document).ready(function(){


	$.ajax({
		url : '/Question',
		type : 'GET',
		 dataType: "json", 
		// data: "demoval="+$("#demoval").val(),
		success: function(modalresp){
			
			
	//	alert(data);
		
	
		
			var rowdata1 = "";
			
			 
			
			
			for(var i=0;i<modalresp.length;i++)
			{
				$("#requester1").val(modalresp[i].emailid);
				$("#q_group1").val(modalresp[i].question_group);
				$("#name_user").val(modalresp[i].name);
				console.log(modalresp[i].emailid);
				console.log(modalresp[i].name);
				rowdata1 += "<tr class='rowdata'>";
				rowdata1 += "<td>"+modalresp[i].question_seq+"</td>";
				
				rowdata1 += "<td>"+modalresp[i].question+"</td>"; 
			
				rowdata1 += "<td><span><input type='radio'  name='txtfeed"+i+"' value='5' checked>5</span><span><input type='radio'  name='txtfeed"+i+"' value='4'>4</span><span><input type='radio'  name='txtfeed"+i+"' value='3'>3</span><span><input type='radio'  name='txtfeed"+i+"' value='2'>2</span><span><input type='radio' name='txtfeed"+i+"' value='1'>1</span></td>"; 
				rowdata1 +="</tr>";
				
				
			}
			 
			$(".rowdata1").remove();
			$("#service_rq1").append(rowdata1);
			
			$.ajax({
				url : '/validatesession',
				type : 'GET',
				 dataType: "json", 
				 data: {
					 emailid:$("#requester1").val(),
					 namedtl:$("#name_user").val(),
					 
				 },
				success: function(response){
					console.log(response);
			//	alert("The response is ::"+response);
									
					//for(var j=0;j<response.length;j++)
					//{
						$("#uid").val(response.id);
						$("#feedback_status_id").val(response.feedback_status);
						console.log(response.id);
						console.log(response.feedback_status);
						//alert("the  id is ::"+data.id);
					//}
					 
					
				},
				
			}); 
			
			
			
		},
		error: function() {
	          alert("No data Found !");
	        
		}
	
	}); 
	

}); 	
</script>



<script>
$(document).ready(function(){
	
	
	
	$("#go").on("click", function(){
		performClick1();
	});
	
});

function performClick1() {
	
//	alert("clicked");
	$.ajax({
		type: 'POST',
        url: '/Footer',
        		
        //contentType: "application/json; charset=utf-8",
        //dataType: "json",
        data: $("#footerfeedback").serialize(),
        //data:"emailid="+$("#requester").val() + "&idval="+$("#uid").val() + "&txtfeedback="+$("#feedback_status_id").val(),
        cache: false,
        success: function (dataresp){
        	
			//	alert("Response received");
			
				
				$(".ui-dialog").hide();
				$(".ui-widget-overlay").hide();
				$(".ui-dialog-content").hide();
				$(".displaymodallink").hide(); 

			
	        },
	        
	        error: function(xhr) {
	        	//var err = eval("(" + xhr.responseText + ")");
	        	  console.log(xhr);
	        
		}
	        
	
	});
}


</script>

 
	
	 
<!--THIS IS FOR JQUERY ACCORDION End -->
<script language="javascript" type="text/javascript">
/* 
function popitup(url) {
	newwindow=window.open(url,'name',"top=400,left=500,width=500,height=100");
	if (window.focus) {newwindow.focus()}
	return false;
}

 */
</script>
<style type="text/css">
.popup {
    position: relative;
    display: inline-block;
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
} 

/* The actual popup */
 .popup .popuptext {
    visibility: hidden;
    width: 160px;
    background-color: #555;
    color: #fff;
    text-align: center;
    border-radius: 6px;
    padding: 8px 0;
    position: absolute;
    z-index: 1;
    bottom: 1000px;
    left: 50%;
    margin-left: -80px;
} 

/* Popup arrow */
 .popup .popuptext::after {
    content: "";
    position: absolute;
    top: 1400px;
    left: 50%;
    margin-left: -5px;
    border-width: 5px;
    border-style: solid;
    border-color: #555 transparent transparent transparent;
}
 
/* Toggle this class - hide and show the popup */
 .popup .show {
    visibility: visible;
    -webkit-animation: fadeIn 1s;
    animation: fadeIn 1s;
} 

/* Add animation (fade in the popup) */
 @-webkit-keyframes fadeIn {
    from {opacity: 0;} 
    to {opacity: 1;}
}

@keyframes fadeIn {
    from {opacity: 0;}
    to {opacity:1 ;}
} 

/* 
#divModal
{
opacity: 1.9;
}
 */



</style>




</head>
<body>
	<div id="footer-bottom">
	
	
		<div class="leftshell">
		
		
		
		<tr>		<td>Copyright @ 2017 IBM GBS</td>
				</tr>
			
		
		
		
		 </div>
		<div class="rightshell">
			<ul>
				<li>
				<a href="#" onclick="javascript:OpenModal();">FeedBack</a>
        <div style="display:none;" id="divModal" class="displaymodallink">
             <!-- <iframe id="myIframe" src="SomeValidURL"  /> -->
            <form action="" method="" id="footerfeedback" class="form-pat">
		<legend>
			<span class="required" style="font-size: 12px; font-family: Arial">
			</span>Please rate the following questions (5-Exellent, 1-Poor)
		</legend>
		<table>
			<tr>
				<label> <span style="font-size: 10px; font-family: Arial">Requestor
						(Intranet id) <span class="required">*</span>
				</span> <input  type="text" id="requester1" name="emailid" value="" />
				</label>
			</tr>
			<tr>
				<input type="hidden" id="q_group1" name="txtgroup" value="" />
			</tr>

			<tr>
				<input type="hidden" id="uid" name="id" value="" />
			</tr>
			<tr>
				<input type="hidden" id="demoval" name="demoval" value="demo" />
			</tr>
			<tr>
				<input type="hidden" id="feedback_status_id" name="txt_feedback" value="" />
			</tr>
<tr>
				<input type="hidden" id="name_user" name="name_visit" value="" />
			</tr>


		</table>

		<table id="service_rq1" class="cnt" border="1"
			style="font-size: 12px; font-family: Arial">








		</table>
		<table>

			<tr>

				<label> <span>Comments</span> <textarea id="Comment"
						name="txt_comment" placeholder=""></textarea>
				</label>

			</tr>

		</table>


		<label> <span>&nbsp;</span> <input type="button" id="go"
			class="button" value="Submit"
			style="font-size: 12px; font-family: Arial">&nbsp;&nbsp;
			<input type="reset" class="button" value="Reset"
			style="font-size: 12px; font-family: Arial" />
		</label> 

	</form>

	<div id="populatemessage"></div>
        </div>
				
				
				
				</li>
				<li class="popup"style="border-right: none;">
				<!-- <a href="../contactUs.html" onclick="return popitup('contactUs.html')">Contact Us</a> -->
				<a href="mailto:kgbseuro@in.ibm.com?subject=Request+for+Assistance">Contact Us</a>
				</li>


			</ul>
		</div>

		
	</div>

</body>
</html>