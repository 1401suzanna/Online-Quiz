
<%@page import="java.awt.Dialog"%><jsp:include page="header.jsp"></jsp:include>

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
					 	if(request.getAttribute("counter")!=null){
                   Integer i=(Integer)request.getAttribute("counter");
                  		 if(i==10){
   								request.setAttribute("finished","quiz successfully submitted");
   								
   					%>
   				          <jsp:forward page="home.jsp"></jsp:forward>
   							          <% 
   							             
                   }}
                  %>
                 
                  
            	
                	<div id="contact_form">
               
                		<h2 style=" width:300px;margin:10px 0 5px 70px;">Enter the Questions here</h2>
                		                   		
                		   
                		<form method="post" action="saveques.jsp" >
					<table>
					<tr><td><span>Question:</span></td><td><textarea rows="3" cols="" name="question" class="contact_textarea" required></textarea></td></tr>
					<tr><td><span>Option1:</span></td><td><input type="text" name="option1" class="contact_input" required /></td></tr>	
					<tr><td><span>Option2:</span></td><td><input type="text" name="option2" class="contact_input" required/></td></tr>
					<tr><td><span>Option3:</span></td><td><input type="text" name="option3" class="contact_input" required/></td></tr>
					<tr><td><span>Option4:</span></td><td><input type="text" name="option4"  class="contact_input" required/></td></tr>
                                        <tr><td><span>Answer:</span></td><td>
                                                <select name="answer" class="select" required>
                                                    <option value="" disabled="disabled" selected="selected">--select answer--</option>
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                  </select>
                                           </td></tr>			
                    <tr><td></td><td><input type="submit" value="Next" style="width:75px;height:35px;margin-left:80px;background: #EF3B3A;color:white;"></td></tr>
                    </table>
                     </form>
                	</div>
              
                
                
                
	<div id="footer">
    
    </div>


		</div> <!--end of center box-->
	</div> <!--end of main content-->
</div> <!--end of main container-->
</body></html>

