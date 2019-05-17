
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>view book</title>
</head>
<body>
<%@page import="com.crud.dao.BookDao,com.crud.bean.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<h1>Book List</h1>  
  
<%  
List<Book> list=BookDao.getAllRecords();  
request.setAttribute("list",list);  
%>  
<table border="1" width="90%">
<tr><th>Bookid</th><th>Bookname</th><th>Bookauthor</th></tr>
<c:forEach items="${list}" var="b"> 	 
<tr><td>${b.getBookid()}</td><td>${b.getBookname()}</td><td>${b.getBookauthor()}</td>  
 <%-- <td><a href="searchform.jsp?bookid=${b.getBookid()}">Read</a></td> --%>
<td><a href="editform.jsp?bookid=${b.getBookid()}">Edit</a></td>  
<td><a href="deletebook.jsp?bookid=${b.getBookid()}">Delete</a></td></tr>  
</c:forEach> 
</table>
<br/><a href="addbookform.jsp">Add New Book</a>
</body>
</html>