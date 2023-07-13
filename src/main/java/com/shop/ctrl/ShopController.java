package com.shop.ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.shop.dao.GoodsRegDao;
import com.shop.svc.GoodsRegSvc;
import com.shop.svc.GoodsStockSvc;
import com.shop.svc.OrderSvc;
import com.shop.svc.ReviewSvc;
import com.shop.util.PagingVO;

@Controller
public class ShopController {

	@Autowired
	GoodsRegDao goodsRegDao;

	@Autowired
	GoodsRegSvc goodsRegSvc;

	@Autowired
	GoodsStockSvc goodsStockSvc;

	@Autowired
	ReviewSvc reviewSvc;

	@Autowired
	OrderSvc orderSvc;

	@RequestMapping("/")
	public String root(@SessionAttribute(name = "unameSession", required = false) String unameSession, Model model) {

		model.addAttribute("unameSession", unameSession);

		// 메인페이지 등록된 정보 불러오기
		model.addAttribute("goodsInfo", goodsRegDao.goodsRegList());

		return "index";
	}

	// 상품상세보기 페이지
	@RequestMapping("/productDetail")
	public String productDetail(HttpServletRequest req, Model model, HttpSession ses, PagingVO vo,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
		String goodsCode = req.getParameter("goodsCode");
		int total = reviewSvc.reviewCnt(goodsCode);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);

		model.addAttribute("uname", ses.getAttribute("unameSession"));

		model.addAttribute("goodsTotal", reviewSvc.reviewCnt(goodsCode));
		model.addAttribute("productDetail", goodsRegDao.productDetailDao(goodsCode));
		// 리뷰리스트 출력
		model.addAttribute("reviewList", reviewSvc.reviewList(goodsCode));
		model.addAttribute("imgList", reviewSvc.callImg(goodsCode));
		// 상품 색상, 사이즈
		model.addAttribute("goodsC", goodsStockSvc.goodsModColorList(goodsCode));
		String goodsColor = req.getParameter("goodsColor");
		if (goodsColor != null) {
			model.addAttribute("goodsS", goodsStockSvc.goodsDetailSize(goodsCode, goodsColor));
		}
		// 상품 상세이미지 출력 - 지원
		model.addAttribute("goodsDetailImg", goodsRegSvc.goodsDetailImg(goodsCode));
		return "shop/productDetail";
	}

	// 카테고리 상세보기 페이지
	@RequestMapping("/categoryDetail")
	public String categotyDetail() {
		return "shop/categoryDetail";
	}

	// 상품리뷰작성페이지
	@RequestMapping("/goodsReviewReg")
	public String goodsReviewReg(HttpServletRequest req, Model model, HttpSession ses) {

		String goodsCode = req.getParameter("goodsCode");
		System.out.println(goodsCode);
		model.addAttribute("unameSession", ses.getAttribute("unameSession"));
		model.addAttribute("goodsList", goodsRegSvc.goodsModList(goodsCode));

		return "/shop/productReviewReg";

	}

	// 상품리뷰 수정
	@RequestMapping("/reviewMod")
	public String reviewMod(HttpServletRequest req, Model model, HttpSession ses) {
		String goodsCode = req.getParameter("goodsCode");
		int ref = Integer.parseInt(req.getParameter("ref"));
		model.addAttribute("goodsList", goodsRegSvc.goodsModList(goodsCode));
		model.addAttribute("unameSession", ses.getAttribute("unameSession"));
		model.addAttribute("modList", reviewSvc.modList(ref));
		model.addAttribute("modImgList", reviewSvc.modImgList(ref));
		return "/shop/productReviewMod";
	}

	// 상품 리뷰 수정
	@RequestMapping("/reviewModProc")
	public String reviewModProc(@RequestParam("files") MultipartFile[] files, HttpServletRequest req) {

		String goodsCode = req.getParameter("goodsCode");
		System.out.println("goodsCode : " + goodsCode);
		int ref = Integer.parseInt(req.getParameter("ref"));
		System.out.println("ref : " + ref);
		reviewSvc.modProc(req);
		reviewSvc.modDel(ref);
		reviewSvc.reviewImgAdd(files, req, ref);

		return "redirect:productDetail?goodsCode=" + goodsCode;
	}

	// 상품리뷰등록
	@RequestMapping("/goodsReviewRegProc")
	public String goodsReviewRegProc(@RequestParam("files") MultipartFile[] files, HttpServletRequest req) {
		int ref = reviewSvc.reviewAdd(req);
		reviewSvc.reviewImgAdd(files, req, ref);

		return "redirect:productDetail?goodsCode=" + req.getParameter("goodsCode");

	}

	// 상품리뷰 삭제
	@RequestMapping("/reviewDel")
	public String reviewDel(HttpServletRequest req) {
		int ref = Integer.parseInt(req.getParameter("ref"));
		String goodsCode = req.getParameter("goodsCode");

		System.out.println("ref value : " + ref);

		reviewSvc.delRev(ref);
		reviewSvc.derRevImg(ref);

		return "redirect:productDetail?goodsCode=" + goodsCode;
	}

	// 상품구매 페이지
	@RequestMapping("/order")
	public String order(HttpServletRequest req, HttpSession ses, Model model) {

		String uid = (String) ses.getAttribute("uidSession");
		model.addAttribute("uid", uid);

		return "/shop/order";
	}

	// 상품구매 등록
	@RequestMapping("/orderProc")
	public String orderProc(HttpServletRequest req) {
		orderSvc.mtdOrder(req);

		return null;
	}

	// 관리자용 상품 주문 전체목록 보기 - 지원
	@RequestMapping("/adminOrderList")
	public String adminOrderList(HttpServletRequest req, Model model, PagingVO vo,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {

		int total = orderSvc.orderTotalCnt();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);

		model.addAttribute("goodsTotal", orderSvc.orderTotalCnt());

		String keyFiled = req.getParameter("keyFiled");
		String keyWord = req.getParameter("keyWord");

		if (keyWord == null || keyWord == "") {
			model.addAttribute("goodsRegList", orderSvc.orderList());
		} else {
			model.addAttribute("goodsRegList", orderSvc.orderListSrc(keyFiled, keyWord));
		}

		model.addAttribute("goodsCateList", goodsStockSvc.goodsCateList());
		model.addAttribute("goodsColorList", goodsStockSvc.goodsColorList());
		model.addAttribute("goodsSizeList", goodsStockSvc.goodsSizeList());

		return "admin/management/adminOrderList";
	}

}
