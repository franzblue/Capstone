package com.teksystems.capstone.database.dao;

import com.teksystems.capstone.database.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserDAO extends JpaRepository<User, Long> {

    User findById(@Param("id") Integer id);

    User findUserByEmail(@Param("email") String email);

    List<User> findUsersByFirstName(@Param("firstName") String firstName);

    List<User> findUsersByFirstNameAndLastName(@Param("firstName") String firstName, @Param("lastName") String lastName);

    List<User> findByFirstNameIgnoreCaseContaining(@Param("firstName") String firstName);

    User findUserByUsername(String currentPrincipleName);
}
