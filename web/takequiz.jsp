<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="org.omg.CORBA.PUBLIC_MEMBER"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>

<html>
<head>
<script>
var request;
function sendInfo()
{
var v=document.myform.subject.value;
var url="findname2.jsp?val="+v;
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
function viewAll(name)
{
var v=name;
var url="findname3.jsp?val="+v;

if(window.XMLHttpRequest){
request=new XMLHttpRequest();
}
else if(window.ActiveXObject){
request=new ActiveXObject("Microsoft.XMLHTTP");
}
try
{
request.onreadystatechange=viewInfo;
request.open("GET",url,true);
request.send();
}
catch(e){alert("Unable to connect to server");}
}

function viewInfo(){
if(request.readyState==4){
var val=request.responseText;
document.getElementById('location').innerHTML=val;
}
}


</script>
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
				
					%>
            	
            	
                	<div id="welcome_form">
               
                		<h1 style=" width:300px;margin:0 0 5px 70px;"><img src="images/welcome.png" alt="" title=""></h1>
                		        <marquee direction="left" style="color: navy; font-size:15px;" onmouseover="stop()" onmouseout="start() "><B>Assess Yourself by taking quizs on various subjects</B></marquee>
                		   
                		<form method="post" name="myform" action="get.jsp">
					
                                    Select the subject:<input type="text" name="subject" onkeyup="sendInfo()"/>
                                    <%
    try{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3305/quiz","root","root");

PreparedStatement prs= con.prepareStatement("select distinct COURSENAME from course");
ResultSet rs= prs.executeQuery();

out.print("<table border='3' cellspacing=3 cellpadding=2 id='myTable'>");
out.print("<tr><td><B>Subject</B></td>");
while(rs.next()){
out.print("<tr>");
out.print("<td>"+rs.getString(1)+"</td>");
out.print("</tr>");
}
out.print("</table>");
con.close();

%>
<%
//**Should I input the codes here?**
        con.close();}
        catch(Exception e)
        {
             out.println("wrong entry"+e);
        }
%>

					<div id="location" ></div>
                     
                                </form>


                     
                	</div>
                                        <div id="welcome_img">
                                            <img src="images/w.gif" alt="" title="" class="right">
                                        </div>
                
              
            
            
           


            

	<div id="footer">
    
    </div>


		</div> <!--end of center box-->
	</div> <!--end of main content-->
</div> <!--end of main container-->
</body></html>

