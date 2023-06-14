<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Chi tiết hóa đơn</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link rel="shortcut icon" type="image/png" href="http://localhost:19943/image/logo-mon-gau-bong.png">
</head>
<body>
<style>
    <%@include file="../css/detail-order.css"%>
</style>
<section class="h-100 gradient-custom">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-lg-10 col-xl-8">
                <div class="card" style="border-radius: 10px;">
                    <a href="/mon-gau-bong/quan-li-hoa-don" class="close">
                        <button type="button" class="btn-close" aria-label="Close"></button>
                    </a>
                    <div class="card-header px-4 py-5">
                        <h5 class="text-muted mb-0">Thanks for your Order, <span style="color: #a8729a;">Diệu Linh Gấu Bông</span>!
                        </h5>
                    </div>
                    <div class="card-body p-4">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <p class="lead fw-normal mb-0" style="color: #a8729a;">Chi tiết hóa đơn</p>
                            <p class="small text-muted mb-0">Mã hóa đơn : ${detailBill.billId}</p>
                        </div>
                        <div class="card shadow-0 border mb-4">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-2">
                                        <img src="http://localhost:19943/image/${detailBill.product.image}"
                                             class="img-fluid" alt="...">
                                    </div>
                                    <div class="col-md-2">
                                        <p class="">Tên sản phẩm: ${detailBill.product.productName}</p>
                                    </div>
                                </div>
                                <hr class="mb-4" style="background-color: #e0e0e0; opacity: 1;">
                                <div class="row d-flex align-items-center">
                                    <div class="col-md-2">
                                        <p class="text-muted mb-0 small">Track Order</p>
                                    </div>
                                    <div class="col-md-10">
                                        <div class="progress" style="height: 6px; border-radius: 16px;">
                                            <div class="progress-bar" role="progressbar"
                                                 style="width: 65%; border-radius: 16px; background-color: #a8729a;"
                                                 aria-valuenow="65"
                                                 aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                        <div class="d-flex justify-content-around mb-1">
                                            <p class="text-muted mt-1 mb-0 small ms-xl-5">Out for delivary</p>
                                            <p class="text-muted mt-1 mb-0 small ms-xl-5">Delivered</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="d-flex justify-content-between pt-2">
                            <p class="fw-bold mb-0">Thông tin khách hàng
                            </p>
                        </div>
                        <div class="d-flex justify-content-between pt-2">
                            <p class="text-muted mb-0">Tên người nhận : ${detailBill.recipientIsName}</p>
                            <p class="text-muted mb-0"><span
                                    class="fw-bold me-4">Giá sản phẩm: </span>${detailBill.product.price} vnđ</p>
                        </div>
                        <div class="d-flex justify-content-between pt-2">
                            <p class="text-muted mb-0">Số điện thoại : ${detailBill.phoneNumber}</p>
                            <p class="text-muted mb-0"><span
                                    class="fw-bold me-4">Số lượng: </span>${detailBill.quantity}</p>
                        </div>

                        <div class="d-flex justify-content-between">
                            <p class="text-muted mb-0">Ngày thanh toán : ${detailBill.dateOfPayment}</p>
                            <p class="text-muted mb-0"><span class="fw-bold me-4">Phí giao hàng:</span> Free</p>
                        </div>
                        <div class="d-flex justify-content-between mb-5">
                            <p class="text-muted mb-0">Địa chỉ: ${detailBill.address}</p>
                        </div>
                    </div>
                    <div class="card-footer border-0 px-4 py-5"
                         style="background-color: #a8729a; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">
                        <h5 class="d-flex align-items-center justify-content-end text-white text-uppercase mb-0">
                            Thành
                            tiền: <span class="h2 mb-0 ms-2"></span> ${detailBill.intoMoney} vnđ</h5>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
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