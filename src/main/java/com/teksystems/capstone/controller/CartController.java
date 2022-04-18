package com.teksystems.capstone.controller;

import com.teksystems.capstone.database.dao.OrderDAO;
import com.teksystems.capstone.database.dao.OrderProductDAO;
import com.teksystems.capstone.database.dao.ProductDAO;
import com.teksystems.capstone.database.dao.UserDAO;
import com.teksystems.capstone.database.entity.*;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.websocket.server.PathParam;
import java.util.List;
import java.util.Map;

@Slf4j
@Controller
public class CartController {

    // autowire all 3 dao - order, product, orderProduct
    @Autowired
    private OrderDAO orderDao;

    // order has 2 status .... pending or completed

    @Autowired
    private ProductDAO productDao;

    @Autowired
    private OrderProductDAO orderProductDao;

    @Autowired
    private UserDAO userDao;

    @RequestMapping(value = "/cart/shop", method = RequestMethod.GET)
    public ModelAndView viewAllProducts() throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("cart/shop");

        List<Product> products = productDao.findAll();
        response.addObject("products", products);

        log.info("products: " + products);

        return response;

    }

    @RequestMapping(value = "/cart/addToCart", method = RequestMethod.POST)
    public ModelAndView addToCart(@RequestParam(name = "productId") Integer productId) {
        ModelAndView response = new ModelAndView();
        response.setViewName("cart/shop");
        log.info("productId: ", productId);

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String currentPrincipleName = authentication.getName();
        User loggedInUser = userDao.findUserByUsername(currentPrincipleName);

        Product product = productDao.findProductById(productId);

        Order order = orderDao.findById(loggedInUser.getId());

//        OrderProduct oP = orderProductDao.findByProduct(product);


        log.info(orderProductDao.toString());

        OrderProduct orderProduct = new OrderProduct();
        orderProduct.setProduct(product);
        orderProduct.setOrder(order);

        orderProductDao.save(orderProduct);

        log.info(orderProductDao.toString());

        return response;
    }


    @RequestMapping(value = "/cart/cart/{productId}", method = RequestMethod.GET)
    public ModelAndView addProducToCart(@PathVariable("productId") Integer productId) throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("cart/cart");


        // first look up the user from the spring security
        // this little block of code can grab the logged in user and look it up in the
        // database to get the user object
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String currentPrincipleName = authentication.getName();
        User loggedInUser = userDao.findUserByEmail(currentPrincipleName);
        log.info("user: " + loggedInUser);
        response.addObject("user", loggedInUser);

        // next query the product based on the product Id
        // if you are able to find the product - okay
        // if not then its an error and we can exit here and show some error message

        Product product = productDao.findProductById(productId);
        log.info("productById: " + product);
//        if(product == null) {
//            log.info;
//        }


        // look up the order in the database by the user id and the status
        // for the create we are looking for an order with the status pending
        // select * from orders where user_id = 1 and status = 'pending'
        // either returns a record or not
        // if no record then we need to create a new order
        // set your user object onto the order and set pending status on the order
        // order.SetStatus('pending');
        // save order

        //

        // pretend that we looked up the order in the database using the userid and an order status
        Order order = new Order();

        // if order does not exist create it  and save it


        // here actually want to make the new OrderProduct entity
        OrderProduct orderProduct = new OrderProduct();
        orderProduct.setProduct(product);
        orderProduct.setOrder(order);

        // save this using the dao


        return response;
    }



}

//    // pass in the conversationid and the message
//    // find the logged in user from the database
//    // create a message entity and set the converstaion and user
//
//    // pass in to the controller the userid and the conversation id .... userid != to the logged in user (most likely)
//    // query the conversation
//    // if not exists error
//    // query the user based on userid
//    // if not exists error
//    // creat a new userConversation object
//    // set the converstaion
//    // set the user
//    // save


//    select p.*, op.quantity from products p, order_products op, orders o
//        where p.id = op.product_id and o.id = op.order_id
//        and o.id = 1;



//// refactor file name from: CartController
//@Slf4j
//@Controller
//public class CartController {
//
//    private final ShoppingCartService shoppingCartService;
//
//    private final ProductService productService;
//
//    @Autowired
//    public CartController(ShoppingCartService shoppingCartService, ProductService productService) {
//        this.shoppingCartService = shoppingCartService;
//        this.productService = productService;
//    }
//
//    @GetMapping("/shoppingCart")
//    public ModelAndView shoppingCart() {
//        ModelAndView modelAndView = new ModelAndView("/shoppingCart");
//        modelAndView.addObject("products", shoppingCartService.getProductsInCart());
//        modelAndView.addObject("total", shoppingCartService.getTotal().toString());
//        log.info("getProductsinCart" + shoppingCartService.getProductsInCart());
//        return modelAndView;
//    }
//
//    @GetMapping("/shoppingCart/addProduct/{productId}")
//    public ModelAndView addProductToCart(@PathVariable("productId") Long productId) {
//        productService.findById(productId).ifPresent(shoppingCartService::addProduct);
//        log.info("findById" + productService.findById(productId));
//        return shoppingCart();
//    }
//
//    @GetMapping("/shoppingCart/removeProduct/{productId}")
//    public ModelAndView removeProductFromCart(@PathVariable("productId") Long productId) {
//        productService.findById(productId).ifPresent(shoppingCartService::removeProduct);
//        return shoppingCart();
//    }
//
//    @GetMapping("/shoppingCart/checkout")
//    public ModelAndView checkout() {
////        try {
//            shoppingCartService.checkout();
////        } catch (NotEnoughProductsInStockException e) {
////            return shoppingCart().addObject("outOfStockMessage", e.getMessage());
////        }
//        return shoppingCart();
//    }
//}
