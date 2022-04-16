package com.teksystems.capstone.formBean;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.NotBlank;

@Getter
@Setter
@ToString
public class OrderBean {

    private Integer id;

    private String user_id;

    private String address;

}
