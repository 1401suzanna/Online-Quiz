<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%
String n=request.getParameter("val");
if(n.length()>0){
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3305/quiz","root","root");
PreparedStatement ps=con.prepareStatement("select subject from quizinfo where subject='"+n+"'");
ResultSet rs=ps.executeQuery();
while(rs.next()){
out.print("<font style='color:red'>This subject exist, continue</font>");

}
con.close();
}catch(Exception e){e.printStackTrace();}
}//end of if
%>