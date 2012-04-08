<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="Styles/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Web Application Project</title>
</head>
<body>
Hello, how are you? I'm fine. This is feature xyz.

<% for (int i=0; i<10; i++) { %>
This text is repeated<br/>
<% }; %>

<%= new java.util.Date()%>
This is the master
</body>
</html>
