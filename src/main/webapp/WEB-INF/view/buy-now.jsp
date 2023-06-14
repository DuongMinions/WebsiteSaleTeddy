<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Mua hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link rel="shortcut icon" type="image/png" href="http://localhost:19943/image/logo-mon-gau-bong.png">
</head>
<body>
<style>
    <%@include file="../css/buy-now.css"%>
</style>
<div class="container d-lg-flex">
    <div class="box-1 bg-light user">
        <div class="d-flex align-items-center mb-3">
            <img src="https://images.pexels.com/photos/4925916/pexels-photo-4925916.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"
                 class="pic rounded-circle" alt="">
            <p class="ps-2 name">Trần Diêu Linh</p>
        </div>
        <div class="box-inner-1 pb-3 mb-3 ">
            <div class="d-flex justify-content-between mb-3 userdetails">
                <p class="fw-bold">Sản phẩm</p>
            </div>
            <div id="my" class="carousel slide carousel-fade img-details" data-bs-ride="carousel"
                 data-bs-interval="2000">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#my" data-bs-slide-to="0" class="active"
                            aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#my" data-bs-slide-to="1" aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#my" data-bs-slide-to="2" aria-label="Slide 3"></button>
                </div>
<%--                <c:forEach items="${detailBuyNow}" var="buy">--%>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="http://localhost:19943/image/${detailBuyNow.image}"
                             class="d-block w-100" width="100" height="100">
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#my" data-bs-slide="prev">
                    <div class="icon">
                        <span class="fas fa-arrow-left"></span>
                    </div>
                    <span class="visually-hidden">Previous</span>
                </button>

                <button class="carousel-control-next" type="button" data-bs-target="#my" data-bs-slide="next">
                    <div class="icon">
                        <span class="fas fa-arrow-right"></span>
                    </div>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
            <p class="dis info my-3">
                Tên sản phẩm: ${detailBuyNow.productName}
            </p>
<%--            </c:forEach>--%>
        </div>
    </div>
    <div class="box-2">
        <div class="box-inner-2">
            <div>
                <p class="fw-bold">Payment Details</p>
                <p class="dis mb-3">Complete your purchase by providing your payment details</p>
            </div>
            <form action="/mon-gau-bong/add-buy-now" method="Post">
                <div class="mb-3">
                    <p class="dis fw-bold mb-2">Tên người nhận</p>
                    <input class="form-control" type="text" name="nameClient">
                </div>
                <div>
                    <p class="dis fw-bold mb-2">Email</p>
                    <div class="d-flex align-items-center justify-content-between card-atm border rounded">
                        <div class="fab fa-cc-visa ps-3"></div>
                        <input type="text" class="form-control" placeholder="Email">
                        <div class="d-flex w-50">
                            <input type="text" class="form-control px-0" placeholder="MM/YY">
                            <input type="password" maxlength=3 class="form-control px-0" placeholder="CVV">
                        </div>
                    </div>
                    <div class="my-3 cardname">
                        <p class="dis fw-bold mb-2">Số điện thoại</p>
                        <input class="form-control" type="text" name="phoneClient">
                    </div>
                    <div class="address">
                        <div class=" my-3">
                            <p class="dis fw-bold mb-2">Địa chỉ</p>
                            <div class="inputWithcheck">
                                <input class="form-control" type="text" name="address"
                                       placeholder="thôn/xã/huyện/tỉnh">
                                <span class="fas fa-check"></span>
                            </div>
                        </div>
<%--                        <c:forEach items="${}" var="buy">--%>
                        <div class="d-flex flex-column dis">
                            <div class="d-flex align-items-center justify-content-between mb-2">
                                <p>Số lượng</p>
                                <input class="form-control" type="text" name="quantity">
                            </div>
                            <div class="d-flex align-items-center justify-content-between mb-2">
                                <p class="fw-bold">Thành tiền</p>
                                <p class="fw-bold"><span class="fas fa-dollar-sign"></span>${sumBill} vnđ</p>
                            </div>
                            <button type="submit" class="btn btn-primary mt-2" onclick="return confirm('Thanh toán thành công')">Đặt hàng<span
                                    class="fas fa-dollar-sign px-1"></span>${sumBill} vnđ
                            </button>
                        </div>
<%--                        </c:forEach>--%>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"
        integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS"
        crossorigin="anonymous"></script>
</body>
</html>