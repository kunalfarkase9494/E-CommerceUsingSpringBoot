package com.MainApp.MyController;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.codec.multipart.Part;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.MainApp.Pojo.AddressAndProductInfo;
import com.MainApp.Pojo.Products;
import com.MainApp.Repository.AddressAndProductInfoRepository;
import com.MainApp.Repository.CartRepository;
import com.MainApp.Repository.OrdersRepository;
import com.MainApp.Repository.ProductsRepository;

import ch.qos.logback.core.model.Model;
import jakarta.servlet.annotation.MultipartConfig;

@Controller
@MultipartConfig
public class ProductController {
	
	@Autowired
	ProductsRepository pRepo;
	
	@Autowired
	AddressAndProductInfoRepository apiRepo;
	
	@Autowired
	CartRepository cRepo;
	
	@Autowired
	OrdersRepository oRepo;
	
	@RequestMapping("/saveproduct")
	public ModelAndView saveProducts(@RequestPart("pfilename") MultipartFile part,@ModelAttribute Products p) throws IOException {
		
		String pfile = part.getOriginalFilename();
		p.setPfile(pfile);
		InputStream is = part.getInputStream();
		byte[] b = is.readAllBytes();
		
		String path = "C:\\Users\\Lenovo\\OneDrive\\Desktop\\SpringBoot\\E-Commerce\\src\\main\\webapp\\images\\"+pfile;
		FileOutputStream fos = new FileOutputStream(path);
		
		
		Products pro = pRepo.findByPname(p.getPname());
		if(pro==null){
			fos.write(b);
			pRepo.save(p);
			List<Products> list = pRepo.findByUname(p.getUname());
			List<AddressAndProductInfo> apil = apiRepo.findByAdname(p.getUname()); //adname
			ModelAndView mv = new  ModelAndView("adminhome");
			mv.addObject("check",p.getUname());
			mv.addObject("pl", list);
			mv.addObject("apil", apil);
			mv.addObject("msg", "Add Product Succussfully");
			return mv;
		}
		else {
			ModelAndView mv = new  ModelAndView("adminhome");
			mv.addObject("check",p.getUname());
			mv.addObject("msg", "Failed");
			return mv;
		}
		
	}
	
	
	
	@RequestMapping("/deletep")
	public ModelAndView deleteProduct(@RequestParam("pname") String pname,@RequestParam("uname") String uname) {
		ModelAndView mv = new ModelAndView("adminhome");
		List<AddressAndProductInfo> apil = apiRepo.findByAdname(uname); //adname
		mv.addObject("check", uname);
		pRepo.deleteById(pname);
		cRepo.deleteByPname(pname);
		oRepo.deleteByPname(pname);
		List<Products> list = pRepo.findByUname(uname);
		mv.addObject("pl", list);
		mv.addObject("apil", apil);
		return mv;
	}
	
	
	
	
}
