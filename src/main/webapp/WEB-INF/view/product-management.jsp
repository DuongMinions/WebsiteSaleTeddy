<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Quản lí sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="shortcut icon" type="image/png" href="http://localhost:19943/image/logo-mon-gau-bong.png">
</head>
<body>
<style>
    <%@include file="../css/footer.css"%>
    <%@include file="../css/header.css"%>
    <%@include file="../css/quan-li-san-pham.css"%>
</style>
<header>
    <div class="menuGauBong">
        <nav class="navbar bg-body-tertiary">
            <div class="container-fluid">
                <a class="navbar-brand" href="/mon-gau-bong/trang-chu">
                    <img src="https://teddy.vn/wp-content/uploads/2023/03/logo-add-01gg-e1680256236315.png"
                         alt="Logo" width="30" height="24" class="d-inline-block align-text-top">
                    <span style="font-weight: bold; color: #f605c2">Diệu Linh</span><span
                        style="font-weight: bold; color: #790281"> Gấu Bông</span>
                </a>
                <nav class="navbar navbar-expand-lg bg-body-tertiary">
                    <div class="container-fluid">

                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                <li class="nav-item">
                                    <a class="navbar-brand" href="/mon-gau-bong/trang-chu">Trang chủ</a>
                                </li>
                                <li class="nav-item">
                                    <a class="navbar-brand" aria-current="page" href="/mon-gau-bong/quan-li-hoa-don">Quản lí hóa đơn</a>
                                </li>
                                <li class="nav-item">
                                    <a class="navbar-brand" href="/mon-gau-bong/quan-li-san-pham">Quản lí sản
                                        phẩm</a>
                                </li>
                                <li class="nav-item">
                                    <a class="navbar-brand" href="/mon-gau-bong/thong-ke">Thống kê</a>
                                </li>
                            </ul>
                            <form class="d-flex" role="search" method="get"
                                  action="/mon-gau-bong/quan-li-san-pham/search">
                                <input class="form-control me-2" type="search" placeholder="Tìm kiếm sản phẩm"
                                       aria-label="Search" value="${param.productName}" name="products">
                                <button class="btn btn-outline-primary" type="submit"><img width="30" height="30"
                                                                                           src="https://img.icons8.com/3d-fluency/30/search.png"
                                                                                           alt="search"/></button>
                            </form>
                            <a href="/mon-gau-bong/gio-hang">
                                <button type="button" class="btn btn-light position-relative">
                                    <img width="30" height="30" src="https://img.icons8.com/nolan/64/shopping-cart.png"
                                         alt="shopping-cart"/>
                                    <span class="position-absolute top-0 start-90 translate-middle badge rounded-pill bg-danger">
                                         <c:choose>
                                             <c:when test="${quantityInCart>=1}">
                                                 <span>${quantityInCart}</span>
                                             </c:when>
                                         </c:choose>
                                    <span class="visually-hidden">unread messages</span>
                                  </span>
                                </button>
                            </a>
                            <%--                            <a href="/mon-gau-bong/login">--%>
                            <%--                                <button type="button" class="btn btn-light position-relative">--%>
                            <%--                                    <img width="30" height="30"--%>
                            <%--                                         src="https://img.icons8.com/3d-fluency/94/user-male-circle.png"--%>
                            <%--                                         alt="user-male-circle"/>--%>
                            <%--                                </button>--%>
                            <%--                            </a>--%>
                            <c:choose>
                                <c:when test="${sessionScope.account!=null}">
                                    <a class="nav-link" href="#"
                                       style="margin-left: 25px; margin-right: 25px; font-size: 22px; font-weight: bold; font-family: 'Berlin Sans FB Demi'">${sessionScope.account.fullName}</a>
                                    <a class="nav-link" href="/mon-gau-bong/logout" style="font-size: 10px"><img
                                            width="36" height="36"
                                            src="https://img.icons8.com/fluency/48/logout-rounded.png"
                                            alt="logout-rounded"/></a>
                                </c:when>
                                <c:otherwise>
                                    <a class="nav-link" href="/mon-gau-bong/login"
                                       style="margin-left: 25px; margin-right: 25px; font-size: 20px">
                                        <button type="button" class="btn btn-light position-relative">
                                            <img width="30" height="30"
                                                 src="https://img.icons8.com/3d-fluency/94/user-male-circle.png"
                                                 alt="user-male-circle"/>
                                        </button>
                                    </a>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </nav>
            </div>
        </nav>
    </div>
    <div class="bannerGauBong">
        <div id="carouselExampleCaptions" class="carousel slide">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active"
                        aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1"
                        aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2"
                        aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="https://teddy.vn/wp-content/uploads/2022/08/Banner-teddy-1.jpg" class="d-block w-100"
                         alt="...">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>First slide label</h5>
                        <p>Some representative placeholder content for the first slide.</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="https://teddy.vn/wp-content/uploads/2022/08/Banner-teddy-2.jpg" class="d-block w-100"
                         alt="...">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Second slide label</h5>
                        <p>Some representative placeholder content for the second slide.</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="https://teddy.vn/wp-content/uploads/2022/08/Bannerslide-teddy.jpg"
                         class="d-block w-100" alt="...">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Third slide label</h5>
                        <p>Some representative placeholder content for the third slide.</p>
                    </div>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions"
                    data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions"
                    data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </div>
