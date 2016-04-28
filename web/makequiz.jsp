<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
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

<head>
<script>
var request;
function sendInfo()
{
var v=document.myform.subject.value;
var url="findname4.jsp?val="+v;
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
</head>


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
					if(session.getAttribute("category")!=null){
					String category=(String)session.getAttribute("category");
					if(category.equals("Student")){
					request.setAttribute("category","You are not a Teacher,You can't make Quiz");
					%>
					<jsp:forward page="home.jsp"></jsp:forward>
					<% 
					}
					
					}
					
					
					%>
            	<div id="welcome_form">
               
                		<h1 style=" width:300px;margin:0 0 5px 70px;"><img src="images/welcome.png" alt="" title=""></h1>
                		                   		<marquee direction="left" style="color: navy; font-size:15px;" onmouseover="stop()" onmouseout="start()"><B>*****Create a Quiz*****</B></marquee>
                		   
                		<form method="post" action="createquiz.jsp" name="myform">
                                    <div id="location"></div>
                                     <br>
                                    <div class="form_row">
                                        <label style=" margin-right:15px;width:150px;float:left;color:black;font-size: 15px;
text-align:right;">Subject:</label><input type="text" onkeyup="sendInfo()" name="subject" required class="contact_input" required>
                      <input type="submit" value="Create" class="button">
                                    </div> 
					
                                       		
                 
                     
                     </form>


                    
                	</div>
         
                <div id="welcome_img">
                                            <img src="images/t.jpe" alt="" title="">
                                        </div>
                
            
            
          
            <!--end of left content-->




	<div id="footer">
    
    </div>


		</div> <!--end of center box-->
	</div> <!--end of main content-->
</div> <!--end of main container-->
</body></html>

