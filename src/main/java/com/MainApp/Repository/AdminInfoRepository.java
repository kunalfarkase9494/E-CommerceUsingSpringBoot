package com.MainApp.Repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.MainApp.Pojo.AdminInfo;

@Repository
public interface AdminInfoRepository extends CrudRepository<AdminInfo, String>{
	
	AdminInfo findByUname(String uname);
	
	AdminInfo findByUnameAndUpass(String uname,String upass);
	
}
