package com.teksystems.capstone.database.entity;

import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.DecimalMin;


@Getter
@Setter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Builder
@Table(name = "products")
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "name", nullable = false, unique = true)
    private String name;

    @Column(name = "description")
    private String description;

    @Column(name = "price")
    @DecimalMin(value = "0.00", message = "Price has to be non negative number")
    private Integer price;

    @Column(name = "sale")
    @DecimalMin(value = "0.00", message = "Price has to be non negative number")
    private Integer sale;

    @Column(name = "image")
    private String image;

}
