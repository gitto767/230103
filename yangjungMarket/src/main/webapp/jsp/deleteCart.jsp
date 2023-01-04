<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Product22" %>    
<%@ page import="dao.ProductRepository" %>

<%
    String id=request.getParameter("cartId");
    if(id==null || id.trim().equals("")){
    	response.sendRedirect("cart.jsp");
    	return;
    }
    
    session.invalidate();
    response.sendRedirect("cart.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>