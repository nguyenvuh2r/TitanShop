<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page pageEncoding="UTF-8" %>

<%@include file="/WEB-INF/views/template/adminHeader.jsp" %>

<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1></h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Lỗi</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="error-page">
        <h2 class="headline text-danger">Lỗi!</h2>

        <div class="error-content">
          <h3><i class="fas fa-exclamation-triangle text-danger"></i>Oops! Có lỗi xảy ra.</h3>

          <p>
            <c:if test="${not empty customError}">${customError.message}</c:if>
            Hoặc bạn có thể <a href="<spring:url value="/admin/"/>"> quay lại trang Dashboard</a>.
          </p>
        </div>
      </div>
      <!-- /.error-page -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <%@include file="/WEB-INF/views/template/adminFooter.jsp" %>
  </body>
  </html>