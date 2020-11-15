<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page pageEncoding="UTF-8" %>

<%@include file="/WEB-INF/views/template/adminHeader.jsp" %>

 <c:url var="firstUrl" value="/admin/productbrand/1" />
<c:url var="lastUrl" value="/admin/productbrand/${totalPages}" />
<c:url var="prevUrl" value="/admin/productbrand/${currentPageNumber - 1}" />
<c:url var="nextUrl" value="/admin/productbrand/${currentPageNumber + 1}" /> 

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Brand Name</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Brand</li>
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
                  <i class="far fa-plus-square"></i> Add new Brand
                </a>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table id="mainTable" class="display table table-bordered table-striped">
                  <thead>
                  <tr>
                    <th>ID</th>
                    <th>Brand Name</th>
                    <th>Image</th>
                    <th>ProductCategoriesName</th>
                    <th><i class="fas fa-cogs"></i></th>
                  </tr>
                  </thead>
                  <tbody>
                  <c:forEach items="${productbrand}" var="productbrand">
                  
                  <tr>
                  	<td>${productbrand.productBrandId}</td>
                  	<td>${productbrand.name}</td>
                  	<td style="width: 15%;"><img class="img-fluid img-thumbnail" alt="" src="<c:url value="/resources/images/${productBrand.image}.png"/>" /></td>
                  	<td> ${productbrand.productCategories.name} </td>
                  	<td>
                  	
                  	<div class="btn-group">
                  	  <a class="btn btn-info btn-xs" href="<spring:url value="/brand/viewBrand/${productbrand.productBrandId}"/>"><i class="fas fa-info-circle"></i></i></a>
		              <a class="btn btn-info btn-xs" href="<spring:url value="/admin/productBrand/updateProductBrand/${productbrand.productBrandId}"/>"><i class="fas fa-edit"></i></a>
		              <a class="btn btn-info btn-xs" href="<spring:url value="/admin/productBrand/deleteProductBrand/${productbrand.productBrandId}"/>"><i class="fas fa-trash-alt"></i></i></a>
                  	</div>
                  	</td>
                  </tr>
                  </c:forEach>
                  </tbody>
                  <tfoot>
                  <tr>
                   <th>ID</th>
                    <th>Brand Name</th>
                    <th>Image</th>
                    <th>ProductCategoriesName</th>
                    <th><i class="fas fa-cogs"></i></th>
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
				            <c:url var="pageUrl" value="/admin/productbrand/${i}" />
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