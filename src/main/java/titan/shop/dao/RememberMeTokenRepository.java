package titan.shop.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

import titan.shop.model.PersistentLogin;
@org.springframework.stereotype.Repository
public interface RememberMeTokenRepository extends JpaRepository<PersistentLogin, Long> {

	PersistentLogin findBySeries(String series);
	List<PersistentLogin> findByUsername(String username);
	
}
