package com.teksystems.capstone.database.dao;

import com.teksystems.capstone.database.entity.User;
import org.junit.jupiter.api.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.context.ActiveProfiles;

import static org.junit.jupiter.api.Assertions.*;

@DataJpaTest
@ActiveProfiles({"test", "default"})
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
class UserDAOTest {

    @Autowired
    private UserDAO userDao;

    User user;

    @BeforeEach
    void name() {
        user = new User(
                108,
                "frank",
                "testermon",
                "email@email.com",
                "bob",
                "password1",
                99,
                69,
                42,
                "../../../pub/images/placeholder.png",
                "125-456-7890",
                "123 Fake Street",
                "nice guy",
                "Lorem ipsum is placeholder text for blah blah blah.",
                "USER"
        );
    }

    @Test
    void findUserByEmail() {
        userDao.save(user);
        Assertions.assertEquals(userDao.findUserByEmail(user.getEmail()).getEmail(), ("email@email.com"));
    }
}
