package com.mupe.mupick.domain;

import java.time.ZonedDateTime;

import lombok.Data;
import lombok.ToString;

@ToString
@Data
public class Mupick {

	private int id;
	private int userId;
	private String subject;
	private String content;
	private String imagePath;
	private ZonedDateTime createdAt;
	private ZonedDateTime updatedAt;
}
