<%@page import="org.iplass.mtp.entity.Entity"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="storeApp.product.util.URLHelper"%>
<%@ page import="storeApp.product.entity.Product"%>
<%@ page import="storeApp.product.entity.Brand"%>
<%@ page import="storeApp.product.entity.CategoryProduct"%>
<%@ page import="storeApp.product.dto.ProductCategoryDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="m" uri="http://iplass.org/tags/mtp"%>
<%@ page import="org.iplass.mtp.web.template.TemplateUtil"%>

<!DOCTYPE html>
<html>
<%
	request.setAttribute("staticContentPath", TemplateUtil.getStaticContentPath());
	List<ProductCategoryDTO> productList = (List<ProductCategoryDTO>) request.getAttribute("productList"); 
%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
        integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="${m:esc(staticContentPath)}/styles/allStyles.css">
</head>

<body>
    <header>
        <div class="header-container sticky">
            <nav class="navbar navbar-expand-lg navbar-custom">
              <a class="navbar-brand" href="#">
                <img src="https://www.vnext.vn/img/logo-vnext-footer.svg" alt="Logo" />
              </a>
              <div class="collapse navbar-collapse">
                <ul class="navbar-nav" style="margin-right: auto;">
<!--                   <li class="nav-item category">
                    <a class="icon-link" href="#"><i class="fa-solid fa-bars-staggered"></i>Danh mục</a>
                  </li>
                  <li class="nav-item position">
                    <a class="icon-link" href="#"><i class="fas fa-map-marker-alt"></i>Xem giá tại <br>
                      Hà Nội</a>
                  </li> -->
                </ul>
                <form class="form-inline my-2 my-lg-0" style="margin-right: 100px;">
                  <input
                    class="form-control mr-sm-2 search-bar"
                    type="search"
                    placeholder="Bạn cần tìm gì?"
                    aria-label="Search"
                  />
                </form>
                <ul class="navbar-nav ml-auto">
                  <li class="nav-item">
                    <a class="icon-link" href="#"
                      ><i class="fas fa-phone"></i>Gọi mua hàng <br>
                      1800.2097</a
                    >
                  </li>
                  <li class="nav-item">
                    <a class="icon-link" href="#"
                      ><i class="fas fa-map-marker-alt"></i>Cửa hàng <br>
                      gần bạn</a
                    >
                  </li>
                  <li class="nav-item">
                    <a class="icon-link" href="#"
                      ><i class="fas fa-truck"></i>Tra cứu <br>
                      đơn hàng</a
                    >
                  </li>
                  <li class="nav-item">
                    <div class="shopping-bag">
                        <div class="shopping-bag__target" id="js-shopping-bag-target"></div>
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor">
                          <path fill-rule="evenodd" d="M7.5 6v.75H5.513c-.96 0-1.764.724-1.865 1.679l-1.263 12A1.875 1.875 0 004.25 22.5h15.5a1.875 1.875 0 001.865-2.071l-1.263-12a1.875 1.875 0 00-1.865-1.679H16.5V6a4.5 4.5 0 10-9 0zM12 3a3 3 0 00-3 3v.75h6V6a3 3 0 00-3-3zm-3 8.25a3 3 0 106 0v-.75a.75.75 0 011.5 0v.75a4.5 4.5 0 11-9 0v-.75a.75.75 0 011.5 0v.75z" clip-rule="evenodd" />
                        </svg>
                        <strong class="shopping-bag__counter">
                          <span id="js-shopping-bag-counter">0</span>
                        </strong>
                      </div>
                    <a class="icon-link" href="#"
                      >Giỏ hàng</a
                    >
                    <!-- <i class="fas fa-shopping-cart"></i> -->
                  </li>
                  <li class="nav-item">
                    <a class="nav-link btn btn-login" href="#"><i class="fa-regular fa-circle-user"></i> <br>
                      Đăng nhập</a>
                  </li>
                </ul>
              </div>
            </nav>
          </div>
    </header>

    <div class="container main-content-index">

        <div class="block-top-home">
            <div class="row">
                <div class="col-xl-2 col-md-3">
                    <div class="category-product">
                        <ul>
                           	<% for (ProductCategoryDTO p1 : productList) { %>
                            <li class="category-item">
                                <a class="nav-link" href="#" role="button" data-bs-toggle="dropdown"
                                    aria-expanded="false">
                                    <i class="fa-solid fa-mobile-screen-button"></i>
                                    <%=p1.getNameCategory()%>
                                    <i class="fa-solid fa-chevron-right ic-angle-right"></i>
                                </a>
                                <ul class="dropdown-menu">
                                    <div class="row">
                                        <div class="col-6 col-md-3">
                                            <h5>Hãng điện thoại</h5>
                                            <ul>
                                            	<% for (Brand b1 : p1.getBrands()) { %>
							                   <li> <a><%=b1.getName()%></a></li>
					               				<% } %>
                                            </ul>
                                        </div>
                                    </div>
                                </ul>
                            </li>
           					<% } %>
                        </ul>
                    </div>
                </div>
                <div class="col-xl-10 col-md-9">
                    <div class="row">
                        <div class="col-9">
                            <div class="hot-sale-product">
                                <div id="carouselExampleIndicators" class="carousel slide">
                                    <div class="carousel-indicators">
                                        <button type="button" data-bs-target="#carouselExampleIndicators"
                                            data-bs-slide-to="0" class="active btn-select-slide" aria-current="true"
                                            aria-label="Slide 1"></button>
                                        <button type="button" data-bs-target="#carouselExampleIndicators"
                                            data-bs-slide-to="1" class="btn-select-slide" aria-label="Slide 2"></button>
                                        <button type="button" data-bs-target="#carouselExampleIndicators"
                                            data-bs-slide-to="2" class="btn-select-slide" aria-label="Slide 3"></button>
                                        <button type="button" data-bs-target="#carouselExampleIndicators"
                                            data-bs-slide-to="3" class="btn-select-slide" aria-label="Slide 3"></button>
                                    </div>
                                    <div class="carousel-inner">
                                        <div class="carousel-item active">
                                            <img src="./assets/image/slide1.webp" class="d-block w-100" alt="...">
                                        </div>
                                        <div class="carousel-item">
                                            <img src="./assets/image/slide2.webp" class="d-block w-100" alt="...">
                                        </div>
                                        <div class="carousel-item">
                                            <img src="./assets/image/slide3.webp" class="d-block w-100" alt="...">
                                        </div>
                                        <div class="carousel-item">
                                            <img src="./assets/image/slide4.webp" class="d-block w-100" alt="...">
                                        </div>
                                    </div>
                                    <button class="carousel-control-prev" type="button"
                                        data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                        <span class="visually-hidden">Previous</span>
                                    </button>
                                    <button class="carousel-control-next" type="button"
                                        data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                        <span class="visually-hidden">Next</span>
                                    </button>
                                </div>

                            </div>
                        </div>
                        <div class="col-3">
                            <div class="banner-top-home">
                                <img src="./assets/image/690x300_Rightbanner_Galaxy-M34-5G_04 (2).webp" alt="">
                                <img class="banner-top-home-center"
                                    src="./assets/image/b2s-2024-right-banner-laptop.webp" alt="">
                                <img src="./assets/image/b2s-mac-2024-690300.webp" alt="">
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <% for (ProductCategoryDTO p : productList) { %>
        <div class="hot-phone">
            <div class="row">
                <div class="col-md-5 col-12">
                    <h3><%=p.getNameCategory()%></h3>
                </div>
                <div class="col-md-7 col-12 category-tag">
                 <% for (Brand b : p.getBrands()) { %>
                    <a><%=b.getName()%></a>
               			<% } %>
                </div>
            </div>

            <div class="list-product">
              <% for (Product i : p.getProducts()) { %>
                <div class="product-item-container">
                	<a href="<%= URLHelper.getProductDetailPath(i.getOid()) %>">
	                    <div class="product-image">
	                        <img src="<%= URLHelper.getProductImageResource(i, "productImage") %>" alt="">
	                    </div>
	                    <div class="product-name">
	                        <h6><%= i.getName() %></h6>
	                    </div>
	                    <div class="product-price">
	                        <span class="product__price--show"><%= i.getPrice() %></span>
	                        <span class="product__price--through"><%= i.getOldPrice() %></span>
	                    </div>
	                    <div class="product-smem-price">
	                        Smember giảm thêm đến
	                        <span>138.000đ</span>
	                    </div>
	                    <div class="product-promotions">
	                        <span>
	                            Không phí chuyển đổi khi trả góp 0% qua thẻ tín dụng kỳ hạn 3-6 tháng
	                        </span>
	                    </div>
                    </a>
                    <div class="product-bottom-div">
                        <span class="product-box-rating">
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                        </span>
                        <span class="btn-wish-list">
                            Yêu thích <i class="fa-regular fa-heart"></i>
                        </span>
                    </div>
                    <div class="install-0-tag">
                        Trả góp 0%
                    </div>
                    <div class="product__price--percent">
                        <p>
                            Giảm 27%
                        </p>
                    </div>
                </div>
       			<% } %>
            </div>

        </div>
		<% } %>

        <div class="banner-1">
            <h3>Ưu đãi thanh toán</h3>
            <div class="row">
                <div class="col-12 col-md-6 col-lg-3">
                    <img src="./assets/image/banner1.webp" alt="">
                </div>
                <div class="col-12 col-md-6 col-lg-3"><img src="./assets/image/banner2.webp" alt=""></div>
                <div class="col-12 col-md-6 col-lg-3"><img src="./assets/image/banner3.webp" alt=""></div>
                <div class="col-12 col-md-6 col-lg-3"><img src="./assets/image/banner4.webp" alt=""></div>
            </div>
        </div>
    </div>

