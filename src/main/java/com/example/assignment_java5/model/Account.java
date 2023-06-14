package com.example.assignment_java5.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.annotations.GenericGenerator;
import org.springframework.stereotype.Component;

@Component
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder
@Entity
@Table(name = "account")
public class Account {
    @Id
    @GenericGenerator(name = "uuid2", strategy = "uuid2")
    @GeneratedValue(generator = "uuid2")
    @Column(name = "id", columnDefinition = "uniqueidentifier")
    private String accountId;

    @ManyToOne
    @JoinColumn(name = "idkh")
    private Client client;

    @Column(name = "username")
    private String username;

    @Column(name = "passwords")
    private String password;

    @Column(name = "role")
    private String role;

    @Column(name = "hoten")
    private String fullName;

    @Column(name = "email")
    private String email;
}
