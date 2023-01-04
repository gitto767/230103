<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Product22" %>    
<%@ page import="dao.ProductRepository" %>

<%
    String id=request.getParameter("id");
    if(id==null || id.trim().equals("")){
    	response.sendRedirect("products.jsp");
    	return;
    }
    
    ProductRepository dao= ProductRepository.getInstance();
    
    Product22 product=dao.getProductById(id);
    if(product==null){
    	response.sendRedirect("exceptionNoProductId.jsp");
    }
    
    ArrayList<Product22> cartList=(ArrayList<Product22>) session.getAttribute("cartlist");
    Product22 goodsQnt= new Product22();
    
    for(int i=0;i<cartList.size();i++){
    	goodsQnt=cartList.get(i);
    	if(goodsQnt.getProductId().equals(id)){
    		cartList.remove(goodsQnt);
    	}
    }
    
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