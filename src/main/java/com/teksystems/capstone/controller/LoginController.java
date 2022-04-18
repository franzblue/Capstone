package com.teksystems.capstone.controller;

import com.teksystems.capstone.database.dao.UserDAO;
import com.teksystems.capstone.database.entity.User;
import com.teksystems.capstone.formBean.RegisterFormBean;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;

@Slf4j
@Controller
public class LoginController {

    @Autowired
    private UserDAO userDao;


    @RequestMapping(value = "/login/login", method = RequestMethod.GET)
    public ModelAndView login() throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("login/loginForm");

        return response;
    }

    @RequestMapping(value = "/login/register", method = RequestMethod.GET)
    public ModelAndView create() throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("login/register");

        RegisterFormBean form = new RegisterFormBean();
        response.addObject("form", form);

        return response;
    }

    @RequestMapping(value = "/login/registerSubmit", method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView registerSubmit(@Valid RegisterFormBean form, BindingResult bindingResult) throws Exception {
        ModelAndView response = new ModelAndView();

        log.info(form.toString());

        if (bindingResult.hasErrors()) {

            for (ObjectError error : bindingResult.getAllErrors()) {
                log.info(((FieldError) error).getField() + ": " + error.getDefaultMessage());
            }
            response.addObject("bindingResult", bindingResult);

            response.addObject("form", form);

            response.setViewName("login/register");
            return response;
        }

        User user = userDao.findById(form.getId());

        if (user == null) {
            user = new User();
        }

        // need a bunch if if else statements checking for null values

        user.setEmail(form.getEmail());
        user.setFirstName(form.getFirstName());
        user.setLastName(form.getLastName());
        user.setPassword(form.getPassword());
        user.setUsername(form.getUsername());
        user.setDogLove(form.getDogLove());
        user.setCatLove(form.getCatLove());
        user.setSmallLove(form.getSmallLove());
        user.setImage(form.getImage());
        user.setTelephone(form.getTelephone());
        user.setAddress(form.getAddress());
        user.setDescription(form.getDescription());
        user.setBlurb(form.getBlurb());

        userDao.save(user);

        response.setViewName("redirect:/login/login");

        return response;
    }
}
