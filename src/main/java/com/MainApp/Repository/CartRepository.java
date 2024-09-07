package com.MainApp.Repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.MainApp.Pojo.Cart;

public interface CartRepository extends CrudRepository<Cart, Integer>{
	
	List<Cart> findByUname(String uname);
	void deleteByCid(int cid);
	void deleteByPname(String pname);
	
}
