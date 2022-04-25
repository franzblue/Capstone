package com.teksystems.capstone.database.dao;

import com.teksystems.capstone.database.entity.Animal;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AnimalDAO extends JpaRepository<Animal, Long> {

    List<Animal> findAnimalsByNameContainingOrSpeciesContainingOrBreedContainingOrDescriptionContainingOrSexContaining(
            @Param("name") String name,
            @Param("species") String species,
            @Param("breed") String breed,
            @Param("description") String description,
            @Param("sex") String sex
    );

    Animal findAnimalById(@Param("id") Integer id);

    List<Animal> findAnimalsBySpecies(@Param("species") String species);

    List<Animal> findAnimalsBySex(String searchValue);

    List<Animal> findAnimalsByAgeLessThan(Integer searchValue);

    List<Animal> findAnimalsByAgeGreaterThan(Integer searchValue);

    List<Animal> findAll();

}
