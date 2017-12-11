/**
 * 
 */

function verifyPat()

{
	

	var returnValue = true;
	var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	var oppnumb = document.pback.txtoppno.value;
	var oppnam = document.pback.txtoppname.value;
	var sbmtr =  document.pback.txtsubmitter.value;
	var lnid =  document.pback.txtsubid.value;
	var sfed = document.pback.txtfdb.value;
	var snfed = document.pback.txtfdn.value;
	var errMsg = "";
	var errMsg1="";
	
	
	
	if (pback.txtoppno.value.length != 10) {
		errMsg = errMsg +"*Opportunity number should be of 10 characters...</br>";
		document.getElementById("oppnumb").style.borderColor = 'red';
		document.pback.txtoppno.focus();
		returnValue = false;
	}

	
	if (oppnumb !="")
	
	{
	
	if (!oppnumb.match(/^[a-zA-Z0-9-_]+$/)) {
		errMsg = errMsg + "*Opportunity Number should not have special characters..</br>";
		document.getElementById("oppnumb").style.borderColor = 'red';
		document.pback.txtoppno.focus();
		returnValue = false;
	}
	}

	if(oppnam=="" || oppnam==null)
		
		{
		errMsg = errMsg + "*Opportunity name should not be left blank...</br>";
		document.getElementById("oppnm").style.borderColor = 'red';
		document.pback.txtoppname.focus();
		returnValue = false;
		}
	
	
	if(sbmtr==""||sbmtr==null)
		
	{
	errMsg = errMsg + "*Submitter name should not be left blank...</br>";
	document.getElementById("submitr").style.borderColor = 'red';
	document.pback.txtsubmitter.focus();
	returnValue = false;
	}
	
	
	if(sbmtr!="")
		{
		
		if(!sbmtr.match(/^[a-zA-Z]+$/))
			{
			
			errMsg = errMsg + "*Submitter name should have only characters...</br>";
			document.getElementById("submitr").style.borderColor = 'red';
			document.pback.txtsubmitter.focus();
			returnValue = false;
			}
		
		
		}

	
	
	if(lnid==""||lnid==null)
		{
		
		errMsg = errMsg + "*LNID name should not be left blank...</br>";
		document.getElementById("sid").style.borderColor = 'red';
		document.pback.txtsubid.focus();
		returnValue = false;

		
		}
	
	if(lnid!="")
		
		
		{
		if (!filter.test(lnid))

		{
		errMsg = errMsg + "*LNID is not correct...</br>";
		document.getElementById("sid").style.borderColor = 'red';
		document.pback.txtsubid.focus();
		returnValue = false;
		}
		
		}
	
	
	
	
	
	if ( ( pback.txtslvl[0].checked == false ) && ( pback.txtslvl[1].checked == false )&& ( pback.txtslvl[2].checked == false )&& ( pback.txtslvl[3].checked == false )&& ( pback.txtslvl[4].checked == false ) ) 
	{
		errMsg1 = errMsg1+ "Please  enter the rating  for overall satisfaction level ..\n" ;
		
		returnValue = false; 
		} 		
	
	
	
	if ( ( pback.txtprop[0].checked == false ) && ( pback.txtprop[1].checked == false )&& ( pback.txtprop[2].checked == false )&& ( pback.txtprop[3].checked == false )&& ( pback.txtprop[4].checked == false ) ) 
	{
		errMsg1 = errMsg1+ "Please  enter  the rating for overall quality level of the documents ..\n" ;
		
		returnValue = false; 
		} 		
	
	
	if ( ( pback.txttime[0].checked == false ) && ( pback.txttime[1].checked == false )&& ( pback.txttime[2].checked == false )&& ( pback.txttime[3].checked == false )&& ( pback.txttime[4].checked == false ) ) 
	{
		errMsg1 = errMsg1+ "Please  enter the  rating for the submitted proposal on time \n" ;
		
		returnValue = false; 
		} 
	
	
	if ( ( pback.txtresp[0].checked == false ) && ( pback.txtresp[1].checked == false )&& ( pback.txtresp[2].checked == false )&& ( pback.txtresp[3].checked == false )&& ( pback.txtresp[4].checked == false ) ) 
	{
		errMsg1 = errMsg1+ "Please  enter the  rating  for the responsiveness of team \n" ;
		
		returnValue = false; 
		} 
	
	
	
	
	
	
	 if(sfed=="")
			
		{
		errMsg = errMsg+"*Please provide remarks that you liked most.</br>";
		document.getElementById("fdblk").style.borderColor = 'red';
		document.pback.txtfdb.focus();
		returnValue = false;
		
		}

    
    
    if(snfed=="")
			
		{
		errMsg = errMsg+"*Please provide remarks that you didn't like.</br>";
		document.getElementById("fdndl").style.borderColor = 'red';
		document.pback.txtfdn.focus();
		returnValue = false;
		
		}
	 
	document.getElementById("fed").innerHTML = errMsg;
	if(errMsg1!="")
	{
	 alert(errMsg1);
	}
	return returnValue;



}