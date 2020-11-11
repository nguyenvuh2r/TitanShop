var cartApp = angular.module ("cartApp", []);
  
cartApp.controller("cartCtrl", function($scope, $http){

    $scope.refreshCart = function(){
        $http({
		    method: "GET",
		    url: '/rest/cart/' + $scope.cartId,
		}).then(function(result) {
		  $scope.cart = result.data;
		  console.log($scope.cart);
		 }, function(error) {
		 //Error
		 }); 
    };
 
    $scope.clearCart = function(){
        $http({
		    method: "DELETE",
		    url: '/rest/cart/' + $scope.cartId,
		}).then(function(result) {
		  $scope.refreshCart();
		 }, function(error) {
		 //Error
		 });  
    };
    
    $scope.initCartId = function(cartId){
        $scope.cartId = cartId;
        $scope.refreshCart(cartId);
    };

 	$scope.addToCart = function(productId){
	 
        $http({
		    method: "PUT",
		    url: '/rest/cart/add/' + productId,
		}).then(function(result) {
		  alert('Product successfully added to the cart!');
		 }, function(error) {
		 //Error
		 });  
    };
    
    $scope.removeFromCart = function(productId){
    	
        $http({
		    method: "PUT",
		    url: '/rest/cart/remove/' + productId,
		}).then(function(result) {
		  $scope.refreshCart();
		 }, function(error) {
		 //Error
		 });
    };

    $scope.calGrandTotal = function(){
        var grandTotal = 0;
        //alert('Product successfully added to the cart hahhahahaha!');
        for (var i = 0; i < $scope.cart.cartItems.length; i++){
            grandTotal += $scope.cart.cartItems[i].totalPrice;
        }

        return grandTotal;
    }
});