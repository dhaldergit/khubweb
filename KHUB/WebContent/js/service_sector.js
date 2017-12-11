/**
 * 
 */


function  validatesectorForm()


{
var returnValue = true;
var sctr = document.regs.txtfcsarea.value;
var indus = document.regs.inds.value;
var odesc = document.regs.txtrltion.value;
var opno = document.regs.txtOppNo.value;
var errMsg = "";
var msg="";




if(sctr =='Public')
	
	{
	
	
	 if(indus  !='Government' &&  indus != 'Healthcare')
	{
		 errMsg = errMsg + "Industry & Sector combination is not valid..  Please select either 'Government' or 'Healthcare' <br/>"
		returnValue = false;
	}
	 
	}

if(sctr =='Industrial')
	{
	
	if(indus !='Aerospace and Defence' && indus != 'Automotive' && indus !='Chemicals and Petrolium' && indus!='Electronics' && indus!='Industrial Products')
	
		{
		errMsg = errMsg +"Industry & Sector combination is not valid..Please select either 'Aerospace and Defence' or 'Automotive' or 'Chemicals and Petrolium' or'Electronics' or 'Industrial Products'<br/>"
		returnValue = false;
		}
	}

if(sctr =='Distribution')
{

if(indus !='Consumer Products' && indus != 'Life Sciences' && indus !='Retail' && indus!='Travel and Transportation')

	{
	errMsg = errMsg +"Industry & Sector combination is not valid.. Please select 'Consumer Products'  or 'Life Sciences'or'Retail'or 'Travel and Transportation'  <br/> "
	returnValue = false;
	}
}







if(sctr =='Financial Services')
{

if(indus !='Banking and Financial Markets' && indus != 'Insurance')

	{
	errMsg = errMsg +"Industry & Sector combination is not valid..Please select 'Banking and Financial Markets'  or 'Insurance'<br/>"
	returnValue = false;
	}
}




if(sctr =='Communications')
{

if(indus !='Telecommunications' && indus != 'Energy and Utility' && indus !='Media and Entertainment' && indus!='Education')

	{
	errMsg = errMsg +"Industry & Sector combination is not valid..Please select 'Telecommunications' or 'Energy and Utility' or'Media and Entertainment'or'Education' <br/>"
	
	returnValue = false;
	}





}



if(odesc=="")
	{
	
errMsg = errMsg +"Opportunity Description is blank ..please enter the description..<br/>"
	
	returnValue = false;
	
	}


if(opno=="")
	{
	
errMsg = errMsg +"Opportunity Siebel Number cannot be Blank...<br/>"
	
	returnValue = false;
	}


if(errMsg!="")
{
document.getElementById("ijk").innerHTML = errMsg;

}


return returnValue ;




}