<!DOCTYPE html>
<html>
    <head><title>Logout</title></head>
    <body>
        <%
session.invalidate();
response.sendRedirect("Login.html");
%>
    </body>
</html>