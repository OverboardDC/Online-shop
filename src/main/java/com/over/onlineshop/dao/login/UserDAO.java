package com.over.onlineshop.dao.login;

import com.over.onlineshop.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserDAO extends JpaRepository<User, Long> {

    User findByUsername(String username);
}
