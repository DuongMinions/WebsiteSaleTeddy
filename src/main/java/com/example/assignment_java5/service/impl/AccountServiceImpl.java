package com.example.assignment_java5.service.impl;

import com.example.assignment_java5.model.Account;
import com.example.assignment_java5.repository.IAccountRepository;
import com.example.assignment_java5.service.IAccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AccountServiceImpl implements IAccountService {
    @Autowired
    private IAccountRepository iAccountRepository;

    @Override
    public Account findByAccountId(String id) {
        return iAccountRepository.findAllByAccountId(id);
    }

    @Override
    public Account findByUsernameAndPassword(String username, String passwword) {
        return iAccountRepository.findByUsernameAndPassword(username, passwword);
    }
}
