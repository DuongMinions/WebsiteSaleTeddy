package com.example.assignment_java5.repository;

import com.example.assignment_java5.model.Account;
import org.springframework.data.jpa.repository.JpaRepository;

public interface IAccountRepository extends JpaRepository<Account, String> {
    Account findAllByAccountId(String id);

    Account findByUsernameAndPassword(String username, String password);
}
