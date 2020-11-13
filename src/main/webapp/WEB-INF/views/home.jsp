<%@ page pageEncoding="UTF-8" %>

<%@include file="/WEB-INF/views/template/header.jsp" %>

<div class="main">
  <section class="module-small">
    <div class="container">
      <div class="row">
        <div class="col-sm-6 col-sm-offset-3">
          <h2 class="module-title font-alt">Sản phẩm</h2>
        </div>
      </div>
      <div class="row multi-columns-row">
	      <c:forEach var="product" items="${products}">
	      	<div class="col-sm-6 col-md-3 col-lg-3">
	          <div class="shop-item">
	            <div class="shop-item-image"><img src="assets/images/shop/product-7.jpg" alt="Accessories Pack"/>
	              <div class="shop-item-detail"><a class="btn btn-round btn-b"><span class="icon-basket">Add To Cart</span></a></div>
	            </div>
	            <h4 class="shop-item-title font-alt"><a href="<c:url value="/product/viewProduct/${product.productId}"/>">${product.productModel}</a></h4>${product.productPrice}
	          </div>
	        </div>
	      </c:forEach>
      </div>
      <div class="row mt-30">
        <div class="col-sm-12 align-center"><a class="btn btn-b btn-round" href="#">Xem toàn bộ sản phẩm</a></div>
      </div>
    </div>
  </section>
  <section class="module bg-dark-30" style='background-image:url(&quot;<c:url value="resources/images/shop/technology.jpg"/>&quot;);'>
  <div class="container">
    <div class="row">
      <div class="col-sm-6 col-sm-offset-3">
        <h4 class="module-title font-alt mb-0">Thế giới công nghệ trong tầm tay.</h4>
      </div>
    </div>
  </div>
</section>
<section class="module">
  <div class="container">
    <div class="row">
      <div class="col-sm-6 col-sm-offset-3">
        <h2 class="module-title font-alt">Các hãng sản phẩm</h2>
      </div>
    </div>
    <div class="row">
      <div class="owl-carousel text-center" data-items="5" data-pagination="false" data-navigation="false">
        <div class="owl-item">
          <div class="col-sm-12">
            <div class="ex-product"><a href="#"><img src="assets/images/shop/product-1.jpg" alt="Leather belt"/></a>
              <h4 class="shop-item-title font-alt"><a href="#">Leather belt</a></h4>£12.00
            </div>
          </div>
        </div>
        <div class="owl-item">
          <div class="col-sm-12">
            <div class="ex-product"><a href="#"><img src="assets/images/shop/product-2.jpg" alt="Derby shoes"/></a>
              <h4 class="shop-item-title font-alt"><a href="#">Derby shoes</a></h4>£54.00
            </div>
          </div>
        </div>
        <div class="owl-item">
          <div class="col-sm-12">
            <div class="ex-product"><a href="#"><img src="assets/images/shop/product-3.jpg" alt="Leather belt"/></a>
              <h4 class="shop-item-title font-alt"><a href="#">Leather belt</a></h4>£19.00
            </div>
          </div>
        </div>
        <div class="owl-item">
          <div class="col-sm-12">
            <div class="ex-product"><a href="#"><img src="assets/images/shop/product-4.jpg" alt="Leather belt"/></a>
              <h4 class="shop-item-title font-alt"><a href="#">Leather belt</a></h4>£14.00
            </div>
          </div>
        </div>
        <div class="owl-item">
          <div class="col-sm-12">
            <div class="ex-product"><a href="#"><img src="assets/images/shop/product-5.jpg" alt="Chelsea boots"/></a>
              <h4 class="shop-item-title font-alt"><a href="#">Chelsea boots</a></h4>£44.00
            </div>
          </div>
        </div>
        <div class="owl-item">
          <div class="col-sm-12">
            <div class="ex-product"><a href="#"><img src="assets/images/shop/product-6.jpg" alt="Leather belt"/></a>
              <h4 class="shop-item-title font-alt"><a href="#">Leather belt</a></h4>£19.00
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<hr class="divider-w">
<section class="module" id="news">
  <div class="container">
    <div class="row">
      <div class="col-sm-6 col-sm-offset-3">
        <h2 class="module-title font-alt">Our News</h2>
      </div>
    </div>
    <div class="row multi-columns-row post-columns wo-border">
      <div class="col-sm-6 col-md-4 col-lg-4">
        <div class="post mb-40">
          <div class="post-header font-alt">
            <h2 class="post-title"><a href="#">Receipt of the new collection</a></h2>
          </div>
          <div class="post-entry">
            <p>A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart.</p>
          </div>
          <div class="post-more"><a class="more-link" href="#">Read more</a></div>
        </div>
      </div>
      <div class="col-sm-6 col-md-4 col-lg-4">
        <div class="post mb-40">
          <div class="post-header font-alt">
            <h2 class="post-title"><a href="#">Sale of summer season</a></h2>
          </div>
          <div class="post-entry">
            <p>A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart.</p>
          </div>
          <div class="post-more"><a class="more-link" href="#">Read more</a></div>
        </div>
      </div>
      <div class="col-sm-6 col-md-4 col-lg-4">
        <div class="post mb-40">
          <div class="post-header font-alt">
            <h2 class="post-title"><a href="#">New lookbook</a></h2>
          </div>
          <div class="post-entry">
            <p>A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart.</p>
          </div>
          <div class="post-more"><a class="more-link" href="#">Read more</a></div>
        </div>
      </div>
      <div class="col-sm-6 col-md-4 col-lg-4">
        <div class="post mb-40">
          <div class="post-header font-alt">
            <h2 class="post-title"><a href="#">Receipt of the new collection</a></h2>
          </div>
          <div class="post-entry">
            <p>A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart.</p>
          </div>
          <div class="post-more"><a class="more-link" href="#">Read more</a></div>
        </div>
      </div>
      <div class="col-sm-6 col-md-4 col-lg-4">
        <div class="post mb-40">
          <div class="post-header font-alt">
            <h2 class="post-title"><a href="#">Sale of summer season</a></h2>
          </div>
          <div class="post-entry">
            <p>A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart.</p>
          </div>
          <div class="post-more"><a class="more-link" href="#">Read more</a></div>
        </div>
      </div>
      <div class="col-sm-6 col-md-4 col-lg-4">
        <div class="post mb-40">
          <div class="post-header font-alt">
            <h2 class="post-title"><a href="#">New lookbook</a></h2>
          </div>
          <div class="post-entry">
            <p>A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart.</p>
          </div>
          <div class="post-more"><a class="more-link" href="#">Read more</a></div>
        </div>
      </div>
    </div>
  </div>
