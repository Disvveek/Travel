package com.travel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main/*")
public class MainController {
	
	@GetMapping("/index")
	public String main() {
		
		System.out.println("메인페이지 접속");
		return "/main/index";
		
	}

}