<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>


<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<link rel="stylesheet" type="text/css" href="style.css">
    <link rel="stylesheet" type="text/css" href="menu.css">
        
</head><body>

  
<div id="main_container">
	<div class="main_content">
    	<div id="header">
      
        </div>
        
        <div class="center_box">
 <div class="middle_box">    
            
            </div>
    <div id='cssmenu'>
<ul>
   <li class='active'><a href="home.jsp"><span>Home</span></a></li>
   <li><a href='takequiz.jsp'><span>Take Quiz</span></a></li>
   <li><a href='makequiz.jsp'><span>Create Quiz</span></a></li>
   <li class='last'><a href='register.jsp'><span>Register</span></a></li>
</ul>
</div>
          
          
				
            
            
           
            
            <div class="left_content">
             <% 
					if(request.getAttribute("notlogin_msg")!=null){
					out.print("<font size='2' color='red' m>");
					out.print(request.getAttribute("notlogin_msg"));
					out.print("</font>");
					}
					%>
				<% 
					if(request.getAttribute("Error")!=null){
					out.print("<font size='2' color='red' m>");
					out.print(request.getAttribute("Error"));
					out.print("</font>");
					}
					
					
					%>
            	<div>
            	
                	<div>
                          <h1>Welcome to Our Site</h1>
                		 
                               
                                  
  		<form method="post" action="loginprocess.jsp" class="login-form" >
                                    <div class="form">
    <h2>Login to your account</h2>
   
  </div>
                   
					<table>
					
					<tr><td><span>Category:</span></td><td><select name="category" class="select" placeholder="Select Category" >
					<option>Teacher</option>
					<option>Student</option>
					</select>
					</td></tr>
                                            <tr><td><span>User Name:</span></td><td><input type="text" name="username" placeholder="username" class="input" /></td></tr>
								
                                            <tr><td><span>Password:<span></td><td><input type="password" name="userpass" placeholder="password" class="input"/></td></tr>	
						
					<tr><td></td><td><input type="submit" value="Sign in" id="button"/> <p class="message">Not registered?<a href="register.jsp" class="a">Register</a></td></tr>
					</table>
                    
                     </form>

 </div>
                </div>
                
            </div>

            <div class="right_content">
            
                <img src="images/onlineCap.jpg" class="right">
               
            
            </div><!--end of right content-->


	<div id="footer">
    
    </div>


		</div> <!--end of center box-->
	</div> <!--end of main content-->
</div> <!--end of main container-->
</body></html>