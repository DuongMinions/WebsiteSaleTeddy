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

import java.math.BigDecimal;
import java.sql.Date;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder
@Entity
@Table(name = "bill")
public class Bill {
    @Id
    @GenericGenerator(name = "uuid2", strategy = "uuid2")
    @GeneratedValue(generator = "uuid2")
    @Column(name = "id", columnDefinition = "uniqueidentifier")
    private String billId;

    @ManyToOne
    @JoinColumn(name = "idkh")
    private Account account;

    @ManyToOne
    @JoinColumn(name = "idsp")
    private Product product;

    @ManyToOne
    @JoinColumn(name = "idcart")
    private Cart cart;

    @Column(name = "ngaytao")
    private Date dateCreated;

    @Column(name = "ngaythanhtoan")
    private Date dateOfPayment;

    @Column(name = "ngayship")
    private Date dateShip;

    @Column(name = "ngaynhan")
    private Date receivedDate;

    @Column(name = "tinhtrang")
    private Integer status;

    @Column(name = "tennguoinhan")
    private String recipientIsName;

    @Column(name = "diachi")
    private String address;

    @Column(name = "sdt")
    private String phoneNumber;

    @Column(name = "soluong")
    private Integer quantity;

    @Column(name = "dongia")
    private BigDecimal unitPrice;

    @Column(name = "thanhtien")
    private BigDecimal intoMoney;
}
