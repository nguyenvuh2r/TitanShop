<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page pageEncoding="UTF-8" %>

<%@include file="/WEB-INF/views/template/adminHeader.jsp" %>

<div class="container-wrapper">
    <div class="content-wrapper">
    
      	<div class="container">
      		  <div class="page-header">
            <p class="lead">Thông tin liên lạc của ${customer.customerName}</p>
            </div>
    
      <h3>Địa chỉ ship</h3>
        <table class="table table-striped table-hover">
            <thead>
            <tr >
                <th>Tên đường</th>
                <th>Số nhà</th>
                <th>Thành phố</th>
                <th>Tỉnh/Thành</th>
                <th>Quốc gia</th>
                <th>ZipCode</th>
                
            </tr>
            </thead>
                <tr>
                    <td>${customer.shippingAddress.strretName}</td>
                    <td>${customer.shippingAddress.apartmentNumber}</td>
                    <td>${customer.shippingAddress.city}</td>
                    <td>${customer.shippingAddress.state}</td>
                    <td>${customer.shippingAddress.country}</td>
                    <td>${customer.shippingAddress.zipCode}</td>
                </tr>
           
        </table>
        
        <h3>Địa chỉ nhà</h3>
        <table class="table table-striped table-hover">
            <thead>
            <tr >
				<th>Tên đường</th>
                <th>Số nhà</th>
                <th>Thành phố</th>
                <th>Tỉnh/Thành</th>
                <th>Quốc gia</th>
                <th>ZipCode</th>                
            </tr>
            </thead>
            
                <tr>
                    <td>${customer.billingAddress.strretName}</td>
                    <td>${customer.billingAddress.apartmentNumber}</td>
                    <td>${customer.billingAddress.city}</td>
                    <td>${customer.billingAddress.state}</td>
                    <td>${customer.billingAddress.country}</td>
                    <td>${customer.billingAddress.zipCode}</td>
                </tr>
           
        </table>      		
    </div>
</div>

<%@include file="/WEB-INF/views/template/adminFooter.jsp" %>
</body>
</html>