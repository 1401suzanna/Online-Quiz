<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>

<%! static int counter=0; %>
<%
counter++;
 try {
 String connectionURL = "jdbc:mysql://localhost:3305/quiz";
    Connection connection = null; 
    Class.forName("com.mysql.jdbc.Driver").newInstance(); 
    connection = DriverManager.getConnection(connectionURL, "root", "root");

String question= request.getParameter("question");
String option1= request.getParameter("option1");
String option2= request.getParameter("option2");
String option3= request.getParameter("option3");
String option4= request.getParameter("option4");
String answer=request.getParameter("answer");
if(answer.equals("1"))
     answer =  answer.replace( answer,option1);
 if(answer.equals("2"))
     answer =  answer.replace( answer,option2);
if(answer.equals("3"))
     answer =  answer.replace( answer,option3);
if(answer.equals("4"))
    answer =  answer.replace( answer,option4);

PreparedStatement ps=connection.prepareStatement("insert into quizques values(?,?,?,?,?,?,?,?)");
int quiznoo = Integer.parseInt(session.getAttribute("quizno").toString());
ps.setInt(1,quiznoo);
ps.setInt(2,counter);
ps.setString(3,question);
ps.setString(4,option1);
ps.setString(5,option2);
ps.setString(6,option3);
ps.setString(7,option4);
ps.setString(8,answer);

int s= ps.executeUpdate();


}
catch(Exception e){e.printStackTrace();}

%>
<% 
request.setAttribute("counter",counter);
%>


<jsp:forward page="createquiz1.jsp"></jsp:forward>