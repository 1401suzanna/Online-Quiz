
<%@page import=" java.util.Date" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<html>
    



    		
				<%
				String name=(String)session.getAttribute("cid");
                                String usr=(String)session.getAttribute("username");
                                String total=(String)session.getAttribute("total");
				
					Class.forName("com.mysql.jdbc.Driver");
					Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3305/quiz","root","root");

					PreparedStatement ps= con.prepareStatement("select NAME from quizregister where username='"+usr+"'");
					ResultSet rs=ps.executeQuery();
                                        
                                        PreparedStatement ps2= con.prepareStatement("select score from studentdetails where username='"+usr+"'");
					ResultSet rs2=ps2.executeQuery();
                                        
                                        PreparedStatement ps1= con.prepareStatement("select COURSENAME from course where CID='"+name+"'");
					ResultSet rs1=ps1.executeQuery();
                                        
					out.print("<table style='background: white; width:200%'>");
					%>
					
					

<div id="cert" style='margin:0 auto;width:800px; height:600px; padding:20px; text-align:center; border: 20px solid transparent; align:center;background: url(images/cert1.png) no-repeat'>
    <br><img src="images/st.png" style="position:relative;top:0px; right:30px;width:90px;height:80px; ">
  <span style='font-family:"Kunstler Script" ,serif;font-size:80px; font-weight:bold'>Certificate of Completion</span>
  <br><br><br>
        <span style='font-size:25px'><i>This is to certify that</i></span>
         <br><br>
         <span style='font-size:35px;font-family:"Kunstler Script" ,serif;' ><b>Miss/Master  
           <% while(rs.next())
            {
            out.print(rs.getString(1));
            } %>
            </b></span><br/><br/>
        <span style='font-size:25px'><i>has completed the course 
            </i></span> <br/><br/>
         <span style='font-size:30px'> <% while(rs1.next())
            {
            out.print(rs1.getString(1));
            } %>
         </span> 
        <span style='font-size:20px'>with score of <b> 
            <% while(rs2.next())
            {
            out.print(rs2.getString(1));
            } %>
            </b></span> <br/><br/><br/><br/>
        <br><span style='float:left'>
      <span style='font-size:15px; position:relative;left:30px;top:20px;'>  <%
                   
                   SimpleDateFormat ft = new SimpleDateFormat (" dd MMMM yyyy  ");
                   Date dNow=new Date(); 
   out.print( "<h2 align=\"center\">" + ft.format(dNow) + "</h2>");
%> </span><span style='position:relative;left:10px;top:-5px;color:black;' >_ _ _ _ _ _ _ _ _ _ _ _</span>
        <span style='font-size:25px; position:relative;left:100px;top:15px;float:left'>Date</span><br>
        </span>



       <img src="images/stamp.png" style='position:relative;left:180px;top:0px;'>

  </div>

        <div style="margin:0 auto;width:150px;">
            <form>
                
                    <script>
                   var cert=document.getElementId("cert");
                   </script>
                   
                <input type="button" value="Print Certificate" onClick="window.print()" style="background-color:darkslategrey; color:white;width:150px;height:30px;border-radius: 50px; ">
            </form>
                	</div
             
                
                
            <!--end of left content-->


          
            
         
                

	<div id="footer">
    
    </div>


		</div> <!--end of center box-->
	</div> <!--end of main content-->
</div> <!--end of main container-->
</body></html>

