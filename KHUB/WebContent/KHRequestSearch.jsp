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
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>
<link rel="stylesheet" href="css/new-topnav.css" media="screen">

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<link rel="stylesheet" href="css/form-styles-v2.css" media="screen">

<script type="text/javascript" src="js/datetimepicker.js"></script>


<script>
$(document).ready(function(){
	//alert("hi");
	$("#demo2").val('');
	$("input[type='text']").val("");
	
	
	
	
	$.ajax({
						url : 'service_request_data',
						type : 'GET',
						dataType: "json",
						//data: "oppno="+$("#oppno").val(),
						success: function(data){
							//alert(data);
							
						
							
							var industry_arr = data.indslist;
							var industry_dd = "<option value=''>Please Select</option>";							
							
							$.each(industry_arr, function(i, val){
								industry_dd += "<option value='"+val+"'>"+val+"</option>";
							});
							
					//	$(".country").html("<label><span>Country</span><select>"+country_dd+"</select></label>");
							$(".industry").html("<label><span>Industry</span><select id='Industry' name='inds'>"+industry_dd+"</select></label>");
																
							$("#spinner").html("");
					
						
		
			
        
        },	
        
        
        error: function() {
	          alert("Data Error. Data not found . Please Enter the correct search key");
		}
	});

	
	$("#Email").on("blur", function(){
		$.ajax({
			url : 'Emailvalidation?email='+$("#Email").val(),
			contentType: "text/plain",
	         cache: false,
			success : function(responseText) {
				//alert(responseText);
				
				//jsonArr = JSON.parse(responseText);
				
				//console.log(jsonArr.length);
				
				if (responseText=="false"){
					$("#pik").html("Email does not exist");
				}
				
				if(responseText=="true")
					{
					$("#ijk").html("Email id validated successfully ..");
					}
			}
		});
	});
	
	
	

	

  
	
	
	
});
	

</script>







<script>



$(document).ready(function(){


	$("#search").on("click", function(){
		performClick();
	});

/* 	$("#DROP").on("select", function(){
		performupdate();
	}); */

}); 

function performClick() {

	
	$.ajax({
		url : 'SearchRequest',
		type : 'POST',
		dataType: "json",
		data: "txtoppno="+$("#oppno").val()+"&clntnm="+$("#clnt").val()+"&oppname="+$("#oname").val()+"&txtrfp="+$("#demo2").val()+"&rqstr="+$("#Email").val()+"&inds="+$("#Industry").val()+"&date="+$("#demo1").val(), 
		success: function(data){
			//alert(data.geoloc);
			// alert(data);
			console.log(data.length); 
			//alert(data);
			
			//jsonArr = JSON.parse(data);
												
			/* $("#spinner").html("");	
			$(".note").html(""); */
			
			var rowdata = "";
			
			// var rowdata1 = "";
			
			 var col = "COL_";
			 
			 
			 
			
			for(var i=0;i<data.length;i++)
			{
				
				rowdata += "<tr class='rowdata'>";
				
				rowdata += "<td>"+data[i].rqstor+"</td>";
				rowdata += "<td>"+data[i].group+"</td>";
				rowdata += "<td>"+data[i].typ+"</td>";
				rowdata += "<td>"+data[i].clnt_nm+"</td>";
				rowdata += "<td>"+data[i].won+"</td>";
				rowdata += "<td name='oppno'>"+data[i].oppnumbr+"</td>";
				rowdata += "<td>"+data[i].opname+"</td>";
				rowdata += "<td>"+data[i].comp+"</td>";
				rowdata += "<td>"+data[i].indus+"</td>";
				rowdata += "<td>"+data[i].strt_dt+"</td>";
				rowdata += "<td><select name='drop' id="+i+" onchange=GetSelectedTextValue(this)>"+data[i].is_complete+"</select></td>";
				rowdata += "<td  id="+col+i+">"+data[i].id+"</td>";
				rowdata +="</tr>";
				
				$(".rowdata").remove();
				$("#service_rq").append(rowdata);
			}
			$("#mno").css("visibility", "visible");
			$("#service_rq").css("visibility", "visible"); 
			
		},
		error: function() {
	          alert("No data Found for the Specified Opportunity Number!");
	        
		}
	
	}); 

	
}




</script>


  <script type="text/javascript">
    function GetSelectedTextValue(i) {
        var selectedText = i.options[i.selectedIndex].innerHTML;
        var selectedValue = i.value;
        if(selectedValue!='Y' && selectedValue!='N' )
        	{
        	alert("Please select the proper value for modification..")
        	$(i).val("N");
        	
        	}
        
       
        
    }
</script>


	
	 <script>
	
	$(document).ready(function(){
		
		
		$("#update").on("click", function(){
			update();
		});
		
		
	});
	
	
	
	function update() {

	 	
		var x = document.getElementById("service_rq").rows.length;
		alert(x);
		var tableData = { 
			    khReqData : [] 
			};

		for (var i=0; i< x - 1 ; i++)
			{
			var jsonData = {};
			//alert( document.getElementById(i));
			//alert( document.getElementById("COL_"+i));
			var yesNo = document.getElementById(i).value;
			
			var colVal = document.getElementById("COL_"+i).value;
			var colId = document.getElementById("COL_"+i).innerHTML;
			jsonData.yesNo = yesNo;
			jsonData.colId = colId;
			jsonData.colVal = colVal;
			tableData.khReqData.push(jsonData);
			
			}
		var newData = JSON.stringify(tableData);
		
		alert("The new data is:"+ newData);
		alert("tabledata "+tableData);  
		
		$.ajax({
			url : 'updateRequest',
			type : 'POST',
			dataType: 'text/json',
		
		 data:	"tableData="+newData,
		 		 		 
	 	success: function(response){
	 		//alert("data inside ajax block"+ data);
				console.log(response.length); 
				
				//alert("exiting ajax block"+ data);
				
				
				
				
			},
			error: function() {
		         // alert("Data Error. Try again.. please with the correct opportunity Number!");
		        
			}
		
		}); 

			
	}
	</script>
 	
	
	
	
	<!-- <style type="text/css">
		.rowdata {
			color: #444;
			display: block;
			
			
		}
		.rowdata:nth-child(odd) {
		    background: #ffffff;
		}
		.rowdata:nth-child(even) {
		    background: #ccff99;
		}
		.rowdata:hover {
			background: #dddddd;
		}
		
	</style> -->


