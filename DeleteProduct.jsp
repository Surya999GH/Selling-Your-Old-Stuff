<%@page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.*,java.util.*"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
try{
    Class.forName("com.mysql.jdbc.Driver");

} catch (ClassNotFoundException e) {
e.printStackTrace();
}
try{
  String email=(String)session.getAttribute("Admin");

%>
<!DOCTYPE html>
<html>
    <head><title>DeleteProduct</title>
    
        <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {
  font-family: Arial, Helvetica, sans-serif;
}
a{
  size: 20px;
}

.navbar {
  overflow: hidden;
  background-color: #333;
}

.navbar a {
  float: left;
  font-size: 16px;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

.dropdown {
  float: left;
  overflow: hidden;
}

.dropdown .dropbtn {
  font-size: 16px;  
  border: none;
  outline: none;
  color: white;
  padding: 14px 16px;
  background-color: inherit;
  font-family: inherit;
  margin: 0;
}

.navbar a:hover, .dropdown:hover .dropbtn {
  background-color: red;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}
label{
 display: inline-block;  
 color: black;
 text-align: left;
 width: 200px;
}

.dropdown-content a {
  float: none;
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}

.dropdown-content a:hover {
  background-color: #ddd;
}

.dropdown:hover .dropdown-content {
  display: block;
}
</style>
</head>
<body>
    <header><h1 style="color: blue;">USER'S BAZAR</h1></header>

<div class="navbar">
  <a href="AdminHome.html">Home</a>
  <div class="dropdown">
    <button class="dropbtn">Categories
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
        <a href="http://localhost:3886/Surendra/AddProducts.jsp">Add Product</a>
        <a href="http://localhost:3886/Surendra/DeleteProduct.jsp">Delete Product</a>
    </div>
  </div> 
  <!-- <a href="UserCart.html">Cart</a>
  <a href="UserPayments.html">Payments</a>
  <a href="About.html">About</a> -->
  <a href="AdminLogout.jsp">AdminLogout</a>
</div>
<div style="height: auto;width: 100%;float: left;"><section style="float: left;background-color: aqua;height: 400px;width: 25%;text-align: center;">
   <br><br><br><br><br><br><br>
  <h1>Delete Product</h1>
</section>


<%
if(email.equals("admin@gmail.com"))
{
int a=0;
String ItemId=request.getParameter("ItemId");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/surendra","root","Root");
Statement st=conn.createStatement();
 a=st.executeUpdate("delete from products where ItemId='"+ItemId+"'");
if(a>0)
{
  %>
  <h1>Product Deleted Successful...</h1>
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
<form method="POST" action="http://localhost:3886/Surendra/DeleteProduct.jsp">
<div style="text-align: left;width: 450px;height: auto;margin: 0 auto;">
   <br><br><br><br><br> 
    <label for="ItemId"> Enter Item Id:</label>
    <input name="ItemId" id="ItemId" min="0001" type="number" required>
    <br><br>
    <button type="submit" style="background-color: darkolivegreen; color:rgb(105, 220, 228);">Delete Product</button>
</div>
</form>
</div>
</body></html>