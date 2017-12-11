<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/master.css" type="text/css" media="all" />
<link rel="stylesheet" href="css/styles.css" type="text/css" media="all" />
<link rel="stylesheet" href="css/form-styles-v3.css" media="screen">

<link rel="stylesheet" href="css/Jquery_modal_ui.css" media="screen">
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
		success: function(data){
			
			
		//alert(data);
		
	
		
			var rowdata = "";
			
			 
			
			
			for(var i=0;i<data.length;i++)
			{
				$("#requester").val(data[i].emailid);
				$("#q_group").val(data[i].question_group);
			//	alert(data[i].question_group);
				console.log(data[i].emailid);
				
				rowdata += "<tr class='rowdata'>";
				rowdata += "<td>"+data[i].question_seq+"</td>";
				
				rowdata += "<td>"+data[i].question+"</td>"; 
			//	rowdata += "<td id='q_group' name='txtgroup' type='hidden'>"+data[i].question_group+"</td>"; 
				rowdata += "<td><span><input type='radio'  name='txtfeedb"+i+"' value='5' checked>5</span><span><input type='radio'  name='txtfeedb"+i+"' value='4'>4</span><span><input type='radio'  name='txtfeedb"+i+"' value='3'>3</span><span><input type='radio'  name='txtfeedb"+i+"' value='2'>2</span><span><input type='radio' name='txtfeedb"+i+"' value='1'>1</span></td>"; 
				rowdata +="</tr>";
				
				
			}
			 
			$(".rowdata").remove();
			$("#service_rq").append(rowdata);
			
			$.ajax({
				url : '/validatesession',
				type : 'GET',
				 dataType: "json", 
				 data: "emailid="+$("#requester").val(),
				success: function(response){
					console.log(response);
				//alert("The response is ::"+response.id);
									
					//for(var j=0;j<response.length;j++)
					//{
						$("#idvalues").val(response.id);
						$("#feedback_status_id").val(response.feedback_status);
						console.log(response.id);
						console.log(response.feedback_status);
					//	alert("the  id is ::"+response.id);
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
	
	
	
	$("#click").on("click", function(){
		performClick1();
	});
	
});

function performClick1() {
	
	//alert("clicked");
	$.ajax({
		type: 'POST',
        url: '/Question',
        		
        //contentType: "application/json; charset=utf-8",
        //dataType: "json",
        data: $("#fback").serialize(),
        //data:"emailid="+$("#requester").val() + "&idval="+$("#uid").val() + "&txtfeedback="+$("#feedback_status_id").val(),
        cache: false,
        success: function (data){
        	
				//alert("Response received");
			//	$("#populate").html(" Thanks for submitting the feedback..")
				
				$(".ui-dialog").hide();
				$(".ui-widget-overlay").hide();
				$(".ui-dialog-content").hide();
				$(".portbox").hide();
			
	        },
	        
	        error: function(xhr) {
	        	//var err = eval("(" + xhr.responseText + ")");
	        	  console.log(xhr);
	        
		}
	        
	
	});
}


</script>

 <link rel="stylesheet" href="css/Jquery_modal_ui.css" media="screen">

  

</head>
<body>

	<form action="" method="" id="fback" class="form-pat"> 
		
		
		<legend>
			<span class="required" style="font-size: 12px; font-family: Arial">*
			</span>Please rate the following questions (5-Exellent, 1-Poor)
		</legend>
		<table>
			<tr>
				<label> <span style="font-size: 10px; font-family: Arial">Requestor
						(Intranet id) <span class="required">*</span>
				</span> <input id="requester" type="text" name="email" value="" />
				</label>
			</tr>
			<tr>
				<input type="hidden" id="q_group" name="txtgroup" value="" />
			</tr>

			<tr>
				<input type="hidden" id="idvalues" name="idvalues" value="" />
			</tr>
			<tr>
				<input type="hidden" id="feedback_status_id" name="txtfeedbackgiven" value="" />
			</tr>


		</table>

		<table id="service_rq" class="cnt" border="1"
			style="font-size: 12px; font-family: Arial">








		</table>
		<table>

			<tr>

				<label> <span>Comments</span> <textarea id="txtcom"
						name="txtcom" placeholder=""></textarea>
				</label>

			</tr>

		</table>


		<label> <span>&nbsp;</span> <input type="button" id="click"
			class="button" value="Submit"
			style="font-size: 12px; font-family: Arial">&nbsp;&nbsp;
			<input type="reset" class="button" value="Reset"
			style="font-size: 12px; font-family: Arial" />
		</label> 
		</div>

	</form>

	
</body>
</html>
