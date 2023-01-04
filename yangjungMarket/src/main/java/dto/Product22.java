package dto;

import lombok.Data;

@Data
public class Product22 {
	private String productId;
	private String name;
	private Integer unitprice;
	private String description;
	private String category;
	private String manufacturer;
	private Long unitsinstock;
	private String condition;
	private String filename;
	private int quantity;
	
	public Product22() {
		super();
	}
	
	public Product22(String productId,String name,Integer unitprice) {
		this.productId=productId;
		this.name=name;
		this.unitprice=unitprice;
	}
	

}
