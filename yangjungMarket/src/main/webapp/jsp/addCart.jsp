<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Product22" %>
<%@ page import="dao.ProductRepository" %>
<%
    String id=request.getParameter("id");
    if(id==null||id.trim().equals("")){
    	response.sendRedirect("products.jsp");
    	return;
    }
    
    ProductRepository dao=ProductRepository.getInstance();
    
    Product22 product=dao.getProductById(id);
    if (product==null){
    	response.sendRedirect("exctionNoProductId.jsp");
    }
    
    ArrayList<Product22> goodsList=dao.getAllProducts();
    Product22 goods=new Product22();
    for(int i=0;i<goodsList.size();i++){
    	goods=goodsList.get(i);
    	if(goods.getProductId().equals(id)){
    		break;
    	}
    }
    ArrayList<Product22> list =(ArrayList<Product22>) session.getAttribute("cartlist");
    if(list==null){
    	list=new ArrayList<Product22>();
    	session.setAttribute("cartlist", list);
    }
    
    int cnt=0;
    Product22 goodsQnt=new Product22();
    for(int i=0;i<list.size();i++){
    	goodsQnt=list.get(i);
    	if(goodsQnt.getProductId().equals(id)){
    		cnt++;
    		int orderQuantity=goodsQnt.getQuantity()+1;
    		goodsQnt.setQuantity(orderQuantity);
    	}
    }
    if(cnt==0){
    	goods.setQuantity(1);
    	list.add(goods);
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