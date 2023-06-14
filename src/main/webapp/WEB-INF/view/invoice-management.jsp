<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Quản lí hóa đơn</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="shortcut icon" type="image/png" href="http://localhost:19943/image/logo-mon-gau-bong.png">
</head>
<body>
<style>
    <%@include file="../css/footer.css"%>
    <%@include file="../css/header.css"%>
    <%@include file="../css/invoice.css"%>
</style>
    <jsp:include page="../layout/header.jsp"></jsp:include>
<div class="container">
    <section class="allQuanLi">
        <div class="textBill">
            <h2>Thông tin hóa đơn</h2>
        </div>
        <div class="tableSanPham">
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">Mã hóa đơn</th>
                    <th scope="col">Khách hàng</th>
                    <th scope="col">Sản phẩm</th>
                    <th scope="col">Ngày tạo</th>
                    <th scope="col">Ngày thanh toán</th>
                    <th scope="col">Ngày nhận</th>
                    <th scope="col">Số lượng</th>
                    <th scope="col">Tổng tiền</th>
                    <th scope="col">Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${listBill}" var="bill">
                    <tr>
                        <td>${bill.billId}</td>
                        <td>${bill.account.fullName}</td>
                        <td>${bill.product.productName}</td>
                        <td>${bill.dateCreated}</td>
                        <td>${bill.dateOfPayment}</td>
                        <td>${bill.receivedDate}</td>
                        <td>${bill.quantity}</td>
                        <td>${bill.intoMoney}</td>
                        <td>
                            <a href="/mon-gau-bong/quan-li-hoa-don/chi-tiet/${bill.billId}"><button class="btn btn-outline-dark">Chi tiết</button></a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </section>
</div>
<footer>
    <div class="container">
        <div class="allFooter">
            <div class="row">
                <div class="col-lg-3">
                    <div class="textFooterTren">
                        <h3>Tất cả sản phẩm</h3>
                    </div>
                    <div class="textFooterDuoi">
                        <ul>
                            <li><a href="#">Gấu bông asa</a></li>
                            <li><a href="#">Gấu bông tanjiro</a></li>
                            <li><a href="#">Gấu Bông Anime</a></li>
                            <li><a href="#">Phụ kiện gấu bông</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="textFooterTren">
                        <h3>Chính sách mua hàng</h3>
                    </div>
                    <div class="textFooterDuoi">
                        <p>Hình thức thanh toán</p>
                        <p>Chính sách giao hàng</p>
                        <p>Chính sách bảo hành</p>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="textFooterTren"><h3>Thông tin liên hệ</h3></div>
                    <div class="textFooterDuoi">
                        <p>Điện thoại: 0388049008</p>
                        <p>Email: Duongtvph19943@fpt.edu.vn</p>
                        <p>Website: mongaubong.com</p>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="textFooterTren">
                        <h3>MON GẤU BÔNG</h3>
                    </div>
                    <div class="textFooterDuoi">
                        <p>Mã số thuế: 0108195925</p>
                        <img src="https://kinhmatanna.com/wp-content/uploads/2022/06/logoSaleNoti.png" alt="" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"
        integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js"
        integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ"
        crossorigin="anonymous"></script>
</body>
</html>