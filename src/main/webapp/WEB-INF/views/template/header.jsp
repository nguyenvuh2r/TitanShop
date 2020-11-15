<%@ page import="org.springframework.beans.factory.annotation.Value"%>
<%@ page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@ page import="org.springframework.web.context.support.SpringBeanAutowiringSupport"%>
<%@ page import="titan.shop.service.ProductCategoriesService" %>
<%@ page import="titan.shop.model.ProductCategories" %>
<%@ page import="titan.shop.model.ProductBrand" %>
<%@ page import="java.util.List" %>

<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page pageEncoding="UTF-8" %>

<%!
    public void jspInit() 
    {
        SpringBeanAutowiringSupport.processInjectionBasedOnServletContext(this,
        getServletContext());
    }

    @Autowired
    private ProductCategoriesService productCategoriesService;
%>

<%
	List<ProductCategories> cats = productCategoriesService.getAll();
%>

<!DOCTYPE html>
<html lang="en-US" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--  
    Document Title
    =============================================
    -->
    <title>Titan Shop | Thế Giới Công Nghệ</title>
    <!--  
    Favicons
    =============================================
    -->
    <link rel="apple-touch-icon" sizes="57x57" href="<c:url value="/resources/images/favicons/apple-icon-57x57.png"/>"/>
    <link rel="apple-touch-icon" sizes="60x60" href="<c:url value="/resources/images/favicons/apple-icon-60x60.png"/>"/>
    <link rel="apple-touch-icon" sizes="72x72" href="<c:url value="/resources/images/favicons/apple-icon-72x72.png"/>"/>
    <link rel="apple-touch-icon" sizes="76x76" href="<c:url value="/resources/images/favicons/apple-icon-76x76.png"/>"/>
    <link rel="apple-touch-icon" sizes="114x114" href="<c:url value="/resources/images/favicons/apple-icon-114x114.png"/>"/>
    <link rel="apple-touch-icon" sizes="120x120" href="<c:url value="/resources/images/favicons/apple-icon-120x120.png"/>"/>
    <link rel="apple-touch-icon" sizes="144x144" href="<c:url value="/resources/images/favicons/apple-icon-144x144.png"/>"/>
    <link rel="apple-touch-icon" sizes="152x152" href="<c:url value="/resources/images/favicons/apple-icon-152x152.png"/>"/>
    <link rel="apple-touch-icon" sizes="180x180" href="<c:url value="/resources/images/favicons/apple-icon-180x180.png"/>"/>
    <link rel="icon" type="image/png" sizes="192x192" href="<c:url value="/resources/images/favicons/android-icon-192x192.png"/>"/>
    <link rel="icon" type="image/png" sizes="32x32" href="<c:url value="/resources/images/favicons/favicon-32x32.png"/>"/>
    <link rel="icon" type="image/png" sizes="96x96" href="<c:url value="/resources/images/favicons/favicon-96x96.png"/>"/>
    <link rel="icon" type="image/png" sizes="16x16" href="<c:url value="/resources/images/favicons/favicon-16x16.png"/>"/>
    <meta name="msapplication-TileColor" content="#ffffff" />
    <meta name="msapplication-TileImage" content="<c:url value="/resources/images/favicons/ms-icon-144x144.png"/>"/>
    <meta name="theme-color" content="#ffffff" />
    <!--  
    Stylesheets
    =============================================
    
    -->
    <!-- Default stylesheets-->
    <link href="<c:url value="/resources/lib/bootstrap/dist/css/bootstrap.min.css"/>" rel="stylesheet"/>
    <!-- Template specific stylesheets-->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Volkhov:400i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
    <link href="<c:url value="/resources/lib/animate.css/animate.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/lib/components-font-awesome/css/font-awesome.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/lib/et-line-font/et-line-font.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/lib/flexslider/flexslider.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/lib/owl.carousel/dist/assets/owl.carousel.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/lib/owl.carousel/dist/assets/owl.theme.default.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/lib/magnific-popup/dist/magnific-popup.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/lib/simple-text-rotator/simpletextrotator.css"/>" rel="stylesheet">
    <!-- Main stylesheet and color file-->
    <link href="<c:url value="/resources/css/style.css"/>" rel="stylesheet">
    <link id="color-scheme" href="<c:url value="/resources/css/colors/default.css"/>" rel="stylesheet">
  </head>
  <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
    <main>
      <div class="page-loader">
        <div class="loader">Loading...</div>
      </div>
      <nav class="navbar navbar-custom navbar-fixed-top navbar-transparent" role="navigation">
        <div class="container">
          <div class="navbar-header">
            <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#custom-collapse"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button><a class="navbar-brand" href="/">Titan Shop</a>
          </div>
          <div class="collapse navbar-collapse" id="custom-collapse">
            <ul class="nav navbar-nav navbar-right">
              <li class="dropdown"><a href="#">Trang chủ</a></li>
              <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Shop</a>
              	<ul class="dropdown-menu">
              	  <% for (ProductCategories category : cats)  {  %>
              	  
              		<li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown"><%=category.getName()%></a>
	              		<% if(category.getProductBrand() != null) { %>
	              			<ul class="dropdown-menu">
		              			<% for(ProductBrand brand : category.getProductBrand()) { %>
			                      <li><a href=""><%=brand.getName()%></a></li>
		              			<% } %>
	              			</ul>
	              		<% } %>
	              	</li>
              	  <% } %>
              	 </ul>
              </li>
              <li class="dropdown"><a href="#">Tin tức</a></li>
              <li class="dropdown"><a href="#">Giới thiệu</a></li>
              <li class="dropdown"><a href="#">Liên hệ</a></li>
              <c:if test="${pageContext.request.userPrincipal.name!=null}">
              	<li class="dropdown"><a href="#">Giỏ hàng <span class="badge progress-bar-info">0</span></a></li>
              </c:if>
              <li class="dropdown">
              	<a class="dropdown-toggle" href="#" data-toggle="dropdown">
              		<c:if test="${pageContext.request.userPrincipal.name!=null}">
              			Chào ${pageContext.request.userPrincipal.name}!
              		</c:if>
              		<c:if test="${pageContext.request.userPrincipal.name==null}">
              			Tài khoản
              		</c:if>
              	</a>
                <ul class="dropdown-menu">
                  <c:if test="${pageContext.request.userPrincipal.name=='vu123'}">
                    <li><a href="<c:url value="/admin"/>">Trang Admin</a></li>
                  </c:if>
                  <c:if test="${pageContext.request.userPrincipal.name!=null}">
                  	<li><a href="#">Cập nhật tài khoản</a></li>
                  	<li><a href="#">Đăng xuất</a></li>
                  </c:if>
                  <c:if test="${pageContext.request.userPrincipal.name==null}">
                    <li><a href="<c:url value="/login"/>">Đăng nhập</a></li>
                    <li><a href="<c:url  value="register"/>">Đăng ký</a></li>
                  </c:if>
                </ul>
              </li>
            </ul>
          </div>
        </div>
      </nav>
      <section class="home-section home-fade home-full-height" id="home">
        <div class="hero-slider">
          <ul class="slides">
            <li class="bg-dark-30 bg-dark shop-page-header" style='background-image:url(&quot;<c:url value="/resources/images/shop/slider1.png"/>&quot;);'>
              <div class="titan-caption">
                <div class="caption-content">
                  <div class="font-alt mb-30 titan-title-size-4">Titan Shop</div>
                  <div class="font-alt mb-40 titan-title-size-1">Thế Giới Công Nghệ</div><a class="section-scroll btn btn-border-w btn-round" href="#latest">Vào Shop</a>
                </div>
              </div>
            </li>
            <li class="bg-dark-30 bg-dark shop-page-header" style='background-image:url(&quot;<c:url value="/resources/images/shop/slider2.png"/>&quot;);'>
              <div class="titan-caption">
                <div class="caption-content">
                  <div class="font-alt mb-30 titan-title-size-4">Titan Shop</div>
                  <div class="font-alt mb-40 titan-title-size-1">Thế Giới Công Nghệ</div><a class="section-scroll btn btn-border-w btn-round" href="#latest">Vào Shop</a>
                </div>
              </div>
            </li>
          </ul>
        </div>
      </section>