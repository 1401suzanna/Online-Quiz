<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<html>
    <body>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<link rel="stylesheet" type="text/css" href="style.css">
    <link rel="stylesheet" type="text/css" href="menu.css">
        
</head>
<jsp:include page="header.jsp"></jsp:include>

<%
String islogin=(String)session.getAttribute("islogin");
if(islogin==null){
request.setAttribute("notlogin_msg","Sorry,Please do Login first");

%>
<jsp:forward page="index.jsp"></jsp:forward>
<%
}
%>




             <% 
					if(request.getAttribute("notlogin_msg")!=null){
					out.print("<font size='2' color='red' m>");
					out.print(request.getAttribute("notlogin_msg"));
					out.print("</font>");
					}
					%>
				<% 
					if(request.getAttribute("Error")!=null){
					out.print("<font size='2' color='red' >");
					out.print(request.getAttribute("Error"));
					out.print("</font>");
					}
					%>
					<%
					if(request.getAttribute("finished")!=null){
					   out.print("<font size='2' color='navy'>");
                   out.print("<B>");
					out.print(request.getAttribute("finished"));
					  out.print("<B>");
   						out.print("</font>");
					}
				if(request.getAttribute("category")!=null){
					out.print("<font size='2' color='red' m>");
					out.print(request.getAttribute("category"));
					out.print("</font>");
					}
				
					%>
            	<div class="Welcome">
            	
                	<div class="welcome_content">
               
                		<h1>Welcome to Our Site</h1>
                		    <marquee direction="left" style="color: navy; font-size:15px;" onmouseover="stop()" onmouseout="start() "><B>Assess Yourself by taking quizs on various subjects</B></marquee>
                                    <p class="w">
                	<br>Now Teacher and Student can work together online. Tutors are most welcomed to our site and 
                	they can create Quiz by simply clicking "Create Quiz" link in the Menu.
                        Students can appear in quiz based on various subject. To answer a quiz click "Take Quiz" link.
                        
                       
                	</p>
			
                	</div>
                </div>
                
                
            
            
           
            <!--end of left content-->

<!--end of right content-->


	<div id="footer">
    
    </div>


		</div> <!--end of center box-->
	</div> <!--end of main content-->
</div> <!--end of main container-->
</body></html>

