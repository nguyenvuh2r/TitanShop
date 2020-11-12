package titan.shop.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import titan.shop.dao.ProductCategoriesDao;
import titan.shop.model.ProductCategories;
import titan.shop.service.ProductCategoriesService;
@Service
public class ProductCategoriesServiceImpl implements ProductCategoriesService {
	@Autowired
	private ProductCategoriesDao pcd;
	
	@Override
	public void save(ProductCategories entites) {
		// TODO Auto-generated method stub
		pcd.save(entites);
	}

	@Override
	public void update(ProductCategories entites) {
		// TODO Auto-generated method stub
		pcd.save(entites);
	}

	@Override
	public void delete(ProductCategories entites) {
		// TODO Auto-generated method stub
		pcd.delete(entites);
	}

	@Override
	public List<ProductCategories> getAll() {
		// TODO Auto-generated method stub
		return pcd.findAll();
	}

	@Override
	public ProductCategories getOne(int id) {
		// TODO Auto-generated method stub
		return pcd.getOne(id);
	}

}
