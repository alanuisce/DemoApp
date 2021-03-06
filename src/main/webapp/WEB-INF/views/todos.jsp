<%@page import="ie.cit.cloudapp.Todo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="security"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<link rel="stylesheet" href="Styles/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ToDo Application</title>
</head>
<body>

<a href="j_spring_security_logout">logout : <security:authentication property="principal.username" /></a>

<h1>To Do Application (controller)</h1>
<h2>List of current to do items</h2>

<c:forEach items="${todos }" var="todo" varStatus="row">

${todo.text }<br/>${todo.done }<br/>

<form method="post">
<input name="_method" type="hidden" value="delete">
<input name="todoId" type="hidden" value="${todo.id }">
<input type="submit" value="Delete">
</form>

<form method="post">
<input name="_method" type="hidden" value="put">
<input name="todoId" type="hidden" value="${todo.id }">
<input type="submit" value="Update">
</form>

</c:forEach>
<h2>Create new to do</h2>
<form method="post">
Text: <input name="text"><input type="submit">
</form>
</body>
</html>
