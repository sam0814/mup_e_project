package com.mupe.mupick;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mupick")
public class MupickController {

	
	@GetMapping("/board_view")
	public String boardView(Model model) {
		model.addAttribute("view", "mupick/mupickBoard");
		return "mupick/mupick_board";
	}
	
	@GetMapping("board_writing_view")
	public String boardWritingView(Model model) {
		model.addAttribute("view", "mupick/mupickWriting");
		return "mupick/mupick_board_writing";
	}
}
