package com.travel.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.cxf.helpers.IOUtils;
import org.apache.cxf.io.CachedOutputStream;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/travel/*")
public class TravelController {
	
	@GetMapping("/main")
	public String travelMain() {
		System.out.println("여행지찾기 접속");
		
		return "/travel/main";
	}
	//데이터 리스트 호출(메인)
	@GetMapping("/dataList")
	public void GetData_main(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("데이터 리스트");
        // TODO Auto-generated method stub
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
        
        String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=";
        String serviceKey = "XtoNqIEqToOMbwaM7hVcGQ9O5ZCbxXuo%2B3h8T0N4e7QqoiPAqCCzZmVNaSoLeGVo8d7Fctya%2BON9UEjEHP5jRg%3D%3D";
        String parameter = "";
//        serviceKey = URLEncoder.encode(serviceKey,"utf-8");
        PrintWriter out = response.getWriter();
        parameter = parameter + "&" + "numOfRows=10";
        parameter = parameter + "&" + "pageNo=1";
        parameter = parameter + "&" + "MobileOS=ETC";
        parameter = parameter + "&" + "pageNo=1&numOfRows=10";
        parameter = parameter + "&" + "MobileOS=ETC";
        parameter = parameter + "&" + "MobileApp=Travel";
        parameter = parameter + "&" + "ListYN=Y";
        parameter = parameter + "&" + "arrange=B";
        parameter = parameter + "&" + "contentTypeId=12";
        parameter = parameter + "&" + "areaCode=";
        parameter = parameter + "&" + "_type=json";
        
        
        addr = addr + serviceKey + parameter;
        URL url = new URL(addr);
        
        InputStream in = url.openStream(); 
        CachedOutputStream bos = new CachedOutputStream();
        IOUtils.copy(in, bos);
        in.close();
        bos.close();
        
        String data = bos.getOut().toString();        
        out.println(data);
        
        JSONObject json = new JSONObject();
        json.put("data", data);
    }
	
	@GetMapping("/view")
	public String travelView(@RequestParam("contentid")String contentid, HttpServletRequest req) {
		System.out.println("여행지 상세보기");
		
		return "/travel/view";
	}
	
	@GetMapping("/dataView")
	public void GetData_view(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
        
        String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=";
        String serviceKey = "XtoNqIEqToOMbwaM7hVcGQ9O5ZCbxXuo%2B3h8T0N4e7QqoiPAqCCzZmVNaSoLeGVo8d7Fctya%2BON9UEjEHP5jRg%3D%3D";
        String parameter = "";
//        serviceKey = URLEncoder.encode(serviceKey,"utf-8");
        PrintWriter out = response.getWriter();
        parameter = parameter + "&" + "contentId="+request.getParameter("contentid");
        parameter = parameter + "&" + "defaultYN=Y";
        parameter = parameter + "&" + "firstImageYN=Y";
        parameter = parameter + "&" + "addrinfoYN=Y";
        parameter = parameter + "&" + "overviewYN=Y";
        parameter = parameter + "&" + "mapinfoYN=Y";
        parameter = parameter + "&" + "MobileOS=ETC";
        parameter = parameter + "&" + "MobileApp=Travel";
        parameter = parameter + "&" + "_type=json";
        
        
        addr = addr + serviceKey + parameter;
        URL url = new URL(addr);
        
        InputStream in = url.openStream(); 
        CachedOutputStream bos = new CachedOutputStream();
        IOUtils.copy(in, bos);
        in.close();
        bos.close();
        
        String data = bos.getOut().toString();        
        out.println(data);
        
        JSONObject json = new JSONObject();
        json.put("data", data);
    }

}