/**
 * 
 */


function verifyFeedback()
{
	

	var returnValue = true;
	var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	var uname = document.fedb.txtname.value;
	var len = 3;
	var ltus = document.fedb.notes.value;
	var spfed = document.fedb.txtspfed.value;
	var smfed = document.fedb.txtsomfed.value;
	var errMsg = "";
	var errMsg1="";
	


		if(uname=="" || uname.length<len  )
	{
		errMsg = errMsg+ "Name need to be entered with atleast of 3 characters.</br>"
		document.getElementById("uname").style.borderColor = 'red';
		document.fedb.txtname.focus();
		returnValue = false;	



	}

		
		if(ltus=="" || ltus.length<7)
		
		{
			errMsg = errMsg+ "lotus id need to be entered correctly</br>"
			document.getElementById("notes").style.borderColor = 'red';
			document.fedb.notes.focus();
			returnValue = false;	



		}
		
		
		if(ltus!="")
			{
			
			if (!filter.test(ltus))
			{
				errMsg = errMsg+"Please Enter correct notes id.</br>";
				document.getElementById("notes").style.borderColor = 'red';
				document.fedb.notes.focus();
				returnValue = false;

			}
			}

		
		
		
		
		
		if ( ( fedb.txtsat[0].checked == false ) && ( fedb.txtsat[1].checked == false )&& ( fedb.txtsat[2].checked == false )&& ( fedb.txtsat[3].checked == false )&& ( fedb.txtsat[4].checked == false ) ) 
		{
			errMsg1 = errMsg1+ "Please  enter the  satisfaction level ..\n" ;
			
			returnValue = false; 
			} 		
		
		
		
		if ( ( fedb.txtrado[0].checked == false ) && ( fedb.txtrado[1].checked == false )&& ( fedb.txtrado[2].checked == false )&& ( fedb.txtrado[3].checked == false )&& ( fedb.txtrado[4].checked == false ) ) 
		{
			errMsg1 = errMsg1+ "Please  enter the  rating level ..\n" ;
			
			returnValue = false; 
			} 		
		
		
		if ( ( fedb.txtnav[0].checked == false ) && ( fedb.txtnav[1].checked == false )&& ( fedb.txtnav[2].checked == false )&& ( fedb.txtnav[3].checked == false )&& ( fedb.txtnav[4].checked == false ) ) 
		{
			errMsg1 = errMsg1+ "Please  enter the  rating level for the navigation level \n" ;
			
			returnValue = false; 
			} 
		
		
		if ( ( fedb.txtlk[0].checked == false ) && ( fedb.txtlk[1].checked == false )&& ( fedb.txtlk[2].checked == false )&& ( fedb.txtlk[3].checked == false )&& ( fedb.txtlk[4].checked == false ) ) 
		{
			errMsg1 = errMsg1+ "Please  enter the  rating level for the look & feel level \n" ;
			
			returnValue = false; 
			} 
		
		
		
		if ( ( fedb.txtradon[0].checked == false ) && ( fedb.txtradon[1].checked == false )&& ( fedb.txtradon[2].checked == false )&& ( fedb.txtradon[3].checked == false )&& ( fedb.txtradon[4].checked == false ) ) 
		{
			errMsg1 = errMsg1+ "Please  enter the  rating  for visiting KHUB" ;
			
			returnValue = false; 
			} 	
		
		
       
       
      
       if(spfed=="")
			
		{
		errMsg = errMsg+"Please provide remarks that you liked most.</br>";
		document.getElementById("idsp").style.borderColor = 'red';
		document.fedb.txtspfed.focus();
		returnValue = false;
		
		}

       
       
       if(smfed=="")
			
		{
		errMsg = errMsg+"Please provide remarks that you didn't like.</br>";
		document.getElementById("idsomfed").style.borderColor = 'red';
		document.fedb.txtsomfed.focus();
		returnValue = false;
		
		}

	document.getElementById("feed").innerHTML = errMsg;
	if(errMsg1!="")
		{
		 alert(errMsg1);
		}
	return returnValue;




}