package com.MainApp.Repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.MainApp.Pojo.AddressAndProductInfo;

@Repository
public interface AddressAndProductInfoRepository extends CrudRepository<AddressAndProductInfo, Integer>{
	
	List<AddressAndProductInfo> findByUname(String uname);
	List<AddressAndProductInfo> findByAdname(String adname);
	
}
