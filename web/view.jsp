<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<html>


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
            
                		
				<%
				String name=(String)session.getAttribute("cid");
				try{
					Class.forName("com.mysql.jdbc.Driver");
					Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3305/quiz","root","root");

					PreparedStatement ps= con.prepareStatement("select * from quizques where cid='"+name+"'");
					ResultSet rs=ps.executeQuery();
					out.print("<table style='background: white; width:200%'>");
					while(rs.next()){
					out.print("<tr><td>Question:</td><td>"+rs.getString(3)+"</td></tr>");
					out.print("<tr><td>Answer:</td><td>"+rs.getString(8)+"</td></tr>");
					//<!--out.print("<tr><td>Description:</td><td>"+rs.getString(9)+"</td></tr>");-->
					out.print("<tr><td>-------</td></tr>");
					}
					out.print("</table>");
					
				}catch(Exception e){e.printStackTrace();}
				 %>					


                     
                	</div>
             
                
                
            <!--end of left content-->


          
            
         
                

	<div id="footer">
    
    </div>


		</div> <!--end of center box-->
	</div> <!--end of main content-->
</div> <!--end of main container-->
</body></html>

