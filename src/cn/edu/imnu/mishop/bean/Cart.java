package cn.edu.imnu.mishop.bean;

public class Cart {
	int goods_id;
	int goods_amout;
	double goods_price;
	String goods_cover;
	String goods_name;
	String goods_color;
	String goods_size;
	public int getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public String getGoods_color() {
		return goods_color;
	}
	public void setGoods_color(String goods_color) {
		this.goods_color = goods_color;
	}
	public String getGoods_size() {
		return goods_size;
	}
	public void setGoods_size(String goods_size) {
		this.goods_size = goods_size;
	}
	public int getGoods_amout() {
		return goods_amout;
	}
	public void setGoods_amout(int goods_amout) {
		this.goods_amout = goods_amout;
	}
	public double getGoods_price() {
		return goods_price;
	}
	public void setGoods_price(double goods_price) {
		this.goods_price = goods_price;
	}
	public String getGoods_cover() {
		return goods_cover;
	}
	public void setGoods_cover(String goods_cover) {
		this.goods_cover = goods_cover;
	}
}
