<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=0" />
<meta http-equiv="Content-Type" content="text/html;charset=windows-1252">

<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<title>Request Proposal Development</title>


<link rel="stylesheet" href="css/cssout171c.css">
<link rel="stylesheet" href="css/design.css">

</head>
<body>
<div dir="ltr" id="div_172c_0">
</div>
<div id="container">
<div id="left">
<div>
    <center> <img src="images/image.png" style="width:148px;height:148px;margin:50px 0px;"> </center>
</div>

    <div style="height: 30px">
    <tr height="20">
        <td style="padding: 8px 0px 8px 0px; font-size: 14px; text-align: center; width: 490px;">
            <center><span style="text-decoration:none; color: #FFFFFF; font-family:Calibri, sans-serif; mso-font-charset:0">WIKI</span>
        </td>   </center>
    </tr>
    </div>

    <div style="height: 30px">
    <tr height="20">
        <td style="padding: 8px 0px 8px 0px; font-size: 14px; text-align: center; width: 490px;">
            <center><span style="text-decoration:none; color: #FFFFFF; font-family:Calibri, sans-serif; mso-font-charset:0">KH Knowledge Management Team</span>
        </td>   </center>
    </tr>
    </div>

    <div style="height: 30px">
    <tr height="20">
        <td style="padding: 8px 0px 8px 0px; font-size: 14px; text-align: center; width: 490px;">
            <center><span style="text-decoration:none; color: #FFFFFF; font-family:Calibri, sans-serif; mso-font-charset:0">KH Proposal Assistance Team</span>
        </td>   </center>
    </tr>
    </div>

    <div style="height: 30px">
    <tr height="20">
        <td style="padding: 8px 0px 8px 0px; font-size: 14px; text-align: center; width: 490px;">
            <center><span style="text-decoration:none; color: #FFFFFF; font-family:Calibri, sans-serif; mso-font-charset:0">KH Content List</span>
        </td>   </center>
    </tr>
    </div>

    <div style="height: 30px">
    <tr height="20">
        <td style="padding: 8px 0px 8px 0px; font-size: 14px; text-align: center; width: 490px;">
            <center><span style="text-decoration:none; color: #FFFFFF; font-family:Calibri, sans-serif; mso-font-charset:0">KH Competitive Insights Team (CIT)</span>
        </td>   </center>
    </tr>
    </div>

    <div style="height: 30px">
    <tr height="20">
        <td style="padding: 8px 0px 8px 0px; font-size: 14px; text-align: center; width: 490px;">
            <center><span style="text-decoration:none; color: #FFFFFF; font-family:Calibri, sans-serif; mso-font-charset:0">KH Market Insights</span>
        </td>   </center>
    </tr>
    </div>

    <div style="height: 30px">
    <tr height="20">
        <td style="padding: 8px 0px 8px 0px; font-size: 14px; text-align: center; width: 490px;">
            <center><span style="text-decoration:none; color: #FFFFFF; font-family:Calibri, sans-serif; mso-font-charset:0">KH Competitor Insights</span>
        </td>   </center>
    </tr>
    </div>

    <div style="height: 30px">
    <tr height="20">
        <td style="padding: 8px 0px 8px 0px; font-size: 14px; text-align: center; width: 490px;">
            <center><span style="text-decoration:none; color: #FFFFFF; font-family:Calibri, sans-serif; mso-font-charset:0">KH Capabilities, Citations, Case Studies</span>
        </td>   </center>
    </tr>
    </div>

    <div style="height: 30px">
    <tr height="20">
        <td style="padding: 8px 0px 8px 0px; font-size: 14px; text-align: center; width: 490px;">
            <center><span style="text-decoration:none; color: #FFFFFF; font-family:Calibri, sans-serif; mso-font-charset:0">KH Rate Cards</span>
        </td>   </center>
    </tr>
    </div>

    <div style="height: 30px">
    <tr height="20">
        <td style="padding: 8px 0px 8px 0px; font-size: 14px; text-align: center; width: 490px;">
            <center><span style="text-decoration:none; color: #FFFFFF; font-family:Calibri, sans-serif; mso-font-charset:0">KH Proposals</span>
        </td>   </center>
    </tr>
    </div>



</div>

<div id="secondDiv"></div>
<div id="centre">
<div id="banner"><img id="banner_img" src="images/kH-banner.png" alt="" /></div>
 <div id="welcome">Welcome to GBS Knowledge Hub</div> 
  <section class="container">
    <div class="login">
      <h1>Login </h1>
      <form method="post" action="validate">
        <p><input id=icon2 type="text" name="login" value="" placeholder="Username or Email">
        <p><input id=icon type="password" name="password" value="" placeholder="Password"></p>
        <p class="remember_me">
          <label>
            <input type="checkbox" name="remember_me" id="remember_me">
            Remember me on this computer
          </label>
        </p>
        <p class="submit"><input type="submit" name="commit" value="Login"></p>
      </form>
    </div>

    <div class="login-help">
      <p>Forgot your password? <a href="">Click here to reset it</a>.</p>
      
      <%
    if(null!=request.getAttribute("errorMessage"))
    {
        out.println(request.getAttribute("errorMessage"));
    }
%>
    </div>

  </section>


</div>
</div>
</body>
</html>