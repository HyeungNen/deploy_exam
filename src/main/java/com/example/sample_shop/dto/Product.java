package com.example.sample_shop.dto;
/*
1. 쇼핑몰
1) dto 패키지를 생성하고 이 패키지에 Product클래스를 생성
2) 생성된 Product 클래스에 다음과 같이 멤버 변수를 작성
3) 기본 생성자와 선언된 멤버 변수인 '상품아아디', '상품명', '가격'을 매개변수로 생성하는 생성자를 작성
4) 모든 멤버 Getter/Setter 메서드 작성

2. 자바빈즈로 사용할 상품데이터 접근 클래스 만들기
1) dao 패키지 생성하고 ProductRepository 클래스 생성
2) ProductRepository 작성

3. 상품 목록 표시하기

 */

public class Product {
	private String productId;		// 상품아이디
	private String productName;			// 상품명
	private Integer unitPrice;		// 상품가격
	private String description;		// 상품설명
	private String manufacturer;	// 제조사
	private String category;		// 분류
	private long unitInStock;		// 재고수
	private String condition;		// 신상품 or 중고품 or 재생품
	private String fileName;		// 파일네임
	
	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getProductId() {
		return productId;
	}

	public Product() {
		super();
	}
	
	public Product(String productId, String productName, Integer unitPrice) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.unitPrice = unitPrice;
	}
	
	public void setProductId(String productId) {
		this.productId = productId;
	}


	public String getProductName() {
		return productName;
	}


	public void setProductName(String productName) {
		this.productName = productName;
	}


	public Integer getUnitPrice() {
		return unitPrice;
	}


	public void setUnitPrice(Integer unitPrice) {
		this.unitPrice = unitPrice;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public String getManufacturer() {
		return manufacturer;
	}


	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}




	public long getUnitInStock() {
		return unitInStock;
	}

	public void setUnitInStock(long unitInStock) {
		this.unitInStock = unitInStock;
	}

	public String getCondition() {
		return condition;
	}


	public void setCondition(String condition) {
		this.condition = condition;
	}


	
	
	
}
