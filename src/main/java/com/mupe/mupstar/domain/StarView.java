package com.mupe.mupstar.domain;

import com.mupe.muphoto.post.entity.PostEntity;
import com.mupe.user.entity.UserEntity;

import lombok.Data;

@Data
public class StarView {

	private PostEntity postEntity;
	
	// 글쓴이
	private UserEntity user;
	
	// 별들 개수
	private int starCount;
			
	// 내가 별을 눌렀는지 여부
	private boolean filledStar;
}
