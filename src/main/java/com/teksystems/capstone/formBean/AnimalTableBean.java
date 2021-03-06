package com.teksystems.capstone.formBean;

import com.teksystems.capstone.validation.EmailUnique;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

@Getter
@Setter
@ToString
public class AnimalTableBean {

    private Integer id;

    @NotBlank(message = "Name may not be empty.")
    private String name;

    @NotBlank(message = "Species may not be empty.")
    private String species;

    @NotBlank(message = "Breed may not be empty.")
    private String breed;

    @NotBlank(message = "Description may not be empty.")
    private String description;

    private Integer age;

    @NotBlank(message = "Sex may not be empty.")
    private String sex;

    @NotBlank(message = "Image may not be empty.")
    private String image;
}

