/**
 * 
 */


var flag = 0;


function focus()
{
    fcs=regs.txtfcsarea.value;
    if(fcs=="")
    {
        document.getElementById("fcs").innerHTML="Enter Focus area";
        flag=1;
    }
}


function location()
{
    loc=regs.txtloc.value;
    if(loc=="")
    {
        document.getElementById("loc").innerHTML="Enter location ";
        flag=1;
    }
}


function validateForm(form)
{
    flag=0;
    location();
    focus();
    if(flag==1)
        return false;
    else
        return true;
}