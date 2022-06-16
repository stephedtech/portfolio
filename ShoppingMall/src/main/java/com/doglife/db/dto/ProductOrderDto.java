package com.doglife.db.dto;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class ProductOrderDto {
	private int poNum;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
	private Timestamp poDate;
	private String poStatus;
	private String customerID;
	private int pNum;
	private String option;
}
