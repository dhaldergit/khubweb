<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=0" />
<meta http-equiv="Content-Type" content="text/html;charset=windows-1252">

<meta http-equiv="content-type" content="text/html;charset=utf-8" />

<title>Metrics</title>


<!-- THIS IS FOR JQUERY ACCORDION script Start-->
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

<!-- THIS IS FOR JQUERY ACCORDION Start-->
<link rel="stylesheet" href="css/proposal-demo.css">
<!--THIS IS FOR JQUERY ACCORDION End -->





<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/tytabs.jquery.min.js"></script>
		<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.2.js"></script>
		<script>
			$(document).ready(function() {
				populateTrendGraph();
				//populateTrendReport();
				$('.tabs > li > a').click(function(event){
					event.preventDefault();//stop browser to take action for clicked anchor
					
					//get displaying tab content jQuery selector
					var active_tab_selector = $('.tabs > li.active > a').attr('href');					
					
					//find actived navigation and remove 'active' css
					var actived_nav = $('.tabs > li.active');
					actived_nav.removeClass('active');
					
					//add 'active' css into clicked navigation
					$(this).parents('li').addClass('active');
					
					//hide displaying tab content
					$(active_tab_selector).removeClass('active');
					$(active_tab_selector).addClass('hide');
					
					//show target tab content
					var target_tab_selector = $(this).attr('href');
					$(target_tab_selector).removeClass('hide');
					$(target_tab_selector).addClass('active');
				});
			});
			
			
			function populateTrendGraph(){
				
				

				//alert("here");
				$('#loading').show();
					var ctx = "<%=request.getContextPath()%>";
					//clearTable(document.getElementById('trendTable'));
					//var sForm = document.getElementById("searchForm");
					//var formVals = $("#searchForm").serialize();
					//console.log(formVals);
					$.ajax({
						url : ctx + "/ProposalServlet?khubPageId=metricsKHServicePage",
						success : function(result) {
							
							var ele = document.createElement("img");
							ele.setAttribute("src", "/images/BarChartKHServ.jpeg");
							ele.setAttribute("height", "480");
							ele.setAttribute("width", "640");
document.getElementById("hitsGraph").appendChild(ele);

 var elem = document.createElement("img");
elem.setAttribute("src", "/images/PieChartKHBySector.jpeg");
elem.setAttribute("height", "480");
elem.setAttribute("width", "640");
document.getElementById("hitsGraphPie").appendChild(elem);


elem = document.createElement("img");
elem.setAttribute("src", "/images/PieChartKHByGroup.jpeg");
elem.setAttribute("height", "480");
elem.setAttribute("width", "640");
document.getElementById("groupGraphPie").appendChild(elem);
 

/////////////////////////////////////


var res = JSON.stringify(result);
var jObj = JSON.parse(res).khMonthWiseData;
							var json = JSON.parse(jObj);
							var cEle = document.getElementById('trendTable');
							populateTables(cEle, json);
							
							jObj = JSON.parse(res).khSectorWiseData;
							 json = JSON.parse(jObj);
							 cEle = document.getElementById('trendTableSectorWise');
							populateTables(cEle, json);
							
							jObj = JSON.parse(res).khGroupWiseData;
							 json = JSON.parse(jObj);
							 cEle = document.getElementById('trendTableGroupWise');
							populateTables(cEle, json);
							
							
							
							
				/*  var headerElement = document.createElement('tr');	
				 var commonElement = document.createElement('th');
				 commonElement.setAttribute("rowspan","1");
				 commonElement.innerHTML = "Months";
				 headerElement.appendChild(commonElement);
				 
				 commonElement = document.createElement('th');
				 commonElement.setAttribute("rowspan","1");
				 commonElement.innerHTML = "Hits";
				 headerElement.appendChild(commonElement);
				
				
				 cEle.appendChild(headerElement);
				
			 
								 for(var j in json) {
			                        var chEle = document.createElement('tr');
									//chEle.setAttribute('id', "r" + i);
									var cell1 = document.createElement('td');

									 cell1.setAttribute('id', "r" + i + "_" + j
											+ "_" + "hit"); 

									cell1.innerHTML = j;

									chEle.appendChild(cell1);
									/////////////////////////////////////
									cell1 = document.createElement('td');

									 cell1.setAttribute('id', "r" + i + "_" + j
											+ "_" + "diff"); 

									cell1.innerHTML = json[j];

									chEle.appendChild(cell1);

									cEle.appendChild(chEle);
								} */

								//}

								////////////////////////////////////////

								$('#loading').hide();
							},
							type : 'POST'
						});

			}
			
			function populateTables(table, json) {
				var cEle = table;
				
	 var headerElement = document.createElement('tr');	
	 var commonElement = document.createElement('th');
	 commonElement.setAttribute("rowspan","1");
	 commonElement.innerHTML = "KEY";
	 headerElement.appendChild(commonElement);
	 
	 commonElement = document.createElement('th');
	 commonElement.setAttribute("rowspan","1");
	 commonElement.innerHTML = "DATA";
	 headerElement.appendChild(commonElement);
	
	
	 cEle.appendChild(headerElement);
	
 
					 for(var j in json) {
                        var chEle = document.createElement('tr');
						//chEle.setAttribute('id', "r" + i);
						var cell1 = document.createElement('td');

						/* cell1.setAttribute('id', "r" + i + "_" + j
								+ "_" + "hit"); */

						cell1.innerHTML = j;

						chEle.appendChild(cell1);
						/////////////////////////////////////
						cell1 = document.createElement('td');

						/* cell1.setAttribute('id', "r" + i + "_" + j
								+ "_" + "diff"); */

						cell1.innerHTML = json[j];

						chEle.appendChild(cell1);

						cEle.appendChild(chEle);
					}

			}

			function populateTrendReport() {
				//alert("here");
				//$('#loading').show();
				var ctx = "<%=request.getContextPath()%>";
					//clearTable(document.getElementById('trendTable'));
					//var sForm = document.getElementById("searchForm");
					//var formVals = $("#searchForm").serialize();
					//console.log(formVals);
					$.ajax({
						url : ctx + "/ProposalServlet?khubPageId=metricsTrendPage",
						success : function(result) {
							var res = JSON.stringify(result);
							var json = JSON.parse(res);
							
							var cEle = document.getElementById('trendTable');
							//clearTable(cEle);
var x = 0;
							for (var i in json) {
								
								var chEle = document.createElement('tr');
								chEle.setAttribute('id', "r" + i);
								//chEle.setAttribute('class', "rowdata");
								 var valJson = json[i];
								 /*if (valJson.hasOwnProperty('url')) {

								} else {
									addCells(cEle, chEle, "text", "", "url", i);
								}
			 */
			 
			 if(x == 0) {
				 var headerElement = document.createElement('tr');	
				 var commonElement = document.createElement('th');
				 commonElement.setAttribute("rowspan","2");
				 commonElement.innerHTML = "KH Pages";
				 headerElement.appendChild(commonElement);
				 for (var k in valJson) {
					
					 var rowElement = document.createElement('th');
					 rowElement.setAttribute("colspan","2");
					 rowElement.innerHTML = k;
					 headerElement.appendChild(rowElement);
				 }
				 headerElement.appendChild(rowElement);
				 var rowElement = document.createElement('tr');
				 for (var k in valJson) {
						
					
					 var hElement = document.createElement('th');
					 hElement.innerHTML = "HITS";
					 rowElement.appendChild(hElement);
					 
					 hElement = document.createElement('th');
					 hElement.innerHTML = "+/-";
					 rowElement.appendChild(hElement);
					 
				 }
				
				 cEle.appendChild(headerElement);
				 cEle.appendChild(rowElement);
			 }
			 x++;
			 var cell2 = document.createElement('td');
				
				
				cell2.setAttribute('id', "r"+i);
				
				cell2.innerHTML = i;
				
				chEle.appendChild(cell2);
			 
								 for(var j in valJson) {
									 
									 
									 
									
								var cell1 = document.createElement('td');
								
								
								cell1.setAttribute('id', "r"+i+"_"+j+"_"+"hit");
								
								cell1.innerHTML = valJson[j].hitCount;
								
								chEle.appendChild(cell1);
								/////////////////////////////////////
                                  cell1 = document.createElement('td');
								
								cell1.setAttribute('id', "r"+i+"_"+j+"_"+"diff");
								
								cell1.innerHTML = valJson[j].difference;
								
								chEle.appendChild(cell1);
								
								cEle.appendChild(chEle);
							}
                      
							}
							$('#loading').hide();
						},
						type : 'POST'
					});

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
			
			
			
			
		</script>
<style>

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



.displayed {
    display: block;
    margin-left: auto;
    margin-right: auto }


table {
    border-collapse: collapse;
    width: 1120px;
}
th, td {
    text-align: center;
    padding: 8px;
    font-size:12px;
}

tr:nth-child(even){background-color: #f2f2f2}


.tab-content.active{
	display: block;
}
			
.tab-content.hide{
	display: none;
}

#hits{
width:1120px;
overflow-x:auto;
}
</style>
<link href="css/tabs-styles.css" rel="stylesheet" type="text/css" />



<link rel="stylesheet" href="css/master.css" type="text/css" media="all" />
<link rel="stylesheet" href="css/styles.css" type="text/css" media="all" />

<link rel="stylesheet" href="css/new-topnav.css" media="screen">

<link rel="stylesheet" href="css/form-styles-v2.css" media="screen">

</head>

<body>
<div id="loading"> </div>
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
			<div id="main">
				<div class="mid-data-container">
					<!-- top heading start -->
<!-- 					<div class="pat-head">
						<h1>KH Service Request Metrics</h1>
					</div> -->
					<!-- top heading end -->

					<div class="clear"></div>

					<!-- Breadcrumb Start -->
					<div id="breadcrumb-holder_form">
						<a href='index.jsp'>Home</a> > Metrics - KH
					</div>
					<!-- Breadcrumb End -->

					<div class="clear"></div>


						
						<!-- Mid Nav right -->
					</div>
					<!-- Mid Nav End -->


					<!-- Body data Start -->
					<div class="data-holder">
						<div class="tab-holder">

							<div class="center">
								<!-- Tabs -->
								

									<ul class="tabs" id = "tabId">
										<li class="active">
											<a href="#tab1">Charts</a>
										</li>
										<li>
											<a href="#tab2">Raw Data</a>
										</li>

									</ul>

									<!-- /Tabs -->
								
								</div>

						</div>
								
								
							<!-- kaustav -->
<section id="tab1" class="tab-content active">
<div id="hitsGraph">

</div>
<br><br><br>
<div id="hitsGraphPie">
</div>
<br><br><br>
<div id="groupGraphPie">
</div>
</section>
<section id="tab2" class="tab-content hide">
<div id="hits">
<h1>Month Wise Raw Data</h1>
  <table id="trendTable" border="1">
   

  </table>
  <br><br>
  <h1>Group Wise Raw Data</h1>
  
   <table id="trendTableSectorWise" border="1">
   

  </table>
  <br><br>
  <h1>Sector Wise Raw Data</h1>
  
   <table id="trendTableGroupWise" border="1">
   

  </table>
</div>
</section>

<!-- kaustav -->

							
						<!-- Body data End -->

						<!-- Multi sections Start
				<div id="multi-sections">
					data
				</div>
				<!-- Multi sections End -->
					</div>

				</div>
				<!-- Main data End -->



				<div class="clear"></div>

				<!-- Footer Bottom -->
				<%@ include file="include/footer.jsp"%>
				<!-- Footer Bottom End -->
			</div>
			<!-- Container End -->

		<!-- WRAPPER END -->
</body>
</html>