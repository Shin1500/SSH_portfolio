package store.master;

import java.sql.Timestamp; //Timestamp 클래스를 import하여 날짜와 시간을 다룸

public class StoreDataBean {
	private int product_id; //상품의 고유 식별자
	private String product_kind; //상품 종류
	private String product_name; //상품 이름
	private int product_price; //상품 가격
	private short product_count; //상품 수량
	private short product_weight; //상품 무게
	private String publishing_com; //상품 제조사 이름
	private String publishing_date; //상품 제조 날짜
	private String product_image; //상품 이미지
	private byte discount_rate; //상품 할인율
	private Timestamp reg_date; //상품 등록 날짜
	
	public int getProduct_id() { //product_id변수 값을 반환하는 메서드
		return product_id;
	}
	public void setProduct_id(int product_id) { //매개변수 product_id를 입력받아 product_id변수에 값을 설정하는 메서드
		this.product_id = product_id;
	}
	public String getProduct_kind() { //product_kind변수 값을 반환하는 메서드
		return product_kind;
	}
	public void setProduct_kind(String product_kind) { //매개변수 product_kind를 입력받아 product_kind변수에 값을 설정하는 메서드
		this.product_kind = product_kind;
	}
	public String getProduct_name() { //product_name변수 값을 반환하는 메서드
		return product_name;
	}
	public void setProduct_name(String product_name) { //매개변수 product_name을 입력받아 product_name변수에 값을 설정하는 메서드
		this.product_name = product_name;
	}
	public int getProduct_price() { //product_price변수 값을 반환하는 메서드
		return product_price;
	}
	public void setProduct_price(int product_price) { //매개변수 product_price를 입력받아 product_price변수에 값을 설정하는 메서드
		this.product_price = product_price;
	}
	public short getProduct_count() { //product_count변수 값을 반환하는 메서드
		return product_count;
	}
	public void setProduct_count(short product_count) { //매개변수 product_count를 입력받아 product_count변수에 값을 설정하는 메서드
		this.product_count = product_count;
	}
	public short getProduct_weight() { //product_weight변수 값을 반환하는 메서드
		return product_weight;
	}
	public void setProduct_weight(short product_weight) { //매개변수 product_weight를 입력받아 product_weight변수에 값을 설정하는 메서드
		this.product_weight = product_weight;
	}
	public String getPublishing_com() { //publishing_com변수 값을 반환하는 메서드
		return publishing_com;
	}
	public void setPublishing_com(String publishing_com) { //매개변수 publishing_com를 입력받아 publishing_com변수에 값을 설정하는 메서드
		this.publishing_com = publishing_com;
	}
	public String getPublishing_date() { //publishing_date변수 값을 반환하는 메서드
		return publishing_date;
	}
	public void setPublishing_date(String publishing_date) { //매개변수 publishing_date를 입력받아 publishing_date변수에 값을 설정하는 메서드
		this.publishing_date = publishing_date;
	}
	public String getProduct_image() { //product_image변수 값을 반환하는 메서드
		return product_image;
	}
	public void setProduct_image(String product_image) { //매개변수 product_image를 입력받아 product_image변수에 값을 설정하는 메서드
		this.product_image = product_image;
	}
	public byte getDiscount_rate() { //discount_rate변수 값을 반환하는 메서드
		return discount_rate;
	}
	public void setDiscount_rate(byte discount_rate) { //매개변수 discount_rate를 입력받아 discount_rate변수에 값을 설정하는 메서드
		this.discount_rate = discount_rate;
	}
	public Timestamp getReg_date() { //reg_date변수 값을 반환하는 메서드
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) { //매개변수 reg_date를 입력받아 reg_date변수에 값을 설정하는 메서드
		this.reg_date = reg_date;
	}
	
}