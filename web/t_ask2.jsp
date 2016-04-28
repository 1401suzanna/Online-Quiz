<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="org.omg.CORBA.PUBLIC_MEMBER"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>

<html>
<head>
<script>
var request;


function getInfo(){
if(request.readyState==4){
var val=request.responseText;
document.getElementById('location').innerHTML=val;
}
}
function viewAll(name)
{
var v=name;
var url="findname5.jsp?val="+v;


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
               
                		<h1 style=" width:300px;margin:0 0 5px 70px;">View FEEDBACK</h1>
                		        
                		<form method="post" name="myform" action="t_ask.jsp">
					
                                    choose a query to reply:
                                    <%
    try{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3305/quiz","root","root");
String username=(String)session.getAttribute("username");
PreparedStatement ps=con.prepareStatement("select course.cid,coursename,feedback.username,query,reply from course  join feedback where course.cid=feedback.cid and course.username=?");
ps.setString(1,username);
//ps.setString(1,n);
out.print("<br>");
ResultSet rs=ps.executeQuery();

out.print("<table style='background: linear-gradient( #ffe6e6, #ffffff);width:200%' border='3' cellspacing=3 cellpadding=2 id='myTable'>");
out.print("<tr><td><B> id</B></td><td><B>course</B></td><td><B>Username</B></td></td><td><B>query</B></td><td><B>reply</B></td></tr>");
while(rs.next()){
 out.print("<tr>");   
out.print("<td>"+rs.getString(1)+"</td>");
out.print("<td>"+rs.getString(2)+"</td>");
out.print("<td>"+rs.getString(3)+"</td>");
out.print("<td ><a href='#' name='"+rs.getString(4)+"' onclick='javascript:viewAll(this.name)'>"+rs.getString(4)+"</a></td>");
out.print("<td >"+rs.getString(5)+"</td>");
out.print("</tr>");
}
out.print("</table>");
con.close();
}catch(Exception e){e.printStackTrace();}
%>

					<div id="location" ></div>
                     
                                </form>


                     
                	</div>
                                        
                
              
            
            
           


            

	<div id="footer">
    
    </div>


		</div> <!--end of center box-->
	</div> <!--end of main content-->
</div> <!--end of main container-->
</body></html>

