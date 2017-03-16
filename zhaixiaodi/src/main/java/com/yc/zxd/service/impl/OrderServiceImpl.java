package com.yc.zxd.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.zxd.entity.Applyorder;
import com.yc.zxd.entity.Order;
import com.yc.zxd.entity.ProOrder;
import com.yc.zxd.mapper.OrderMapper;
import com.yc.zxd.service.OrderService;

@Service("orderService")
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderMapper orderMapper;

	
	@Override
	public boolean order(Order ord) {
		
		return orderMapper.order(ord);
	}

	@Override
	public boolean addzaccept(Applyorder applyorder) {
		// TODO Auto-generated method stub
		return orderMapper.addzaccept(applyorder);
	}

	@Override
	public List<ProOrder> getapporderbyoid(Integer oid) {
		// TODO Auto-generated method stub
		return orderMapper.getapporderbyoid(oid);
	}

	@Override
	public boolean addorder(Integer aid) {
		// TODO Auto-generated method stub
		return orderMapper.addorder(aid);
	}

	@Override
	public boolean updatezac(Integer aid) {
		// TODO Auto-generated method stub
		return orderMapper.updatezac(aid);
	}

	@Override
	public boolean deletezac(Integer oid) {
		// TODO Auto-generated method stub
		return orderMapper.deletezac(oid);
	}

	@Override
	public List<Order> getzordersByuuid(Integer uuid) {
		// TODO Auto-generated method stub
		return orderMapper.getzordersByuuid(uuid);
	}

	@Override
	public boolean updateorder(Integer oid) {
		// TODO Auto-generated method stub
		return orderMapper.updateorder(oid);
	}

	@Override
	public List<Order> zxdgetordersbyuuid(Integer uuid) {
		// TODO Auto-generated method stub
		return orderMapper.zxdgetordersbyuuid(uuid);
	}


}
