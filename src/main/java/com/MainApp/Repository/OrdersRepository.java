package com.MainApp.Repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.MainApp.Pojo.Orders;

@Repository
public interface OrdersRepository extends CrudRepository<Orders, Integer>{
	
	List<Orders> findByUname(String uname);
	void deleteByPname(String pname);
}
