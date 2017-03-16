package com.yc.zxd.entity;

import java.util.List;

/**
 * 分页通用实体类
 * @author 雅竹
 *
 * @param <T>要分页数据对象的类型
 */
public class PaginationBean<T> {
	//分页的请求数据
	private Integer pageSize=4;//每页的记录数据
	private Integer currPage=1;//当前页
	
	private Integer totalPage;//总页数
	private Integer total;//数据的总条数
	private List<T> rows;//当前页的数据
	
	private String otype;
	private String uuid;
	
	public PaginationBean() {
	}

	public PaginationBean(Integer pageSize, Integer currPage) {
		super();
		this.pageSize = pageSize;
		this.currPage = currPage;
	}

	
	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getOtype() {
		return otype;
	}

	public void setOtype(String otype) {
		this.otype = otype;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getCurrPage() {
		return currPage;
	}

	public void setCurrPage(Integer currPage) {
		this.currPage = currPage;
	}

	public Integer getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	public List<T> getRows() {
		return rows;
	}

	public void setRows(List<T> rows) {
		this.rows = rows;
	}

	@Override
	public String toString() {
		return "PaginationBean [pageSize=" + pageSize + ", currPage=" + currPage + ", totalPage=" + totalPage
				+ ", total=" + total + ", rows=" + rows + ", otype=" + otype + ", uuid=" + uuid + "]";
	}

}
