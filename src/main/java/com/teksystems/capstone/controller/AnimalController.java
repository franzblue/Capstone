package com.teksystems.capstone.controller;


import com.teksystems.capstone.database.dao.AnimalDAO;
import com.teksystems.capstone.database.entity.Animal;
import com.teksystems.capstone.formBean.AnimalTableBean;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
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

        if(searchValue == 6) {
            List<Animal> animals = animalDao.findAnimalsByAgeLessThan(searchValue);
            response.addObject("animals", animals);

        } else if (searchValue == 70 ) {
            List<Animal> animals = animalDao.findAnimalsByAgeGreaterThan(searchValue);
            response.addObject("animals", animals);
        }

        return response;
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @RequestMapping(value = "/animal/addAnimal", method = RequestMethod.GET)
    public ModelAndView create() throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("animal/addAnimal");

        AnimalTableBean form = new AnimalTableBean();
        response.addObject("form", form);

        return response;
    }


    @PreAuthorize("hasAuthority('ADMIN')")
    @RequestMapping(value = "/animal/addAnimalSubmit", method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView registerAnimalSubmit(@RequestParam("file") MultipartFile file, @Valid AnimalTableBean form, BindingResult bindingResult) throws Exception {
        ModelAndView response = new ModelAndView();


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

        if(file.getOriginalFilename().isBlank()) {
            animal.setImage("../../../pub/images/placeholder.png");
        } else {
            File targetFile = new File("/Users/franzblue/Desktop/Capstone/src/main/webapp/pub/images/" + file.getOriginalFilename());
            FileUtils.copyInputStreamToFile(file.getInputStream(), targetFile);
            animal.setImage("../../../pub/images/" + file.getOriginalFilename());
        }

        animal.setName(form.getName());
        animal.setSpecies(form.getSpecies());
        animal.setBreed(form.getBreed());
        animal.setDescription(form.getDescription());
        animal.setAge(form.getAge());
        animal.setSex(form.getSex());

        animalDao.save(animal);

        response.setViewName("redirect:/animal/table/" + animal.getSpecies());

        return response;
    }

    @PreAuthorize("hasAuthority('ADMIN')")
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


    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("/animal/deleteAnimal")
    public void deleteAnimal(@RequestParam(name = "animalId") Integer animalId) {

        Animal animal = animalDao.findAnimalById(animalId);

        animalDao.delete(animal);

    }

}
