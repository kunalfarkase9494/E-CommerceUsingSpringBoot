package com.MainApp.Repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.MainApp.Pojo.Products;

public interface ProductsRepository extends CrudRepository<Products, String>{
	Products findByPname(String pname);
	List<Products> findByUname(String uname);
	List<Products> findAll();
	List<Products> findByCategory(String category);
}
