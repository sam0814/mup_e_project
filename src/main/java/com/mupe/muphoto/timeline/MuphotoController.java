package com.mupe.muphoto.timeline;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mupe.muphoto.timeline.bo.TimelineBO;
import com.mupe.muphoto.timeline.domain.CardView;

@RequestMapping("/timeline")
@Controller
public class MuphotoController {

	@Autowired
	private TimelineBO timelineBO;

	@GetMapping("/mup_photo_list_view")
	public String muphotoListView(Model model, HttpSession session) {
		Integer userId = (Integer)session.getAttribute("userId");
		
		List<CardView> cardList = timelineBO.generateCardViewList(userId);
		model.addAttribute("cardList", cardList);
		model.addAttribute("view", "muphoto/mup_photo_page");
		return "muphoto/mup_photo_page";
	}
}
