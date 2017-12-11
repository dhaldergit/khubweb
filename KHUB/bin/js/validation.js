/**Sudipta**/

function validateForm() {
	var returnValue = true;

	var oppnum = document.regs.txtOppNo.value;
	var rexp = /^[a-zA-Z0-9-_]+$/;
	var client = document.regs.txtClient.value;
	var fcos = document.regs.txtfcsarea.value;
	var ind = document.regs.txtindus.value;
	var rqst = document.regs.txtrqsttype.value;
	var reqdate = document.regs.txtreqdate.value;
	var rfpdate = document.regs.txtrfp.value;
	var khdate = document.regs.txtkh.value;
	var errMsg = "";

	if (regs.txtOppNo.value.length != 10) {
		errMsg = "Opportunity number should be of 10 characters...</br>";
		document.getElementById("Geo").style.borderColor = 'red';
		document.regs.txtOppNo.focus();
		returnValue = false;
	}

	
	if (oppnum !="")
	
	{
	
	if (!oppnum.match(/^[a-zA-Z0-9-_]+$/)) {
		errMsg = errMsg + "Opportunity Number should not have special characters..</br>";
		document.getElementById("Geo").style.borderColor = 'red';
		document.regs.txtOppNo.focus();
		returnValue = false;
	}
	}

	if (client == "") {
		errMsg = errMsg + "*Please Enter the Client Name.</br> ";
		document.getElementById("Country").style.borderColor = 'red';
		document.regs.txtClient.focus();
		returnValue = false;
	}
	
	if(ind =="") {
		errMsg = errMsg + "Please Enter the Industry. </br>";
		document.getElementById("ind").style.borderColor = 'red';
		document.regs.txtfcsarea.focus();
		returnValue = false;
	}

	if (fcos == "") {
		
		errMsg = errMsg + "*Please Enter the Focus Area. </br>";
		document.getElementById("Regio").style.borderColor = 'red';
		document.regs.txtfcsarea.focus();
		returnValue = false;
	}
	

	 if(rqst =="")
	 {
     errMsg = errMsg + "*Please Enter the request type. </br>";
	 document.getElementById("rqstt").style.borderColor='red';
	 document.regs.txtfcsarea.focus();
	 returnValue = false;

	 }
	 
	 if(reqdate =="")
	 {

	  errMsg = errMsg + "*Please Enter the Request Date. </br>";
	 document.getElementById("demo1").style.borderColor='red';
	 document.regs.txtfcsarea.focus();
	 returnValue = false;
	 }
	
	 if(rfpdate =="")
	 {

	  errMsg = errMsg + "*Please Enter the RFP Due Date. </br>";
	 document.getElementById("demo2").style.borderColor='red';
	 document.regs.txtrfp.focus();
	 returnValue = false;
	 }

	 if(khdate =="")
	 {

	  errMsg = errMsg + "*Please Enter the KH Due Date.. </br>";
	 document.getElementById("demo3").style.borderColor='red';
	 document.regs.txtkh.focus();
	 returnValue = false;
	 }
	document.getElementById("pik").innerHTML = errMsg;
	return returnValue;

}