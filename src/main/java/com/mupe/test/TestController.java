package com.mupe.test;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TestController {

	@ResponseBody
	@RequestMapping("/test1")
	public String test1() {
		return "Hello world!";
	}
	
	@RequestMapping("/2")
	@ResponseBody
	public Map<String, Object> quiz01_2() {
		Map<String, Object> scoreMap = new HashMap<>();
		scoreMap.put("국어", 80);
		scoreMap.put("수학", 90);
		scoreMap.put("영어", 85);
		return scoreMap;
	}
	
	@RequestMapping("/test3")
	public String test3() {
		return "test/test1";
	}
}
