package com.shop.svcimp;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.dao.OrderDao;
import com.shop.dto.orderDto;
import com.shop.svc.OrderSvc;

@Service
public class OrderSvcImp implements OrderSvc {

	@Autowired
	OrderDao orderDao;

	@Override
	public void mtdOrder(HttpServletRequest req) {
		Map<String, Object> map = new HashMap<>();
		map.put("uid", req.getParameter("uid"));
		map.put("uname", req.getParameter("uname"));
		map.put("goodsCode", req.getParameter("goodsCode"));
		map.put("goodsName", req.getParameter("goodsName"));
		map.put("goodsColor", req.getParameter("goodsColor"));
		map.put("goodsSize", req.getParameter("goodsSize"));
		map.put("goodsPrice", Integer.parseInt(req.getParameter("goodsPrice")));
		map.put("adress", req.getParameter("adress"));
		map.put("phonenum", req.getParameter("phonenum"));
		map.put("paymentType", req.getParameter("paymentType"));
		map.put("filename", req.getParameter("filename"));
		orderDao.mtdOrder(map);
	}

	// 전체 주문수 -지원
	@Override
	public int orderTotalCnt() {
		return orderDao.orderTotalCnt();
	}

	// 전체 주문목록 조회 - 지원
	@Override
	public List<orderDto> orderList() {
		return orderDao.orderList();
	}

	// 전체 주문목록 중 검색 - 지원
	@Override
	public List<orderDto> orderListSrc(String keyField, String keyWord) {
		return orderDao.orderListSrc(keyField, keyWord);
	}

}
