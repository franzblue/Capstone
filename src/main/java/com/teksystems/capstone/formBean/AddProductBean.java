package com.teksystems.capstone.formBean;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Getter
@Setter
@ToString
public class AddProductBean {

    private Integer id;

    @NotBlank(message = "Name may not be empty.")
    private String name;

    @NotBlank(message = "Description may not be empty.")
    private String description;

    private String image;

    @NotNull(message= "Price is required.")
    @Min(value=0, message="Positive price required.")
    private Integer price;

    @NotNull(message= "Price is required.")
    @Min(value=0, message="Positive price required.")
    private Integer sale;

}
