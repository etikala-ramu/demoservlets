
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Form</title>
</head>
<body>

<%@page import="com.crud.dao.BookDao,com.crud.bean.Book"%>
<%  
String Bookid=request.getParameter("bookid");  
Book b=BookDao.getRecordById(Integer.parseInt(Bookid));  
%>
<h1>Edit Form</h1>  
<form action="editbook.jsp" method="post">  
<input type="hidden" name="bookid" value="<%=b.getBookid() %>"/>
<table>  
<tr><td>Bookname:</td><td>
<input type="text" name="bookname" value="<%= b.getBookname()%>"/></td></tr>
<tr><td>Bookauthor:</td><td>
<input type="text" name="bookauthor" value="<%= b.getBookauthor()%>"/></td></tr>
<tr><td colspan="2"><input type="submit" value="Edit Book"/></td></tr>
</table>
</form>
</body>
</html>