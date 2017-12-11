<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=0" />
<meta http-equiv="Content-Type" content="text/html;charset=windows-1252">

<meta http-equiv="content-type" content="text/html;charset=utf-8" />

<title>Competitor Insight</title>


<!-- THIS IS FOR JQUERY ACCORDION script Start-->
<script src="vendor/jquery-1.9.1.js"></script>
<script src="vendor/json2.js"></script>
<script src="src/jquery.collapse.js"></script>
<script src="src/jquery.collapse_storage.js"></script>
<script src="src/jquery.collapse_cookie_storage.js"></script>
<!-- THIS IS FOR JQUERY ACCORDION script end-->

<!-- <script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script> -->

<!-- THIS IS FOR JQUERY ACCORDION Start-->
<link rel="stylesheet" href="css/proposal-demo.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/jquery-ui-1.10.2.custom.min.css">
<link rel="stylesheet" href="css/stream.css">
<!--THIS IS FOR JQUERY ACCORDION End -->
<link rel="stylesheet" href="css/range-picker.css">





 <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="js/jquery-1.10.2-ui.min.js"></script> 
<script src="js/range_picker.js" type="text/javascript" charset="utf-8"></script>
<script src="js/range_picker_impl.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" >

 $(document).on('click',".checkAll",function (e) {
	 
	  var checkBoxName = this.value;
	  
	  if(this.checked) {
	      // Iterate each checkbox
	      $('input[name='+checkBoxName+']').each(function() {
	          this.checked = true;
	      });
	  }
	  else {
	    $('input[name='+checkBoxName+']').each(function() {
	          this.checked = false;
	      });
	  }
	  
	 });

  $(document).on('click',".checkBoxVdte",function (e) {
		
	  var checkBoxName = this.name;
	  var selAllChbxName = "selectAll_" + checkBoxName;
	  var isAll = true;
	  if(this.checked) {
	      // Iterate each checkbox
	      $('input[name='+checkBoxName+']').each(function() {
	          if (!this.checked == true) {
	        	  isAll = false;
	        	  return false;
	          }
	      });
	      if(isAll) {
	    	  document.getElementById(selAllChbxName).checked = true;
	      }
	  }
	  else {
		  
	    document.getElementById(selAllChbxName).checked = false;
	  }
	  
	 });

  
  $(document).ready(function(){
	
	   var pm =  get("competitor");
	   //alert(pm);
	   if(pm == undefined) {
	   populateBas("");
	   } else {
	    populateBas(pm);
	   }
	});
  
  function countDays(pubDate) {
		var dtSplit  = pubDate.split("-");
		var dt ="";
		try {
		 dt = dtSplit[1] + "/" + dtSplit[2] + "/" + dtSplit[0];
		} catch (e) {
			// TODO: handle exception
		}
		var date1 = new Date(dt);
		var date2 = new Date();
		var timeDiff = Math.abs(date2.getTime() - date1.getTime());
		var diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24)); 
		return diffDays;
	}
  
