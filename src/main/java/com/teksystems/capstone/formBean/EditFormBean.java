package com.teksystems.capstone.formBean;

import com.teksystems.capstone.validation.EmailUnique;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.AssertTrue;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

@Getter
@Setter
@ToString
public class EditFormBean {

    // This id will be null in the case of a create
    // and will be populated with the user id in the case of an edit
    private Integer id;

    @NotBlank(message = "First name may not be empty.")
    private String firstName;

    @NotBlank(message = "Last name may not be empty.")
    private String lastName;

    private String email;

    @NotBlank(message = "Username may not be empty.")
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
