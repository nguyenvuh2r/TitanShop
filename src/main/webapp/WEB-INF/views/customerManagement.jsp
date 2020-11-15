<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/views/template/header.jsp" %>

	<div class="main"> 
	<div class="container-wrapper">
    <div class="container">
        <div class="page-header">
            <h1>Customer Management Page</h1>

            <p class="lead">This is the customer management page!</p>
        </div>

        <table class="table table-striped table-hover">
            <thead>
            <tr class="bg-success">
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Username</th>
                <th>Enabled</th>
                <th>Shipping Address & Billing Address</th>
                
            </tr>
            </thead>
            <c:forEach items="${customers}" var="customer">
                <tr>
                    <td>${customer.customerName}</td>
                    <td>${customer.customerEmailAddress}</td>
                    <td>${customer.custometPhoneNumber}</td>
                    <td>${customer.username}</td>
                    <td>${customer.enabled}</td>
                    <td><a href=" <spring:url value="/admin/customerManagement/address/${customer.customerId}"/>"><span class="glyphicon glyphicon-info-sign"></span></a></td>
                    
                </tr>
            </c:forEach>
        </table>
        </div>
        </div>
	</div>
<%@ include file="/WEB-INF/views/template/footer.jsp" %>