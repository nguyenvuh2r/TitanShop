<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page pageEncoding="UTF-8" %>

<%@include file="/WEB-INF/views/template/adminHeader.jsp" %>

 <c:url var="firstUrl" value="/admin/customerManagement/1" />
<c:url var="lastUrl" value="/admin/customerManagement/${totalPages}" />
<c:url var="prevUrl" value="/admin/customerManagement/${currentPageNumber - 1}" />
<c:url var="nextUrl" value="/admin/customerManagement/${currentPageNumber + 1}" /> 

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Người dùng</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Người dùng</li>
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
              <div class="card-header">
                <a class="btn btn-app bg-secondary" href="<spring:url value="/admin/product/addBrand"/>">
                  <i class="far fa-plus-square"></i>
                </a>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table id="mainTable" class="display table table-bordered table-striped">
                  <thead>
                  <tr>
                    <th>ID</th>
                    <th>Tên</th>
                    <th>Email</th>
                    <th>Điện thoại</th>
                    <th>Tài khoản</th>
                    <th>Enable</th>
                    <th>Thông tin khác</th>
                  </tr>
                  </thead>
                  <tbody>
                  <c:forEach items="${customers}" var="customers">
                  <tr>
                  	<td>${customers.customerId}</td>
                  	<td>${customers.customerName}</td>
                  	<td> ${customers.customerEmailAddress} </td>
                  	<td> ${customers.custometPhoneNumber} </td>
                  	<td> ${customers.username} </td>
                  	<td> ${customers.enabled} </td>
                  	<td>
                  	 <a href="/admin/customerManagement/address/${customers.customerId}"><i class="far fa-question-circle"></i></a>
                  	</td>
                  </tr>
                  </c:forEach>
                  </tbody>
                  <tfoot>
                  <tr>
                    <th>ID</th>
                    <th>Tên</th>
                    <th>Email</th>
                    <th>Điện thoại</th>
                    <th>Tài khoản</th>
                    <th>Enable</th>
                    <th>Thông tin khác</th>
                  </tr>
                  </tfoot>
                </table>
                <div class="row">
                  <div class="col-sm-12 col-md-5">
                  	<ul class="pagination pagination-sm float-left">
                  		<c:choose>
				            <c:when test="${currentPageNumber == 1}">
				                <li class="disabled page-item"><a class="page-link" href="#">&lt;&lt;</a></li>
				                <li class="disabled page-item"><a class="page-link" href="#">&lt;</a></li>
				            </c:when>
				            <c:otherwise>
				                <li class="page-item"><a class="page-link" href="${firstUrl}">&lt;&lt;</a></li>
				                <li class="page-item"><a class="page-link" href="${prevUrl}">&lt;</a></li>
				            </c:otherwise>
				        </c:choose>
				        <c:forEach var="i" begin="${beginIndex}" end="${endIndex}">
				            <c:url var="pageUrl" value="/admin/customerManagement/${i}" />
				            <c:choose>
				                <c:when test="${i == currentPageNumber}">
				                    <li class="page-item active"><a class="page-link" href="${pageUrl}"><c:out value="${i}" /></a></li>
				                </c:when>
				                <c:otherwise>
				                    <li class="page-item"><a class="page-link" href="${pageUrl}"><c:out value="${i}" /></a></li>
				                </c:otherwise>
				            </c:choose>
				        </c:forEach>
				        <c:choose>
				            <c:when test="${currentPageNumber == totalPages}">
				                <li class="disabled page-item"><a class="page-link" href="#">&gt;</a></li>
				                <li class="disabled page-item"><a class="page-link" href="#">&gt;&gt;</a></li>
				            </c:when>
				            <c:otherwise>
				                <li class="page-item"><a class="page-link" href="${nextUrl}">&gt;</a></li>
				                <li class="page-item"><a class="page-link" href="${lastUrl}">&gt;&gt;</a></li>
				            </c:otherwise>
				        </c:choose>

                  	</ul>
                  </div>
                </div>
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
</body>
</html>