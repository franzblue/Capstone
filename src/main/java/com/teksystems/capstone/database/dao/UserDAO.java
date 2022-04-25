package com.teksystems.capstone.database.dao;

import com.teksystems.capstone.database.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserDAO extends JpaRepository<User, Long> {

    User findById(@Param("id") Integer id);

    User findUserByEmail(@Param("email") String email);

    User findUserByUsername(String currentPrincipleName);

    @Query(value = "SELECT * FROM users ORDER BY id", nativeQuery = true)
    List<User> sortById();

    @Query(value = "SELECT * FROM users ORDER BY role", nativeQuery = true)
    List<User> sortByRole();

    @Query(value = "SELECT * FROM users ORDER BY email", nativeQuery = true)
    List<User> sortByEmail();

    @Query(value = "SELECT * FROM users ORDER BY first_name", nativeQuery = true)
    List<User> sortByFirst();

    @Query(value = "SELECT * FROM users ORDER BY last_name", nativeQuery = true)
    List<User> sortByLast();

    @Query(value = "SELECT * FROM users ORDER BY username", nativeQuery = true)
    List<User> sortByUsername();

    @Query(value = "SELECT * FROM users ORDER BY telephone", nativeQuery = true)
    List<User> sortByTelephone();

    @Query(value = "SELECT * FROM users ORDER BY address", nativeQuery = true)
    List<User> sortByAddress();

    List<User> findUsersByFirstNameContainingOrLastNameContainingOrEmailContainingOrUsernameContaining(
        @Param("firstName") String firstName,
        @Param("lastName") String lastName,
        @Param("email") String email,
        @Param("username") String username
    );

}