</header>
<div class="container">
    <section class="allQuanLi">
        <div class="textQuanLi">
            <h2>Product Management</h2>
        </div>
        <form action="/mon-gau-bong/quan-li-san-pham/add" method="post" enctype="multipart/form-data">
            <div class="mb-3">
                <label class="form-label">Mã sản phẩm</label>
                <input type="text" class="form-control" name="productCode" value="${detail.productCode}"/>
            </div>
            <div class="mb-3">
                <label class="form-label">Tên sản phẩm</label>
                <input type="text" class="form-control" name="productName" value="${detail.productName}"/>
            </div>
            <div class="mb-3">
                <label class="form-label">Kích thước sản phẩm</label>
                <select class="form-select" aria-label="Default select example" name="size" >
                    <option value="500cm">500cm</option>
                    <option value="1m2">1m2</option>
                    <option value="1m5">1m5</option>
                    <option value="1m8">1m8</option>
                    <option value="2m">2m</option>
                </select>
            </div>
            <div class="mb-3">
                <label class="form-label">Màu sắc</label>
                <input type="text" class="form-control" name="color" />
            </div>
            <div class="mb-3">
                <label class="form-label">Hình ảnh</label>
                <input type="file" class="form-control" name="image" id="formFileMultiple"/>
            </div>
            <div class="mb-3">
                <label class="form-label">Giá bán</label>
                <input type="text" class="form-control" name="price"/>
            </div>
            <div class="mb-3">
                <label class="form-label">Giá nhập</label>
                <input type="text" class="form-control" name="importPrice"/>
            </div>
            <div class="mb-3">
                <label class="form-label">Số lượng</label>
                <input type="text" class="form-control" name="quantity"/>
            </div>
            <div class="mb-3">
                <label class="form-label">Chất liệu</label>
                <input type="text" class="form-control" name="material"/>
            </div>
            <div class="mb-3">
                <label class="form-label">Mô tả</label>
                <input type="text" class="form-control" name="describe"/>
            </div>
            <div class="mb-3">
                <label class="form-label">Năm bảo hành</label>
                <input type="text" class="form-control" name="namBh"/>
            </div>
            <div class="mb-3">
                <label class="form-label">Trạng thái</label>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="status" id="flexRadioDefault1">
                    <label class="form-check-label" for="flexRadioDefault1">
                        Còn hàng
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="status" id="flexRadioDefault2">
                    <label class="form-check-label" for="flexRadioDefault2">
                        Hết hàng
                    </label>
                </div>
            </div>
            <div class="mb-3">
                <button type="submit" class="btn btn-outline-dark">Add</button>
            </div>
        </form>
        <div class="textTable">
            <h2>Table Product</h2>
        </div>
        <div class="tableSanPham">
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">Hình ảnh</th>
                    <th scope="col">Mã sản phẩm</th>
                    <th scope="col">Tên sản phẩm</th>
                    <th scope="col">Kích thước</th>
                    <th scope="col">Màu sắc</th>
                    <th scope="col">Số lượng</th>
                    <th scope="col">chất liệu</th>
                    <th scope="col">mô tả</th>
                    <th scope="col">giá nhập</th>
                    <th scope="col">giá bán</th>
                    <th scope="col">trạng thái</th>
                    <th scope="col">Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${productList}" var="sp">
                    <tr>
                        <td><img src="http://localhost:19943/image/${sp.image}" alt="" width="50px" height="50px"></td>
                        <td>${sp.productCode}</td>
                        <td>${sp.productName}</td>
                        <td>${sp.size}</td>
                        <td>${sp.color}</td>
                        <td>${sp.quantity}</td>
                        <td>${sp.material}</td>
                        <td>${sp.describe}</td>
                        <td>${sp.importPrice}</td>
                        <td>${sp.price}</td>
                        <td>
                            <c:if test="${sp.status == 'true'}">Còn hàng</c:if>
                            <c:if test="${sp.status == 'false'}">Hết hàng</c:if>
                        </td>
                        <td>
                            <a href="/mon-gau-bong/quan-li-san-pham/delete/${sp.productId}" onclick="return confirm('you definitely want to delete ?')"><button class="btn btn-outline-dark">Delete</button></a>
                            <a href="/mon-gau-bong/detail/${sp.productId}"><button class="btn btn-outline-dark">Detail</button></a>
                            <a href="/mon-gau-bong/quan-li-san-pham/update/${sp.productId}"><button class="btn btn-outline-dark">Update</button></a>
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