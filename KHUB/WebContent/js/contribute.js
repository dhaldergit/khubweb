/**Sudipta**/

function contributeForm() {
	var returnValue = true;

	var icp = document.icp.txticap.value;
	var srvline = document.icp.txtserv.value;
	var ind = document.icp.txtindustry.value;
	var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	var ltus = document.icp.txtln.value;
	var ufle = document.icp.txtuploadfile.value;
	var errMsg = "";

	
	
	
	
	
	
	if(icp =="") {
		errMsg = errMsg + "Please Enter the Type of ICAP. </br>";
		document.getElementById("icapid").style.borderColor = 'red';
		document.icp.txticap.focus();
		returnValue = false;
	}

	if (srvline == "") {
		
		errMsg = errMsg + "*Please Enter the service line. </br>";
		document.getElementById("servid").style.borderColor = 'red';
		document.icp.txtserv.focus();
		returnValue = false;
	}
	

	 if(ind =="")
	 {
     errMsg = errMsg + "*Please select the proper industry. </br>";
	 document.getElementById("indid").style.borderColor='red';
	 document.icp.txtindustry.focus();
	 returnValue = false;

	 }
	 
	 
	 
	 if(ltus=="" || ltus.length<7)
			
		{
			errMsg = errMsg+ "lotus id need to be entered correctly</br>"
			document.getElementById("lnid").style.borderColor = 'red';
			document.icp.txtln.focus();
			returnValue = false;	



		}
		
		
		if(ltus!="")
			{
			
			if (!filter.test(ltus))
			{
				errMsg = errMsg+"Please Enter correct notes id.</br>";
				document.getElementById("lnid").style.borderColor = 'red';
				document.icp.txtln.focus();
				returnValue = false;

			}
			}

		 if(ufle =="")
		 {
	     errMsg = errMsg + "Please select a file </br>";
		 document.getElementById("upld").style.borderColor='red';
		 document.icp.txtuploadfile.focus();
		 returnValue = false;

		 }

	 
	document.getElementById("pik").innerHTML = errMsg;
	return returnValue;

}