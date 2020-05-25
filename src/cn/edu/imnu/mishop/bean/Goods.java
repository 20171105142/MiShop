package cn.edu.imnu.mishop.bean;

public class Goods {
	int goods_id;
	String goods_name;
	String goods_price;
	String goods_cover;
	String goods_sale;
	String [] goods_color;
	String [] goods_size;
	String goods_stock;
	String goods_weight;
	String goods_identifier;
	String goods_listing;
	String [] goods_displayImages;
	String [] goods_productImages;
	String [] goods_detailImages;
	String [] goods_sizeAndTyrImages;
	String [] goods_modelImages;
	String [] goods_questionImages;
	String [] goods_enlargeDisplayImages;
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public String getGoods_price() {
		return goods_price;
	}
	public void setGoods_price(String goods_price) {
		this.goods_price = goods_price;
	}
	public String getGoods_cover() {
		return goods_cover;
	}
	public void setGoods_cover(String goods_cover) {
		this.goods_cover = goods_cover;
	}
	public String getGoods_sale() {
		return goods_sale;
	}
	public void setGoods_sale(String goods_sale) {
		this.goods_sale = goods_sale;
	}
	public int getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}
	public String [] getGoods_color() {
		return goods_color;
	}
	public void setGoods_color(String goods_color) {
		this.goods_color = goods_color.split("#");
	}
	public String [] getGoods_size() {
		return goods_size;
	}
	public void setGoods_size(String goods_size) {
		this.goods_size = goods_size.split("#");
	}
	public String getGoods_stock() {
		return goods_stock;
	}
	public void setGoods_stock(String goods_stock) {
		this.goods_stock = goods_stock;
	}
	public String getGoods_weight() {
		return goods_weight;
	}
	public void setGoods_weight(String goods_weight) {
		this.goods_weight = goods_weight;
	}
	public String getGoods_identifier() {
		return goods_identifier;
	}
	public void setGoods_identifier(String goods_identifier) {
		this.goods_identifier = goods_identifier;
	}
	public String getGoods_listing() {
		return goods_listing;
	}
	public void setGoods_listing(String goods_listing) {
		this.goods_listing = goods_listing;
	}
	public String [] getGoods_DisplayImages() {
		return goods_displayImages;
	}
	public void setGoods_DisplayImages(String goods_displayImages) {
		this.goods_displayImages = goods_displayImages.split("#");
	}
	public String[] getGoods_productImages() {
		return goods_productImages;
	}
	public void setGoods_productImages(String goods_productImages) {
		this.goods_productImages = goods_productImages.split("#");
	}
	public String[] getGoods_detailImages() {
		return goods_detailImages;
	}
	public void setGoods_detailImages(String goods_detailImages) {
		this.goods_detailImages = goods_detailImages.split("#");
	}
	public String[] getGoods_sizeAndTyrImages() {
		return goods_sizeAndTyrImages;
	}
	public void setGoods_sizeAndTyrImages(String goods_sizeAndTyrImages) {
		this.goods_sizeAndTyrImages = goods_sizeAndTyrImages.split("#");
	}
	public String[] getGoods_modelImages() {
		return goods_modelImages;
	}
	public void setGoods_modelImages(String goods_modelImages) {
		this.goods_modelImages = goods_modelImages.split("#");
	}
	public String[] getGoods_questionImages() {
		return goods_questionImages;
	}
	public void setGoods_questionImages(String goods_questionImages) {
		this.goods_questionImages = goods_questionImages.split("#");
	}
	public String[] getGoods_enlargeDisplayImages() {
		return goods_enlargeDisplayImages;
	}
	public void setGoods_enlargeDisplayImages(String goods_enlargeDisplayImages) {
		this.goods_enlargeDisplayImages = goods_enlargeDisplayImages.split("#");
	}
}
