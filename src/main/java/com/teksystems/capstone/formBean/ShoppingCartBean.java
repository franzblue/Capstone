package com.teksystems.capstone.formBean;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.NotBlank;

@Getter
@Setter
@ToString
public class ShoppingCartBean {

    private Integer id;

    private Integer quantity;

    private Integer product_id;

    private Integer cart_id;

}
