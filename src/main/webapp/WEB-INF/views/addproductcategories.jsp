
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/views/template/adminHeader.jsp" %>
<div class="container-wrapper">
    
    <div class="content-wrapper">
   
  

	<section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Add ProductCategories</h1>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>
	    
	    
	   <section class="content">
	     
		<div class="form-layout">
	       <form:form modelAttribute="productcategories"  action="${pageContext.request.contextPath}/admin/productcategories/addproductcategories?${_csrf.parameterName}=${_csrf.token}"  class="form-horizontal"  >
						
				
				<div class="row">
			         <label class="col-xs-3 control-label" ></label>
					 <div class="col-xs-9">
				       <form:errors path="name" cssStyle="color: #ff0000" />		
					 </div>
			    
			    </div>	
			  
				<div class="form-group has-success">
					<label class="col-xs-3 control-label" for="productName">Brand Name :</label>
					<div class="col-xs-9">
						<form:hidden path="productCategoriesId" class="form-control" placeholder="Enter Product Name" />
					   <form:input path="name" class="form-control" placeholder="Enter Product Name"  />
					</div>
				</div>
				<div class="form-group has-success">
					<label class="col-xs-3 control-label"></label>
					<div class="col-xs-9">
						 <input type="submit" value="Submit" class="btn btn-default">
             <a href="<c:url value="/admin/productManagement" />"  class="btn btn-default">Cancel</a>
					</div>
				</div>
			
			 
			</form:form>
		</div>
    </section>
    </div>

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