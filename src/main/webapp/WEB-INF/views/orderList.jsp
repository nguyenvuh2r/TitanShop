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
            <h1>Danh sách Order</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Danh sách Order</li>
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
            <div class="card">
              <!-- /.card-header -->
              <div class="card-body">
              <c:set  var="sl" value="1"/>
                <table id="mainTable" class="display table table-bordered table-striped">
                  <thead>
                  <tr>
                    <th>ID</th>
                    <th>Tên</th>
                    <th>Email</th>
                    <th>SĐT</th>
                    <th>Tài khoản</th>
                    <th>Enabled</th>
                    <th><i class="fas fa-cogs"></i></th>
                  </tr>
                  </thead>
                  <tbody>
                  <c:forEach items="${orders}" var="order">
                  <tr>
                  	<td>${sl}</td>
                    <td>${order.customer.customerName}</td>
                    <td>${order.customer.customerEmailAddress}</td>
                    <td>${order.customer.custometPhoneNumber}</td>
                    <td>${order.customer.username}</td>
                    <td>${order.customer.enabled}</td>
                  	<td>
                  	<div class="btn-group">
                  	  <a class="btn btn-info btn-xs" href="<spring:url value="/admin/customerOrder/productList/${order.customerOrderId}"/>"><i class="fas fa-info-circle"></i></a>
		              <a class="btn btn-info btn-xs" href="<spring:url value="/admin/customerOrder/deletOrder/${order.customerOrderId}"/>"><i class="fas fa-trash-alt"></i></a>
                  	</div>
                  	</td>
                  	<c:set var="sl" value="${sl+1}"/>
                  </tr>
                  </c:forEach>
                  </tbody>
                  <tfoot>
                  <tr>
                    <th>ID</th>
                    <th>Tên</th>
                    <th>Email</th>
                    <th>SĐT</th>
                    <th>Tài khoản</th>
                    <th>Enabled</th>
                    <th><i class="fas fa-cogs"></i></th>
                  </tr>
                  </tfoot>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
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
  
<!-- Page specific script -->
<script>
  $(function() {
    $('#mainTable').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": true,
      "ordering": true,
      "info": false,
      "autoWidth": false,
      "responsive": true
    });
  });
</script>
</body>
</html>