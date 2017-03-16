package com.yc.zxd.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.zxd.entity.Express;
import com.yc.zxd.entity.ExpressType;
import com.yc.zxd.entity.PaginationBean;
import com.yc.zxd.mapper.ExpressMapper;
import com.yc.zxd.service.ExpressService;

@Service("expressService")
public class ExpressServiceImpl implements ExpressService {

	@Autowired
	private ExpressMapper expressMapper;
	
	@Override
	public PaginationBean<Express> pageList(String currPage, String pageSize) {
		PaginationBean<Express> expressBean=new PaginationBean<Express>();
		if(currPage!=null){
			expressBean.setCurrPage(Integer.parseInt(currPage));
		}
		if(pageSize!=null){
			expressBean.setPageSize(Integer.parseInt(pageSize));
		}
		expressBean=expressMapper.getExpressPagination(expressBean);
		return expressBean;
	}

	@Override
	public List<ExpressType> typeList() {
		return expressMapper.typeList();
	}

	@Override
	public PaginationBean<Express> findType(String currPage, String pageSize, String otype) {
		PaginationBean<Express> expressBean=new PaginationBean<Express>();
		if(currPage!=null){
			expressBean.setCurrPage(Integer.parseInt(currPage));
		}
		if(pageSize!=null){
			expressBean.setPageSize(Integer.parseInt(pageSize));
		}
		expressBean.setOtype(otype);
		expressBean=expressMapper.getExpressTypePagination(expressBean);
		return expressBean;
	}

	@Override
	public PaginationBean<Express> orderlist(String currPage, String pageSize, String uuid) {
		PaginationBean<Express> orderBean=new PaginationBean<Express>();
		if(currPage!=null){
			orderBean.setCurrPage(Integer.parseInt(currPage));
		}
		if(pageSize!=null){
			orderBean.setPageSize(Integer.parseInt(pageSize));
		}
		orderBean.setUuid(uuid);
		orderBean=expressMapper.getOrderPagination(orderBean);
		return orderBean;
	}

	@Override
	public Express findDU(int did) {
		return expressMapper.findDU(did);
	}

	@Override
	public PaginationBean<Express> worderlist(String currPage, String pageSize, String uuid) {
		PaginationBean<Express> orderBean=new PaginationBean<Express>();
		if(currPage!=null){
			orderBean.setCurrPage(Integer.parseInt(currPage));
		}
		if(pageSize!=null){
			orderBean.setPageSize(Integer.parseInt(pageSize));
		}
		orderBean.setUuid(uuid);
		orderBean=expressMapper.getWOrderPagination(orderBean);
		return orderBean;
	}

	
	public PaginationBean<Express> searchOrder(String currPage,String pageSize,String orelname) {
		PaginationBean<Express> expressBean=new PaginationBean<Express>();
		if(currPage!=null){
			expressBean.setCurrPage(Integer.parseInt(currPage));
		}
		if(pageSize!=null){
			expressBean.setPageSize(Integer.parseInt(pageSize));
		}
		expressBean.setOtype(orelname);
		expressBean=expressMapper.searchOrder(expressBean);
		return expressBean;
	}

}
