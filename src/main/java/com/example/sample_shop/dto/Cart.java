package com.example.sample_shop.dto;

public class Cart {
	private String productId;	// 상품 아이디
	private Integer carCnt;		// 장바구니에 담은 개수
	
	public Cart(String productId, Integer carCnt) {
		this.productId = productId;
		this.carCnt = carCnt;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public Integer getCarCnt() {
		return carCnt;
	}

	public void setCarCnt(Integer carCnt) {
		this.carCnt = carCnt;
	}

	@Override
	public String toString() {
		return "장바구니 담기 \n상품 ID : [" + productId+ "]" + ", 상품의 개수 : " + carCnt + "개\n";
	}
	
	
}
