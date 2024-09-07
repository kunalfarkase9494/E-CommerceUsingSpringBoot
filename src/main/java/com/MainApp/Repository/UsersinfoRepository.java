package com.MainApp.Repository;

import org.springframework.data.repository.CrudRepository;

import com.MainApp.Pojo.Usersinfo;

public interface UsersinfoRepository extends CrudRepository<Usersinfo, String>{
	
	Usersinfo findByUname(String uname);
	
	Usersinfo findByUnameAndUpass(String uname,String upass);
	
}
