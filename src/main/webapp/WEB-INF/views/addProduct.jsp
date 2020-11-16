<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page pageEncoding="UTF-8" %>

<%@include file="/WEB-INF/views/template/adminHeader.jsp" %>

<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Thêm sản phẩm</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Thêm sản phẩm</li>
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
            <h3 class="card-title">Thêm sản phẩm</h3>
            <div class="card-tools">
              <button type="button" class="btn btn-tool" data-card-widget="collapse">
                <i class="fas fa-minus"></i>
              </button>
            </div>
          </div>
          <!-- /.card-header -->
          <form:form action="${pageContext.request.contextPath}/admin/product/addProduct?${_csrf.parameterName}=${_csrf.token}" onsubmit="preSubmit()" method="post" modelAttribute="product" enctype="multipart/form-data" class="form-horizontal">
          <div class="card-body">
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label>Tên sản phẩm</label>
                  <form:input path="productName" class="form-control" placeholder="Enter Product Name" id="productName" />
                </div>
                <!-- /.form-group -->
                <div class="form-group">
                  <label>Giá</label>
                  <form:input path="productPrice" class="form-control" placeholder="Enter Product Price" id="productPrice" />
                </div>
                <!-- /.form-group -->
              </div>
              <!-- /.col -->
              <div class="col-md-6">
                <div class="form-group">
                  <label>Thể loại</label>
                  <form:select path="productCategories" id="productCategories" class="form-control select2" data-placeholder="Chọn thể loại" style="width: 100%;">
				    <c:forEach var="categories" items="${categoriesList}">
				        <option value="${categories.productCategoriesId}">${categories.name}</option>
				    </c:forEach>
				  </form:select>
                </div>
                <!-- /.form-group -->
                <div class="form-group">
                  <label>Hãng sản phẩm</label>
                  <input type="hidden" name="productCurrentBrand" id="productCurrentBrand" value="${product.productBrand.productBrandId}"/>
                  <form:select path="productBrand" id="productBrand" class="form-control" data-placeholder="Chọn hãng" style="width: 100%;">
				  </form:select>
                </div>
                <!-- /.form-group -->
              </div>
              <!-- /.col -->
            </div>
            <!-- /.row -->
            <div class="row">
              <div class="col-12 col-sm-6">
                <div class="form-group">
                  <label>Số lượng</label>
                  <form:input path="unitInStock" class="form-control" placeholder="Enter Product Unit in Stock" id="unitInStock" />
                </div>
                <!-- /.form-group -->
              </div>
              <!-- /.col -->
              <div class="col-12 col-sm-6">
                <div class="form-group">
                  <label>Giảm giá (%)</label>
                  <form:input path="discount" class="form-control" placeholder="Enter Product Discount" id="discount" />
                </div>
                <!-- /.form-group -->
              </div>
              <!-- /.col -->
            </div>
            <!-- /.row -->
            <div class="row">
              <div class="col-12 col-sm-6">
              	 <div class="form-group">
                  <label>Mô tả sản phẩm</label>
                  <form:textarea path="productDescription" rows="5" class="form-control" placeholder="Enter Product Description" id="productDescription" />
                </div>
                <!-- /.form-group -->
              </div>
              <div class="col-12 col-sm-6">
	              <div class="form-group">
	                  <label>Trạng thái</label>
	                  <div class="form-group">
	                  	<div class="icheck-primary">
	                  	<label>
	                        <form:radiobutton path="productStatus" id="productStatus1" value="Brand New"/>
	                        Brand New
                        </label>
                      </div>
                      <div class="icheck-primary">
                      	<label>
	                        <form:radiobutton path="productStatus" id="productStatus2" value="Old"/>
	                        Old
                        </label>
                      </div>
	                  </div>
	                </div>
	                <!-- /.form-group -->
              </div>
            </div>
            <!-- /.row -->
            <div class="row">
	            <div class="col-12 col-sm-6">
	              	 <div class="form-group">
	              	 	<label>Upload image</label>
	              	 	<form:input path="productImage" id="productImage" type="file" class="form:input-large"/>
	              	 </div>
	            </div>
	            <!-- /.form-group -->
	            <div class="col-12 col-sm-6">
	              	 <div class="form-group">
	              	 </div>
	            </div>
	            <!-- /.form-group -->
            </div>
            <!-- /.row -->
            <h5>Các thuộc tính</h5>
            <div id="variantGroup" style="background-color: #f5f5f5; padding: 20px;">
            </div>
            <form:hidden path="variants" value="" />
          </div>
          <!-- /.card-body -->
          <div class="card-footer">
            <div class="row">
              <div class="col-12 col-sm-6">
                <input type="submit" value="Lưu" class="btn btn-block btn-outline-primary btn-flat"/>
              </div>
              <div class="col-12 col-sm-6">
                <a href="<c:url value="/admin/productManagement/1"/>" class="btn btn-block btn-outline-primary btn-flat">Hủy</a>
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
  
 <%@include file="/WEB-INF/views/template/adminFooter.jsp" %>

<script type="text/javascript">
 $(function () {
	    //Initialize Select2 Elements
	    $('.select2').select2();
	  });
 </script>
 
 <script type="text/javascript">
 $(document).ready(function () {
	 var currCat = $('#productCategories').val();
	 setListBrandData(currCat);
	 generationVariantsField(currCat);
 });
 
 $('#productCategories').on('change', function () {
	 var currCat = $('#productCategories').val();
	 setListBrandData(currCat);
 });

 function setListBrandData(categoriesId)
 {
	 $('#productBrand').empty();
	 $.getJSON("/product/rest/categories/" + categoriesId + "/brand", function(data, textStatus, jqXHR){
		 $.each(data, function(k, v) {
			 if(v.productBrandId == $('#productCurrentBrand').val()) {
				 $('#productBrand').append('<option value="' + v.productBrandId + '" selected>' + v.name + '</option>');
			 }
			 else {
				 $('#productBrand').append('<option value="' + v.productBrandId + '">' + v.name + '</option>');
			 }
		 });
	 })
	 .fail(function (jqxhr,settings,ex) { console.log('failed, '+ ex); });
 }
 
 function generationVariantsField(categoriesId)
 {
	 $('#variantGroup').empty();
	 $.getJSON("/product/rest/categories/" + categoriesId + "/variant", function(data, textStatus, jqXHR){
		 $.each(data, function(k, v) {
			 $('#variantGroup').append('<div class="row">' +
					 '<div class="col-12 col-sm-6">' +
		              	 '<div class="form-group">' +
		              	 	'<label>' + v.variant + '</label>' +
		              	 '</div>' +
		            '</div>' +
		            '<div class="col-12 col-sm-6">' +
		              	 '<div class="form-group">' +
		              	 	'<input type="text" name="productVariant" key="' + v.variant + '" class="form-control" placeholder="Nhập ' + v.variant + '" value="" />' +
		              	 '</div>' +
		            '</div>' +
	            '</div>' +
	            '<hr class="my-4">');
		 });
	 })
	 .fail(function (jqxhr,settings,ex) { console.log('failed, '+ ex); });
 }
 
 function createJSONVariant() {
	    jsonObj = [];
	    item = {}
	    
	    $("input[name='productVariant']").each(function() {
	        var name = $(this).attr("key");
	        var value = $(this).val();

	        item[name] = value;
	    });
	    
	    jsonObj.push(item);
	    
	    jsonString = JSON.stringify(jsonObj);

	    return jsonString.substring(1, jsonString.length-1);
	}
	 
	function preSubmit()
	{
		$('#variants').val(createJSONVariant());
	}
 </script>

</body>
</html>