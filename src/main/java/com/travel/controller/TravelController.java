package com.travel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/travel/*")
public class TravelController {
	
	@GetMapping("/main")
	public String travelMain() {
		
		System.out.println("여행지찾기 접속");
		return "/travel/main";
	}

}
