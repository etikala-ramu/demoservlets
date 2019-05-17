<%@page import="com.crud.dao.BookDao"%>  
<jsp:useBean id="b" class="com.crud.bean.Book"></jsp:useBean>  
<jsp:setProperty property="*" name="b"/>  
<%  
String Bookid=request.getParameter("bookid");  
b=BookDao.getRecordById(Integer.parseInt(Bookid));
b.setBookauthor(request.getParameter("bookauthor"));
b.setBookname(request.getParameter("bookname"));
BookDao.save(b);
 response.sendRedirect("index.jsp"); 
%>