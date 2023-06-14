<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Giỏ hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="shortcut icon" type="image/png" href="http://localhost:19943/image/logo-mon-gau-bong.png">
</head>
<body>
<style>
    <%@include file="../css/footer.css"%>
    <%@include file="../css/header.css"%>
    <%@include file="../css/cart.css"%>
</style>
<jsp:include page="../layout/header.jsp"/>
<div class="container">
    <section>
        <div class="row">
            <div class="col-8">
                <div class="textCart">
                    <h2>Giỏ hàng của bạn</h2>
                </div>
                <div class="productCart">
                    <table class="table">
                        <thead>
                        <th class="textInfomation">Ảnh sản phẩm</th>
                        <th class="textInfomation">Tên sản phẩm</th>
                        <th class="textInfomation">Giá sản phẩm</th>
                        <th class="textInfomation">Số lượng</th>
                        </thead>
                        <tbody>
                        <c:forEach items="${listProductInCart}" var="sp">
                            <tr>
                                <th scope="row"><a href="/mon-gau-bong/detail/${sp.key.productId}"><img
                                        src="http://localhost:19943/image/${sp.key.image}" alt=""
                                        style="width: 80px; height: 80px"></a></th>
                                <td class="information">${sp.key.productName}</td>
                                <td class="information">${sp.key.price} vnđ</td>
                                <td class="information">${sp.value}</td>
                                <td><a href="/delete-cart/${sp.key.productId}" class="informations">
                                    <button type="button" class="btn btn-outline-danger">
                                        <img width="20" height="20"
                                             src="https://img.icons8.com/nolan/30/delete-sign.png"
                                             alt="delete-sign"/></button>
                                </a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="col-4">
                <div class="textThanhToan">
                    <h2>Thanh toán</h2>
                </div>
                <div class="thanhToan">
                    <form class="row g-3" action="/mon-gau-bong/add-bill" method="post">
                        <div class="col-md-6">
                            <label class="form-label">Họ và tên</label>
                            <input type="text" class="form-control" placeholder="Nguyễn Văn A" name="nameClient"
                                   value="${param.nameClient}">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Số điện thoại</label>
                            <input type="text" class="form-control" placeholder="0312345678" name="phoneClient"
                                   value="${param.phoneClient}" required>
                        </div>
                        <div class="col-12">
                            <select class="form-select form-select-sm mb-3" id="city" aria-label=".form-select-sm">
                                <option value="${param.tinh}" selected class="diaChiOption" name="tinh">Chọn tỉnh
                                    thành
                                </option>
                            </select>

                            <select class="form-select form-select-sm mb-3" id="district" aria-label=".form-select-sm">
                                <option value="${param.huyen}" selected class="diaChiOption" name="quan">Chọn quận
                                    huyện
                                </option>
                            </select>

                            <select class="form-select form-select-sm" id="ward" aria-label=".form-select-sm">
                                <option value="${param.xa}" selected class="diaChiOption" name="xa">Chọn phường xã
                                </option>
                            </select>
                        </div>


                        <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
                        <script>
                            var citis = document.getElementById("city");
                            var districts = document.getElementById("district");
                            var wards = document.getElementById("ward");
                            var Parameter = {
                                url: "https://raw.githubusercontent.com/kenzouno1/DiaGioiHanhChinhVN/master/data.json",
                                method: "GET",
                                responseType: "application/json",
                            };
                            var promise = axios(Parameter);
                            promise.then(function (result) {
                                renderCity(result.data);
                            });

                            function renderCity(data) {
                                for (const x of data) {
                                    citis.options[citis.options.length] = new Option(x.Name, x.Id);
                                }
                                citis.onchange = function () {
                                    district.length = 1;
                                    ward.length = 1;
                                    if (this.value != "") {
                                        const result = data.filter(n => n.Id === this.value);

                                        for (const k of result[0].Districts) {
                                            district.options[district.options.length] = new Option(k.Name, k.Id);
                                        }
                                    }
                                };
                                district.onchange = function () {
                                    ward.length = 1;
                                    const dataCity = data.filter((n) => n.Id === citis.value);
                                    if (this.value != "") {
                                        const dataWards = dataCity[0].Districts.filter(n => n.Id === this.value)[0].Wards;

                                        for (const w of dataWards) {
                                            wards.options[wards.options.length] = new Option(w.Name, w.Id);
                                        }
                                    }
                                };
                            }
                        </script>
                        <div class="col-12">
                            <label class="form-label">Địa chỉ chi tiết</label>
                            <input type="text" class="form-control" placeholder="Thôn/Xã/Quận/Huyện/Tỉnh"
                                   value="${param.address}" name="address" required>
                        </div>
                        <div class="col-12">
                            <label class="form-label">Thành tiền</label>
                            <input type="text" class="form-control" value="${sum} vnđ" required>
                        </div>
                        <div class="col-12">
                                <button type="submit" class="btn btn-primary" onclick="return confirm('Xác nhận đặt hàng')">Thanh toán</button>
                        </div>
                    </form>
                </div>
            </div>
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