package com.example.assignment_java5.service.impl;

import com.example.assignment_java5.model.Client;
import com.example.assignment_java5.repository.IClientRepository;
import com.example.assignment_java5.service.IClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ClientServiceImpl implements IClientService {
    @Autowired
    private IClientRepository iClientRepository;
    @Override
    public Client getOne(String clientId) {
        return iClientRepository.findById(clientId).get();
    }
}
