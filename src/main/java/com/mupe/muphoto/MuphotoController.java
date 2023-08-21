package com.mupe.muphoto;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/timeline")
@Controller
public class MuphotoController {


	@GetMapping("/mup_photo_list_view")
	public String muphotoListView() {
		return "/muphoto/mup_photo_page";
	}
}
