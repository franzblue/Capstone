package com.teksystems.capstone.controller;

import com.teksystems.capstone.database.dao.*;
import com.teksystems.capstone.database.entity.*;
import com.teksystems.capstone.formBean.AddProductBean;
import com.teksystems.capstone.formBean.AnimalTableBean;
import com.teksystems.capstone.formBean.RegisterFormBean;
import com.teksystems.capstone.formBean.ShoppingCartBean;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import javax.websocket.server.PathParam;
import java.io.File;
import java.util.List;
import java.util.Map;

@Slf4j
@Controller
@PreAuthorize("hasAnyAuthority('USER','ADMIN')")
public class CartController {

    // autowire all 3 dao - order, product, orderProduct

    // order has 2 status .... pending or completed

    @Autowired
    private ProductDAO productDao;

    @Autowired
    private UserDAO userDao;

    @Autowired
    private ShoppingCartDAO shoppingCartDao;

    @Autowired
    private CartItemDAO cartItemDao;

    @RequestMapping(value = "/cart/shop", method = RequestMethod.GET)
    public ModelAndView viewAllProducts() throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("cart/shop");

        List<Product> products = productDao.findAll();
        response.addObject("products", products);

        log.info("products: " + products);

        return response;

    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @RequestMapping(value = "/cart/addProduct", method = RequestMethod.GET)
    public ModelAndView adminAddProduct() throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("cart/addProduct");

        AddProductBean form = new AddProductBean();
        response.addObject("form", form);

