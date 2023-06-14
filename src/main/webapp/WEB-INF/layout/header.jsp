<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
    <div class="menuGauBong">
        <nav class="navbar bg-body-tertiary">
            <div class="container-fluid">
                <a class="navbar-brand" href="/view/trang-chu">
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
                                       aria-label="Search" value="${param.tenSanPham}" name="products">
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