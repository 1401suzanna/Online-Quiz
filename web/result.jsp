<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@page import="com.sun.org.apache.bcel.internal.generic.Select"%>
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
            	<div id="contact_form">
            	
                	
                	<form action="view.jsp">
                	<p>
                	<font style="color: navy;"><B>Your <%=request.getAttribute("total") %> questions are correct</B></font><BR/>
                	<input type="submit" value="view description">
                      
                	</p>
					</form>
				
				<%Integer countttt=(Integer)request.getAttribute("total"); %>	
  <form action="certificate.jsp" target='_blank'>
                             <br> <br><input type="submit" value="Get Certificate">
                        </form>
                  	
                     
                	</div>
               
                                       <%
                Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3305/quiz","root","root");    

             String queryText = "insert into studentdetails(cid,username,score) values(?,?,?);";
            PreparedStatement  pst = con.prepareStatement(queryText);
            
            pst.setString(1,(String)session.getAttribute("cid"));  
            pst.setString(2,(session.getAttribute( "username" ).toString())); 
             pst.setInt(3,countttt); 
            int i = pst.executeUpdate();   
                            
                            
                            %>
                
            
            
            </div>
            <!--end of left content-->


            

	<div id="footer">
    
    </div>


		</div> <!--end of center box-->
	</div> <!--end of main content-->
</div> <!--end of main container-->
</body></html>