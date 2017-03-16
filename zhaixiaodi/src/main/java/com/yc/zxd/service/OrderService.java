package com.yc.zxd.service;

import java.util.List;

import com.yc.zxd.entity.Applyorder;
import com.yc.zxd.entity.Order;
import com.yc.zxd.entity.ProOrder;

public interface OrderService {

	boolean order(Order ord);

	boolean addzaccept(Applyorder applyorder);

	List<ProOrder> getapporderbyoid(Integer oid);

	boolean addorder(Integer aid);

	boolean updatezac(Integer aid);

	boolean deletezac(Integer oid);

	List<Order> getzordersByuuid(Integer uuid);

	boolean updateorder(Integer oid);

	List<Order> zxdgetordersbyuuid(Integer uuid);

}
