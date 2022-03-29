package titan.shop.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import titan.shop.dao.ProductDao;
import titan.shop.model.Product;
import titan.shop.service.ProductService;

@Service

public class ProductServiceImpl implements ProductService {

	private static final int PAGE_ELEMENT_SIZE_ADMIN=12;
	
	private static final int PAGE_ELEMENT_SIZE_CUSTOMER=12;
	
	@Autowired
	private ProductDao productDao;
	
	@Transactional()
	@Override
	public void addProduct(Product product) {
		
		productDao.save(product);
	}

	
	@Transactional(readOnly = true)
	@Override
	public Product getProductById(long productId) {
		
		return productDao.getOne(productId);
	}
	@Transactional()
	@Override
	public void updateProduct(Product product) {
		
		productDao.save(product);
		
	}
	@Transactional()
	@Override
	public void deleteProduct(long productId) {
		
		productDao.deleteById(productId);
		
	}

	@Transactional(readOnly = true)
	@Override
	public List<Product> getAllProduct() {
		
		return (List<Product>) productDao.findAll();
	}

	@Transactional(readOnly = true)
	@Override
	public Page<Product> getAllProduct(Integer pageNumber) {
		
		PageRequest pageRequest= PageRequest.of(pageNumber-1, PAGE_ELEMENT_SIZE_ADMIN);
		
		return productDao.findAll(pageRequest);
	}
	
	private Pageable createPageRequest(int pageNumber,int size) {
	    return  PageRequest.of(pageNumber,size);
	}
}