function populateBas(obj) {
	$('#loading').show();
	//var ctx = "<%=request.getContextPath()%>";
		//alert(ctx);
		var type = document.getElementById("type").value;
		$.ajax({
			//url : ctx + "/ProposalServlet?serviceLine=" + obj +"&khubPageId=proposalPage",
			url :  "/ProposalServlet?competitor=" + obj +"&khubPageId=proposalPage" + "&type=" +type,
			success : function(result) {
				//alert(result);
				var res = JSON.stringify(result);
				//alert(res);
				var tJson = JSON.parse(res);
				var json = tJson.contentList;
				//alert(json);
				var cEle = document.createElement('ul');
				//alert(JSON.stringify(tJson.industryList));
				//$("#serviceLine").html(JSON.stringify(tJson.serviceLineList));
				//$("#geo").html(JSON.stringify(tJson.geoList));
				//$("#industry").html(tJson.industryList);
				//$("#growth").html(tJson.growthAreaList);
				$("#competitor").html(tJson.competitorsList);
				implementRange(tJson.minDate, tJson.maxDate);
				//var ele = document.getElementById("bas_div").appendChild(cEle);
				//.createElement("<ul>");

				//alert(ele);
				if(json.length == 0) {
					$("#noResult_div").html("<span>Currently there is no content available</span>");
				} else {
					$("#noResult_div").html("");
				}
				for (var i = 0; i < json.length; i++) {var chEle = document.createElement('li');
				var lkDiv = document.createElement('div');
				lkDiv.setAttribute("class", "linkClass");
				var dtDiv = document.createElement('div');
				dtDiv.setAttribute("class", "dateClass");
				var ach = document.createElement('a');
				ach.setAttribute('href', json[i].link);
				ach.setAttribute('target', '_blank');
				ach.innerHTML = json[i].contentName;
				lkDiv.appendChild(ach);
				if(json[i].year == 0) {
					dtDiv.innerHTML = 'N/A';
				} else {
				dtDiv.innerHTML = json[i].year;
				}
				chEle.appendChild(lkDiv);
				chEle.appendChild(dtDiv);
				var brElement = document.createElement('br');
				chEle.appendChild(brElement);
				 if(countDays(json[i].datePublished) < 7) {
					ach = document.createElement('img');
					ach.setAttribute('src', "images/icon-new.gif");
					lkDiv.appendChild(ach);
				} 
				cEle.appendChild(chEle);
				//ele.appendChild("<li><a href=\""+json[i].url+"\">"+json[i].content_name+"</a></li>");
			}
				if (document.getElementById("bas_div").hasChildNodes()) {
					var nxt = document.getElementById("bas_div").firstChild;
					document.getElementById("bas_div").removeChild(nxt);
				}
				var ele = document.getElementById("bas_div").appendChild(cEle);
				//alert(ele.innerHTML);
				//$("#bas_div").html(result);
				$('#loading').hide();
			},
			type : 'POST'
		});
		
	}
	
	function searchFil() {
		console.log("double_date_range:: "+ document.getElementById("startVal").innerHTML);
		console.log("double_date_range1:: "+ document.getElementById("endVal").innerHTML);
		$('#loading').show();
		//var ctx = "<%=request.getContextPath()%>";
		var formVals = $("#searchForm").serialize();
		$.ajax({
			//url : ctx + "/ProposalServlet?khubPageId=proposalPage&" + formVals,
			url : "/ProposalServlet?khubPageId=proposalPage&" + formVals,
			success : function(result) {
				
				//alert(result);
				var res = JSON.stringify(result);
				//alert(res);
				var tJson = JSON.parse(res);
				var json = tJson.contentList;
				//alert(json);
				var cEle = document.createElement('ul');
				$("#serviceLine").html(JSON.stringify(tJson.serviceLineList));
				$("#geo").html(JSON.stringify(tJson.geoList));
				$("#industry").html(tJson.industryList);
				$("#growth").html(tJson.growthAreaList);
				//var ele = document.getElementById("bas_div").appendChild(cEle);
				//.createElement("<ul>");

				//alert(ele);
				if(json.length == 0) {
					$("#noResult_div").html("<span>No records found for this search data </span>");
				} else {
					$("#noResult_div").html("");
				}
				for (var i = 0; i < json.length; i++) {var chEle = document.createElement('li');
				var lkDiv = document.createElement('div');
				lkDiv.setAttribute("class", "linkClass");
				var dtDiv = document.createElement('div');
				dtDiv.setAttribute("class", "dateClass");
				var ach = document.createElement('a');
				ach.setAttribute('href', json[i].link);
				ach.setAttribute('target', '_blank');
				ach.innerHTML = json[i].contentName;
				lkDiv.appendChild(ach);
				if(json[i].year == 0) {
					dtDiv.innerHTML = 'N/A';
				} else {
				dtDiv.innerHTML = json[i].year;
				}
				chEle.appendChild(lkDiv);
				chEle.appendChild(dtDiv);
				var brElement = document.createElement('br');
				chEle.appendChild(brElement);
				 if(countDays(json[i].datePublished) < 7) {
					ach = document.createElement('img');
					ach.setAttribute('src', "images/icon-new.gif");
					lkDiv.appendChild(ach);
				} 
				cEle.appendChild(chEle);
				//ele.appendChild("<li><a href=\""+json[i].url+"\">"+json[i].content_name+"</a></li>");
			}
				if (document.getElementById("bas_div").hasChildNodes()) {
					var nxt = document.getElementById("bas_div").firstChild;
					document.getElementById("bas_div").removeChild(nxt);
				}
				var ele = document.getElementById("bas_div").appendChild(cEle);
				//alert(ele.innerHTML);
				//$("#bas_div").html(result);
				$('#loading').hide();
			},
			type : 'POST'
		});
	}
	
	
	function get(name){
		   if(name=(new RegExp('[?&]'+encodeURIComponent(name)+'=([^&]*)')).exec(location.search))
		      return decodeURIComponent(name[1]);
		}
	
 

