package com.example.assignment_java5.repository;

import com.example.assignment_java5.model.Bill;
import com.example.assignment_java5.model.customer.Top10BanChay;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface IBillRepository extends JpaRepository<Bill, String> {
    String str_AnyFindByName = "select top(10) sum(Bill.SoLuong) as 'Sum', IdSP as 'idProduct',  TenSanPham as 'nameProduct' \n" +
            "from Bill join Product on Bill.Idsp= Product.id group by \n" +
            "IdSP,  tensanpham order by sum(Bill.SoLuong) desc";
    @Query(value = str_AnyFindByName, nativeQuery = true)
    List<Top10BanChay> findTopByQuantity();
}
