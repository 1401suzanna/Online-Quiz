<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="org.omg.CORBA.PUBLIC_MEMBER"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%
  String name=(String)session.getAttribute("cid");
  String username=(String)session.getAttribute("username");
  
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3305/quiz","root","root");
 
PreparedStatement ps1= con.prepareStatement("select coursename from course where cid='"+name+"'");
ResultSet rs1= ps1.executeQuery();

PreparedStatement ps2= con.prepareStatement("select query,reply from feedback where cid='"+name+"' and username='"+username+"'");
ResultSet rs2= ps2.executeQuery();

%>
<html xmlns="http://www.w3.org/1999/xhtml"><head>


<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Online Quiz</title>
<link rel="stylesheet" type="text/css" href="style.css">
    <link rel="stylesheet" type="text/css" href="menu.css">
        
</head>
    
    <body>

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
   <li><a href="takequiz.jsp"><span>Take Quiz</span></a></li>
   <li><a href="ask2.jsp"><span>Feedback</span></a></li>
   <li><a href="makequiz.jsp"><span>Create Quiz</span></a></li>
   <li class='last'><a href='logout.jsp'><span>logout</span></a></li>
   <li class='letter'><a>Hello, <%= session.getAttribute( "username" ) %> (<%= session.getAttribute( "category" ) %>) </a></li>
</ul>
</div>          
            
         

                
                
          
                  <div id="contact_form" style="width:100%;">
                  
                   <h1 class="contact_h1">Ask Questions </h1>
                   
                       <form method="post" action="feedbackprocess.jsp" name="myform">
                   
                            
                    <div class="form_row">                    
                    <label class="label" >course name:</label><input name="coursename" value="<%
                            while(rs1.next()){
                            out.print(rs1.getString(1));
                            }
                            %>" 
                            class="contact_input" type="text" disabled>
                        
                    </div>
                            
                    
                    
                    
                    <div class="form_row">                    
                    <label class="label" ><b>previous queries:</b></label>
                    <label class="label2" style="width: 300px;font-size: 15px; float:left;  margin-right: 15px;"><%
                         out.print("<table>");
                            while(rs2.next()){
                                out.print("<tr>");
                            out.print("<td>query: </td><td>"+rs2.getString(1)+"</td>");
                             out.print("</tr>");
                              out.print("<tr>");
                            out.print("<td>reply: </td><td>"+rs2.getString(2)+"</td>");
                               out.print("</tr>");
                                 out.print("</tr>");
                            }
                            out.print("</table>");
                            %>
                            </label>
                        
                    </div>
                    
                     <div class="form_row">
                    <label  class="label"> query:</label><input name="query" class="contact_input" type="text">
                    </div>                   
                    
                    
                       <div class="form_row">
                           <input type="submit" class="read_more" value="post query"/>    </div>  
					</form>        
            
                </div>               

            
             <div style="width:80px;height:80px;position:relative; clear:both;float:right;">
                <img src="images/ask.png" style="width:80px;height:120px;">
            </div>
           
            
            



	<div id="footer">
  

    
    </div>


		</div> <!--end of center box-->
	</div> <!--end of main content-->
<!--end of main container-->
</body></html>