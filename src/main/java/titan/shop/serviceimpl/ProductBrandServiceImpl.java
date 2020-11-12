package titan.shop.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import titan.shop.dao.ProductBrandDao;
import titan.shop.model.ProductBrand;
import titan.shop.service.ProductBrandService;
	@Service
public class ProductBrandServiceImpl implements ProductBrandService {
	@Autowired
	private ProductBrandDao productBrandDao;
	@Override
	public void save(ProductBrand entites) {
		// TODO Auto-generated method stub
		productBrandDao.save(entites);
	}

	@Override
	public void update(ProductBrand entites) {
		// TODO Auto-generated method stub
		productBrandDao.save(entites);
	}

	@Override
	public void delete(ProductBrand entites) {
		// TODO Auto-generated method stub
		productBrandDao.delete(entites);
	}

	@Override
	public List<ProductBrand> getAll() {
		// TODO Auto-generated method stub
		return productBrandDao.findAll();
	}

	@Override
	public ProductBrand getOne(int  id) {
		// TODO Auto-generated method stub
		return productBrandDao.getOne(id);
	}

}
