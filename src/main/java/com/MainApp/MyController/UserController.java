package com.MainApp.MyController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.MainApp.Pojo.AdminInfo;
import com.MainApp.Pojo.Cart;
import com.MainApp.Pojo.Products;
import com.MainApp.Pojo.Usersinfo;
import com.MainApp.Repository.CartRepository;
import com.MainApp.Repository.ProductsRepository;
import com.MainApp.Repository.UsersinfoRepository;

import ch.qos.logback.core.model.Model;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.transaction.Transactional;

@Controller
@Transactional
public class UserController {
	
	@Autowired
	ProductsRepository pRepo;
	
	@Autowired
	UsersinfoRepository uRepo;
	
	@Autowired
	CartRepository cRepo;
	
	
	
	@RequestMapping("/")
	public ModelAndView homepage() {
		ModelAndView mv = new ModelAndView("userhome");
		List<Products> plist = pRepo.findAll();
		mv.addObject("plist", plist);
		return mv;
	}
	
	@RequestMapping("/search")
	public ModelAndView searchByCat(@RequestParam("category") String category,@RequestParam("uname") String uname) {
		
		
		List<Products> plist = pRepo.findByCategory(category);
		
		if(uname.equals("null")) {
			ModelAndView mv = new ModelAndView("category");
			mv.addObject("plist", plist);
			mv.addObject("cat",category);
			return mv;
		}
		else {
			ModelAndView mv = new ModelAndView("category");
			mv.addObject("plist", plist);
			mv.addObject("check",uname);
			mv.addObject("cat",category);
			return mv;
		}
		
	}
	
	@RequestMapping("/usersignup")
	public ModelAndView userSignup(@ModelAttribute Usersinfo ui) {
		
		Usersinfo uitemp = uRepo.findByUname(ui.getUname());
		
			
			if(uitemp==null){
				uRepo.save(ui);
				return new ModelAndView("userlogin","umsg","Account Created Successfully");
			}
			else {
				return new ModelAndView("usersignup","umsg1","Username is already exist");
			}
	}
	
	@RequestMapping("/userlogin")
	public ModelAndView userLogin(@RequestParam("uname") String uname,@RequestParam("upass") String upass) {
		Usersinfo uitemp = uRepo.findByUnameAndUpass(uname, upass);
		List<Cart> cl =  cRepo.findByUname(uname);
		if(uitemp!=null) {
			ModelAndView mv1 = new ModelAndView("userhome","check",uname);
			List<Products> plist = pRepo.findAll();
			mv1.addObject("cl", cl);
			mv1.addObject("plist", plist);
			return mv1;
		}else {
			ModelAndView mv2 = new ModelAndView("userlogin","umsg1","Invalid username or password");
			return mv2;
		}
	}
	
	@RequestMapping("/pinfo")
	public ModelAndView pinformation(@RequestParam("pname") String pname ,@RequestParam("adname") String adname,@RequestParam("uname") String uname,@RequestParam("quantity") String quantity) {
		
		Products p = pRepo.findByPname(pname);
		List<Products> plist = pRepo.findAll();
		List<Cart> cl =  cRepo.findByUname(uname);
		if(uname.equals("null")) {
			ModelAndView mv1 = new ModelAndView("productinfo");
			mv1.addObject("cl", cl);
			mv1.addObject("plist", plist);
			mv1.addObject("product",p);
			return mv1;
		}
		ModelAndView mv = new ModelAndView("productinfo");
		mv.addObject("check",uname);
		mv.addObject("cl", cl);
		mv.addObject("plist", plist);
		mv.addObject("product",p);
		return mv;
		
	}
	
	
	@RequestMapping("/addtocart")
	public ModelAndView paddtocart(@ModelAttribute Cart c) {
		cRepo.save(c);
		List<Products> plist = pRepo.findAll();
		List<Cart> cl =  cRepo.findByUname(c.getUname());
		ModelAndView mv = new ModelAndView("userhome");
		mv.addObject("check",c.getUname());
		mv.addObject("cl", cl);
		mv.addObject("plist", plist);
		return mv;
	}
	
	
	
	@RequestMapping("/deletecartp")
	public ModelAndView deleteCartp(@RequestParam("cid") int cid,@RequestParam("uname") String uname) {
		
		cRepo.deleteByCid(cid);
		List<Cart> cl =  cRepo.findByUname(uname);
		List<Products> plist = pRepo.findAll();
		ModelAndView mv = new ModelAndView("userhome");
		mv.addObject("cl", cl);
		mv.addObject("plist", plist);
		mv.addObject("check",uname);
		return mv;
		
	}
	
	@RequestMapping("/uhome")
	public ModelAndView userHome(@RequestParam("uname") String uname) {
		
		List<Products> plist = pRepo.findAll();
		List<Cart> cl =  cRepo.findByUname(uname);
		if(uname.equals("null")) {
			ModelAndView mv = new ModelAndView("userhome");
			mv.addObject("plist", plist);
			return mv;
		}else {
			ModelAndView mv = new ModelAndView("userhome");
			mv.addObject("check",uname);
			mv.addObject("cl", cl);
			mv.addObject("plist", plist);
			return mv;
		}
	}
	
	
	
	
	
}
