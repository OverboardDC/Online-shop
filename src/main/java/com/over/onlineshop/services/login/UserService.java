package com.over.onlineshop.services.login;

import com.over.onlineshop.entities.User;

public interface UserService {

    void save(User user);

    User findByUsername(String username);
}
