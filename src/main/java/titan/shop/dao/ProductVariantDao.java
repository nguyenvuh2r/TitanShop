package titan.shop.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import titan.shop.model.Product;
import titan.shop.model.ProductVariant;
@Repository
public interface ProductVariantDao extends JpaRepository<ProductVariant, Integer>,PagingAndSortingRepository<ProductVariant, Integer> {

}
