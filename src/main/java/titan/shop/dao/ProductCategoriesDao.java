package titan.shop.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import titan.shop.model.ProductCategories;
@Repository
public interface ProductCategoriesDao extends JpaRepository<ProductCategories, Integer> {

}
