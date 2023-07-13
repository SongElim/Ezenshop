package com.shop.svc;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.shop.dto.orderDto;

public interface OrderSvc {

	// 상품주문
	public void mtdOrder(HttpServletRequest req);

	// 전체 주문수 -지원
	public int orderTotalCnt();

	// 주문 목록 전체보기 - 지원
	public List<orderDto> orderList();

	// 주문 목록 검색 - 지워
	public List<orderDto> orderListSrc(String keyFiled, String keyWord);

}
