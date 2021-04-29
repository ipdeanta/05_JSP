package model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.hibernate.Session;

import model.entity.Product;
import model.entity.Producto;
import utils.HibernateUtil;

public class ProductDAO {
	
	private static final Logger logger = LogManager.getLogger(ProductDAO.class.getName());

	public static Map<Integer, Producto> getProductoMap() {		
		Map<Integer, Producto> map = new HashMap<Integer, Producto>();
		
		Session s = HibernateUtil.getSessionFactory().openSession();		
		List<Producto> list = getProductos(s);
		
		if (list.size() == 0) {
			logger.info("Generaring default product map...");
			//map = generateDefaultProductMap();
		} else {
			map = list.stream().collect(Collectors.toMap(x -> x.getId(), x -> x));
		}
		
		return map;
	}
	
	public static List<Producto> getProductos(Session s) {		
		String hQuery = " from Producto p ";
		
		List<Producto> productos =
				s.createQuery(hQuery, Producto.class)
                 .list();
		
		return productos;
	}
	
	public static Map<Integer, Producto> generateDefaultProductMap() {		
		Map<Integer, Producto> list = new HashMap<Integer, Producto>();
		
		Product product;
		product = new Product().setProductIdValue(1)
							   .setProductNameValue("Logitech MB")
							   .setDescriptionValue("Ratón inalámbrico Bluetooth")
							   .setPriceValue(19.99);		
		list.put(product.getProductId(), product.toProducto());
		
		product = new Product().setProductIdValue(2)
							   .setProductNameValue("MSI Phoenix 15E")
							   .setDescriptionValue("Teclado Gaming con iluminación RGB")
							   .setPriceValue(39.95);		
		list.put(product.getProductId(), product.toProducto());
		
		product = new Product().setProductIdValue(3)
							   .setProductNameValue("MSI Optix MAG271P")
							   .setDescriptionValue("Monitor Gaming 27\" 144 Hz 1080p")
							   .setPriceValue(219.90);		
		list.put(product.getProductId(), product.toProducto());
		
		product = new Product().setProductIdValue(4)
							   .setProductNameValue("AMD Ryzen 4100F")
							   .setDescriptionValue("CPU 3.1 Ghz (con disipador)")
							   .setPriceValue(99.99);		
		list.put(product.getProductId(), product.toProducto());
		
		product = new Product().setProductIdValue(5)
							   .setProductNameValue("Asus ROG NH450B")
							   .setDescriptionValue("Placa base socket AM4+, 4 slots DDR4, 2 PCI-e x16")
							   .setPriceValue(134.45);		
		list.put(product.getProductId(), product.toProducto());
		
		return list;
	}
}