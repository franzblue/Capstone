package com.teksystems.capstone.database.entity;

import lombok.*;
import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Min;
import java.util.Set;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "products")
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "name", nullable = false, unique = true)
    @Length(min = 5, message = "Name must have at least 5 characters")
    private String name;

    @Column(name = "description")
    private String description;

    @Column(name = "quantity")
    @Min(value = 0, message = "Quantity has to be non negative number")
    private Integer quantity;

    @Column(name = "price")
    @DecimalMin(value = "0.00", message = "Price has to be non negative number")
    private Integer price;

    @Column(name = "sale")
    @DecimalMin(value = "0.00", message = "Price has to be non negative number")
    private Integer sale;

    @Column(name = "image")
    private String image;

//    @OneToMany(mappedBy = "product", fetch = FetchType.LAZY,
//            cascade = CascadeType.ALL)
//    private Set<OrderProduct> orderProducts;

}