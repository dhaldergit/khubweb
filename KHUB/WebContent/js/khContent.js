/**
 * 
 */


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
	
	   var pm =  get("serviceLine");
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
			url :  "/ProposalServlet?serviceLine=" + obj +"&khubPageId=proposalPage" + "&type=" +type,
			success : function(result) {
				//alert(result);
				var res = JSON.stringify(result);
				//alert(res);
				var tJson = JSON.parse(res);
				var json = tJson.contentList;
				//alert(json);
				var cEle = document.createElement('ul');
								
				//alert(JSON.stringify(tJson.industryList));
				$("#serviceLine").html(JSON.stringify(tJson.serviceLineList));
				$("#geo").html(JSON.stringify(tJson.geoList));
				$("#industry").html(tJson.industryList);
				$("#growth").html(tJson.growthAreaList);
				implementRange(tJson.minDate, tJson.maxDate);
				//var ele = document.getElementById("bas_div").appendChild(cEle);
				//.createElement("<ul>");

				//alert(ele);
				if(json.length == 0) {
					$("#noResult_div").html("<span>Currently there is no content available</span>");
				} else {
					$("#noResult_div").html("");
				}
				for (var i = 0; i < json.length; i++) {
					var chEle = document.createElement('li');
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
	
 