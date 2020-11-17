<%@include file="/WEB-INF/views/template/header.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>AdminLTE 3 | Log in</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="<c:url value="/resources/plugins/fontawesome-free/css/all.min.css"/>" />
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="<c:url value="/resources/plugins/icheck-bootstrap/icheck-bootstrap.min.css"/>" />
  <!-- Theme style -->
  <link rel="stylesheet" href="<c:url value="/resources/dist/css/adminlte.min.css"/>" />
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <a href="<c:url value="/admin/"/>"><b>Admin</b>LTE</a>
  </div>
  <!-- /.login-logo -->
  <div class="card">
    <div class="card-body login-card-body">
      <p class="login-box-msg">Đăng nhập để bắt đầu phiên làm việc</p>
      
      <c:if test="${not empty error}">
        <p class="login-box-msg" style="color:#ff0000">
          ${error}
        </p>
      </c:if>	

      <form name="loginForm"  action="<c:url value="/j_spring_security_check" />"   method="post"  class="form-horizontal"  >
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        <div class="input-group mb-3">
          <input type="text" name="username" id="username" class="form-control" placeholder="Tên tài khoản">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="password" name="password" id="password" class="form-control" placeholder="Mật khẩu">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-8">
            <div class="icheck-primary">
              <input type="checkbox" id="remember-me" name="remember-me">
              <label for="remember">
                Lưu
              </label>
            </div>
          </div>
          <!-- /.col -->
          <div class="col-4">
            <button type="submit" class="btn btn-primary btn-block">Đăng nhập</button>
          </div>
          <!-- /.col -->
        </div>
      </form>

    </div>
    <!-- /.login-card-body -->
  </div>
</div>
<!-- /.login-box -->

<!-- jQuery -->
<script src="<c:url value="/resources/plugins/jquery/jquery.min.js"/>"></script>
<!-- Bootstrap 4 -->
<script src="<c:url value="/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"/>"></script>
<!-- AdminLTE App -->
<script src="<c:url value="/resources/dist/js/adminlte.min.js"/>"></script>
</body>
</html>