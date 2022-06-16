package com.doglife.db.dto;

import lombok.Data;

@Data
public class OptionDto {
	private int optionNum;
	private String option;
	private String choiceA;
	private String choiceB;
	private String choiceC;
	private int pNum;
}
