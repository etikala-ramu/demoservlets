<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="com.crud.dao.BookDao,com.crud.bean.Book"%>
<%  
String Bookid=request.getParameter("bookid");  
Book b=BookDao.getRecordById(Integer.parseInt(Bookid)); 
/* response.sendRedirect("viewbook.jsp"); */
%>
<h1>Update Form</h1>  
<form action="searchbook.jsp" method="post">  
<table>
<tr><td>Bookid:</td><td>
<input type="text" name="bookid" value="<%= b.getBookid()%>"/></td></tr>  
<tr><td>Bookname:</td><td>
<input type="text" name="bookid" value="<%= b.getBookname()%>"/></td></tr>
<tr><td>Bookauthor:</td><td>
<input type="text" name="bookauthor" value="<%= b.getBookauthor()%>"/></td></tr>
<tr><td colspan="2"><input type="submit" value="Update"/></td></tr>
</table>
</body>
</html>