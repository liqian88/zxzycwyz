package com.jiabin.controller;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jiabin.entity.*;
import com.jiabin.service.ShopCartService;
import com.jiabin.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jiabin.service.ZycService;
import com.jiabin.util.ResponseUtil;

import net.sf.json.JSONObject;


@Controller
@RequestMapping("/shopping")
public class ShoppingController {

	@Resource
	private ZycService zycService;
	@Resource
	private UserService userService;
	@Resource
	private ShopCartService shopCartService;

	/**
	 * 跳转到购物车页面
	 *
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/buyPage")
	public ModelAndView buyPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		User currentUser = (User) session.getAttribute("currentUser");
		if(currentUser==null){
			mav.addObject("mainPage", "index.jsp");
			mav.setViewName("mainTemp");
			return mav;
		}
		else {
			List<ShopCart> shopCart = new ArrayList<ShopCart>();


			shopCart = shopCartService.findByUid11(currentUser.getId());

			List<ShoppingCartItem> shoppingCartItem = new ArrayList<ShoppingCartItem>();


			ShoppingCart shoppingCart = new ShoppingCart();
			shoppingCart.setUserId(currentUser.getId());
			if (shopCart != null) {
				for (ShopCart sc : shopCart) {
					ShoppingCartItem spci = new ShoppingCartItem();
					spci.setId(sc.getId());
					spci.setZyc(zycService.findById(sc.getZid()));
					spci.setCount(sc.getCount());
					shoppingCartItem.add(spci);
//				 System.out.println(spci.getId()+" "+spci.getZyc().getName()+" "+spci.getCount());
//				 System.err.println(sc.getId()+" "+zycService.findById(sc.getZid())+" "+sc.getCount());

				}
//			 for (ShoppingCartItem sc : shoppingCartItem)
//			 {
//				 System.out.println(sc.getId()+" "+sc.getZyc().getName()+" "+sc.getCount());
//			 }
				shoppingCart.setShoppingCartItems(shoppingCartItem);
//			 System.err.println(shoppingCart.toString());
			}
//		if(shoppingCart==null){
//			shoppingCart=new ShoppingCart();
//			//User currentUser=(User) session.getAttribute("currentUser");
//			if (currentUser!=null) {
//				shoppingCart.setUserId(currentUser.getId());
//			}
//		}
			session.setAttribute("shoppingCart", shoppingCart);
			mav.addObject("title", "万药斋-购物车");
			mav.addObject("mainPage", "shopping/shopping.jsp");
			mav.setViewName("mainTemp");
			return mav;
		}
	}

	/**
	 * 将一本书添加到购物车，然后跳转到购物车页面
	 *
	 * @param zycId
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/zycToCartAndGoBuy")
	public String zycToCartAndGoBuy(Integer zycId, HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		addZycToCart(zycId, session);

		return "redirect:/shopping/buyPage.do";
	}

	/**
	 * 将一本书放入购物车
	 *
	 * @param zycId
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/zycToCart")
	public String zycToCart(Integer zycId, HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		JSONObject result = new JSONObject();
		try {
			addZycToCart(zycId, session);

			result.put("success", true);
			ResponseUtil.write(response, result);
		} catch (Exception e) {
			result.put("errorInfo", true);
			try {
				ResponseUtil.write(response, e.toString());
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		return "redirect:/shopping/buyPage.do";
	}

	private void addZycToCart(Integer zycId, HttpSession session) {
		Zyc zyc = zycService.findById(zycId);
		//ShoppingCart shoppingCart=(ShoppingCart) session.getAttribute("shoppingCart");
//		if(shoppingCart==null){
//			shoppingCart=new ShoppingCart();
//			User currentUser=(User) session.getAttribute("currentUser");
//			shoppingCart.setUserId(currentUser.getId());
//		}
		User currentUser = (User) session.getAttribute("currentUser");
		List<ShopCart> shopCart = new ArrayList<ShopCart>();
		shopCart = shopCartService.findByUid11(currentUser.getId());

		List<ShoppingCartItem> shoppingCartItem = new ArrayList<ShoppingCartItem>();


		ShoppingCart shoppingCart = new ShoppingCart();
		shoppingCart.setUserId(currentUser.getId());
		if (shopCart != null) {
			for (ShopCart sc : shopCart) {
				ShoppingCartItem spci = new ShoppingCartItem();
				spci.setId(sc.getId());
				spci.setZyc(zycService.findById(sc.getZid()));
				spci.setCount(sc.getCount());
				shoppingCartItem.add(spci);
			}
			shoppingCart.setShoppingCartItems(shoppingCartItem);
		}
			List<ShoppingCartItem> shoppingCartItemList = shoppingCart.getShoppingCartItems();
			boolean flag = true;
			for (ShoppingCartItem scI : shoppingCartItemList) {
				if (scI.getZyc().getId() == zyc.getId()) {
				//	scI.setCount(scI.getCount() + 1);

					ShopCart shopCart1 = new ShopCart();
					shopCart1.setId(scI.getId());
					shopCart1.setUid(shoppingCart.getUserId());
					shopCart1.setZid(scI.getZyc().getId());
					shopCart1.setCount(scI.getCount() + 1);
					shopCartService.update(shopCart1);
					flag = false;
					break;
				}
			}

			if (flag) {
//				ShoppingCartItem shoppingCartItem1= new ShoppingCartItem();
//				shoppingCartItem1.setZyc(zyc);
//				shoppingCartItem1.setCount(1);
//				shoppingCartItemList.add(shoppingCartItem1);

				ShopCart shopCart1 = new ShopCart();
				//shopCart1.setId();
				shopCart1.setUid(shoppingCart.getUserId());
				shopCart1.setZid(zycId);
				shopCart1.setCount(1);
				shopCartService.addcart11(shopCart1);
			}
			session.setAttribute("shoppingCart", shoppingCart);
		}

		/**
		 * 修改购物车商品类
		 * @throws Exception
		 */
		@RequestMapping("/updateShoppingCartItem")
		public String updateShoppingCartItem (Integer zycId, Integer count, HttpServletRequest
		request, HttpServletResponse response)throws Exception {
			HttpSession session = request.getSession();
			Zyc zyc = zycService.findById(zycId);
			//ShoppingCart shoppingCart = (ShoppingCart) session.getAttribute("shoppingCart");
			User currentUser = (User) session.getAttribute("currentUser");
			List<ShopCart> shopCart = new ArrayList<ShopCart>();
			shopCart = shopCartService.findByUid11(currentUser.getId());

			List<ShoppingCartItem> shoppingCartItem = new ArrayList<ShoppingCartItem>();


			ShoppingCart shoppingCart = new ShoppingCart();
			shoppingCart.setUserId(currentUser.getId());
			if (shopCart != null) {
				for (ShopCart sc : shopCart) {
					ShoppingCartItem spci = new ShoppingCartItem();
					spci.setId(sc.getId());
					spci.setZyc(zycService.findById(sc.getZid()));
					spci.setCount(sc.getCount());
					shoppingCartItem.add(spci);
				}
				shoppingCart.setShoppingCartItems(shoppingCartItem);
			}
			List<ShoppingCartItem> shoppingCartItemList = shoppingCart.getShoppingCartItems();
			for (ShoppingCartItem scI : shoppingCartItemList) {
				if (scI.getZyc().getId() == zyc.getId()) {
					//scI.setCount(count);

					ShopCart shopCart1 = new ShopCart();
					shopCart1.setId(scI.getId());
					shopCart1.setUid(shoppingCart.getUserId());
					shopCart1.setZid(scI.getZyc().getId());
					shopCart1.setCount(count);
					shopCartService.update(shopCart1);

					break;
				}
			}
			session.setAttribute("shoppingCart", shoppingCart);
			JSONObject result = new JSONObject();
			result.put("success", true);
			ResponseUtil.write(response, result);

			return null;
		}
		/**
		 * 删除一条商品记录
		 * @return
		 * @throws Exception
		 */
		@RequestMapping("/removeShoppingCartItem")
		public String removeShoppingCartItem (Integer zycId, HttpServletRequest request)throws Exception {
			HttpSession session = request.getSession();
			//ShoppingCart shoppingCart = (ShoppingCart) session.getAttribute("shoppingCart");

			User currentUser = (User) session.getAttribute("currentUser");
			List<ShopCart> shopCart = new ArrayList<ShopCart>();
			shopCart = shopCartService.findByUid11(currentUser.getId());

			List<ShoppingCartItem> shoppingCartItem = new ArrayList<ShoppingCartItem>();


			ShoppingCart shoppingCart = new ShoppingCart();
			shoppingCart.setUserId(currentUser.getId());
			if (shopCart != null) {
				for (ShopCart sc : shopCart) {
					ShoppingCartItem spci = new ShoppingCartItem();
					spci.setId(sc.getId());
					spci.setZyc(zycService.findById(sc.getZid()));
					spci.setCount(sc.getCount());
					shoppingCartItem.add(spci);
				}
				shoppingCart.setShoppingCartItems(shoppingCartItem);
			}
			List<ShoppingCartItem> shoppingCartItemList = shoppingCart.getShoppingCartItems();
			for (int i = 0; i < shoppingCartItemList.size(); i++) {
				if (zycId == shoppingCartItemList.get(i).getZyc().getId()) {
					//shoppingCartItemList.remove(i);
					shopCartService.delete(shoppingCartItemList.get(i).getId());
					break;
				}
			}
			shoppingCart.setShoppingCartItems(shoppingCartItemList);
			session.setAttribute("shoppingCart", shoppingCart);
			return "redirect:/shopping/buyPage.do";
		}
	}

