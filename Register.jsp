<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%

try {
Class.forName("com.mysql.jdbc.Driver");

} catch (ClassNotFoundException e) {
e.printStackTrace();
}
%>
<!DOCTYPE html>
<html>
<body>
<style>
body {
  background-image: url('https://previews.123rf.com/images/stuartphoto/stuartphoto1607/stuartphoto160700991/61313619-success-character-meaning-triumphant-successful-and-3d-rendering.jpg');
background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover;
}
</style>

<%
try{
String Firstname= request.getParameter("fname");
String Lastname= request.getParameter("lname");
String Gender= request.getParameter("gender");
String Email= request.getParameter("email");
String Password= request.getParameter("pwd");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/surendra","root","Root");
Statement st=conn.createStatement();
int j=st.executeUpdate("insert into register(Firstname, Lastname, Gender, Email, Password) values('"+Firstname+"','"+Lastname+"','"+Gender+"','"+Email+"','"+Password+"')");
if(j>0)
{
    out.println("Registration Done Successful...");
}
else{
    out.println("Registration Failed???");
}
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>

<a href="Login.html"><h1>Click here </h1></a>&nbsp;<h1>to redirect to login page.</h1>
</body>
</html>