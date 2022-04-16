package com.teksystems.capstone.controller;

import com.teksystems.capstone.database.dao.UserDAO;
import com.teksystems.capstone.database.entity.User;
import com.teksystems.capstone.formBean.RegisterFormBean;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.List;


@Slf4j
@Controller
public class UserController {

    @Autowired
    private UserDAO userDao;


    @GetMapping("/user/search")
    public ModelAndView search(@RequestParam(name = "searchId", required = false, defaultValue = "") String searchValue) {
        ModelAndView response = new ModelAndView();
        response.setViewName("user/search");

        if(!StringUtils.isBlank(searchValue)) {
            List<User> users = userDao.findByFirstNameIgnoreCaseContaining(searchValue);
            response.addObject("users", users);
        } else {
            searchValue = "Search";
        }

        response.addObject("searchValue", searchValue);

        return response;
    }

    @RequestMapping(value = "/user/profile", method = RequestMethod.GET)
    public ModelAndView profile() {
        ModelAndView response = new ModelAndView();
        response.setViewName("user/profile");

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String currentPrincipleName = authentication.getName();
        User loggedInUser = userDao.findUserByUsername(currentPrincipleName);


        RegisterFormBean form = new RegisterFormBean();

        form.setId(loggedInUser.getId());
        form.setFirstName(loggedInUser.getFirstName());
        form.setLastName(loggedInUser.getLastName());
        form.setEmail(loggedInUser.getEmail());
        form.setUsername(loggedInUser.getUsername());
        form.setPassword(loggedInUser.getPassword());
        form.setConfirmPassword(loggedInUser.getPassword());

        response.addObject("form", form);

        return response;
    }
}
