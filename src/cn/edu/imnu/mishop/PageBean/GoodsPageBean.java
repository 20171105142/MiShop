package cn.edu.imnu.mishop.PageBean;

import java.util.ArrayList;
import java.util.List;

import cn.edu.imnu.mishop.bean.Goods;
import cn.edu.imnu.mishop.dao.GoodsDAO;



public class GoodsPageBean {
	private int pageSize = 20;
	private int pageNo = 1;
	private int totalPages;
	private List<Goods> pageDate = new ArrayList<Goods>();
	private boolean hasNextPage;
	private boolean hasPreviousPage;
	
	public int getTotalPages() {
		int recordCount = getTotalGoods();
		return (recordCount + pageSize - 1) / pageSize;
	}
	public int getTotalGoods() {
		GoodsDAO dao = new GoodsDAO();
		int recordCount = dao.getrecordCount();
		return recordCount;
	}
	public List<Goods> getPageDate() {
		GoodsDAO dao = new GoodsDAO();
		List<Goods> list = dao.getGoodsPageList(pageNo, pageSize);
		return list;
	}

	public boolean isHasPreviousPage() {
		return (this.getPageNo() > 1);
	}

	public boolean isHasNextPage() {
		return (this.getPageNo() < this.getTotalPages());
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	public void setPageDate(List<Goods> pageDate) {
		this.pageDate = pageDate;
	}

	public void setHasNextPage(boolean hasNextPage) {
		this.hasNextPage = hasNextPage;
	}

	public void setHasPreviousPage(boolean hasPreviousPage) {
		this.hasPreviousPage = hasPreviousPage;
	}
}
