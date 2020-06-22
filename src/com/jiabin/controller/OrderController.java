package com.jiabin.controller;

import java.util.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jiabin.entity.*;
import com.jiabin.service.ShopCartService;
import com.jiabin.service.ZycService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jiabin.service.OrderZycService;
import com.jiabin.service.OrderService;
import com.jiabin.util.DateUtil;
import com.jiabin.util.ResponseUtil;
import com.jiabin.util.StringUtil;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Resource
	private OrderService orderService;
	
	@Resource
	private OrderZycService orderZycService;

	@Resource
	private ShopCartService shopCartService;

	@Resource
	private ZycService zycService;
	/**
	 * 结算
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/save")
	public ModelAndView save(HttpServletRequest request,HttpServletResponse response)throws Exception{
		ModelAndView mav=new ModelAndView();
		HttpSession session=request.getSession();
		Order order=new Order();
		User currentUser=(User)session.getAttribute("currentUser");
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

		order.setUser(currentUser);
		order.setCreateTime(new Date());
		order.setOrderNo(DateUtil.getCurrentDateStr());
		order.setStatus(1);
		
//		ShoppingCart shoppingCart=(ShoppingCart) session.getAttribute("shoppingCart");
//		List<ShoppingCartItem> shoppingCartItemList=shoppingCart.getShoppingCartItems();
		orderService.add(order);
		
		float cost=0;
		List<OrderZyc> orderZycList=new LinkedList<OrderZyc>();
		for(ShoppingCartItem aaa:shoppingCartItemList){
			Zyc zyc=aaa.getZyc();
			OrderZyc orderZyc=new OrderZyc();
			orderZyc.setNum(aaa.getCount());
			orderZyc.setOrder(order);
			orderZyc.setZyc(zyc);
			cost+=zyc.getPrice()*aaa.getCount();
			orderZycList.add(orderZyc);
		}
		orderZycService.addByBatch(orderZycList);
		//order.setOrderZycList(orderZycList);
		order.setCost(cost);
		orderService.update(order);

		for (int i = 0; i < shoppingCartItemList.size(); i++) {
				shopCartService.delete(shoppingCartItemList.get(i).getId());
			}
		
		
		session.removeAttribute("shoppingCart");
		mav.addObject("mainPage", "shopping/shopping-result.jsp");
		mav.setViewName("mainTemp");
		return mav;
		}

	/**
	 * 查询并列出个人订单
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/findOrder")
	public ModelAndView findOrder(Order s_order,HttpServletRequest request,HttpServletResponse response)throws Exception{
		ModelAndView mav=new ModelAndView();
		HttpSession session=request.getSession();
		User currentUser=(User)session.getAttribute("currentUser");

		if(currentUser==null){
			session.removeAttribute("userCenter");
			mav.addObject("mainPage", "index.jsp");
			mav.setViewName("mainTemp");
			return mav;
		}
		else
			{
				Map<String,Object> map=new HashMap<String, Object>();
			if (currentUser != null) {
				map.put("userId", currentUser.getId());
			}
			map.put("orderNo", StringUtil.formatLike(s_order.getOrderNo()));
			List<Order> orderList = orderService.find(map);
			mav.addObject("title", "万药斋-个人订单");
			mav.addObject("s_order", s_order);
			mav.addObject("orderList", orderList);
			mav.addObject("mainPage", "userCenter/orderList.jsp");
			mav.setViewName("userCenter");
			return mav;
		}
	}
	
	/**
	 * 修改订单状态
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("confirmReceive")
	public String confirmReceive(String orderNo,Integer status,HttpServletResponse response)throws Exception{
		Order order = orderService.findByOrderNo(orderNo);
		order.setStatus(status);
		orderService.update(order);
		JSONObject result=new JSONObject();
		result.put("success", true);
		ResponseUtil.write(response, result);
		return null;
	}
}
