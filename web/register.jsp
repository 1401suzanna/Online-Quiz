<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Registration Form</title>
<link rel="stylesheet" type="text/css" href="style.css">
    <link rel="stylesheet" type="text/css" href="menu.css">
<script>
var request;
function sendInfo()
{
var v=document.myform.username.value;
var url="findname.jsp?val="+v;
if(window.XMLHttpRequest){
request=new XMLHttpRequest();
}
else if(window.ActiveXObject){
request=new ActiveXObject("Microsoft.XMLHTTP");
}
try
{
request.onreadystatechange=getInfo;
request.open("GET",url,true);
request.send();
}
catch(e){alert("Unable to connect to server");}
}

function getInfo(){
if(request.readyState==4){
var val=request.responseText;
document.getElementById('location').innerHTML=val;
}
}
</script>
</head><body>
  
<div id="main_container">
	<div class="main_content">
    	<div id="header">
      
        </div>
        <div class="top_center_box"></div>
        <div class="center_box">

    
  
          
            
            <div class="middle_box">            
            
            </div>
                       <div id='cssmenu'>
<ul>
   <li class='active'><a href="home.jsp"><span>Home</span></a></li>
   <li><a href='#'><span>Take Quiz</span></a></li>
   <li><a href='#'><span>Create Quiz</span></a></li>
   <li class='last'><a href='register.jsp'><span>Register</span></a></li>
</ul>
</div>
            
            
            <div class="left_content">
            
            	<div class="calendar_box">
            	
                	<div class="calendar_box_content1">
                	
                		<h1>Welcome to my Site</h1>
                		   <p><div id="location"></div>
                                       	<form method="post" action="registerprocess.jsp" name="myform" class="login-form" >
                                    <div class="form">
                                           <h2>Register</h2>
   
                                    </div>
                   
					<table>
					
					      <tr><td><span>Name:</span></td><td><input type="text" name="name"  placeholder="name" class="input" /></td></tr>
                                            <tr><td><span>User Name:</span></td><td><input type="text" name="username" onkeyup="sendInfo()" placeholder="username" class="input" /></td></tr>
								
                                            <tr><td><span>Password:<span></td><td><input type="password" name="userpass" placeholder="password" class="input"/></td></tr>	
						<tr><td><span>Category:</span></td><td><select name="category" class="select" placeholder="Select Category" >
					<option>Teacher</option>
					<option>Student</option>
					</select>
					</td></tr>
                                                            </td></tr>
                                                            <tr><td><span>Email:</span></td><td><input type="text" name="email" placeholder="Email" class="input"/></td></tr>
					<tr><td></td><td><input type="submit" value="Register" id="button"/></td></tr>
					</table>
                    
                     </form>
                     </form>


                        </p>
                	</div>
                </div>
                
             <div class="news_left">
                                
                    
                    
                    
                
                </div>
            
            
            </div>
            <!--end of left content-->


            <div class="right_content">
            
         
               <img src="images/onlineCap.jpg" class="right"> 
                   
            
            </div><!--end of right content-->


	<div id="footer">
    
    </div>


		</div> <!--end of center box-->
	</div> <!--end of main content-->
</div> <!--end of main container-->
</body></html>