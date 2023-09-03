package com.mupe.mupstar;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mupe.admin.bo.MovieBO;
import com.mupe.admin.domain.Movie;
import com.mupe.mupstar.bo.StarBO;
import com.mupe.mupstar.domain.MupStar;

@RequestMapping("/star")
@Controller
public class MupstarController {
	
	@Autowired
	private MovieBO movieBO;
	
	@Autowired
	private StarBO starBO;
	

	@GetMapping("/movie_list_view")
	public String movieListView(Model model, HttpSession session) {
		
		// 로그인 여부 조회
		Integer userId = (Integer)session.getAttribute("userId");
		if (userId == null) {
			//비로그인이면 로그인 페이지로 이동
			return "redirect:/user/sign_in_view";
		}
		
		// DB 글 목록 조회
		List<Movie> movieList = movieBO.getPostList();
		
		model.addAttribute("movieList", movieList);
		model.addAttribute("view", "mupstar/mupstar_board");
		
		return "mupstar/mupstar_board";
	}
	
	@GetMapping("/movie_star_view")
	public String movieStarView(Model model,
			@RequestParam(value="id",required=false) Integer id,
			@RequestParam(value="movieId",required=false) Integer movieId) {
		
		// DB 글 목록 조회
		Movie movie = movieBO.getPostById(id);
		
		model.addAttribute("movie", movie);
		model.addAttribute("star", "mupstar/mupstar_board_detail");
				
		
		return "mupstar/mupstar_board_detail";
	}
	
	@GetMapping("/movie_star_result_view")
	public String movieStarResultView(Model model,
			HttpSession session,
			@RequestParam("movieId") String movieId) {
		
		int id = (int) session.getAttribute("userId");
		
		// DB 글 목록 조회
		 int mup = Integer.parseInt(movieId);
		 List<MupStar> starList = starBO.getStarListByMovieId(mup);
		 
		Movie movie = movieBO.getPostById(mup);
		int star = starBO.getStar(mup, id);
				
		model.addAttribute("starList", starList);
		model.addAttribute("movie", movie);
		model.addAttribute("star", star);
		
		return "mupstar/mupstar_board_detail_result";
	}
}
