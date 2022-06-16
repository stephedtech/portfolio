package com.doglife.db.dto;

import lombok.Data;

@Data
public class ProductListDto {
	private String colname;
	private String keyword;
	private int pageNum;
	private int listCnt;
}
