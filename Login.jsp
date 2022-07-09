<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String email=request.getParameter("email");
String pwd=request.getParameter("pwd");
 
try {
Class.forName("com.mysql.jdbc.Driver");
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

%>
<!DOCTYPE html>
<html>
<head><title>Redirecting...</title></head>
<body style="background-image: url(https://cdn3.vectorstock.com/i/1000x1000/37/27/oops-something-went-wrong-vector-28313727.jpg);background-attachment: fixed;background-size: cover;">

<%
try{
  String Aemail = "admin@gmail.com";
  String Apwd="Admin";
  if((Aemail.equals( email))&&(Apwd.equals( pwd)))
  {
    session.setAttribute("Admin",Aemail);
  response.sendRedirect("AdminHome.html");
  }
  else
  {
  int x=0;
  Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/surendra","root","Root");
  Statement statement=connection.createStatement();
  String sql ="select * from Register";
ResultSet resultSet = statement.executeQuery(sql);
while(resultSet.next())
{      
  String demail=resultSet.getString("Email");
  String dpwd=resultSet.getString("Password"); 
	if((demail.equals(email))&&(dpwd.equals(pwd)))
    { 
      session.setAttribute("user", email); 
      session.setAttribute("pass",pwd);
    	response.sendRedirect("UserHome.html"); 
    	x=x+1;
    }
}
  if(x==0)
  {
  %>
  <h1 >EMAIL ID OR PASSWORD IS WRONG!!!</h1>
  <%
  }
  }
  }
  catch(Exception e)
  {
  System.out.print(e);
  e.printStackTrace();
  }
  
  
  %>
</body>
  </html>
  