</script>
<link href="css/tabs-styles.css" rel="stylesheet" type="text/css" />



<link rel="stylesheet" href="css/master.css" type="text/css" media="all" />
<link rel="stylesheet" href="css/styles.css" type="text/css" media="all" />

<link rel="stylesheet" href="css/new-topnav.css" media="screen">

<link rel="stylesheet" href="css/form-styles-v2.css" media="screen">
<link rel="stylesheet" href="css/khContentStyle.css" media="screen">

</head>

<body>
<div id="loading"></div>

	<!-- WRAPPER START -->
	<div id="wrapper">
		<!-- Container Start -->
		<div class="container">
			<!-- Header -->
			
			<!-- Header End -->
<%@ include file="include/headers.jsp" %>

			<div class="clear"></div>

			<!-- Top-nav -->
			
			<!-- Top-nav End -->

			<div class="clear"></div>

			<!-- Main data -->
			<div id="main_proposal">
				<div class="mid-data-container">
				<div id="multi-sections">
				<div class="part1_proposal">
					<!-- top heading start -->
<!-- 					<div class="pat-head">
						<h1>Proposal Bank</h1>
					</div> -->
					<!-- top heading end -->

					<div class="clear"></div>

					<!-- Breadcrumb Start -->
					<!-- <div id="breadcrumb-holder">
						<a href='index.jsp'>Home</a> > Competitor Insight
					</div> -->
					<!-- Breadcrumb End -->

					<div class="clear"></div>
<form id="searchForm" name="searchForm" >
<div class="container">

<div class="sidebar col-md-3">
                               <div class="searchholder">
								<div class="searchholder-in">
                            <input type="button" class="srh" value="Search" onclick="searchFil();"><br></div></div>
                            
                            <div class="well">
																<fieldset>
																<legend>Competitors</legend>
																<select id="competitor" name="competitor"></select>
																</fieldset>
																</div>
																<!-- <div class="well">
																<fieldset>
																<legend>Service Line</legend>
																<select id="serviceLine" name="serviceLine"></select>
																</fieldset>
																</div>
																<div class="well">
																<fieldset>
																<legend>Geography</legend>
																<select id="geo" name="geo"></select>
																</fieldset>
																</div>
																<div class="well" style="height: 12em;  overflow: auto;"><fieldset><legend>Industry</legend>
																<div  id="industry"></div>
																</fieldset>
																</div>
																<div class="well" style="height: 12em;  overflow: auto;"><fieldset><legend>Growth Area</legend>
                                                                      <div  id="growth"></div>
                                                                      </fieldset>
                                                                      </div> -->
                                                                      <div class="well" style="height: 12em;  overflow: auto;"><fieldset><legend>Published Date</legend>
                                                                     <div id="double_date_range" ></div>
                                                                      </fieldset>
                                                                      </div>
                                                                     <!-- <script src="js/range_picker.js" type="text/javascript" charset="utf-8"></script>
                                                                       <script src="js/range_picker_impl.js" type="text/javascript" charset="utf-8"></script> -->
                                                                      <br> 
                                                                      <!-- hidden types start -->
<input type="hidden" id="type" name="type" value="Competitor Insights">
<input type="hidden" id="minDate" name="minDate" value="">
<input type="hidden" id="maxDate" name="maxDate" value="">
<!-- hidden types end -->
                               <div class="searchholder">
								<div class="searchholder-in"> 
									<input type="button" class="srh" value="Search"
											onclick="searchFil();"><br></div></div>
											
											</div>
											
											</div>
</form>
					</div>
					<div class="data">
					<div id="breadcrumb-holder">
						<a href='index.jsp'>Home</a> > Competitor Insight
					</div>
					<div class="data-holder_proposal">
					<div class="tab-holder_proposal">
					<div  id="noResult_div" style=" padding-left: 0px"></div>
						<div  id="bas_div" style=" padding-left: 0px"></div>
					
					</div>
					
					</div>
					</div>
					</div>
					</div>

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