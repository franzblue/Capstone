package com.teksystems.capstone.database.dao;

import com.teksystems.capstone.database.entity.Animal;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AnimalDAO extends JpaRepository<Animal, Long> {

    List<Animal> findAnimalsByNameContainingOrSpeciesContainingOrBreedContainingOrDescriptionContainingOrSexContaining(
//            @Param("id") Integer id,
            @Param("name") String name,
            @Param("species") String speices,
            @Param("breed") String breed,
            @Param("description") String description,
//            @Param("age") Integer age,
            @Param("sex") String sex
    );

    Animal findAnimalById(@Param("id") Integer id);

    Animal findAnimalByName(@Param("name") String name);

    List<Animal> findAnimalsBySpecies(@Param("species") String species);

    List<Animal> findAnimalsBySpeciesAndAge(@Param("species") String species, @Param("age") Integer age);

    List<Animal> findAnimalsBySpeciesAndBreed(@Param("species") String species, @Param("breed") String breed);
}
