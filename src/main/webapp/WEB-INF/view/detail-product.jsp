<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Chi tiết sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="shortcut icon" type="image/png" href="http://localhost:19943/image/logo-mon-gau-bong.png">
</head>
<body>
<style>
    <%@include file="../css/footer.css"%>
    <%@include file="../css/detail.css"%>
</style>
<jsp:include page="../layout/header.jsp"/>
<div class="container">
    <div class="detailForm">
        <section>
            <div class="row">
                <div class="textChiTiet">
                    <h2>Sản phẩm chi tiết</h2>
                </div>
                <div class="col-xl-6">
                    <div class="itemDetail">
                        <img
                                src="http://localhost:19943/image/${detail.image}"
                                class="card-img-top"
                                alt="..."
                        />
                    </div>
                </div>
                <div class="col-xl-6">
                    <div class="productNameDetail">
                        <h4>Tên sản phẩm: ${detail.productName}</h4>
                    </div>
                    <div class="productPriceDetail">
                        <span>Giá sản phẩm: </span>
                        <span style="color: red">${detail.price}</span>
                        <span> vnđ</span>
                    </div>
                    <div class="noteDetail">
                        <p>Kích thước: ${detail.size}</p>
                        <p>Màu sắc: ${detail.color}</p>
                        <p>Chất liệu: ${detail.material}</p>
                        <p>Mô tả: <span>${detail.describe}</span></p>
                    </div>
                    <div class="card-body">
                        <div class="buttonAll">

                            <a href="/mon-gau-bong/buy-now/${productId}">
                                <button type="button" class="btn btn-outline-dark">Mua ngay</button>
                            </a>
                            <a href="/mon-gau-bong/gio-hang/add-to-cart/${productId}" class="card-link">
                                <button type="button" class="btn btn-outline-dark"><img width="28"
                                                                                        height="28"
                                                                                        src="https://img.icons8.com/nolan/64/shopping-cart.png"
                                                                                        alt="shopping-cart"/>Thêm
                                    vào giỏ hàng
                                </button>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="productKhac">
                <div class="productText">
                    <h2>Sản phẩm khác</h2>
                </div>
                <div class="productDuoi">
                    <div class="row row-cols-1 row-cols-md-3 g-4">
                        <c:forEach items="${productList}" var="sp">
                            <div class="col-4">
                                <div class="card" style="width: 26rem;">
                                    <a href="/mon-gau-bong/detail/${sp.productId}">
                                        <img src="http://localhost:19943/image/${sp.image}" class="card-img-top"
                                             alt="...">
                                    </a>
                                    <div class="card-body">
                                        <h5 class="card-title">${sp.productName}</h5>
                                        <p class="card-text">Giá sản phẩm: <span
                                                style="color: red">${sp.price}</span>
                                            vnđ</p>
                                        <a href="/mon-gau-bong/buy-now/${sp.productId}" class="card-link">
                                            <button type="button" class="btn btn-outline-success">Mua ngay</button>
                                        </a>
                                        <a href="/mon-gau-bong/gio-hang/add-to-cart/${sp.productId}" class="card-link">
                                            <button type="button" class="btn btn-outline-dark"><img width="28"
                                                                                                       height="28"
                                                                                                       src="https://img.icons8.com/nolan/64/shopping-cart.png"
                                                                                                       alt="shopping-cart"/>Thêm
                                                vào giỏ hàng
                                            </button>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                </div>
            </div>
        </section>
    </div>
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
                        <img src="https://kinhmatanna.com/wp-content/uploads/2022/06/logoSaleNoti.png" alt=""/>
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