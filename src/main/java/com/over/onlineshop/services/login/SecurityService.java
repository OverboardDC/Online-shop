package com.over.onlineshop.services.login;

public interface SecurityService {

    String findLoggerInUsername();

    void autoLogin(String username, String password);
}
