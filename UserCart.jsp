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
%>
<!DOCTYPE html>
<html>
    <head>
        <title>
            My Cart
        </title>
    </head>
    <body>
        <header style="color:rgb(87, 70, 235);text-align: left;"><h1>USER'S BAZAR</h1></header>
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

.dropdown-content a {
  float: none;
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}
td{
  height: 30px;
  background-color: aqua;
  text-align: center;
}
th{
  height: 35px;
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

<div class="navbar">
  <a href="UserHome.html">Home</a>
  <div class="dropdown">
    <button class="dropbtn">Buy Products
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="http://localhost:3886/Surendra/Clothings.jsp">Clothings</a>
      <a href="http://localhost:3886/Surendra/Vehicles.jsp">Vehicles</a>
      <a href="http://localhost:3886/Surendra/Digitals.jsp">Digitals</a>
      <a href="http://localhost:3886/Surendra/KitchenWare.jsp">KitchenWare</a>
      <a href="http://localhost:3886/Surendra/HouseHolds.jsp">House Holds</a>
      <a href="http://localhost:3886/Surendra/Others.jsp">Others</a>
    </div>
  </div> 
  <!-- <a href="http://localhost:3886/Surendra/SellProduct.jsp">Sell Products</a> -->
  <a href="http://localhost:3886/Surendra/UserCart.jsp">My Cart</a>
  <!-- <a href="UserPayments.html">Payments</a> -->
  <a href="About.html">About</a>
  <a href="http://localhost:3886/Surendra/Logout.jsp">Logout</a>
</div>
<script>
  function Remove() {
    alert("Successfully Removed");
  }
  function clear()
  {
    alert("Your Cart Is Cleared");
  }
  
  </script>

<section style="height: auto;width: 100%;background-color: chartreuse;text-align: center;"><br><h1>My Cart</h1><br></section>
<table style="width: 100%;background-color: rgb(219, 150, 94);">
  <tr>
    <th>Product Id</th>
    <th>Product Name</th>
    <th>Price</th>
    <th>&nbsp</th>
  </tr>

<%
try
{
  int i=0;
  int sum=0;
    String IId=request.getParameter("ItemId");
    String Email=(String)session.getAttribute("user");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/surendra","root","Root");
Statement st=conn.createStatement();
String sql="select * from cart where EmailId='"+Email+"'";
ResultSet rs=st.executeQuery(sql);
while(rs.next())
{
  String Itemno=rs.getString("ItemId");
  String Pname=rs.getString("ItemName");
  int Rate=rs.getInt("Price");
  sum=sum+Rate;
  i=i+1;
  %>
  <tr style="background-color: aqua;">
      <td><%=Itemno%></td>
      <td><%=Pname%></td>
      <td><%=Rate%></td>
      <form method="POST" action="http://localhost:3886/Surendra/RemovefromCart.jsp">
        <input type="hidden" name="ItemId" value="<%=Itemno%>">
      <td><button type="submit" onclick="Remove()" style="background-color: rgb(236, 240, 10);" >Remove</button></td>
      </form>
  </tr>
  <%
}
%>
  <tr>
    <td>No of products:<%=i%></td>
    <td></td>
    <td>Total=<%=sum%></td>
    <td><form method="POST" action="http://localhost:3886/Surendra/ClearCart.jsp"><button type="submit" onclick="clear()" style="background-color: red;">Remove All</button></form></td>
  </tr>
  </table>
  <script>
    function purchase()
  {
    alert("Confirm Purchase of Rs:<%=sum%>");
  }
  </script>
  <br><br><form method="Post" action="http://localhost:3886/Surendra/Payment.jsp">
  <center><div style="text-align: center;width: 160px;height: 70px;"><button onclick="purchase()" style="background-color: rgb(64, 136, 202);">Purchase All</button></div></center>
  </form>
  <%

}
catch (Exception e) {
  e.printStackTrace();
  }
%>
</body>
</html>