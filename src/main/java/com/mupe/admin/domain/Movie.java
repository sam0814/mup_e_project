package com.mupe.admin.domain;

import java.time.ZonedDateTime;

import lombok.Data;
import lombok.ToString;

@ToString
@Data
public class Movie {
	
	private int id;
	private String subject;
	private String imagePath;
	private ZonedDateTime createdAt;
	private ZonedDateTime updatedAt;
}
