package com.mupe.muphoto.post.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mupe.muphoto.post.entity.PostEntity;

public interface PostRepository extends JpaRepository<PostEntity, Integer>{

	public List<PostEntity> findAllByOrderByIdDesc();
	
	
}
