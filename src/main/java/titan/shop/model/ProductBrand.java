package titan.shop.model;

import javax.annotation.Generated;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "productbrand")
public class ProductBrand {
	@Id
	@GeneratedValue(strategy =GenerationType.IDENTITY)
	private int productBrandId;
	@Column(name = "name")
	private String name;
	@Column(name = "image")
	private String image;
	@JsonIgnore
	@ManyToOne
	@JoinColumn(name = "productCategoriesId")
	private ProductCategories productCategories;
	
	public int getProductBrandId() {
		return productBrandId;
	}
	public void setProductBrandId(int productBrandId) {
		this.productBrandId = productBrandId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public ProductCategories getProductCategories() {
		return productCategories;
	}
	public void setProductCategories(ProductCategories productCategories) {
		this.productCategories = productCategories;
	}
	public ProductBrand(int productBrandId, String name, String image, ProductCategories productCategories) {
		super();
		this.productBrandId = productBrandId;
		this.name = name;
		this.image = image;
		this.productCategories = productCategories;
	}
	public ProductBrand() {
		super();
	}
	
}