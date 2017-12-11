/**
 * 
 */

/**
 * 
 */

function validatesectorForm()

{
	var returnValue = true;

	
	var odesc = document.patreq.comment.value;
	var opno = document.patreq.oppno.value;
	/*
	 * var rgexp = new RegExp("^\d*([.]\d{2})?$"); var gbs_val =
	 * document.patreq.gbs.value; document.getElementbyID("Total").isNaN();
	 */

	var country = document.patreq.cntry.value;
	var sector = document.patreq.sctr.value;
	var industry = document.patreq.inds.value;
	var client = document.patreq.clntnm.value;
	var opname = document.patreq.oppname.value;
	var reqdate = document.patreq.reqstdate.value;
	var duedate = document.patreq.pdp.value;
	var pdate = document.patreq.pdc.value;
    var geo = document.patreq.geo.value;
    var psa = document.patreq.psl.value;
    var date = reqdate.substring(0, 2);
	var month = reqdate.substring(3, 5);
	var year = reqdate.substring(6, 10);
	var tcv = document.patreq.gbs.value;
	var date1 = pdate.substring(0, 2);
	var month1 = pdate.substring(3, 5);
	var year1 = pdate.substring(6, 10);

	var myDate = new Date(year, month - 1, date);
//	alert(myDate);
	var myDate1 = new Date(year1, month1 - 1, date1);
	var today = new Date();
	var  today_date = today.getDate();
	var today_mon = today.getMonth();
	var today_year = today.getFullYear();
	var todayDate =  new Date(today_year, today_mon , today_date)
//	alert("todayDate"+todayDate);
	var errMsg = "";

	var msg = "";
	

	if (opno == "") {

		errMsg = errMsg + "Opportunity Siebel Number cannot be Blank...<br/>"
		document.getElementById("oppno").style.borderColor = 'red';
		document.patreq.oppno.focus();
		returnValue = false;
	}
	else{
		
		document.getElementById("oppno").style.borderColor = '#ebe8e8';
	}

	if (country == "") {
		errMsg = errMsg + "Country Cannot be left Blank.</br>"
		document.getElementById("Country").style.borderColor = 'red';
		document.patreq.cntry.focus();
		returnValue = false;

	}
	else{
		
		document.getElementById("Country").style.borderColor = '#ebe8e8';
	}

	if (odesc == "") {

		errMsg = errMsg
				+ "Opportunity Description is blank.Please enter the details......<br/> "
				document.getElementById("Comment").style.borderColor = 'red';
				document.patreq.comment.focus();
		returnValue = false;

	}
	else{
		
		document.getElementById("Comment").style.borderColor = '#ebe8e8';
	}


	if (sector == "") {
		errMsg = errMsg + "Sector Cannot be left Blank.</br>"
		document.getElementById("Sctr").style.borderColor = 'red';
		document.patreq.sctr.focus();
		returnValue = false;

	}
	else{
		
		document.getElementById("Sctr").style.borderColor = '#ebe8e8';
	}
	
	
	if (geo == "") {
		errMsg = errMsg + "Geo Cannot be left Blank.</br>"
		document.getElementById("Geo").style.borderColor = 'red';
		document.patreq.geo.focus();
		returnValue = false;

	
	}
	else{
		
		document.getElementById("Geo").style.borderColor = '#ebe8e8';
	}
	
	if (psa == "") {
		errMsg = errMsg + "Service Area Cannot be left Blank.</br>"
		document.getElementById("Service").style.borderColor = 'red';
		document.patreq.psl.focus();
		returnValue = false;

	}
	else{
		
		document.getElementById("Service").style.borderColor = '#ebe8e8';
	}
	
	
	if (industry == "") {
		errMsg = errMsg + "Industry Cannot be left Blank.</br>"
		document.getElementById("Industry").style.borderColor = 'red';
		document.patreq.inds.focus();
		returnValue = false;

	}
	else{
		
		document.getElementById("Industry").style.borderColor = '#ebe8e8';
	}
	

	if (client == "") {
		errMsg = errMsg + "Client Cannot be left Blank.</br>"
		document.getElementById("clnt").style.borderColor = 'red';
		document.patreq.clntnm.focus();
		returnValue = false;

	}
	else{
		
		document.getElementById("clnt").style.borderColor = '#ebe8e8';
	}
	
	if (tcv != "" && isNaN(tcv)) {
		errMsg = errMsg + "TCV should be a number.</br>"
		document.getElementById("Total").style.borderColor = 'red';
		document.patreq.gbs.focus();
		returnValue = false;

	}
	else{
		
		document.getElementById("Total").style.borderColor = '#ebe8e8';
	}

	if (opname == "") {
		errMsg = errMsg + "Opportunity name Cannot be left Blank.</br>"
		document.getElementById("oname").style.borderColor = 'red';
		document.patreq.oppname.focus();
		returnValue = false;

	}
	else{
		
		document.getElementById("oname").style.borderColor = '#ebe8e8';
	}

/*	if (sector == "") {

		errMsg = errMsg + "Please select a sector. <br/> "

		returnValue = false;
	}*/


	if (reqdate == "") {
		errMsg = errMsg + "Request date cannot be left Blank.</br>"
		document.getElementById("demo1").style.borderColor = 'red';
		document.patreq.reqstdate.focus();
		returnValue = false;

	}
	
	else{
		
		document.getElementById("demo1").style.borderColor = '#ebe8e8';
	}
	
	if (duedate == "") {
		errMsg = errMsg + "Proposal due date cannot be left Blank.</br>"
		document.getElementById("demo6").style.borderColor = 'red';
		document.patreq.pdp.focus();
		returnValue = false;

	}
	else{
		
		document.getElementById("demo6").style.borderColor = '#ebe8e8';
	}

	
	if (pdate == "") {
		errMsg = errMsg + "Proposal due date to customer cannot be left Blank.</br>"
		document.getElementById("demo7").style.borderColor = 'red';
		document.patreq.pdp.focus();
		returnValue = false;

	}
	else{
		
		document.getElementById("demo7").style.borderColor = '#ebe8e8';
	}

/*	if (myDate > todayDate || myDate < todayDate) {
		errMsg = errMsg + " Request date should be todays date</br>"
		document.getElementById("demo1").style.borderColor = 'red';
		document.patreq.reqstdate.focus();
		returnValue = false;
	}
	else{
		
		document.getElementById("demo1").style.borderColor = '#ebe8e8';
	}*/

	/*if (myDate < todayDate) {
		errMsg = errMsg + " Request date should be todays date</br>"
		document.getElementById("demo1").style.borderColor = 'red';
		document.patreq.reqstdate.focus();
		returnValue = false;
	}

	*/
/*	if (myDate1 <= todayDate) {
		errMsg = errMsg + " Proposal date should be greater todays date</br>"
		document.getElementById("demo7").style.borderColor = 'red';
		document.patreq.pdc.focus();
		returnValue = false;
	}
	else{
		
		document.getElementById("demo7").style.borderColor = '#ebe8e8';
	}*/
	if(returnValue == false){
		
/*	    $('html, body').animate({
	        scrollTop: $("#PATFORM").offset().top
	    }, 2000);*/
	    $(".data-holder").slimScroll({ scrollTo: '0px' });

	}
	document.getElementById("ijk").innerHTML = errMsg;

	return returnValue;

}