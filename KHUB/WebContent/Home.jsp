<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<body>
                <div id="redirect">
                        <h2><align='center'>Please Wait your Page is loading</align> </h2>
                        
                        <img src='images/spinner.gif' align ="middle"  padding="5px5px4px5px" style='width: 20px; height: 20px;'>
                </div>

                <script src="js/jquery-1.11.1.js"></script>
                <script>

                        // JavaScript code to redirect a URL
                        //window.location.replace("https://account.box.com/api/oauth2/authorize?response_type=code&client_id=873jlyl0g66qbtx6qho4ec5t2q3f2q5h&state=1234");
                      
                      
                        //JQuery code to redirect a page or URL
                        $(document).ready(function(){
                            <%
                            //if ( String.valueOf(request.getSession().getServletContext().getAttribute("AccessToken")).isEmpty() || request.getSession().getServletContext().getAttribute("AccessToken")==null )
                            
                            if ( String.valueOf(application.getInitParameter("AccessToken")).isEmpty() || application.getInitParameter("AccessToken")==null )
                            { %>
                            	url = "https://account.box.com/api/oauth2/authorize?response_type=code&client_id=873jlyl0g66qbtx6qho4ec5t2q3f2q5h&state=1234";                        	
                        	<% } else { %>
                        		url = "http://localhost:8080/KHUB/Box.jsp";
                        	<% } %>
                        	
                        	window.location.replace(url);
                            //$(location).attr('href',url);
                        });
                </script>
        </body>
