<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
            <h1>Thêm thể loại</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Thêm thể loại</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <!-- SELECT2 EXAMPLE -->
        <div class="card card-default">
          <div class="card-header">
            <h3 class="card-title">Thêm thể loại</b></h3>
            <div class="card-tools">
              <button type="button" class="btn btn-tool" data-card-widget="collapse">
                <i class="fas fa-minus"></i>
              </button>
            </div>
          </div>
          <!-- /.card-header -->
 	       <form:form modelAttribute="productcategories"  action="${pageContext.request.contextPath}/admin/productcategories/addproductcategories?${_csrf.parameterName}=${_csrf.token}"  class="form-horizontal"  >
          <div class="card-body">
            <div class="row">
              <div class="col-md-12 col-sm-6">
                <div class="form-group">
                  <label>Tên thể loại</label>
                  <form:input path="name" class="form-control" placeholder="Enter Product Name"  />
                </div>
                <!-- /.form-group -->
              </div>
              <!-- /.col -->
          </div>
          <!-- /.card-body -->
          <div class="card-footer">
            <div class="row">
              <div class="col-12 col-sm-6">
                <input type="submit" value="Lưu" class="btn btn-block btn-outline-primary btn-flat"/>
              </div>
              <div class="col-12 col-sm-6">
                <a href="<c:url value="/admin/productcategories/1"/>" class="btn btn-block btn-outline-primary btn-flat">Hủy</a>
              </div>
            </div>
            <!-- /.row -->
          </div>
          </form:form>
        </div>
        <!-- /.card -->
      </div>
      <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
</div>

<script>
  $(function() {
    $('#mainTable').DataTable({
      "paging": false,
      "lengthChange": false,
      "searching": true,
      "ordering": true,
      "info": false,
      "autoWidth": false,
      "responsive": true
    });
  });
</script>

<%@include file="/WEB-INF/views/template/adminFooter.jsp" %>
</body>
</html>