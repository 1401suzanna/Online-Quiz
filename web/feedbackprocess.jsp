<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%try{
String cid=(String)session.getAttribute("cid");
String username=(String)session.getAttribute("username");
String query=request.getParameter("query");

Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3305/quiz","root","root");;
PreparedStatement ps=con.prepareStatement("insert into feedback(username,cid,query,reply) values(?,?,?,default)");

ps.setString(1,username);
ps.setString(2,cid);
ps.setString(3,query);

int s=ps.executeUpdate();
System.out.print(s);
}catch(SQLException e2){
e2.printStackTrace();
}
%>
<jsp:forward page="home.jsp"></jsp:forward>
