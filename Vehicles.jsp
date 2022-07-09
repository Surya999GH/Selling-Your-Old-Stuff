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

<!DOCTYPE html>
<html>
    <head><title>Vehicles</title>
    
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
  <a href="http://localhost:3886/Surendra/SellProduct.jsp">Sell Product</a>
  <a href="http://localhost:3886/Surendra/UserCart.jsp">Cart</a>
  <!-- <a href="http://localhost:3886/Surendra/UserPayments.jsp">Payments</a> -->
  <a href="About.html">About</a>
  <a href="http://localhost:3886/Surendra/Logout.jsp">Logout</a>
</div>
<div style="height: auto;width: 100%;float: left;"><section style="float: left;background-color: aqua;height: 100%;width: 100%;text-align: center;">
    <h1>Vehicles</h1>
</section>
<%
Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/surendra","root","Root");
Statement statement=connection.createStatement();
String sql ="select ItemId,ItemImage,ItemName,YOP,Address,Price,Category from products";
ResultSet resultSet = statement.executeQuery(sql);
while(resultSet.next())
{
    String Id=resultSet.getString("ItemId");
    String IImage=resultSet.getString("ItemImage");
    String IName=resultSet.getString("ItemName");
    String YOP=resultSet.getString("YOP");
    String Address=resultSet.getString("Address");
    String Price=resultSet.getString("Price");
    String Category=resultSet.getString("Category");
    if((Category.equals("Vehicles")))
    {
%>
<script>
  function Add()
  {
      alert("Done");
  }
  function Buy()
        {
          alert("Confirm Purchase");
        }
</script>
<div style="height: 100%;width: 100%;float: left;">
<form method="POST" action="http://localhost:3886/Surendra/AddToUserCart.jsp">
<div style="float: left;height: 700px;width: 50%; ;"><img src="<%=IImage%>" alt="<%=IName%>"></div>
<div>
<b><label>Product Name:</label></b><p><%= IName%></p><br>
<input type="hidden" name="ItemName" value="<%=IName%>">
<b><label>Product Id:</label></b><p><%= Id%></p><br>
<input type="hidden" name="ItemId" value="<%= Id%>" >
<b><label>Category:</label></b><p><%= Category%></p><br>
<b><label>Year Of Purchase:</label></b><p><%= YOP%></p><br>
<b><label>Address:</label></b><p><%= Address%></p><br>
<b><label>Cost Of Item:</label></b><p><%= Price%></p><br>
<input type="hidden" name="Cost" value="<%= Price%>">
<button type="submit" onclick="Add()">Add To Cart</button></form>&nbsp;&nbsp;<br><br>
<form method="POST" action="http://localhost:3886/Surendra/Buy.jsp">
  <input type="hidden" name="ItemName" value="<%=IName%>">
  <input type="hidden" name="ItemId" value="<%= Id%>" >
  <input type="hidden" name="Cost" value="<%= Price%>">
  <button type="submit" onclick="Buy()">Buy Now</button></a></form>
</div>

</div>
<hr>
<%
}
}%>
</div>
    </body>
</html>