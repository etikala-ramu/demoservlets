package com.crud.dao;
import java.sql.*;  
import java.util.ArrayList;  
import java.util.List;  
import com.crud.bean.Book;

public class BookDao {
	
	public static Connection getConnection(){  
	    Connection con=null;  
	    try{  
	        Class.forName("com.mysql.jdbc.Driver");  
	        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookdb","root","root");  
	    }catch(Exception e){System.out.println(e);}  
	    return con;  
	} 
	public static int save(Book b) {
		int status=0;
		try {
			Connection con=getConnection();
			PreparedStatement ps=con.prepareStatement("insert into bookinfo(bookid,bookname,bookauthor) values(?,?,?)");
			ps.setInt(1, b.getBookid());
			ps.setString(2, b.getBookname());
			ps.setString(3, b.getBookauthor());
			status=ps.executeUpdate();
		}catch(Exception e){System.out.println(e);}  
	    return status;
	}
	public static int update(Book b) {
		int status=0;
		try {
			Connection con=getConnection();
			PreparedStatement ps=con.prepareStatement("update bookinfo set bookname=?,bookauthor=? where bookid=?");
			
			ps.setString(1, b.getBookname());
			ps.setString(2, b.getBookauthor());
			ps.setInt(3, b.getBookid());
			status=ps.executeUpdate();
		}catch(Exception e){System.out.println(e);}  
	    return status;
	}public static int delete(Book b) {
		int status=0;
		try {
			Connection con=getConnection();
			PreparedStatement ps=con.prepareStatement("delete from bookinfo where bookid=?");
			ps.setInt(1, b.getBookid());
			/*ps.setString(2, b.getBookname());
			ps.setString(3, b.getBookauthor());*/
			status=ps.executeUpdate();
		}catch(Exception e){System.out.println(e);}  
	    return status;
	}
	public static List<Book> getAllRecords(){
		List<Book> list= new ArrayList<Book>();
		try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("select * from bookinfo");  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){ 
	        	Book b =new Book();
	        	b.setBookid(rs.getInt("bookid"));
	        	b.setBookname(rs.getString("bookname"));
	        	b.setBookauthor(rs.getString("bookauthor"));
	        	list.add(b);
	        }
	        } catch(Exception e){System.out.println(e);}  
	        return list;
		}
		public static Book getRecordById(int bookid){  
		    Book b=null;  
		    try{  
		        Connection con=getConnection();  
		        PreparedStatement ps=con.prepareStatement("select * from bookinfo where bookid=?");  
		        ps.setInt(1,bookid);  
		        ResultSet rs=ps.executeQuery();  
		        while(rs.next()){  
		            b=new Book();  
		            b.setBookid(rs.getInt("bookid"));  
		            b.setBookname(rs.getString("bookname"));  
		            b.setBookauthor(rs.getString("bookauthor"));  
		              
		        }  
		    }catch(Exception e){System.out.println(e);}  
		    return b;  
}
	}
