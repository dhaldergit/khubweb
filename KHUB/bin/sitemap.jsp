<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=0" />
<meta http-equiv="Content-Type" content="text/html;charset=windows-1252">

<meta http-equiv="content-type" content="text/html;charset=utf-8" />

<title>Sitemap</title>
<link rel="stylesheet" href="css/master.css" type="text/css" media="all" />
<link rel="stylesheet" href="css/styles.css" type="text/css" media="all" />

<link rel="stylesheet" href="css/new-topnav.css" media="screen">

</head>

<body>
<!-- WRAPPER START -->
<div id="wrapper">
	<!-- Container Start -->
	<div class="container">
		<!-- Header file headers is included here  -->
		<%@ include file="include/headers.jsp" %>
		<!-- Header End -->
		
		<div class="clear"></div>
		
		<!-- top-nav strts here & jsp file topnav is included  -->
		
			<%@ include file="include/topnav.jsp" %>
				<div class="clear"></div>
		

		<!-- Main data -->
		<div id="main">
			<div class="mid-data-container">
				<!-- top heading start -->
				<div class="pat-head">
					<h1>Sitemap</h1>
				</div>
				<!-- top heading end -->

				<div class="clear"></div>

				<!-- Breadcrumb Start -->
					<div id="breadcrumb-holder">
						<a href='index.html'>Home</a> > Sitemap
					</div>
				<!-- Breadcrumb End -->

				<!-- body data Start -->
				<div class="data-holder">
					<table class="sitemap"">
						<tbody>
							<tr>
								<td>
								<img alt="Sitemap" src="images/sitemap.jpg" usemap="#map" />
								<map name="map">
								  <area coords="118,502,217,553" href="service_request.jsp" shape="rect" />
								  <area coords="148,60,260,97" href="AdvancedSearch.jsp" shape="rect" />
								  <area coords="232,422,331,473" href="pat-request.jsp" shape="rect" />
								  <area coords="235,342,334,393" href="pat-feedback.jsp" shape="rect" />
								  <area coords="118,422,217,473" href="kh-feedback.jsp" shape="rect" />
								  <area coords="118,342,217,393" href="kh-contribute.jsp" shape="rect" />
								<area coords="309, 27, 552, 112" href="index.jsp" shape="rect" />
								<area coords="599, 26, 710, 113" href="contentlist.jsp" shape="rect" />
								<area coords="913,183,993,265" shape="rect" />
								<area coords="17,185,89,268" shape="rect" />
								<area coords="3,341,100,384" href="storybankmain.jsp" shape="rect" />
								<area coords="3,422,100,469" href="storybankmain.jsp" shape="rect" />
								<area coords="2,502,103,550" href="storybankmain.jsp" shape="rect" />
								<area coords="-2,583,98,636" href="storybankmain.jsp" shape="rect" />
								<area coords="-1,663,98,714" href="storybankmain.jsp" shape="rect" />
								<area coords="101,186,184,260" href="kmt.jsp" shape="rect" />
								<area coords="194,188,271,267" href="pat.jsp" shape="rect" />
								<area coords="284, 188, 362, 267" href="salesprocess.jsp" shape="rect" />
								<area coords="374,187,454,265" href="marketinsight.jsp" shape="rect" />
								<area coords="463,188,543,265" href="competitorinsight.jsp" shape="rect" />
								<area coords="552, 188, 631, 265" href="capabilities.jsp" shape="rect" />
								<area coords="643,187,723,265" href="requestresponse.jsp" shape="rect" />
								<area coords="732,185,815,263" href="proposalbank.jsp" shape="rect" />
								<area coords="822,186,903,265" href="proposalinserts.jsp" shape="rect" />
								<area coords="768, 338, 865, 396" href="https://w3-connections.ibm.com/communities/service/html/communityview?communityUuid=360f6b48-9359-4b50-85f4-36045bde52b5" target="_blank" shape="rect" />
								<area coords="893, 338, 991, 395" href="https://w3-03.sso.ibm.com/services/practitionerportal/assethub/production/sacindex.jsp" target="_blank" shape="rect" />
								<area coords="768, 418, 864, 476" href="https://w3.ibm.com/ibm/thinkacademy/index.html#/home" target="_blank" shape="rect" />
								<area coords="895, 418, 991, 475" href="http://ibv.dst.ibm.com/index.html" target="_blank" shape="rect" />
								<area coords="770, 496, 864, 555" href="https://rv.roinnovation.com/IBM/HomeV3.aspx" target="_blank" shape="rect" />
								<area coords="895, 495, 992, 556" href="https://w3-03.sso.ibm.com/marketing/mi/mihome.nsf/pages/IBMCAI" target="_blank" shape="rect" />
								<area coords="769, 575, 864, 638" href="https://w3-03.sso.ibm.com/marketing/mi/miibot.nsf/f.MWEBIBOT" target="_blank" shape="rect" />
								<area coords="897, 576, 992, 638" href="https://w3-03.sso.ibm.com/marketing/mi/mihome.nsf/pages/MI+Knowledge+Center" target="_blank" shape="rect" />
								</map>
							  </td>
							</tr>
						</tbody>
					</table>
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



					<script>
					 jQuery(document).on('ready', function(){
					 jQuery("#accordion").accordion();
						//jQuery("#accordion").tabs("#accordion div.pane", {tabs: 'h2', effect: 'slide', initialIndex: null});

					});
					</script>




</body>
</html>