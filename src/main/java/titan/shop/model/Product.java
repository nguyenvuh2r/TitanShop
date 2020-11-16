	package titan.shop.model;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;


@Entity
public class Product implements Serializable{

	private static final long serialVersionUID = 10L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long productId;
	
	private String productName;
	
	@Range(min=0)
	private Double productPrice;
	
	@Range(min=0)
	private Integer unitInStock;
	
	private String productDescription;
	
	private String productModel;
	
	private String productStatus;
	
	@ManyToOne
	@JoinColumn(name = "productCategoriesId")
	private ProductCategories productCategories;
	
	@ManyToOne
	@JoinColumn(name = "productBrandId")
	private ProductBrand productBrand;

	@Range(min=0)
	private  Double discount;
	@Transient
	private MultipartFile productImage;
	
	@OneToMany(mappedBy="product",cascade=CascadeType.ALL,fetch=FetchType.EAGER)
	@JsonIgnore
	private List<CartItem> cartItems;
	
	
	private String variants;
	
	
	
	
	public String getProductModel() {
		return productModel;
	}


	public void setProductModel(String productModel) {
		this.productModel = productModel;
	}


	public Product(long productId, String productName, @Range(min = 0) Double productPrice,
			@Range(min = 0) Integer unitInStock, String productDescription, String productModel, String productStatus,
			ProductCategories productCategories, ProductBrand productBrand, @Range(min = 0) Double discount,
			MultipartFile productImage, List<CartItem> cartItems, String variants) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.productPrice = productPrice;
		this.unitInStock = unitInStock;
		this.productDescription = productDescription;
		this.productModel = productModel;
		this.productStatus = productStatus;
		this.productCategories = productCategories;
		this.productBrand = productBrand;
		this.discount = discount;
		this.productImage = productImage;
		this.cartItems = cartItems;
		this.variants = variants;
	}


	public Product() {
		
	}
	
	
	public List<CartItem> getCartItems() {
		return cartItems;
	}


	public void setCartItems(List<CartItem> cartItems) {
		this.cartItems = cartItems;
	}


	public String getVariants() {
		return variants;
	}


	public void setVariants(String variants) {
		this.variants = variants;
	}
	
	public ProductCategories getProductCategories() {
		return productCategories;
	}
	
	public void setProductCategories(ProductCategories productCategories) {
		this.productCategories = productCategories;
	}

	public ProductBrand getProductBrand() {
		return productBrand;
	}

	public void setProductBrand(ProductBrand productBrand) {
		this.productBrand = productBrand;
	}


	public long getProductId() {
		return productId;
	}


	public void setProductId(long productId) {
		this.productId = productId;
	}


	public String getProductName() {
		return productName;
	}


	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductDescription() {
		return productDescription;
	}


	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}


	public String getProductStatus() {
		return productStatus;
	}


	public void setProductStatus(String productStatus) {
		this.productStatus = productStatus;
	}

	public Double getProductPrice() {
		return productPrice;
	}


	public void setProductPrice(Double productPrice) {
		this.productPrice = productPrice;
	}


	public Integer getUnitInStock() {
		return unitInStock;
	}


	public void setUnitInStock(Integer unitInStock) {
		this.unitInStock = unitInStock;
	}


	public Double getDiscount() {
		return discount;
	}


	public void setDiscount(Double discount) {
		this.discount = discount;
	}


	public MultipartFile getProductImage() {
		return productImage;
	}


	public void setProductImage(MultipartFile productImage) {
		this.productImage = productImage;
	}
	
	
}
