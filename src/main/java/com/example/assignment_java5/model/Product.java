package com.example.assignment_java5.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.annotations.GenericGenerator;

import java.math.BigDecimal;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Builder
@Entity
@Table(name = "product")
public class Product {
    @Id
    @GenericGenerator(name = "uuid2", strategy = "uuid2")
    @GeneratedValue(generator = "uuid2")
    @Column(name = "id", columnDefinition = "uniqueidentifier")
    private String productId;

    @Column(name = "masanpham")
    private String productCode;

    @Column(name = "tensanpham")
    private String productName;

    @Column(name = "hinhanh")
    private String image;

    @Column(name = "mausac")
    private String color;

    @Column(name = "kichthuoc")
    private String size;

    @Column(name = "chatlieu")
    private String material;

    @Column(name = "nambh")
    private Integer namBh;

    @Column(name = "mota")
    private String describe;

    @Column(name = "soluong")
    private Integer quantity;

    @Column(name = "gianhap")
    private BigDecimal importPrice;

    @Column(name = "giaban")
    private BigDecimal price;

    @Column(name = "trangthai")
    private Boolean status;

}
