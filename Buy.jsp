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
    String Itemno=request.getParameter("ItemId");
    String Email=(String)session.getAttribute("user");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/surendra","root","Root");
Statement st=conn.createStatement();
int j=st.executeUpdate("delete from products where ItemId='"+Itemno+"'");
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