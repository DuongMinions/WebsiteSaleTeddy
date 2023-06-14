package com.example.assignment_java5.service;

import com.example.assignment_java5.model.Account;

public interface IAccountService {
    Account findByAccountId(String id);
    Account findByUsernameAndPassword(String username, String passwword);
}
