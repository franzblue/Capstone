package com.teksystems.capstone.controller;

import com.teksystems.capstone.database.dao.UserDAO;
import com.teksystems.capstone.database.dao.UserRoleDAO;
import com.teksystems.capstone.database.entity.Animal;
import com.teksystems.capstone.database.entity.User;
import com.teksystems.capstone.database.entity.UserRole;
import com.teksystems.capstone.formBean.EditFormBean;
import com.teksystems.capstone.formBean.RegisterFormBean;
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

import java.io.File;
import java.util.List;


@Slf4j
@Controller
@PreAuthorize("hasAnyAuthority('USER','ADMIN')")
public class UserController {

    @Autowired
    private UserDAO userDao;

    @Autowired
    private UserRoleDAO userRoleDao;


//    @PathVariable("roleUserId") Integer roleUserId
//    @RequestParam(name = "roleUserId",required= false) Integer roleUserId

    @RequestMapping(value = "/user/changeRole", method = RequestMethod.GET)
    public void changeRole(@RequestParam(name = "roleId", required= false) Integer roleId) throws Exception {

        User user = userDao.findById(roleId);

        if(user.getRole().equals("ADMIN")) {
            user.setRole("USER");
        } else if(user.getRole().equals("USER")) {
            user.setRole("ADMIN");
        }

        userDao.save(user);


    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("/user/search")
    public ModelAndView search(@RequestParam(name = "searchId", required = false, defaultValue = "") String searchValue) {
        ModelAndView response = new ModelAndView();
        response.setViewName("user/search");

        if(!StringUtils.isBlank(searchValue)) {
            List<User> users = userDao.findUsersByFirstNameContainingOrLastNameContainingOrEmailContainingOrUsernameContaining(searchValue, searchValue, searchValue, searchValue);
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
        form.setBlurb(loggedInUser.getBlurb());

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
        form.setBlurb(user.getBlurb());

        // in this case we are adding the RegisterFormBean to the model
        response.addObject("form", form);

        return response;
    }

    @RequestMapping(value = "/user/editSubmit/{userId}", method = RequestMethod.POST)
    public ModelAndView editUserSubmit(@Valid EditFormBean form, BindingResult bindingResult) throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("redirect:/user/profile");

        log.info(form.toString());

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String currentPrincipleName = authentication.getName();
        User loggedInUser = userDao.findUserByUsername(currentPrincipleName);
        log.info(loggedInUser.toString());

        if (bindingResult.hasErrors()) {

            for (ObjectError error : bindingResult.getAllErrors()) {
                log.info(((FieldError) error).getField() + ": " + error.getDefaultMessage());
            }
            response.addObject("bindingResult", bindingResult);

            response.addObject("form", form);

            Integer userId = loggedInUser.getId();

            response.setViewName("/user/edit/{userId}");
            return response;
        }

        User user = userDao.findById(loggedInUser.getId());


        user.setEmail(loggedInUser.getEmail());
        user.setId(loggedInUser.getId());
        user.setPassword(loggedInUser.getPassword());
        user.setUsername(loggedInUser.getUsername());

        form.setEmail(loggedInUser.getEmail());
        form.setId(loggedInUser.getId());
        form.setPassword(loggedInUser.getPassword());
        form.setUsername(loggedInUser.getUsername());


        if(form.getFirstName().equals(loggedInUser.getFirstName())) {
            user.setFirstName(loggedInUser.getFirstName());
        } else {
            user.setFirstName(form.getFirstName());
        }

        if(form.getLastName().equals(loggedInUser.getLastName())) {
            user.setLastName(loggedInUser.getLastName());
        } else {
            user.setLastName(form.getLastName());
        }

        // changing loggedIn.username is tricky...
//        if(form.getUsername().equals(loggedInUser.getUsername())) {
//            user.setUsername(loggedInUser.getUsername());
//        } else {
//            user.setUsername(form.getUsername());
//            loggedInUser.setUsername(form.getUsername());
//            log.info(loggedInUser.toString());
//        }

        if(form.getDogLove() == loggedInUser.getDogLove()) {
            user.setDogLove(loggedInUser.getDogLove());
        } else {
            user.setDogLove(form.getDogLove());
        }

        if(form.getCatLove() == loggedInUser.getCatLove()) {
            user.setCatLove(loggedInUser.getCatLove());
        } else {
            user.setCatLove(form.getCatLove());
        }

        if(form.getSmallLove() == loggedInUser.getSmallLove()) {
            user.setSmallLove(loggedInUser.getSmallLove());
        } else {
            user.setSmallLove(form.getSmallLove());
        }

//        if(form.getImage().equals(loggedInUser.getImage())) {
//            user.setImage(loggedInUser.getImage());
//        } else {
//            user.setImage(form.getImage());
//        }

        if(form.getTelephone().equals(loggedInUser.getTelephone())) {
            user.setTelephone(loggedInUser.getTelephone());
        } else {
            user.setTelephone(form.getTelephone());
        }

        if(form.getAddress().equals(loggedInUser.getAddress())) {
            user.setAddress(loggedInUser.getAddress());
        } else {
            user.setAddress(form.getAddress());
        }

        if(form.getBlurb().equals("")) {
            user.setBlurb(loggedInUser.getBlurb());
        } else {
            user.setBlurb(form.getBlurb());
        }
        if(form.getDescription().equals("")) {
            user.setDescription(loggedInUser.getDescription());
        } else {
            user.setDescription(form.getDescription());
        }




        log.info("Edit User: ", user.toString());

        userDao.save(user);



        response.addObject("form", form);

        return response;
    }


    @GetMapping("/user/editPicture")
    public ModelAndView editPicture() {
        ModelAndView response = new ModelAndView();
        response.setViewName("/user/editPicture");

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String currentPrincipleName = authentication.getName();
        User loggedInUser = userDao.findUserByUsername(currentPrincipleName);

        String image = loggedInUser.getImage();

        response.addObject("image", image);

        return response;
    }

    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    public ModelAndView uploadPicture(@RequestParam("file") MultipartFile file) throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("redirect:/user/profile");
        log.info("original file name: " + file.getOriginalFilename() + "file size: " + file.getSize());

//        File targetFile = new File("\Downloads\" + file.getOriginalFilename());

        File targetFile = new File("/Users/franzblue/Desktop/Capstone/src/main/webapp/pub/images/" + file.getOriginalFilename());


        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String currentPrincipleName = authentication.getName();
        User loggedInUser = userDao.findUserByUsername(currentPrincipleName);

        loggedInUser.setImage("../../../pub/images/" + file.getOriginalFilename());

        userDao.save(loggedInUser);

        FileUtils.copyInputStreamToFile(file.getInputStream(), targetFile);
        return response;
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("/user/sortId")
    public ModelAndView sortById() {
        ModelAndView response = new ModelAndView();
        response.setViewName("user/search");

        List<User> users = userDao.sortById();

        response.addObject("users", users);

        response.addObject("searchValue", "ID");

        return response;
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("/user/sortRole")
    public ModelAndView sortByRole() {
        ModelAndView response = new ModelAndView();
        response.setViewName("user/search");

        List<User> users = userDao.sortByRole();

        response.addObject("users", users);

        response.addObject("searchValue", "Role");

        return response;
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("/user/sortEmail")
    public ModelAndView sortByEmail() {
        ModelAndView response = new ModelAndView();
        response.setViewName("user/search");

        List<User> users = userDao.sortByEmail();

        response.addObject("users", users);

        response.addObject("searchValue", "Email");

        return response;
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("/user/sortFirst")
    public ModelAndView sortByFirst() {
        ModelAndView response = new ModelAndView();
        response.setViewName("user/search");

        List<User> users = userDao.sortByFirst();

        response.addObject("users", users);

        response.addObject("searchValue", "Firstname");

        return response;
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("/user/sortLast")
    public ModelAndView sortByLast() {
        ModelAndView response = new ModelAndView();
        response.setViewName("user/search");

        List<User> users = userDao.sortByLast();

        response.addObject("users", users);

        response.addObject("searchValue", "Lastname");

        return response;
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("/user/sortUsername")
    public ModelAndView sortByUsername() {
        ModelAndView response = new ModelAndView();
        response.setViewName("user/search");

        List<User> users = userDao.sortByUsername();

        response.addObject("users", users);

        response.addObject("searchValue", "Username");

        return response;
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("/user/sortTelephone")
    public ModelAndView sortByTelephone() {
        ModelAndView response = new ModelAndView();
        response.setViewName("user/search");

        List<User> users = userDao.sortByTelephone();

        response.addObject("users", users);

        response.addObject("searchValue", "Telephone");

        return response;
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("/user/sortAddress")
    public ModelAndView sortByAddress() {
        ModelAndView response = new ModelAndView();
        response.setViewName("user/search");

        List<User> users = userDao.sortByAddress();

        response.addObject("users", users);

        response.addObject("searchValue", "Address");

        return response;
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("/user/delete/{userId}")
    public ModelAndView deleteUser(@PathVariable("userId") Integer userId) {
        ModelAndView response = new ModelAndView();
        response.setViewName("user/search");
        User user = userDao.findById(userId);

//        user.setFirstName(null);
//        user.setLastName(null);
//        user.setEmail(null);
//        user.setUsername(null);
//        user.setPassword(null);
//        user.setDogLove(null);
//        user.setCatLove(null);
//        user.setSmallLove(null);
//        user.setImage(null);
//        user.setTelephone(null);
//        user.setAddress(null);
//        user.setDescription(null);
//        user.setBlurb(null);
//        user.setRole(null);

        userDao.delete(user);
        return response;
    }
}
