package com.yc.zxd.mapper;

import java.util.List;

import com.yc.zxd.entity.Express;
import com.yc.zxd.entity.ExpressType;
import com.yc.zxd.entity.PaginationBean;

public interface ExpressMapper {

	PaginationBean<Express> getExpressPagination(PaginationBean<Express> expressBean);

	List<ExpressType> typeList();

	PaginationBean<Express> getExpressTypePagination(PaginationBean<Express> expressBean);

	PaginationBean<Express> getOrderPagination(PaginationBean<Express> orderBean);

	Express findDU(int did);

	PaginationBean<Express> getWOrderPagination(PaginationBean<Express> orderBean);
	PaginationBean<Express> searchOrder( PaginationBean<Express> expressBean  );

	
}
