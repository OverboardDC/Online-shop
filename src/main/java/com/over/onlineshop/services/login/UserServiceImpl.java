package com.over.onlineshop.services.login;

import com.over.onlineshop.dao.login.RoleDAO;
import com.over.onlineshop.dao.login.UserDAO;
import com.over.onlineshop.entities.Role;
import com.over.onlineshop.entities.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashSet;
import java.util.Set;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private SessionFactory sessionFactory;

    @Autowired
    private UserDAO userDAO;

    @Autowired
    private RoleDAO roleDAO;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    @Transactional
    public void save(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        Set<Role> roles = new HashSet<>();
        roles.add(roleDAO.getOne(1L));
        user.setRoles(roles);
        getSession().persist(user);
    }


    @Override
    public User findByUsername(String username) {
        return this.userDAO.findByUsername(username);
    }

    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }
}
