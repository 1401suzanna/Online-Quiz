<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="org.omg.CORBA.PUBLIC_MEMBER"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>


<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Online Quiz</title>
<link rel="stylesheet" type="text/css" href="style.css">
    <link rel="stylesheet" type="text/css" href="menu.css">
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
   <li><a href="takequiz.jsp"><span>Take Quiz</span></a></li>
     
   <%
       String category=(String)session.getAttribute("category");
       if(category.equals("Student"))
	 out.print("<li><a href='ask2.jsp'><span>Feedback</span></a></li>");
       else if(category.equals("Teacher"))
	out.print("<li><a href='t_ask2.jsp'><span>view Feedback</span></a></li>");
      %> 

   <li><a href="makequiz.jsp"><span>Create Quiz</span></a></li>
   <li class='last'><a href='logout.jsp'><span>logout</span></a></li>
   <li class='letter'><a>Hello, <%= session.getAttribute( "username" ) %> (<%= session.getAttribute( "category" ) %>) </a></li>
</ul>
</div>           