        return response;

    }

    @RequestMapping(value = "/cart/removeFromCart", method = RequestMethod.POST)
    public ModelAndView removeFromCart(@RequestParam(name = "productId") Integer productId) throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("redirect:/cart/cart");

        CartItem cartItem = cartItemDao.findCartItemById(productId);

        cartItemDao.delete(cartItem);

        return response;

    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @RequestMapping(value = "/cart/addProductSubmit", method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView addToProduct(@RequestParam("file") MultipartFile file, @Valid AddProductBean form, BindingResult bindingResult) throws Exception {
        ModelAndView response = new ModelAndView();

        log.info(form.toString());

        if (bindingResult.hasErrors()) {

            for (ObjectError error : bindingResult.getAllErrors()) {
                log.info(((FieldError) error).getField() + ": " + error.getDefaultMessage());
            }
            response.addObject("bindingResult", bindingResult);

            response.addObject("form", form);

            response.setViewName("cart/addProduct");
            return response;
        }

        Product product = productDao.findProductById(form.getId());
        if (product == null) {
            product = new Product();
        }

        if(file.getOriginalFilename().isBlank()) {
            product.setImage("../../../pub/images/placeholder.png");
        } else {
            File targetFile = new File("/Users/franzblue/Desktop/Capstone/src/main/webapp/pub/images/" + file.getOriginalFilename());
            FileUtils.copyInputStreamToFile(file.getInputStream(), targetFile);
            product.setImage("../../../pub/images/" + file.getOriginalFilename());
        }


        product.setName(form.getName());
        product.setDescription(form.getDescription());
        product.setPrice(form.getPrice());
        product.setSale(form.getSale());


        productDao.save(product);

        response.setViewName("redirect:/cart/shop");


        return response;
    }

    @RequestMapping(value = "/cart/cart", method = RequestMethod.GET)
    public ModelAndView goToCart(@Valid ShoppingCartBean form) throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("cart/cart");

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String currentPrincipleName = authentication.getName();
        User loggedInUser = userDao.findUserByUsername(currentPrincipleName);

        ShoppingCart shoppingCart = shoppingCartDao.findByUser(loggedInUser);

        if (shoppingCart == null) {
            shoppingCart = new ShoppingCart();
            return response;
        }

        List<CartItem> cartItems = cartItemDao.findAllByShoppingCart(shoppingCart);

        response.addObject("cartItems", cartItems);

        return response;
    }



    @RequestMapping(value = "/cart/showCart", method = RequestMethod.GET)
    @ResponseBody
    public Integer showCart() throws Exception {
//        ModelAndView response = new ModelAndView();
//        response.setViewName("cart/shop");

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String currentPrincipleName = authentication.getName();
        User loggedInUser = userDao.findUserByUsername(currentPrincipleName);

        log.info("items:", cartItemDao.cartCount(1));

        Integer products = cartItemDao.cartCount(loggedInUser.getId());

        if(products == null) {
            return 0;
        } else {
            return products;
        }



    }

    @RequestMapping(value = "/cart/addToCart", method = RequestMethod.POST)
    public ModelAndView addToCart(@RequestParam(name = "productId") Integer productId, @RequestParam("quantityValue") Integer quantityValue) {
        ModelAndView response = new ModelAndView();
        response.setViewName("cart/shop");
        log.info("productId: ", productId);

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String currentPrincipleName = authentication.getName();
        User loggedInUser = userDao.findUserByUsername(currentPrincipleName);

        Product product = productDao.findProductById(productId);


        ShoppingCart shoppingCart = shoppingCartDao.findByUser(loggedInUser);

        if (shoppingCart == null) {
            shoppingCart = new ShoppingCart();
        }

        shoppingCart.setUser(loggedInUser);
        shoppingCart.setStatus("PENDING");
        shoppingCartDao.save(shoppingCart);


        CartItem cartItem = new CartItem();
        cartItem.setProduct(product);
        cartItem.setShoppingCart(shoppingCart);
        cartItem.setQuantity(quantityValue);

        cartItemDao.save(cartItem);


        log.info("cart item: ", cartItem.getProduct());
        log.info("shopping cart: ", shoppingCart.getUser());

//        OrderProduct oP = orderProductDao.findByProduct(product);
//
//
//        log.info(orderProductDao.toString());
//
//        OrderProduct orderProduct = new OrderProduct();
//        orderProduct.setProduct(product);
//        orderProduct.setOrder(order);
//
//        orderProductDao.save(orderProduct);
//
//        log.info(orderProductDao.toString());

        return response;
    }


    @RequestMapping(value = "/cart/cart/{productId}", method = RequestMethod.GET)
    public ModelAndView addProductToCart(@PathVariable("productId") Integer productId) throws Exception {
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
//        Order order = new Order();

        // if order does not exist create it  and save it


        // here actually want to make the new OrderProduct entity
//        OrderProduct orderProduct = new OrderProduct();
//        orderProduct.setProduct(product);
//        orderProduct.setOrder(order);

        // save this using the dao


        return response;
    }

    @RequestMapping(value = "/cart/checkout", method = RequestMethod.POST)
    public ModelAndView cartCheckout() throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("redirect:/cart/cart");

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String currentPrincipleName = authentication.getName();
        User loggedInUser = userDao.findUserByUsername(currentPrincipleName);


        ShoppingCart shoppingCart = shoppingCartDao.findByUser(loggedInUser);

        if (shoppingCart == null) {
            shoppingCart = new ShoppingCart();
        }

        shoppingCart.setUser(loggedInUser);
        shoppingCart.setStatus("PAID");

        shoppingCartDao.save(shoppingCart);

        List<CartItem> cartItem = cartItemDao.findAllByShoppingCart(shoppingCart);
        log.info("cart items", cartItem);
//        cartItem.clear();
//        log.info("cart items", cartItem);


        cartItemDao.deleteAll(cartItem);


        return response;
    }


    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("/cart/deleteProduct")
    public void deleteProduct(@RequestParam(name = "productId") Integer productId) {

        Product product = productDao.findProductById(productId);

        productDao.delete(product);

    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @RequestMapping(value = "/cart/editProduct/{productId}", method = RequestMethod.GET)
    public ModelAndView editProduct(@PathVariable("productId") Integer productId) throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("cart/addProduct");

        Product product = productDao.findProductById(productId);

        AddProductBean form = new AddProductBean();

        form.setId(product.getId());
        form.setName(product.getName());
        form.setDescription(product.getDescription());
        form.setImage(product.getImage());
        form.setPrice(product.getPrice());
        form.setSale(product.getSale());

        response.addObject("form", form);

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