<footer class="footer">
    <div class="footer-container">
        <div class="row">
            <div class="col-4 text-center">
                <img style="width: 200px;" src="https://www.vnext.vn/img/logo-vnext-footer.svg" alt="VNEXT Logo">
            </div>
            <div class="col-2">
                <h5>DỊCH VỤ</h5>
                <ul class="list-unstyled">
                    <li><a href="#">Phát triển theo hình thức Labo</a></li>
                    <li><a href="#">Phát triển hệ thống</a></li>
                    <li><a href="#">Phát triển ứng dụng Mobile</a></li>
                </ul>
            </div>
            <div class="col-2">
                <h5>CÔNG TY</h5>
                <ul class="list-unstyled">
                    <li><a href="#">Thông tin công ty</a></li>
                    <li><a href="#">Lời chào của CEO</a></li>
                    <li><a href="#">Tầm nhìn - Sứ mệnh</a></li>
                    <li><a href="#">Địa chỉ</a></li>
                </ul>
            </div>
            <div class="col-1">
                <h5>V-BLOG</h5>
                <ul class="list-unstyled">
                    <li><a href="#">V-NEWS</a></li>
                    <li><a href="#">V-CUSTOMER</a></li>
                    <li><a href="#">V-JOURNAL</a></li>
                    <li><a href="#">V-LIFE</a></li>
                    <li><a href="#">V-TUBE</a></li>
                </ul>
            </div>
            <div class="col-1">
                <h5>TUYỂN DỤNG</h5>
                <ul class="list-unstyled">
                    <li><a href="#">Tuyển dụng</a></li>
                </ul>
            </div>
            <div class="col-1">
                <h5>LIÊN HỆ</h5>
                <ul class="list-unstyled">
                    <li><a href="#">Liên hệ</a></li>
                </ul>
            </div>
        </div>
        <div class="row">
            <div class="col-md-7">
                <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="-270 0 2000 1500" class="footer_map" xml:space="preserve">
                    <style type="text/css">
                        .st0{fill:none;stroke:#F06A21;stroke-width:2;stroke-miterlimit:10;}
                        .st1{fill:none;stroke:#F06A21;stroke-width:3;stroke-miterlimit:10;}
                        .st2{opacity:0.5;fill:#1A1818;enable-background:new    ;}
                        .st3{fill:#FFFFFF;}
                        .st4{fill:#FF6A0F;}
                        .cursor-pointer {cursor: pointer}
                        .small { font: italic 13px sans-serif; fill: white; font-size: 35px;cursor: pointer }
                    </style>
                    <path class="st0" d="M-114.7,862.5l-0.2-0.2l-0.6,0.4l-0.4,0.4l-0.4,0.4l-0.2,0.2l0.4,0.2h0.4h0.2l0.6,0.2l0.6-0.2l0.4-0.8l-0.4-0.4
                        L-114.7,862.5z M-129.1,868.5h-0.4v0.6l-0.2,1.2l0.6,0.6v-0.4v-0.4l-0.2-0.8L-129.1,868.5z M-175.5,888.9l0.4,0.4v0.8l1-0.4l0.4-0.6
                        l0.6-0.6l-0.6-0.2L-175.5,888.9z M-104.4,932.5h-0.2l-0.6,0.8l-0.4,0.4l0.4,0.4l0.6-0.4v-0.4l0.4-0.2L-104.4,932.5z M45,260h-0.4
                        h-0.2h-0.2l-0.6,0.2l-0.2,0.4l0.2,0.2h0.2l0.6-0.4l0.4-0.2h0.6h0.2L45,260z M32.5,260.8l-0.4-0.2h-0.4l-0.2,0.2l-0.2,0.4l0.4,0.6
                        l0.4-0.2l0.4-0.2l0.4-0.2l0.2-0.4L32.5,260.8L32.5,260.8z M33.7,268.7l-0.2,0.2l-0.2,0.2v0.2l0.2,0.2h0.2l0.8-0.6v-0.4h-0.4h-0.2
                        L33.7,268.7z M1.6,278.7l-0.2,0.8l0.8,0.4l0.4-0.4L1.6,278.7z M4.4,280.4L4.4,280.4L4.4,280.4l0.2-0.4l0.2-0.2v-0.4H4.3l-0.8,0.4
                        l0.2,0.4l0.2,0.2H4.4z M21.4,282.4l-0.2-0.6l-0.2-0.6l-0.2-0.4l-0.2,0.2l-0.2,0.2l0,0l0.2,0.8L21.4,282.4L21.4,282.4z M20.4,282.2
                        l0.4,0.4l0.4,0.4l-0.6-1l-0.6-0.6l-0.4-0.4h-0.2l0.4,0.6L20.4,282.2z M-7.7,284l0.6,0.2l0,0l-0.2-0.6l-0.4-0.8l-0.4-0.2h-0.4
                        l-0.4-0.4l-0.2,0.2l-0.2,0.2v0.2h0.2v0.2l0.2,0.2h0.2l0.2,0.2h0.2h0.2l0,0v0.2L-7.7,284z M-0.1,284.2v-0.4v-0.6l-0.4-0.4v0.4v0.2
                        h-0.2v0.2v0.2l-0.2,0.2v0.2l0,0h-0.4v0.4l0.8,0.4l0,0l-0.2-0.2l0,0L-0.1,284.2z M19.1,284.8L19.1,284.8l-0.4,0.2l0,0L19.1,284.8h0.4
                        v-0.2h0.4l0.2-0.2l-0.2-0.2h-0.2V284v-0.2h-0.2l-0.2,0.2l0.2,0.2l-0.4,0.2h-0.4v0.2L19.1,284.8l0.2-0.2L19.1,284.8L19.1,284.8z
                         M29.4,288.4L29.4,288.4l-0.4,0.4l0.4,0.4l0.4-0.4l0.2-0.8l-0.2,0.2L29.4,288.4z M29,290.5v-0.2l-0.2-0.2l-0.2,0.2l-0.2,0.2v0.2
                        l-0.6,0.6l0.8-0.4L29,290.5z M40.5,259.8h-0.2l-1,0.6l-0.8,1l0,0l2-1.4L40.5,259.8C40.5,259.8,40.5,259.8,40.5,259.8z M32.3,262
                        l0.2,0.2h0.4l0.2,0.2l0.4-0.2h0.6l0.2-0.2l0.2-0.2l-0.2-0.4l-0.6-0.2h-0.8l-0.6,0.4V262z M37.3,262.2L37.3,262.2v-0.4l-1.8,0.8
                        l-0.2,0.2l0.6,0.2h0.2L37.3,262.2L37.3,262.2z M54.1,262.8l-0.8,0.2v0.4l0.4,0.2h0.6h0.4l0.2-0.4v-0.4l-0.4-0.2L54.1,262.8z
                         M38.9,265.4l-0.6,2.8v0.4l0.2-0.4l0.8-3.3v-0.2l-0.2,0.2L38.9,265.4z M33.3,271.7l0.2-0.2h0.4l0.4-1v-0.4v-0.4h-0.2l-0.4,0.2h-0.2
                        l-0.2-0.2h-0.2h-0.2l-0.4,0.8l-0.2,0.2l-0.2,0.2v0.2l-0.2,0.2v0.2v0.2l0.4,0.2v0.2l-0.2,0.2l0,0V272h-0.2l-0.4,0.6l-0.4,0.4
                        l-0.4,0.2l-0.4,0.6h0.2h0.4l0.4-0.2h0.2l0.8-0.4V273l0.8-0.6l0.6-0.2L33.3,271.7z M-9.9,277.4l-0.4-0.2l-0.2-0.2l-0.4-0.2l-0.2,0.2
                        v0.4l0.4,0.8l0.4,0.4l0.6,0.2h0.8l0.6,0.2l1.2,0.2l0.2-0.4v-0.4v-0.2V278h-0.2v-0.2l0,0h0.2v-0.4l-0.4-0.6l-0.4-0.4h-0.2l-0.4,0.2
                        l-0.2,0.4v0.4l0.2,0.4l-0.4,0.2L-9.9,277.4z M6.8,278.8l0.8-0.2l0.4-0.4v-0.2l-0.2-0.2l-0.4-0.6H7H6.8v0.2H6.6l-0.6,1l0.2,0.2
                        l0.4,0.2H6.8z M26.6,280l0.2-0.2l0.6-0.8l0.4-1l-0.4-0.2l-0.4,0.4l-0.4,0.4l-0.4,0.2l-0.2,0.2l-0.2,0.6l-0.4,0.6l-0.4,0.2l-1.6,0.4
                        l-1.2,0.2l0.2,0.2h1.4l2-0.8L26.6,280z M22.7,280h0.2l0.6-0.2l1-1l0.2-0.4v-0.2h-0.2l-0.2,0.2l-0.2,0.2l0,0v-0.2h-0.2l-0.6,0.6h-0.4
                        h-0.2l-0.2,0.4l0,0l-0.4-0.4H22l-0.4,0.2H21l0.2,0.4l0.4,0.2L22.7,280z M14.7,282.2l-0.2,0.2v0.2l0.6,0.4h0.2l0.2,0.2v0.2h0.2
                        l0.2-0.4l-0.2-0.2l-0.6-0.4L14.7,282.2z M10.6,285.2l-0.2-0.2l-0.2-0.2l-0.2-0.2v-0.2v-0.2V284H9.8l-0.2,0.2l-0.2,0.2v0.2H9.3v0.2
                        v0.2l0.2,0.2h0.2l0.2-0.2l0.4,0.6h0.4L10.6,285.2z M-7.1,285.4l0.8,0.8l0.4,0.2h0.4l0.6-0.2l0.4-0.4l-0.2-0.2h-0.2h-0.4l-0.6-0.4
                        l-1.2-1.2l-0.2,0.2v0.6L-7.1,285.4z M25.4,286.6l-0.2,0.4v0.4v0.6l0.2,0.2l0.2,0.2l0.2,0.2h0.2l0.2-0.2l0.2-0.2v-0.4l-0.2-0.8
                        l-0.4-0.6L25.4,286.6z M11,287.8l0.4,0.8h0.2l0.2-0.2v-0.2l0,0l0.2-0.2l0,0l0,0h0.2l0,0v-0.5l-0.2-0.2h-0.2v-0.6l-0.2-0.2h-0.2v0.2
                        l-0.2-0.2l-0.2-0.2h-0.2v0.2v0.2v0.2v0.4L11,287.8z M12.3,288.8L12.3,288.8h-0.4l-0.2,0.4l-0.2,0.2v0.2l0.2,0.2l0.2,0.2h0.2l0.2-0.2
                        v-0.2v-0.2v-0.4L12.3,288.8z M41.9,323L41.9,323l0.4,0.2h0.2l0.2-0.2l0.2-0.4v-0.4h-0.2l-0.4,0.2L41.9,323z M-49.3,363.1
                        L-49.3,363.1l-0.4,0.2l-0.2,0.2v0.4l0.2,0.4l0.2,0.2h0.4l0.2-0.4l0.2-0.2v-0.4L-49.3,363.1L-49.3,363.1z M124.3,667L124.3,667h0.4
                        l0.2,0.2l0.2-0.2l-0.2-0.4l-0.2-0.2l-0.4-0.6h-0.2l0.2,0.6V667z M-34.6,873.3l-0.6-0.6l-0.4-0.6l-2.3-2.3l-2.3-3.6l-0.4-0.2
                        l-0.2-0.2l-0.2-0.2l-0.4,0.4l1.2,1.4l0.4,0.8l0.2,1.2l0.2,0.8l0.6,1l1.2,1.6l1.8,2.8l0.6,0.4l1-0.2l-0.2-0.4l-0.8-0.6l-0.8-1
                        l0.4-0.4l0.8,0.6l1.2,1l0.8,1.2l-0.2,1v0.4h1.4l0.8-0.4l0.4-1v-1.4l-0.6-0.4L-34.6,873.3z M-7.9,839.7l-1.2-0.2l-1-0.4h-5.8
                        l-1.4-0.4L-19,838h-0.8l2.3,1l6.5,1.2l1,0.4l0.4,0.6l0.4,0.2l0.8-0.2l0.8-0.4l0.4-0.4l-0.2-0.6H-7.9z M-2,823.5l-0.4,0.4l-0.2,0.4
                        h0.2l0.4,0.8v0.2l0.4,0.4l0.8,0.6l0.6,0.2l0.2-0.6l-0.2-0.6l-0.4-1l-0.2-0.6h0.4l0.4,1l0.4,0.6l0.2,0.2l0.4-0.4v-0.4l-0.2-0.6
                        l-0.2-0.6v-0.2l0.2-0.2l0.2-0.2v-0.4H0.9l-0.2-0.2l-0.2-0.2l-0.2-0.4l-1.2-0.8v-0.4h-0.6H-2l-0.6,0.2v0.4l0.8,0.4l0.2,0.4l-0.2,1
                        L-2,823.5z M2.8,831.5l-1.2-0.8l-0.4,0.8H0.8l1.2-2.6l0.2-1.6l-1-0.8l-1,0.4l-1,0.4l-0.4,0.8l0.4,1.2v-0.8h0.4l-0.2,0.8l-0.8,1.2
                        l-0.2,1l0.2,0.6l0.4,0.6l0.2,0.8v1h0.4l0.6-0.8l1-0.4l2.6-0.6L3.4,832L2.8,831.5z M14.9,831.1L14.9,831.1l0.2,0.2h0.2l0.2,0.2
                        l-0.4-0.6l-1.6-1.4l-0.4,0.4l-0.2,0.6l-0.2,0.6v0.6l-0.4,0.4l-1.6,0.8l-2,0.6l-0.2,1l0.8,2.6l0.6-0.6l1-1.6l0.8-0.6l1-0.4l0.4-0.2
                        l0.4-1l0.4-0.2l0.4-0.2l0.2-0.6h0.4L14.9,831.1L14.9,831.1z M-20.2,901.6L-20.2,901.6L-20.2,901.6l-0.8,0.2l-0.8,0.6l-0.6,0.6
                        l-0.2,0.6v0.2l0.4,0.4h0.2h0.4l0,0v-0.2v-0.2v-0.2v-0.2v-0.2h0.2h0.2h0.2h0.2l0.2,0.2l-0.2-0.2l-0.2-0.4v-0.2h0.6v-0.2l0,0l-0.2-0.2
                        h0.2l0,0L-20.2,901.6L-20.2,901.6z M-21.2,858.2l-2.2-1.6l-0.8-0.2l-0.2-0.2v0.4l2.3,2.2l1.4,0.8l1.2,2l0.8,0.4l0.4-0.4l-0.6-1
                        l-1.6-1.8L-21.2,858.2z M-4.3,282.6l0.2,1.2l1,2.2l0.2,0.8l0.4,0.2l0.8,0.2l0.6-0.4l-0.2-1.4l-1.8-2.3l-0.2-0.8l-0.2-1.2l-0.6-0.6
                        l-2-0.8l-0.6,1.4l-0.4,1.6l0.2,1l0.6,0.4l0.8,0.2l0.6,0.4h0.4l-0.2-0.4v-0.4v-0.4L-4.3,282.6z M32.5,280.4l0.4-1l0.4-1.2v-0.4v-0.2
                        l-0.2-0.2l-0.2,0.8l-1.2,2.6l-0.4,0.8l-0.6,0.4l-0.8,0.2h-1v0.4l0.6,0.6v0.8l-0.8,2h0.8l0.4-0.4l0.4-1.2l0.4-0.6L32.5,280.4z
                         M44.6,276.5l0.6,0.2v-0.4l-1.8-1.4l-0.6-0.2l-0.4,1l0.4,0.4l0.6,0.2l0.2,0.4v0.6l-1,1.8l1-0.4l0.8-0.6l0.4-0.8l-0.2-1V276.5
                        L44.6,276.5z M34.9,275.5l0.4-1.6l1.8-3.9v-0.4h-0.2l-0.4,0.2l-1.2,1.2l-0.2,0.2l-0.2,0.4l-0.2,0.4v1.2l-0.2,0.6l-0.8,0.8l-0.2,0.6
                        v0.6l0.2,0.4v0.4l-0.6,0.2l1,0.2L34.9,275.5z M46.4,257L46.4,257v-0.4l-0.2-0.2v-0.2l-0.6-0.2l-0.8,0.4l-3,1.8l-0.6,0.8l-0.2,0.2
                        L46,257H46.4z M55.5,254l-6.5,0.8l-0.4,0.2l-1.8,0.6v0.4l1.2-0.2h1l-0.4,0.2l-0.4,0.4l-0.2,0.4v-0.2l-0.2-0.6l-0.2,0.6l-0.2,0.6
                        l0.6-0.2l3.6-1.2l0.4-0.2h0.4l0.4,0.4l0.8-0.4l2-1.2L55.5,254L55.5,254z M123.9,739.3l-0.4-0.2l-0.4-0.2l-1.8-0.4l-1-0.4v0.6v0.2
                        l-0.4-0.2l-0.8-0.2l-0.4-0.2v0.4l0.4,0.6l0.8,0.6l1,0.6h1v-0.2l0,0l0,0l-0.2-0.2l0.4-0.2h0.4l0.4,0.2l0.2,0.4l0.2-0.2l0.6-0.4
                        l0.2-0.2L123.9,739.3L123.9,739.3z M-4.7,894.1l-0.6,0.4l-0.2,0.8l0.2,0.8l0.6,0.6h1l0.2-0.8l-0.4-1L-4.7,894.1z M47,276.5l0.8-1.2
                        l0.4-0.4l0.2-0.8l-0.8-0.2l-0.8,0.6l-0.4,1v1L47,276.5L47,276.5z M24.6,283.2v-0.4l0.2-0.2l0.2-0.2l-0.2-0.4l-0.6-0.2h-0.8h-0.6
                        h-0.2l-0.2-0.2l-0.4-0.2l-0.2,0.2v0.2l0.2,0.4h0.2l0.2-0.2l0.6,0.6l0.4,0.2h0.4h0.4L24.6,283.2L24.6,283.2z M23,285.2l-0.6-0.8h-0.2
                        v0.8l0.4,1l0.6,0.2h0.4l0.4,0.2l0.2,0.4h0.2v-0.8l-0.2-0.4l-0.6-0.4L23,285.2z M-3.5,829.3h-0.2l0,0l0,0l-0.2-0.2l0.6-0.4l0.6,0.2
                        l0.6,0.2l0.8,0.2v-0.4l-0.6-1l-0.4-0.4h-0.8V827H-2l0.4-0.6l-0.2-0.8l-0.6-0.4l-0.2-0.2l-0.6-0.8l-0.2-0.2l0.2-0.6l0.2-0.4l0.4-0.4
                        v-0.8l-0.4-0.8l-0.6-0.6l-1.4-0.4l-0.2-0.4l-0.4-0.8l-0.4-0.4l-0.4-0.2h-1.2l1.4,2.2l0.4,1.2l-0.4,1.2l-0.4,0.2l-0.8,0.2l-0.2,0.2
                        l0.2,0.8l0.2,0.4l0,0l-0.2,1.4v0.6l0.2,0.8l0.6,1.2l1,1.4l1.2,1.2l1.2,0.4l1-0.4v-1l-0.6-1h-0.8L-3.5,829.3L-3.5,829.3z M9.4,286.6
                        l1,0.2l-0.4-0.2l-0.2-0.2L9.6,286l-0.2-0.4H9H8.6l-0.8-0.2L7.2,285l0.2-0.6V284l-0.6-0.4l-0.6-0.2l-0.6,0.2v1H5.2L4.6,284L3,283.8
                        l-0.6-0.8l0.4-0.4l-0.4,0.4v0.4v0.4l-0.2,0.4l-0.4,0.2l-1.2,0.4l-0.2,1l0.6,0.8l1.4,1l0.6,0.6l1.2,1.6l1,0.8v-0.4L5.1,290l-0.2-0.6
                        h0.4l0.2,0.2l0.4,0.2l0.2,0.2h0.4v-0.4h0.4l0.2,0.2l0,0l0,0l0.2,0.2v0.4h-1v0.4l0.2,0.2l0.2,0.2l0.4-0.4v0.4l0.2-0.2h0.2l0.4-0.2
                        v1.2l0.4-1l0.2-1h0.4v0.4h0.4l-0.4-1l-1.6-0.8L7,287.4l0.6,0.4l0.4,0.2h0.4l0.6-0.2v-0.4l-0.4-0.2l-0.2-0.4v-0.4l0.2-0.4l0.4,1
                        l0.4,0.4l0.6,0.2l-0.2-0.4l-0.3-0.2l-0.2-0.2v-0.4V286.6z M29.4,280.6l0.8-0.2l0.8-0.4l0.6-0.6l0.4-0.8l0.6-2l0.8-2l0.2-0.8
                        l-0.4-0.2l-0.2,0.2l-0.6,0.8v-1.2l-0.6,1l-0.2,0.4l-0.6-0.2l-0.2-0.2l-0.6,1.6l-0.2,0.8l0.2,0.6l-0.8,1l-1.2,1l-1.4,0.8l-1.4,0.6
                        v0.4l0.8-0.2l2.3-0.6L29.4,280.6z M27,265.4v0.4h-0.2l-0.4-0.4H26l-0.2,1.6l-0.4,1.6v0.6l-0.4,1l-0.8,1.4l-0.4,1.2l0.8,0.6l1.8-1.4
                        l0.6-0.4l1.2-0.4l0.6-0.4l1.8-2.3l1-1.2l0.8,0.2h0.4l0.6-0.8l1.6-1.2l0.6-0.6l0.2-0.6h-0.2l-1.2,0.4l-1.8,0.6l-0.4,0.2h-0.4
                        l-0.2-0.2l-0.2-0.2v-0.4v-0.4l-0.2-0.4l-0.2-0.2h-0.4l-0.4-0.2l-1.2-1.6l-0.6-0.4l-0.2-0.2H28h-0.2h-0.2l-0.2,0.2l-0.2,0.4l-0.2,0.6
                        v1.4v0.8l0.2,0.4h-0.4L27,265.4z M126.4,719.3l-0.2-0.6l-0.4-0.6l-0.8-0.2l-1.2-0.2l-1.4,0.2l-0.4,0.8l0.6,0.4l0.6,0.2l0.4,0.4
                        l0.2,0.4l1.8,1.4l0.8,0.2l0.2-0.6l-0.2-0.6L126.4,719.3L126.4,719.3L126.4,719.3z M-147,830.5l0.4,0.4l-0.6-0.6h-0.6l-0.4,0.4
                        l-0.4,0.4l-0.2,0.4v0.6l-0.2,0.4l-0.4,0.2l-0.2,0.2l-0.6,0.8l-0.2,0.2l-0.4,0.4h-1l-3.2-0.4l-0.2,0.2l0.2,0.6l0.4,2l0.6,0.6l2,1
                        l1.4,1.2l1,1.6l1.4,3.8l0.6,4.3l0.6,2.2l1,0.4l0.2,0.2l0.8,0.4l-0.2-1l-0.2-0.6V850l0.4-1.2l-1-1.4l0.6-2.8l2-4.9v-5.3l-0.2-0.8
                        L-147,830.5z M130.4,733.5l-0.8-0.6h-0.8l-0.8-0.8l-2.2-3.9v-0.6v-0.6v-0.6l-0.4-0.4l0.4-0.4h0.4h0.4l0.4-0.2l0.2-0.2l0.2-0.8
                        l0.2-0.2l1-0.6h0.4v0.2l-0.2,0.2l-0.2,0.2l-0.2,0.2l-0.4,0.2l-0.2,0.2l0.2,0.4h0.2l0.8-0.2h0.2l0.2-0.4l0.2-0.8v-0.8v-0.8l-0.4-0.6
                        l-2-2.2l-1-1.4l-1.2-1.4l-1-1.8l-0.4-0.4l-0.6-0.4l0.2-0.4l-0.2-0.6l-0.4-0.6l-0.4-0.6l-0.2-0.8l0.2-0.8l0.2-0.8l0.2-0.8l-0.2-1
                        v-0.4l0.6-1l0.2-0.4v-1v-0.4l-0.2-0.4l-0.2-0.4h-0.2v0.2l0.2,0.4v0.2l-0.6,0.2l-0.2,0.6v1.4l-0.6-0.6l-0.4-0.6l-0.6-1.6l0.4-0.2h0.2
                        l0.2-0.4l0.2,0.2l0.6,0.2l0.2,0.2v-0.4v-0.4l-0.2-0.2l-0.2-0.2v-0.2h0.6l0.4-0.2l0.2-0.4v-0.6l-0.4-0.6h-0.4l-0.6,0.4l-0.6-0.4
                        l-0.8-1l-0.8-0.4v-0.8l0.2-0.4l0.4-0.4l-0.6-0.4v-0.4l0.2-0.4l-0.2-0.4l0.2-0.8l0.4-0.4l0.4-0.2h0.4l1.4,1l0.2,0.4v0.6l-0.4,0.2
                        l-0.4,0.2l-0.2,0.4l0.2,0.4l1,0.2l0.4,0.6l0.6-0.4l0.4-0.4l0.4-0.8l-0.2-0.6l0.4-0.6l-0.2-0.4l-0.6,0.2h-0.6l-0.4-0.4l-0.2-0.6v-0.4
                        l0.4-0.6l0.2-0.4l-0.6,0.2l-0.2,0.2l-0.2,0.2H122l-1-1.2l-0.4-0.6h0.2l0.2-0.2v-0.2l-0.4-0.2l-0.6-0.6l-0.2-0.4l-0.2-1l-0.2-0.6
                        l-0.4-0.4l-0.4-0.2l-0.2-0.4v-0.8h0.4l0.4,0.8l1.2,1.4l0.4,1.2l1,1.8l0.4,0.4v-0.6v-0.2l-0.2-0.2v-0.4h0.6l0.2-0.2v-0.4l-0.2-0.4
                        h-0.2l-0.6-0.4l-0.6-0.4v-0.2l-0.6-0.4l-0.4-0.8l-0.2-1v-1v-1.4v-0.3l-0.6-1v-1l0.4-0.6l0.6-0.4l0.6-0.6l-0.6-0.2l-0.4-0.4l-0.4-1.2
                        l-0.6,0.2V679l0.4-1l0.2-1.8l0.2-0.4l0.6-0.6l0.4,0.8l0.6,2.3l-0.2,2.8l0.2,0.6h1.2l0.4-0.2l-0.2-1.8l0.4-3.8l-0.2-0.4l-1.2-1
                        l-0.4-0.6l-0.6-5.3l-1.4-3.3l-0.4-0.8l-1.4-0.8l-0.6-1v-0.8l1,0.2l0.4,0.6l0.2,0.6l0.4,0.4l0.8,0.2l-1.6-2.6l-0.6-1.6l0.4-0.8
                        l-0.4-2l-0.2-0.6l-0.4-0.6l-1.4-1.6l-0.6-1.4l-0.2-0.8v-0.6V649l-0.2-0.6l-0.8-1.2l-1.6-4.3v0.4l-0.2,1l-0.2-0.6l0.2-0.4l0.4-0.2
                        l0.2-0.6h0.4l0.2-0.2v-0.4l-0.2-0.6l-0.2-3.8l0.2,0.4l0.2,0.2l0.4,0.2l-0.4-2.3l-0.2-0.6l-1.8-2.3l-0.2-0.4l-1.4-1.5l-0.2-0.4
                        l-1-0.4l-0.2-0.2l1-0.2l-3-6.8l-1-3.8l-0.4-4.3l-0.2,0.6v0.2v0.4h-0.2v-0.6l-0.2-0.4l-0.4-0.2l-0.4,0.2h-1.4l-0.4-0.6l0.2-0.4h0.6
                        l0.8,0.4l0.2-0.8l0.2-1.4l0.2-0.6l0.6,0.4v-0.4l-0.2-0.2h-0.2H104v-0.4h0.8l0.6-0.2l0.4-0.4l0.4-0.6l-0.2-0.2h-0.6l-0.4-0.2
                        l-0.6-0.4l-1.2-1.2l-0.2-0.6v-1.8l-0.2-0.4l-1.2-1l-0.4-0.2l-0.4-0.4l-0.4-2l-0.2-0.8l-0.4,0.2h-0.2h-0.4l-0.4-0.2l0.2,0.4l0.2,0.2
                        l0.2,0.2v0.4l-0.8,0.6l-0.4,1l0.4,0.8l1.2,0.2v0.4H99h-0.4h-0.4L98,606v0.2h-0.4V606v-0.2l0.2-0.2l-0.4-0.6v-0.6v-0.6v-0.6l-0.4-0.4
                        l-1-0.6l-0.2-0.2l-0.2-0.4l-1.2-1l-0.2-0.4v-1.2l-0.2-1h-0.4l-1,2l-0.8,0.4l-1.2-0.8l-0.4-1l0.4-0.6l0.8-0.4l0.6-0.2l0.6,0.6
                        l0.4-0.4l0.4-1.4l-1.8,0.2l-1.2-0.8L83,585.3l-1.4-2.8l-0.4-3l-0.2-0.6h-0.4l-0.4,0.2l-0.4,0.4l-0.2,0.2l-0.4-0.2v-0.2l0.4-0.2h0.6
                        l-0.4-0.8l-0.6-0.4l-0.8-0.4l-2.3-2l-0.6-0.8l-0.6-1.2l-0.6-1.8l-0.4-2l0.4-1.8l0.6,0.2l1.2-0.2l0.4,0.4l0.2-0.6l0.4-0.4l0.6-0.4
                        l0.6-0.4l-0.6-0.6V566l-0.2-0.2l-0.4,0.2l-0.2,0.4v0.2l-0.8-0.2l-0.6-0.4l-0.6-0.4l-0.4-0.4h-0.4l-0.2,0.2l0,0v-0.2l-0.4-0.2
                        l-0.2,0.4l-0.2,0.4l-0.2,0.4l-0.4,0.2v0.4l1,0.2v0.8l-0.4,0.8v0.8l0.4,0.6l0.4,2.3l-0.4-0.6l-0.8,0.2l-0.8,0.4l-0.8,0.2l0.6-0.4
                        l0.6-0.6l0.4-0.6l0.2-0.8v-0.2l-0.4-1.6h-0.4l-0.4,0.2l-0.8,0.8l-0.8-1l-1-0.6l-0.8-0.8v-1.4l0.6-1l1.6-1.4l0.8-0.8h-1.2l-1.2-0.2
                        l-1.2-0.2l-0.8-0.4h-0.4l-0.6,0.2l-0.8-0.2l-0.8-0.4l-0.4-0.6l0.2-0.8l0.6,0.2l1.4,1l-1.6-2.6l-0.4-0.8l-0.4-1.6v-0.4l-0.6,0.2
                        l-0.2,0.4l-0.2,0.4l-0.4,0.4l-1-0.2l-2.2-1.6l-0.8,0.2v0.4l0.4,1.6l-0.2,0.4l-1.8,1.4l-0.2-0.2l-0.4,0.2l-0.2-0.6l-0.4-0.4h-0.4
                        l-0.4,0.2h-0.4l-1.2-0.6l-0.6-0.4l-0.2-0.4l-0.6-2.8v-0.4h0.4l0.4,0.2l0.2,0.2l0.4,0.2h0.4l0.2-0.2V554l-1-0.4l-1-1.4l-0.8-0.6
                        l-1-1.8l-0.4-0.4l-1.8-1.2l-0.2-0.4l-0.2-0.4l-0.2-0.2l-0.4,0.2l-0.2,0.4l-0.2,0.4l-0.2,0.2h-0.4v-0.1l-0.2-0.6l-0.4-0.4h-0.2v-0.4
                        l0.2-0.4l0.2-0.4l0.2-0.4l-1.2,0.2h-0.6h-0.6l0.2-0.4v-0.2l0.2-0.2h0.4l0.2,0.2l0.6,0.2V545l-1.2-0.4l-0.4-0.4l-0.4-0.6l-0.4,0.2
                        h-0.6l-0.4-0.2l-0.4-0.6l-0.6-0.2l-1.2-0.2l-3.6-2l1.4-0.2l5.8,3l1.8,0.6v-0.4l-1.4-0.4l-4.9-4.6l-5.5-4.2l-5.9-5.2l-0.8-0.4
                        l-0.2-0.2l-0.2-0.4l-0.4-0.4l-0.4,0.2l-0.8,0.6v0.4v0.4v0.2l-0.6,0.2h-0.6h-1.2v-0.4l1.6-1l0.2-0.2l0.2-0.4l0.4-0.2l0.4-0.2l0.2-0.2
                        l-0.2-0.4l-0.6-0.4L22,523l-0.6-0.4l0.2-2l-0.8-1.4l-7.8-5.8L4.5,507l-4.2-4.6l-0.6-0.8l-0.2-0.2v-0.2l-1-0.8h-0.2l-0.4-0.8
                        l-0.6-1.6l-2.2-3.8l-1.2-1.4l-1.2-2l-0.6-0.6l-1-0.6l-1.6-0.6l-1.6-0.2l-1,0.4l0.2,0.2l0.2,0.2l0.2,0.6l-1.4-0.8l0.2-1l1-0.6l1,0.4
                        h0.4v-0.4l-2.2-0.6l-1.6-0.2l-1.2-0.4l-1-0.4l-0.6-0.4l0.4-0.4l0.6,0.4l3.2,0.4l1.8,0.8l0.6,0.2l0.4,0.2l0.6,1.2l1.4,0.6h0.6
                        l0.4-0.4l-0.2-0.4l-1-1l-0.2-0.6l-0.4-2.6l-0.4-1.4l-0.4-1l0.4-0.4v-0.4l-0.2-0.4l-0.4-0.2v-0.4h0.8l0.6-0.4l0.4-0.6l0.4-0.6l1-0.8
                        l1-0.6v-0.4l-3.9-4.9l-0.6-1l-0.2-1l0.6-1v-0.6l-0.6-0.2l-0.8,1l-0.4,0.2h-0.6l-0.4-0.2l-0.4-0.2l-0.4,0.2l-0.2,0.4l-0.2,0.4
                        l-0.2,0.6v0.6l-0.4-1v-0.4l0.2-0.6h-0.6h-0.2l-0.2,0.2l-0.6-0.4l0.2-0.4l0.6-0.4l0.6-0.2l0.4,0.2h0.4l-0.4-0.8l-0.6-0.6l-1.6-1.2
                        l-1.4-1.8l-0.4-0.2l-1-0.4L-20,463l-2.3-2l-0.8-0.2l-1.2,0.2l-1,0.4l-0.8,0.2l-0.4-0.4l0.8-0.2l-0.2-0.6l-0.6-0.8l-2.3-2l-1.8-2.2
                        l-0.4-0.4l-1-0.8l-0.4-0.6l-0.4-0.8l-0.4-1l-0.2-1l-1.6-0.2l-1.6-1.8l-2.6-3.9l-1.2-3.6l-0.4-0.6l-0.2-0.6V439l-0.2-1.4l-0.8-0.6
                        l0.2,0.2l0.2,3v1.2l-1,0.4l0.2-0.6l0.2-1v-1l-0.4-0.4l-0.2-0.4l0.8-2l-0.2-0.8l-0.6-0.8l-1-1l-0.4-0.2h-0.8h-0.4l-0.2-0.2l-0.4-1.2
                        h0.4l0.4,0.2l0.2,0.4l0.2,0.4l0.6-0.8v-0.4l-1-0.4l-1.2-0.6l-1-0.8l-0.6-0.8l-0.2-0.6l-0.4-1.6v-0.6l-0.2-0.4l-0.2-0.4v-0.6l0.4-1.4
                        l0.8-1.8l1.2-1.2l1.2,0.4l0.2-0.4l0.4-0.4l1.2-0.6l-0.4-1.2v-1.8l0.6-3l0.2-0.2h0.6h0.6l0.4-1.4h0.4h0.4l0.4-0.2l0.2-0.4v-1
                        l-0.2-0.2l-0.4,0.2l-0.2-0.6l-0.2-0.4l1,0.6l-0.2-0.8l-0.8-1.6l-0.2-1.4l-0.2-0.6l-0.6-0.4v-0.4l0.6,0.4l0.6-1.4l0.6,0.4l-0.2-1.8
                        l0.6-3.8v-1.8H-40v-0.2v-0.6l-0.2-0.4l-0.2-0.4l-0.2,0.2l-0.4,0.4l-0.2,0.4v-0.8l0.6-0.4l0.6,0.2v1.2l0.2-0.6v-1.4v-0.8l0.4-0.8
                        l1-1.6l0.2-0.8l0.2-0.6h0.6h0.6l0.2-0.4l0.2-0.8l0.8-1.2l0.2-0.6l-0.6,0.2l-1.4,0.2l-0.6,0.2l-0.2-0.4l1.2-0.6l0.6-0.4l0.2-0.6
                        l0.4,0.4l0.2,0.2l0.2-0.6v-1.4l0.2-0.8l1-1.4v-0.4l-0.4-0.8V381l0.2-0.8l0.4-0.4l2-2l0.6-0.6l0.2-0.6h0.4l0.4,0.6l0.6,0.6l0.8,0.4
                        l0.6,0.2l0.2-0.4l0.8-2.2l0.2-0.8h0.4l-0.2,1l-0.4,0.8l-0.2,0.8l0.2,0.8l0.8-0.4l1.8-0.4l0.8-0.4l0.4-0.6l0.6-1.4l0.4-0.6l0.4,0.4
                        l-0.2,0.2l-0.4,1.2l0.6-0.4l1.2-1.4l1-0.6l1.2-1.6l1-0.6l1.6-2l0.6-1.4l0.4-0.4l1-0.4l0.4-0.2l-0.4-0.4v-0.1l0.4-0.2h0.2h0.4v0.4
                        h-0.4v0.4l3-0.4l0.6-0.2l1.2-0.6l1-0.4l0.6-0.4l0.4-0.6l0.2-0.4l0.2-0.4h0.2v-0.2l-0.2-0.4l-0.2-0.2l-1-0.8l-0.2,0.4l-0.4,0.2
                        l-0.4-0.2l-0.4-0.6h0.2l0.8-0.2l0.8,0.2l0.6,0.6l0.4,0.6l0.6-0.4l0.2-0.8v-0.8L-6,361v-0.4l-0.4-0.6l-0.8-0.8H-7h0.2v-0.2v-0.2v0.2
                        l0.2,0.4l0.6-0.6l0.2-1.2l0.2-2.2l-0.4-0.4l-1,0.2l-1.2,0.4l-0.6,0.4h-0.4l0.2-0.4l0.4-0.4l0.4-0.4l0.2-0.2l0.2-0.2l1.4-0.4h0.2
                        l0.2-0.8l-0.4-0.8l-0.4-0.8l0.6-0.8v-0.7l-1.4,0.8h-0.6l-0.8-0.4l3-1.2l1-1l0.8-0.2l0.2-0.2l0.2-0.2v-0.2v-0.6l-0.2-0.2h-0.3
                        l-0.2-0.2l-0.6-0.8l-0.4-0.4l-0.2-0.8l0.6,0.4l0.6,1l0.4,0.2h0.8l0.8-0.2l0.8-0.2l0.6-0.4l1-0.8v-0.6l-0.8-0.4l-1.2-0.4v0.8h0.6
                        l1.4,0.4h0.6l0.4-0.2l0.4-0.2h0.4l0.2-0.2l0.6-0.4l0.6-0.2l0.2,0.2l0.2,0.4l0.4,0.4l1,0.8l-0.8-2.6l-0.4-0.8l-0.2,0.4l-0.8-0.6
                        l-0.8-1l-0.6-1l-0.4-0.8l0.8,0.6l0.6-0.4l0.2-1l-0.4-1.2L1,336.6l-1-0.4l-0.4-0.6l0.8-1l1,1h0.2l0.2-0.6l0.4-0.6v-0.6L2,333.1
                        l-0.4-0.2H1l-1-0.4h-1.2l-0.4-0.4l-0.2-0.6v-0.6l-0.2-0.6l-0.4-0.4v-0.4l1,0.2l0.4,0.2v-0.4l-1.4-0.6l-0.4-0.2l0.8-0.2l1,0.2
                        l1.8,0.8V329H0.3v-0.4l1-0.4l0.8,0.2l0.8,0.4h1v-0.2l-0.2-0.4V328h0.6l0.4,0.2l0.4,0.2l0.4,0.4l-0.6,0.6l0.2,0.4l0.4,0.2l0.4,0.2
                        v0.4l-0.2,0.4l-0.4,0.2H4.6l-0.8,0.4l0.4,0.8l1,0.6l1-0.2h0.4l0.2,0.4l0,0l-0.2,0.2l0.8,0.6l0.4,1l0.4,0.4l1-1.4L9,333.7l-0.2-0.4
                        l-0.2-0.4v-0.4h0.4l0.4,1l0.4,0.6l0.8,0.2h1.2v-0.4l-0.6-0.2l-0.2-0.4l-0.4-0.5l-0.2-0.4l-0.2-0.2l-1-0.6l-0.6-0.4l-1.4-1.6h0.4H8
                        l0.2,0.2l0.2-0.6l0.6,0.2l1.2,1l0.4,0.4l0.6,0.4l0.8,0.2l0.8,0.2h0.8h0.8l0.8-0.4l0.4-0.8l-0.2-0.8l-1.2-1V328l0.8,0.8l0.4,0.2h0.6
                        l-0.6-0.6h0.4h0.2l-0.2-0.2l-0.2-0.4l-0.2-0.2v-0.4h0.6l0.4,0.4l0.2,0.6v0.8l0.2-0.4l0.2-0.4v-0.4v-0.6h0.4v1l0.2,0.2l0.4-0.4
                        l0.4-0.8l0.2,0.2l0,0l0.2,0.2l-0.2,0.2l-0.2,0.4v0.4l0.2,0.2l0.4-0.2l0.2-0.2v-0.4l0.2-0.4l0.4-0.2l0.6-0.2l0.6-0.2h0.6v0.4
                        l-2.6,1.6l-1.4,1.8v0.4l0.8,0.4l2.2,0.4l0.8,0.8v-0.4l0.6,0.2H22l0.6-0.2h0.8l-0.2-0.8l1-1.2l0.8-0.2v-0.4h-0.1h-0.2l-0.2-0.2
                        l-0.2-0.2l0.6-0.4l1-0.2h1l0.6,0.2l0.6-0.2h0.8h1l0.6-0.2l0.4-0.2l0.8-0.6v-0.4l-0.4-0.4l-0.2-0.6v-0.8l-0.2-0.8l0.4-0.2l0.2-0.2
                        v-0.2l-0.2-0.4l0.8-0.8l0.4-1.2l0.2-2.2l-0.4,0.2h-0.4l-0.4-0.2l-0.4-0.2l0.2-0.6v-1.8l0.2-0.4l0.2-0.2l0.2-0.2l-0.2-0.4v-0.4
                        l1.2-0.4h1.4l1-0.4v-0.4l-1.2-0.8l-0.4-0.4l0.2-0.6l1.6,0.4l0.2,0.2l0.2,0.4L36,314l0.4,0.2h0.2l1,0.2h1l0.6-0.2l-0.6-0.2v-0.4
                        l0.2-0.4l-0.2-0.6l-0.2-0.4V312l0.6,0.2l0.2,0.4l0.2,0.6l0.2,0.6l0.4,0.6l0.4,0.4l0.6,0.2h0.8l0.4-0.2l0.2-0.6l0.2-1.2l0.8,0.2
                        l0.2,0.2v-0.2l0,0l0,0h-0.2l0.6-0.2h0.4l-0.4-0.4l-0.2-0.2l0.2-0.2l0.4-0.2v-0.4l-0.2-0.2l0,0v-0.6v-0.2l0.8,0.4h0.6l0.2-0.4
                        l-0.4-0.6v-0.4l0.2-0.2l0.2-0.2h0.4l0.4,0.4l0.6,0.2h0.6l0.2-0.4l0.2-0.2h0.4H49l0.8-1.4l-0.4-0.4l0.2-0.4l0.2-0.2l0.4-0.2h0.6
                        l-0.2-0.4l-0.2-0.8v-0.4l0.6,0.2l-0.2-0.8l-0.4-0.4l-0.6-0.2H49v-0.4l0.6-0.4l0.8-0.2l0.6,0.2l0.2,1l0.4-0.4l0.2,0.6h0.4v-0.6v-0.2
                        l-0.2-0.2V303l0.4-0.4h0.2v0.8l0.2,0.8l0.4,0.4l0.6-0.2l0.4-1.4l0.4-0.4l0.2,0.8h0.4l0.4-0.4v-0.2v-0.4l0.6,0.2l0.6,0.2l0.4,0.4
                        l0.2,0.8v0.2l0.2,0.2l0.2,0.2v0.4l-0.2,0.2l-0.2,0.2l-0.2,0.4v0.4l0.6,0.8l0.8-0.6l1-1l1-0.4l-2.2-2.2l-0.6-0.2l-1.6-1.8l-1.4-1
                        l-0.6-0.6l-0.6-0.8l-0.2-0.6l-0.4-0.4l-1-0.4l-1.6-0.4l-0.8-0.2h-0.8l-0.8,0.2l-1.8,1.4l-0.8,0.4l-2.8,0.6h-1l-2-0.2l-0.8,0.2
                        l-0.4,0.2l-0.4,0.8l-0.4,0.2h-0.4l-0.4-0.2l-0.8-0.4l-0.6-0.2l-0.2-1.8l-0.6-0.8l-1-0.2l-0.8,0.4l-1.2,1.4l-1.6,1l-0.8-0.8l-1.2-3.6
                        l-1.4-1.4l-1.4,0.2l-1.4,0.4l-1.8-0.4l-3.6-3.2l-1.4-0.8l-2-0.4l-1-0.4l-0.6-0.6v-1l0.4-0.8l0.6-0.8l0.4-0.8v-1l-0.6-0.8l-0.8-0.4
                        h-1l-0.8,0.4l-0.8,0.4l-0.8,0.2l-1-0.6L9,282.5l-0.4-0.8L8,281.2L6.9,281h-2l-0.8-0.2l-1-0.6l-0.2-0.2l-0.4-0.6l-0.2-0.2l-0.6-0.2
                        H1.6L0,280.9l-0.8,0.6h-0.8l-0.2-0.4l-0.2-0.4v-0.4v-0.4l1-2.3l0.2-1.2v-1.4v-0.2l-0.4-0.6l-0.2-0.2v-0.4l0.2-0.8v-0.4l-0.2-0.6
                        l-0.4-0.6l-0.2-0.6l-0.2-0.8l0.6-0.8l0.4-0.4l0.2-0.6l-1-3.8l-0.2-0.6l-0.8-0.6h-1.8l-1-0.4l-0.6-0.6l-0.2-0.8v-1.8l-0.4-1.6v-0.6
                        l0.2-0.6l0.6-0.8l0.2-0.4l1-5.2l0.4-1l0.6-0.6l1-0.2l0.6,0.6l0.4,0.8l0.8,0.6h1l0.6-0.6l0.8-2.6l0.4-0.8l1-1.6l0.4-1l0.2-1.6
                        l0.4-0.8l0.6-0.6l1.6-1l0.4-0.6l-0.4-0.6l-1-0.2l-1,0.2H3.3v-0.2l-0.8-1.4l-1.4-1.2l-0.4-0.6l-0.4-0.4l-0.4-0.2l-0.4,0.2l-0.4,0.6
                        l-0.4,0.2l-1-0.2l-0.6-0.6l-0.4-0.8l-0.4-0.8l-0.6-0.4l-2.3-0.6l-0.8-0.4l-0.6-0.2l-0.4,0.2l-0.2,1.2l-0.8,0.4l-6.8,1.8l-0.8,0.2h-1
                        l-1-0.2l-1-0.4l-0.4-0.6l-0.2-1.8l-1-1.8l-1.6-1l-1.8-0.4l-2.6-0.4l-3.6,0.2l-0.4,0.2l-0.8,1.6l-0.6,0.4l-0.8,0.2l-1.4,0.2h-0.4
                        l-0.8-0.2h-0.4l-0.2,0.2l-0.2,0.4l-0.2,0.4l-0.4,0.2l-0.8-0.6l-2.6-3l-0.6-1l0,0l0,0l-0.6-0.6l-0.6-0.2l-0.6-0.2l-0.6-0.2l-0.8-1
                        L-45,226h-1.2l-1.4-0.4l-3.3-0.2l-0.6-0.2l-0.6-0.8l-0.2-1v-2.9l-0.2-1L-53,219l-2.2-1.4l-0.4-0.6l-1-2l0,0l-0.6-1.2l-0.2-0.2
                        l-0.6-0.2h-0.4l-0.4,0.2h-0.4l-0.6-0.4l-0.8-0.6l-0.8-0.6l-0.6-0.8l-0.4-1l-0.2-0.8l-0.4-0.6h-0.8l-0.6,0.4l-1.6,1.4l-0.4,0.6
                        l-0.4,1l-0.2,1l-0.2,0.8l-0.8,0.6h-0.6l-0.4-0.2l-0.2-0.2h-0.4h-0.2l-0.4-0.2h-0.2l-0.2,0.2l-0.2,0.2v0.2l-0.4,0.1l-3.8,1l-0.6,0.2
                        l-1.4,1.1l-1.6,0.8l-1.8,1.6l-0.4,0.2H-81l-1.2-0.8h-0.6l-0.4,0.4l-0.2,0.8v0.8l-0.2,0.8l-1.2,1l-1.2,0.2l-0.6,0.6l1.4,6.5v1
                        l-0.2,0.6l-2.3,1.4l-0.6,0.6l-1.6,2.3l-0.6,0.6l-0.6,0.4l-0.8,0.4h-1l-1.6-0.4l-1-0.2l-0.2,0.2l-0.4,0.6l-0.4,0.3l-0.4-0.2l-0.2-0.2
                        l-0.2-0.2l-0.2-0.2l-0.2-0.2v-0.2v-0.2h-0.4l-0.2,0.2l-0.8,1l-3,2.6l-1,1l-4.3,2.8l-0.8,0.2l-0.8-0.4l-1-0.6l-2.6-1.2l-0.6-0.6
                        l-0.4-1v-1l0.2-1l0.4-1h-1.4l-3.9,1.4l-1.4,0.2l-0.6,0.2l-0.6,0.4l-0.4,0.4l-0.6,1l-0.4,0.4l-1,1.4l-0.4,1.4l-0.4,2.9l-0.2,0.8
                        l-0.6,1.6l-0.2,0.8v0.8v0.9v0.6l-0.6,0.6l-0.6,0.4l-0.5-0.4l-0.4-0.4l-0.8-0.2l-0.4-0.2l-0.6-1.2l-0.4-0.6l-0.2-0.2h-0.8h-0.2
                        l-1-1.2l-0.4-0.2l-0.4-0.4l-1-1.4l-0.2-0.4l-0.6-0.6l-3.2-2.8l-3.2-3.9l-0.6-0.2l-2,1.2l-0.6,0.4l-0.4,0.6l-0.2,0.8l-0.4,0.8l-1,1.2
                        l-0.2,0.4l0.2,2.6l-0.2,0.4l-1.6,2.2l-0.6,0.4l-0.8-0.2l-0.6-0.4l-1.2-1.4l-1.8-2.8l-0.4-0.8v-1v-0.8l-0.2-0.8l-0.6-0.4l-0.4-0.6
                        l-0.4-0.6l-0.6-0.4l-0.6-0.4l-1-0.4l-0.6,0.2l-1.8,3.2l-0.8,2.2l-0.4,0.6l-0.8,0.6l-2.8,1.4l-1.2,1l-0.6,1.4l0.2,0.4l0.6,0.8v0.6
                        l-0.2,0.4l-2.3,1.6l-0.8,0.4l-0.8,0.2l-0.6,0.4v0.6l0.2,0.8l-0.2,0.8l-0.8,0.6h-1.3l-1-0.4l-1.6-1.2l-1.8-0.4l-0.8-0.4l-0.4-0.6
                        l-1.6-3.2l-0.2-1l-0.4-0.8l-0.6-0.8l-0.8-0.4l-2-0.4l-1-0.4l-2.8-2.2l-1-0.4l-1.8-0.4l-1-0.4l-0.2-0.2l-0.8-0.8l-0.2-0.2l-0.4,0.2
                        l-0.2,0.4l-0.2,0.4l-0.4,0.2h-1l-0.4-0.6l-0.2-1l-0.4-1l-1-0.8l-1.2-0.4l-1.2,0.2l-0.8,1l0,0l-0.4,1.8l-0.4,0.8l-0.6,0.6l-0.4,0.2
                        h-0.6h-0.4l-0.4,0.4v0.6l0.4,0.4l0.4,0.2l0.2,0.4l0.2,0.4l0,0l-0.4,0.6l-5.8,5.9l-0.4,1l-0.2,1.8l-0.2,0.8l-0.6,0.8h-0.6l-0.8-0.4
                        l-1-0.2l-0.8,0.2l-0.8,0.6l-0.4,0.6l0.4,0.8l0.2,0.6l0.4,1.6l0.2,0.2l0.4,0.4l0.2,0.2v0.2l-0.2,0.6v0.4l0.6,0.8l0.8,0.6l0.6,0.6
                        l0.4,1l1,0.8l2.8,1.4l3.3,3.3l1.4,0.8l0.4,0.4l0.4,0.6l0.4,1.2l0.4,0.6l1,0.8l1.2,0.6l0.8,0.6l-0.4,0.6l-0.2,0.2l-0.2,0.2v0.2v0.2
                        l0.6,2l1.8,1l2,0.6l1.4,1.2l1.6,3.6l0.4,2l-0.2,3v1.2l0.2,1.2l0.4,0.8l0.4,0.6h0.2l0.2-0.2h2.3l0.6-0.2l1.4-1l1-1.4l0.6-1.6l0.2-3.9
                        l0.8-0.8l1,0.8l0.4,2.3l-0.2,2l0.2,1l0.6,0.6h0.8l3.3-1.4l0.2-0.2h0.2l0.4,0.6l0.2,0.6v0.6v3.3l0.2,1.2l0.4,1.2v0.2v0.2v0.2v0.2
                        l-1,1l-1.8,2.2l-1,1l-2.2,3.6l0.8-0.4l1-0.6l1-0.4l0.6,0.2v0.6l-1.6,2.6l-0.2,1v2.2l-0.2,0.8l-0.6,0.6l-1.6,0.4l-0.8,0.6l-0.6,1
                        l0.4,0.2h0.8h1l0.8,0.2l0.6,0.4l0.4,0.6l0.2,0.6v0.4l-0.4,1v0.4l0.2,0.6h0.4h0.4l0.4,0.2l0.6,0.8l0.4,2l0.4,0.8l0.2,0.4l0.2,0.4
                        l0.4,0.2h0.6l1.2,0.6l0.8,0.8l1,2.2l1.4,3.2l0.8,1.4l1.4,1.6l0.6,0.6l0.2,0.2l0.4,0.2l0.8,0.2l0.4,0.2l0.4,0.2l0.6,0.4l0.4,0.2h0.6
                        l1-0.2h0.4l0.8,0.2l2.6,1.4l1.4,0.4h0.4h0.2l1.2-0.4l1-0.6l0.4-0.4l0.2-0.4l0.2-0.2l0.6,0.2l0.6,0.6l0.8,1.6l0.6,0.6l0.4,0.2
                        l0.4,0.2l0.4,0.2h0.4l0,0l0,0l0,0l3,0.6l1,0.6l1.8,2l1,1l0.2,0.2l0.2,0.2h0.6h0.4l0.6-0.2l0.6-0.2l0.2-0.2v-0.4l-0.4-1v-0.4l0.2-0.6
                        l0.2-0.2h0.4l0.6-0.2l1-0.6l0.2-0.4l-0.2-0.4l-0.2-1l0.2-0.8l0.4-1l0.4-1l0.4-0.6l0.6-0.2l1,0.2h0.4l0.4-0.2l0.6-0.6l0.4-0.2
                        l3.3-1.2l1-0.4l0.4-0.2h0.6l1.8-0.2l2.2-2.6l1.6-0.2l0.4,0.2l0.8,0.6l0.4,0.2h0.4h1h0.6l1.4,0.4l0.4,0.2l0.2,0.4l0.4,1l0.2,0.2h0.4
                        l1-0.2h0.4l0.4,0.2l0.4,0.2l0.4,0.2l0.4,0.2l0.6,0.8l0.8,1.6l0.6,0.8l0.4,0.2l0.8,0.2l0.4,0.2l0.2,0.4l0.4,0.8l0.4,0.4l1,0.2h0.9
                        l1,0.2l0.6,0.6l0.4,1.6l0.8,0.8l2.3,1.2l2.6,1l0.6,0.8l-0.4,1.4l-3,4.2l-1,0.8l-1.2,0.4l-1.2-0.2l-1.2-1l-1,2l0,0l-2.6,2.4l-0.4,1
                        l1.4,1l2,0.4l6.8-0.2l0.6,0.4l1,1.6l0.8,0.6l1.8,0.6l0.6,0.6l0.2,0.4l0.2,0.6v0.6v0.4l-0.4,0.6l-0.4,0.2h-0.4l-0.4,0.4l-0.2,0.6v1v1
                        l0.2,0.6l1.6,0.8l2-0.4l2.3,0.2h1.8l4.2,2.2v0.4l-0.2,0.6v1.2l0.6,1l1.8,1.2l0.4,0.8l-0.2,0.2l-0.6,0.2l-0.2,0.2v0.4l0.2,0.4v1
                        l0.2,0.6v0.6l-0.2,0.6l-0.6,0.6H-82l-1.4-0.2l-0.8,0.2l-0.2,0.2v0.4l-0.4,0.6l-1,0.8l-2.6,1.6l-0.8,1.2l-0.2,1l0.2,0.2h1.4l0.8,0.2
                        l0.4,0.2v0.4v0.8l-0.4,1.6l-1,0.6l-1.2,0.6l-1.2,1l-0.8,0.2h-0.6l-0.6,0.2l-0.8,0.6l-0.6,0.6l-0.4,0.6l-1.4,3.9l-0.4,0.6h-0.4
                        l-0.8-0.4l-0.4-0.2l-0.4,0.2l-0.8,0.4l-0.4,0.2l-1,0.2l-0.8-0.2l-2.6-1.6l-1.2-0.6l-0.4-0.2l-0.6-0.6l-0.4-0.6l-0.6-0.4l-1-0.2
                        l-0.8,0.2l-2.2,1.4l-0.8-1.4l-1.6-0.6l-0.6-0.6l-3.3,1h-1l-0.2,0.2l-0.4,0.4l-0.4,0.8l-0.4,0.4l-1,0.2l-0.8-0.4l-2.2-1.2l-0.6-0.2
                        l-0.4,0.2l-0.2,0.8l0.2,0.6l1,2.6l0.6,0.8l1.4,0.8l0.6,0.4l0.4,0.8v0.8l0.2,0.8l0.6,0.6l0,0l0,0l0,0l-0.2,0.6l-0.4,0.2l-0.6,0.2
                        l-0.4,0.2l-0.4,0.6l-0.2,1.2l-0.2,0.4l-0.4,0.6l0,0l-0.2-0.2h-0.6l-1.2,0.4l-1,0.6l-1,0.2l-0.6,0.4l-1,1.4l-0.8,0.6l-1.6,0.8
                        l-0.6,0.4l-0.4,0.8l0.4,0.2h0.8h0.8l0.6,1.2l0.2,0.4l0.4,0.2l1.2,0.6l1.4,1l0,0l1-0.4h1l1,0.2l5.2,2.3l1.8,1.4l0.4,0.4l0.2,1v0.8
                        l0.4,0.4l1.4-0.4l1,0.2l0.6,0.6l0.6,0.6l0.8,0.6l0.8,0.4l0.8,0.2l0.8,0.4l0.8,0.8l1.4,2l0.6,0.4l0.8,0.2l1.4-0.2l0.8,0.2l0.8,0.4
                        l0.6,0.6l1.6,2.3l0.6,0.6l1.6,0.8l0.6,0.6l1.2,1.4l0.8,0.4l0.4,0.2h1l0.4,0.2l0.2,0.2l0.6,0.8l0.4,0.4l0.6,0.2l2,0.2l1.8,0.6h0.6
                        l2.8-0.2l1.2,0.4l0.4,1.2l0.4,0.4l0.8,0.2h1l0.8-0.2l0.8,0.2l2.3,1.4l1.2,0.4h0.6l0.6-0.2h0.6l0.6,0.2l1.4,2.2l1,0.6l0.4,0.4v0.8
                        L-70,446h-0.4l-0.6-0.2h-0.6l-0.6,0.8l-0.6,1.4l-0.8,2.8l-0.2,2l0.6,1.4l1,1l1.4,1l0.8,0.8v0.6l-0.2,0.6v1l0.4,0.6l2.2,1.4l0.2,0.4
                        l0.4,0.8l0.4,0.2l0.4,0.2l1.8-0.2l0.2-0.2h0.2l0.4,0.6v0.6l-0.2,1.2v0.6l0.4,0.8l0.8,0.6l0.8,0.4l0.8,0.2l0.4,0.2l0.2,0.2h0.2
                        l0.4-0.2l0.2-0.4l0.2-1l0.2-0.4l0.8-0.4h1l1,0.4l0.8,0.6l0.2,0.4l0.4,1.4v0.2l-0.2,0.2v0.2v0.2l0.2,0.2l0.6,0.2l0.2,0.2l0.8,1.8
                        l0.4,0.4l0.8,0.4l0.4,0.4l0.2,0.6l0.2,1.2l0.2,0.4l0.4,0.4l1.2,0.6l0,0l0.8,1.6l-0.6,3.8l0.6,1.6l1.8,1.6l1.2,2.3l1,1.4l0.4,0.8
                        l0.6,1.8l0.4,0.8l0.6,0.4l2.3,1l1.6,1l1.2,1.2l3,3.9l1,1l0,0l3.9,4.9l7.8,6.8l1,0.6h0.6l0.6-0.4l0.6-0.6l0.2-0.4l0.2-0.4l0.2-0.2
                        h0.6l0.6,0.2l0.2,0.4v0.6l0.2,0.6l0.2,0.4l0.6,0.6l0.2,0.2v0.4l-0.4,0.8v0.6l0.2,0.8l1.4,2.3l2.2,2.2l0.4,0.8v0.2l-0.2,0.6v0.2l1,2
                        l0.2,0.4l0,0l0.4,0.4l0.8,0.4l1,0.4l0.8,0.2l1,0.4l1.4-1.2l0.4,0.8v14l0.2,1.2l0.4,1l1,1.2l0.8,0.6l1,0.4h0.6l0.8,0.4l0.2,0.6
                        l-0.2,2.6v0.6l0.6,2l0.8,1.2l1,0.8l1.4-0.2v0.6l0.2,0.2h0.4l0.4-0.2l0.4-0.4v-0.4v-0.4l0.2-0.4l1.2-0.8l0.6-0.6l0.2-0.8l1-1.8h1.2
                        l0.8,1.2l0.2,2l-0.2,1.6v0.2l-0.2,0.2l-0.2,0.2v0.2l0.2,0.2l0.4-0.2l0.2-0.2h0.2l0.6,1.4l0.4,0.6l0.8,0.6l1.2,0.6l0.2,0.2l0.2,0.4
                        l0.2,1l0.2,0.4l0.6,0.4H14h1.6l1.8,0.2l0.8,0.2l0.8,0.4l0.8,0.6l0.4,0.6l0.4,2.6l0.2,0.6l0.4,0.6l0.6,0.6l0.8,0.4l0.6,0.2l0.6,0.2
                        l0.8,0.2l1.2,0.8l1.8,2.2l1,1l1.4,0.4l1.4-0.2l2.6-0.6h1l0.2,0.2v0.6v1l0.2,0.6l0.4,0.4v0.4l-0.6,0.6l-0.6,0.6l-1.2,2.3l-0.6,0.8
                        l-0.6,0.4l-1.8,0.4l-0.8,0.4l-3.2,2.2l-0.4,0.2h-0.4l-0.4-0.2l-0.4-0.2l-0.6,0.2l-0.6,0.6l-1.2,2.6v1l0.6,0.8l2.6,1.6l0.4,0.6
                        l0.2,0.8l0.2,2l0.2,0.8l0.4,0.6l0.8,0.6l1.8,1l0.6,0.6l2.3,4.3l0.6,0.4l0.4-0.2l0.4-0.4l0.4-0.4h0.4l1,0.2h0.2l0.2-0.2H36l0.2,0.6
                        l0,0l0.2,0.4l0.2,0.2h0.2l0.4-0.2l0.6,0.4l0.2,1v1.2l0.2,0.8l0.8,0.6l2-0.4l0.8,0.2l0.2,0.6l0.2,1.8l0.4,0.8l0.6,0.6l2.2,1.6
                        l0.6,0.8l0.4,0.6v0.8l-0.4,2.3l-0.2,0.2h-0.4l-0.2-0.2l-0.2-0.2l-0.4,0.4l-0.2,0.4v1.6l-0.2,1l0.8,2.6l-0.2,0.2l-0.6,0.6l-0.2,0.4
                        v0.4l0.4,0.8v0.6l-0.6,0.6h-0.8l-1.2-0.2H41l-2.2,0.6H38l-0.4,0.4v0.6l0.4,0.8v0.8l0.2,0.6l0.4,0.6l0.6,0.4l0.8,0.4l2.8,2.2l0.4,0.4
                        l-0.2,0.6l-0.8,1l-2,1.8l-0.4,0.6l0.2,0.8l0.4,0.8l0.2,0.8l-0.6,0.6l0.4,0.4l0.4,0.4l0.4,0.4v0.6l0.6,1.2l-0.2,1.2l-1.2,2.3v0.8
                        l0.2,1.4v0.8l-0.2,0.6l-0.6,1l-0.2,0.6v0.4l-0.2,0.6l-0.6,1.2l-0.4,0.8l-0.6,0.4l-1,0.2l-0.2-0.2l-0.2-0.4l-0.2-0.2l-0.6,0.2
                        l-0.4,0.4l-0.2,0.4v0.4l-0.2,0.4l-1,1.6l-0.4,0.8v1v0.4l0.4,1l0.2,0.4v0.4l-0.2,1.8l-1.6,4.6l-0.2,1.2l0.2,0.6l0.4,0.4l0.6,0.8v1
                        l-0.2,1v1l0.6,0.8l0.8,0.2l1.8-0.2l0.8,0.2l0.2,0.4v0.4v0.4v0.4l0.6,1.4l0.2,0.8l-0.2,0.6l-0.2,0.6l-0.2,0.8l0.6,1.4v0.4l-0.2,1v0.6
                        l0.2,0.8l0.8,1l0.4,0.8v0.2l1,1.2l0.8,1.2l3.8,7.5l0.4,1.8l0.4,4.8l-0.2,1.4l-6.8,16.6l0.2,0.6l0.8,0.6l0.2,0.4v0.4l-0.2,0.2
                        l-0.2,0.2l-0.2,0.4v0.6l0.2,0.6l0.6,1.2l0.2,1.4l0.2,0.8l0.4,0.6l1.4,1.4l0.6,1.4l0.2,1.2v1.2l0.2,1.4l1.2,5.2v1.6l-0.2,1.4
                        l-0.2,0.6l-0.2,0.6l-0.2,0.6l0.4,0.6v1.2l-1.4,3.9l-0.2,1.2l-0.4,1l-0.6,0.8l-1.2,0.4l-1.2,0.8l-1.6,2.2h-1l-1-0.8l-1.4-2.2
                        l-1.2-0.6l-2,0.2l-3,1l-2.8,1.4l-1.4,1.4l-0.4,0.6l-0.6,0.6l-1.2,0.8l-1.4,1.8l-3.2,3.2l-1.2,0.8l-1.8,0.6l-1.8,0.2l-3.6-0.2
                        l-1.4,0.2l-1,0.6l-0.8,1.2L5,764.2l-1,1.2l-1,0.2L0.7,765l0.4,0.8l-3.9-0.6H-5l-1.4,1H-7l-0.5,0.1l-0.2-0.4l-0.4-0.4h-0.6h-0.6
                        l-1.2,0.2l0.4,1.2l1.4,2.6l0.2,1.2l-0.2,0.2l-0.6,1.2v0.4v1v0.4l-0.4,0.6l-0.4,0.6l-0.2,0.6v0.8l1.2,2.2l0.4,1.2l-0.4,0.8h-0.6
                        l-0.6-0.4l-1-0.8l-0.6-0.2h-0.4h-0.4l-2.6,0.6l-0.6-0.2l-0.4-0.4l-0.6-1l-0.4-0.4l-1-0.4l-3.2-1h-2l-2.3-0.8l-2.2-0.4l-1,1.2v0.6
                        l-0.2,0.6l-0.2,0.6l-1.2,1.4l-0.4,1l-0.6,0.6h-1.4l-2.2-0.8l-0.8,0.2l-1,1l-0.6,0.6l-0.6,0.8l-0.2,1l0.6,1l0.6,0.4l1.2,0.2l0.6,0.4
                        l0.2,0.6v0.6v1.2l0.8,2.6v0.8l-0.2,0.8l-0.6,1.6l-0.8,3.6v0.6l0.6,0.4l0.8,0.2l0.6,0.4l0.2,1l0,0l0.4,1.4l1,0.8l2.6,0.6l0.6,0.6
                        l1.2,1.8l0.8,0.8l1.6,1.4l0.6,0.8l0.4,1l0.6-1l0.8-0.4l0.8,0.2l0.8,0.6l0.6,0.8l0.8,2.8l0.6,1l-0.4,0.2h-1.4h-0.6l-0.2,0.2l-0.2,0.4
                        v0.2v1.2v0.2l0.2,0.8l1.2,2.2l1.2,4.6l-1-0.8l-1.2-0.4l-2.6-0.2l-1.2-0.4l-1.4-0.6l-1.2-0.8l-0.8-1l-0.4-0.6l-1.6-1.2v0.8l-0.4,1
                        l-0.6,1l-0.4,0.4h-1l-0.8-0.6l-0.6-0.8l-0.4-0.6l-0.6-1.6l-0.4-0.8l-1.6-2.2l-0.8-1.4l-0.8-1l-1.2-0.2l-1.4,0.4l-1,0.6l0,0l-0.8,0.6
                        l-1,0.4l-7.3,1.6h-0.4l-1-0.6l-1.4-0.4l-0.2-0.2l-0.6,0.4l-2,2.2l-1.4,2.8l-0.4,0.4l-0.6-0.2l-1.6-1.4l-0.8-0.4l-6.5-1.2l-0.6-0.2
                        l-0.6-0.8l-0.2-0.6l-0.2-0.2l-1,0.6l-0.6,0.4l-0.6,0.6l-0.6,0.6l-0.2,0.8l0.2,1.6l0.8,1.8l1.6,3.2v1.6l-1.2,1.2l-4.6,2.3l-0.6,0.6
                        l-0.6,0.6l-2,3l-1.2,1.2l-1.6,0.6h-2.2l-6.9-0.8h-2l-0.8,0.2l-0.6,0.4l-0.4,0.6l-0.4,0.8l-2,2.8l-0.4,0.4l-0.6,0.2l-0.8-0.2l0.2,0.6
                        l-0.2,0.8v0.6h0.8l0.8-0.2l0.6-0.4l0.4-0.6l0.4-0.8h0.4l0.2,0.4v0.4l-0.2,0.4l-0.4,0.6l-0.4,0.2h-0.4l-0.2,0.2l0.2,0.6l1,1.4l0.4,1
                        v1.2h0.4v-0.2V845l0.2-0.4l1.4,1l0.4,0.6l0.2,1.2v1.2l0.2,0.4l0.6,0.8l0.2,0.4v0.6l-0.2,0.4l-0.2,0.4l0.2,0.4h0.2h1.6l0.2-0.2l0.2-1
                        l0.2-0.2l0.6-0.2l0.2-0.4v-0.4l0.2-0.4l1.2-1l1.4-0.4l1.6,0.2l1.6,1l1,1.2l1,1.6l1.2,1.4l1.6,0.8h1l1.8-0.4l1,0.2l1,0.6l1.8,1.8
                        l2.2,2.8l0.6,1l0.4,1v2l0.2,1.8v0.6l-1.2-3l-0.2-0.8l-0.4-0.4l-1,0.4l-2.8,2.2l-0.8,0.8l-0.4,0.8l-0.4,0.4l-2.6,1l-1,1.4l-0.6,2
                        l-1.8,9.1l-0.2,2l0.4,5.9l-0.6,2.2l-0.4,6.9l-0.4,2.8v5.5l0.2,1.2l0.8,0.4v0.4l-0.8,0.6l-0.2,1.2l0.4,2.3l-0.2,1l-0.6,2l-0.2,1.2
                        l0.8,1.2l2-0.4l3-1.4l-0.2,0.8l0.2,1l0.4,0.8v0.2l-0.8,0.6H-79h-1.2H-81l-0.6,0.2l-0.2,0.2l0.2,0.6l1,0.6h1.4l1.4-0.4l1.2-0.6
                        l-0.2,0.6l-0.6,0.6l-0.8,0.4l-0.6,0.2l-3.2-0.6h-0.6l-0.6,0.4l0.2,0.2l0.4,0.2l0.2,0.4l-0.2,0.6l-0.4,0.2l-0.4,0.2l-0.4,0.2
                        l-2.8,2.2l-0.4-0.4l-0.6-0.2l-0.4,0.2l0.2,0.6l0.2,0.2l1.2,0.4l3,0.4l0.4,0.2l0.2,0.2l0.2,0.2l1,0.2l10.3-2l1.8-0.8l1.2-1l1.6-2.6
                        l3-2.3v-0.2l1.2,0.2l1.4-1l1.4-1.4l0.8-1.2l3.2-7.3v-0.2v-0.6v-0.2l0.2-0.2l0.6-0.2l0.2-0.2l0.2-0.8l0.4-0.6l1.2-1l2-2.2l1.2-1
                        l10.3-3.8l12.1-4.9l6.3-2l1.4-0.2l0.4-0.4l0.2-0.8l-0.2-0.6l-0.4-0.2l-0.4-0.2l-0.4-0.4l1.8-1.8l0.2-0.6l-0.2-2l-0.2-0.8l-0.4-0.6
                        l-4.9-7.1l-0.4-1l-0.2-0.8l-0.4-0.8L-36.3,859l-1-1.4l0.8,0.2l1.4,1l1.6,0.4l1.4,1l1.8,1.6l4.3,5.5l8.7,8.1l3.9,2.2l2.2,1.8l0.6,0.2
                        h2l0.6-0.4l0.4-0.2l0.4,0.2l0.6,0.2l0.6-0.2l1-0.6l1.2-1l1-1.4l0.6-1.6l0.2-2.3v-1l-0.2-0.8l-0.6-0.4l-1.2-0.2l-0.4-0.6l-0.4-1.8
                        l-0.8-1.6l-1.2-1.4l-4.2-3.3l-1-1.2l-0.2-0.2l-2.3-2.2l-0.2-0.4l-0.4-0.8l-0.2-0.4l-0.4-0.4l-3.2-2.3l-1-1l-0.6-0.6l-0.4-0.6
                        l-0.4-1.6l-0.4-0.6l-1-1.2l-0.4-0.2l-0.4-0.2l-0.2-0.2l0.4-0.4h0.2l0.4,0.2l0.4,0.2l11.7,11.9l3.9,2.3l1.2,0.8l2.8,3l1.2,0.8
                        l1.2,0.2l1.2-0.4l1-1l0.2-1.6h0.2l0.2,0.4l0.2,0.4v0.4l-0.4,0.4v0.4l0.6-0.6l0.6-1l0.2-1L3,862.1l-0.8-0.2l-2.6-1.4l-2.3-2l-3.6-1.8
                        l-1-1l-4.3-5.8l-0.4-1l-0.4-1.8l-0.6-0.6l-1.4-1.2h-0.2l-0.2-0.2l-0.2-0.2l1.8,0.6l1.4,1.4l3.9,6.2l1.2,1.4l1.4,1l2.3,1l0.8,0.6
                        l0.6,0.6l0.6,0.4l0.8,0.2h1.8h0.2l0.2-0.2l0.2-0.4l0.4-0.4v-0.4l0.2-0.2h0.8l0.2-0.2l-0.2-0.4L3,855.9l-0.2-0.2l0.2-0.4l0.2-0.4
                        l0.6-0.6v-0.2l0.2-0.8h0.4l0.2,0.4v0.4v0.4L4.4,855l0.8,0.2l0.8-0.4l2.6-2.6l0.2-0.8v-1V850l-0.2-0.2l-0.4-0.2h0.3H8l-0.4-0.2
                        l-0.2-0.2H7.2L7,849.1l-0.8-0.6l-0.2-0.2l-11.3-3.8l-2.8-1.8l0.8-0.2l0.6,0.2l0.8,0.4l1,0.2h1.8l3.3,0.6h4.9l2.3,0.6h1l0.8-0.4
                        l0.2-1L9.1,839l-0.2-0.6l-0.6-0.6l-0.4-0.6l-0.4-0.8l-0.6-0.6l-0.8-0.2l-0.4,0.2L5,837.1l-0.4,0.4h-1l-0.4-0.6L3,836.2l-0.2-0.6H2.4
                        L2,836.3l-0.6,0.6l-0.6,0.4L0,837.5l-0.4-0.2l-0.2-0.6v-1.6l0.4,0.4L0,836l0.2,0.6v0.8l0.6-0.4l0.6-0.2l0.4-0.2l0.4-1l0.4-0.4
                        l0.6-0.2l0.6-0.2l-0.2-0.4l-0.2-0.2l-0.2-0.8h0.4l0.4,0.8h0.8l1.6-0.6l0.6-0.4l0.4-0.8l0.2-1l0.2-0.8l0.2-0.4l0.2-0.2l0.2-0.2
                        l0.2-0.6l-0.6-1.4l-0.2-0.4l-0.2-0.2l-0.4-0.2l-0.4-0.4l0.2-0.6l0.2-0.2l1-0.6h0.2l0.6,0.2l0.8,0.6l0.6,0.8l0.2,0.6l0.4,0.6l1-0.2
                        l1.6-0.8l2.8,2.3l-0.2,1.6v0.8l0.2,1l0.2,0.4l0.2,0.2l0.2,0.2l0.2,0.6v0.4l-0.2,0.6v0.4l0.2,0.2l0.4-0.4l1-1.8l0.8-0.4l-1-0.8
                        l-0.4-1.2v-1.4l0.4-1.4h0.2v1.4v0.6l-0.2,0.4v0.2l0.6,0.6l-0.4,0.4l0.6,0.4l0.4,0.2h0.4v-0.4l-0.2-0.2l-0.4-0.2l-0.2-0.4l0.6-1.2
                        v-0.8l-0.4-0.4l-0.6-0.2v-0.6l0.4-1.2l-0.4-0.4l-0.6-0.4l-0.4-0.6l0.2-0.6l1.4,1.2l0.6,0.8v1.2l-0.6-0.2l-0.2-0.2l0.2,0.4l0.6,0.6
                        l0.2,0.2l0.2,3.3v0.4l-0.4,0.6l-0.4,0.2l-0.6,0.2l-0.4,0.4L18,835h0.2l0.2-0.4l0.4-0.2l0.6-0.4v0.4l0.2,1l0.6-0.2l0.4-0.4l0.4-1
                        l0.2,0.6v0.2l-0.2,0.4h0.2l0.8-0.6h1l1,0.4l0.6,0.6h0.2v-0.6L25,835h0.6H26h0.2l1,1l0.2,0.2l0.2,0.2l0.2,0.4l0.2,0.4v0.4l-0.2,0.2
                        l-0.4,0.2l-0.4,0.2l-0.2,0.4l1.2,0.2l1.8,1h0.8l1.2-1.8l1.4-1.2l0.4-0.6l0.6,0.2l1.8-0.6l2.2-0.2l0.8-0.2l3-1.4l1-0.6l0.4-0.6
                        l0.2-0.6l1.2-1.2l0.4-0.4l2-1l1-0.4l1-0.2l3-1.6l1.8-0.6l0.6-0.4l2-1.6l2.8-1.2l0.8-0.2h1l0.8,0.2l2,0.6l0.6,0.4h0.4l1.8-3.3l0.4-2
                        l0.6-1.4l0.2-0.6l0.2-0.6l1-1.2l0.2-0.4l0.6-0.8l1.4-0.4l5.8-1.2l1.2,0.4l0.4,1.4h0.2l0.8-1.6l0.4-0.4l1-0.2l0.2-0.4l0.6-2.2
                        l0.2-0.6l0.4-0.2h0.8h0.6l1.6-0.8l0.4-0.2l1.2-0.2l0.4-0.6l0.4-2l0.4-0.8l0.6-0.8l0.8-0.6l1.4-0.4l0.6-0.6l0.2-0.2h1.8l0.6-0.2
                        l1-0.4l0.4-0.2h0.6l1,0.4l0.4,0.2h0.8l0.6-0.2l0.4-0.4l0.4-0.8l0.6-2.3l0.4-0.8l0.4-0.6l0.6-0.6l1.6-1.2l0.8-0.4l0.8-0.2h0.8
                        l0.8,0.2l2,1h0.8l0.6-0.2l0.6-0.4l1.2-1l0.6-0.6l0.2-0.6l-0.2-1.8l0.4-3.2v-2l-0.8-1.2h0.4h1l-0.2-0.8v-0.6l0.2-0.6v-0.6l-0.4-0.2
                        l-0.6-0.6V781l1-0.2l0.2,0.4l0.4,1.6l0.6,0.6l0.8,0.2h0.8h0.6l0.6,0.4h0.4l0.6-0.8l0.2-0.6l0.2-0.6l0.2-0.4l0.8-0.8l0.2-0.4l0.2-0.8
                        v-0.4l0.2-0.4l0.8-1l0.4-1l0.4-0.4l0.4,0.4l0.6-1l-1.8-2.3v-1.2l-0.6-0.8V771l0.4-0.6l0.2-0.6h-0.4l-0.8,0.8l-0.6,1L118,772
                        l-1.4-0.2l-0.2-1.6l0.6-1.6l1-0.2l1.2-1l0.8-1.2l0.4-1.4l0.2-1.4l-0.2-0.8l-1-1l-0.2-0.4l0.2-1.4v-0.2l-0.2-0.2l-0.6-1.2l0.6-0.8
                        l0.4,0.6l0.4,2l1,2.8h-3.6l0.6,1.6l-0.2,3.3l0.4,1.4h0.2l0.4-0.2h0.2l0.4,0.6l0.6,0.4h0.8l0.8-0.4v-0.4l-0.6-0.2l-0.4-0.6l-0.2-0.8
                        V767l0.8-0.6v-0.8l0.2-0.8v-0.2l-1.4-1l-0.4-0.6l-1.4-2.6l-0.4-0.8l-0.2-2v-0.4l0.6-0.6l0.2-0.4l-0.2-0.6l-0.4-0.4v-0.2V755v-0.4
                        V754l-0.2-0.4l-0.6-0.4l0,0l-0.2,0.2l0.2-0.6l0.4-0.2l1.2,0.4l-0.4-0.6l-0.4-0.4l-0.2-0.6l0.2-0.8l-1-0.6l-0.4-0.4l-0.2-0.4l0.2,0.2
                        l1,0.4l0.4-1.2l0.2-0.4h0.2l0.6,0.2l0.2-0.2v-0.4l-0.6-0.4l-0.4-0.4l-0.4-0.4l-0.2-0.4v-1l-0.2-1.2l-0.4-0.8l-1,0.2l-0.4-0.6
                        l-0.8-0.8l-0.2-0.6h0.4l0.2,0.2l0.4,0.2l-0.2-0.2l-0.2-0.6l-0.2-0.2l1.4-0.2l1.4,0.8l2,2.2l0.6,1.2l0.4,0.6l0.8,0.2l0.6-0.4l0.2-0.8
                        l0.4-0.4l0.6,0.6l0.4-0.4l-0.4-0.4l0.6-0.6l-0.4-0.6l-0.8-0.6l-0.6-0.2l-0.2-0.2l-0.2-0.4v-0.4l0.4-1l-0.2-0.4l-2.3-1.6l-0.6-0.6
                        l-0.2-0.8l0.2-0.8l0.4-0.8v-0.6l-0.8-0.2v0.4h0.4v0.2l-0.6,0.2l-0.2,0.4v0.6l-0.2,0.4h-0.4v-0.2l0,0h-0.2h-0.2v-0.4l-0.2-0.8v-0.8
                        l0.4-0.4l-0.2-1.8v-0.5l1.4-2l0.4-0.4l0.6-0.2l0.6-0.6l1.2-1.4l0.4-0.4l1.6-1l0.2-0.4v-0.4l0.2-0.2l0.6-0.2l0.2,0.2v1.4l0.2,0.6
                        l0.8,1l0.2,0.8l-0.2,0.4L125,729l-0.4,0.2l-0.2,0.2l-0.2,0.2l-0.8,1.2h0.6l0.4,0.2l0.4,0.4l0.2,0.4l0.2-0.4V731v-0.4l-0.2-0.4h0.6
                        h0.4l0.2-0.2v-0.4l1,1.6v0.2l-0.8,0.8h0.5v0.6l0.2,0.2l0.2,0.2l0.2,0.2l0.6,1.4l0.4,0.6l0.6-0.2v-0.6l-0.2-2l0.2-0.8l0.2-0.2h0.4
                        l0.2-0.2L130.4,733.5L130.4,733.5z"></path>
                    <polygon class="st0" points="7.8,889.3 7.6,889.3 7.6,889.1 7,889.5 6.2,889.9 5.6,890.5 5.4,891.1 5.4,891.3 5.8,891.7 5.8,891.9 
                        6.2,891.7 6.2,891.7 6.2,891.7 6.2,891.5 6.2,891.3 6.2,891.1 6.2,890.9 6.4,890.7 6.8,890.7 7,890.7 7.1,890.7 7.4,890.7 
                        7.4,890.5 7.1,890.1 7,889.9 7.6,889.7 7.6,889.7 7.6,889.7 7.4,889.5 7.8,889.5 7.8,889.5 "></polygon>
                    <polyline class="st0" points="9,881 8.6,880 7.8,879.2 "></polyline>
                    <polygon class="st1" points="292.1,570.3 290.5,571.3 288.9,572.5 288.3,573.5 286.9,573.7 286.3,573.7 286,573.9 285.8,574.1 
                        286,574.5 286.3,574.9 287.3,576.6 288.5,578.2 288.7,578.8 288.5,579.4 287.7,579.6 287.3,579.8 287.6,580.6 287.2,580.8 
                        286.9,580.8 286.6,580.8 287.2,582.4 288.2,582.4 290.5,580.2 295.1,577.2 295.9,576.2 295.3,572.9 294.7,570.9 293.5,569.9 "></polygon>
                    <polyline class="st1" points="258.4,601 258.2,600.4 257.6,600 "></polyline>
                    <polygon class="st1" points="307.8,530.1 307.4,530.7 307.5,531.7 308.4,532.2 309,532.1 309.4,531.7 309.5,531.2 309.7,530.9 
                        309.5,530.1 308.7,529.7 "></polygon>
                    <polygon class="st1" points="277.1,559.8 275.6,559.8 275.2,560.2 275.5,560.6 275.6,560.8 275.5,561.4 275.6,561.4 276.1,561 
                        276.2,561 276.6,560.6 276.8,560.4 277.2,560.4 277.4,560 "></polygon>
                    <polygon class="st1" points="281.2,519.6 281,520 281.2,520.4 281.6,520.6 282.2,520.6 282.2,520.2 282.2,519.8 281.8,519.6 "></polygon>
                    <polygon class="st1" points="269.9,543.2 269.5,543.3 269.3,543.6 269.5,544.2 270.3,544.5 270.7,544.5 271.1,544.2 271.3,543.6 
                        270.9,542.9 270.3,542.9 "></polygon>
                    <polygon class="st1" points="300.6,586.9 300,587.7 300,588.3 300.4,588.5 301.4,587.9 301.8,587.3 301.8,586.6 301.4,586.3 "></polygon>
                    <polygon class="st1" points="304.6,527.5 305.2,527.3 304.6,527.1 304.4,527.1 304,527.1 303.8,527.5 304.2,527.7 "></polygon>
                    <polygon class="st1" points="362.9,864.4 362.6,864.5 362.2,864.5 362.1,864.2 361.9,864.2 360.9,863.9 360.5,863.8 360.3,863.8 
                        360.3,863.9 360.6,864.9 361.1,865.2 363.1,865.5 363.2,865.4 363.6,864.8 363.6,864.5 363.2,864.4 "></polygon>
                    <polygon class="st1" points="346.6,861.8 346,862 345.8,862.4 345.6,862.8 346,862.9 346.6,862.9 347.2,862.6 347.6,862.4 
                        347.8,861.8 347.8,861.6 347.2,861.6 "></polygon>
                    <polyline class="st1" points="361.5,870.5 362.9,871.3 363.6,874 "></polyline>
                    <polygon class="st1" points="338.5,856.2 338.5,856.4 338.3,856.2 338.1,856.2 338.1,856.2 337.5,856 337.3,856 337.3,856 
                        337.3,856 337.5,856.4 337.7,856.7 338.7,856.8 338.7,856.8 338.9,856.4 338.9,856.4 338.7,856.2 "></polygon>
                    <polyline class="st1" points="351.5,869.9 352.1,870.3 352.5,871.5 "></polyline>
                    <polygon class="st1" points="356.5,878 356.3,878 356.1,878 356.1,877.8 356.1,877.8 355.7,877.8 355.5,877.6 355.5,877.6 
                        355.5,877.8 355.7,878 355.9,878.2 356.5,878.2 356.5,878.2 356.7,878 356.7,878 "></polygon>
                    <polyline class="st1" points="357.7,856.4 358.1,856.7 358.5,857.6 "></polyline>
                    <polyline class="st1" points="250.5,932.1 250.7,931.6 250.5,930.9 "></polyline>
                    <polygon class="st1" points="288,883 288.3,882.8 289.2,882.2 289.3,881.6 288.9,881.2 288.6,880.6 288.7,880.4 288.7,879.8 
                        288.2,879.4 287.3,879.6 286.8,880.2 286,882 286.2,882.8 287.3,883.2 "></polygon>
                    <polygon class="st1" points="293.3,856.4 293.5,855.7 293.3,854.7 292.5,854.4 291.9,854.8 291.5,855.3 291.3,855.4 291.3,856 
                        291.7,856.7 292.5,856.8 "></polygon>
                    <polygon class="st1" points="320.2,835.5 321.5,835.2 321.8,834.8 321.6,834.5 321.5,834.2 321.5,833.6 321.2,833.9 321.1,834 
                        320.6,834.2 320.5,834.6 320.2,834.8 320.1,835 319.9,835.5 "></polygon>
                    <polygon class="st1" points="321.2,862 321.5,861.6 321.2,861.2 320.6,861 320.2,861.2 320.2,861.6 320.5,862 320.6,862.2 "></polygon>
                    <polygon class="st1" points="344,832.6 344.4,832.6 344.6,832.3 344.3,831.6 343.4,831.5 343,831.5 342.7,831.9 342.7,832.6 
                        343.3,833.2 343.8,833 "></polygon>
                    <polygon class="st1" points="306.4,819.6 307.5,819.4 308,819 307.8,818.6 307.5,818.4 307.5,817.8 307.4,818 307.2,818.2 
                        306.8,818.4 306.6,818.8 306.4,819 306.2,819.2 306,819.6 "></polygon>
                    <polygon class="st1" points="330.2,816.8 330.6,816.8 330.7,816.4 330.3,815.8 329.6,815.6 329.2,815.6 328.7,816 328.7,816.8 
                        329.4,817.4 330,817.2 "></polygon>
                    <polygon class="st1" points="327,870.5 327.4,870.5 327.6,870.1 326.4,869.9 326.6,870.1 326.6,870.3 326.4,870.3 "></polygon>
                    <polygon class="st1" points="326,930.7 325.8,931.1 325.6,931.3 325.2,931.3 325.2,931.3 324.4,932.1 323.8,932.3 323.8,932.5 
                        324,932.7 325,932.7 325.4,932.7 326.8,931.3 326.8,931.1 326.6,930.3 326.4,930.3 326.2,930.6 "></polygon>
                    <polyline class="st1" points="330,935.5 331.3,934.7 334.1,935.9 "></polyline>
                    <polygon class="st1" points="332.9,944 332.9,944 332.9,944.2 332.7,944.2 332.7,944.2 332.5,944.4 332.3,944.4 332.3,944.6 
                        332.3,944.6 332.7,944.6 332.9,944.6 333.3,944.2 333.3,944 333.2,943.8 333.2,943.8 333.2,943.8 "></polygon>
                    <polyline class="st1" points="330.2,912.3 330.7,912.1 331.6,912.5 "></polyline>
                    <polygon class="st1" points="272.9,957.1 272.9,955.9 272.9,955.1 272.3,954.1 272.3,953.7 273.1,951.5 273.5,951.3 273.9,950.8 
                        275.1,949.6 275.6,948.9 275.9,948.6 275.9,948.4 275.9,947.8 275.9,947.2 275.9,947 275.1,947.8 274.5,948.2 272.7,948.9 
                        269.5,949.6 269,949.6 268,949.9 268.4,952.1 270,955.9 270.9,957.7 271.5,958.7 272.1,958.9 272.5,958.3 "></polygon>
                    <polyline class="st1" points="264.5,890.1 265.2,890.5 265.8,890.5 "></polyline>
                    <polygon class="st1" points="339.1,908.5 339.7,907.5 339.5,906.9 339.1,906.9 338.7,906.9 338.3,906.6 338.3,906.8 338.5,907.2 
                        338.5,907.5 338.5,907.9 338.5,908.2 338.5,908.5 338.7,908.9 "></polygon>
                    <polygon class="st1" points="268,913.9 268,912.9 267.1,912.5 266.1,912.5 265.4,913.5 265.4,914.1 266.4,914.9 267.5,914.9 "></polygon>
                    <polyline class="st1" points="216.8,940.1 217,939.5 216.8,938.8 "></polyline>
                    <polygon class="st1" points="239.2,965 239.2,963.8 239.2,963 238.6,962 238.6,961.6 239.4,959.5 239.8,959.3 240.2,958.7 
                        241.4,957.5 242,956.9 242.2,956.5 242.2,956.3 242.2,955.7 242.2,955.1 242.2,954.9 241.4,955.7 240.8,956.1 239,956.9 
                        235.8,957.5 235.2,957.5 234.2,957.9 234.6,960 236.2,963.8 237.2,965.6 237.8,966.6 238.4,966.8 238.8,966.2 "></polygon>
                    <polygon class="st1" points="234.2,921.8 234.2,920.8 233.5,920.5 232.5,920.5 231.7,921.5 231.7,922 232.7,922.8 233.9,922.8 "></polygon>
                    <polygon class="st1" points="313.7,898.8 314.1,898.7 314.9,898.1 315.1,897.4 314.7,897.1 314.3,896.5 314.5,896.3 314.5,895.7 
                        313.9,895.3 313.1,895.5 312.5,896.1 311.7,897.8 311.9,898.7 313.1,899 "></polygon>
                    <polygon class="st1" points="309.8,916.7 310.1,916.5 311,915.9 311.1,915.3 310.7,914.9 310.4,914.3 310.5,914.1 310.5,913.5 
                        310,913.1 309.1,913.3 308.5,913.9 307.8,915.7 308,916.5 309.1,916.9 "></polygon>
                    <g class="cursor-pointer hanoi">
                        <path class="st2" d="M-19.1,292.4c-2.3,10.7-27.2,33.8-27.2,33.8s-13.6-31.3-11.3-41.9c2.3-10.7,12.7-17.6,23.4-15.3
                            C-23.7,271.2-16.9,281.7-19.1,292.4z"></path>
                        <path class="st3" d="M-26.6,287.5c0,10.9-19.6,38.8-19.6,38.8S-66,298.4-66,287.5s8.8-19.6,19.6-19.6
                            C-35.6,267.8-26.6,276.5-26.6,287.5z"></path>
                        <path class="st4" d="M-30.8,287.5c0,8.5-7,15.6-15.6,15.6s-15.6-7-15.6-15.6s7-15.6,15.6-15.6S-30.8,279-30.8,287.5z"></path>
                        <polygon class="st3" points="-46.4,278.3 -44,285.3 -36.7,285.3 -42.6,289.6 -40.3,296.8 -46.4,292.4 -52.4,296.8 -50.1,289.6 
                            -56.1,285.3 -48.6,285.3 	"></polygon>
                    </g>
                    <text x="-101" y="360" class="small hanoi">Ha Noi</text>
                    <g class="cursor-pointer danang">
                        <path class="st2" d="M97.2,534.8c-2.3,10.7-27.3,33.8-27.3,33.8s-13.6-31.3-11.3-42c2.3-10.7,12.7-17.6,23.4-15.3
                            S99.5,524.2,97.2,534.8z"></path>
                        <path class="st3" d="M89.8,529.9c0,11-19.7,38.9-19.7,38.9s-19.7-27.9-19.7-38.9s8.8-19.7,19.7-19.7
                            C80.8,510.2,89.8,519,89.8,529.9z"></path>
                        <path class="st4" d="M85.6,529.9c0,8.5-7,15.6-15.6,15.6s-15.6-7-15.6-15.6s7-15.6,15.6-15.6S85.6,521.4,85.6,529.9z"></path>
                        <polygon class="st3" points="70,520.8 72.3,527.8 79.7,527.8 73.8,532.1 76.1,539.2 70,534.8 63.9,539.2 66.2,532.1 60.2,527.8 
                            67.7,527.8 	"></polygon>
                    </g>
                    <text id="zindexmap" x="960" y="607" class="small japan">Tokyo</text>
                    <path class="st1" d="M722.1,818.8l-0.1-0.3l-0.3-1l-0.3-0.5h-0.5l-0.3,0.3v0.3l0.1,0.3v0.1l-0.6,1l-0.3,0.5l-0.3,0.1l-0.5-0.1
                        l-0.1-0.3l0.3-1.2l-1.9,1l-0.8,0.7l-0.5,1.3l-0.3-0.3l-0.3-0.1l-0.3-0.3l-0.3-0.3l-0.3,0.6l-0.5,0.5l-0.6,0.3l-0.6-0.3l-0.5,0.7
                        l-0.6,0.1l-0.7-0.1l-0.8,0.1v0.1l-0.5,0.5l-0.6,0.5l-0.3,0.1l-0.7,0.1l-0.3,0.3l-0.3,0.3l-0.5,0.3l0.3,0.5l0.5,0.3h1l-0.6,0.9h-0.8
                        l-0.9-0.3l-0.8,0.3l-0.3-0.3h-0.3l-0.3,0.1l-0.3,0.1v0.3l0.3,0.3l0.5,0.1l1,0.3l1,0.5h0.3l0.3-0.5l0.3,0.3v0.5v0.5l0.3,0.5l1.5,1
                        l0.8,0.8l0.3,0.1l0.1-0.3l-0.1-0.5l-0.3-0.5l-0.3-0.3l0.6-0.3l0.5,0.1h0.3l0.1-0.7h0.3l1.5-1l-0.3-0.3l-0.8-0.5l-0.3-0.3l0.3-0.1
                        l0.3-0.1l0.3-0.3l0.3-0.3l-0.3-0.5h0.5l0.8,0.3l0.3-0.1l0.9-0.9l0.1-0.1l0.6-0.3l0.8-1.4l0.6-0.3l0.3-0.1l0.1-0.3v-0.3l0.1-0.1
                        l0.3-0.1l0.5-0.1l1.3-0.5l0.3-0.3h0.3h0.3h0.3l0.1-0.3v-0.3l-0.1-0.3L722.1,818.8z M701.7,840.6l-0.5-0.3l-0.3-0.3l-0.3-0.8
                        l-0.3-1.9l-0.6-0.7l-0.9,0.5l-0.5,0.1l-0.1,0.1l-0.3,1.3l-0.1,0.6l-0.1,0.3l0.6,1.8l-0.3,0.9l0.1,0.5l0.7,0.3l0.1,0.3l0.1,0.5
                        l0.3,0.5l0.6,0.3l0.5-0.1l0.5-0.3l0.3-0.3l0.3-0.7l0.7-0.9l0.1-0.6l-0.1-0.5L701.7,840.6z M681.7,873.6l0.1-0.1l-0.3-0.6l-2.3-2.4
                        v0.7l-0.5,1l-0.1,0.6l-0.3,0.5l-1.2,0.7l-0.3,0.5l-0.1,0.1h-0.3l-0.3,0.1l-0.1,0.7l-0.1,0.3l-1.3,0.9l-0.3,0.3l0.3,0.6l-1.6,0.9
                        l-1.3,0.3h-0.3l-0.3-0.1l-0.3-0.5l0.1-0.3l0.3-0.3v-0.3l-0.5-0.5l-0.7-0.1l-1.3,0.1h-1h-0.3v0.3l0.3,1v0.6v0.5l0.3,0.3l1.4,0.3
                        l0.5,0.3l0.3,0.5l-0.1,0.6l-0.7,1l-1,0.5l-1.2,0.3l-1,0.6v0.3l-0.5,0.8h-0.1l-0.1,0.3l-0.3,0.1l-0.3,0.1h-1h-0.5l-0.3,0.3v0.8
                        l0.1,0.7l0.5,1.4l0.1,0.7l-0.1,0.3l-0.3,0.7l-0.3,0.5l-0.6-0.1l-0.3,0.7l-0.5,0.8l-0.6,0.6l-0.6-0.1l-0.1,0.8l0.6,2.3l-0.1,1.3h1.7
                        l0.5-0.1l0.5-0.8l0.3-0.3l0.6,0.1l0.6-0.6l0.6-0.8l0.3-0.7l-0.5-0.1l-0.6,0.1h-0.5l-0.3-0.5l0.1-0.6l0.3-0.6l1.5-2.8l0.3-0.3
                        l0.6,0.1l0.6,0.3l0.6,0.3l0.6-0.1l-0.3-0.5l-0.6-0.6l-0.3-0.5l-0.1-0.5l-0.1-0.9l-0.1-0.5l-0.3-0.3l-0.3-0.1l-0.1-0.3l0.3-0.5
                        l0.3-0.1l0.3-0.1h2.1l0.3-0.1l0.1-0.5l0.3-0.1h0.3l0.3-0.3l1.5-1.6l0.6-0.7l0.5,0.3h0.6l0.6-0.1l0.7-0.3h0.1l0.1-0.1l0.1-0.3v-0.3
                        l-0.1-0.1h-0.3l-0.1-0.1l0.1-0.3l0.3-0.3l0.3-0.3l0.3-0.3l0.3-0.1l1.3-0.1l0.8-0.3l0.6-0.6l0.9-1.6h0.1h0.1h0.1v-0.1v-0.5v-0.1
                        l0.3-0.8l0.1-0.1l0.3-0.3l0.1-0.3l-0.1-0.3l-0.1-0.3v-0.3L681.7,873.6z M596.5,939.1l-0.6-0.3l-0.5-0.1l-0.7,0.1l-0.3-0.1l-0.9-0.9
                        l-0.1-0.3l-0.3-0.5l-0.3-0.9l-0.3-0.3l-0.1-0.1l-0.1-0.1l-0.3-0.1l-0.3-0.1h-0.1l0.3,0.6l0.1,0.3v1.2l-0.3,1.8l-0.1,0.3v0.6l1.3,0.3
                        h2.4l1.2-0.1l0.6-0.1l0.3-0.3l-0.3-0.3L596.5,939.1z M552.1,951.7l-1.2-0.3l-1-0.1l-0.6,0.1l-0.7-0.6l-0.3-0.3l-0.3-0.1h-0.3
                        l-0.1,0.3v0.3l-0.3,1.2l-0.1,1.2l-0.1,0.3l-0.3,0.1l-0.3-0.3l-0.3-0.1l-0.3,0.5l-0.3-0.1h-0.1l-0.1-0.1l-0.5,0.9l0.5,0.3l1.8,0.1
                        l3.1,0.8h0.7l1.3-1.5l0.6-1.2v-0.8L552.1,951.7z M564.1,944.9l-0.3,0.1l-0.5,0.6l-0.9,1.9l-0.3,0.3l-0.5,0.3l-0.3,0.5l-0.3,0.6
                        l-0.3,0.5l-0.3,0.1l-0.3,0.1h-0.7l-0.3-0.1l-0.3-0.1l-0.3-0.3l-0.1-0.1v-0.3l-0.1-0.3l-0.3,0.1l-0.1,0.1l-0.3,0.6l-0.3,0.3l-0.5,0.1
                        v0.3l0.3,0.3l0.5,0.1l0.5,0.1l0.3,0.3l0.1,0.3l0.3,0.3l-0.6,0.8l0.6,0.6l1,0.3l1-0.1l0.9-0.8l0.3-1.3l0.3-1.4l0.3-1.4l1-1.5l0.3-0.6
                        l0.3-0.3l0.1-0.3l-0.1-0.3L564.1,944.9z M710.8,829.9l-0.8,0.1l-0.3-0.3l-0.7-0.3l-0.3-0.3v-0.3l0.1-0.3l0.3-0.3l0.1-0.3l-1,0.1
                        l-0.3-0.1l0.3-0.7h-0.8h-0.1l0,0l-0.5,0.3l0.3,0.5l0.8,1.2v0.3l0.1,0.8l0.1,0.3l0.3,0.1l0.6-0.1h0.3v0.1l0.3,0.5l0.1,0.1l0.1,0.1
                        l0.3-0.1l0.1-0.3v-0.1v-0.1l0.1-0.1h0.3l0.1,0.1h0.1l0.5,0.6l0.8-0.3l-0.1-0.7L710.8,829.9z M731.1,821.8l-1.3,0.7L728,824l1.3,0.5
                        h0.7l0.5-0.3l0.3-0.5l0.5-0.8l0.3-0.8v-0.6L731.1,821.8z M728.3,773.1L728.3,773.1l0.1-0.1l-0.3-0.3l-0.8-1.5l-0.1-0.1h-0.1H727
                        h-0.1l-0.3,0.3l-0.3,0.3v0.3l0.1,0.1l0.3,0.1l1.4,0.8L728.3,773.1L728.3,773.1z M722.2,778.9l-0.1,0.5v0.5l0.3,0.8l0.7-0.6l0.3-0.8
                        l-0.3-0.5L722.2,778.9z M692.6,852L692.6,852v-0.1l-1.5,0.7l-0.5,0.3l-0.5,0.3h-0.6l-1.2-0.1l-0.5,0.1h-0.3l-0.1,0.1l-0.1,0.3
                        l-0.1,0.3v0.5v0.5l0.3,0.3l0.3,0.3l0.5,0.1l0.5-0.1l0.3-0.3l0.3-0.1l0.3,0.1l0.3-0.1l0.1-0.5l0.3,0.1l0.3-0.3l0.5-0.8l0.5-0.3
                        l0.8-0.5l0.3-0.5L692.6,852L692.6,852z M636.3,887l-0.5-0.3l-0.5-0.1h-0.3l-0.6,0.1l-0.5,0.3l-0.3,0.3l0.1,0.5l0.5,0.3l0.7,0.3
                        l0.6,0.3l0.3,0.5l0.1,0.3l0.1,0.3l0.3,0.1h0.3l0.3-0.1v-0.1v-0.1v-0.1l0.3-0.3l0.1-0.3l0.1-0.3v-0.3l-0.3-0.6L636.3,887z
                         M525.5,948.6l-1,0.1l-0.3-0.1l-0.3,0.3l-0.3,0.3v0.3l0.3,0.1l1.2-0.1l0.3,0.1l0.3-0.3l0.3-0.3v-0.3L525.5,948.6z M671.2,865.6
                        l0.5-0.9l0.3-0.8h-0.1l-0.3,0.5l-1.5,1.7l-0.3,0.5l0.8-0.3L671.2,865.6z M665.6,876.6l0.8-0.1v-0.9l-0.5,0.1l-0.8-0.1l-0.5,0.3
                        l0.1,0.5L665.6,876.6z M679,839.1v-0.3l-0.1-0.1v-0.3l-0.3-0.1l0.1,0.6L679,839.1z M717.1,770.9l0.3-0.1l0.1-0.1l-0.1-0.3l-0.3-0.1
                        h-0.3h-0.3v0.3l0.1,0.3L717.1,770.9z M727.7,767.9v0.1v0.1h0.1v0.3l0.3,0.3l0.3,0.3l0.3,0.1l0.3-0.1l0.3-0.3l0,0l-0.1-0.1v-0.1
                        l-0.3-0.3l-0.3-0.6l-0.1-0.3l-0.1-0.1H728l0.1,0.3l-0.3,0.3L727.7,767.9z M718.5,785.4l0.1,0.3l0.3,0.3h0.3l0.1-0.3l-0.1-0.3
                        l-0.1-0.1H719l0,0h-0.1L718.5,785.4L718.5,785.4z M649.4,879.9l-0.3,0.1l-0.3,0.3l-0.3,0.3l0.3,0.1l0.3-0.1h0.3l0.3-0.3V880
                        L649.4,879.9z M685,864.7l-0.5-0.1l-0.3,0.3l-0.3,0.3h-0.3h-0.1v0.3l0.1,0.1h0.1l0.1,0.1l0.6,0.3h0.5l0.3-0.3v-0.6l-0.1-0.3
                        L685,864.7z M653.3,892.2l-0.3,0.1l-0.3,0.3l-0.1,0.7v0.3v0.3l0.1,0.3l0.3,0.1l0.3-0.3l0.1-0.5l0.1-0.5l0.1-0.5v-0.3v-0.1
                        L653.3,892.2z M590,936.6l-0.3-0.1l-0.5-0.3l-0.3,0.1l-0.1,0.3l-0.1,0.3h-0.3l-0.3,0.1v0.3l0.3,0.3l0.6,0.1l1-0.1l0.3-0.3l-0.3-0.7
                        L590,936.6z M706.3,831.8L706.3,831.8h-0.3l-0.3,0.5l-0.3,0.6v0.6h0.1l0.3-0.1l0.3-0.3l0.1-0.3v-0.3l0.1-0.3L706.3,831.8
                        L706.3,831.8L706.3,831.8L706.3,831.8z M708.8,832.7h-0.6l-0.3-0.1l-0.3-0.3l-0.3-0.3l-0.1,0.1l-0.1,0.3v0.3l0.1,0.3h0.1h0.6
                        l0.3,0.1l0.5,0.5l0.1-0.3v-0.1v-0.5L708.8,832.7L708.8,832.7z M669.5,869.3l0.3,0.1l0.3,0.1h0.3l0.1-0.1v-0.3l0.1-0.6l-0.3-0.3h-0.6
                        l-0.3,0.3l0.1,0.3L669.5,869.3L669.5,869.3z M575.2,942.4l-0.5,0.1l-0.3,0.5v0.5l0.3,0.3h0.3h0.3l0.3-0.1l0.3-0.3l-0.1-0.5
                        L575.2,942.4z M554.6,953.3l-0.5-0.6h-0.3l-0.1,0.3v0.3l-0.3,0.1l0.1,0.1h0.3h0.1h0.3h0.3l0.1,0.1l0.3-0.1L554.6,953.3z
                         M557.3,953.3h-0.3l-0.1,0.3l0.1,0.3l0.3,0.3l0.3-0.1l0.1-0.3v-0.3L557.3,953.3z M555.1,956l-0.3-0.1h-0.3l-0.1,0.3l0.1,0.5l0.3,0.3
                        h0.3l0.3-0.3l0.1-0.5l-0.3-0.3L555.1,956L555.1,956z M548.3,961.7h-0.5l-0.3,0.3l0.1,0.3l0.7,0.3h0.3l0.3-0.3l-0.1-0.3L548.3,961.7z
                         M575,940l0.3,0.1l-0.1-0.3l-0.1-0.1l-0.1-0.1h-0.3v0.3L575,940z M671.5,887.2V887l-0.1-0.1l-0.3,0.1l-0.1,0.1l-0.1,0.6l0.3,0.1
                        l0.3-0.1l0.3-0.3v-0.3L671.5,887.2z M670.2,890.9l-0.1,0.3l-0.1,0.1l0,0l0.1,0.3l0.1,0.1l0.3-0.3V891h-0.3V890.9z M591.3,934
                        l-0.3-0.3h-0.3l0.3,0.6v-0.1l0,0h0.1L591.3,934z M707.7,795.6h-0.5H707l-0.1,0.3l0.3,0.3l0.3,0.1l0.3,0.3v-0.3V796v-0.1v-0.1
                        L707.7,795.6z M1063.3,938.3h-0.6l-0.6,0.1l-0.3,0.3l-0.3,0.3l-0.1,0.5v1l0.3-0.3l0.6-0.8l0.3-0.3l0.3-0.1h0.5l0.3-0.1l-0.3-0.3
                        L1063.3,938.3z M1061.8,917.7v-0.3l-0.3-0.3h-0.3l-0.1,0.3l0.1,0.5l0.3,0.3l0.3-0.3V917.7z M1066.5,956.4l-0.3,0.1l0.1,0.3l0.3,0.1
                        h0.1l0.1-0.3v-0.3L1066.5,956.4z M1088.9,863.6h-0.5l-0.3,0.3l0.3,0.1l0.3,0.3l0.1,0.3l0.1,0.3l-1-0.5l0.6,0.9l0.6,0.3l0.5-0.3
                        l0.3-1.2l-0.3-0.3L1088.9,863.6z M1087.9,878h-0.1l-0.3,0.1l0.1-0.3v-0.1l0,0l0.1-0.1v-0.3h-0.5l-0.3-0.1v-0.3l0.3-0.3v-0.3h-0.3
                        h-0.3l-0.3-0.1l-0.1-0.3l-0.3-0.3h-0.1h-0.3l0.8,1.9l0.6,1l0.6,0.5l-0.1-0.3v-0.3l0.3-0.3h0.3L1087.9,878L1087.9,878z M1085.6,842.8
                        L1085.6,842.8v0.5l0.1-0.3L1085.6,842.8z M1088,860.7l-0.1,0.3v0.5l0.1,0.5l0.3-0.3l0.3-0.3l0.1-0.3l-0.1-0.3L1088,860.7z
                         M1087.8,846.5l-0.1,0.3l0.5,0.5l-0.1-0.6L1087.8,846.5z M1086.6,844.8v-0.3l-0.3-0.1h-0.3v0.1L1086.6,844.8L1086.6,844.8z
                         M1088.1,862.3L1088.1,862.3l-0.1,0.3v0.3v0.1h0.1h0.3l0.1,0.1l0.3,0.1h0.3h0.1l0.1-0.1l-0.1-0.3l-0.3-0.3L1088.1,862.3
                        L1088.1,862.3z M1088.6,850.5l0.1,0.5L1088.6,850.5L1088.6,850.5z M1007.6,602.8l-0.3-0.6l-0.6-0.3l-0.5-0.3l-0.3-0.3l-0.8,0.9v1.4
                        l0.6,1.3l1.2,0.6h0.6l0.3-0.1l0.1-0.3v-0.9v-0.8L1007.6,602.8z M1019,660.5l-0.8-0.3l-0.7-0.5l-0.7-0.5l-0.5,0.1l-0.3,0.5l0.1,0.6
                        l0.9,1.4l0.3,0.8l0.5,0.3l0.6,0.3h0.5l0.3-0.3l0.7-1l0.3-0.5l-0.5-0.7L1019,660.5z M1009.8,625.5l-0.8,0.7l-0.3,1.2l0.6,0.9h0.8
                        l0.8-0.7l0.5-1.2l-0.6-0.8L1009.8,625.5z M1003.1,614.9l-0.3,0.5l-0.3,0.3l-0.1,0.3l-0.3,1.3v0.5l0.5,0.7l0.5-0.5l0.3-1l0.1-1v0.1
                        v-0.1v-0.1V615L1003.1,614.9z M1003.3,615.2L1003.3,615.2L1003.3,615.2L1003.3,615.2z M1016.6,683.5l0.6,0.3l-0.5-1L1016.6,683.5z
                         M1003.2,641.9L1003.2,641.9L1003.2,641.9L1003.2,641.9z M1012.6,633.3l-0.3-0.3h-0.5l-0.3,0.6v0.6l0.3,0.3l0.5,0.1l0.3-0.1l0.3-0.3
                        v-0.3l-0.3-0.5L1012.6,633.3L1012.6,633.3z M999.2,621.2l-0.5-0.1l-0.3,0.1l-0.1,0.6v0.1v0.3v0.3l-0.3,0.3v0.3l0.3,0.1l0.3-0.1
                        l0.5-0.6l0.3-0.1l0.3-0.3l-0.1-0.6L999.2,621.2z M1002.2,611l0.3,0.5l0.5-0.3l-0.3-0.3L1002.2,611z M1003.2,612.8h-0.1l-0.1,0.1
                        l0.1,0.1L1003.2,612.8z M1000.7,617.6L1000.7,617.6l-0.1,0.1v0.1l-0.3,0.3v0.3l0.3-0.1l0.3,0.1l0.3-0.3l-0.3-0.3L1000.7,617.6z
                         M1014.4,659.8l-0.1,0.1l0.1,0.5l0.3,0.3h0.3l-0.3-0.6L1014.4,659.8z M706.8,664.4l0.3-0.3l-0.3-0.1h-0.1l-0.1,0.1h-0.3l-0.1,0.3
                        l0.1,0.1h0.5L706.8,664.4L706.8,664.4z M706.7,667.5l0.1-0.1l0.1-0.3l-0.3,0.1L706.7,667.5z M718.7,668.4l-0.3,0.1v0.3l0.3-0.1
                        V668.4z M691.9,671.2h-0.3v0.1l0.1,0.1L691.9,671.2z M723.9,675l0.3,0.3l0.1-0.1l-0.1-0.3l-0.3-0.3l-0.3-0.3l0.1,0.3h0.1v0.1
                        L723.9,675L723.9,675z M723.4,676.6v-0.3l-0.3-0.1l-0.1,0.3l0.3,0.3L723.4,676.6L723.4,676.6z M696.1,678.3L696.1,678.3l0.5,0.3
                        v-0.1l-0.3-0.3L696.1,678.3z M698,679.6l0.3,0.1h0.1v-0.5h-0.1L698,679.6z M724.2,680.1l0.1-0.1v-0.1v-0.1h-0.3H724v0.7L724.2,680.1
                        L724.2,680.1z M742.7,686.5h0.1v-0.1l0.1-0.1l0.1-0.3v-0.1h-0.3v-0.1l-0.3-0.3l-0.1-0.1l-0.1,0.3l0.1,0.5h0.1v0.1L742.7,686.5z
                         M731.6,692.9L731.6,692.9L731.6,692.9l-0.3-0.3l-0.3,0.1l-0.1,0.3v0.3v0.1v0.3h0.1l0.3-0.3l0.3,0.6v-0.3v-0.1l-0.1-0.3V692.9z
                         M683.8,697.8l0.3-0.6h-0.3h-0.3l-0.1,0.3l-0.3,0.1l0.1,0.1h0.3L683.8,697.8z M682.1,698.9h-0.3v0.1l0.1,0.1v0.3l-0.1,0.1l0.1,0.3
                        l0.1-0.1h0.1l-0.1-0.3l0.1-0.5L682.1,698.9z M772,715L772,715l-0.3,0.6l0.3,0.5l-0.1-0.6V715z M735.5,721h-0.1l-0.1,0.3v0.1l0.1,0.1
                        l0.1-0.1V721z M714.5,726.5h-0.3v0.1v0.1v0.1v0.1h-0.1l-0.1,0.3v0.3l0.3-0.1l0.3-0.1l-0.1-0.1v-0.1L714.5,726.5z M1065.3,235.3
                        l0.3-0.5l-0.3-0.3l-0.3,0.1l-0.3,0.1l-0.3,0.1l0.1,0.5L1065.3,235.3z M1062.2,234.9l-0.1,0.3l-0.1,0.1l-0.3,0.3v0.3h0.3l0.6-0.3
                        l0.3-0.6l-0.3-0.3v-0.1L1062.2,234.9z M1010.7,440.5l0.3-0.1l-0.3-0.3h-0.3l-0.3,0.3v0.1v0.1l0.3,0.3l0,0v-0.2l0.1-0.3L1010.7,440.5
                        L1010.7,440.5z M1071.6,453.5h-0.1l-0.1-0.1v-0.3l0.1-0.1l0.1-0.3v-0.3l-0.1-0.1l-0.3,0.1l-0.3,0.1l-0.3,0.3l0.1,0.3l0.1,0.1
                        l-0.1,0.1v0.3l0.1,0.1l0.3,0.5l0.3,0.1l0.1-0.3l0.1-0.3L1071.6,453.5L1071.6,453.5z M1000.9,468.8L1000.9,468.8l0.5-0.3l0.3-0.1
                        l0.1-0.3l0.3-0.5l0.1-0.3v-0.3v-0.3h-0.3v0.1l-0.3,0.1l-0.1,0.3l-0.1,0.3l-0.1,0.1v0.1l-0.3,0.1v0.3v0.3L1000.9,468.8L1000.9,468.8
                        L1000.9,468.8L1000.9,468.8L1000.9,468.8z M1056.6,472.4l-0.1,0.3l-0.1,0.1l0.3,0.3h0.1l0.1-0.5v-0.3L1056.6,472.4z M1070.1,473.8
                        l-0.3-0.1l-0.3-0.1l-0.1-0.1l-0.1,0.1l-0.3,0.3l0.3,0.7l0.5,0.5l0.3-0.3v-0.1v-0.3l0.1-0.3L1070.1,473.8z M1065.4,473.6l-0.3,0.3
                        v0.1l-0.1,0.3l0.1,0.3l0.5-0.3l-0.1-0.3V473.6z M1067.7,475.8l-0.3-0.1l-0.1-0.3l-0.1-0.3l-0.1-0.3v-0.1l-0.3-0.3l-0.1,0.1h-0.1v0.1
                        l-0.1,0.3v0.1h0.1l0.1,0.1l0.3,0.3l0.3,0.3h0.3l0.3,0.1l0,0V475.8L1067.7,475.8L1067.7,475.8z M999.4,592.6l-0.3,0.1v0.1l0.3,0.1
                        V592.6z M863.6,605.4L863.6,605.4h-0.3l-0.1,0.1l-0.3,0.1l-0.3,0.1h0.1v0.1l0.3,0.1l0.3,0.1l0.3,0.1l0.1,0.1h0.1l0.1-0.3V606v-0.1
                        v-0.3l-0.3,0.1h-0.1v0.1v-0.3L863.6,605.4L863.6,605.4z M864.9,606.4l0.3-0.3v-0.3l-0.3-0.3h-0.1h-0.1l-0.1,0.1v0.3l0.1,0.3l0.3,0.3
                        C864.9,606.6,864.9,606.4,864.9,606.4z M861.3,606.5v0.3v0.1l0.3,0.1l0.3-0.3l0.1,0.1h0.1v0.1l-0.1,0.1l-0.1,0.1l0.3-0.1l0.3-0.1
                        l0.1-0.1v-0.3l-0.1-0.1v-0.1v-0.3l-0.1-0.1l-0.1,0.1v0.1h-0.1v-0.1H862v0.1l-0.1-0.1l-0.1-0.1h-0.1v0.3l-0.1,0.1L861.3,606.5z
                         M768.3,611.7L768.3,611.7v-0.3h-0.1h-0.1l-0.3-0.3v0.8L768.3,611.7z M772.1,611.9l-0.1-0.3v-0.3l-0.3,0.3l0.1,0.5L772.1,611.9z
                         M848.5,612.2v-0.3l-0.1-0.3l-0.3,0.3v0.3l0.3,0.6L848.5,612.2z M849.8,614.5l-0.1-0.3l-0.3,0.3v0.3l0,0L849.8,614.5z M841.1,614.9
                        l0.3-0.3v-0.1h-0.3l-0.1-0.1h-0.1v0.1l0.1,0.3L841.1,614.9z M838.1,615.1l-0.2,0.1l-0.3-0.1l0.3,0.3v0.3l0.1,0.1l0.1,0.3l0.1-0.3
                        l0.1-0.1l0.1-0.1v-0.1h-0.1v-0.3H838.1z M849.2,615.3l-0.1,0.3l-0.1,0.6l0.3-0.3h0.1v-0.3v-0.3l-0.1-0.1
                        C849.2,615.1,849.2,615.3,849.2,615.3z M834.7,615.8L834.7,615.8h0.1v-0.1l-0.3-0.1h-0.3v0.1H834l0,0h-0.1v-0.1l-0.3,0.3l0.3,0.3
                        l0.3,0.3l0.1,0.1h0.3l0.1-0.1v-0.3h-0.1h-0.1h0.1h-0.1v-0.3L834.7,615.8z M840.5,615.4l0.1,0.3l0.1,0.3v0.3v0.3h0.1l0.3-0.3l0.3-0.3
                        h0.3v-0.1l0.3-0.1v-0.1l-0.1-0.3h-0.1l-0.3-0.1l-0.1,0.1l-0.3,0.1l0,0h-0.1l-0.1-0.1L840.5,615.4z M755.5,617.3l0.1-0.3l0.3-0.1
                        l0.1-0.1l0.3-0.3l-0.1-0.1h-0.1v-0.1l-0.3-0.1l0.1,0.3l-0.3,0.1l-0.3,0.3l-0.5,0.1l0.3,0.5L755.5,617.3z M835.6,617l0.3-0.3v-0.1
                        h-0.3l-0.3,0.3l0.3,0.3l0.3-0.1H835.6z M831.5,617.6h0.3h0.3l-0.1-0.3l-0.4-0.2h-0.3l-0.1,0.1l0.1,0.3h0.1L831.5,617.6z
                         M802.2,618.2l-0.3-0.1l-0.3,0.1v0.3v0.1l-0.3,0.3l-0.1,0.1l0.1,0.1h0.3l0.3,0.1h0.1h0.3v-0.1l0.1-0.3L802.2,618.2z M837.9,618.1
                        l0.1,0.3l0.1,0.3l0.1,0.1l0.3-0.3l-0.3-0.3L837.9,618.1L837.9,618.1z M878.2,619.2L878.2,619.2l0.3,0.1l0.5-0.1v-0.1h-0.3
                        L878.2,619.2z M877.7,619.4l-0.3,0.3l-0.1-0.1v0.1v0.3l0.3,0.1l0,0l0.1-0.1l0.1-0.1h0.1v-0.1l0.1-0.1v-0.1H877.7z M836.6,620.2v0.3
                        v0.1l0.1-0.1l0.3-0.3l0.3-0.1v-0.1h0.5v-0.3l0,0l0.1-0.1v-0.1l-0.3,0.1l-0.3,0.1l-0.1-0.5h-0.3v0.3l0.1,0.1l-0.1,0.1L836.6,620.2z
                         M733.7,620.7l-0.1,0.3l0.3-0.3L733.7,620.7z M823.4,620.9h-0.3l-0.3,0.1l0,0v0.3l0.5-0.1L823.4,620.9z M808.8,622.3l-0.3,0.3
                        l-0.5,0.3v0.3v0.3l0.3-0.1h0.1l0.1,0.1l0,0l0.3-0.1h0.1v-0.1l0.3-0.3l-0.1-0.3L808.8,622.3z M826.5,623l0.1-0.1l-0.1-0.1v-0.1
                        l-0.1-0.1h-0.1l-0.1,0.1v0.1L826.5,623L826.5,623z M797.8,622.5v0.3h0.3l0.1,0.1l0.3-0.3l-0.1-0.3l-0.3-0.1L797.8,622.5z
                         M812.6,623.5l-0.6-0.5l-0.3,0.7l0.3,0.3L812.6,623.5z M827.9,623.1h-0.3h-0.3l0.3,0.3l0.3-0.1L827.9,623.1z M871.8,623.3v0.3
                        l-0.1,0.1l-0.1,0.1v0.3l0.1,0.3l0,0h0.1l0.1-0.1l0.1-0.5L871.8,623.3L871.8,623.3z M801.1,623.6l-0.5-0.3l-0.3,0.1v0.6l0.1,0.3
                        l0.3,0.1l0.6-0.5l-0.1-0.5L801.1,623.6z M834.1,624.7l-0.3,0.1l0.3,0.3l0.3-0.3h-0.1L834.1,624.7z M753.5,626l0.3,0.1l0.1,0.1v-0.5
                        v-0.1h-0.1l-0.3-0.1l-0.3-0.1l0.1,0.5L753.5,626z M804.8,627.8l0.1-0.5l-0.1-0.5l-0.1,0.1l-0.1,0.3l-0.1,0.3v0.3H804.8z
                         M780.5,628.6v0.3l-0.3,0.3l-0.1,0.1h0.1l0.3,0.3l0.1,0.1l0.1,0.3l0.3,0.1l0.1,0.3l0.3-0.3l-0.3-0.3l-0.3-0.3V629L780.5,628.6
                        l0.1-0.3L780.5,628.6z M800.9,628.7l0.3,0.3l0.5,0.1V629l-0.1-0.3l-0.1-0.3l-0.3-0.1L800.9,628.7z M796.8,629.5l0.1,0.1h0.3v-0.1
                        l-0.3-0.3L796.8,629.5z M751.6,629.6l-0.1-0.3l-0.1,0.3H751.6L751.6,629.6z M829.2,629.3h-0.1l-0.3,0.3l0.1,0.3l0.3,0.1h0.1l0.1-0.1
                        h0.1l-0.1-0.3v-0.3H829.2z M805.7,629.9l-0.3-0.1l-0.5,0.1l-0.1,0.1v0.3l0.1,0.1l-0.1,0.3v0.1l0.1,0.3l0.1-0.3l0.3-0.3l0.1-0.1
                        l0.1-0.3L805.7,629.9z M803.7,630.7L803.7,630.7h0.1h0.3v-0.1l0.3-0.1l0.1-0.3l0.3-0.3h-0.1h-0.1h-0.1h-0.1l-0.3,0.1l-0.1,0.1v0.3
                        h-0.1V630.7z M783.7,631.1l-0.3,0.3v0.3l0.3,0.3h0.1v0.3l0.1-0.1l0.3-0.1h0.1l0.3-0.5l0.3-0.1l0.1-0.3l0.3-0.3h0.3v-0.1l-0.3-0.3
                        h-0.1l-0.1-0.3L785,630l-0.1,0.3v0.1l-0.1,0.1l-0.3,0.1l0.1,0.1l0.1,0.3v0.1l-0.3-0.1h-0.3v0.3H784l-0.1-0.1L783.7,631.1l0.1-0.1
                        L783.7,631.1z M756,630.4l-0.1-0.3l-0.1,0.5h0.1L756,630.4z M808.8,630.5l-0.1-0.1l-0.1,0.3l-0.1,0.5l0.1,0.1l0.3-0.3h0.1h0.1v-0.1
                        v-0.3L808.8,630.5z M799.1,631.1v0.1h0.1l0.3,0.3l0,0v-0.5l-0.1-0.3h-0.3L799.1,631.1z M805.5,631.9L805.5,631.9h-0.3l-0.1,0.1h-0.3
                        h-0.1l-0.1,0.1v0.1l0.3,0.1h0.2l0.6-0.3V631.9z M809.4,632.3h-0.3l-0.1,0.3l-0.1,0.3h-0.1h-0.3h-0.1l-0.3,0.1l-0.1,0.3l0.3-0.3
                        l0.1,0.1v0.5v0.3v0.1l0.1,0.1h0.1l0.3-0.1l0.3,0.1h0.1V634l-0.3-0.1v-0.1l-0.1-0.3l0.1-0.5l0.3-0.1v-0.5l0.1-0.1l0.1-0.3h-0.3h-0.1
                        L809.4,632.3z M745,633.1l0.3,0.1l-0.1-0.3l-0.1-0.1v-0.3h-0.3l0.1,0.3L745,633.1z M791.3,634.2l-0.1-0.3v-0.3l-0.1-0.1l-0.3,0.3
                        l0.1,0.3l0.1,0.3L791.3,634.2z M789.8,634.8v-0.3l0,0v-0.1h-0.1v0.3h-0.1h-0.3l0.1,0.3l0.6,0.1v-0.3H789.8z M871.7,634.8
                        L871.7,634.8l-0.1,0.1v0.3l0.1-0.1l0.1-0.1l0.1-0.1v-0.3h-0.1L871.7,634.8z M804.5,634.8h0.1l0.1,0.3l0.1-0.3l-0.3-0.3L804.5,634.8z
                         M741.2,638.1h0.1h0.3v-0.1l-0.3-0.3h-0.3v0.5L741.2,638.1z M793,639.3l0.1,0.3l0.7-0.5l-0.3-0.5l0.1-0.3v-0.1l-0.1-0.1l0.3-0.3
                        h-0.1v0.1l-0.1,0.1l-0.1,0.1l-0.1,0.1v0.3l0.1,0.1l-0.1,0.3L793,639.3z M719.8,638.8h0.3v-0.1l0.1-0.1l-0.1-0.1l-0.1-0.1l-0.3,0.1
                        v0.3L719.8,638.8z M803.2,638.8l-0.1,0.3h0.3h0.3h0.1v-0.1h-0.1L803.2,638.8L803.2,638.8z M739.7,642.9l-0.3-0.6l-0.1,0.6l-0.1,0.3
                        l0.3,0.3L739.7,642.9z M726.4,644l0.3-0.1l0,0v-0.1l0,0h-0.1v-0.1v-0.1v-0.3h-0.3v0.3v0.1l-0.1,0.1v0.1v0.1v0.1h0.3
                        C726.4,644.1,726.4,644,726.4,644z M723.4,644.8L723.4,644.8l0.1-0.1l0.1-0.1l0.1-0.1l-0.3-0.3l-0.3,0.1l-0.1-0.1H723v0.3l0.1,0.3
                        L723.4,644.8L723.4,644.8z M726.9,645.5l0.3-0.3V645l-0.3-0.3h-0.3l-0.1,0.1v0.3L726.9,645.5L726.9,645.5z M729.5,646l0.1,0.3
                        l0.3-0.3v-0.5l-0.3,0.3h0.1L729.5,646z M722.5,648.5l-0.3-0.1l0.3,0.5V648.5z M716.6,649.4l0.1-0.1h0.1h0.1h0.1v-0.1V649h0.3
                        l-0.1-0.1l-0.3-0.1v-0.1h-0.1v0.1l-0.3,0.3l-0.3,0.1v0.5h0.3L716.6,649.4L716.6,649.4z M721.2,650.3l-0.1-0.6v0.1v0.1l0,0l-0.1,0.1
                        L721.2,650.3z M799.2,651.2l0.1-0.6l-0.3,0.3L799.2,651.2z M799.7,651.7l0.1-0.1l-0.1-0.3h-0.3l-0.3,0.1l0.3,0.3H799.7z
                         M787.4,654.8L787.4,654.8l0.3,0.3l0.3-0.1v-0.1h-0.3L787.4,654.8L787.4,654.8z M802.9,655.4l-0.1,0.1h0.3l0.1-0.3l0.1-0.3l-0.1-0.1
                        l-0.1-0.1v0.3v0.1L802.9,655.4z M800.2,656.9L800.2,656.9l-0.1,0.3l0,0l-0.3,0.1l-0.3,0.1l-0.3-0.1l-0.1,0.1h0.3l0.1,0.1v0.1v0.1
                        v0.1l0.1,0.1l0.1-0.1l-0.1-0.3v-0.1v-0.1l0.1-0.1l0.1-0.1l0.3-0.1L800.2,656.9L800.2,656.9z M704.8,658.9l0.3,0.1l0.1-1l0.1-0.1
                        l-0.1-0.1v-0.1l-0.3-0.3l-0.3-0.3v0.5v0.8l0.1,0.1v0.1V658.9z M702,657.3l-0.1-0.3l-0.3,0.1v0.5h0.3L702,657.3z M718.6,658.2v-0.3
                        h-0.3l-0.1,0.1l-0.1,0.3v0.1l0.3,0.3v0.1l-0.3,0.3v0.1l0.3-0.3v-0.3l-0.1-0.3L718.6,658.2L718.6,658.2z M798.2,659.1v-0.3l-0.3,0.1
                        h-0.2l-0.1-0.1l0.1-0.3l0,0l0,0v-0.3l-0.1-0.1l-0.1,0.1h-0.2h-0.1h-0.2l-0.1-0.1l-0.1,0.1l0.1,0.3h0.5l0.1,0.1v0.3v0.1l0.3,0.1
                        l0.5,0.3l0,0l-0.3-0.1L798.2,659.1z M698.4,658.7l-0.1-0.3l-0.1,0.1v0.1H698.4L698.4,658.7z M788.7,658.8l0.3-0.3v-0.1l-0.3,0.1
                        V658.8z M717,659.8h0.3v-0.5l-0.1-0.3h-0.3h-0.3l-0.1,0.1h-0.3h-0.1h-0.3l-0.1,0.1l0.3,0.1h0.3l0.3,0.3L717,659.8z M721.2,659.6
                        h-0.3v0.1v0.1l0.3,0.1V659.6z M801.4,660.5l-0.3,0.3l0.1,0.1L801.4,660.5l0.3,0.1L801.4,660.5z M789.2,661.1L789.2,661.1l0.3-0.3
                        l-0.3-0.3l-0.1,0.1L789.2,661.1L789.2,661.1z M798.6,661l0.3-0.3h-0.5L798.6,661z M711.2,664.2l0.1,0.1l0.3,0.1v-0.8l-0.3,0.1
                        L711.2,664.2z M708.9,663.9l-0.1-0.1l-0.3,0.3v-0.3l-0.1,0.1l-0.3,0.3l-0.1,0.3l-0.1,0.3v0.1h0.3h0.1l0,0l-0.1,0.1l0.1,0.1l0.3-0.1
                        l0.1-0.1l0.1-0.3l-0.1-0.1L708.9,663.9L708.9,663.9z M786.7,664.8v0.3l0.1,0.1h0.1h0.1l0.3-0.3l0.5-0.3l-0.3-0.1h-0.3l0,0l0.1-0.3
                        l0.1-0.3l0.1-0.1h-0.2h-0.3l-0.1,0.1l-0.1,0.1l-0.1,0.3l-0.1,0.3V664.8L786.7,664.8L786.7,664.8z M791.5,665.7v-0.3l-0.3,0.3
                        L791,666h0.1l0.1,0.3l0.3-0.3l0.1-0.1v-0.1v-0.1L791.5,665.7L791.5,665.7z M802.1,666.5L802.1,666.5l0.3,0.1l0.3-0.1l-0.1-0.3
                        L802.1,666.5z M719.6,667v-0.3l-0.3-0.1l-0.1-0.1h-0.1h-0.1l0,0l0,0v0.1l-0.1-0.1v0.1l0,0l-0.1-0.1v-0.3l0,0h-0.1l0,0v0.3l0.3,0.7
                        l0.5,0.3L719.6,667z M699.7,667.9l0.1-0.5l-0.1-0.1l-0.1-0.1h-0.3l-0.1,0.1v0.3l0.1,0.1L699.7,667.9z M803.3,671.7l0.3-0.1h0.1
                        l0.1-0.1l0.1-0.1l-0.5-0.1L803.3,671.7z M700.6,673l-0.3,0.3v0.3l0.1-0.1l0.3,0.1h0.1v0.1h0.1v-0.1v-0.1l0.1-0.3l0.3,0.1l0.3-0.1
                        V673v-0.3v-0.3l-0.1-0.3l-0.1-0.3l-0.3-0.1l-0.1,0.1l-0.1,0.3v0.5l-0.1,0.3L700.6,673L700.6,673z M786.8,672.2h-0.3v0.3h0.3l0.3-0.1
                        L786.8,672.2z M803.5,673.5v0.3l0,0l0.1-0.1l0.1-0.1l0,0H803.5z M689.6,674.2v-0.3l0.3-0.1l-0.3-0.3l-0.3,0.3l-0.1,0.5l0.3,0.3
                        L689.6,674.2z M787,674L787,674l-0.1,0.1v0.3l0.3,0.1v-0.1v-0.1L787,674L787,674z M784.1,676.1l-0.3-0.1l-0.1,0.1l-0.1,0.1h0.1l0,0
                        v0.1l0.1,0.1v0.1h0.3h0.3h-0.1v0.1l0,0l0.1-0.3l0.3-0.3L784.1,676.1L784.1,676.1z M744.8,679.3l0.3-0.1l0.3-0.5v-0.5h-0.3h-0.3
                        l-0.3,0.1l-0.1,0.3l0.1,0.1v0.1v0.1v0.1h0.1h0.1v0.3l0,0h-0.1C744.8,679.4,744.8,679.3,744.8,679.3z M740,686.5L740,686.5h-0.1l0,0
                        l0,0l-0.1,0.3h-0.3l-0.1,0.3l0.3,0.3h0.1l0,0l0,0h-0.3v0.3h0.1l0,0l0.3-0.3l0.5-0.1l-0.3-0.1v-0.1l-0.3-0.1h-0.1v-0.1L740,686.5
                        L740,686.5z M735.5,690.3l-0.1,0.3l-0.1,0.3v0.1l-0.1,0.1l0.1,0.3h0.1l0.1,0.1l0.3-0.3v-0.3l0.1-0.5l0.1-0.3l0.1-0.1v-0.3l-0.3,0.3
                        L735.5,690.3z M736.4,691l-0.1-0.3h-0.3v0.3v0.3l-0.1,0.3l0.3,0.5l0.1-0.3v0.3v0.3l0.3-0.6h-0.1v-0.1v-0.1L736.4,691z M726,705.7
                        v-0.1l-0.1-0.1h-0.1l-0.3,0.1l-0.1,0.3l-0.1,0.3v0.3v0.3h0.1l0.3,0.3v-0.3v-0.1l-0.1-0.1v-0.1l0.1-0.1h0.1l0.3-0.1l-0.1-0.1
                        L726,705.7z M742.8,739.9l0.7,0.3l0.1-0.1l-0.1-0.3l-0.3-0.1l-0.3-0.3l-0.3,0.1l-0.3,0.1v0.1h-0.3l0.1,0.3l0.3-0.1L742.8,739.9z
                         M739.6,740l-0.3-0.1l-0.3,0.1l-0.3,0.1l-0.3,0.3l-0.3-0.1l-0.1,0.3l-0.1,0.3l0,0l0.3,0.1l0.3,0.1l0.1,0.1v-0.3h0.3l0.3-0.1h0.3
                        l0.3-0.5l-0.1-0.3h-0.3l0,0L739.6,740L739.6,740z M755.7,741.3l-0.3,0.3l-0.3,0.3v0.3l-0.1,0.3v0.3h0.1h0.3h0.3l0.3-0.8l-0.1-0.1
                        L755.7,741.3z M1018.1,357.9l0.3-0.3v-0.3h-0.1l-0.3-0.1l-0.3,0.1l-0.1,0.3l0.1,0.1l0.1,0.1L1018.1,357.9L1018.1,357.9z M764,602.7
                        h0.3l0.3-0.1l0.1-0.1v-0.3l-0.1-0.1h-0.1h-0.1v-0.1v-0.1l-0.1-0.1h-0.3l-0.3,0.3L764,602.7L764,602.7z M850.1,613.2h0.3l0.6-0.8
                        v-0.3h-0.1h-0.3l-0.3-0.3l-0.3,0.1l-0.5,0.3h-0.3l-0.3,0.1v0.1l0.1,0.1l0.3,0.1l0.6,0.3L850.1,613.2z M847.9,613.5l-0.6-0.7h-0.1
                        l-0.3-0.1v0.3l0.3,0.9l0.3,0.1h0.3h0.1l0.3-0.3v-0.1H848L847.9,613.5z M711.7,620l0.8-0.8V619l-0.3-0.1L712,619l-0.1,0.1h-0.3
                        l-0.3,0.1l-0.1,0.1v0.1L711.7,620L711.7,620z M825.2,619.9v-0.5l-0.3-0.3l-0.1,0.1l-0.1,0.1l-0.3,0.6v0.3v0.1v0.6h0.3l0.1-0.3
                        l-0.1-0.3v-0.3L825.2,619.9z M820.2,622.2h0.3l0.5,0.3l0.6-0.1l0.1,0.3h0.3l0.3-0.6l0.3-0.3l0.1-0.1h-0.3h-0.3H822l-0.1-0.1
                        l-0.1-0.3v-0.3l-0.1-0.1l-0.7,0.3l-0.3-0.1h-0.1l-0.1,0.3v0.3l-0.3,0.3L820.2,622.2z M813.8,622.8l-0.1,0.1l-0.5,0.1l-0.3,0.3
                        l-0.1,0.3v0.3l0.1,0.3l0.3,0.1l0.8-0.3l0.5-0.3l0.1-0.5l-0.3-0.3v-0.1l-0.1-0.1H814H813.8L813.8,622.8z M743,633.5l0.3-0.3l0.1-0.6
                        l-0.3-0.1l-0.5,0.1l-0.3,0.1l0.1,0.3L743,633.5z M788.1,636.9l-0.6,0.5l0.1,0.3l0.3,0.1l0.3-0.1l0.5-0.3l0.1-0.3l-0.3-0.3
                        L788.1,636.9z M779.5,639.4l0.3-0.3l0.1-0.3l-0.1-0.3h-0.1h-0.1h-0.1l-0.3,0.3l-0.3,0.1l-0.3,0.3v0.1l0.6,0.1L779.5,639.4z
                         M901.7,647.9h-0.8l-0.3,0.3v0.3h0.1h0.1l0.3,0.1l0.3,0.3h0.1l0.7-0.3l0.1-0.1l0.1-0.3l-0.1-0.1L901.7,647.9z M722.9,650.3l0.3-0.1
                        l0.1-0.1h0.1l0.1-0.1v-0.3l0.1-0.1h0.1l0.3,0.1h0.3v-0.1l-0.3-0.3l-0.3-0.3v-0.1v-0.1l0.1-0.1v-0.1v-0.1l-0.1-0.1l-0.5-0.3l-0.1,0.1
                        l-0.1,0.1l0.3,0.3v0.1l-0.5,0.8l-0.3,0.3l-0.1,0.3l0.3,0.3L722.9,650.3z M713.9,649.2L713.9,649.2l-0.3,0.1l-0.1,0.3v0.3v0.3
                        l-0.3,0.6l-0.1,1.2l0.1,0.5h0.5l0.3-0.1v-1l0.1-0.3v-0.3l-0.1-0.1v-0.4v-0.3v-0.3l0.1-0.3L713.9,649.2z M702.4,657.8L702.4,657.8
                        l0.1,0.3l0.1,0.1l0.3-0.1l0.1-0.1l0.5,0.1h0.5V658v-0.1l-0.1-0.1l-0.1-0.1v-0.1l0.1-0.1h0.1v-0.1l-0.3-0.1l-0.5,0.1h-0.1l-0.3-0.3
                        l-0.1,0.1l-0.1,0.3h-0.1l-0.1,0.1l-0.1,0.3l0.1,0.1L702.4,657.8z M717.8,663.5h-0.3v0.1v0.1l0.1,0.1h0.1v0.1l-0.3,0.1l-0.1,0.1H717
                        h-0.1l0.1,0.1v0.1l0.3,0.1h0.3l0.1-0.1l0.1-0.1l0.3-0.3l0.1-0.1l0.1-0.3v-0.1h0.6l0.1-0.1l0.5-0.3l0.1-0.3v-0.1l-0.1-0.1v-0.1
                        l0.1-0.1l0,0h-0.3l-0.3,0.1l-0.5-0.1l-0.1,0.1v0.1l-0.3,0.3l-0.5,0.8l-0.3,0.1L717.8,663.5z M744.2,679l-0.1,0.1v0.1v0.5v0.7
                        l0.1-0.1l0.5-0.6v-0.5l-0.3-0.3L744.2,679z M740.3,688.5l0.7-0.6l0.5-0.7V687h-0.3l-0.3-0.1h-0.3l-0.3,0.3l-0.1,0.5v0.3l-0.6,0.3
                        h-0.1l-0.1,0.1l0,0L740.3,688.5z M1139.3,247l1-0.3l-0.6-0.1h-1.4l-0.5-0.3l-0.5-0.3l-0.7-0.3l-0.7-0.1h-0.6l-0.1,0.3l2.4,0.9
                        L1139.3,247z M820.9,555.4l-0.1,1v1l0.6-0.6l0.7-0.9l0.3-0.9l-0.5-0.7l-0.8,0.3L820.9,555.4z M822.1,554.3l-0.8-0.5l-0.1,0.3
                        l0.1,0.3h0.8V554.3z M796.4,636.8l-0.5-0.3h-0.6l-0.3,0.3l-0.3,0.5l0.5-0.1l0.9,0.5l0.6,0.1l0.5-0.1v-0.1l-0.7-0.5L796.4,636.8z
                         M1154.5,255h-0.3l0,0H1154.5z M1178.8,271l-0.3,0.3l-0.1,0.6l0.3,0.3l0.5-0.3l0.3-0.5l0.3-0.3l1.2-0.3l0.3-0.3l-0.1-0.3l-0.5-0.5
                        l-0.9-0.7l-0.7-0.3l-2.5-0.5l3.8,1.9l-0.3,0.3L1178.8,271z M819.9,557.6l-0.6-0.3l-0.3,0.3v0.3l0.1,0.3l0.1,0.3l0.3,0.1h1h0.5
                        l-0.3-0.5L819.9,557.6z M737.5,751.8l-0.6-0.5l-0.8-0.1l-0.7-0.3h-0.3l0.1,0.3l0.1,0.3l0.1,0.3l0.1,0.1l0.5,0.3l0.1,0.1l0.1,0.3
                        l0.1,0.3h0.3l0.8-0.3v-0.3L737.5,751.8z M1049.2,859.1v0.5l0.3-0.5l-0.1-0.3L1049.2,859.1z M545.1,902.1h0.3l0.1-0.1v-0.1l-0.1-0.3
                        l-0.3,0.1V902.1z M545,901.7L545,901.7L545,901.7L545,901.7z M571.2,902.7L571.2,902.7L571.2,902.7L571.2,902.7L571.2,902.7z
                         M542.8,906v-0.1V906L542.8,906z M543.4,906.7L543.4,906.7L543.4,906.7L543.4,906.7z M540.9,906.7l-0.5,0.1l-0.1,0.3l0.5-0.1h0.5
                        L540.9,906.7L540.9,906.7z M541.6,907.3L541.6,907.3L541.6,907.3L541.6,907.3z M542.7,907.7v-0.3h-0.1L542.7,907.7z M542.9,907.8
                        h0.1l0,0l-0.1-0.3V907.8z M713.8,738.7l0.1-0.1l-0.1-0.1h-0.1L713.8,738.7z M1025,718.2L1025,718.2L1025,718.2L1025,718.2
                        L1025,718.2z M1025.1,718.3L1025.1,718.3L1025.1,718.3L1025.1,718.3z M1004.5,352.4l0.8-0.5l0.3-0.3l-0.1-0.3l-0.1-0.1h-0.5
                        l-0.3-0.1h-0.3l-0.1,0.3v0.3l0.1,0.6L1004.5,352.4z M1032.8,750.6l-0.3,0.1v0.3l0.1,0.3h0.3l0.3-0.3l-0.3-0.3L1032.8,750.6
                        L1032.8,750.6L1032.8,750.6z M729.4,739.2v-0.3l-0.3-0.3l-0.3-0.1l-0.3-0.1l-0.3,0.1l-0.3,0.3l-0.3,0.1l-0.1,0.1l0.3,0.3v0.1v0.1
                        l0.5,0.3h0.3l0.3-0.3L729.4,739.2z M768.8,900.9h-0.3v0.5l0.3,0.3l0.3,0.1h0.3l0.1-0.1l0.3-0.3l-0.3-0.3L768.8,900.9z M799.1,618.8
                        l-0.3-0.1l-0.5,0.3l-0.5,0.3l-0.3,0.5l-0.6,0.9v0.3l0.3,0.3l0.5-0.3l0.8-0.8l0.6-0.6v-0.1v-0.3V618.8z M814.5,622.2h0.6l0.7-0.1
                        l0.3-0.3l0.1-0.3l0.3-0.7l0.1-0.8l-0.1-0.3l-0.3,0.3l-0.3,0.5l-0.3,0.3h-0.3l-0.8,0.3h-0.1l-0.3,0.1l-0.1,0.5l0.3,0.5L814.5,622.2z
                         M807.3,631.1l0.5-0.3v-0.3v-0.1l0.1-0.1V630v-0.3v-0.3l-0.1-0.1l-0.1,0.3l-0.3,0.3l-0.3,0.1H807l-0.3,0.1l-0.3,0.3l-0.3,0.3v0.5
                        l0.3,0.3L807.3,631.1z M743.9,678l-0.3-0.3l-0.3-0.1l-0.3,0.1l-0.3,0.3l-0.1,0.1V678h-0.1l-0.5,0.7v0.3l0.3,0.3l0.1,0.3l-0.1,0.5
                        l0.1,0.5l0.3,0.3l0.3,0.1l-0.1-0.3l0.3-0.1l0.3-0.1l0.1-0.3l0.1-0.6V679l-0.3-0.3l0.1-0.3L743.9,678z M702.1,668l-0.1-0.3l-0.1-0.3
                        l-0.3-0.3l-0.6-0.3h-0.3v0.1l-0.1,0.1l-0.1,0.1v0.1l0.1,0.1v0.3l0.1,0.3l0.3,0.3v0.1h-0.1l-0.6-0.3H700v0.3l0.1,0.6v0.1l0.1,0.1
                        l0.1,0.3h0.1l0.5-0.1h0.3l0.3,0.3l0.1,0.1v0.3h0.3l0.1-0.3v-1.2v-0.1L702.1,668z M698,669.5l0.3,0.1l0.5,0.5l0.3,0.1l0.1,0.1
                        l0.1,0.3v0.3l-0.1,0.1l0.1,0.1h0.3l0.3,0.1l0.1,0.3h0.1l0.1-0.3V671l-0.1-0.1v-0.1l0.3-0.1l0.1-0.3l-0.1-0.8l-0.1-0.3l-0.1-0.1
                        l-0.1-0.1l-0.1,0.1v0.3l-0.1,0.1l-0.3-0.1l-0.1,0.1l0.1,0.5h-0.1l-0.5-0.5l-0.6-0.1l-0.3,0.3l0.1,0.3V669.5z M937.2,516.4l-0.3-0.3
                        l-0.5,0.1l-0.3,0.3l-0.3,0.1h-0.3l-0.3-0.3l-0.3-0.3l-0.3-0.1h-0.3l-0.3,0.1l-0.3,0.1h-0.3l-0.3,0.1l-0.3,0.1l-0.1-0.1l-0.1-0.3
                        l-0.3-0.1l-0.3,0.3l0.3,0.6l0.6,0.7l0.3,0.3h0.1l0.5-0.1h0.3l0.3-0.3l0.6-0.3h0.6l0.5-0.3l0.3-0.3v-0.3v-0.3L937.2,516.4z
                         M839.3,617l0.3-0.1l0.3-0.1l0.1-0.3v-0.5l-0.3-0.5h-0.3l-0.1,0.3l-0.3,0.5l-0.1,0.5l0.3,0.5h0.3L839.3,617L839.3,617z M810.4,623.5
                        h0.3l0.1,0.1v0.3h0.1l0.3-0.1l0.3-0.1l0.1-0.3l-0.3-0.5l-0.5-0.3l-0.3-0.1l-0.6-0.1l-0.5,0.1l-0.3,0.3l0.3,0.3L810.4,623.5z
                         M805.7,673.5l-0.1-0.1l-0.1-0.1l-0.3-0.1l-0.1,0.3l-0.1,0.5v0.5l0.1,0.5l0.3,0.1l0.5-0.3l0.3-0.3v-0.3l-0.1-0.3L805.7,673.5z
                         M716,648.1h0.3h0.1l0.1-0.1l0.3-0.1l0.3,0.1l0.5,0.1l0.3-0.3l0.3-0.3l-0.1-0.3l-0.5,0.1v-0.3l-0.1-0.3h-0.3l-0.5,0.3l-0.6,0.6
                        L716,648.1z M818,556.8l0.3,0.1l0.3-0.3l-0.3-0.7l-0.1-0.3l0.3-0.3h0.3h0.1v0.3v0.3l0.1,0.1l0.3,0.1l0.3,0.1h0.3l0.3-0.3v-0.3
                        l-0.1-0.3v-0.3l0.3-0.7l0.5-0.1l0.5-0.1l0.1-0.3l-0.1-0.3h-0.3l-0.5,0.1l-0.6-0.3l-0.7,0.7l-1.3,1l-0.6,0.7l0.5,0.5L818,556.8z
                         M724.5,706.6l-0.3-0.6l-0.3,0.7l-0.3,0.7l-0.5,0.6l-0.7,0.3l-0.5,0.3l-0.3,0.6l-0.6,1.4l-0.3,0.3v0.5l0.3,0.3l0.5,0.1l0.7-0.1
                        l0.3-0.3l0.3-1.2l1-1.8l0.3-0.3l0.3-0.3v-0.6L724.5,706.6z M795.9,631.1l-0.7,0.3l-0.5,0.8l0.3,0.8l0.5,0.8l0.3,0.7l0.3-0.3l0.1-0.1
                        l0.1-0.1l0.3,0.3l0.3-0.1l0.5,0.3h0.3l0.1-0.3l0.1-0.3l0.3-0.3l0.5,0.3l0.3-0.3l0.3,0.3v0.3v0.3l0.1,0.3l0.3,0.1h0.7l0.3,0.1
                        l0.1-0.3l0.1-0.3v-0.8l0.1-0.3l0.1-0.1l0.7-0.3l0.3,0.1h0.3l0.6-0.8l0.3-0.3h-0.5L802,632l-0.3,0.1l-0.3,0.1l-0.1,0.3l-0.3,0.3h-0.1
                        l-0.5-0.1h-0.3l-0.6,0.5l-0.3,0.3h-0.5l-0.8-1.2l-0.6-0.3l-0.8-0.3L795.9,631.1z M803.1,625.9l-0.6,0.6l0.7,0.3h1.6l0.7,0.3l0.5-0.1
                        l0.3-0.8l-0.1-0.7l-0.8,0.3l-0.1-0.5v-0.5l-0.1-0.5L805,624h0.3l0.1-0.1v-0.1l0.1-0.1l-0.3-0.3h-0.3l-0.3,0.1l-0.3,0.3l-0.3,0.3
                        l0.3,0.9l-0.3,0.6L803.1,625.9z M818.1,621.5l-0.5,0.1l-0.3,0.1l-0.3,0.7l0.3,0.3l1.2-0.3l0.9-0.3l0.5-0.6l0.1-0.7l-0.3-1l-0.5-0.8
                        l-0.6,0.1l-0.6,0.7l-0.6,0.7h0.3l0.3,0.1l0.1,0.3v0.3L818.1,621.5z M721.8,639v0.3l0.1,0.5l0.3,0.3l0.3,0.1l0.3-0.3l0.3-0.8l0.5-0.3
                        l0.7-0.3l0.5-0.5v-0.5l-0.7-0.3v-0.3h0.1l0.3-0.1h0.1l-0.1-0.3l-0.3-0.3l-0.3-0.1l-0.3-0.1l0.1-0.3v-0.3v-0.5l-0.3-0.5l-1.9-0.6v0.3
                        v0.3l-0.3,0.3l-0.1,0.3v0.6v0.3L721,637v0.3l0.3,0.3v0.3H721h-0.3l-0.3,0.1v0.3l0.3,0.3L721.8,639z M718.1,651.4l-0.5-0.6l-0.3,0.1
                        L717,651v0.3l0.3,0.1l0.1,0.1v0.1l0.1,0.1l-1.9,0.8l-0.9,0.8v1.2l-0.9,1.2l-0.1,0.6l0.3,0.7h-0.7l-0.3,0.1l-0.3,0.1v0.3l0.1,0.3
                        l0.3,0.3l0.1,0.1l-0.3,0.3l-0.5,0.1l-0.5,0.1l-0.3,0.1l1.5,0.3l1.6-0.8l1.2-1.4v-1.6l0.5-0.1l0.5-0.3l0.3-0.3l-0.1-0.5l0.5-0.6
                        l0.5-0.8L718.1,651.4z M706.4,665.7l0.3-0.8l-0.6-0.1l-1.7,0.5l-0.3-0.3l0.1-1l0.1-0.5l0.1-0.5l0.6-1v-0.3l-0.1-0.3l-0.3-0.5
                        l-0.1-0.3l0.1-0.3l0.3-0.3v-0.3l-0.3-0.3l-0.3,1.4v1.2l-0.5,0.8l-0.1,0.3v0.7l-0.3,0.6l-0.1-0.3l-0.3-0.3l-0.1-0.3l-0.1,0.7
                        l-0.1,0.9l-0.3,0.6l-0.7-0.3l-0.5,0.5l-0.3,0.1l-0.3,0.1v0.3l1,0.3l0.3,0.1l0.6,0.9h0.1l-0.3,1.5v0.8l0.3,0.6l0.3,0.3l0.1-0.3v-0.5
                        v-0.3l0.3-0.3l0.3-0.1l0.1-0.1l0.3-0.3v-0.3V668v-0.3v-0.3l0.3-0.9l0.8,0.3l0.7-0.3L706.4,665.7z M1057.5,205.6l0.9,0.8l1.6,1
                        l0.5,0.1l0.5-0.1l1-0.8l0.3-0.3l0.3-0.6l0.3-0.3l0.3-0.5l-0.3-0.6l-1-1.4l-0.7-0.8l-0.9-0.7l-0.9-0.3l-0.7,0.3l-0.3,0.3l-1,1.3
                        l0.1,0.3l0.1,0.5l0.1,0.3l-0.5,0.8L1057.5,205.6z M1053.1,194.3l-0.3,1.9l0.1,0.9l0.3,0.9l0.8,1.5l-0.3,0.3v0.3l0.3,0.6l0.5-1.2
                        l0.3-1.2l0.5-4.3l-0.1-0.8l-0.5-0.3l-0.5,0.3l-0.4,0.3h-0.3l-0.3-0.8l-0.1-0.3l-0.1-0.1l-0.1-0.1h-0.3l-0.3,0.3l0.9,1.4
                        L1053.1,194.3z M1006.9,327.5l0.1,0.3v0.8l0.1,0.3l0.1,0.3l-0.1,0.5l0.3,0.5l0.3,0.3l0.3,0.1l1.2-1l0.5-0.8l0.1-0.9V327l0.3-1
                        l0.9-1.5l0.3-0.8l-0.5-0.5l-0.3,0.1l-0.8,0.6l-0.3,0.1h-0.3l-0.7,0.3h-0.3l-0.5,0.3l-0.3,0.6l-0.3,0.7l-0.1,0.7l0.1,0.3
                        L1006.9,327.5z M734.5,694l-0.1,0.6l0.3,0.5l0.5,0.3l0.6-0.1l0.3-0.3l0.5-1.4l0.1-0.5l-0.3-0.7l-0.3-0.3h-0.8l-0.6-0.3h-0.3L734,692
                        v0.5l0.1,0.6l0.3,0.6L734.5,694z M767.2,903.4h-0.3l-0.1,0.1l-0.5,0.6l-0.3,0.5v0.3l0.6,0.3l0.3,0.1h0.3l0.1-0.3v-0.3l0.1-0.3
                        l0.3-0.3l0.3-0.1l-0.7-0.6L767.2,903.4z M852.6,612.6l0.3,0.5h0.5l0.6-0.1h0.6l0.6,0.3l0.1,0.3l-0.1,1.3l0.6-0.1l0.3-0.5l0.3-0.6
                        l0.5-0.5l0.7-0.1l0.3,0.3l-0.1,0.3l-0.6,0.1v0.3h0.5l0.3,0.1l0.3,0.3l0.1,0.3l0.7-1.9l0.1-1l-0.1-0.5l-0.1-0.3l-0.1-0.3l0.1-0.3
                        h-0.5l-1,0.3l-1,0.1l-0.3,0.1l-1.3,0.8l-0.7,0.3l-0.8-0.3L853,612v0.5v0.3L852.6,612.6z M819.3,624l-0.1,0.3l-0.1,0.5v0.6l0.3,0.3
                        l0.5-0.3l1.5-1.5l0.3-0.3l-0.1-0.1h-0.1H821l-0.3-0.3l-0.1-0.3l-0.5-0.3l-0.7,0.1l-0.3,0.5l0.3,0.6l0.1,0.3h-0.1H819.3z
                         M703.7,655.5l0.3,0.1l0.3,0.3l0.5,0.1h0.3l0.3-0.3l0.5-0.3v-0.3l-0.3-0.3l-0.3-0.6H705l-0.5,0.3l-0.3,0.1l-0.5,0.3l-0.3,0.5v0.3
                        h0.1L703.7,655.5z M696.6,672.2l0.3,0.1l0.6,0.3h0.3l0.3-0.1l0.3-0.6l0.3-0.5v-0.3l-0.1-0.5l-0.1-0.1l-0.3-0.3l-0.7-0.5l-0.1,0.1
                        l0.1,0.3l0.1,0.3l0.1,0.3v0.1v0.1v0.1l-0.1-0.1l-0.1-0.3l-0.1-0.3l-0.3-0.3l-0.3-0.1h-0.3l-0.1,0.3v0.3v1L696.6,672.2z M736.8,690
                        v0.3l0.1,0.1l0.3-0.1l0.3-0.1l0.3-0.1l0.3-0.3l0.3-0.3l0.1-0.3l-0.3-0.3l-0.5-0.3l-0.3,0.1v0.1l-0.1,0.1H737l-0.1,0.3l-0.1,0.3
                        C736.8,689.6,736.8,690,736.8,690z M726.4,705.2l0.1,0.1l0.1,0.1l0.3,0.3h0.5l0.3-0.3h0.3h0.3l0.3-0.3l0.1-0.3v-0.1l-0.1-0.1v-0.3
                        v-0.3l-0.1-0.3v-0.1l0.1-0.1h-0.1l-0.5,0.1l-0.1,0.3l0.1,0.3l-0.1,0.3l-0.3-0.1l-1.2-0.9l-0.6-0.3l-0.3,0.3l-0.3,0.3l-0.1,0.3v0.3
                        l0.1,0.1h0.3l0.3-0.3l0.3-0.1l0.1,0.1l-0.3,0.1v0.3l0.3,0.3L726.4,705.2L726.4,705.2L726.4,705.2z M709.4,617.4h0.5l0.1-0.6l0.1-0.5
                        l0.3-0.3l0.5-0.1l-0.1,0.5v0.5v0.5l0.1,0.3l0.6-0.8l0.5,0.6l-0.1,0.8h-1l0.3,0.6l0.6,0.1l0.6-0.3l0.3-0.7l0.1-0.3l0.3-0.3l0.3-0.3
                        l0.1-0.3v-0.3l-0.1-0.3v-0.3l0.3-0.3l-0.3-0.1h-0.3h-0.3l-0.3,0.1l0.3-1.3l0.6-1l1.8-2.3l0.3-0.3l0.3-1.4l0.1-0.3l0.1-0.5l-0.3-0.5
                        l-0.5-0.5l-0.3-0.3l0.3-0.1l0.3,0.3l0.3,0.3h0.3l0.3-0.5l0.1-1l0.3-0.5l-0.8-0.7l-0.3-0.3h-0.1h-0.1h-0.1l-0.3,0.1h-0.1v0.1
                        l-0.7,0.6l-0.6,0.8l-0.3,0.1h-0.6l-0.5,0.1l-0.3,0.3l-0.3,0.6l-0.1,1.2l-0.1,0.3l-0.1,0.3l0.1,0.3l0.8,0.7v0.3l-0.9,0.9l-0.3,0.6
                        l-0.1,0.6v0.6l0.3,0.3l0.5-0.3l0.3,0.3l-0.8,0.7h-0.1h-0.1h-0.1v0.1v0.5l-0.3,1.5l-0.3,0.5l-0.5-0.3l-0.1,0.6l0.3,0.1h-0.5
                        L709.4,617.4L709.4,617.4z M706.9,626l0.3,0.1l0.3,0.1l0.3,0.3v0.5l1.4-1.2l0.8-1v-0.3l0.1-0.3l0.3-1.8l0.1-0.1l0.3-0.1h0.1l0.1-0.3
                        l0.5-2.4l0.1-0.3l-0.3,0.1l-0.5,0.3h-0.3l-0.1-0.1l-0.1-0.5l-0.1-0.1l-1.3,0.1l-0.5-0.1l-0.3,0.3h-0.1v-0.3v-0.3v-0.3l-0.1-0.3
                        l-0.1-0.1l-0.5,0.5l-0.3,2.7l-0.3,0.9l-0.3,0.8l-0.1,1.3v1.3L706.9,626z M877.4,608.5l-0.7,0.1l-0.5,0.5l-0.8,1.2l-0.5,0.3l-1.2,0.6
                        l-0.5,0.5l-0.3,0.3l-0.3,0.6l-0.3,0.3l-0.3,0.3l-0.6,0.3l-0.3,0.3l-2.3,4.1l-2.1,1.3v1.3l0.7,0.9l1-0.5l0.3,0.3l-0.3,1.3l0.8,0.6
                        h1.3l1.2-0.3l0.5-0.3l0.3-0.3l0.5-0.3l0.7-0.1l0.5-0.1l0.5-0.3l0.3-0.6l0.1-0.6l-0.3-0.5l-0.7-0.7l-0.1-0.6l-0.1-0.3l-0.5-0.6
                        l-0.1-0.5v-0.3l0.3-1l0.7-1.3l1.6-2.2l0.6-1.3l0.1-0.3l0.3-0.6l0.3-0.6v-0.5L877.4,608.5z M971.6,492.5l0.3,0.3h0.3l0.7-0.1l3.1-1.2
                        l3.4-2.3l0.5-0.6l0.3-1.4l0.3-0.7l1.3-1.9l0.3-0.7v-1.5l-1-0.1l-1.4,0.3l-1-0.1l-0.3,0.7h-0.3l-0.1-0.4v-0.6l0.1-0.7l1.3-3l0.6-2.2
                        l0.3-2.4v-0.5l-0.3-0.3h-0.7l-0.3,0.1l-0.3,0.3l-1.3,2.1l-0.8,0.6l-1.4,1.4l-0.3,0.3l-0.6,0.5l-0.6,0.5l-0.5,1.2l-1.3,1.7l-0.3,0.7
                        l-0.3,0.7l-0.1,0.8v0.9l0.5,1.2l1.9-0.7l0.8,1.2l-0.3,0.6l-0.8,1l-0.3,0.6v1.6l-0.1,0.5l-0.3,0.3l-1.4,0.3l-0.3,0.1l-0.1,0.3
                        l0.1,0.3L971.6,492.5z M824.5,550.9l1.4,1.3l0.3,0.1h0.7l1.2,0.3h0.3l0.3-0.3l0.1-0.3l-0.1-0.3l-0.3-0.3l0.3-0.3l0.3-0.3h0.3
                        l0.3,0.5l0.3-0.3l0.3-0.3l0.1-1.8l-0.5-0.6l-0.1-0.3l-0.1-0.3l-0.1-0.3l-0.1-0.1l-0.3-0.1l-0.3-0.1l-0.1-0.1l-0.1-0.3l-0.1-0.1
                        l-0.3-0.1l-0.3-0.1l-0.3-0.1v-0.5l-2.4,1.6l-0.3,0.7l-0.3,2.3l0.1,0.3L824.5,550.9z M741.8,681.6l-0.1-0.3l-0.1-0.3l-0.3-0.1H741
                        l-0.6,0.5l-1,0.3l-0.5,0.3l-0.6,0.5l-0.6,0.7l-0.3,0.1l-0.5,0.1l-0.3,0.1l-0.1,0.3v0.5l0.3,0.5l0.6,0.9l0.7-0.3l0.6-0.1l1.2-0.1
                        l0.6-0.5l0.3-0.1l0.1,0.3v0.8v0.3l0.1,0.1l0.9-0.8l1.3-3.4l1-0.7l-0.3-0.5h-0.5l-0.9,0.5l-0.6,0.1L741.8,681.6z M734.5,690.1
                        l0.6-1.4l0.1-0.3l0.7-0.3l0.3-0.3l0.3-0.3l0.1-0.3v-0.3l0.1-0.9V686l-0.1-0.3l-0.1-0.3l-0.1-2.8l-0.3-1.5l-0.8-0.8h-0.6l-0.6,0.3
                        l-0.5,0.3l-0.8,0.3l-0.6,0.3l-0.3,0.1l-0.3-0.1l-0.3-0.3l-0.3-0.3h-0.3l0.7,1l0.1,0.7l-0.3,0.8l-0.5,0.6l-0.3,0.7l-0.1,0.7l0.3,0.6
                        l-0.3,0.3l-0.3,0.3l-0.1,0.3v0.3l0.1,0.8l0.3,0.7l0.5,0.3l0.7-0.3l0.5,0.3h0.3h0.3l-0.3,0.3l-0.3,0.1h-0.3l-0.3,0.1l-0.6,0.3
                        l-0.9,0.8l-0.1,0.3l-0.1,0.3v0.1l0.5-0.3h0.3h0.3l0.3-0.3l-0.5,1.8v0.3h0.5l0.7-0.3l0.7-0.5l0.5-0.3l0.7-0.8l0.3-0.3l0.7-0.3
                        L734.5,690.1z M698.3,677v-0.1l0,0l-0.1-0.5l-0.6-1.4l-0.3-0.3l-0.8-0.7l0.1-0.6l-0.3-0.6l-0.5-0.3l-0.5,0.1v-0.3v-0.3v-0.3l0.1-0.1
                        l-0.7-0.3l-1.5,1.5l-0.8-0.3l-0.1,0.3l-0.1,0.1l-0.1,0.1l-0.1,0.1l-0.1-0.7l-0.5-0.3H691l-0.3,0.5v0.7v0.3l-0.3,0.3v0.3v0.3l0.1,0.1
                        l0.1,0.1l0.1,0.1l0.1,0.3v0.3v0.3v0.3l-0.3,0.9v0.3v-0.3l-0.1-0.8v-0.1l-0.3,0.1l-0.3,0.3l-0.1,0.3l-0.1,0.3h0.3l-0.3,0.6l0.3,0.5
                        l0.6,0.3l0.7,0.1l1.5-0.1l0.7,0.3l0.6,0.7l0.3-0.3l0.3-0.3l0.1-0.5l0.1-0.5l-0.1-0.1l-0.1-0.1l-0.1-0.3l0.1-0.3l0.1-0.1h0.3l0.1-0.1
                        h0.3l1.4,0.3h0.8h0.3L698.3,677z M762,739.1l-0.6-0.3l-0.3,0.1l-0.3,0.1l-0.3,0.5l-1.5,3l-1,1.6l-0.1,0.3l0.1,0.3l0.3,0.3l0.1,0.3
                        v1.2l-0.1,0.9l-0.3,0.8l-0.5,0.8l-1.3,1.8l-0.5,1l-0.1,1.2l0.1,1.4l0.3,0.7l0.5,0.3l0.5-0.1l0.6-0.3l0.6-0.3l0.3-0.3l0.6-1.2
                        l0.3-2.8l0.5-1.3l1.3-1.6l0.3-0.6v-0.3l0.3-0.9l0.8-3.1l0.1-0.7l-0.1-1.8L762,739.1z M748.3,753l-2.3-0.9l-0.6-0.6l-0.8,0.3l-1,1.2
                        l-1.4,0.8h-0.3v0.7v0.5l0.1,0.3l0.8,1.9l0.6,0.9l0.6,0.6l0.8,0.3l1,0.1l0.9-0.1l0.7-0.3l1-0.1l0.9-1.3l0.7-1.6l0.1-1.2l-0.8-0.9
                        L748.3,753z M1193.3,277.5h-0.3h-0.1l-0.1-0.1l-0.1-0.1h-0.3l-0.3,0.1l-0.3,0.5l-0.3,0.1l-1.3-0.1l-0.5,0.1l-0.3,0.3l-0.1,0.3
                        l-0.1,0.3l-0.3,0.3l-0.3,0.3l-0.8,0.3l-0.3,0.3l-1.3,1.4l-1.2,0.9l-0.3,0.3l0.1,0.6l0.3,0.3l0.3,0.3l-0.1,0.5l-0.7-0.6l-0.7-0.3
                        l-2.5-0.3l-0.9-0.3l-0.8-0.5l-0.5-0.6l0.5-0.1l-0.1-0.3l-0.5-0.3l-0.5-0.1l-0.5-0.3l-0.3-0.5v-0.5l0.3-0.3l0.8,0.3l1.8,1.6l0.9-0.1
                        l-1.4-1.2l-1-1.4l-0.6-1.5l-0.8-3.4l-0.3-1l-0.1-0.7l-0.5-0.3l-0.1-0.3l-0.1-0.9l-0.3-0.8l-0.3-0.7l-0.3-0.6l-1.9-2.1l-0.5-0.6
                        l-1.3-2.8l-0.1-0.3v-0.5l0.1-0.5l0.5-0.6l0.3-0.9l0.3-0.8l0.3-0.8l-0.3-0.8l0.5-1.5l0.7-1.5l0.7-1.3l2.7-3.4l0.3-0.7l0.3-1.9
                        l0.3-0.8l1.7-2.3l0.7-1.5V241l-0.1-0.5l-0.6-0.9l-0.3-0.8h-0.3l-0.3,0.3l-0.1,0.3l-0.3,0.8l-0.6,0.7l-1.2,1.2l-1.4,2.7l-0.5,0.5
                        l-0.6,0.3l-1.4,1.5l-2.1,1.4l-0.3,0.5l-2.7,3.1l-3.4,3.7l-1.3,0.8l-1.4,0.3l-4.9-0.5l-4.1-0.7l-1-0.3l-0.5-0.3l-1.3-0.9l-0.3-0.1
                        l-0.3-0.3l-0.5-1.4l-0.3-0.3l-0.5-0.3l-0.3-0.6l-0.3-1.3l0.3-1.2l-0.6-0.5l-0.8,0.3l-0.5,1.2l-0.1,0.6l-0.3,0.7l-0.3,0.6l-0.3,0.5
                        l-0.5,0.3h-0.5l-0.9-0.5l0.6-1.9l0.5-0.6l0.6-0.3l0.3-0.1v-0.3l-0.6-0.5l-1-0.5l-3.6-0.3l-0.5,0.1l-0.5,0.3l-0.8,0.9l-0.3-0.1
                        l-4.3-0.1l-0.5-0.1l-0.3-0.3l-0.5-0.5l-0.1,0.1l-0.3,0.3l-0.3-1.5l-0.3-0.3l-0.7-0.7l-0.1-0.3l0.5-0.3l2.4,0.3v-0.3l-6.5-2.5
                        l-4.3-2.7l-0.3-0.3l-0.8-0.9v-0.3l-0.5-1.3l-0.3-0.3l-1.3-0.3l-0.6-0.5l-1.2-1.3l-0.5-0.3l-0.6-0.3l-2.5-2.1l-2.2-2.4l-1.7-1.3
                        l-1.3-1.9l-0.9-0.6l-5.8-6.5l-1.4-2.5l-1-0.7l-0.5-0.8l-2.2-4.7l-9.3-11.6l-1.2-1.2l-2.5-1.9l-1.2-1.3l-1.2-2.2l-0.5-0.3l-0.5-0.3
                        l-0.3-0.5l-0.5-1.3l-0.3-0.2l-0.8,0.3l-0.8,0.7l-0.5,0.7v0.5v0.6v0.5l-0.3,0.3h-0.4l-1,0.8l-1.5,0.3l-1.4,0.3l-0.7,0.3h-0.3
                        l-0.1-0.5v-0.6l-0.1-0.5l-0.2-0.3l-0.3-0.3l-0.5,0.6l-0.3,0.7l-0.1,0.7v0.7l0.3,1.3v0.7l-0.6,1.2l-0.1,0.3l-0.1,0.3l-0.1,0.5
                        l-0.3,0.3l-0.6,0.7l-0.3,0.3l-0.3,1.8l0.3,1.7l4,8.6l0.9,2.8l0.9,4.9l0.3,5l0.1,1.9l-1.3,7.1l-2.4,4.6l-0.3,1.5l0.5,8.6l-0.1,1.7
                        l-0.2,1.7l-0.6,1.8l-0.7,1.4l-0.9,1.2l-1.6,1.4l-0.6,0.3l-0.6,0.3l-1.3,0.3l-0.7,0.3l-0.7,0.5l-0.5,0.5l-0.8,1.4l-0.5,1l-0.3,0.8
                        l0.3,0.9l0.7,1.8l-0.1,0.8l0.3,0.3l0.6,1.6l-0.5,0.8l-0.3,0.7l-0.1,0.8l0.3,1l1.6,2.5l0.3,1v1.8l-0.5,1.7l-0.7,1.5l-0.8,1.2
                        l-1.9,2.2l-2.2,1.7l-0.8,0.5l-0.3,0.1h-0.6l-0.3-0.1l-0.6-0.3l-0.7-0.1l-1.3-0.6l-1-0.1l-0.3-0.1l-0.6-0.7l0.3-0.7l0.3-0.6l-0.3-0.3
                        l-0.7,0.1l-2.2,0.9l-3,0.5l-0.5-0.1l-0.3-0.3l-0.5-0.6l-0.3-0.3l-2.1-1l-0.6-0.5l-0.9-1.2l-0.5-0.5l-2.6-1.6l-0.6-0.3l-0.3-0.1
                        l-0.3-0.3l-0.3-0.3h-0.5l-0.3,0.3l-0.1,0.3l-0.1,0.5l-0.1,0.3l-0.6,0.5l-0.7,0.1h-1.5l-0.9,3l0.3,1.6l0.9,1.2l1.2,0.9l1,1l1.4,2.1
                        l0.3,0.6l0.3,0.9l0.5,0.6l0.3,0.6l-0.1,0.8l-0.6,0.7l-1.3,0.8l-1.9,1.9l-0.5,0.6l-0.8,1.6l-0.5,0.8l-0.6,0.3l-0.3,0.5v0.9l-0.3,0.9
                        l-0.7,0.5l-0.6-0.1l-0.5-0.5l-0.7-1.2l-0.7-0.6l-0.5,0.1l-0.5,0.6l-0.8,1.6l-0.3,0.3l-0.3,0.3h-0.3l-0.3,0.1l-0.3,0.3l-1.3,1.6
                        l-0.5,0.3l-0.7,0.3l-2.8,0.1l-1.2,0.6l-0.9,1.5l-0.3,1.5l0.5,3v1.8l-0.3,1.8l-0.3,0.8l-1.3,2.1l-0.2,0.9l-0.1,0.8l0.3,1.6l0.3,0.9
                        l0.3,0.5l1.3,1l0.9,0.3l0.3,0.3l0.6,1.2l0.1,0.3v0.3l0.6,0.7l3,1.3l0.9,1l1.5,2.8l0.9,1.2l-0.3,0.6v0.8l0.3,0.8l0.3,0.6l-0.1,0.3
                        v0.7l-0.1,0.5l-0.3,0.3l-0.3,0.1l-0.1,0.3v0.3l0.3,0.3v0.3v0.9l-0.1,0.3l-0.3,0.3h-0.3l-0.7-0.1l-0.1,0.1l-0.3,1.6l-1.5,2.5
                        l-0.5,2.4l-0.6,1.3l-0.1,0.8l0.1,0.8l0.9,2.3l0.5,1.6l0.3,0.8l0.5,0.3l0.3,0.1l0.8,0.6l0.3,0.1l0.3-0.1l0.5-0.3h0.3l1.4,0.7l0.7,0.1
                        l0.3-0.6l0.3-0.8l0.5-0.8l0.6-0.6l0.5-0.3l3.7-1.2l0.9-0.7l0.3-1.3l-0.3-3.1l0.6-1.4l0.6-0.3l1.6-0.5l0.3-0.3l0.3-0.3l1.7-0.9
                        l0.3-0.7l0.5-1.7l0.3-0.7l0.6-0.5l0.7-0.1l0.7,0.3l0.6,0.5l0.3,0.7l-0.3,0.5l-0.5,0.3l-0.3,0.6l0.3,0.6l0.7-0.3l1.4-0.8h1.4l1.5,0.5
                        l2.5,1.4l1.4,0.3l1-0.5l1.8-1.8l0.6-0.3l0.7-0.3l1.4-0.3l0.3-0.3l-0.5-0.8l-2.2-2.1l-0.7-0.5l-0.7-0.1l-0.8-0.1l-0.7-0.3l-0.6-0.3
                        l-0.5-0.5l-1.9-2.5l-0.5-0.5l-1.2-0.8l-0.5-0.5l-1.4-1.9l-0.5-1l-1.7-1.3l-0.6,0.3l-0.6,0.1l-1.8,0.3l-1.2,0.3l-0.7,0.1l-0.6-0.3
                        l-2.2-2.4l-0.9-0.8l-3-1.6l-0.9-1l-0.3-1.8l0.3-1.8l0.5-1.7l0.7-1.6l1.6-2.8l1-1.4l1.2-1l1.3-0.6h0.7l2.1,0.3l1.9-0.3h0.7l1.4,0.6
                        l4.9,5.6l0.3,1.6l0.1,0.3l0.3,0.3l0.6,0.5l0.8,0.3l0.3,0.3l-0.1,0.5l-0.3,0.1l-1.2-0.3l-0.1,0.1l0.1,0.3l0.3,0.3l0.3,0.3l0.3,0.3
                        h0.3l0.3-0.1l0.3-0.1l0.5-0.5l1.6-2.4l0.6-0.6l2.3-1.6l0.3-0.3l0.3-0.1h0.3l0.3-0.1l0.6-0.6l0.8-0.3l4.8-3.8l3.6-1.5l2.5-0.6
                        l2.7-0.1l2.7,0.7l2.1,1.2l0.6,0.1l0.5,0.3l1.6,1.9l1.4,0.9l4.3,2.1l1.3,0.9l1.7,1.8l5.3,3.8l2.5,0.8l6.2,3.7l5.9,2.1l4.6,3.1
                        l0.8,0.7l0.7,0.8l0.3,0.7l0.3,0.5l0.6,0.6l0.7,0.6l0.5,0.1l0.3-0.6l0.3-1.7l0.8-0.7l0.3-0.8l0.8-3.2l0.1-0.9v-0.8v-0.9l-0.3-2.3
                        l0.3-1.8l0.6-1.6l2.8-5.4l3.7-5.9l1.8-2.3l4.5-3.8l2.8-3.4l4.6-3.4l4.1-1.9l4.1-1h0.7l0.3,0.3l0.3,0.3l0.1,0.5l0.1,0.3l0.3,0.3
                        l0.3,0.3l2.2,0.8l0.9,0.1l0.8-0.5l2.3-0.3l4.1,1l1.3-0.5l-0.3-0.5l-0.5-0.3l-0.3-0.5l-0.3-0.6l0.1-0.5l0.3-0.6l0.3-0.5l0.3-0.3
                        l0.3-0.1l0.3-0.5l0.3-0.3l0.3-0.1h0.1h0.3h0.3l0.6,0.3l0.1,0.5l-0.1,0.5v0.3l0.8,0.8l0.9,0.3h1l1.9-0.3l0.5-0.1l0.3-0.3l0.1-0.6
                        l-0.1-0.5l-0.6-1l1.4,0.5h0.7l0.7-0.5l0.3-0.3v-0.3l0.1-0.1l1.2-0.1l0.3-0.1l0.3-0.3l-0.5-0.3h-0.6l-0.3-0.1l-0.1-0.7l0.3-0.6
                        l0.3-0.3l0.5-0.3l2.3-0.3l0.8-0.3l0.7-0.6l0.7-0.3l3-0.1l0.9-0.3l0.5-0.1l0.8,0.5l0.6,0.1l0.6,0.1l0.3-0.1l-0.5-0.3l0.8-1l0.3-0.3
                        l0.1-0.5l0.3-1l0.3-0.5l0.3-0.3l0.8-0.8l0.3-0.5l0.3-0.3l0.3-0.3l0.5-0.1l0.8,0.3l0.3-0.1l0.5-0.5l0.3-0.3l1.2-0.3l0.3-0.3l0.6-0.8
                        l0.3-0.3h0.7l0.3-0.1l0.3-0.3l-0.3-0.3L1193.3,277.5z M791.1,666.8l-0.1-0.1l-0.3-0.1l-1.3,0.7v-0.1v-0.3v-0.1l-0.3,0.1l-0.3-0.1
                        l-0.1-0.3l-0.3-0.1l-0.3,0.1l-0.3,0.1h-0.3l-0.3-0.1l-0.9-0.8l-0.1-0.5l0.6-0.9l0.3-0.6l0.3-0.3l0.3-0.1l1.5-0.3l0.5-0.3l0.1-0.5
                        l-0.3-0.8l-0.3,0.7l-0.2,0.3l-0.3,0.1h-0.3l-0.3-0.3l-0.3-0.3l-0.1-0.5h-0.1l-0.1,0.3l-0.1,0.5l-0.3,0.3l-0.7-0.3h-0.3l-0.3,0.1
                        l-0.3-0.1v-0.6l0.6-0.5l0.5-0.5l-0.3-0.7l-0.8,0.5l-0.9,0.1l-0.6-0.3l0.3-1l0.6-0.7l0.3-0.3l0.1-0.3l0.1-0.3l0.1-0.3l0.3-0.5
                        l0.7-1.4h-0.6l-1,0.6l-0.7,0.1l-1.9-0.1l-1.8-0.5h-3.8l-0.7-0.1l-0.6-0.3l-0.3-0.5l-0.3-2.3l0.3-0.5l0.7-0.1l0.3,0.1l0.3,0.3
                        l0.3,0.1h0.3l0.3-0.3l0.3-0.6l0.3-0.1l0.7-0.3l0.1-0.5l-0.1-0.6l0.1-0.5l0.6-0.3l0.5,0.3l0.5,0.1l0.7-0.6l0.3-0.6l0.5-3.2l-0.1-0.7
                        l-0.3-0.7l-2.1-2.7l-0.3-0.6L778,641l-0.6-0.3l-0.5-0.3l-0.3,0.5l-0.5-0.1h-1l-0.7,0.3l-0.3,0.5l-0.3,0.5l-0.8,1.4l-0.3,0.5l-1,0.6
                        l-1.4,0.3h-1.4l-1.2-0.3l-1.7-1l-0.6-0.1l-1.8,0.1l-0.7-0.1l-0.5-0.3l-0.6-0.6l-0.5-0.7l-0.5-1l-0.9-1.6l-0.3-0.7l-0.1-0.9l-0.1-0.3
                        l-0.9-0.6l-0.1-0.3l-0.1-0.3l-0.1-0.1v-0.1l0.3-0.5l0.3-0.3l-0.1-0.3l-0.1-0.3v-0.5l0.3-0.3l0.6-0.3l0.3-0.3v-0.1l-0.3-0.3v-0.3
                        l0.1-0.3l0.3-0.5v-0.3l-0.3-0.5l-0.7,0.3l-0.8,0.6l-0.5,0.5l-0.5,0.6l-0.3,0.3l-0.5,0.1h-0.8l-0.3-0.1l-0.1-0.3l-0.1-0.3l-0.1-0.1
                        l-1.2-0.3l-1.5,0.3l-0.8-0.1l-0.3-0.6l-0.1-0.1h-0.3h-0.3l-0.3,0.1l-0.9,1.4l-0.6,0.5l-0.6,0.1l-1.4-0.1l-0.5,0.1l-0.3,0.1l-0.1,0.3
                        l-0.3,0.3l-0.7,0.5h-0.3l-0.3-0.3l-0.3,1l-0.1,0.3l-0.3,0.3l-0.3,0.1l-0.1,0.3v0.5l0.6,1.4v0.8l-0.7,0.3l-0.5,0.1l-0.3,0.3l-0.3,0.5
                        l-0.5,0.5l-1.2,0.6l-0.3,0.5l0.5,0.5l0.3-0.3l0.5-0.5l0.6-0.3h0.5l0.3,0.6l-0.1,0.8l-0.3,0.7l-0.5,0.3l-0.3,0.1l-0.3,0.3l-0.3,0.1
                        h-1.5l-0.1,0.1l-0.1,0.3l-0.1,0.3h-0.3l-0.1-0.1l-0.1-0.1l-0.1-0.1l-0.1-0.1v-0.1l-0.3-0.5l-0.1-0.1l-0.3-0.1l-0.3-0.1l-0.3-0.3
                        l-0.1-0.8l-0.1-0.3l-0.3-0.3v0.4l-0.3,0.6l-0.3,0.3l-0.3,0.1h-0.3h-0.3l-0.1,0.1l-0.8,1l-0.3,0.1h-0.3h-0.3l-0.3,0.3l-0.1,0.3v0.3
                        l0.1,0.3h0.3l0.3,0.1l0.1,0.5l0.3,0.1l0.9-0.3h0.3L735,646l-0.3,0.3l-0.3,0.3H734l-0.1,0.1l-0.3,0.5l-0.1,0.1h-0.9l-0.5,0.1
                        l-0.3,0.3l-0.5,0.9l-0.3,0.3l-0.3,0.1l-0.9,0.1l-0.3-0.1l-0.1-0.3v-0.6l-0.1-0.1l-0.6,0.1l-0.1-0.1v-0.6l0.5-0.5v-0.5l-0.6-0.7
                        l-0.8-0.3h-0.9l-0.8-0.1v0.5l-0.3,0.9v0.6l0.5,1l0.1,0.5l-0.3,0.3l-0.3-0.3l-0.3-0.5l-0.1-0.5l-0.3-0.3l-0.3,0.1l-0.3,0.3l-0.3,0.3
                        v0.3l0.6,0.9l1.5,0.7l0.3,0.9l-0.1,0.3l-0.3,0.3l-0.3,0.3l-0.1,0.6l-0.1,1.3l0.1,0.5l-0.3-0.3l-0.3-0.3l-0.3-0.3l-0.1-0.9l-0.3-0.6
                        l-0.3-0.5l-2.7,0.5l-0.5-0.1l-0.3-0.3V651l-1.3,0.7l-0.7,0.1l-0.5-0.6l-0.6,0.3l-0.1,0.7l0.1,1.7l0.1,0.5v0.3l-0.1,0.3l-0.3,0.1
                        l-0.3,0.1l-0.1,0.1l-0.1,0.5v0.8l-0.1,0.5h0.8l0.3,0.1l0.5,0.5l0.3,0.1h0.3l0.3-0.1l0.3,0.3l0.1,0.1v0.3l-0.1,0.3l0.3,0.1l0.3,0.3
                        l0.3,0.3l0.1,0.3l-0.1,0.3l-0.5,0.6l-0.1,0.5h0.3l0.3-0.1h0.5l0.3-0.1l0.1-0.3l0.1-0.8l0.1-0.3l0.3,0.1l0.1,0.3v0.3v0.3l0.8-0.5h0.1
                        l0.3,0.3l-0.3,0.3l-0.3,0.3l-0.1,0.3l-0.1,0.3l-0.1,0.3v0.3l0.3,0.1l0.7,0.6l0.3,0.1l0.3-0.6h0.3l0.8,0.5l-0.1,0.6h0.5l0.7-0.3h0.6
                        l1.6,1.4l0.3,0.3l-0.1,0.8l-0.3,0.8v0.7l1.5,2.8l0.6,0.5l-0.3,0.3l-2.2-1l-1.2-0.1l-0.3,0.9l-0.3-0.1h-0.1l-0.1-0.1l-0.3,0.3
                        l-0.3,0.1l-0.3-0.1l-0.1-0.5l-0.3-0.1l-0.5-0.3l-0.3-0.3l0.3-0.1v-0.1l-0.5-0.8v-0.3v-1.3l0.3,0.3l0.1,0.5l0.3,0.3l0.3,0.1l0.3-0.3
                        v-0.3l-0.3-0.7l-0.1-1l-0.3-0.5l-0.5-0.3l-0.7-0.6l-0.6,0.8l-0.3,0.3l-0.1-0.5l0.1-0.6l0.6-0.7v-0.5l-0.1-0.3H722l-0.3,0.1l-0.1,0.1
                        h-0.1h-0.3h-0.1v-0.3v-0.3V662l-0.6-0.5l-0.8-0.5l-0.8,2.8l-0.5,1.3l-0.1,0.7l0.1,0.7l0.3,0.3l0.3,0.3l0.3,0.3l0.1,0.5v0.5l0.1,0.3
                        l0.3,0.6l0.3,0.6l0.7,0.9l0.3,0.7l0.3-0.3l0.5-0.3h0.3l0.1,0.3v0.5l0.3,0.3l0.3,0.3l0.3,0.3l0.6,1.3l0.5,0.5l0.6-0.1l-0.1,0.9
                        l-0.3,0.8l-0.9,1.4l-0.6,1.2l-0.3,0.3l-0.3,0.3L722,679l-0.3,0.3l-0.3,0.5l1.2-0.1l1-0.6l2.4-2.5l0.3-0.5l1.4-2.8l0.5,0.3h0.7
                        l0.8-0.3l0.6-0.3l0.9-0.6l0.3-0.1l0.5-0.1l1,0.1l1.3-0.3l0.3,0.1l0.1,0.3v0.3l-0.1,0.3v0.3v0.3l0.1,0.3l0.3,0.1l0.1,0.8l-0.1,0.3
                        l-0.3,0.3l-0.3,0.5l-0.3,0.3l-0.3,0.1l-0.3-0.1l-0.1,1l0.3,0.8l0.5,0.7l0.1,0.3l0.5,0.5l0.6-0.3l0.6-0.5l0.7-0.3l0.3-0.3l0.3-0.3
                        l0.1-0.3l1.8-0.6l0.5-0.3l0.3-0.6l0.1-0.9l0.1-0.3l0.5-0.7l0.1-0.5l0.1-1l-0.1-0.5l-0.6-1.4l-0.9-0.9l-1.2-0.3l-1.3,0.3l-1,0.8
                        l-0.7,0.3l-1.2-0.3l-0.8-0.1l-0.5-0.3l0.3-0.7l0.3-0.1h0.7l0.3-0.1l0.3-0.3l0.6-0.3l0.3-0.3l0.5-0.7l0.3-0.6v-0.6l-0.3-0.6l-1.4-2.7
                        l-0.8-0.9l-0.3-0.6v-0.8l0.9,0.3l0.8-0.8l0.8-1.2l1-0.6l0.5,0.3l0.8,0.8l0.3,0.3h0.5l0.7,0.3l0.8,0.1l0.1,0.3v0.3l0.1,0.3l0.3,0.3
                        l0.6,0.5l0.1,0.1h0.1h0.1l0.1,0.1v0.3v0.5l0.3,0.7v1.5l0.3,2.3l0.3,0.6l0.8,0.5l1.4,1.4l2.3,1.8l0.3,0.7v0.3l0.1,0.1v0.1l-0.1,0.3
                        l-0.3,0.5l-0.1,0.3v0.3l0.1,0.3l0.3,0.5l0.3,0.3l0.5,0.3v0.3h-0.3h-0.3l-0.5,0.1h-0.3l-0.3,0.1l-0.6,0.6l-2.1,1l-0.6,0.5l-0.3,0.5
                        l0.5,0.3l0.5-0.3l4.8-0.9h0.8l-0.3,0.8l-0.5,0.6l-2.1,1.8l-0.1,0.3l0.1,0.5l0.7,0.6l0.3,0.5h-0.8l-0.3,0.1l-0.3,0.3l0.5,0.5l0.1,0.9
                        l-0.3,0.9l-0.6,0.3l-0.8,1l-0.1,0.3l0.1,0.9v0.5l-0.3,0.3l-0.8-0.8l-0.3,0.1l-0.3,0.7v0.3l0.1,0.3v0.3l-0.1,0.3l-0.3,0.3l-0.1,0.3
                        l-0.3,0.9l-2.2,2.3v0.1v0.5v0.1l-0.3,0.1l-0.1,0.1l-0.3,0.9l-0.1,0.3l-0.3,0.3l-0.6,0.5l-0.6,0.3l-0.9-1.2l-1.3,0.5l-0.8,0.9
                        l0.7,0.7l-0.9,1.8L735,700l0.1,0.3l0.6,0.3l0.1,0.3v0.3l0.1,0.7v0.3l-0.3,2.3l0.1,0.6l0.3,0.5l0.8,0.8l-0.3-0.3l-0.3-0.1h-0.8v0.5
                        v1.5l0.1,0.3l0.5,0.3l1.4,0.8l0.3,0.3l1.2,1.7l0.8,0.9l0.3,0.6v0.7l-0.3,0.7l0.3,0.8l-0.3,1.2l-0.3,1.3l-0.3,1.2l-0.3,0.7l-1.6,1.3
                        l-0.5,0.8l-0.3-0.3l-0.6-0.7l-0.3-0.1h-0.3l-0.3-0.1h-0.3l-0.3,0.1l-0.8,0.3l0.6,0.3l0.9,0.7l0.8,0.8l0.3,0.6l-0.3,0.5v0.3l0.1,0.1
                        l0.3,0.1l0.1,0.3l0.1,0.3l0.1,0.8l0.1,0.5l0.3,0.3l0.3,0.3l0.8-0.3h0.7l5.3,0.7l0.6,0.3l0.3,0.5l0.3,0.8v0.5l0.1,0.3l0.5,0.3h0.5
                        l0.3-0.1h0.3l0.3,0.5l0.5-0.6l0.6-0.3l0.5-0.3l0.3-0.7l0.1-0.6l0.3-1.2v-0.5l-0.3-0.3l-1.3-0.7l-0.3-0.1l-0.5-0.3l-0.3-0.7l-0.3-1.4
                        l-0.9-1.9l-0.1-0.7v-0.7l0.3-1.4l0.3-1l0.5-0.8l0.3-1.2l0.3-0.3l0.8-0.9l0.1-0.3l0.1-0.9l0.1-0.3l0.9-1.2l1.3-0.3l1.4,0.1l1.3,0.3
                        l0.8,0.8l0.1,1.3l-0.3,1.4l-0.7,1l-0.5,0.6l-0.3,0.1H752l-0.3-0.1l-0.1-0.3l0.1-0.9l-0.3-0.6l-0.7-0.3l-0.8,0.1l-0.5,0.1l-0.5,0.3
                        l-0.6,0.6l-0.3,0.6l0.3,0.3l0.3,0.1l0.5,0.3l1.7,0.3l0.3,0.6l0.1,1.4l0.3,0.7l0.8,1.2l0.7,1.2l0.3,1l0.3,1.2l0.1,1.3v1.4l-0.3,1.3
                        l-0.3,1.4l-0.5,1.3l-0.5,0.9l-0.5,0.3l-1.2,0.7l-0.3,0.5l-0.3,2.8l0.5-0.3l0.8-0.5l1.2-1l0.5-0.3l1-0.3l0.6-0.3l0.5-0.3l0.3-0.3
                        l0.3-0.3l1.6-0.3l0.5-0.3l0.5-0.3l0.5-0.3l0.3-0.3l0.3-0.5l0.5-1l0.3-0.5l0.8-0.8l0.5-0.3l1-0.3l1.4-1l-0.9-0.3l-0.3-0.1v-0.3
                        l0.5-0.7l0.1-0.3l-0.3-0.5l-0.6-0.3l-0.7-0.3l-1.3-0.3l-0.3-0.3l0.1-0.6l1-1.8l0.3-0.5l0.5-0.3l1.2-0.5l0.6-0.1l0.6-0.1h0.3l0.6,0.1
                        l0.8,0.1l0.1,0.1v0.3l0.3,0.3l0.6,0.6l0.1,0.3l0.1,0.3v0.6l0.1,0.3l0.5,0.3h0.6l1.2-0.3v0.1v0.1l-0.1,0.3l0.3,0.1h0.1l0.1,0.1
                        l0.3-0.1l0.1-0.3v-0.3l0.1-0.3l0.3-0.6l0.1-0.3l0.3-1.6l0.1-0.3l0.3-0.3l0.1-0.3v-0.7v-0.1l-0.1-0.1l-0.1-0.3v-0.5l0.1-0.3l0.3-0.7
                        h0.1l0.1-0.6l0.3-0.5l0.9-0.8l-0.1-1l0.7-3.8l0.1-0.3l0.5-0.6l0.1-0.3l-0.1-0.3l-0.8-0.9l-0.3-0.5l-0.3-0.6l-0.1-0.6v-0.7l1.8-3.9
                        l0.8-3.4l-0.3-1.5v-0.3l0.5-0.5l0.3-1.6l0.7-1.4l0.3-1.7l0.3-0.7l0.3-0.3l0.1-0.1l0.1-0.1l0.1-0.8l0.3-0.9l0.1-0.3l0.3-0.1l0.3-0.1
                        l0.3-0.1l0.1-0.5v-0.3l-0.3-0.9l0.6-0.3h0.7l0.7-0.1l0.6-0.7l-0.5-0.6l-0.3-0.1h-0.5l-0.3-0.3l-0.1-0.5l0.6-1l-0.1-0.6l0.3-0.1h0.7
                        l0.5-0.1l0.3-0.3l0.5-0.9l0.1-0.3v-1v-0.1l0,0l0.1-0.1l0.1-0.3l0.3-0.3l0.3-0.5l0.5-0.1l0.8-0.1h0.1h0.1h0.1v-0.6v-0.5l0.1-0.1
                        l0.1-0.1l0.1-0.1v-0.3v-0.9l0.3-0.7l1.4,0.1l0.6-0.5h0.5l0.6-0.3l0.5-0.3l0.3-0.5l-0.1-0.3L789,671h-0.3l0.3-0.3l0.3-0.3l0.3-0.1
                        l0.3-0.3l0.3-0.6l-0.1-0.3l-0.3-0.1l-0.1-0.3l0.3-0.5l0.8-0.3l0.9-0.3l0.7-0.1l-0.1-0.3L791.1,666.8z M869,635.7h-0.9v-0.3h0.3
                        l0.3-0.1h0.3V635h-1.6l-0.5-0.3l0.5-0.8l0.3-0.3l0.3-0.1l0.3-0.3l0.1-0.5l-0.1-0.5l-0.5-1l-1.2-1.3h-0.3l-0.3,0.1h-0.3l-0.1-0.5
                        v-0.3l-0.1-0.7v-0.3v-0.3l0.3-0.7l0.3-0.1v-0.5l0.3-0.8l0.1-1l0.1-0.3l0.3-0.3l0.3-0.5l-0.3-0.3l-0.3-0.3l-0.3-0.1l-0.3-0.1l0.6-0.1
                        l0.3-0.1l0.3-0.3l0.1-0.3l0.3-0.8v-0.6h-0.3l-1,0.8l-0.6,0.1l0.5-0.5l0.1-0.3l-0.1-0.3h-0.5l-0.3,0.1l-0.6,0.3l-3.6,0.3l-0.3-0.1
                        l-0.3-0.3l-0.3-0.3l-0.1-0.3l-0.1-0.3h-0.6l-0.8,0.1l-0.5-0.1l-0.6-0.7l-0.3-0.1l-0.3-0.1l-1.2-0.7l0.5-1l-0.3-0.5L855,617l-0.6-0.5
                        l-0.1,0.3l-0.7,0.8l-0.3,0.1l-0.5-0.1l-0.1-0.3v-1l-0.1-0.5l-0.1-0.3l-0.3-0.3l-0.5,0.1l-0.1,0.3v0.5l-0.3,0.3l-0.5-0.6l-0.3,0.8
                        l-0.3,0.3l-1-0.3h-0.3l-0.5,0.3h-0.3l-0.3-0.1l-0.3-0.3l-0.6-0.1l-0.5-0.3l-0.3-0.1h-0.3l-0.5,0.3h-0.1l-0.3,0.3l-0.3,0.5l-0.3,0.5
                        l-0.3,0.3l-0.9,0.6l-1.8,0.8l-0.8,0.7l-0.7,0.7l-0.9,0.7l-0.8,0.3l-0.6-0.6l-0.5,0.3l-0.8-0.3l-0.9-0.3l-0.6-0.3l0.5,0.6l0.5,0.3
                        l0.5,0.3l0.5,0.5l0.3,0.5l0.3,0.5l0.1,0.6v1.5l-0.3,1.6l-0.3,0.7l-0.3,0.6l-1,0.9l-0.5,0.5l-0.3,0.5l-0.3,0.5l-0.5,0.3l-0.6,0.3
                        h-0.7l-1.4-0.6l-0.7-0.1l-2.2,0.3l-0.6-0.1H828l-0.3,0.1l-0.3,0.1l-0.3,0.3l-0.3,0.1l-0.3-0.1l-0.3,0.8l-0.8,0.6l-0.9,0.3l-0.8,0.3
                        h-0.5h-0.5l-0.5-0.1l-0.3-0.3l-1.2-1l-0.3-0.3l-0.1-1l-0.5-0.9l-2.1-3.2l-0.3-0.3h-0.3l-0.3-0.1l-0.3-0.3l-0.6,0.5l-0.3,0.3h-0.5
                        v0.3h0.4l0.3,0.3l0.3,0.3l-0.1,0.5l-0.3,0.3l-0.8,0.3l-1,0.9l-1.6,0.9l-0.5,0.7l-0.1,1l-0.1,1.2l-0.3,0.9l-0.9,0.3l-0.6,0.5l-0.1,1
                        l-0.1,1.2l-0.3,0.9v1l-0.6,1.5l-0.9,1.3l-0.8,0.6l-0.5,0.4l-3.1,1.7l-0.5,0.1l-0.3,0.3l-0.8,1l-0.3,0.3l-0.3,0.6l-0.5,0.5l-4,2.3
                        l-0.8,0.7l-0.3-0.3l-0.5,0.1l-0.5,0.3l-0.5,0.1l-1,0.6h-0.2v0.1l0.3,0.3l-0.6,0.3l-1.3,0.3l-1,0.8l-0.6,0.3l-0.5,0.5l0.3,0.5l1.5-1
                        l0.8-0.3v0.6h0.8h0.3l0.3-0.1l0.1-0.1l0.1-0.3l0.3-0.3l2.3-1.6l1-0.6l1-0.3h0.7l0.3-0.1h0.1l0.3,0.1l0.3-0.6l0.6,0.1l1.2,0.8
                        l-0.3,0.1l-0.3,0.1l-0.3,0.3l-0.1,0.3h0.5v0.3l-0.5,0.7v0.8l0.3,0.5l0.6-0.5l-0.1,1v0.3l-0.3,0.1l-0.5,0.1l-0.3,0.1l-0.1,0.3
                        l0.1,0.3l0.3,0.3l0.3,0.1h3.4v0.3l-0.6,0.1l-0.3,0.3l-0.4,0.6l-0.1,0.7l0.5-0.3h0.5l0.5,0.1l0.6,0.3l-0.3,0.3l-0.3,1l-0.5,0.8
                        l-0.1,0.1l-0.3,0.1h-0.3h-0.1l-0.1-0.1l-0.5-0.3l-0.9-0.3h-0.3l0.3,0.3l0.5,0.1l0.4,0.3l0.5,0.3h-0.3l-0.6,0.3l0.1,0.5l0.3,0.3h0.8
                        l0.3,0.1l-0.1,0.3l-0.3,0.3l-0.1,0.1h-0.1h-0.7v0.3l0.5,0.1l0.3,0.3v0.5l-0.3,0.5h0.6l-0.3,0.5l-0.6,0.1h-0.6l-0.5,0.3l1.8,0.7
                        l0.3,0.1l0.3,1l0.1,0.6l-0.3,0.3v0.3l-0.3,1.6l0.3,0.6l0.3,0.3l0.5,0.1l0.5-0.3l-0.1-0.1l-0.3-0.3l-0.3-0.1l0.3-0.7h0.3l0.5,0.3h0.6
                        l-0.3-0.5l0.5,0.3l1.3,0.9h0.3l0.3-0.1h2.1l0.3,0.6l-0.3,0.6l-0.9,0.9l-0.5,0.7l-0.5,1.4l-0.3,0.6l0.3,0.9l1.8-1l0.3-0.1l0.6,0.3
                        l0.8,0.7l0.5,0.3l0.6,0.3h0.6l0.5-0.3l0.3-0.5l0.5-0.3h0.3l0.3,0.6l0.3-0.8l0.7-0.1l0.7,0.3l0.5,0.5l0.1,0.3l0.3,0.7l0.1,0.3
                        l0.3,0.3l0.6,0.3l0.3,0.3l0.5-0.6v-0.7l-0.3-0.7l-0.3-0.5l-0.6-0.6l-0.3-0.3l-0.3-0.5l-0.1-0.3v-0.7l-0.1-0.5l1.2-0.7l0.3-1.2
                        l-0.1-1.5l0.1-1.6l0.5-0.8l0.6-0.3h1.4l0.3-0.1l0.1-0.3V664l0.1-0.3l0.6-1.2l1.5-2.3l0.3-0.3l0.3,0.1l0.3,0.3l0.3-0.3l-0.1-0.3
                        l-0.3-0.3v-0.3l0.3-0.6l0.5-0.3l0.3-0.5l0.1-0.8v-0.1l0.1-0.1l0.1-0.1V656v-0.1l-0.1-0.1v-0.1l-0.1-0.3l-0.3-0.3l-0.1-0.3l0.3-0.5
                        l-0.1-0.7l0.5-0.7l0.7-0.6l0.6-0.3l0.3,0.1l0.3,0.1l-0.1,0.6l0.2-0.1l0.6-0.8l0.3-0.3l0.3-0.1l0.3-0.1h0.5l0.7-0.1l0.7-0.3l0.5-0.5
                        l-0.1-0.6l1.9-1l1.3-0.3l1.2-1l0.6-0.3l1.3-0.3h1.3l4.9,1l1.2,0.5l1.6,1.5l1.3,0.7l0.6,0.5l0.3,0.6l0.6,1.2l1.5,1.9l0.3,0.3l0.7,0.3
                        l0.6,0.5l0.9,1l0.1-0.5v-0.5v-1l0.1-0.5l0.3-1l0.3-1.3l1-2.8l1.7-2.4l0.3-0.6l0.1-0.5l0.3-0.1h0.5l0.5-0.3l0.3-0.3l0.3-0.5v-0.5
                        l-0.3-0.3l0.6-0.7l2.4-1.3l2.2-1.9l0.7-0.3l0.3-0.1l0.7-1l1-0.6l0.3-0.1l0.8-0.1l0.9-0.3l0.8-0.6l0.3-0.7l-0.5,0.3L869,635.7z
                         M1084.3,426.8l-0.1-0.1l-0.8-0.8l-0.1-0.3l0.3-0.7l-0.1-0.3v-0.3l0.1-0.3l0.1-0.3l-0.7,0.1l-1.4,1.4l-0.1-0.5l0.1-0.6l0.3-0.8
                        l0.1-0.6l0.1-1.7l0.3-0.9l0.1-0.3l0.3-0.3l0.1-0.3V419l-0.1-0.3v-0.3l-0.1-0.3l-0.7-2.3l-0.1-0.5l-0.1-1.2l-0.1-0.3l-0.3-0.3
                        l-0.3-0.3l-0.3-0.7l0.1-0.3l0.3-0.5l0.1-0.3v-0.5l-0.1-0.5l-0.1-0.8l-0.3-0.3l-0.3-0.1l-0.3-0.3l-1.8-1.7l-0.3-0.6l-0.1-0.9l0.3-0.8
                        l0.6-0.5l0.3-0.5l-0.3-0.8l-0.3-0.3l-0.8-0.3l-0.3-0.3l-0.1-0.3l0.1-0.3l0.3-0.3l0.3-0.1l0.3-0.5l-0.3-0.9l-0.8-1.5l-0.6-0.7
                        l-0.3-0.3l-0.1-0.5l-0.1-0.3l-0.5-0.9l-0.3-0.1l-0.7-0.9l-0.1-0.3l-0.3-0.8l-0.7-1l-1.9-2.3l-1.3-1l-0.1-0.1h-0.6l-0.6,0.3h-0.3
                        l-1.2-1.3l-0.3-0.5l-0.1-0.5l-1.3-5.8l-0.6-6.7l-0.3-0.9l0.3-1.6l-0.3-4.1l0.3-1.4l-0.1-0.3l-0.1-0.3v-0.3v-0.3l0.6-2.5l0.3-0.3
                        l0.1-0.5l0.6-3.6l0.1-0.3l0.3-0.6l0.1-0.3l0.1-0.5v-0.5l-0.1-0.9l-0.3-0.1l-0.5,0.3l-0.5,0.6l-0.8,0.8l-1,0.6l-1.3,0.3h-1.4
                        l-1.4-0.6l-0.9-1l-0.8-1.2l-0.9-0.9l-1.7-1.4l-0.7-0.3l-1-0.1l-0.3-0.1l-0.3-0.3l-0.3-0.3l-0.3-0.3l-0.3-0.1l-0.7-0.3l-0.5-0.5
                        l-0.5-0.1l-0.3,0.8v0.3l0.3,0.1v0.3l-0.1,0.3l-0.3,0.3l-0.1,0.3l-0.3,0.9l-1.5,2.4l-0.1,0.3l-0.1,0.3l0.1,0.9v0.3l-0.7,0.9l-0.1,0.3
                        v0.8l-0.1,0.3l-0.6,1.3v0.8l-0.1,0.8l-0.3,0.8l-0.3,0.8l1,1.4l0.7,0.3l1.3-1l0.3-0.1l0.9-0.1l0.3-0.1l1-0.7l3.4-0.3l1.5-0.5l1-1.5
                        h-0.3l0.1-0.3l0.1-0.3l0.3-0.3l0.3-0.3l1.4,0.9l0.5,0.3l0.9,1.3l0.3,0.8l0.3,1.4v0.5l-0.1,0.5l-0.1,0.3l-0.5,0.6l-0.3,0.3l-0.1,0.8
                        v2.5l-0.1,0.8l-1.6,3.9l-0.5,0.7l-0.6,0.3l-0.7-0.1l-0.6-0.3l-0.6-0.3l-1.6-1.5l-0.7-0.5l-0.6-0.3l-1.3-1.6l-0.5-0.5l-0.6,0.3
                        l-0.3-0.1h-0.3l-0.5,0.7l-0.3,0.8v0.6l0.3,0.5l0.3,0.7l-0.8,1.4l-0.9,1.3l-1.2,0.6l-1.5-0.3l-1-1l-0.6-1.5l-0.6-4.3l-0.3-1.3
                        l-0.1-1.2l-0.1-0.8v-0.5l0.1-0.3l0.5-0.8l0.1-0.3l-0.3-1.6l-1-0.9l-1.3-0.3l-1.2,0.3l-0.6,0.5l-0.6,0.3h-0.7l-0.7-0.5l-0.8-1
                        l-0.5-0.5l-1.3-0.6l-0.3,0.1l-0.3,0.9l-0.1,0.5v0.5l0.1,0.3l0.3,0.9l-0.3,0.9l-0.7,0.5l-0.7-0.3l-0.5,0.3l0.3,0.6l1.2,0.8l0.3,0.7
                        l0.1,0.9l0.3,0.6l1.2,0.7l-0.3,0.5l0.3,0.9l-0.3,0.3l-0.3-0.1l-0.3-0.3l-0.3-0.3l-0.3-0.5l-0.3,0.3l-0.3,0.5l-0.1,0.3v0.5v0.9
                        l-0.3,0.7l-0.3,2.4l-0.8,2.4l-0.3,0.7l-0.6,0.5l-1.7,0.7l-1.2,1l-0.6,0.1l-1.8-0.6h-0.7l-0.6,0.3l-0.3,0.6l-0.1,0.9l-0.3,0.7l-3,2.5
                        l-0.6,0.7l-0.1,0.7l0.6,0.6l1.4,0.7l0.3,0.7l0.3,0.7l0.1,1.6l-0.1,1.7l0.1,0.6l0.3,0.7l1.6,1.8l0.3,0.7v4.9l-0.1,0.3l-0.6,0.7
                        l-0.1,0.5l0.3,1l-0.3,0.9l-2.2,4.6l-1,1.2l-1.4,0.6l-0.7-0.1l-1.7-0.5l-1-0.8v0.6l0.3,0.9l0.3,0.7l-0.5,0.3l0.1,0.5l0.6,0.8l0.3,0.5
                        l0.3,1l0.3,0.3h1.9l0.6-0.1l0.3-0.3l0.3-0.5l0.3-0.5l1.3-0.3l1.3,0.7l1.2,1.2l0.7,1l0.6,1.5l0.3,1.6l0.3,1.7l0.1,1.7l-0.5,6.8
                        l-0.7,3.2l-1.2,2.8l-0.5,0.5l-1.6,1.3l-0.1,0.6l-0.6,1.6l-0.1,0.8l-0.1,1.5l-0.1,0.7l-0.3,0.7l-0.3,0.6l-0.2,1.7l-0.1,0.7l-2.7,8
                        l-0.8,1.4l-0.9,1.3l-2.1,2.3l-1,1.4l-0.9,1.5l-1.5,3.7l-1.2,2.1l-0.6,1.6l-0.3,1.4l-0.9,7.7l-0.3,0.7l-0.5,0.7l-3.1,3.4l-2.1,1.6
                        l-9,4.6l-2.1,1.8l-1.5,2.4l-1.3,4.7l-0.6,1.4l-0.8,1.2l-2.1,2.2l-0.8,1.3l-0.7,1.5l-0.7,1.2l-0.8,0.9l-2.3,1.5l-3.9,3.9l-2.2,1.7
                        l-1,0.6l-0.6,0.3l-3.4,0.1l-0.5,0.3l-0.7,0.7l-1.9,1.5l-2.7,1.2l-2.8,0.8l-3.4,1.7l-4.7,1.3l-2.2,0.8l-0.7,0.8v0.3v1.3v0.3l-0.3,0.7
                        v0.3l-0.3,0.7l-0.6,0.7l-1.2,1l-1.2,0.5l-1.5,0.1l-1.5-0.3l-1.3-0.3l-2.5-1l-1.2-0.7l-0.8-1l-0.1-1.3l1.3-3.1l0.3-1.5v-2.8l-0.3-0.7
                        l-0.5,0.5l-0.8,1.4l-0.7,0.3l-0.6-0.3l-0.9-1l-0.6-0.1l-0.6,0.3l-0.6,0.1l-0.3-0.8l0.3-0.5l0.3-0.5l0.1-0.3l-0.3-0.5l1.5-2.1v-0.8
                        l0.1-0.3l0.3,0.3l0.6,0.6l0.6,0.1l1,0.5h0.6l0.5-0.3l1.4-1.6l0.3-0.8l0.3-0.8l0.6-0.3h2.1l0.6-0.1l0.5-0.3l0.3-0.3l0.3-0.5l0.3-0.7
                        l-0.3-0.6l-0.8-0.9l0.3-0.5l0.3-1l0.3-0.3l0.5-0.3h0.5l0.5,0.1h0.3l0.9-0.3l0.1-0.7l-0.1-0.8l0.3-0.9l-1.2-1l-1.7,0.3l-4.3,1.7
                        l-0.7,0.5l-0.3,0.5l-0.3,0.3l-3.9,1.8l-0.5,0.1l-1.8,0.1l-0.5,0.1l-1.3,0.6l-1,0.8l-0.7,1l-0.3,1.4v0.8l-0.1,0.3l-0.3,0.3l-0.3,0.3
                        L927,515v0.5l-0.3,0.7l-0.3,0.7l-0.1,0.8l0.3,0.9l0.8-0.5l0.3,0.6v1.8l0.3,1l0.8,1.7l0.3,1v0.8v0.5l-0.3,0.7l0.1,0.5l0.3,0.3
                        l0.1,0.3l-0.1,0.8l-2.1,5l-1.4,2.5l-6.4,8.1l-1.3,2.2l-0.5,0.3l-0.6,0.3l-1.4,0.9l-2.5,2.8l-2.1,0.5l-0.3,0.3l-0.3,0.1l-0.1,0.3v1.3
                        l-0.1,0.3l-0.3,0.1l-0.3,0.3l-1.9,2.2l-0.5,0.8l-0.3,0.8l-0.3,1.5l-0.5,0.6l-0.6,0.5l-0.5,0.6l0.3,0.6l0.9,1l0.3,0.6l0.1,0.9
                        l0.3,0.6l2.3,3.1l0.3,0.6v0.6l-0.3,1.5l-0.3,0.7v0.3l0.1,0.7v0.3l-0.3,0.3h-0.6l-0.3-0.7v-1.3l-0.6-1.2l-1,0.3l-0.7,0.9l0.5,0.8
                        l-0.3,0.5v0.3l0.1,0.7l0.3,0.5v0.3l-0.3,0.1l-1.9,0.3l-1-0.1h-0.3h-0.3l-0.1-0.1l-0.1-0.3l-0.3-0.6l-0.1-0.1l-0.3,0.1v0.3l0.3,0.3
                        l0.1,0.1l0.1,0.5l0.3,0.3l0.3,0.3l0.1,0.3l-0.1,0.5l-0.3,0.1h-0.3l-0.3-0.1v0.5l0.1,0.3l0.3,0.3l0.3,0.1l-0.7,0.5l-0.6-0.3l-0.6-0.5
                        h-0.6l-0.3-0.5l-0.3-0.3l-0.8,0.1l-0.3,0.3l0.3,0.5l0.6,0.8l0.7-0.3l0.3,0.5l-0.3,0.7l-0.6,0.5h-0.3h-2.7v-0.3l0.3-0.3l0.5-0.6
                        l0.5-0.6l0.1-0.3l-0.5-0.3l-0.6,0.3l-0.9,0.8l-0.3,0.1l-0.6,0.3l-0.3,0.1h-0.3h-0.8l-0.6-0.3l-0.1-0.5l0.1-0.7v-0.7l-0.3,0.6
                        l-0.3,0.3l-0.3,0.1h-0.3v-0.1v-0.3l-0.1-0.3l-0.3-0.3l-0.3-0.5l-0.1-0.5l0.1-0.5h-0.5l-0.3,0.3l-0.3,0.3l-0.3,0.3l-0.3,0.1h-0.8
                        l-0.3,0.1l-0.5,0.7l0.3,0.8l0.6,0.5l0.8-0.3v0.9l-0.3,0.3l-0.5-0.1h-0.6l-0.5,0.3l-0.5,0.6L887,579l-0.3-0.5v-0.3l0.3-0.7l0.1-0.3
                        v-0.5l-0.1-0.1l-0.1,0.1h-0.1l-2.1-1.3l0.3-0.1l0.3-0.1l0.3-0.1h0.3l-0.3-0.5l-0.1-0.3v-0.3l-0.5,0.3l-0.3,0.3l-0.3,0.5l-0.1,0.7
                        l-0.1,0.3l-0.3-0.1l-0.1-0.5l0.1-0.7l0.3-0.6l1-1.3l0.3-0.3l0.1-0.6l0.3-0.6l0.5-0.3l0.5,0.1l0.3-0.5v-0.6l-0.3-0.8l-0.5-0.7
                        l-0.5-0.3l-0.6-0.1l-0.5-0.3l-0.6-0.3l-0.8,0.1l-1.7,0.9l-0.6,0.1l-0.6,0.3l-1,1.2l-0.5,0.3l-0.6,0.3l-0.7,0.1l-0.3,0.1l-0.5,0.5
                        l-0.3,0.1l-0.3,0.1l-0.6,0.5l-0.3,0.1h-0.3l-0.6-0.3h-0.3l-1,0.3l-0.3-0.1l-0.3-0.3l-0.3-0.3l-0.3-0.1h-0.3L869,572l-1.2,0.3
                        l-0.6,0.1l-2.8-0.5l-0.7,0.1l-1.3,0.7l-1.3,0.3l-1.9,0.8h-0.3h-0.3l-0.3,0.1l-1.5,0.9l-0.5,0.6l-0.3,0.3l-0.3,0.1l-4.7,0.9h-3.7
                        l-4.9,0.8l-2.5-0.1l-2.7-0.8l-1.4-0.3l-1.4,0.3l-0.5,0.3l-1.2,0.7l-0.9,0.9l-1,0.3l-0.6,0.3l-0.8-0.3l-1.2-0.3l-1-0.5l-0.5-0.8
                        l-0.1-0.5l-0.3-0.5V576l0.5-0.5l0.5-0.1h0.5l0.3-0.1l0.3-0.5l-1.3,0.1l-0.6,0.1l-0.6,0.3l-0.1-0.1l-0.3-0.3l-0.1-0.1l-0.1,0.3
                        l-0.3,0.1l-0.1,0.3l-0.6-0.3h-1.2l-0.6-0.1l-0.6-0.3l-0.3-0.3l-0.3-0.1l-0.3,0.6v-0.3L821,575l-0.5,0.6l-0.5,0.6l-0.6,0.3h-0.8
                        l-0.3,0.1l-0.1,0.3l-0.1,0.5l-0.3,0.1h-2.7l-0.3,0.1l-0.3,0.3l-1.6,0.7l-0.5,0.1h-0.1h-0.3l-0.3,0.1l-0.3,0.3l0.5,0.3l-0.5,0.1h-1.3
                        l-0.5,0.1l-0.6,0.3l-0.6,0.3l-0.3,0.5l0.3,0.3l0.8,0.5l0.3,0.1l0.3,0.3v0.5l-0.3,0.8l-0.1,0.8l-0.3,0.8l-0.3,0.7l-0.3,0.5l-1.8,0.9
                        l-0.5,0.1L806,587l-1.2,1l-0.6,0.3l-2.1,1.5l-0.3,0.3l-0.3,0.9l-0.1,0.3l-0.8,0.8l-1.4,2.1l-0.6,0.6l-0.6,0.3l-1.3,0.3l-0.6,0.3
                        L795,597l-1,0.5l-0.6,0.6l-1.2,1.4l-0.3,0.7l-0.3,0.5h-0.7l-0.3,0.3l-0.7,1l-1.7,1.9l-0.6,0.5l-0.7,0.1v0.1l-0.7,0.6l-0.1,0.1
                        l-0.1,0.3l-0.1,0.8l-0.1,0.3l-0.5,0.3l-1.4,0.3l-1,0.1l-1.3,0.3h-0.7l-0.6,0.6l-0.3,0.3l-0.8-0.3l-0.5,0.1l-0.5,0.3l-0.3,0.3
                        l0.3,0.3v0.3l-0.3,0.3L777,610l-0.1,0.3v0.3l-0.1,0.3l-0.5,0.6l-0.5,0.5l-1.2,0.8l-0.6,0.1l-0.3,0.1l0.3,0.7l-0.1,0.3l-1.6,1.4
                        l-0.1,0.3l0.5,0.6l-3.8,1.4l-1.4,0.1l-0.3,0.1l-0.3,0.3l-0.3,0.1l0.1-0.6l0.1-0.5l0.3-0.5l0.3-0.3l0.3,0.3l0.3,0.1h0.3l0.3-0.1
                        l-0.3-0.6L768,616h-0.3l-0.8,0.1l-0.5,0.1l-0.6,0.1v0.3l0.1,0.3l0.1,1.2l-0.1,0.3h-0.6l-0.3-0.3l-0.5-1l-0.3-0.3l-0.3,0.1l-0.7-0.3
                        l-0.3,0.1l-0.3,0.3l-0.5,0.1h-0.5h-0.3l-0.3-0.1l-0.3-0.3l-0.3-0.3l-0.5-0.1l-0.5,0.1l-0.3,0.3l-0.3,0.3l-0.1,0.5l0.3,0.1l0.1-0.1
                        l0.3-0.3l0.3,0.1l1.2,0.3l0.1,0.5l0.1,0.1l0,0l-0.5,0.3l-1.3,0.3l-0.3,0.1l-0.3,0.3l-0.5,0.1l-0.5-0.1l-0.3-0.1l-0.3,0.5l-0.1,0.5
                        l0.1,0.6l-0.1,0.3l-0.3,0.3l-0.1,0.3l0.1,0.3l0.5,0.3v0.1l0.1,0.5l0.5,0.7l0.1,0.9l0.1,0.3l0.1,0.3l-0.1,0.5l-0.3,0.6L758,626
                        l-0.3,0.3l-0.3,0.3l-0.3,0.6v0.3l0.3,0.3l0.1,0.5l0.1,0.3l0.7,0.6l0.1,0.3l-0.1,0.5l-0.1,0.3v0.3l0.3,0.5l-0.3,0.5v0.7l-0.3,0.6
                        l-0.6,0.3v0.3l0.5,0.3l0.1,0.3l0.3,0.1l0.5-0.3l1.4-1.5l1.2-1.7l0.8-0.6h1l0.5,0.3l1.2,1.2l0.9,0.5l0.3,0.1v0.1v0.3l0.1,0.6v0.3
                        l0.1,0.3l0.1,0.1l0.3-0.1l0.3-0.1l0.1-0.3v-0.3l0.3-0.1l0.3-0.1h0.1v0.3l0.1,0.3l0.3,0.1h0.3l0.3-0.1l0.3,0.5l0.5-0.1l1.5-0.9
                        l0.3-0.3l0.7-0.9l0.8-1.5l0.3-0.3l0.3,0.3l0.1,0.6L773,631l-0.3,0.5l0.3,0.1h0.3l0.3-0.3l0.1-0.3l0.1,0.3l0.1,0.3l0.3,0.3h0.3
                        l0.3-0.1v-0.3v-0.1l0.1-0.1v-0.3l0.3-0.3h0.1l0.1-0.3v-0.3l-0.1-0.3l0.3-0.3l0.3,0.1l0.5,0.6l0.3,0.1l0.9,0.3v-0.1l0.1-0.1h0.3
                        l0.1,0.3v0.3v0.1h0.1h0.3l0.5-0.3l0.1-0.3l-0.1-0.5l-0.3-0.3l0.3-0.3h0.1l0.1,0.3l0.1,0.1h0.8l0.3-0.1l0.9-0.3l0.3-0.3l0.5,0.1
                        l1.2-0.5l0.7,0.3l-0.3,0.1l-0.3,0.3H783v-0.1h-0.7h-0.1h-0.3l-0.1,0.1l0.3,0.3l0.3-0.1l0.1-0.1h0.1l0.3-0.3l0.1-0.1l0.3-0.3l0.8,0.3
                        l0.5,0.3l0.3,0.1v0.3l-0.5,0.5l-0.9,0.7l0.1,0.6l0.3,0.3h1v-1.6h-0.5l0.6-0.8l0.6-0.1l0.6,0.3l0.7,0.6l0.3,0.1l0.8,0.3l0.3,0.3
                        l0.7,1l0.1,0.1l0.7,0.1l1.8,0.7l0.6,0.3l0.3,0.3l0.3,0.3l0.3,0.3l0.1,0.6l-0.1,0.6l-0.3,0.3h-0.5l-0.3-0.3v0.3l-0.3,0.6l-0.1,0.1
                        l-0.6,0.5l-0.1,0.6h0.5l0.6-0.3l0.9-0.8l1.3-0.7l0.3-0.5v-0.6l-0.6-1.3v-0.6v-0.9l0.3-0.3l0.5-0.1l0.7-0.3l0.9-1.2l-0.1-1.3
                        l-0.3-1.4l0.1-1.5l0.3-0.6l0.3-0.3l0.3-0.3l0.1-0.8l-0.1-1.3l-0.3-0.7l-0.2-0.4l2.7-3.1l1-0.8l1.2-0.6l0.7-0.1l1,0.7h0.5l0.6-0.3
                        l0.5-0.3l0.6,0.3l0.3,0.3l0.1,0.3h-0.3l-0.3,0.1h-0.3l0.1,0.5v0.3l-0.1,0.3v0.5l0.1,0.1l0.5,0.5l0.3,0.9l0.6,0.5l0.3,0.5l-0.5,0.5
                        l0.3,0.5h0.3l0.8-0.5l0.1-0.1l0.1-0.3l0.1-0.1l0.3-0.1v0.1l0.1,0.3l0.1,0.3l0.1,0.1h0.8l1.4-0.9l0.7-0.3h0.9l0.5-0.1l0.3-0.3
                        l-0.1-0.3l-0.3-0.3v-0.3l0.5-0.1l0.6-0.3l0.6-0.7l0.6-0.3l0.5,0.8l0.9-0.6l0.8-0.3l3.1-0.3l1.3-0.3l0.8-0.7l-0.3-1.2l0.5-0.3
                        l0.3,0.1h0.3h0.3l0.3,0.1l0.6,0.3l0.5,0.3v0.3l-0.6,0.1l-0.5,1.2l-0.6,0.1l0.1-0.5v-0.6l-0.1-0.3l-0.3,0.3l-0.5,0.7l-0.3,0.3h-0.1
                        v1.4l0.1,0.6l0.5,0.3l0.2-0.1l0.7-0.7l0.6-0.3l0.3-0.3l0.1-0.1l0.1,0.1l0.3,0.3l0.3,0.1l0.5-0.3l0.3-0.7l-0.3-0.7l-0.6-0.5l0.3-0.5
                        l0.6-0.3l0.5-0.5l0.5-1.7l0.6,0.3l0.3,0.7l-0.6,0.5v0.3h0.7l0.6,0.3l0.3,0.5l-0.3,0.6l-0.3,0.1l-0.3,0.1l-0.3,0.1l-0.1,0.3l0.1,0.3
                        h0.3l0.5-0.1l0.9-0.5l0.5-0.3l2.1-2.8l0.3-0.7l-0.3-0.3l0.1-0.6l0.3-0.3h0.8l0.3-0.1l0.7-0.5l0.3-0.1l0.7,0.3l-0.3,0.7l-1.2,1.4
                        l1.8-0.8l0.1-0.1l0.1-0.1l0.3-0.1l0.6-0.1l0.3-0.1l0.3-0.3l0.1-0.3l0.3-0.3l1.3-0.7l0.8-0.3l0.5-0.3l0.5-0.3l0.5,0.3l0.3-0.3
                        l0.1,0.3l0.1,0.3l0.3,0.1l0.3-0.1l0.7,0.7l0.3,0.9l0.5,0.7l0.9,0.3l-0.1-0.9h1.1l2.3,0.5l0.6-0.8l0.3-1.2l0.5-0.8l0.8,0.3l-0.1-0.3
                        v-0.1l-0.1-0.1l0.3-0.3l0.5-0.3l0.3-0.5v-0.6l-0.3-0.5l-0.5-0.1l-0.6,0.1l-0.5,0.3l-0.8,0.9l-0.5,0.3l-0.3-0.3l-0.1-0.6l0.3-0.3
                        l0.6-0.3l0.8-0.5l0.5-0.1h1l0.6,0.1l0.7,0.7l0.5,0.1l0.9-0.1l1-0.5l0.8-0.6l0.3-0.8l-0.3,0.1h-0.3h-0.1l-0.3-0.1l0.5-0.3l0.3-0.1
                        l0.6-0.1l0.5-0.3l0.3-0.1l0.1-0.1l0.6-0.8l0.3-0.1l0.6-0.1l0.3-0.1l-1.5-0.3l-0.3-0.1l-0.3-0.6h0.3l0.8,0.3l0.8,0.1l1.5,0.3h0.8
                        v-0.5l0.1-0.3l0.3-0.3l0.3-0.1l0.3,0.1l0.3,0.3l0.3,0.3h0.5l0.3-0.3l0.8-1l0.1-0.1h0.1h0.1v-0.3v-0.3l0.1-0.3l0.3-0.1l0.3-0.1v0.5
                        l0.1,0.3l0.3,0.1h0.3h0.3l0.3-0.1l0.3-0.1l0.1-0.1l0.3-0.1h0.1l0.1,0.1l0.3,0.1l3.8-0.3l1.4,0.3l0.6,0.3l1.2,0.9l0.9,0.3l1.6,1
                        l0.9,1l0.6,0.5l0.6,0.3l0.6,0.1l1.9,0.7l1.2-0.1l1.5-0.3l1.3-0.6l0.3-0.7l2.7-1l0.3-0.3l0.5-0.5l0.3-0.1h0.3l0.3,0.1l0.9,0.6
                        l0.3,0.1h0.3h0.6l1,1.8l0.1,0.7l-0.3,0.5l0.5,1l-0.1,0.9l-0.5,0.8l-0.8,0.8l-0.1,0.1l-0.1,0.1h-0.3l-0.1,0.1v0.6l-0.1,0.3l-3.2,3.4
                        l-0.5,0.3l-0.7,0.3l-3.8,1.6l-1,0.9l0.3,1.2l0.6,0.3l0.6,0.3l0.5,0.3l0.3,1.5l0.5,0.3l0.5,0.3l0.3,0.6l-0.1,0.5h-1l-0.6,0.3v0.1v0.3
                        v0.3l-0.1,0.1l-0.3,0.1h-0.1l-0.6,1.3h0.5l0.7,0.3l0.6,0.3l0.3,0.3v0.5l-0.3,0.6l-0.3,0.5l-0.3,0.1l-0.5,0.1l-0.5,0.3l-0.3,0.3
                        l-0.1,0.6l0.5,0.5l0.1,0.3l-0.5,0.1l-0.3,0.1v0.3l0.1,0.7l-0.1,0.1h-0.5l-0.3,0.1l-0.1,0.3l0.3,0.3h0.5l0.9-0.3l0.6,0.3l0.3,0.3
                        l0.6,1l0.7,0.8l0.8,0.8l0.6,0.3l0.8,0.6l0.8,0.5l0.8,0.1l0.5,0.3l1.5,1.2l0.3,0.5l-0.5,0.6l-0.8,0.1l-0.6,0.3l0.3,0.8l0.1,0.1
                        l0.5,0.1h0.1l0.1,0.3l0.3,0.7l0.1,0.3v0.5l0.1,0.5l0.3,0.5l1,0.8l1.3,0.6l4.5,1.4l0.9,0.1l2.8,1l0.1,0.3l-0.3,0.5v0.3l0.3-0.1
                        l0.6-0.3l0.3-1.2l0.1-0.3l0.1-0.3l0.3-0.1l0.5-0.3l1.7-1l0.5-0.1l0.5-0.3l1.2-1.3l0.3-0.3l-0.7,0.3v-0.5l0.5-1.2l0.1-0.6l0.6-0.3
                        l0.3-1l1-1.5l1.6-4.3l0.6-1l0.7-0.5h0.3l0.1-0.1l0.3-0.5l0.3-0.3l0.1-0.1l1-0.1l0.3-0.3l0.1-0.6l0.5,0.3l0.3-0.3l-0.3-0.5l-0.7-0.1
                        v0.3l0.5-0.3l0.3-0.5l0.3,0.3l0.3,0.3l0.3,0.3l0.5-0.3l0.1-0.3v-0.9v-0.3l0.1-0.3l-0.3-0.3l-0.6-0.6l-0.1-0.5l-0.3-0.3l-0.3-0.1H914
                        v-0.3l0.3-0.3l0.5-0.8l0.3-0.3l0.3,0.1l0.3,0.7l0.3,0.1h0.3l0.3-0.1l0.3-0.1l0.1-0.1l0.1-0.5l-0.1-0.3l-0.3-0.1l-0.3-0.3v-1l1.2-1
                        l1.4-0.7h0.9l0.3-0.3l1.3-0.9l0.9,0.3h0.3l-0.3-0.6l0.3-0.3l0.1-0.3l0.1-0.5h0.3l0.8,0.5v-0.3l0.1-0.1l0.1-0.1l0.3-0.3l0.6,0.6h0.5
                        l0.5-0.3l0.9-0.5l0.3-0.5v-0.5l-0.6-0.1l0.8-0.5l0.9-0.3l0.5,0.1l-0.5,0.7l-0.1,0.6l0.7,0.1l0.9-0.3l0.5-0.5l1,0.7v-0.3v-0.1V618
                        l-0.1-0.3l0.6-0.1l0.6,0.1l0.3,0.5l-0.3,0.8l-0.3-0.3l0.1,0.3v0.3l0.1,0.3l-0.3-0.3l-0.6-0.3l-0.6-0.1l-0.5,0.1v0.3l0.6,0.3l0.7,0.3
                        h0.5l0.5-0.1l1-0.3l0.3-0.3l0.1-0.6l-0.1-0.7l-0.3-0.6l-0.3-0.3l0.1-0.3l0.3-0.3l0.5-0.5h-0.3l-0.3-0.1l-0.3-0.3l-0.1-0.3l0.3-0.3
                        l0.3-0.1h0.3l0.3,0.3l0.3-1.3v-0.3l-0.3-0.3H934h-0.3l-0.3-0.1l-0.3-0.3l-0.1-0.3v-0.3l-0.3-0.5l-0.3-0.3l-0.3-0.1h-0.5l-0.3,0.1
                        l-0.3-0.3l-1.5-0.7l-2.2-1.5l-0.5-0.5l-0.5-0.5l-0.5-0.3l-0.6-0.3H924l-0.5-0.3l-0.3-0.5v-0.3l0.1-0.5v-0.5l-0.3-0.3l-0.1-0.1
                        l-0.3-0.6l-0.1-0.1l0.1-0.8l0.1-0.7l0.6-1.4l0.7-1l1.7-2.1l0.6-1.4l0.1-0.8v-0.8l-0.1-0.3l-0.3-0.3v-0.3v-0.3l0.1-0.3v-0.3l0.3-0.6
                        l0.7-0.6l1.4-0.9l0.6,0.1l0.7-0.3l1.4-1l0.6-0.3l0.1-0.1l0.3-0.3h0.1l0.1,0.1h0.3h0.3h0.3l0.3-0.3l-0.1,0.6l0.3,0.9l-0.1,0.7
                        l-0.3,0.3l-0.7,0.9l-0.6,0.5l-0.3,0.6l-0.3,0.7l-0.1,0.6v0.7l0.3,1.2l0.1,0.5l0.3,0.3l0.3,0.5l0.3,0.6l-0.1,0.6l-0.3,0.5l-0.1,0.6
                        v0.7l0.1,0.6l0.6,0.6l1,0.7l1.2,0.5l0.9,0.3l-0.3-0.7l-0.3-0.6l-0.7-1l-0.3-0.6l-0.1-0.6l0.1-1.8l0.1-0.6l0.3-0.6l0.6-0.8l0.3-0.9
                        l0.3-0.5l0.1,0.9v2.6l0.3,0.6l0.3,0.3l0.3,0.9l0.3,0.3l0.5,0.1l0.8-0.1l0.8,0.3l1-0.5h0.3l0.3,0.1h0.5l0.5-0.1l0.3-0.3l0.3-0.3
                        l0.1-0.3l0.3-0.3l0.5-0.1l0.8,0.1l0.3-0.1l0.5-0.3l1,0.9l0.3,0.3l0.1,0.3l0.1,0.7l0.1,0.6l0.1,0.3l0.1-0.1v0.1l0.1,0.1v0.1l-0.3,0.1
                        h-0.3h-0.5h-0.3l-1.3,0.7l-0.8,0.3l-1.4,0.8l-0.8,0.3l-0.5,0.3l-0.3,0.5l-0.3,0.5l-0.1,0.3l-0.5-0.1l-0.3-0.3l-0.1-0.3l-0.3-0.1
                        l-0.8,0.1l-0.5,0.7l-0.3,0.8l-0.5,0.3l-0.1,0.1l0.3,0.3l0.3,0.3l0.3,0.1l2.5-0.3l5.9-2.2l2.5-0.6l3.9-0.3l0.9-0.5l0.9,0.6l4.8,0.8
                        l4.5-0.6h1.2l1.2,0.3l4.9,1.9l1.3,0.1v-0.3l-0.5-0.3l-0.5-0.6l-0.3-0.7l0.3-0.7l1.3-2.4l0.3-0.3l1.8-1.5l0.3-0.6l0.1-0.3l0.1-0.3
                        v-0.3l-0.3-0.7v-0.3l0.3-0.7l0.5-0.5l0.6-0.5l0.5-0.5l0.3-0.3l1.7-0.8l0.3-0.3l1.7-0.9l0.5-0.8l-0.3-0.3l-0.6,0.3l-0.6,0.3l0.1-0.7
                        l0.3-0.5l0.8-0.9l1-1.7l0.5-0.3l1.3-0.1l0.6-0.1l0.6-0.3l1.3-0.3l1.3,0.1l1.3,0.5l1.2,0.7l1.9,2.1l-0.5,0.3l-0.5,0.3l-0.6,0.1
                        l-0.7,0.1h-1.4l-0.5,0.3l-0.3,0.8l-0.1,1.2l0.1,0.5l0.1,0.3l0.3,0.6l0.1,0.3l-0.5,0.3l-0.3,0.3l-0.1,0.5v0.7l0.1,0.1l0.1,0.1
                        l0.1,0.3l0.1,0.3l0,0l-0.1,0.9v0.7l0.3,1v0.3l-0.3,0.5l-0.3,0.3l-0.3,0.3v0.7l0.1,0.3l0.3,0.1l0.3,0.1l0.3,0.3l0.1,0.3l0.3,0.9
                        l0.3,0.3l0.3,0.5l0.5,0.3l0.5,0.3l1-0.1l1-0.6l1.6-1.7l0.1,0.3l0.3,0.3h0.3l0.3-0.3l-0.3-0.6v-0.7l0.1-0.7l0.3-0.5l0.1-0.3l0.3-0.6
                        l0.3-0.3l0.3-0.1l0.5-0.1l0.3-0.1l0.6-0.8l0.3-0.6l0.1-0.6v-0.6l0.1-0.5l0.3-0.3l0.5-0.1l0.8-0.6l0.3-1.3l-0.1-1.3l-0.3-0.8
                        l-0.8-0.7L998,593v-0.7l0.3-0.9l-0.1-0.3l-0.5-0.3l0.6-1.9l0.5-0.7l0.9-0.3l-0.5-1.7l0.6-1.5l1.2-1.2l1.3-0.8l1.2-0.5l1.3-0.3
                        l2.7-0.3l1.4,0.1l0.7,0.3l0.5,0.3l0.3,0.1h0.7h0.3l0.3,0.3l0.1,0.3l0.1,0.3l1.5,2.4v0.3l0.1,0.3v0.5l-0.3,0.7v0.5v0.1h0.1l0.7,0.1
                        l0.5-0.3l0.3-0.1l0.3-0.1l-0.1-0.3l-0.3-0.3l-0.1-0.3l0.3-0.7l0.6-0.5l1.2-0.7v-0.1v-0.1v-0.1l-0.1-0.1l0.6-0.6l-0.6-0.3l-0.9-0.3
                        l-0.5-0.7l-0.3,0.1l-0.1,0.1l-0.3-0.5l-0.1-0.6V581l0.1-0.5l0.1-0.6l-0.5-1l0.1-0.5l0.5-0.3l0.5,0.1h0.3l0.1-0.5l-0.1-0.3l-0.3-0.3
                        l-0.3-0.3l-0.3-0.3l-0.1-0.6l0.7-0.3l0.9-0.1l0.7-0.3l0.5-0.3l1-0.5l0.3-0.5v-0.5l-0.3-0.5l-0.6-0.8l0.3-0.6l-0.1-0.8v-0.8l0.6-0.5
                        l0.1,0.6l0.3,0.1l0.6-0.1h0.5l0.3-0.1l0.3-0.3l0.3-0.5l0.5,0.7l0.3,0.3l0.3,0.1l0.5-0.3l0.3-0.3l0.3-0.5l0.3-0.3l0.3-0.1h0.5l1,0.1
                        l0.9,0.5h0.1l0.3-0.3l0.5,0.6l0.3,0.6l0.3,0.6l0.1,0.7l0.3,0.1l0.6,0.6l0.3,0.6l-0.3,0.3l-0.6,0.3l-0.8,1.2l-0.8,0.6l-0.9,1.2
                        l-0.3,0.3l-0.5,0.1l-1.3,0.6l-0.5,0.3l-0.3,0.6l0.3,0.9l-0.1,0.7l-0.3,0.5l-0.5,0.3l-0.6,0.1l-0.6,0.3l-0.8,0.5l-0.5,0.3l-0.7,0.1
                        v0.3l1.5,0.6l0.5,0.5l0.8,1.8v0.3l-0.3,0.5l-0.3,0.3l-0.8,0.6l-0.3,0.3l0.3,0.7l0.1,0.6v1.3l0.1,0.3l0.3,0.7l0.1,0.5l-0.1,0.3
                        l-0.3,0.3v0.3l0.6,0.3l0.3,0.3l0.1,0.5l-0.1,0.3l-0.3,0.1h-0.6l-0.1,0.1l-0.3,0.3l-0.3,0.1l-0.3,0.1h-0.6l-0.3,0.1l-0.3,0.1l0.3,0.5
                        l1.4,1.2l0.3,0.3l0.1,0.3l0.1,0.1l0.3,0.1h0.3h0.3h0.7l1.2-0.3l0.6-0.3l0.3-0.5v-0.3l0.1-0.7v-0.5l0.1-0.5l0.5-0.7l0.1-0.3l0.3-0.3
                        l1.7-1l1.2-0.3l0.5-0.5l0.3-0.8l0.3-0.5l0.7-0.3l1.9,0.1h0.5l0.5-0.1l0.6-0.3h0.3l0.7-0.1l0.7-0.3l0.3-0.3l0.3-0.7l0.5-0.3l0.6-0.3
                        l0.6-0.3l0.5-1.2v-1.5l-0.3-1.4l-0.3-1v-3l1.2-2.8l1.7-2.4l3.7-3.4l1.2-0.6l2.1-0.3l1.2-0.3l0.8-0.1l0.6-0.3h0.3l0.3,0.1l0.7,0.3
                        h0.3l0.1-0.3v-0.6l-0.1-0.5l-0.1-0.3l-0.3-0.1l-0.3-0.1l-0.3-0.3l-0.3-0.7l-1.3-1.7l-5.2-9l-0.6-1.4l-0.6-2.3l-0.3-3.1l-0.1-0.5
                        l0.5-0.7l1-2.1l0.3-0.9v-0.6l-0.3-1.4v-0.6l0.3-2.7l0.5-1.3l1.6-2.8l1.4-5.5l0.3-0.6l1.3-1.9l0.3-0.7v-0.7l0.1-0.5l0.3-0.3l0.3-0.1
                        l0.5-0.5l0.7-0.3l0.9-0.7l0.8-0.1l0.3-0.1l1-1l0.5-1.3l0.3-3.2l0.6-1.3l0.1-0.3v-3.4l0.3-0.5v-1.2l0.6-2.8l0.3-1.2l-0.3-10l-0.1-0.3
                        l-0.5-0.6l-0.1-0.3v-0.3l0.3-0.5l0.1-0.3v-0.4l-0.1-0.5l-0.3-0.3l-0.5-0.5l-0.7-1l-0.5-1.3l-0.6-2.7l-0.3-2.8v-1.6l0.3-1.6l1.2-4.5
                        l0.6-1.4l0.9-1.4l1-1.3l0.3-0.3l0.3-0.3l0.3-0.3l0.1-0.3l-0.1-0.3l-0.3-0.1h-0.3l-0.3,0.1l0.1-0.7l0.3-0.7l0.5-0.6l0.6-0.3l0.3,0.3
                        h0.3h0.3l0.3-0.3l0.5,1.6l0.1,0.3h0.5h0.1l-0.1-0.8l0.3-0.9l0.6-0.6l0.8-0.3l2.2-0.6h0.8l0.6,0.3l0.7,0.6l0.3,0.1l0.3,0.1h0.3
                        l0.3-0.1h0.3l0.3,0.3l-0.3,0.8l-0.1,0.3l0.9,0.5l0.3,0.3v0.3l-0.1,0.3l-0.1,0.3l0.1,0.3l0.3,0.1h0.5l0.3,0.1l0.8,0.8l0.3,0.1l0.3-1
                        l0.1-0.3l-0.3-0.6v-0.8l-0.1-0.8l-0.7-0.5l0.3-0.5l0.3-0.3h0.5l0.5,0.1l-0.3-0.5l-0.6-0.1l-0.6,0.1l-0.3,0.3l-0.3-0.3v-0.3v-0.3
                        l-0.3-0.5v-0.3l0.3-0.3l0.7-0.3l-0.1-0.1V467l-0.1-0.1l-0.3-0.1l0.1-0.3l0.5-1.4l0.1,0.3l0.1,0.3l0.3,0.3l0.3,0.1l0.1-0.8v-0.6
                        l-0.1-0.6l-0.3-0.6l-0.5,0.6l-0.5-0.3l-0.5-0.6l-0.5-0.5l1.3-1l0.3-0.3l0.3-0.5l0.3-0.6l-0.1-0.3l-1.4-0.1l-0.3-0.3l-0.3-0.3v-0.3
                        l0.6-0.5l0.3-0.1l0.7-0.3l0.3-0.3l0.3-0.6l0.1-0.1h0.3l0.1,0.1l0.1,0.1l0.3-0.1l0.3-0.6l-0.1-0.3l-0.6-0.5l-0.3-0.6l-0.3-0.3
                        l-0.3-0.1l0.3-0.5l1.3-1l0.5-0.5l0.1-0.3l-0.1-0.3l-0.1-0.7v-0.7l0.1-0.3l0.3-0.1h0.6h0.3l0.3-0.1h0.1l0.1,0.1l0.1,0.3l0.1,0.5
                        l0.1,0.3l0.6,0.5l-0.1-0.8l-0.7-1.8l-0.3-2.3l0.3-0.5h1.3l-0.3,0.3l-0.3,0.3l0.3,0.3l0.3,0.5l0.3,0.3l0.3,0.1l0.3-0.1l0.1-0.3
                        l-0.1-0.3l-0.5-0.1l0.3-0.5l0.3-0.1h0.3l-0.3-0.5l-0.3-0.5l-0.1-0.5v-0.6l0.6,0.3h0.6l1.2-0.1l1.3,0.3l0.3-0.1l-0.3-0.3l-0.5-0.3
                        l-0.3-0.1v-0.3h0.3h0.3l0.3-0.1l0.3-0.1l-0.3-0.3l-1.3-0.7l0.6-0.6l1.6,0.6l0.7-0.3l-0.1-0.5l-1.4-1l-0.6-0.6h0.8l0.8-0.3l0.6-0.3
                        l0.3-0.7h-0.9l-0.3-0.3l-0.1-0.6l0.7,0.1l0.8-0.3l0.6-0.6l-0.1-0.8l0,0l-0.5,0.1h-0.9v-0.5v-0.5h0.3h0.5h0.3l-0.1-0.3l-0.3-0.3
                        l-0.3-0.3l1.4-0.7l0.6-0.6l-0.1-0.9l-0.3,0.3l-0.6,0.3l-0.7,0.3l-0.6-0.3l0.6-0.6l0.8-0.6l0.3-0.6l-0.8-0.3l0.3-0.3l0.6-0.6l0.3-0.3
                        l0.3-0.1h0.3l0.3-0.1h0.6l0.3-0.3v-0.6v-0.6l0.3-0.3l0.3-0.3l-0.3-0.5l-0.5-0.3l-0.3,0.3l-0.3,0.7l-0.7,0.6l-0.7,0.1l-0.5-0.7
                        l0.3-0.3l1-0.3l0.5-0.3l1-1.3l0.3-0.1l0.1-0.3l0.1-0.1l0.1-0.1v-0.3l-0.1-0.3L1084.3,426.8z"></path>
                    <polygon class="st1" points="1278.9,195.1 1279.7,194.3 1279.6,193.6 1278.2,192.3 1277.2,191.9 1276.3,191.9 1274.1,192.8 
                        1273.6,192.9 1273.4,192.9 1273.3,193.2 1273,193.8 1272.8,194.1 1272.6,194.1 1272,194.2 1271.7,194.3 1271.4,194.5 1271,195.3 
                        1270.3,196 1269.5,196.5 1269.2,196.9 1268.8,197.8 1268.7,198 1268.1,198.3 1267.4,199 1266.4,200.5 1265,201.5 1258.6,202.5 
                        1257.8,202.2 1257.1,201.8 1256.7,201.3 1256.7,200.9 1256.9,200.6 1256.9,200 1256.7,199.6 1256.6,199.2 1255.8,197.8 
                        1255.7,197.3 1255.7,196.3 1255.6,195.8 1255.4,195.6 1255,195.7 1254.4,196.3 1253.8,196.9 1253.2,197.5 1252.9,198.4 
                        1252.9,198.9 1253.2,199.8 1253.3,200.2 1253.1,201.8 1253.3,202.1 1253.5,202.5 1253.8,202.9 1253.8,203.5 1253.6,203.6 
                        1250.7,204.4 1250.2,204.9 1249.5,205.6 1247.8,208.4 1247.2,209 1246.4,209.5 1245.7,209.5 1245.1,209 1244.7,208.6 1244.3,208.4 
                        1243.9,208.4 1243.6,208.6 1243.3,209 1243.2,209.1 1243.3,209.5 1243.3,209.9 1243.2,210.9 1243,211.7 1242.9,212.4 1242.3,213.1 
                        1241.9,213.5 1240.8,214.4 1239.5,215.7 1236.9,216.9 1236.3,217.6 1236.5,218.8 1235.6,219.5 1234.9,219.2 1233.9,218.2 
                        1232.8,218.5 1232.4,219.7 1233.1,220.4 1234.1,220.6 1235.3,221.2 1235.2,222.1 1235,222.8 1233.9,224.3 1233.2,225.3 
                        1232.3,225.6 1231.6,225.3 1230.7,224.5 1229.7,224.7 1230.1,225.8 1230.6,226.2 1230.8,227 1230.3,227.7 1229.7,228.3 
                        1229.4,228.1 1228.7,227.6 1228.7,226.9 1228.5,226.2 1228.1,226.1 1227.9,226.8 1227.9,227.6 1228.2,228.3 1228.4,229 
                        1228.2,229.4 1227.3,230 1226.9,230.6 1226.4,231.2 1226.1,231.7 1226,232.2 1226.1,232.9 1226.4,233.2 1227.5,233.3 1228.2,233.7 
                        1228.6,233.8 1229,233.1 1229.2,232.4 1229.7,231.5 1230.3,230.7 1231.3,229.4 1232.8,228.1 1233.9,228.6 1235.9,227.7 
                        1237.1,225.4 1237.6,224.7 1238.7,223.7 1240.2,221.9 1242.9,220.4 1244.7,218.6 1244.9,218.2 1245.4,217.3 1245.6,216.9 
                        1246.4,216 1246.7,215.7 1247.1,215.4 1247.2,215 1246.7,214.5 1246.5,213.8 1246.7,213.1 1247.3,212.1 1248.6,211.7 1249.3,212.2 
                        1249.6,213.1 1250.4,214.1 1250.7,213.9 1251.3,213.5 1251.6,213.3 1252.2,213.3 1253.1,213.3 1254.4,213.3 1255.7,212 
                        1256.4,211.7 1257.3,210.5 1258.4,208.9 1260,206.9 1262.5,204.5 1264.1,203.5 1265.9,202.9 1268.4,202.5 1269.2,202.1 
                        1271.7,200.3 1272.3,200 1273.9,199.8 1276.3,200.2 1277,200 1277.8,199.8 1278.7,199.2 1279.4,198.5 1279.4,197.9 1278.3,196.6 
                        1278.2,196.1 1278.1,195.6 1278.2,195.3 "></polygon>
                    <polyline class="st1" points="1191.7,255.7 1191.9,255.2 1192.7,254.4 1193.5,253.5 1193.9,253.3 1195.5,253 1196.1,252.7 
                        1196.6,252.4 1197,252.1 1197.3,251.3 1197.6,250.6 1197.7,250 1197.9,249.3 1198.4,248.7 1199,248.6 1199.5,248.8 1199.8,248.5 
                        1199.9,248 1199.9,246.9 1200.1,246.6 1200.8,245.3 1201.1,245 1203.7,242.7 1204.1,242.4 1204.4,242.3 1204.7,241.9 1205,241.5 
                        1205.1,241.4 1205.2,240.8 1205.3,240.7 1205.6,240.6 1205.7,240.4 1205.9,240.2 1206,240 1206.7,239.5 1208.3,239.4 1208.9,239.1 
                        1209.4,239.4 1210.3,239.3 1211.1,238.9 1211.6,238.6 1212.7,237.6 1213,237.3 1213.7,236 1213.8,235.8 1214,235.8 1214.9,235.4 
                        1215.3,235.3 1215.6,235.4 1216.4,236 1216.7,235.8 1216.9,235.8 1217.1,235.5 1217.3,235.4 1217.4,235.2 1217.5,234.8 
                        1217.6,234.6 1217.8,234.2 1218.3,232.7 1217.7,232.7 1215.5,233.4 1212.7,233.7 1211.8,233.4 1210.3,232.4 1209.8,232.2 
                        1209.6,232.1 1208.2,230.6 1207.8,230.3 1207.2,230.3 1206.1,230.6 1205.3,231.6 1204.1,234.2 1203.7,234.7 1203.5,235.2 
                        1203.2,235.8 1203.1,236.7 1203,236.9 1202.6,237.3 1202.5,237.7 1202.5,237.9 1202.3,238.3 1202.2,238.6 1202.1,238.9 
                        1201.6,239.2 1200.6,239.5 1200.1,240 1199.5,241 1199.2,241.4 1199.2,242 1199.1,242.4 1198.8,242.7 1197.5,243.5 1197.3,243.9 
                        1197.2,244.2 1196.7,244.8 1196.6,245.1 1196.4,246.6 1196.1,247.2 1195.7,247.9 1195.1,248.4 1194.4,248.6 1194.3,248.7 
                        1193.9,249.9 1191.1,251.8 1190.8,252.3 1190.6,252.5 1189,253.4 1188.8,253.7 1188.2,254.8 1187.8,255 1187.3,255.2 "></polyline>
                    <polyline class="st1" points="1243.9,255.8 1244.1,255 1243.4,255.2 1242.9,255.2 1242.4,254.8 1241.8,254.3 1241.6,254 1241,253.4 
                        1240.5,253.4 1240,253.7 1239.5,254.3 1238.6,254 1237.6,254.2 1234.1,256.3 "></polyline>
                    <polygon class="st1" points="1216.5,270.9 1215.5,270.9 1214.9,270.4 1213.8,270.7 1211.8,271.9 1212.7,272.8 1213.3,273.2 
                        1213.6,273.4 1213.7,273.5 1213.8,274.4 1213.9,274.7 1214.6,274.7 1216.8,273.6 1216.5,272.7 1216.9,272.2 1217.4,271.8 
                        1217.5,271.2 1217.1,270.9 "></polygon>
                    <g class="cursor-pointer japan">
                        <path class="st2" d="M1040.5,529.5c-2.3,10.7-27.3,34-27.3,34s-13.7-31.4-11.4-42.2s12.8-17.7,23.5-15.3
                            C1035.8,508.2,1042.8,518.7,1040.5,529.5z"></path>
                        <path class="st3" d="M1032.9,524.5c0,11-19.7,39-19.7,39s-19.8-28-19.8-39s8.9-19.7,19.7-19.7
                            C1024,504.7,1032.9,513.4,1032.9,524.5z"></path>
                        <path class="st4" d="M1028.8,524.5c0,8.6-7.1,15.6-15.6,15.6s-15.6-7.1-15.6-15.6s7.1-15.6,15.6-15.6S1028.8,516,1028.8,524.5z"></path>
                        <polygon class="st3" points="1013.1,515.3 1015.4,522.3 1022.8,522.3 1016.9,526.6 1019.2,533.9 1013.1,529.4 1007,533.9 
                            1009.3,526.6 1003.3,522.3 1010.8,522.3 	"></polygon>
                    </g>
                    <text x="25" y="607" class="small danang">Da Nang</text>
                    <use xlink:href="#zindexmap"></use>
                    </svg>
            </div>
            <div class="col-md-4">
                <div class="map">
                    <h5>Hà Nội</h5>
                    <p>Tầng 18-19-20, Tháp C, Tòa nhà Central Point, 219 Trung Kính, phường Yên Hòa, quận Cầu Giấy, Hà Nội, Việt Nam</p>
                    <p>024-3765-9555</p>
                    <p>info@vnext.vn</p>
                </div>
                <div class="map">
                    <h5>Đà Nẵng</h5>
                    <p>Tầng 3-5, Tòa nhà UST, số 639 Nguyễn Tất Thành, phường Xuân Hà, quận Thanh Khê, Đà Nẵng, Việt Nam</p>
                    <p>024-3765-9555 (Ext:114)</p>
                    <p>info@vnext.vn</p>
                </div>
                <div class="map">
                    <h5>Tokyo</h5>
                    <p>Tầng 7, Tòa nhà Shoutoku, 3-8-9 Sotokanda, Chiyoda-ku, Tokyo</p>
                    <p>+81(3)-6811-6633</p>
                    <p>sales@vnext.vn</p>
                </div>
                <div class="social-icons">
                    <a href="#"><img src="https://www.vnext.vn/img/fb.png"></a>
                    <a href="#"><img src="https://www.vnext.vn/img/youtube.png"></a>
                    <a href="#"><img src="https://www.vnext.vn/img/linkedin.png"></a>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <div class="partners">
                    <h4>Công ty liên doanh</h4>
                    <img src="https://www.vnext.vn/img/aimenext.png" alt="Partner 1">
                    <img src="https://www.vnext.vn/img/sotanext.png" alt="Partner 2">
                    <img src="https://www.vnext.vn/img/tomochain.png" alt="Partner 3">
                </div>
                
                <p class="text-center">&copy; 2021 VNEXT All Rights Reserved.</p>
            </div>
        </div>
    </div>
</footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>

</html>