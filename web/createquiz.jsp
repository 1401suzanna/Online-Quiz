<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<% try {
    String useranmee=session.getAttribute("username").toString();
String quizname= request.getParameter("subject");
session.setAttribute("quizname",String.valueOf(quizname));
String connectionURL = "jdbc:mysql://localhost:3305/quiz";
    Connection connection = null; 
    Class.forName("com.mysql.jdbc.Driver").newInstance(); 
    connection = DriverManager.getConnection(connectionURL, "root", "root");
    if(!connection.isClosed()){
        
        
    String sql1 = "select CID from course where username='"+useranmee+"' and coursename='"+quizname+"'";  
    Statement st1 = connection.createStatement();
    Statement stmt1 = null;
    stmt1 = connection.createStatement();
    ResultSet rs1 = stmt1.executeQuery(sql1);
    if(rs1.next()){
        %><jsp:forward page="makequiz.jsp"></jsp:forward><%
           
         }
    else{
        
       String queryText = "insert into course(username,coursename) values(?,?);";
            PreparedStatement  pst = connection.prepareStatement(queryText);
            
            pst.setString(1,useranmee);  
            pst.setString(2,quizname); 
            int i = pst.executeUpdate();
            String sql = "select CID from course where username='"+useranmee+"' and coursename='"+quizname+"'";  
            Statement st = connection.createStatement();
            Statement stmt = null;
            stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next()){
                out.println(rs.getString(1));
              session.setAttribute("quizno",String.valueOf((rs.getString(1))));  
       
    }
            %><jsp:forward page="createquiz1.jsp"></jsp:forward><%
    }
    }
}
catch(Exception e){e.printStackTrace();}
%>
