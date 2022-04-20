package com.teksystems.capstone.formBean;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.NotBlank;

@Getter
@Setter
@ToString
public class AddProductBean {

    private Integer id;

    @NotBlank(message = "Name may not be empty.")
    private String name;

    @NotBlank(message = "Description may not be empty.")
    private String description;

    @NotBlank(message = "Image may not be empty.")
    private String image;

    private Integer price;

    private Integer sale;

}
