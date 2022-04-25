package com.teksystems.capstone.formBean;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.*;

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

    @NotNull(message= "Age is required.")
    @Min(value=0, message="Surely you cannot have an negative age!")
    private Integer age;

    @NotBlank(message = "Sex may not be empty.")
    private String sex;

    private String image;
}
