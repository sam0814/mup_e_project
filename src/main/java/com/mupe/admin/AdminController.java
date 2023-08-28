package com.mupe.admin;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mupe.admin.bo.MovieBO;
import com.mupe.admin.domain.Movie;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private MovieBO movieBO; 

	
	@GetMapping("/admin_view")
	public String adminView(HttpSession session, Model model) {
		
		//DB 글(영화) 목록 조회
		Movie movieList = movieBO.getPostByPostId(0);
		
		model.addAttribute("movieList", movieList);
		model.addAttribute("view", "admin/admin");
		return "admin/admin";
	}
	
	
}
