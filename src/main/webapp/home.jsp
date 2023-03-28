<%-- 
    Document   : home
    Created on : 26 de mar. de 2023, 16:25:46
    Author     : willi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World! ${username}</h1>
        <p><a href="logout.jsp">Logout</a></p>
    </body>
</html>

<%

    //String username = (String) session.getAttribute("username");
%>
