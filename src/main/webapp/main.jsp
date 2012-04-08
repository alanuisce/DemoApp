<%@page import="ie.cit.cloudapp.Todo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="repo" class="ie.cit.cloudapp.TodoRepository" scope="request"></jsp:useBean>
<html>
<head>
<link rel="stylesheet" href="Styles/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ToDo Application</title>
</head>
<body>
<h1>To Do Application</h1>
<h2>List of current to do items</h2>

<c:if test="${! empty param.text }">
<%
	Todo todo = new Todo();
	todo.setText(request.getParameter("text"));
	repo.addTodo(todo);
%>
</c:if>

<c:forEach items="${repo.todos }" var="todo">
${todo.text }<br/>
</c:forEach>
<h2>Create new to do</h2>
<form>
Text: <input name="text"><input type="submit">
</form>
</body>
</html>
