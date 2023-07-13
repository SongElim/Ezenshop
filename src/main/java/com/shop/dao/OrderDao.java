package com.shop.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.shop.dto.orderDto;

@Mapper
public interface OrderDao {

	// 상품주문
	@Insert("insert into orderProc(uid,uname,goodsCode,goodsName,goodsSize,goodsColor,goodsPrice,adress,phonenum,paymentType,filename)"
			+ " values (#{uid}, #{uname}, #{goodsCode}, #{goodsName}, #{goodsSize}, #{goodsColor}, #{goodsPrice}, #{adress}, #{phonenum}, #{paymentType}, #{filename})")
	public void mtdOrder(Map<String, Object> map);

	// 전체 주문수
	@Select("select count(*) from orderProc")
	public int orderTotalCnt();

	// 주문목록1
	@Select("select * from orderProc order by num desc")
	public List<orderDto> orderList();

	// 주문검색
	@Select("select * from orderProc where ${param1} like CONCAT('%',#{param2},'%')")
	public List<orderDto> orderListSrc(String keyField, String keyWord);

}
