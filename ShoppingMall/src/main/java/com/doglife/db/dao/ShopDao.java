package com.doglife.db.dao;

import java.util.List;

import com.doglife.db.dto.CartDto;
import com.doglife.db.dto.ProductDto;
import com.doglife.db.dto.ProductFileDto;
import com.doglife.db.dto.ProductListDto;
import com.doglife.db.dto.ShopReplyDto;

public interface ShopDao {
	
	//신제품 목록 가져오기
	public List<ProductDto> selectNewProductList(ProductListDto pNum);
	
	public List<ProductDto> selectBestProductList(ProductListDto pNum);
	
	
	//게시글 목록 가져오기
	public List<ProductDto> selectProductList(ProductListDto pNum); 
	public List<ProductDto> selectClothesList(ProductListDto pNum);
	
	//전체 글개수 구하기
	public int bcntSelect(ProductListDto productList);
	
	//게시글 내용 가져오기
	public ProductDto selectProductInfo(Integer pnum);
	
	//파일 목록 가져오기
	public List<ProductFileDto> selectProductFile(Integer pnum);
	
	public List<ShopReplyDto> selectProductReply(Integer pnum);
	
	public List<CartDto> selectCartList(String customerID);
	
	
	
	
	
	
	
	
	
	
	
	
}
