<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>


<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3305/quiz","root","root");


String n=request.getParameter("val");
session.setAttribute("query",n);

//--
PreparedStatement ps=con.prepareStatement("select cid from feedback where query=?");
ps.setString(1,n);
out.print("<br>");
ResultSet rs=ps.executeQuery();
while(rs.next()){
    session.setAttribute("cid",rs.getString(1));
}

//--
if(n.length()>0){
out.print("<font style='color:navy'><B>query: "+n+"</B><br></font>");
out.print("<font style='color:navy'><B>cid: "+(String)session.getAttribute("cid")+"</B><br></font>");
out.print("<input style='font-size:20px' type='submit' value='view feedback' />");

}


//end of if
%>
