package model.entity;

public class Product {

	private int productId;
	private String productName;
	private String description;
	private double price;
	
	public Product() {

	}
	
	public Product(int productId, String productName, String description, double price) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.description = description;
		this.price = price;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public Product setProductIdValue(int productId) {
		this.productId = productId;
		return this;
	}
	
	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}
	
	public Product setProductNameValue(String productName) {
		this.productName = productName;
		return this;
	}
	
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	public Product setDescriptionValue(String description) {
		this.description = description;
		return this;
	}
	
	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}
	
	public Product setPriceValue(double price) {
		this.price = price;
		return this;
	}
	
	public Producto toProducto() {
		
		Producto producto = new Producto();
		
		producto.setId(productId);
		producto.setNombre(productName);
		producto.setDescripcion(description);
		producto.setPrecio((int)(price * 100));
		
		return producto;
	}
}
