package com.teksystems.capstone.controller;

import com.teksystems.capstone.database.dao.UserDAO;
import com.teksystems.capstone.database.entity.User;
import com.teksystems.capstone.formBean.RegisterFormBean;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.Date;
import java.util.List;


@Slf4j
@Controller
public class UserController {

    @Autowired
    private UserDAO userDao;


//    This is the controller method for the entry point of the user registration page.
//    It does not do anything really other than provide a route to the register.jsp page

    // this method is the entry point for the create user
    // it sets up the empty form
    @RequestMapping(value = "/user/register", method = RequestMethod.GET)
    public ModelAndView create() throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("user/register");

        // All these 2 lines of code are doing is seeding the model with an
        // empty form bean so that the JSP page substitutions will not error out
        // in this case spring is being nice enough not to throw errors but these
        // 2 lines are safety
        RegisterFormBean form = new RegisterFormBean();
        response.addObject("form", form);

        return response;
    }

    //When the user submits the form it will call into this method
    // 1) the action on the form itself must match the value here in the request mapping
    // 2) method on the form must match the method here
    // otherwise spring MVC wil not be able to respond to the request

    // In this case the @PostMapping and req... mapping are the same with the postma[ping
    // being a shorthand. This works the same for @GetMapping

    // THis method now becomes a create and on edit based on if the id is populated
    // in the register form bean
    @RequestMapping(value = "/user/registerSubmit", method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView registerSubmit(@Valid RegisterFormBean form, BindingResult bindingResult) throws Exception {
        ModelAndView response = new ModelAndView();

        log.info(form.toString());

        if (bindingResult.hasErrors()) {

            for (ObjectError error : bindingResult.getAllErrors()) {
                log.info(((FieldError) error).getField() + ": " + error.getDefaultMessage());
            }

            response.addObject("bindingResult", bindingResult);


            response.addObject("form", form);

            // add the error list to the model
//            response.addObject("formErrors", errors);

            // because there is 1 or more error we do not want to process the logic below
            // that will crete a new user in the database.
            // We want to show the same model that we are already on
            response.setViewName("user/register");
            return response;
        }

        // we first assume that we are going to do an edit by
        // loading the user from the database using the incoming id on the form
        User user = userDao.findById(form.getId());


        // if the user is not null then we know it is an edit
        if (user == null) {
            // now, if the user from the database is null then it means we did not
            // find the user. Therefore, it is a create
            user = new User();
        }


        user.setEmail(form.getEmail());
        user.setFirstName(form.getFirstName());
        user.setLastName(form.getLastName());
        user.setPassword(form.getPassword());
        user.setUsername(form.getUsername());

        userDao.save(user);

        log.info(user.toString());

        // Here instead of showing a view/ we want to redirect to the edit page
        // then edit page will then b e responsible for loading the user from the
        // database and dynamically creating the page.
        // When you use the redirect: as part of the view name it triggers spring to tell the
        // browser to do a redirect to the URL after the :
        // The big piece here to recognize is that
        // redirect: uses an actual URL rather than a view
        response.setViewName("redirect:/user/edit/" + user.getId());

        return response;
    }

    //This method is for editing a user.
    // There is a path paramter being used to pass the userId for the user that is to be edited.

    // In this case the @GetMapping is equivalent to the @RequestMapping.

    //    @GetMapping("/user/edit/{userId}")
    @RequestMapping(value = "/user/edit/{userId}", method = RequestMethod.GET)
    public ModelAndView editUser(@PathVariable("userId") Integer userId) throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("user/register");

        User user = userDao.findById(userId);

        RegisterFormBean form = new RegisterFormBean();

        form.setId(user.getId());
        form.setEmail(user.getEmail());
        form.setFirstName(user.getFirstName());
        form.setLastName(user.getLastName());
        form.setPassword(user.getPassword());
        form.setConfirmPassword(user.getPassword());
        form.setUsername(user.getUsername());

        // in this case we are adding the RegisterFormBean to the model
        response.addObject("form", form);

        return response;
    }


    @GetMapping("/user/search")
    public ModelAndView search(@RequestParam(name = "searchId", required = false, defaultValue = "") String searchValue) {
        ModelAndView response = new ModelAndView();
        response.setViewName("user/search");
        log.info(searchValue);


        // very basic example of error checking
        if(!StringUtils.isBlank(searchValue)) {
            // do your query
            List<User> users = userDao.findByFirstNameIgnoreCaseContaining(searchValue);
            // this line puts the list of users that we just queried into the model
            // the model is a map ( key:value store)
            // any object of any kind can go into the model using this key value
            // in this case it is a list of Users
            response.addObject("users", users);
        } else {
            // make a placeholder value
            searchValue = "Search";
        }

        response.addObject("searchValue", searchValue);

        return response;
    }

    @RequestMapping(value = "/user/profile/{userId}", method = RequestMethod.GET)
    public ModelAndView profile(@PathVariable("userId") Integer userId) throws Exception {
        ModelAndView response = new ModelAndView();


        response.setViewName("user/profile/{userId}");

        User user = userDao.findById(userId);

        RegisterFormBean form = new RegisterFormBean();

        form.setId(user.getId());
        form.setEmail(user.getEmail());
        form.setFirstName(user.getFirstName());
        form.setLastName(user.getLastName());
        form.setPassword(user.getPassword());
        form.setConfirmPassword(user.getPassword());
        form.setUsername(user.getUsername());

        // in this case we are adding the RegisterFormBean to the model
        response.addObject("form", form);

        return response;
    }
}
