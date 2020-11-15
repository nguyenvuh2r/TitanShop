package titan.shop.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "productvariants")
public class ProductVariant implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int productVariantsId; 
	@Column(name = "variant")
	private String variant;
	@ManyToOne
	@JoinColumn(name = "productCategoriesId")
	private ProductCategories productCategories;
	
	public int getProductVariantsId() {
		return productVariantsId;
	}

	public void setProductVariantsId(int productVariantsId) {
		this.productVariantsId = productVariantsId;
	}

	public String getVariant() {
		return variant;
	}

	public void setVariant(String variant) {
		this.variant = variant;
	}

	public ProductCategories getProductCategories() {
		return productCategories;
	}

	public void setProductCategories(ProductCategories productCategories) {
		this.productCategories = productCategories;
	}

	public ProductVariant(int productVariantsId, String variant, ProductCategories productCategories) {
		super();
		this.productVariantsId = productVariantsId;
		this.variant = variant;
		this.productCategories = productCategories;
	}
	public ProductVariant() {}
	
}	
