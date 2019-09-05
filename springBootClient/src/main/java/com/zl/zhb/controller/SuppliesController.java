package com.zl.zhb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.zl.zhb.Service.ICompanyService;
import com.zl.zhb.Service.ISuppliesService;
import com.zl.zhb.pojo.Company;
import com.zl.zhb.pojo.Supplies;

@Controller
@RequestMapping("supplies")
public class SuppliesController {

	@Autowired
	private ISuppliesService suppliesService;
	@Autowired
	private ICompanyService companyService;
	
	
	@RequestMapping("findall")
	public String findall(Model model) {
		List<Supplies> supplies =suppliesService.findall();
		for (Supplies supplies2 : supplies) {
			System.out.println(supplies2.toString());
		}
		model.addAttribute("supplies", supplies);
		
		return "supplies_list";
	}
	
	@RequestMapping("main")
	public String  main(@RequestParam(value="currentPage",defaultValue="1",required=false)int currentPage,Model model){
		model.addAttribute("pagemsg", suppliesService.findByPage(currentPage));//回显分页数据
		List<Company> company =companyService.findall();
		model.addAttribute("company",company);
		return "supplies_list";
	}
	
	@RequestMapping("findbyname")
	public String findbyname(Model model,String supplies_name) {
		suppliesService.findbyname(supplies_name);
		System.out.println(suppliesService.findbyname(supplies_name).toString());
		
		return "supplies_list";
	}
}
