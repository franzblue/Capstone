package com.teksystems.capstone.controller;

import com.teksystems.capstone.database.dao.*;
import com.teksystems.capstone.database.entity.*;
import com.teksystems.capstone.formBean.AddProductBean;;
import com.teksystems.capstone.formBean.ShoppingCartBean;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.FileUtils;
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
import java.io.File;
import java.util.List;


@Slf4j
@Controller
@PreAuthorize("hasAnyAuthority('USER','ADMIN')")
public class CartController {

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

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String currentPrincipleName = authentication.getName();
        User loggedInUser = userDao.findUserByUsername(currentPrincipleName);


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

        return response;
    }


    @RequestMapping(value = "/cart/cart/{productId}", method = RequestMethod.GET)
    public ModelAndView addProductToCart(@PathVariable("productId") Integer productId) throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("cart/cart");

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String currentPrincipleName = authentication.getName();
        User loggedInUser = userDao.findUserByEmail(currentPrincipleName);

        response.addObject("user", loggedInUser);

        Product product = productDao.findProductById(productId);

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
