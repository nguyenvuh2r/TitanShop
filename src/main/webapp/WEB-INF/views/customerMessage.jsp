<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page pageEncoding="UTF-8" %>

<%@include file="/WEB-INF/views/template/adminHeader.jsp" %>

<c:url var="firstUrl" value="/admin/customerMessages/1" />
<c:url var="lastUrl" value="/admin/customerMessages/${totalPages}" />
<c:url var="prevUrl" value="/admin/customerMessages/${currentPageNumber - 1}" />
<c:url var="nextUrl" value="/admin/customerMessages/${currentPageNumber + 1}" />

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Tin nhắn</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Tin nhắn</li>
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
          <div class="card card-primary card-outline">
            <div class="card-header">
              <h3 class="card-title">Tin nhắn</h3>
            </div>
            <!-- /.card-header -->
            <div class="card-body p-0">
              <div class="table-responsive mailbox-messages">
                <table class="table table-hover table-striped">
                  <tbody>
                  <c:forEach var="contact" items="${customerContacts}">
                  	<tr>
                  	<td class="mailbox-name"><a href="#">${contact.customer.customerName}</a></td>
                  	<td class="mailbox-subject">${contact.contactInfo}
                    </td>
                    <td class="mailbox-date">${contact.date}</td>
                    <td class="mailbox-attachment">
                    	<form   action="<c:url value="/admin/customerMessages/deleteMessage" />"  method="post"  class="form-horizontal"  >
						<input type="hidden" name="customerMessageId" value="${contact.contactId}">
						<input type="hidden" name="currentPageNumber" value="${currentPageNumber}">
						 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					   	<button type="submit" class="btn btn-danger btn-xs"><i class="fas fa-trash-alt"></i></button>
					   </form>
                    </td>
                  	</tr>
                  </c:forEach>
                  </tbody>
                </table>
                <!-- /.table -->
              </div>
              <!-- /.mail-box-messages -->
            </div>
            <!-- /.card-body -->
            <div class="card-footer p-0">
              <div class="mailbox-controls">
                <div class="float-right">
                  <div class="btn-group">
                  <c:choose>
		            <c:when test="${currentPageNumber == 1}">
		                <a href="#" class="btn btn-default btn-sm disabled"><i class="fas fa-chevron-left"></i></a>
		            </c:when>
		            <c:otherwise>
		            	<a href="${prevUrl}" class="btn btn-default btn-sm"><i class="fas fa-chevron-left"></i></a>
		            </c:otherwise>
		          </c:choose>
		          <c:choose>
		            <c:when test="${currentPageNumber == totalPages}">
		                <a href="#" class="btn btn-default btn-sm disabled"><i class="fas fa-chevron-right"></i></a>
		            </c:when>
		            <c:otherwise>
		            	<a href="${nextUrl}" class="btn btn-default btn-sm"><i class="fas fa-chevron-right"></i></a>
		            </c:otherwise>
		          </c:choose>
                  </div>
                  <!-- /.btn-group -->
                </div>
                <!-- /.float-right -->
              </div>
            </div>
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

</body>
</html>
