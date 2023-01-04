<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="../jsp/dbconn.jsp" %>

<%
  String filename="";
  String realFolder="C:\\hrd1102\\yangjungMarket\\src\\main\\webapp\\upload";
  String encType="utf-8";
  int maxSize=5*1024*1024;
  
  MultipartRequest multi=new MultipartRequest(request,realFolder,maxSize,encType,new DefaultFileRenamePolicy());
  
  String productId=multi.getParameter("productId");
  String name=multi.getParameter("name");
  String unitprice=multi.getParameter("unitprice");
  String description=multi.getParameter("description");
  String manufacturer=multi.getParameter("manufacturer");
  String category=multi.getParameter("category");
  String unitsinstock=multi.getParameter("unitsinstock");
  String condition=multi.getParameter("condition");
  
  Integer price;
  if(unitprice.isEmpty())
	  price=0;
  else
	  price=Integer.valueOf(unitprice);
  long stock;
  
  if(unitsinstock.isEmpty())
	  stock=0;
  else
	  stock=Long.valueOf(unitsinstock);
  
  //@SuppressWarnings("rawtypes")
  Enumeration files=multi.getFileNames();
  String fname=(String) files.nextElement();
  String fileName=multi.getFilesystemName(fname);
  PreparedStatement pstmt=null;
  String sql="insert into product22 values(?,?,?,?,?,?,?,?,?)";
  pstmt=conn.prepareStatement(sql);
  pstmt.setString(1, productId);
  pstmt.setString(2, name);
  pstmt.setInt(3, price);
  pstmt.setString(4, description);
  pstmt.setString(5, category);
  pstmt.setString(6, manufacturer);
  pstmt.setLong(7, stock);
  pstmt.setString(8, condition);
  pstmt.setString(9, fileName);
  pstmt.executeUpdate();
  
  response.sendRedirect("products.jsp");
		  
		  
%>