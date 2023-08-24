package com.mupe.mupstar.domain;

import java.time.ZonedDateTime;

import lombok.Data;
import lombok.ToString;

@ToString
@Data
public class MupStar {

	private int movieId;
	private int userId;
	private int startCount;
	private ZonedDateTime createdAt;
	private ZonedDateTime updatedAt;
}
