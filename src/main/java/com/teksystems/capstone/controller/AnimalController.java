package com.teksystems.capstone.controller;


import com.teksystems.capstone.database.dao.AnimalDAO;
import com.teksystems.capstone.database.entity.Animal;
import com.teksystems.capstone.database.entity.User;
import com.teksystems.capstone.formBean.AnimalTableBean;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Slf4j
@Controller
public class AnimalController {

    @Autowired
    private AnimalDAO animalDao;

    @RequestMapping(value = "/animal/table/{species}", method = RequestMethod.GET)
    public ModelAndView animalTable(@PathVariable("species") String species) throws Exception {
        ModelAndView response = new ModelAndView();

        List<Animal> animals = animalDao.findAnimalsBySpecies(species);

        response.addObject("animals", animals);

//        AnimalTableBean form = new AnimalTableBean();
//
//
//        ArrayList<AnimalTableBean> arr = new ArrayList<AnimalTableBean>();
//        for(int i = 0; i < animals.size(); i++) {
//            form.setId(animals.get(i).getId());
//            form.setName(animals.get(i).getName());
//            form.setSpecies(animals.get(i).getSpecies());
//            form.setBreed(animals.get(i).getBreed());
//            form.setDescription(animals.get(i).getDescription());
//            form.setAge(animals.get(i).getAge());
//            form.setSex(animals.get(i).getSex());
//            form.setImg(animals.get(i).getImg());
//            arr.add(form);
//
//            log.info("inside loop");
//        }

        log.info(response.toString());

        response.setViewName("animal/table");

        log.info(response.getModel().toString());

        return response;
    }

    @RequestMapping(value = "/animal/card/{animalId}", method = RequestMethod.GET)
    public ModelAndView animalCard(@PathVariable("animalId") Integer animalId) throws Exception {
        ModelAndView response = new ModelAndView();

        Animal animal = animalDao.findAnimalById(animalId);

        response.addObject("animal", animal);

        response.setViewName("animal/card");

        return response;
    }

    @GetMapping("/animal/search")
    public ModelAndView animalSearch(@RequestParam(name = "searchId", required = false, defaultValue = "") String searchValue) {
        ModelAndView response = new ModelAndView();
        response.setViewName("animal/search");
        log.info(searchValue);


        // very basic example of error checking
        if(!StringUtils.isBlank(searchValue)) {
            List<Animal> animals = animalDao.findAnimalsByNameContainingOrSpeciesContainingOrBreedContainingOrDescriptionContainingOrSexContaining(searchValue,searchValue,searchValue,searchValue,searchValue);
            response.addObject("animals", animals);
            log.info(animals.toString());
        } else {
            // make a placeholder value
            searchValue = "Search";
        }

        response.addObject("searchValue", searchValue);
        log.info(response.toString());

        return response;
    }

    @GetMapping("/animal/species")
    public ModelAndView animalSearch1(@RequestParam(name = "species", required = false, defaultValue = "") String searchValue) {
        ModelAndView response = new ModelAndView();
        response.setViewName("animal/search");

        List<Animal> animals = animalDao.findAnimalsBySpecies(searchValue);

        response.addObject("animals", animals);

        return response;
    }

    @GetMapping("/animal/sex")
    public ModelAndView animalSex(@RequestParam(name = "sex", required = false, defaultValue = "") String searchValue) {
        ModelAndView response = new ModelAndView();
        response.setViewName("animal/search");

        List<Animal> animals = animalDao.findAnimalsBySex(searchValue);

        response.addObject("animals", animals);

        return response;
    }

    @GetMapping("/animal/age")
    public ModelAndView animalAge(@RequestParam(name = "age", required = false, defaultValue = "") Integer searchValue) {
        ModelAndView response = new ModelAndView();
        response.setViewName("animal/search");

        log.info("value", searchValue);

        if(searchValue == 6) {
            List<Animal> animals = animalDao.findAnimalsByAgeLessThan(searchValue);
            response.addObject("animals", animals);

        } else if (searchValue == 70 ) {
            List<Animal> animals = animalDao.findAnimalsByAgeGreaterThan(searchValue);
            response.addObject("animals", animals);
        }

        return response;
    }

}