<style type="text/css">
#slide-wrap {
	margin: 0 auto;
	overflow: auto;
	background: #BCC5E1;
	
}

#inner-wrap {
	float: left;
	margin-right: -30px;
	/*Be safe with Opera's limited negative margin of 32695px (-999em could cause problems with large font sizes)*/
	padding-left: 10px;
	height: 200px;
	width: 200px;
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
	width: 200px;
	height: 150px;
}

select {
	margin-bottom: 5px;
	margin-right: 10px;
}
</style>
<body>
	<!-- WRAPPER START -->
	<div id="wrapper">
	<!-- Container Start -->
	<div class="container">
		<%@ include file="include/headers.jsp" %>
		
		<!-- Top-nav End -->
		
		<div class="clear"></div>
		

			<!-- Main data -->
			<div id="main">
				<div class="mid-data-container">
					<!-- top heading start -->
<!-- 					<div class="pat-head">
						<h1>KH Search</h1>
					</div> -->
					<!-- top heading end -->
					<!-- Breadcrumb Start--->
					<div id="breadcrumb-holder_form">
						<a href='index.jsp'>Home</a> > KH Search
					</div>
					
					<!-- Breadcrumb End-->
					<div class="clear"></div>



					<!-- body data Start -->
					<div class="data-holder">
						<div class="form-holder">

							<form action="SearchRequest" method="post" name="SearchRequest"
								class="form-pat">



								<h1>KH Search</h1>
								<font color='red'>
									<div id="pik"></div>
								</font><br /> <font color='green'>
									<div id="ijk"></div>
								</font><br />

								<fieldset>
									<legend>Search</legend>




									<div class="leftfield">
										<label> <span>Requested by<span class=""></span></span>
											<input id="Email" type="text" name="rqstr" placeholder="" />
										</label>
									</div>





									<div class="rightfield">
										<label> <span>Client<span class=""></span></span> <input
											id="clnt" type="text" name="clntnm" placeholder="" />
										</label>
									</div>






									<div class="leftfield industry">
										<label> <span>Industry</span> <input id="Industry"
											type="text" name="inds" placeholder="" readonly />
										</label>
									</div>
									<div class="rightfield">
										<label> <label> <span> Group</span> </span> <select
												name="txtrfp" id="demo2">
													<option value=" " selected>Please Select</option>
													<option value="Leadership">Leadership</option>
													<option value="PAT">PAT</option>
													<option value="Sales & delivery">Sales&delivery</option>
													<option value="Solutioning">"Solutioning"</option>
													<option value="Storm A2">Storm A2</option>
													<option value="Storm A3">Storm A3</option>

											</select>
										</label>
									</div>

									<div class="leftfield">
										<label> <span>Opportunity Number<span class=""></span></span>
											<input id="oppno" type="text" name="txtoppno" value=""
											placeholder="" />
										</label>
									</div>
									<div class="rightfield">
										<label> <span>Opportunity Name<span class=""></span></span>
											<input id="oname" type="text" name="oppname" placeholder="" />
										</label>
									</div>
							<div class="leftfield">
									
									<span>Start Date </span>
								<input id="demo1" type="text" name="date" style="width: 320px;"><a href="javascript:NewCal('demo1')"><img src="images/cal.gif" width="16" height="16" border="0"></a>
	  								
									
								</div>
														
						</fieldset>
						<label> <span>&nbsp;</span> <input type="button"
											class="button" id="search" value="Search">&nbsp;&nbsp;


										</label>

</form>

<br/><br/><br/><br/>
						<fieldset id="mno" style="visibility: hidden;">
							<legend>Results</legend>
							<form>
							<div id="slide-wrap">
								<div id="inner-wrap">
									<div style="display: inline-block;"
										class="horizontal-fields service-item">
										
										<table id="service_rq" border="1" style="visibility: hidden;">
											 <tr>
												<td><label for="service_name">Requested by</label></td>

												<td><label for="service_description">Group</label></td>
												<td><label for="service_price">Type</label>
												<p></td>
												<td><label for="service_duration">Client</label>
												<p></td>
												<td><label for="service_duration">Won</label></td>
												<td><label for="service_duration">Opportunity
														No.</label></td>
												<td><label for="service_duration">Opportunity
														Name</label></td>
												<td><label for="service_duration">Competitor</label></td>
												<td><label for="service_duration">Industry</label></td>
												<td><label for="service_duration">Start Date</label></td>
												<td><label for="service_duration">IS_COMPLETE</label></td>
												<!-- <td><label for="service_duration">End Date</label></td> -->
											</tr> 





										</table>
										<br>
									</div>

								</div>
							</div>
							
							
							<label> <span>&nbsp;</span> <input type="button"
											class="button" id="update" value="Update">


										</label>
                         </form>

							
						</fieldset>




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