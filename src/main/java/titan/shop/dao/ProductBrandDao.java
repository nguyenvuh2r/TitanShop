package titan.shop.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import titan.shop.model.ProductBrand;
@Repository
public interface ProductBrandDao extends JpaRepository<ProductBrand, Integer>  {

}
