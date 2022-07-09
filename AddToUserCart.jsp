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
%><!DOCTYPE html>
    <html><body>
        <%
try
{
    int x=0;
    String IId=request.getParameter("ItemId");
    String Price=request.getParameter("Cost");
    String Itemname=request.getParameter("ItemName");
    String EmailId=(String)session.getAttribute("user");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/surendra","root","Root");
Statement st=conn.createStatement();
%><h1>Product is already in your cart...</h1><%
x=st.executeUpdate("insert into cart(ItemId ,EmailId ,Price ,ItemName ) values('"+IId+"','"+EmailId+"','"+Price+"','"+Itemname+"')");
if(x>0)
{
    out.print("Item Added Successful...");
    response.sendRedirect("http://localhost:3886/Surendra/UserCart.jsp");
}
else{
    %>
    
        <h1>Something Went Wrong...!Please Try Again.</h1>
    <%
    out.print("");
}
%>
        <h1>Something Went Wrong...!The product already Added To Cart.</h1>
    </body></html>
    <%
}
catch (Exception e) {
  e.printStackTrace();
  }
%>