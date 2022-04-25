package com.teksystems.capstone.formBean;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class EditFormBean {

    private Integer id;

    private String firstName;

    private String lastName;

    private String email;

    private String username;

    private String password;

    private String confirmPassword;

    private Integer dogLove;

    private Integer catLove;

    private Integer smallLove;

    private String image;

    private String telephone;

    private String address;

    private String description;

    private String blurb;

}
