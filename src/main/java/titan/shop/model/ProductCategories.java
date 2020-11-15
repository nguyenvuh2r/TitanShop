package titan.shop.model;

import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
@Entity
@Table(name = "productcategories")
public class ProductCategories {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int productCategoriesId;
	@Column(name = "name")
	private String name;
	
	@OneToMany(mappedBy = "productCategories",cascade =CascadeType.ALL )
	Set<ProductBrand> productBrand;
	@OneToMany(mappedBy = "productCategories",cascade =CascadeType.ALL )
	Set<ProductVariant> productVariant;
	public int getProductCategoriesId() {
		return productCategoriesId;
	}
	public void setProductCategoriesId(int productCategoriesId) {
		this.productCategoriesId = productCategoriesId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	

	public Set<ProductBrand> getProductBrand() {
		return productBrand;
	}
	

	public void setProductBrand(Set<ProductBrand> productBrand) {
		this.productBrand = productBrand;
	}
	public ProductCategories(int productCategoriesId, String name, Set<ProductBrand> productBrand) {
		super();
		this.productCategoriesId = productCategoriesId;
		this.name = name;
		this.productBrand = productBrand;
	}
	public ProductCategories() {
		super();
	}
	
}
