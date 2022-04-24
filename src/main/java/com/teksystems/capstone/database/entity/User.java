package com.teksystems.capstone.database.entity;

import lombok.*;
import javax.persistence.*;
import java.util.Set;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Builder
@Table(name = "users")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "first_name")
    private String firstName;

    @Column(name = "last_name")
    private String lastName;

    @Column(name = "email")
    private String email;

    @Column(name = "username")
    private String username;

    @Column(name = "password")
    private String password;

    @Column(name = "dog_love")
    private Integer dogLove;

    @Column(name = "cat_love")
    private Integer catLove;

    @Column(name = "small_love")
    private Integer smallLove;

    @Column(name = "image")
    private String image;

    @Column(name = "telephone")
    private String telephone;

    @Column(name = "address")
    private String address;

    @Column(name = "description")
    private String description;

    @Column(name = "blurb")
    private String blurb;

    @Column(name = "role")
    private String role;

}