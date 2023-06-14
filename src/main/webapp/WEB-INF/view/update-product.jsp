<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Update sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="shortcut icon" type="image/png" href="http://localhost:19943/image/logo-mon-gau-bong.png">
</head>
<body>
<style>
    <%@include file="../css/footer.css"%>
    <%@include file="../css/header.css"%>
</style>
<jsp:include page="../layout/header.jsp"/>
<div class="container">
    <section>
        <div class="textTop">
            <h2>Update product</h2>
        </div>
        <form action="/mon-gau-bong/quan-li-san-pham/update/${productId}" method="post"modelattribute="product">
            <div class="mb-3">
                <label class="form-label">ID sản phẩm</label>
                <input type="text" class="form-control" name="productId" value="${detail.productId}"/>
            </div>
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
                <select class="form-select" aria-label="Default select example" name="size">
                    <option value="500cm"${detai.size == "500cm"}>500cm</option>
                    <option value="1m2" ${detai.size == "1m2"}>1m2</option>
                    <option value="1m5" ${detai.size == "1m5"}>1m5</option>
                    <option value="1m8" ${detai.size == "1m8"}>1m8</option>
                    <option value="2m" ${detai.size == "2m"}>2m</option>
                </select>
            </div>
            <div class="mb-3">
                <label class="form-label">Màu sắc</label>
                <input type="text" class="form-control" name="color" value="${detail.color}"/>
            </div>
            <div class="mb-3">
                <label class="form-label">Hình ảnh</label>
                <input type="text" class="form-control" name="image" value="${detail.image}"/>
            </div>
            <div class="mb-3">
                <label class="form-label">Giá bán</label>
                <input type="text" class="form-control" name="price" value="${detail.price}"/>
            </div>
            <div class="mb-3">
                <label class="form-label">Giá nhập</label>
                <input type="text" class="form-control" name="importPrice" value="${detail.importPrice}"/>
            </div>
            <div class="mb-3">
                <label class="form-label">Số lượng</label>
                <input type="text" class="form-control" name="quantity" value="${detai.quantity}"/>
            </div>
            <div class="mb-3">
                <label class="form-label">Chất liệu</label>
                <input type="text" class="form-control" name="material" value="${detail.material}"/>
            </div>
            <div class="mb-3">
                <label class="form-label">Mô tả</label>
                <input type="text" class="form-control" name="describe" value="${detail.describe}"/>
            </div>
            <div class="mb-3">
                <label class="form-label">Năm bảo hành</label>
                <input type="text" class="form-control" name="namBh" value="${detail.namBh}"/>
            </div>
            <div class="mb-3">
                <label class="form-label">Trạng thái</label>

                <div class="form-check">
                    <input class="form-check-input" type="radio" name="status" id="flexRadioDefault1"
                           value="true" ${detail.status == true ? "checked":""}>
                    <label class="form-check-label" for="flexRadioDefault1">
                        Còn hàng
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="status" id="flexRadioDefault2"
                           value="false"${detail.status == false ? "checked":""}>
                    <label class="form-check-label" for="flexRadioDefault2">
                        Hết hàng
                    </label>
                </div>
            </div>
            <div class="mb-3">
                <button type="submit" class="btn btn-outline-dark">Update</button>
            </div>
        </form>
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