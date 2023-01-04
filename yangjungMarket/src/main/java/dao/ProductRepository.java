package dao;

import java.util.ArrayList;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.*;

import dto.Product22;

public class ProductRepository {
	private ArrayList<Product22> listOfProducts=new ArrayList<Product22>();
	private static ProductRepository instance=new ProductRepository();
	
	public static ProductRepository getInstance() {
		return instance;
	}
	
	public ProductRepository() {
		Connection conn=null;
		try {
			String url="jdbc:oracle:thin:@//localhost:1521/xe";
			String user="system";
			String pass="1234";
			String driver="oracle.jdbc.OracleDriver";
			Class.forName(driver);
			conn=DriverManager.getConnection(url, user, pass);
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			String sql="select * from product22";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Product22 phone=new Product22(rs.getString("productId"),rs.getString("name"),rs.getInt("unitprice"));
				phone.setDescription(rs.getString("description"));
				phone.setCategory(rs.getString("category"));
				phone.setManufacturer(rs.getString("manufacturer"));
				phone.setUnitsinstock(rs.getLong("unitsinstock"));
				phone.setCondition(rs.getString("condition"));
				phone.setFilename(rs.getString("filename"));
				listOfProducts.add(phone);
			}
		}catch(Exception ex) {
			System.out.println("데이터베이스 연결에 실패하였습니다.");
			System.out.println("SQL Exception: "+ex.getMessage());;
		}
	}
	
	public ArrayList<Product22> getAllProducts(){
		return listOfProducts;
	}
	public Product22 getProductById(String productId) {
		Product22 productById=null;
		    for(int i=0;i<listOfProducts.size();i++) {
		    	Product22 product=listOfProducts.get(i);
		    	if(product !=null && product.getProductId()!=null && product.getProductId().equals(productId)) {
		    		productById=product;
		    		break;
		    	}
		    }
		    return productById;
	}
	
	public void addProduct(Product22 product) {
		listOfProducts.add(product);
	}

}
