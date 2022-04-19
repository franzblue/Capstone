package com.teksystems.capstone.controller;


import com.teksystems.capstone.database.dao.AnimalDAO;
import com.teksystems.capstone.database.entity.Animal;
import com.teksystems.capstone.database.entity.User;
import com.teksystems.capstone.formBean.AnimalTableBean;
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
        response.setViewName("animal/table");

        if(species.equals("all")) {
            List<Animal> animals = animalDao.findAll();
            response.addObject("animals", animals);
            return response;
        }

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
//            form.setImage(animals.get(i).getImage());
//            arr.add(form);
//
//            log.info("inside loop");
//        }

        log.info(response.toString());



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
        response.setViewName("animal/table");
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
    public ModelAndView animalSpecies(@RequestParam(name = "species", required = false, defaultValue = "") String searchValue) {
        ModelAndView response = new ModelAndView();
        response.setViewName("animal/table");

        List<Animal> animals = animalDao.findAnimalsBySpecies(searchValue);

        response.addObject("animals", animals);

        return response;
    }

    @GetMapping("/animal/sex")
    public ModelAndView animalSex(@RequestParam(name = "sex", required = false, defaultValue = "") String searchValue) {
        ModelAndView response = new ModelAndView();
        response.setViewName("animal/table");

        List<Animal> animals = animalDao.findAnimalsBySex(searchValue);

        response.addObject("animals", animals);

        return response;
    }

    @GetMapping("/animal/age")
    public ModelAndView animalAge(@RequestParam(name = "age", required = false, defaultValue = "") Integer searchValue) {
        ModelAndView response = new ModelAndView();
        response.setViewName("animal/table");

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

    @GetMapping("/animal/how")
    public ModelAndView how() {
        ModelAndView response = new ModelAndView();
        response.setViewName("animal/how");

        return response;
    }

    @RequestMapping(value = "/animal/addAnimal", method = RequestMethod.GET)
    public ModelAndView create() throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("animal/addAnimal");

        AnimalTableBean form = new AnimalTableBean();
        response.addObject("form", form);

        return response;
    }


    @RequestMapping(value = "/animal/addAnimalSubmit", method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView registerAnimalSubmit(@Valid AnimalTableBean form, BindingResult bindingResult) throws Exception {
        ModelAndView response = new ModelAndView();

        log.info(form.toString());

        if (bindingResult.hasErrors()) {

            for (ObjectError error : bindingResult.getAllErrors()) {
                log.info(((FieldError) error).getField() + ": " + error.getDefaultMessage());
            }
            response.addObject("bindingResult", bindingResult);

            response.addObject("form", form);

            response.setViewName("animal/addAnimal");
            return response;
        }

        Animal animal = animalDao.findAnimalById(form.getId());

        if (animal == null) {
            animal = new Animal();
        }

        animal.setName(form.getName());
        animal.setSpecies(form.getSpecies());
        animal.setBreed(form.getBreed());
        animal.setDescription(form.getDescription());
        animal.setAge(form.getAge());
        animal.setSex(form.getSex());
        animal.setImage(form.getImage());

        animalDao.save(animal);

        response.setViewName("redirect:/animal/editAnimal/" + animal.getId());

//        response.setViewName("animal/addAnimal");

        return response;
    }

    @RequestMapping(value = "/animal/editAnimal/{animalId}", method = RequestMethod.GET)
    public ModelAndView editAnimal(@PathVariable("animalId") Integer animalId) throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("animal/addAnimal");

        Animal animal = animalDao.findAnimalById(animalId);

        AnimalTableBean form = new AnimalTableBean();

        form.setId(animal.getId());
        form.setName(animal.getName());
        form.setSpecies(animal.getSpecies());
        form.setBreed(animal.getBreed());
        form.setDescription(animal.getDescription());
        form.setAge(animal.getAge());
        form.setSex(animal.getSex());
        form.setImage(animal.getImage());

        response.addObject("form", form);

        return response;
    }

}
