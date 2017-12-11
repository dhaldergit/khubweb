/**
 * 
 */

function verifyForm()

{

	var returnValue = true;
	var email = document.patreq.rqstr.value;
	var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	var protyp = document.patreq.typpro.value;
	var ctrct = document.patreq.cntrtyp.value;
	var rStart = document.patreq.stdate.value;
	var propDate = document.patreq.pdp.value;
	var propCust = document.patreq.pdc.value;
	var errMsg = "";


	if (!filter.test(email))
	{
		errMsg = "Please Enter correct mail id.</br>";
		document.getElementById("Email").style.borderColor = 'red';
		document.patreq.rqstr.focus();
		returnValue = false;

	}

	if(protyp=="")
	{
		errMsg = errMsg+ "Proposal Type Cannot be left Blank.</br>"
		document.getElementById("prop").style.borderColor = 'red';
		document.patreq.typpro.focus();
		returnValue = false;	



	}


	if(ctrct =="")
	{

		errMsg = errMsg + "Contract Type cannot be left blank. </br>";
		document.getElementById("ctrct").style.borderColor='red';
		document.patreq.cntrtyp.focus();
		returnValue = false;
	}



	if(rStart =="")
	{

		errMsg = errMsg + "*Please Enter the Start Date. </br>";
		document.getElementById("demo5").style.borderColor='red';
		document.patreq.stdate.focus();
		returnValue = false;
	}

	if(propDate =="")
	{

		errMsg = errMsg + "*Please Enter the Due Date from Proposal Hub. </br>";
		document.getElementById("demo6").style.borderColor='red';
		document.patreq.pdp.focus();
		returnValue = false;
	}

	if(propCust =="")
	{

		errMsg = errMsg + "*Please Enter the Due Date to Customer. </br>";
		document.getElementById("demo7").style.borderColor='red';
		document.patreq.pdc.focus();
		returnValue = false;
	}



	document.getElementById("ijk").innerHTML = errMsg;
	return returnValue;


}