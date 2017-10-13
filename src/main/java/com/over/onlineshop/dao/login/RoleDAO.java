package com.over.onlineshop.dao.login;

import com.over.onlineshop.entities.Role;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleDAO extends JpaRepository<Role, Long> {
}
