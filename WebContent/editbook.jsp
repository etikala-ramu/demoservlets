<%@page import="com.crud.dao.BookDao"%>  
<jsp:useBean id="b" class="com.crud.bean.Book"></jsp:useBean>  
<jsp:setProperty property="*" name="b"/>  
<%  
int i=BookDao.update(b);  
response.sendRedirect("index.jsp");  
%>  