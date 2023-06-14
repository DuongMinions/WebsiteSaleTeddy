package com.example.assignment_java5.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.annotations.GenericGenerator;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
@Builder
@Entity
@Table(name = "cart")
public class Cart {
    @Id
    @GenericGenerator(name = "uuid2", strategy = "uuid2")
    @GeneratedValue(generator = "uuid2")
    @Column(name = "id", columnDefinition = "uniqueidentifier")
    private String cartId;

    @ManyToOne
    @JoinColumn(name = "idkh")
    private Client client;

    @ManyToOne
    @JoinColumn(name = "idsp")
    private Product product;

    @Column(name = "magiohang")
    private String cartCode;

    @Column(name = "ngaytao")
    private Date dateCreated;

    @Column(name = "ngaythanhtoan")
    private Date dateOfPayment;

    @Column(name = "tennguoinhan")
    private String recipientIsName;

    @Column(name = "diachi")
    private String address;

    @Column(name = "sdt")
    private String phoneNumber;

    @Column(name = "tinhtrang")
    private Integer status;

    @Column(name = "soluong")
    private Integer quantity;

    @Column(name = "dongia")
    private BigDecimal unitPrice;

    @Column(name = "dongiagiam")
    private BigDecimal reducedUnitPrice;

    @Column(name = "thanhtien")
    private BigDecimal intoMoney;

}
