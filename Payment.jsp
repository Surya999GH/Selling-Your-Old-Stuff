<%@page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.*,java.util.*"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
try{
    Class.forName("com.mysql.jdbc.Driver").newInstance();

} catch (ClassNotFoundException e) {
e.printStackTrace();
}
try{
    String Email=(String)session.getAttribute("user");
    Connection conn2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/surendra","root","Root");
Statement st2=conn2.createStatement();
ResultSet rs=st2.executeQuery("select * from cart where EmailId='"+Email+"'");
while(rs.next())
{
    String Idno=rs.getString("ItemId");
    Connection conn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/surendra","root","Root");
Statement st1=conn1.createStatement();
    int x=st1.executeUpdate("delete from products where ItemId='"+Idno+"'");
}
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/surendra","root","Root");
Statement st=conn.createStatement();
int j=st.executeUpdate("delete from cart where EmailId='"+Email+"'");
if(j>0)
{
    response.sendRedirect("http://localhost:3886/Surendra/UserPayments.html");
}
else
{
    out.print("Something Went Wrong...!");
}
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>