</section>
<hr class="divider-w">
<section class="module-small">
  <div class="container">
    <div class="row client">
      <div class="owl-carousel text-center" data-items="6" data-pagination="false" data-navigation="false">
        <div class="owl-item">
          <div class="col-sm-12">
            <div class="client-logo"><img src="assets/images/client-logo-dark-1.png" alt="Client Logo"/></div>
          </div>
        </div>
        <div class="owl-item">
          <div class="col-sm-12">
            <div class="client-logo"><img src="assets/images/client-logo-dark-2.png" alt="Client Logo"/></div>
          </div>
        </div>
        <div class="owl-item">
          <div class="col-sm-12">
            <div class="client-logo"><img src="assets/images/client-logo-dark-3.png" alt="Client Logo"/></div>
          </div>
        </div>
        <div class="owl-item">
          <div class="col-sm-12">
            <div class="client-logo"><img src="assets/images/client-logo-dark-4.png" alt="Client Logo"/></div>
          </div>
        </div>
        <div class="owl-item">
          <div class="col-sm-12">
            <div class="client-logo"><img src="assets/images/client-logo-dark-5.png" alt="Client Logo"/></div>
          </div>
        </div>
        <div class="owl-item">
          <div class="col-sm-12">
            <div class="client-logo"><img src="assets/images/client-logo-dark-1.png" alt="Client Logo"/></div>
          </div>
        </div>
        <div class="owl-item">
          <div class="col-sm-12">
            <div class="client-logo"><img src="assets/images/client-logo-dark-2.png" alt="Client Logo"/></div>
          </div>
        </div>
        <div class="owl-item">
          <div class="col-sm-12">
            <div class="client-logo"><img src="assets/images/client-logo-dark-3.png" alt="Client Logo"/></div>
          </div>
        </div>
        <div class="owl-item">
          <div class="col-sm-12">
            <div class="client-logo"><img src="assets/images/client-logo-dark-4.png" alt="Client Logo"/></div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<div class="module-small bg-dark">
  <div class="container">
    <div class="row">
      <div class="col-sm-3">
        <div class="widget">
          <h5 class="widget-title font-alt">Về Titan Shop</h5>
          <p>Chuyên cung cấp các sản phẩm về công nghệ.</p>
          <p>Phone: +84 896 541 513</p>
          <p>Email: <a href="#">vegitoson01@gmail.com</a></p>
        </div>
      </div>
      <div class="col-sm-3">
        <div class="widget">
          <h5 class="widget-title font-alt">Menu</h5>
          <ul class="icon-list">
            <li><a href="#">Trang chủ</a></li>
            <li><a href="#">Shop</a></li>
            <li><a href="#">Tin tức</a></li>
            <li><a href="#">Giới thiệu</a></li>
            <li><a href="#">Liên hệ</a></li>
          </ul>
        </div>
      </div>
      <div class="col-sm-3">
        <div class="widget">
          <h5 class="widget-title font-alt">Danh mục sản phẩm</h5>
          <ul class="icon-list">
            <li><a href="#">Điện thoại - 7</a></li>
            <li><a href="#">Laptop - 3</a></li>
          </ul>
        </div>
      </div>
      <div class="col-sm-3">
        <div class="widget">
          <h5 class="widget-title font-alt">Sản phẩm bán chạy</h5>
          <ul class="widget-posts">
            <li class="clearfix">
              <div class="widget-posts-image"><a href="#"><img src="assets/images/rp-1.jpg" alt="Post Thumbnail"/></a></div>
              <div class="widget-posts-body">
                <div class="widget-posts-title"><a href="#">IPhone 12 XS Max</a></div>
                <div class="widget-posts-meta">Apple</div>
              </div>
            </li>
            <li class="clearfix">
              <div class="widget-posts-image"><a href="#"><img src="assets/images/rp-2.jpg" alt="Post Thumbnail"/></a></div>
              <div class="widget-posts-body">
                <div class="widget-posts-title"><a href="#">Macbook Pro 2020</a></div>
                <div class="widget-posts-meta">Apple</div>
              </div>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</div>

<%@include file="/WEB-INF/views/template/footer.jsp" %>