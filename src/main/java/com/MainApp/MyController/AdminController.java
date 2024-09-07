package com.MainApp.MyController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.MainApp.Pojo.AddressAndProductInfo;
import com.MainApp.Pojo.AdminInfo;
import com.MainApp.Pojo.Products;
import com.MainApp.Repository.AddressAndProductInfoRepository;
import com.MainApp.Repository.AdminInfoRepository;
import com.MainApp.Repository.ProductsRepository;

@Controller
public class AdminController {
	
	@Autowired
	ProductsRepository pRepo;
	
	@Autowired
	AdminInfoRepository aRepo;
	
	@Autowired
	AddressAndProductInfoRepository apiRepo;
	
	@RequestMapping("/adminpanel")
	public String admin() {
		
		return "adminlogin";
	}
	
	@RequestMapping("/adminsignup")
	public ModelAndView adminSignup(@ModelAttribute AdminInfo ai) {
		
		AdminInfo adtemp = aRepo.findByUname(ai.getUname());
		
		if(ai.getScode().equals("admin_001")) {
			
			if(adtemp==null){
				aRepo.save(ai);
				return new ModelAndView("adminlogin","amsg","Account Created Successfully");
			}
			else {
				return new ModelAndView("adminsignup","amsg1","Sorry,Account Creation Failed");
			}
			
		}else {
			return new ModelAndView("adminsignup","amsg1","Security code not match");
		}
		
		
	}
	
	@RequestMapping("/adminlogin")
	public ModelAndView adminLogin(@RequestParam("uname") String uname,@RequestParam("upass") String upass) {
		AdminInfo adtemp = aRepo.findByUnameAndUpass(uname, upass);
		if(adtemp!=null) {
			List<Products> list = pRepo.findByUname(uname); //adname
			List<AddressAndProductInfo> apil = apiRepo.findByAdname(uname); //adname
			ModelAndView mv1 = new ModelAndView("adminhome");
			mv1.addObject("check",uname);
			mv1.addObject("pl", list);
			mv1.addObject("apil", apil);
			return mv1;
		}else {
			ModelAndView mv2 = new ModelAndView("adminlogin","amsg1","Invalid username or password");
			return mv2;
		}
	}
	
	

	
}
