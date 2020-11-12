package titan.shop.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import titan.shop.dao.ProductVariantDao;
import titan.shop.model.ProductVariant;
import titan.shop.service.ProductVariantService;
@Service
public class ProductVariantsServiceImpl implements ProductVariantService {
	@Autowired
	private ProductVariantDao pvd;
	@Override
	public void save(ProductVariant entites) {
		// TODO Auto-generated method stub
		pvd.save(entites);
	}

	@Override
	public void update(ProductVariant entites) {
		// TODO Auto-generated method stub
		pvd.save(entites);
	}

	@Override
	public void delete(ProductVariant entites) {
		// TODO Auto-generated method stub
		pvd.delete(entites);
	}

	@Override
	public List<ProductVariant> getAll() {
		// TODO Auto-generated method stub
		return pvd.findAll();
	}

	@Override
	public ProductVariant getOne(int id) {
		// TODO Auto-generated method stub
		return pvd.getOne(id);
	}

}
