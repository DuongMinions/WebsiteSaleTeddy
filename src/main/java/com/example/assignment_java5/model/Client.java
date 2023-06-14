package com.example.assignment_java5.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.annotations.GenericGenerator;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
@Builder
@Entity
@Table(name = "client")
public class Client {
    @Id
    @GenericGenerator(name = "uuid2", strategy = "uuid2")
    @GeneratedValue(generator = "uuid2")
    @Column(name = "id", columnDefinition = "uniqueidentifier")
    private String clientId;

    @Column(name = "makhachhang")
    private String clientCode;

    @Column(name = "ten")
    private String name;

    @Column(name = "tendem")
    private String middleName;

    @Column(name = "ho")
    private String surname;

    @Column(name = "ngaysinh")
    private Date dateOfBirth;

    @Column(name = "sdt")
    private String phoneNumber;

    @Column(name = "diachi")
    private String address;

    @Column(name = "thanhpho")
    private String city;

    @Column(name = "quocgia")
    private String nation;

    @Column(name = "matkhau")
    private String password;

}
