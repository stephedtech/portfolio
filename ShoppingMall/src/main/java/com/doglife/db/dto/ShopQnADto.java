package com.doglife.db.dto;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class ShopQnADto {
	private int sqNum;
	private String sqQuestion;
	private String sqAnswer;
	private String sqStatus;
	private String sqCategory;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
	private Timestamp qDate;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
	private Timestamp aDate;
	private int pNum;
	private String customerID;
}
