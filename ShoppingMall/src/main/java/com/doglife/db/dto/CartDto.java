package com.doglife.db.dto;

import lombok.Data;

@Data
public class CartDto {
	private int cartNum;
	private int pnum;
	private String customerID;
	private String option;
	private int quantity;
}
