package com.MainApp.MyController;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.internal.build.AllowSysOut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.MainApp.Pojo.AddressAndProductInfo;
import com.MainApp.Pojo.Orders;
import com.MainApp.Pojo.Products;
import com.MainApp.Repository.AddressAndProductInfoRepository;
import com.MainApp.Repository.OrdersRepository;
import com.MainApp.Repository.ProductsRepository;

import jakarta.transaction.Transactional;

@Controller
@Transactional
public class OrderController {
	
	@Autowired
	ProductsRepository pRepo;
	
	@Autowired
	OrdersRepository oRepo;
	
	@Autowired
	AddressAndProductInfoRepository apiRepo;
	
	
	
	@RequestMapping("/order")
	public ModelAndView addorder(@ModelAttribute Orders or) {
		int q = Integer.valueOf(or.getQuantity());
		int p = Integer.valueOf(or.getPrice());
		int tp = p*q;
		String tprice = String.valueOf(tp);
		or.setPrice(tprice);
		oRepo.save(or);
		List<Orders> ol = oRepo.findByUname(or.getUname());
		ModelAndView mv = new ModelAndView("buypage");
		mv.addObject("ol", ol);
		mv.addObject("check",or.getUname());
		
		return mv;
	}
	
	@RequestMapping("/deleteorderp")
	public ModelAndView deleteorder(@RequestParam("oid") int oid,@RequestParam("uname") String uname) {
		oRepo.deleteById(oid);
		
		ModelAndView mv = new ModelAndView("buypage");
		List<Orders> ol = oRepo.findByUname(uname);
		mv.addObject("check",uname);
		mv.addObject("ol", ol);
		
		return mv;
	}
	
	@RequestMapping("/confirmorder")
	public ModelAndView confirmOrder(@RequestParam("pname") String pname, @RequestParam("username") String username,@RequestParam("quantity") String quantity,@RequestParam("pimg") String pimg,@RequestParam("tprice") String tprice,@RequestParam("adname") String adname){
		
		List<AddressAndProductInfo> col = apiRepo.findByUname(username);
		ModelAndView mv = new  ModelAndView("address");
		ArrayList<String> al = new ArrayList<>();
		al.add(username);
		al.add(pname);
		al.add(pimg);
		al.add(tprice);
		al.add(quantity);
		al.add(adname);
		
		mv.addObject("l",al);
		mv.addObject("col",col);
		mv.addObject("check",username);
		
		return mv;
	}
	
	@RequestMapping("/address")
	public ModelAndView address(@ModelAttribute AddressAndProductInfo api){
		
		apiRepo.save(api);
		
		Products p = pRepo.findByPname(api.getPname());
		int lquantity = Integer.valueOf(p.getPquant());
		int cquantity = Integer.valueOf(api.getQuantity());
		int fqy =  lquantity-cquantity;
		p.setPquant(String.valueOf(fqy));
		pRepo.save(p);
		
		List<AddressAndProductInfo> col = apiRepo.findByUname(api.getUname());
		ModelAndView mv = new ModelAndView("address");
		mv.addObject("col",col);
		mv.addObject("check", api.getUname());
		return mv;
	}
	
	@RequestMapping("/vieworders")
	public ModelAndView viewOrders(@RequestParam("uname") String uname){
		List<AddressAndProductInfo> col = apiRepo.findByUname(uname);
		ModelAndView mv = new ModelAndView("address");
		mv.addObject("col",col);
		mv.addObject("check",uname);
		return mv;
	}


	
}
