package com.example.assignment_java5.repository;

import com.example.assignment_java5.model.Client;
import org.springframework.data.jpa.repository.JpaRepository;

public interface IClientRepository extends JpaRepository<Client, String> {
}
