package titan.shop.service;

import java.util.List;

public interface CrudService<T> {
	public void save(T entites);
	public void update(T entites);
	public void delete(T entites);
	public List<T> getAll();
	public T getOne(int  id);
	
}
