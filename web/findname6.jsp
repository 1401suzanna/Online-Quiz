<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>


<%
String n=request.getParameter("val");

session.setAttribute("cid",n);


if(n.length()>0){
out.print("<font style='color:navy; '><B>Subject "+n+" feedback</B><br></font>");
out.print("<input type='submit' value='start feedback' />");

}


//end of if
%>