<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page pageEncoding="UTF-8" %>

<%@include file="/WEB-INF/views/template/adminHeader.jsp" %>

<jsp:useBean id="now" class="java.util.Date"/>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Hóa đơn</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Hóa đơn</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
          	<div class="callout callout-info">
              <h5><i class="fas fa-info"></i> Note:</h5>
              Bạn có thể in trang này. Click vào nút in bên dưới để thử!
            </div>
            <div class="invoice p-3 mb-3">
              <!-- title row -->
              <div class="row">
                <div class="col-12">
                  <h4>
                    <i class="fas fa-globe"></i> Titan Shop, Inc
                    <small class="float-right">Date: ${now}</small>
                  </h4>
                </div>
                <!-- /.col -->
              </div>
              <!-- info row -->
              <div class="row invoice-info">
                <div class="col-sm-4 invoice-col">
                  <strong>Thông tin hóa đơn</strong>
                  <address>
                    Họ và tên: ${order.cart.customer.customerName}<br/>
                    Điện thoại: ${order.cart.customer.custometPhoneNumber}<br/>
                    Email: ${order.cart.customer.customerEmailAddress}<br/>
                    Địa chỉ: ${order.cart.customer.billingAddress.strretName}, ${order.cart.customer.billingAddress.apartmentNumber}<br/>
			        ${order.cart.customer.billingAddress.city}, ${order.cart.customer.billingAddress.state}<br/>
			        ${order.cart.customer.billingAddress.country}, ${order.cart.customer.billingAddress.zipCode}
                  </address>
                </div>
                <!-- /.col -->
                <div class="col-sm-4 invoice-col">
                  <strong>Thông tin ship</strong>
                  <address>
					Họ và tên: ${order.cart.customer.customerName}<br/>
                    Điện thoại: ${order.cart.customer.custometPhoneNumber}<br/>
					Email: ${order.cart.customer.customerEmailAddress}<br/>
                    Địa chỉ: ${order.cart.customer.shippingAddress.strretName}, ${order.cart.customer.shippingAddress.apartmentNumber}<br/>
                    ${order.cart.customer.shippingAddress.city}, ${order.cart.customer.shippingAddress.state}<br/>
			        ${order.cart.customer.shippingAddress.country}, ${order.cart.customer.shippingAddress.zipCode}<br/>
                  </address>
                </div>
                <!-- /.col -->
                <div class="col-sm-4 invoice-col">
                  <b>Hóa đơn #${order.cart.cartId}</b><br/>
                  <br>
                  <b>Mã hóa đơn:</b> ${order.cart.cartId}<br/>
                  <b>Email:</b> ${order.cart.customer.customerEmailAddress}<br/>
                  <b>Tài khoản:</b> ${order.cart.customer.username}
                </div>
                <!-- /.col -->
              </div>
              <!-- /.row -->

              <!-- Table row -->
              <div class="row">
                <div class="col-12 table-responsive">
                  <table class="table table-striped">
                    <thead>
                    <tr>
                      <th>Số lượng</th>
                      <th>Sản phẩm</th>
                      <th>Giá</th>
                      <th>Tổng giá</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="cartItem" items="${order.cart.cartItems}">
                     <tr>			                       
                         <td>${cartItem.quantity}</td>
                         <td><em>${cartItem.product.productName}</em></td>
                         <td>${cartItem.product.productPrice}  </td>
                         <td>${cartItem.totalPrice}</td>
                      </tr>  
                    </c:forEach>
                    </tbody>
                  </table>
                </div>
                <!-- /.col -->
              </div>
              <!-- /.row -->

              <div class="row">
                <!-- accepted payments column -->
                <div class="col-6">
                  <p class="lead">Phương thức thanh toán:</p>
                  <img src="<c:url value="/resources/dist/image/credit/visa.png"/>" alt="Visa">
                  <img src="<c:url value="/resources/dist/image/credit/mastercard.png"/>" alt="Mastercard">
                  <img src="<c:url value="/resources/dist/image/credit/american-express.png"/>" alt="American Express">
                  <img src="<c:url value="/resources/dist/image/credit/paypal2.png"/>" alt="Paypal">

                  <p class="text-muted well well-sm shadow-none" style="margin-top: 10px;">
                    Chúng tôi hỗ trợ tất cả các hình thức thanh toán trên toàn thế giới!
                  </p>
                </div>
                <!-- /.col -->
                <div class="col-6">
                  <p class="lead">Thanh toán</p>

                  <div class="table-responsive">
                    <table class="table">
                      <tbody><tr>
                        <th style="width:50%">Tổng:</th>
                        <td>${order.cart.grandTotal}</td>
                      </tr>
                      <tr>
                        <th>Thuế</th>
                        <td>0</td>
                      </tr>
                      <tr>
                        <th>Vận chuyển</th>
                        <td>0</td>
                      </tr>
                      <tr>
                        <th>Thành tiền:</th>
                        <td>${order.cart.grandTotal}</td>
                      </tr>
                    </tbody></table>
                  </div>
                </div>
                <!-- /.col -->
              </div>
              <!-- /.row -->

              <!-- this row will not appear when printing -->
              <div class="row no-print">
                <div class="col-12">
                  <a href="invoice-print.html" rel="noopener" target="_blank" class="btn btn-default"><i class="fas fa-print"></i> Print</a>
                  <button type="button" class="btn btn-success float-right"><i class="far fa-credit-card"></i> Chấp nhận
                  </button>
                  <button type="button" class="btn btn-primary float-right" style="margin-right: 5px;">
                    <i class="fas fa-download"></i> Generate PDF
                  </button>
                </div>
              </div>
            </div>
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div>
      <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  
<%@include file="/WEB-INF/views/template/adminFooter.jsp" %>

</body>
</html>