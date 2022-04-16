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
        form.setDogLove(loggedInUser.getDogLove());
        form.setCatLove(loggedInUser.getCatLove());
        form.setSmallLove(loggedInUser.getSmallLove());
        form.setImage(loggedInUser.getImage());
        form.setTelephone(loggedInUser.getTelephone());
        form.setAddress(loggedInUser.getAddress());
        form.setDescription(loggedInUser.getDescription());

        response.addObject("form", form);

        return response;
    }

    @RequestMapping(value = "/user/edit/{userId}", method = RequestMethod.GET)
    public ModelAndView editUser(@PathVariable("userId") Integer userId) throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("login/register");

        User user = userDao.findById(userId);

        RegisterFormBean form = new RegisterFormBean();

        form.setId(user.getId());
        form.setEmail(user.getEmail());
        form.setFirstName(user.getFirstName());
        form.setLastName(user.getLastName());
        form.setUsername(user.getUsername());
        form.setPassword(user.getPassword());
        form.setConfirmPassword(user.getPassword());
        form.setDogLove(user.getDogLove());
        form.setCatLove(user.getCatLove());
        form.setSmallLove(user.getSmallLove());
        form.setImage(user.getImage());
        form.setTelephone(user.getTelephone());
        form.setAddress(user.getAddress());
        form.setDescription(user.getDescription());

        // in this case we are adding the RegisterFormBean to the model
        response.addObject("form", form);

        return response;
    }
}
