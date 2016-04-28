<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%try{
String cid=(String)session.getAttribute("cid");
String query=(String)session.getAttribute("query");
String reply=request.getParameter("reply");

Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3305/quiz","root","root");;
PreparedStatement ps=con.prepareStatement("update feedback set reply=? where cid=? and query=?");

ps.setString(1,reply);
ps.setString(2,cid);
ps.setString(3,query);

int s=ps.executeUpdate();
System.out.print(s);
}catch(SQLException e2){
e2.printStackTrace();
}
%>
<jsp:forward page="home.jsp"></jsp:forward>
