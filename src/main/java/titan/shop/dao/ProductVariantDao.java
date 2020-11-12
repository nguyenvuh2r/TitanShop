package titan.shop.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import titan.shop.model.ProductVariant;
@Repository
public interface ProductVariantDao extends JpaRepository<ProductVariant, Integer> {

}
