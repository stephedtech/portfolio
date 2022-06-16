package com.doglife.db.dto;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class ShopReviewDto {
	private int srnum;
	private String srtitle;
	private String srcontent;
	private int productRate;
	private String sysname;
	private String oriname;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
	private Timestamp regDate;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
	private Timestamp editDate;
	private int productNum;
	private String customerID;
	
}
