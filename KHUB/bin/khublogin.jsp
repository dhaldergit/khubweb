<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="viewport" content="initial-scale=1,user-scalable=no,maximum-scale=1">
                <meta http-equiv="Set-Cookie" content="PD-W3ID-REFERER=https://khubdevsso-c8zmu3pv7u-cq17.iam.ibmcloud.com/idaas/oidc/endpoint/default/authorize?response_type=code&client_id=MPu7IcRoSg&state=001508730689267BuI6OCg6E&redirect_uri=https%3A%2F%2Fkhub2test.mybluemix.net%3A443%2Foidcclient%2Fredirect%2FMPu7IcRoSg&scope=openid; path=/; secure" />
                <link rel="stylesheet" type="text/css" href="https://w3id.alpha.sso.ibm.com:443/static/css/bundle.s8.css">
                    <title>IBM w3id</title>
                    <STYLE TYPE="text/css">
                        .hidden{font-weight:700;position:absolute;left:-10000px;top:auto;width:1px;height:1px;overflow:hidden}
                        .visible{font-weight:700;position:static;width:auto;height:auto}
                        </STYLE>
                    <script src="https://w3id.alpha.sso.ibm.com:443/static/js/jquery-2.1.4.min.js" type="text/javascript"></script>
                    <script src="https://w3id.alpha.sso.ibm.com:443/static/js/highContrast.js" type="text/javascript"></script>
                    <script src="https://w3id.alpha.sso.ibm.com:443/static/js/rp/management/login.s8.js" type="text/javascript"></script>
                    <style id="antiClickjack">body{display:none !important;}</style>
                    <SCRIPT type="text/javascript">
                    if (self === top) {
                       var antiClickjack = document.getElementById("antiClickjack");
                       antiClickjack.parentNode.removeChild(antiClickjack);
                    } else {
                       top.location = self.location;
                    }

                    var submitting = false;
                        
                    function checkForm(form)
                    {
                        if(form.username.value != "") {
                            replaceButtonText("btn_signin", "Authenticating...");
                            return true;
                        }  else {
                            form.desktop.focus();
                            return false;
                        }
                    }
                    function replaceButtonText(buttonId, text)
                    {
                        if (document.getElementById)
                        {
                            var button=document.getElementById(buttonId);
                            
                            if (button.childNodes[0])
                            {
                                button.childNodes[0].nodeValue=text;
                            }
                            else if (button.value)
                            {
                                button.value=text;
                            }
                        }
                    }
                    function windowStart() {
                        displayError("");
                        getRememberMeCookie();
                        setInputBox();
                        setContrast();
                    }
                    $(document).ready(function() {
			 var host = location.hostname;
                         if ( host.indexOf("w3id-test.sso") >= 0 ) {  
                            w3id_header = '<span style="font-size:30px">Sign in with your test <span class="name">w3<b>id</b></span>';
                            $("#w3idheader").html(w3id_header);
                            w3id_link = '<a href="https://c25a0847.toronto.ca.ibm.com/password/createpwd_lookup_otp.wss">Forgot password? (Requires access to the IBM network)</a>';
			    $("#w3idlink").html(w3id_link);
                         }
                                      $("#btn_signin").click(function() {
                                                             var a, b;
                                                             b = document.getElementById("chkbox_w3rememberme");
                                                             a = document.getElementsByName("username");
                                                             a = a[0].value ? a[0].value : a[1].value;
                                                             b.checked ? createCookie("w3idRM", a) : readCookie("w3idRM") && eraseCookie("w3idRM");
                                                             });
                                      });
                                      window.onload = windowStart;
                        </SCRIPT>
                    </head>
    <body id="body">
        <div class="wrapper">
            <!-- header -->
            <div id="header">
                <div class="inner">
                    <div id="logo"></div>
                </div>
            </div>
            <!-- /header -->
            
            <div class="inner">
                <div class="container">
                    <div class="signin">
                        <div class="icon"></div>
                        <h1 id="w3idheader">Sign in with your <span class="name">w3<b>id</b></span></h1>
                        <div class="hidden error" id="errorDiv" > </div>
                        <!--- BEGIN Cookie check block --->
                        <!---
                        DO NOT TRANSLATE anything inside the SCRIPT tag except the quoted
                        string warningString and the first line of the JavaScript redirection
                        instruction beginning with "// Uncomment the following ..."
                        
                        i.e.	var warningString = "Translate this string";
                        --->
                        <SCRIPT LANGUAGE=JavaScript>
                        var warningString = "<B>WARNING:</B> To maintain your login session, make sure that your browser is configured to accept Cookies.";
                        document.cookie = 'acceptsCookies=yes';
                        if(document.cookie == ''){
                        document.write(warningString);
                        }
                        else{
                        document.cookie = 'acceptsCookies=yes; expires=Fri, 13-Apr-1970 00:00:00 GMT';
                        // Uncomment the following line for JavaScript redirection
                        // document.cookie = 'ISAMOriginalURL=' + encodeURIComponent(window.location) + "; Path=/;";
                        }
                        </SCRIPT>
                        <NOSCRIPT>
                            <p><B>WARNING:</B> To maintain your login session, make sure that<BR>
                            your browser is configured to accept Cookies.</p>
                        </NOSCRIPT>
                        <div class="hidden error" id="errorDiv" > </div>
                        <!--- END Cookie check block --->
                        <form method="post" onsubmit="
                            // added by rkhanna@us.ibm.com on June 28, 2016
                            if(submitting) {
                            btn_signin.disabled = true;
                            return false;
                            }
                            if(checkForm(this)) {
                            submitting = true;
                            return true;
                            }
                            return false;
                            " action="/pkmslogin.form?token=Unknown">
                            <input type="hidden" name="login-form-type" value="pwd"/>
                            <input id="desktop" type="email" class="desktop" name="username" aria-label="Your IBM email address (e.g. jdoe@us.ibm.com)" placeholder="Your IBM email address (e.g. jdoe@us.ibm.com)"/>
                            <input id="mobile" type="email" class="mobile"  name="username" placeholder="jdoe@us.ibm.com"/>
                            <input aria-label="password" type="password" name="password" placeholder="Password"/>
                            <input id="chkbox_w3rememberme" class="css-checkbox" type="checkbox"/><label name="checkbox1_lbl" class="css-label blue-check" for="chkbox_w3rememberme">&nbsp;Remember my email address</label>
                            <div class="forgot"><a id="w3idlink" href="https://w3idprofile.sso.ibm.com/password/createpwd_lookup_otp.wss">Forgot password?</a>
                            </div>
                            <button id="btn_signin" class="btn_signin" type="submit">Sign In</button>
                        </form>
                    </div>
                </div>
            </div>
            <div class="push"></div>
        </div>
        <!-- footer -->
        <div id="footer">
            <div class="inner">
                <div id="logo"></div>
            </div>
        </div>
        <!-- /footer -->
    </body>
</html>
